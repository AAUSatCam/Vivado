
?
Command: %s
1870*	planAhead2?
?read_checkpoint -incremental C:/School/Vivado/ZynqDemoRemake/vivado/zynqberrydemo1.srcs/utils_1/imports/synth_1/zsys_wrapper.dcp2default:defaultZ12-2866h px? 
?
?Incremental flow is being run with directive '%s'. This will override place_design, post-place phys_opt_design and route_design directives being called in high reuse mode.
4054*	planAhead2$
RuntimeOptimized2default:defaultZ12-9151h px? 
j

Starting %s Task
103*constraints2/
Incremental read checkpoint2default:defaultZ18-103h px? 
?

Phase %s%s
101*constraints2
1 2default:default28
$Process Reference Checkpoint Netlist2default:defaultZ18-101h px? 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
8082default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
?
 1-471*	planAhead2w
cC:/School/Vivado/ZynqDemoRemake/vivado/zynqberrydemo1.srcs/utils_1/imports/synth_1/zsys_wrapper.dcp2default:defaulth px? 
o

Phase %s%s
101*constraints2
2 2default:default2"
Initialization2default:defaultZ18-101h px? 
?
nNo reusable place or route information found in incremental checkpoint '%s'. Incremental flow will be skipped.283*project2w
cC:/School/Vivado/ZynqDemoRemake/vivado/zynqberrydemo1.srcs/utils_1/imports/synth_1/zsys_wrapper.dcp2default:defaultZ1-471h px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:05 ; elapsed = 00:00:04 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
o

Phase %s%s
101*constraints2
3 2default:default2"
Build Reuse DB2default:defaultZ18-101h px? 
?
EMultithreading enabled for phys_opt_design using a maximum of %s CPUs380*physynth2
22default:defaultZ32-721h px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:09 ; elapsed = 00:00:07 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
j

Phase %s%s
101*constraints2
4 2default:default2
	Reporting2default:defaultZ18-101h px? 
?
?Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
------------------------------------------------------------------------------------
| Tool Version : Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
| Date         : Mon May 16 15:40:08 2022
| Host         : DESKTOP-LNVH2M6 running 64-bit major release  (build 9200)
| Design       : zsys_wrapper
| Device       : xc7z010
| Design State : Optimized
------------------------------------------------------------------------------------

Incremental Implementation Information

Table of Contents
-----------------
1. Incremental Flow Summary
2. Reference Checkpoint Information
3. Optimization Comparison With Reference Run
3.1 iphys_opt_replay Optimizations
3.2 QoR Suggestion Optimizations

1. Incremental Flow Summary
---------------------------

+-----------------------------------+------------------+
|          Flow Information         |       Value      |
+-----------------------------------+------------------+
| Synthesis Flow                    |      Incremental |
|   Resynthesis %                   |            16.06 |
|   Black boxed / Out of context %  |             0.00 |
| Auto Incremental                  |               No |
| Incremental Directive             | RuntimeOptimized |
| Reuse mode                        |              Low |
| Target WNS                        |              N/A |
| QoR Suggestions                   |                0 |
+-----------------------------------+------------------+


2. Reference Checkpoint Information
-----------------------------------

+----------------+-----------------------------------------------------------------------------------------------------+
| DCP Location:  | C:/School/Vivado/ZynqDemoRemake/vivado/zynqberrydemo1.srcs/utils_1/imports/synth_1/zsys_wrapper.dcp |
+----------------+-----------------------------------------------------------------------------------------------------+


+--------------------------------+----------------------------+
|         DCP Information        |            Value           |
+--------------------------------+----------------------------+
| Vivado Version                 |                     2021.2 |
| DCP State                      |                    Unknown |
| Recorded WNS                   |                        N/A |
| Recorded WHS                   |                        N/A |
| Incremental Speed File Version | PRODUCTION 1.12 2019-11-22 |
+--------------------------------+----------------------------+
* Recorded WNS/WHS timing numbers are estimated timing numbers. They may vary slightly from sign-off timing numbers.


3. Optimization Comparison With Reference Run
---------------------------------------------

3.1 iphys_opt_replay Optimizations
----------------------------------

+-------------------------+--------+------------+
| iphys_opt_design replay | Reused | Not Reused |
+-------------------------+--------+------------+


3.2 QoR Suggestion Optimizations
--------------------------------

+-----------------+-------+
| QoR Suggestions | Value |
+-----------------+-------+


*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:12 ; elapsed = 00:00:10 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:13 ; elapsed = 00:00:10 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
read_checkpoint: 2default:default2
00:00:132default:default2
00:00:102default:default2
2254.5942default:default2
0.0002default:defaultZ17-268h px? 
?
?Only netlist similarity summary will be reported since 'read_checkpoint -incremental' read in a checkpoint with no place or route information.103*	vivadotclZ4-245h px? 
Q
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z0102default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z0102default:defaultZ17-349h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?zsys_i/video_out/axi_vdma_0/U0/GEN_SPRT_FOR_MM2S.MM2S_LINEBUFFER_I/GEN_LINEBUF_NO_SOF.GEN_LINEBUFFER.GEN_SYNC_FIFO.I_LINEBUFFER_FIFO/xpm_fifo_sync_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	?zsys_i/video_out/axi_vdma_0/U0/GEN_SPRT_FOR_MM2S.MM2S_LINEBUFFER_I/GEN_LINEBUF_NO_SOF.GEN_LINEBUFFER.GEN_SYNC_FIFO.I_LINEBUFFER_FIFO/xpm_fifo_sync_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
?zsys_i/video_out/axi_vdma_0/U0/GEN_SPRT_FOR_MM2S.MM2S_LINEBUFFER_I/GEN_LINEBUF_NO_SOF.GEN_LINEBUFFER.GEN_SYNC_FIFO.I_LINEBUFFER_FIFO/xpm_fifo_sync_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ENARDEN?zsys_i/video_out/axi_vdma_0/U0/GEN_SPRT_FOR_MM2S.MM2S_LINEBUFFER_I/GEN_LINEBUF_NO_SOF.GEN_LINEBUFFER.GEN_SYNC_FIFO.I_LINEBUFFER_FIFO/xpm_fifo_sync_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ENARDEN2default:default2default:default2?
 "?
?zsys_i/video_out/axi_vdma_0/U0/GEN_SPRT_FOR_MM2S.MM2S_LINEBUFFER_I/GEN_LINEBUF_NO_SOF.GEN_LINEBUFFER.GEN_SYNC_FIFO.I_LINEBUFFER_FIFO/xpm_fifo_sync_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/wea[0]?zsys_i/video_out/axi_vdma_0/U0/GEN_SPRT_FOR_MM2S.MM2S_LINEBUFFER_I/GEN_LINEBUF_NO_SOF.GEN_LINEBUFFER.GEN_SYNC_FIFO.I_LINEBUFFER_FIFO/xpm_fifo_sync_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/wea2default:default2default:default2?
 "?
?zsys_i/video_out/axi_mem_intercon/s00_couplers/auto_pc/inst/gen_axi4_axi3.axi3_conv_inst/USE_READ.USE_SPLIT_R.read_addr_inst/USE_R_CHANNEL.cmd_queue/inst/fifo_gen_inst/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.gr1_int.rfwft/empty_fwft_i_reg	?zsys_i/video_out/axi_mem_intercon/s00_couplers/auto_pc/inst/gen_axi4_axi3.axi3_conv_inst/USE_READ.USE_SPLIT_R.read_addr_inst/USE_R_CHANNEL.cmd_queue/inst/fifo_gen_inst/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.gr1_int.rfwft/empty_fwft_i_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
b
DRC finished with %s
79*	vivadotcl2(
0 Errors, 1 Warnings2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px? 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
22default:defaultZ30-611h px? 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px? 
?

Phase %s%s
101*constraints2
1.1 2default:default29
%Placer Initialization Netlist Sorting2default:defaultZ18-101h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0092default:default2
2254.5942default:default2
0.0002default:defaultZ17-268h px? 
[
FPhase 1.1 Placer Initialization Netlist Sorting | Checksum: 190bbd59d
*commonh px? 
?

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.026 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0102default:default2
2254.5942default:default2
0.0002default:defaultZ17-268h px? 
?

Phase %s%s
101*constraints2
1.2 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px? 
g
RPhase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: ef1fe608
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:03 ; elapsed = 00:00:02 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
}

Phase %s%s
101*constraints2
1.3 2default:default2.
Build Placer Netlist Model2default:defaultZ18-101h px? 
O
:Phase 1.3 Build Placer Netlist Model | Checksum: d5129981
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:08 ; elapsed = 00:00:06 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
z

Phase %s%s
101*constraints2
1.4 2default:default2+
Constrain Clocks/Macros2default:defaultZ18-101h px? 
L
7Phase 1.4 Constrain Clocks/Macros | Checksum: d5129981
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:08 ; elapsed = 00:00:06 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
H
3Phase 1 Placer Initialization | Checksum: d5129981
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:08 ; elapsed = 00:00:06 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
q

Phase %s%s
101*constraints2
2 2default:default2$
Global Placement2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
2.1 2default:default2!
Floorplanning2default:defaultZ18-101h px? 
C
.Phase 2.1 Floorplanning | Checksum: 15ffb7e07
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:10 ; elapsed = 00:00:07 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
?

Phase %s%s
101*constraints2
2.2 2default:default25
!Update Timing before SLR Path Opt2default:defaultZ18-101h px? 
W
BPhase 2.2 Update Timing before SLR Path Opt | Checksum: 187ed44bb
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:11 ; elapsed = 00:00:07 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
?

Phase %s%s
101*constraints2
2.3 2default:default24
 Post-Processing in Floorplanning2default:defaultZ18-101h px? 
V
APhase 2.3 Post-Processing in Floorplanning | Checksum: 1914896d3
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:12 ; elapsed = 00:00:08 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
x

Phase %s%s
101*constraints2
2.4 2default:default2)
Global Placement Core2default:defaultZ18-101h px? 
?

Phase %s%s
101*constraints2
2.4.1 2default:default20
Physical Synthesis In Placer2default:defaultZ18-101h px? 
?
FFound %s LUTNM shape to break, %s LUT instances to create LUTNM shape
553*physynth2
122default:default2
4212default:defaultZ32-1035h px? 
?
YBreak lutnm for timing: one critical %s, two critical %s, total %s, new lutff created %s
561*physynth2
112default:default2
12default:default2
122default:default2
02default:defaultZ32-1044h px? 
?
^End %s Pass. Optimized %s %s. Breaked %s %s, combined %s existing %s and moved %s existing %s
576*physynth2
12default:default2
1812default:default2 
nets or LUTs2default:default2
122default:default2
LUTs2default:default2
1692default:default2
LUTs2default:default2
02default:default2
LUT2default:defaultZ32-1138h px? 
K
)No high fanout nets found in the design.
65*physynthZ32-65h px? 
?
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
j
FNo candidate cells for DSP register optimization found in the design.
274*physynthZ32-456h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
22default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
i
DNo candidate cells found for Shift Register to Pipeline optimization564*physynthZ32-1123h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
h
DNo candidate cells for SRL register optimization found in the design349*physynthZ32-677h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
i
ENo candidate cells for BRAM register optimization found in the design297*physynthZ32-526h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
j
FNo candidate cells for URAM register optimization found in the design
437*physynthZ32-846h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
22default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
o
KNo candidate nets found for dynamic/static region interface net replication521*physynthZ32-949h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0072default:default2
2254.5942default:default2
0.0002default:defaultZ17-268h px? 
B
-
Summary of Physical Synthesis Optimizations
*commonh px? 
B
-============================================
*commonh px? 


*commonh px? 


*commonh px? 
?
?-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px? 
?
?|  Optimization                                     |  Added Cells  |  Removed Cells  |  Optimized Cells/Nets  |  Dont Touch  |  Iterations  |  Elapsed   |
-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px? 
?
?|  LUT Combining                                    |           12  |            169  |                   181  |           0  |           1  |  00:00:00  |
|  Retime                                           |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Very High Fanout                                 |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  DSP Register                                     |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Shift Register to Pipeline                       |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Shift Register                                   |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  BRAM Register                                    |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  URAM Register                                    |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Dynamic/Static Region Interface Net Replication  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Total                                            |           12  |            169  |                   181  |           0  |           9  |  00:00:00  |
-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px? 


*commonh px? 


*commonh px? 
T
?Phase 2.4.1 Physical Synthesis In Placer | Checksum: 268ad3db5
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:31 ; elapsed = 00:00:18 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
K
6Phase 2.4 Global Placement Core | Checksum: 1ddc93ee2
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:32 ; elapsed = 00:00:19 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
D
/Phase 2 Global Placement | Checksum: 1ddc93ee2
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:32 ; elapsed = 00:00:19 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
q

Phase %s%s
101*constraints2
3 2default:default2$
Detail Placement2default:defaultZ18-101h px? 
}

Phase %s%s
101*constraints2
3.1 2default:default2.
Commit Multi Column Macros2default:defaultZ18-101h px? 
P
;Phase 3.1 Commit Multi Column Macros | Checksum: 1d051c730
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:34 ; elapsed = 00:00:20 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 


Phase %s%s
101*constraints2
3.2 2default:default20
Commit Most Macros & LUTRAMs2default:defaultZ18-101h px? 
R
=Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 25a6df46f
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:36 ; elapsed = 00:00:21 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
y

Phase %s%s
101*constraints2
3.3 2default:default2*
Area Swap Optimization2default:defaultZ18-101h px? 
L
7Phase 3.3 Area Swap Optimization | Checksum: 1fb656561
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:36 ; elapsed = 00:00:21 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
?

Phase %s%s
101*constraints2
3.4 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px? 
T
?Phase 3.4 Pipeline Register Optimization | Checksum: 198f1e3b0
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:36 ; elapsed = 00:00:21 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
t

Phase %s%s
101*constraints2
3.5 2default:default2%
Fast Optimization2default:defaultZ18-101h px? 
G
2Phase 3.5 Fast Optimization | Checksum: 18dbc9e71
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:39 ; elapsed = 00:00:23 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 


Phase %s%s
101*constraints2
3.6 2default:default20
Small Shape Detail Placement2default:defaultZ18-101h px? 
R
=Phase 3.6 Small Shape Detail Placement | Checksum: 15e48de96
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:44 ; elapsed = 00:00:29 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
u

Phase %s%s
101*constraints2
3.7 2default:default2&
Re-assign LUT pins2default:defaultZ18-101h px? 
H
3Phase 3.7 Re-assign LUT pins | Checksum: 171d5d602
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:45 ; elapsed = 00:00:30 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
?

Phase %s%s
101*constraints2
3.8 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px? 
T
?Phase 3.8 Pipeline Register Optimization | Checksum: 1b4c26fae
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:45 ; elapsed = 00:00:30 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
t

Phase %s%s
101*constraints2
3.9 2default:default2%
Fast Optimization2default:defaultZ18-101h px? 
G
2Phase 3.9 Fast Optimization | Checksum: 1c939d861
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:51 ; elapsed = 00:00:33 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
D
/Phase 3 Detail Placement | Checksum: 1c939d861
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:51 ; elapsed = 00:00:33 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
?

Phase %s%s
101*constraints2
4 2default:default2<
(Post Placement Optimization and Clean-Up2default:defaultZ18-101h px? 
{

Phase %s%s
101*constraints2
4.1 2default:default2,
Post Commit Optimization2default:defaultZ18-101h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
?

Phase %s%s
101*constraints2
4.1.1 2default:default2/
Post Placement Optimization2default:defaultZ18-101h px? 
V
APost Placement Optimization Initialization | Checksum: 1a97ef6d0
*commonh px? 
u

Phase %s%s
101*constraints2
4.1.1.1 2default:default2"
BUFG Insertion2default:defaultZ18-101h px? 
a

Starting %s Task
103*constraints2&
Physical Synthesis2default:defaultZ18-103h px? 
?

Phase %s%s
101*constraints2
1 2default:default25
!Physical Synthesis Initialization2default:defaultZ18-101h px? 
?
EMultithreading enabled for phys_opt_design using a maximum of %s CPUs380*physynth2
22default:defaultZ32-721h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-4.5672default:default2
-181.8542default:defaultZ32-619h px? 
U
@Phase 1 Physical Synthesis Initialization | Checksum: 1c040a628
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:01 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
?
PProcessed net %s, BUFG insertion was skipped due to placement/routing conflicts.32*	placeflow2S
?zsys_i/video_out/v_tc_0/U0/U_VIDEO_CTRL/GEN_HAS_IRQ.irq_i_1_n_02default:defaultZ46-33h px? 
?
PProcessed net %s, BUFG insertion was skipped due to placement/routing conflicts.32*	placeflow2`
Lzsys_i/video_out/clk_wiz_1/inst/AXI_LITE_IPIF_I/I_SLAVE_ATTACHMENT/rst_reg_02default:defaultZ46-33h px? 
?
?BUFG insertion identified %s candidate nets. Inserted BUFG: %s, Replicated BUFG Driver: %s, Skipped due to Placement/Routing Conflicts: %s, Skipped due to Timing Degradation: %s, Skipped due to Illegal Netlist: %s.43*	placeflow2
22default:default2
02default:default2
02default:default2
22default:default2
02default:default2
02default:defaultZ46-56h px? 
J
5Ending Physical Synthesis Task | Checksum: 159616010
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:01 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
H
3Phase 4.1.1.1 BUFG Insertion | Checksum: 1a97ef6d0
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:00 ; elapsed = 00:00:39 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
?

Phase %s%s
101*constraints2
4.1.1.2 2default:default26
"Post Placement Timing Optimization2default:defaultZ18-101h px? 
?
hPost Placement Timing Summary WNS=%s. For the most accurate timing information please run report_timing.610*place2
-4.4262default:defaultZ30-746h px? 
\
GPhase 4.1.1.2 Post Placement Timing Optimization | Checksum: 2029f7265
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:36 ; elapsed = 00:01:15 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:36 ; elapsed = 00:01:15 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
N
9Phase 4.1 Post Commit Optimization | Checksum: 2029f7265
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:36 ; elapsed = 00:01:15 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
y

Phase %s%s
101*constraints2
4.2 2default:default2*
Post Placement Cleanup2default:defaultZ18-101h px? 
L
7Phase 4.2 Post Placement Cleanup | Checksum: 2029f7265
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:36 ; elapsed = 00:01:15 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
s

Phase %s%s
101*constraints2
4.3 2default:default2$
Placer Reporting2default:defaultZ18-101h px? 


Phase %s%s
101*constraints2
4.3.1 2default:default2.
Print Estimated Congestion2default:defaultZ18-101h px? 
?
'Post-Placement Estimated Congestion %s
38*	placeflow2?
?
 ____________________________________________________
|           | Global Congestion | Short Congestion  |
| Direction | Region Size       | Region Size       |
|___________|___________________|___________________|
|      North|                1x1|                1x1|
|___________|___________________|___________________|
|      South|                1x1|                2x2|
|___________|___________________|___________________|
|       East|                1x1|                1x1|
|___________|___________________|___________________|
|       West|                1x1|                1x1|
|___________|___________________|___________________|
2default:defaultZ30-612h px? 
R
=Phase 4.3.1 Print Estimated Congestion | Checksum: 2029f7265
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:36 ; elapsed = 00:01:15 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
F
1Phase 4.3 Placer Reporting | Checksum: 2029f7265
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:36 ; elapsed = 00:01:15 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
z

Phase %s%s
101*constraints2
4.4 2default:default2+
Final Placement Cleanup2default:defaultZ18-101h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0152default:default2
2254.5942default:default2
0.0002default:defaultZ17-268h px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:36 ; elapsed = 00:01:15 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
\
GPhase 4 Post Placement Optimization and Clean-Up | Checksum: 1a27a339c
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:36 ; elapsed = 00:01:15 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
=
(Ending Placer Task | Checksum: e5fbdad1
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:36 ; elapsed = 00:01:15 . Memory (MB): peak = 2254.594 ; gain = 0.0002default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
912default:default2
712default:default2
12default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
place_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
place_design: 2default:default2
00:01:392default:default2
00:01:172default:default2
2254.5942default:default2
0.0002default:defaultZ17-268h px? 
H
&Writing timing data to binary archive.266*timingZ38-480h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:092default:default2
00:00:032default:default2
2254.5942default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2m
YC:/School/Vivado/ZynqDemoRemake/vivado/zynqberrydemo1.runs/impl_1/zsys_wrapper_placed.dcp2default:defaultZ17-1381h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2&
write_checkpoint: 2default:default2
00:00:122default:default2
00:00:072default:default2
2254.5942default:default2
0.0002default:defaultZ17-268h px? 
g
%s4*runtcl2K
7Executing : report_io -file zsys_wrapper_io_placed.rpt
2default:defaulth px? 
?
kreport_io: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.076 . Memory (MB): peak = 2254.594 ; gain = 0.000
*commonh px? 
?
%s4*runtcl2?
pExecuting : report_utilization -file zsys_wrapper_utilization_placed.rpt -pb zsys_wrapper_utilization_placed.pb
2default:defaulth px? 
?
%s4*runtcl2h
TExecuting : report_control_sets -verbose -file zsys_wrapper_control_sets_placed.rpt
2default:defaulth px? 
?
ureport_control_sets: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.074 . Memory (MB): peak = 2254.594 ; gain = 0.000
*commonh px? 


End Record