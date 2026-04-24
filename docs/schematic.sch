# File saved with Nlview 7.5.8 2022-09-21 7111 VDI=41 GEI=38 GUI=JA:10.0 threadsafe
# 
# non-default properties - (restore without -noprops)
property -colorscheme classic
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 15
property maxzoom 6.25
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #0095ff
property objecthighlight4 #8000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlaycolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 4
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 15
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 1
property timelimit 1
#
module new cpu_top work:cpu_top:NOFILE -nosplit
load symbol RTL_OR0 work OR pin I0 input pin I1 input pin O output fillcolor 1
load symbol RTL_INV3 work INV pin I0 input pin O output fillcolor 1
load symbol reg_alu work:reg_alu:NOFILE HIERBOX pin cin input.left pin clk input.left pin cout output.right pin reset_n input.left pinBus a input.left [3:0] pinBus b input.left [3:0] pinBus f output.right [3:0] pinBus sel input.left [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol decoder work:decoder:NOFILE HIERBOX pinBus instr input.left [11:0] pinBus op1 output.right [3:0] pinBus op2 output.right [3:0] pinBus opcode output.right [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol fsm work:fsm:NOFILE HIERBOX pin clk input.left pin mem_rd output.right pin mem_wr output.right pin pc_en output.right pin reset_n input.left pinBus alu_a output.right [3:0] pinBus alu_b output.right [3:0] pinBus alu_out input.left [3:0] pinBus alu_sel output.right [3:0] pinBus mem_addr output.right [3:0] pinBus mem_rdata input.left [3:0] pinBus mem_wdata output.right [3:0] pinBus op1 input.left [3:0] pinBus op2 input.left [3:0] pinBus opcode input.left [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol pc work:pc:NOFILE HIERBOX pin clk input.left pin enable input.left pin reset_n input.left pinBus pc_out output.right [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol ram work:ram:NOFILE HIERBOX pin clk input.left pin csn input.left pin rwn input.left pinBus addr input.left [3:0] pinBus datain input.left [3:0] pinBus dataout output.right [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol rom work:rom:NOFILE HIERBOX pinBus addr input.left [3:0] pinBus instr output.right [11:0] boxcolor 1 fillcolor 2 minwidth 13%
load port clk input -pg 1 -lvl 0 -x 0 -y 550
load port reset_n input -pg 1 -lvl 0 -x 0 -y 590
load inst RTL_OR RTL_OR0 work -attr @cell(#000000) RTL_OR -pg 1 -lvl 5 -x 1370 -y 440
load inst ram_csn_i RTL_INV3 work -attr @cell(#000000) RTL_INV -pg 1 -lvl 2 -x 380 -y 370
load inst u_alu reg_alu work:reg_alu:NOFILE -autohide -attr @cell(#000000) reg_alu -pinAttr cout @attr n/c -pinBusAttr a @name a[3:0] -pinBusAttr b @name b[3:0] -pinBusAttr f @name f[3:0] -pinBusAttr sel @name sel[3:0] -pg 1 -lvl 3 -x 700 -y 80
load inst u_dec decoder work:decoder:NOFILE -autohide -attr @cell(#000000) decoder -pinBusAttr instr @name instr[11:0] -pinBusAttr op1 @name op1[3:0] -pinBusAttr op2 @name op2[3:0] -pinBusAttr opcode @name opcode[3:0] -pg 1 -lvl 3 -x 700 -y 620
load inst u_fsm fsm work:fsm:NOFILE -autohide -attr @cell(#000000) fsm -pinBusAttr alu_a @name alu_a[3:0] -pinBusAttr alu_b @name alu_b[3:0] -pinBusAttr alu_out @name alu_out[3:0] -pinBusAttr alu_sel @name alu_sel[3:0] -pinBusAttr mem_addr @name mem_addr[3:0] -pinBusAttr mem_rdata @name mem_rdata[3:0] -pinBusAttr mem_wdata @name mem_wdata[3:0] -pinBusAttr op1 @name op1[3:0] -pinBusAttr op2 @name op2[3:0] -pinBusAttr opcode @name opcode[3:0] -pg 1 -lvl 4 -x 1060 -y 320
load inst u_pc pc work:pc:NOFILE -autohide -attr @cell(#000000) pc -pinBusAttr pc_out @name pc_out[3:0] -pg 1 -lvl 1 -x 140 -y 640
load inst u_ram ram work:ram:NOFILE -autohide -attr @cell(#000000) ram -pinBusAttr addr @name addr[3:0] -pinBusAttr datain @name datain[3:0] -pinBusAttr dataout @name dataout[3:0] -pg 1 -lvl 3 -x 700 -y 320
load inst u_rom rom work:rom:NOFILE -autohide -attr @cell(#000000) rom -pinBusAttr addr @name addr[3:0] -pinBusAttr instr @name instr[11:0] -pg 1 -lvl 2 -x 380 -y 640
load net <const0> -ground -pin u_alu cin
load net RTL_OR_n_0 -pin RTL_OR O -pin ram_csn_i I0
netloc RTL_OR_n_0 1 1 5 300 530 550J 550 NJ 550 NJ 550 1460
load net alu_a[0] -attr @rip alu_a[0] -pin u_alu a[0] -pin u_fsm alu_a[0]
load net alu_a[1] -attr @rip alu_a[1] -pin u_alu a[1] -pin u_fsm alu_a[1]
load net alu_a[2] -attr @rip alu_a[2] -pin u_alu a[2] -pin u_fsm alu_a[2]
load net alu_a[3] -attr @rip alu_a[3] -pin u_alu a[3] -pin u_fsm alu_a[3]
load net alu_b[0] -attr @rip alu_b[0] -pin u_alu b[0] -pin u_fsm alu_b[0]
load net alu_b[1] -attr @rip alu_b[1] -pin u_alu b[1] -pin u_fsm alu_b[1]
load net alu_b[2] -attr @rip alu_b[2] -pin u_alu b[2] -pin u_fsm alu_b[2]
load net alu_b[3] -attr @rip alu_b[3] -pin u_alu b[3] -pin u_fsm alu_b[3]
load net alu_out[0] -attr @rip f[0] -pin u_alu f[0] -pin u_fsm alu_out[0]
load net alu_out[1] -attr @rip f[1] -pin u_alu f[1] -pin u_fsm alu_out[1]
load net alu_out[2] -attr @rip f[2] -pin u_alu f[2] -pin u_fsm alu_out[2]
load net alu_out[3] -attr @rip f[3] -pin u_alu f[3] -pin u_fsm alu_out[3]
load net alu_sel[0] -attr @rip alu_sel[0] -pin u_alu sel[0] -pin u_fsm alu_sel[0]
load net alu_sel[1] -attr @rip alu_sel[1] -pin u_alu sel[1] -pin u_fsm alu_sel[1]
load net alu_sel[2] -attr @rip alu_sel[2] -pin u_alu sel[2] -pin u_fsm alu_sel[2]
load net alu_sel[3] -attr @rip alu_sel[3] -pin u_alu sel[3] -pin u_fsm alu_sel[3]
load net clk -port clk -pin u_alu clk -pin u_fsm clk -pin u_pc clk -pin u_ram clk
netloc clk 1 0 4 40 550 NJ 550 530 450 860J
load net instr[0] -attr @rip instr[0] -pin u_dec instr[0] -pin u_rom instr[0]
load net instr[10] -attr @rip instr[10] -pin u_dec instr[10] -pin u_rom instr[10]
load net instr[11] -attr @rip instr[11] -pin u_dec instr[11] -pin u_rom instr[11]
load net instr[1] -attr @rip instr[1] -pin u_dec instr[1] -pin u_rom instr[1]
load net instr[2] -attr @rip instr[2] -pin u_dec instr[2] -pin u_rom instr[2]
load net instr[3] -attr @rip instr[3] -pin u_dec instr[3] -pin u_rom instr[3]
load net instr[4] -attr @rip instr[4] -pin u_dec instr[4] -pin u_rom instr[4]
load net instr[5] -attr @rip instr[5] -pin u_dec instr[5] -pin u_rom instr[5]
load net instr[6] -attr @rip instr[6] -pin u_dec instr[6] -pin u_rom instr[6]
load net instr[7] -attr @rip instr[7] -pin u_dec instr[7] -pin u_rom instr[7]
load net instr[8] -attr @rip instr[8] -pin u_dec instr[8] -pin u_rom instr[8]
load net instr[9] -attr @rip instr[9] -pin u_dec instr[9] -pin u_rom instr[9]
load net mem_addr[0] -attr @rip mem_addr[0] -pin u_fsm mem_addr[0] -pin u_ram addr[0]
load net mem_addr[1] -attr @rip mem_addr[1] -pin u_fsm mem_addr[1] -pin u_ram addr[1]
load net mem_addr[2] -attr @rip mem_addr[2] -pin u_fsm mem_addr[2] -pin u_ram addr[2]
load net mem_addr[3] -attr @rip mem_addr[3] -pin u_fsm mem_addr[3] -pin u_ram addr[3]
load net mem_rdata[0] -attr @rip dataout[0] -pin u_fsm mem_rdata[0] -pin u_ram dataout[0]
load net mem_rdata[1] -attr @rip dataout[1] -pin u_fsm mem_rdata[1] -pin u_ram dataout[1]
load net mem_rdata[2] -attr @rip dataout[2] -pin u_fsm mem_rdata[2] -pin u_ram dataout[2]
load net mem_rdata[3] -attr @rip dataout[3] -pin u_fsm mem_rdata[3] -pin u_ram dataout[3]
load net mem_wdata[0] -attr @rip mem_wdata[0] -pin u_fsm mem_wdata[0] -pin u_ram datain[0]
load net mem_wdata[1] -attr @rip mem_wdata[1] -pin u_fsm mem_wdata[1] -pin u_ram datain[1]
load net mem_wdata[2] -attr @rip mem_wdata[2] -pin u_fsm mem_wdata[2] -pin u_ram datain[2]
load net mem_wdata[3] -attr @rip mem_wdata[3] -pin u_fsm mem_wdata[3] -pin u_ram datain[3]
load net mem_wr -pin RTL_OR I1 -pin u_fsm mem_wr
netloc mem_wr 1 4 1 N 450
load net op1[0] -attr @rip op1[0] -pin u_dec op1[0] -pin u_fsm op1[0]
load net op1[1] -attr @rip op1[1] -pin u_dec op1[1] -pin u_fsm op1[1]
load net op1[2] -attr @rip op1[2] -pin u_dec op1[2] -pin u_fsm op1[2]
load net op1[3] -attr @rip op1[3] -pin u_dec op1[3] -pin u_fsm op1[3]
load net op2[0] -attr @rip op2[0] -pin u_dec op2[0] -pin u_fsm op2[0]
load net op2[1] -attr @rip op2[1] -pin u_dec op2[1] -pin u_fsm op2[1]
load net op2[2] -attr @rip op2[2] -pin u_dec op2[2] -pin u_fsm op2[2]
load net op2[3] -attr @rip op2[3] -pin u_dec op2[3] -pin u_fsm op2[3]
load net opcode[0] -attr @rip opcode[0] -pin u_dec opcode[0] -pin u_fsm opcode[0]
load net opcode[1] -attr @rip opcode[1] -pin u_dec opcode[1] -pin u_fsm opcode[1]
load net opcode[2] -attr @rip opcode[2] -pin u_dec opcode[2] -pin u_fsm opcode[2]
load net opcode[3] -attr @rip opcode[3] -pin u_dec opcode[3] -pin u_fsm opcode[3]
load net pc_en -pin u_fsm pc_en -pin u_pc enable
netloc pc_en 1 0 5 60 570 NJ 570 NJ 570 NJ 570 1240
load net pc_out[0] -attr @rip pc_out[0] -pin u_pc pc_out[0] -pin u_rom addr[0]
load net pc_out[1] -attr @rip pc_out[1] -pin u_pc pc_out[1] -pin u_rom addr[1]
load net pc_out[2] -attr @rip pc_out[2] -pin u_pc pc_out[2] -pin u_rom addr[2]
load net pc_out[3] -attr @rip pc_out[3] -pin u_pc pc_out[3] -pin u_rom addr[3]
load net ram_csn -pin ram_csn_i O -pin u_ram csn
netloc ram_csn 1 2 1 NJ 370
load net ram_rwn -pin RTL_OR I0 -pin u_fsm mem_rd -pin u_ram rwn
netloc ram_rwn 1 2 3 610 530 NJ 530 1300
load net reset_n -port reset_n -pin u_alu reset_n -pin u_fsm reset_n -pin u_pc reset_n
netloc reset_n 1 0 4 20 590 NJ 590 570 470 920J
load netBundle @alu_out 4 alu_out[3] alu_out[2] alu_out[1] alu_out[0] -autobundled
netbloc @alu_out 1 3 1 860 130n
load netBundle @op1 4 op1[3] op1[2] op1[1] op1[0] -autobundled
netbloc @op1 1 3 1 900 410n
load netBundle @op2 4 op2[3] op2[2] op2[1] op2[0] -autobundled
netbloc @op2 1 3 1 940 430n
load netBundle @opcode 4 opcode[3] opcode[2] opcode[1] opcode[0] -autobundled
netbloc @opcode 1 3 1 880 390n
load netBundle @alu_a 4 alu_a[3] alu_a[2] alu_a[1] alu_a[0] -autobundled
netbloc @alu_a 1 2 3 530 10 NJ 10 1320
load netBundle @alu_b 4 alu_b[3] alu_b[2] alu_b[1] alu_b[0] -autobundled
netbloc @alu_b 1 2 3 610 30 NJ 30 1300
load netBundle @alu_sel 4 alu_sel[3] alu_sel[2] alu_sel[1] alu_sel[0] -autobundled
netbloc @alu_sel 1 2 3 590 250 NJ 250 1280
load netBundle @mem_addr 4 mem_addr[3] mem_addr[2] mem_addr[1] mem_addr[0] -autobundled
netbloc @mem_addr 1 2 3 610 270 NJ 270 1240
load netBundle @mem_wdata 4 mem_wdata[3] mem_wdata[2] mem_wdata[1] mem_wdata[0] -autobundled
netbloc @mem_wdata 1 2 3 590 510 NJ 510 1260
load netBundle @pc_out 4 pc_out[3] pc_out[2] pc_out[1] pc_out[0] -autobundled
netbloc @pc_out 1 1 1 300 650n
load netBundle @mem_rdata 4 mem_rdata[3] mem_rdata[2] mem_rdata[1] mem_rdata[0] -autobundled
netbloc @mem_rdata 1 3 1 N 370
load netBundle @instr 12 instr[11] instr[10] instr[9] instr[8] instr[7] instr[6] instr[5] instr[4] instr[3] instr[2] instr[1] instr[0] -autobundled
netbloc @instr 1 2 1 NJ 650
levelinfo -pg 1 0 140 380 700 1060 1370 1480
pagesize -pg 1 -db -bbox -sgen -100 0 1480 730
show
fullfit
#
# initialize ictrl to current module cpu_top work:cpu_top:NOFILE
ictrl init topinfo |
