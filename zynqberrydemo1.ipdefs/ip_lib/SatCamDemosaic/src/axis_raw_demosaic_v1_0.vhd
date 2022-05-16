----------------------------------------------------------------------------------
-- Description: Demosaic of RAW image to create RGB image.
-- Author: Stephan @ AAU
-- Based on design by Oleksandr Kiyenko @ Trenz Electronics.
----------------------------------------------------------------------------------
library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
--use ieee.std_logic_unsigned.all;
library UNISIM;
use UNISIM.VComponents.all;
----------------------------------------------------------------------------------
entity axis_raw_demosaic_v1_0 is
    generic (
        C_MODE					: integer range 0 to 1	:= 1;
        C_COLOR_POS				: integer range 0 to 2	:= 2;
        C_IN_TYPE				: integer range 1 to 4	:= 1;
        C_RAW_WIDTH				: integer	:= 10;
        RAM_ADDR_BYTE_SIZE      : integer   := 11
    );
    port (
        axis_aclk				: in  STD_LOGIC;
        axis_aresetn			: in  STD_LOGIC;

        colors_mode				: in  STD_LOGIC;

        s_axis_tready			: out STD_LOGIC;
        s_axis_tdata			: in  STD_LOGIC_VECTOR(C_IN_TYPE*16-1 downto 0);
        s_axis_tuser			: in  STD_LOGIC;
        s_axis_tlast			: in  STD_LOGIC;
        s_axis_tvalid			: in  STD_LOGIC;

        m_axis_tvalid			: out STD_LOGIC;
        m_axis_tdata			: out STD_LOGIC_VECTOR(C_IN_TYPE*32-1 downto 0);
        m_axis_tuser			: out STD_LOGIC;
        m_axis_tlast			: out STD_LOGIC;
        m_axis_tready			: in  STD_LOGIC
    );
end axis_raw_demosaic_v1_0;
----------------------------------------------------------------------------------
architecture arch_imp of axis_raw_demosaic_v1_0 is
    ----------------------------------------------------------------------------------
    component dualport_ram is
        port (
            clk						: in  STD_LOGIC;
            wea						: in  STD_LOGIC;
            addra					: in  STD_LOGIC_VECTOR(10 downto 0);
            addrb					: in  STD_LOGIC_VECTOR(10 downto 0);
            addrc					: in  STD_LOGIC_VECTOR(10 downto 0);
            dia						: in  STD_LOGIC_VECTOR(9 downto 0);
            dob						: out STD_LOGIC_VECTOR(9 downto 0);
            doc						: out STD_LOGIC_VECTOR(9 downto 0)
        );
    end component;

    component gamma_rom is
        port(
            addra					: in  STD_LOGIC_VECTOR(9 downto 0);
            clka					: in  STD_LOGIC;
            douta					: out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
    
    component color_correction is
        port (
           M_select : in STD_LOGIC;
           R_out : out STD_LOGIC_VECTOR (9 downto 0);
           G_out : out STD_LOGIC_VECTOR (9 downto 0);
           B_out : out STD_LOGIC_VECTOR (9 downto 0);
           R_in : in STD_LOGIC_VECTOR (9 downto 0);
           G_in : in STD_LOGIC_VECTOR (9 downto 0);
           B_in : in STD_LOGIC_VECTOR (9 downto 0)
       );
    end component;     
    ----------------------------------------------------------------------------------
    signal tx_alpha				: STD_LOGIC_VECTOR(7 downto 0);
    signal tx_blue				: STD_LOGIC_VECTOR(7 downto 0);
    signal tx_green				: STD_LOGIC_VECTOR(7 downto 0);
    signal tx_red				: STD_LOGIC_VECTOR(7 downto 0);
    signal x_cnt				: UNSIGNED(15 downto 0);
    signal y_cnt				: UNSIGNED(15 downto 0);

    signal y_mod                : integer := 0;

    type sm_state_type is (ST_IDLE, ST_PROCESS, ST_SEND);
    signal sm_state				: sm_state_type := ST_IDLE;
    signal up_pixel_data		: STD_LOGIC_VECTOR(C_RAW_WIDTH-1 downto 0);
    signal pixel_data			: STD_LOGIC_VECTOR(C_RAW_WIDTH-1 downto 0);
    signal position				: STD_LOGIC_VECTOR(1 downto 0);
    signal tx_valid				: STD_LOGIC;
    signal tx_user				: STD_LOGIC;
    signal tx_last				: STD_LOGIC;
    signal x_wr_addr			: UNSIGNED(15 downto 0);

    signal x_rd0_addr0			: UNSIGNED(15 downto 0);
    signal x_rd0_addr1			: UNSIGNED(15 downto 0);
    signal x_rd0_addr2			: UNSIGNED(15 downto 0);
    signal x_rd0_addr3			: UNSIGNED(15 downto 0);

    signal x_rd1_addr0			: UNSIGNED(15 downto 0);
    signal x_rd1_addr1			: UNSIGNED(15 downto 0);
    signal x_rd1_addr2			: UNSIGNED(15 downto 0);
    signal x_rd1_addr3			: UNSIGNED(15 downto 0);

    signal ram_write			: STD_LOGIC_VECTOR(3 downto 0);

    type ram_addr_inst is array (3 downto 0) of STD_LOGIC_VECTOR(10 downto 0);

    signal ram_wr_addr			: ram_addr_inst ;
    signal ram_rd0_addr			: ram_addr_inst ;
    signal ram_rd1_addr			: ram_addr_inst ;

    type ram_data_inst is array (3 downto 0) of STD_LOGIC_VECTOR(9 downto 0);

    signal ram_wr_data			: ram_data_inst ;
    signal ram_rd0_data			: ram_data_inst ;
    signal ram_rd1_data			: ram_data_inst ;

    type raw_pixel is array (3 downto 0) of STD_LOGIC_VECTOR(C_RAW_WIDTH-1 downto 0);
    signal pixel				: raw_pixel;
    signal rgb_corr             : raw_pixel;
    signal rom_in               : raw_pixel;
    
    type std_pixel is array (3 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
    signal pixel_gamma			: std_pixel;
    signal colors_mode_i		: STD_LOGIC;
    
    signal green_pixel0         : unsigned(15 downto 0);
    signal green_pixel1         : unsigned(15 downto 0);

    ----------------------------------------------------------------------------------
begin
    ----------------------------------------------------------------------------------
    ram_wr_addr(0)		<= STD_LOGIC_VECTOR(x_wr_addr(10 downto 0));
    ram_rd0_addr(0)		<= STD_LOGIC_VECTOR(x_rd0_addr0(10 downto 0));
    ram_rd1_addr(0)		<= STD_LOGIC_VECTOR(x_rd1_addr0(10 downto 0));

    ram_wr_addr(1)		<= STD_LOGIC_VECTOR(x_wr_addr(10 downto 0));
    ram_rd0_addr(1)		<= STD_LOGIC_VECTOR(x_rd0_addr1(10 downto 0));
    ram_rd1_addr(1)		<= STD_LOGIC_VECTOR(x_rd1_addr1(10 downto 0));

    ram_wr_addr(2)		<= STD_LOGIC_VECTOR(x_wr_addr(10 downto 0));
    ram_rd0_addr(2)		<= STD_LOGIC_VECTOR(x_rd0_addr2(10 downto 0));
    ram_rd1_addr(2)		<= STD_LOGIC_VECTOR(x_rd1_addr2(10 downto 0));

    ram_wr_addr(3)		<= STD_LOGIC_VECTOR(x_wr_addr(10 downto 0));
    ram_rd0_addr(3)		<= STD_LOGIC_VECTOR(x_rd0_addr3(10 downto 0));
    ram_rd1_addr(3)		<= STD_LOGIC_VECTOR(x_rd1_addr3(10 downto 0));

    -- Connect all ram write to input data. Active ram is decided with write enable. 
    ram_wr_data(0)		<= pixel_data;
    ram_wr_data(1)		<= pixel_data;
    ram_wr_data(2)		<= pixel_data;
    ram_wr_data(3)		<= pixel_data;

    up_pixel_data	    <= ram_rd0_data(0);
    pixel_data		    <= s_axis_tdata(C_RAW_WIDTH-1 downto 0);
    ----------------------------------------------------------------------------------
    ram_gen: for i in 0 to 3 generate
    begin
        ram_inst: dualport_ram
            port map(
                clk			=> axis_aclk,
                wea			=> ram_write(i),
                addra		=> ram_wr_addr(i),
                addrb		=> ram_rd0_addr(i),
                addrc		=> ram_rd1_addr(i),
                dia			=> ram_wr_data(i),
                dob			=> ram_rd0_data(i),
                doc			=> ram_rd1_data(i)
            );
    end generate;
    ----------------------------------------------------------------------------------
    process(axis_aclk)
    begin
        if(axis_aclk = '1' and axis_aclk'event)then
            case sm_state is
                -- When in IDLE state.
                when ST_IDLE =>
                    -- If the data on AXI Stream input (slave ifc) is valid.
                    if (s_axis_tvalid = '1') then
                        sm_state		    <= ST_PROCESS;    -- Next state.

                        -- AXI Stream logic.
                        tx_user			    <= s_axis_tuser;
                        tx_last			    <= s_axis_tlast;

                        -- Write logic.
                        x_wr_addr		    <= x_cnt;
                        ram_write(y_mod)	<= '1';
                        --ram_write	<= "0001" sll y_mod ;

                        -- Bayer position logic.
                        position		    <= y_cnt(0) & x_cnt(0);

                        -- X counter logic
                        if (s_axis_tlast = '1') then            -- If last pixel of frame
                            x_cnt		<= (others => '0');           -- Reset x counter.
                            --x_rd_addr	<= (others => '0');
                        else                                    -- Else
                            x_cnt		<= x_cnt + 1;                -- Increase x counter.
                            --x_rd_addr	<= x_cnt + 1;
                        end if;

                        -- Y counter logic.
                        if (s_axis_tuser = '1') then            -- If last pixel of frame
                            y_cnt		<= (others => '0');          -- Reset y counter.
                            y_mod       <= 0;

                        elsif (s_axis_tlast = '1') then         -- If last pixel in the line.
                            y_cnt		<= y_cnt + 1;                -- Set y counter to next line.
                            y_mod       <= to_integer(y_cnt + 1) mod 4;  -- And update ram decision.
                        end if;

                        -- Read out logic. Muxing the ram reads to pixel signal.
                        -- Update ram read adresses according to x pixel location
                        if (x_cnt(0) = '0') then
                            x_rd0_addr3 <= x_cnt;
                            x_rd1_addr3 <= x_cnt + 1;
                            x_rd0_addr2 <= x_cnt;
                            x_rd1_addr2 <= x_cnt + 1;

                            x_rd0_addr1 <= x_cnt;
                            x_rd1_addr1 <= x_cnt + 1;
                            x_rd0_addr0 <= x_cnt;
                            x_rd1_addr0 <= x_cnt + 1;
                        else
                            x_rd0_addr3 <= x_cnt - 1;
                            x_rd1_addr3 <= x_cnt;
                            x_rd0_addr2 <= x_cnt - 1;
                            x_rd1_addr2 <= x_cnt;

                            x_rd0_addr1 <= x_cnt - 1;
                            x_rd1_addr1 <= x_cnt;
                            x_rd0_addr0 <= x_cnt - 1;
                            x_rd1_addr0 <= x_cnt;
                        end if;

                        -- Update decision of ram readout, based on y location
                        if (y_mod <= 1) then
                            --pixel(0) <= ram_rd0_data(3);
                            rgb_corr(0) <= ram_rd0_data(3);
                            
                            --pixel(1) <= std_logic_vector(green_pixel0(C_RAW_WIDTH-1 downto 0));
                            rgb_corr(1) <= std_logic_vector(green_pixel0(C_RAW_WIDTH-1 downto 0));
                            
                            pixel(2) <= ram_rd0_data(2);
                            
                            --pixel(3) <= ram_rd1_data(2);
                            rgb_corr(3) <= ram_rd1_data(2);
                        elsif (y_mod >= 2) then
                            --pixel(0) <= ram_rd0_data(1);
                            rgb_corr(0) <= ram_rd0_data(1);
                            
                            --pixel(1) <= std_logic_vector(green_pixel1(C_RAW_WIDTH-1 downto 0));
                            rgb_corr(1) <= std_logic_vector(green_pixel1(C_RAW_WIDTH-1 downto 0));

                            pixel(2) <= ram_rd0_data(0);
                            
                            --pixel(3) <= ram_rd1_data(0);
                            rgb_corr(3) <= ram_rd1_data(0);
                        end if;

                    -- If the data on AXI Stream input (slave ifc) is invalid.
                    else
                        ram_write		<= "0000";

                    end if;
                -- When in IDLE state.
                when ST_PROCESS =>
                    -- Disable ram write.
                    ram_write		<= "0000";

                    -- Change state to SEND.
                    sm_state			<= ST_SEND;
                -- When in SEND state.
                when ST_SEND =>
                    -- If VDMA is ready to receive data.
                    if (m_axis_tready = '1') then
                        -- If data received (input) is invalid
                        if (s_axis_tvalid = '0') then
                            -- Change to IDLE state and disable ram write.
                            sm_state		    <= ST_IDLE;
                            ram_write		    <= "0000";

                        -- Else if data received is valid.
                        else
                            -- Set next state to process.
                            sm_state		<= ST_PROCESS;

                            -- AXI Stream logic.
                            tx_user			    <= s_axis_tuser;
                            tx_last			    <= s_axis_tlast;

                            -- Write logic
                            x_wr_addr		    <= x_cnt;
                            ram_write(y_mod)	<= '1';

                            -- Bayer position logic.
                            position		    <= y_cnt(0) & x_cnt(0);

                            -- X counter logic
                            if (s_axis_tlast = '1') then
                                x_cnt		<= (others => '0');
                            else
                                x_cnt		<= x_cnt + 1;
                            end if;

                            -- Y counter logic.
                            if (s_axis_tuser = '1') then
                                y_cnt		<= (others => '0');
                                y_mod       <= 0;
                            elsif (s_axis_tlast = '1') then
                                y_cnt		<= y_cnt + 1;
                                y_mod       <= to_integer(y_cnt + 1) mod 4;
                            end if;

                            -- Read out logic. Muxing the ram reads to pixel signal.
                            -- Update ram read adresses according to x pixel location
                            if (x_cnt(0) = '0') then
                                x_rd0_addr3 <= x_cnt;
                                x_rd1_addr3 <= x_cnt + 1;
                                x_rd0_addr2 <= x_cnt;
                                x_rd1_addr2 <= x_cnt + 1;

                                x_rd0_addr1 <= x_cnt;
                                x_rd1_addr1 <= x_cnt + 1;
                                x_rd0_addr0 <= x_cnt;
                                x_rd1_addr0 <= x_cnt + 1;
                            else
                                x_rd0_addr3 <= x_cnt - 1;
                                x_rd1_addr3 <= x_cnt;
                                x_rd0_addr2 <= x_cnt - 1;
                                x_rd1_addr2 <= x_cnt;

                                x_rd0_addr1 <= x_cnt - 1;
                                x_rd1_addr1 <= x_cnt;
                                x_rd0_addr0 <= x_cnt - 1;
                                x_rd1_addr0 <= x_cnt;
                            end if;

                            -- Update decision of ram readout, based on y location
                            if (y_mod <= 1) then
                                --pixel(0) <= ram_rd0_data(3);
                                rgb_corr(0) <= ram_rd0_data(3);
                                
                                --pixel(1) <= std_logic_vector(green_pixel0(C_RAW_WIDTH-1 downto 0));
                                rgb_corr(1) <= std_logic_vector(green_pixel0(C_RAW_WIDTH-1 downto 0));
                                
                                pixel(2) <= ram_rd0_data(2);
                                
                                --pixel(3) <= ram_rd1_data(2);
                                rgb_corr(3) <= ram_rd1_data(2);
                            elsif (y_mod >= 2) then
                                --pixel(0) <= ram_rd0_data(1);
                                rgb_corr(0) <= ram_rd0_data(1);
                                
                                --pixel(1) <= std_logic_vector(green_pixel1(C_RAW_WIDTH-1 downto 0));
                                rgb_corr(1) <= std_logic_vector(green_pixel1(C_RAW_WIDTH-1 downto 0));
    
                                pixel(2) <= ram_rd0_data(0);
                                
                                --pixel(3) <= ram_rd1_data(0);
                                rgb_corr(3) <= ram_rd1_data(0);
                            end if;
                        end if;
                    end if;
            end case;
        end if;
    end process;
    ----------------------------------------------------------------------------------
    gamma_rom_gen: for i in 0 to 3 generate
    begin
        pa_gamma_inst: gamma_rom
            port map(
                addra		=> rom_in(i),
                --addra		=> rgb_corr(i),
                clka		=> axis_aclk,
                douta		=> pixel_gamma(i)
            );
    end generate;
    ----------------------------------------------------------------------------------
    process(axis_aclk)
    begin
        if(axis_aclk = '1' and axis_aclk'event)then
            if(C_COLOR_POS = 0)then
                colors_mode_i	<= '0';
            elsif(C_COLOR_POS = 1)then
                colors_mode_i	<= '1';
            else	-- C_COLOR_POS = 2
                colors_mode_i	<= colors_mode;
            end if;
        end if;
    end process;
    ----------------------------------------------------------------------------------
    tx_alpha			<= (others => '0');
    -- Demosaic (Color)
    demosaic_gen: if C_MODE = 1 generate
    begin

        process(sm_state, m_axis_tready)
        begin
            case sm_state is
                when ST_IDLE 	=> s_axis_tready	<= '1';
                when ST_PROCESS => s_axis_tready	<= '0';
                when ST_SEND 	=> s_axis_tready	<= m_axis_tready;
            end case;
        end process;

        m_axis_tvalid		<= '1' when (sm_state = ST_SEND) else '0';
        m_axis_tuser		<= tx_user;
        m_axis_tlast		<= tx_last;

        process(position, tx_alpha, pixel_gamma, colors_mode_i)
        begin
            if(colors_mode_i = '0')then
                case position is
                    --when "01" => m_axis_tdata	<= tx_alpha & x"88" & x"88" & x"88";
                    --when "00" => m_axis_tdata	<= tx_alpha & x"88" & x"88" & x"88";
                    --when "11" => m_axis_tdata	<= tx_alpha & x"88" & x"88" & x"88";
                    --when "10" => m_axis_tdata	<= tx_alpha & x"88" & x"88" & x"88";
                    when "01" => m_axis_tdata	<= tx_alpha & pixel_gamma(3) & pixel_gamma(1) & pixel_gamma(0);
                    when "00" => m_axis_tdata	<= tx_alpha & pixel_gamma(3) & pixel_gamma(1) & pixel_gamma(0);
                    when "11" => m_axis_tdata	<= tx_alpha & pixel_gamma(3) & pixel_gamma(1) & pixel_gamma(0);
                    when "10" => m_axis_tdata	<= tx_alpha & pixel_gamma(3) & pixel_gamma(1) & pixel_gamma(0);
                    when others => null;
                end case;
            else
                case position is
                    when "01" => m_axis_tdata	<= tx_alpha & pixel_gamma(3) & pixel_gamma(1) & pixel_gamma(0);
                    when "00" => m_axis_tdata	<= tx_alpha & pixel_gamma(3) & pixel_gamma(1) & pixel_gamma(0);
                    when "11" => m_axis_tdata	<= tx_alpha & pixel_gamma(3) & pixel_gamma(1) & pixel_gamma(0);
                    when "10" => m_axis_tdata	<= tx_alpha & pixel_gamma(3) & pixel_gamma(1) & pixel_gamma(0);
                    --when "01" => m_axis_tdata	<= tx_alpha & pixel(3)(7 downto 0) & pixel(1)(7 downto 0) & pixel(0)(7 downto 0);
                    --when "00" => m_axis_tdata	<= tx_alpha & pixel(3)(7 downto 0) & pixel(1)(7 downto 0) & pixel(0)(7 downto 0);
                    --when "11" => m_axis_tdata	<= tx_alpha & pixel(3)(7 downto 0) & pixel(1)(7 downto 0) & pixel(0)(7 downto 0);
                    --when "10" => m_axis_tdata	<= tx_alpha & pixel(3)(7 downto 0) & pixel(1)(7 downto 0) & pixel(0)(7 downto 0);
                    when others => null;
                end case;
            end if;
        end process;

    end generate;
    ----------------------------------------------------------------------------------
    -- Bypass (Raw grayscale)
    bypass_gen: if C_MODE = 0 generate
    begin
        s_axis_tready		<= m_axis_tready;
        m_axis_tvalid		<= s_axis_tvalid;
        m_axis_tuser		<= s_axis_tuser;
        m_axis_tlast		<= s_axis_tlast;
        data_gen: for i in 0 to C_IN_TYPE-1 generate
        begin
            m_axis_tdata(i*32+31 downto i*32)	<= x"00" &
            s_axis_tdata(i*16+9 downto i*16+2)           &
            s_axis_tdata(i*16+9 downto i*16+2)           &
            s_axis_tdata(i*16+9 downto i*16+2);
        end generate;
    end generate;
    ----------------------------------------------------------------------------------
    -- Color correction block
    color_correction_block: color_correction 
            port map(
                M_select => colors_mode_i,
                R_in => rgb_corr(0),
                G_in => rgb_corr(1),
                B_in => rgb_corr(3),
                R_out => pixel(0),
                G_out => pixel(1),
                B_out => pixel(3)
            );
    ----------------------------------------------------------------------------------
    --- Green pixel for superpixel combinatoric logic
    green_pixel0 <= (resize(unsigned(ram_rd1_data(3)), green_pixel0'length) + resize(unsigned(ram_rd0_data(2)), green_pixel0'length) )/2;
    green_pixel1 <= (resize(unsigned(ram_rd1_data(1)), green_pixel1'length) + resize(unsigned(ram_rd0_data(0)), green_pixel1'length) )/2;
    ----------------------------------------------------------------------------------
    rom_in(0) <= pixel(0);
    rom_in(1) <= pixel(1);
    rom_in(2) <= pixel(2);
    rom_in(3) <= pixel(3);
end arch_imp;
