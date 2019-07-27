module InsReader( // @[:@3.2]
  input         io_jump, // @[:@6.4]
  input  [63:0] io_jdest, // @[:@6.4]
  input         io_nls, // @[:@6.4]
  input  [63:0] io_lpc, // @[:@6.4]
  input  [63:0] io_insp, // @[:@6.4]
  input  [63:0] io_inspd, // @[:@6.4]
  input         io_bubble, // @[:@6.4]
  output [31:0] io_ins, // @[:@6.4]
  output [63:0] io_pc, // @[:@6.4]
  output [63:0] io_insn, // @[:@6.4]
  output [63:0] io_insnd, // @[:@6.4]
  output [3:0]  io_mmu_mode, // @[:@6.4]
  input         io_mmu_ready, // @[:@6.4]
  output [63:0] io_mmu_addr, // @[:@6.4]
  input  [63:0] io_mmu_rdata // @[:@6.4]
);
  wire [64:0] _T_46; // @[insreader.scala 25:24:@8.4]
  wire [63:0] npc; // @[insreader.scala 25:24:@9.4]
  wire [60:0] _T_47; // @[insreader.scala 26:36:@10.4]
  wire [60:0] _T_48; // @[insreader.scala 26:50:@11.4]
  wire  _T_49; // @[insreader.scala 26:43:@12.4]
  wire  cnrc; // @[insreader.scala 26:25:@13.4]
  wire [63:0] _T_50; // @[insreader.scala 38:22:@14.4]
  wire [63:0] _T_51; // @[insreader.scala 37:12:@15.4]
  wire [63:0] pco; // @[insreader.scala 35:20:@16.4]
  wire  _T_52; // @[insreader.scala 41:29:@17.4]
  wire  _T_54; // @[insreader.scala 41:17:@18.4]
  wire  nread; // @[insreader.scala 41:40:@19.4]
  wire  _T_56; // @[insreader.scala 43:22:@20.4]
  wire  _T_57; // @[insreader.scala 43:19:@21.4]
  wire  _T_58; // @[insreader.scala 44:16:@22.4]
  wire [31:0] _T_59; // @[insreader.scala 44:28:@23.4]
  wire [31:0] _T_60; // @[insreader.scala 44:44:@24.4]
  wire [31:0] _T_61; // @[insreader.scala 43:32:@25.4]
  wire [31:0] _T_64; // @[insreader.scala 49:37:@27.4]
  wire [31:0] _T_65; // @[insreader.scala 49:58:@28.4]
  wire [31:0] _T_66; // @[insreader.scala 48:16:@29.4]
  wire [31:0] _T_67; // @[insreader.scala 45:15:@30.4]
  wire [31:0] ins; // @[insreader.scala 42:20:@31.4]
  wire [63:0] insn; // @[insreader.scala 53:20:@32.4]
  wire [63:0] jnpc; // @[insreader.scala 54:20:@33.4]
  wire [63:0] addr; // @[insreader.scala 55:21:@35.4]
  wire  _T_87; // @[insreader.scala 60:26:@41.4]
  wire [64:0] _T_89; // @[insreader.scala 60:54:@42.4]
  wire [64:0] _T_90; // @[insreader.scala 60:54:@43.4]
  wire [63:0] _T_91; // @[insreader.scala 60:54:@44.4]
  wire [63:0] _T_97; // @[insreader.scala 61:19:@49.4]
  wire  _T_102; // @[insreader.scala 63:34:@55.4]
  assign _T_46 = io_lpc + 64'h4; // @[insreader.scala 25:24:@8.4]
  assign npc = io_lpc + 64'h4; // @[insreader.scala 25:24:@9.4]
  assign _T_47 = io_inspd[63:3]; // @[insreader.scala 26:36:@10.4]
  assign _T_48 = npc[63:3]; // @[insreader.scala 26:50:@11.4]
  assign _T_49 = _T_47 != _T_48; // @[insreader.scala 26:43:@12.4]
  assign cnrc = io_jump | _T_49; // @[insreader.scala 26:25:@13.4]
  assign _T_50 = io_jump ? io_jdest : npc; // @[insreader.scala 38:22:@14.4]
  assign _T_51 = cnrc ? _T_50 : npc; // @[insreader.scala 37:12:@15.4]
  assign pco = io_bubble ? io_lpc : _T_51; // @[insreader.scala 35:20:@16.4]
  assign _T_52 = io_bubble | io_nls; // @[insreader.scala 41:29:@17.4]
  assign _T_54 = _T_52 == 1'h0; // @[insreader.scala 41:17:@18.4]
  assign nread = _T_54 & cnrc; // @[insreader.scala 41:40:@19.4]
  assign _T_56 = cnrc == 1'h0; // @[insreader.scala 43:22:@20.4]
  assign _T_57 = io_bubble | _T_56; // @[insreader.scala 43:19:@21.4]
  assign _T_58 = pco[2]; // @[insreader.scala 44:16:@22.4]
  assign _T_59 = io_insp[63:32]; // @[insreader.scala 44:28:@23.4]
  assign _T_60 = io_insp[31:0]; // @[insreader.scala 44:44:@24.4]
  assign _T_61 = _T_58 ? _T_59 : _T_60; // @[insreader.scala 43:32:@25.4]
  assign _T_64 = io_mmu_rdata[63:32]; // @[insreader.scala 49:37:@27.4]
  assign _T_65 = io_mmu_rdata[31:0]; // @[insreader.scala 49:58:@28.4]
  assign _T_66 = _T_58 ? _T_64 : _T_65; // @[insreader.scala 48:16:@29.4]
  assign _T_67 = io_nls ? 32'h0 : _T_66; // @[insreader.scala 45:15:@30.4]
  assign ins = _T_57 ? _T_61 : _T_67; // @[insreader.scala 42:20:@31.4]
  assign insn = nread ? io_mmu_rdata : io_insp; // @[insreader.scala 53:20:@32.4]
  assign jnpc = io_jump ? io_jdest : pco; // @[insreader.scala 54:20:@33.4]
  assign addr = jnpc & 64'hfffffffffffffff8; // @[insreader.scala 55:21:@35.4]
  assign _T_87 = _T_56 | io_mmu_ready; // @[insreader.scala 60:26:@41.4]
  assign _T_89 = jnpc - 64'h4; // @[insreader.scala 60:54:@42.4]
  assign _T_90 = $unsigned(_T_89); // @[insreader.scala 60:54:@43.4]
  assign _T_91 = _T_90[63:0]; // @[insreader.scala 60:54:@44.4]
  assign _T_97 = _T_87 ? {{32'd0}, ins} : 64'h0; // @[insreader.scala 61:19:@49.4]
  assign _T_102 = io_mmu_ready & nread; // @[insreader.scala 63:34:@55.4]
  assign io_ins = _T_97[31:0]; // @[insreader.scala 61:13:@50.4]
  assign io_pc = _T_87 ? jnpc : _T_91; // @[insreader.scala 60:13:@46.4]
  assign io_insn = _T_87 ? insn : io_insp; // @[insreader.scala 62:13:@54.4]
  assign io_insnd = _T_102 ? addr : io_inspd; // @[insreader.scala 63:14:@57.4]
  assign io_mmu_mode = nread ? 4'hb : 4'hf; // @[insreader.scala 58:18:@39.4]
  assign io_mmu_addr = nread ? addr : 64'h0; // @[insreader.scala 57:17:@37.4]
endmodule
module InsType( // @[:@61.2]
  input  [31:0] io_ins, // @[:@64.4]
  output [2:0]  io_ins_type, // @[:@64.4]
  output [3:0]  io_exe_type, // @[:@64.4]
  output        io_op32, // @[:@64.4]
  output        io_is_ecall, // @[:@64.4]
  output        io_is_ebreak // @[:@64.4]
);
  wire [2:0] funct3; // @[insType.scala 58:24:@66.4]
  wire [4:0] opcode; // @[insType.scala 59:24:@67.4]
  wire  _T_18; // @[insType.scala 61:24:@68.4]
  wire  _T_20; // @[insType.scala 61:49:@69.4]
  wire  _T_26; // @[insType.scala 66:30:@76.4]
  wire  _T_56; // @[Mux.scala 46:19:@77.4]
  wire [3:0] _T_57; // @[Mux.scala 46:16:@78.4]
  wire  _T_58; // @[Mux.scala 46:19:@79.4]
  wire [3:0] _T_59; // @[Mux.scala 46:16:@80.4]
  wire  _T_60; // @[Mux.scala 46:19:@81.4]
  wire [3:0] _T_61; // @[Mux.scala 46:16:@82.4]
  wire  _T_62; // @[Mux.scala 46:19:@83.4]
  wire [3:0] _T_63; // @[Mux.scala 46:16:@84.4]
  wire  _T_64; // @[Mux.scala 46:19:@85.4]
  wire [3:0] _T_65; // @[Mux.scala 46:16:@86.4]
  wire  _T_66; // @[Mux.scala 46:19:@87.4]
  wire [3:0] _T_67; // @[Mux.scala 46:16:@88.4]
  wire  _T_74; // @[insType.scala 96:38:@89.4]
  wire  _T_75; // @[insType.scala 97:25:@90.4]
  wire [3:0] _T_76; // @[insType.scala 97:18:@91.4]
  wire [3:0] _T_77; // @[insType.scala 96:30:@92.4]
  wire  _T_79; // @[Mux.scala 46:19:@93.4]
  wire [3:0] _T_80; // @[Mux.scala 46:16:@94.4]
  wire  _T_81; // @[Mux.scala 46:19:@95.4]
  wire [3:0] _T_82; // @[Mux.scala 46:16:@96.4]
  wire  _T_83; // @[Mux.scala 46:19:@97.4]
  wire [3:0] _T_84; // @[Mux.scala 46:16:@98.4]
  wire  _T_85; // @[Mux.scala 46:19:@99.4]
  wire [3:0] _T_86; // @[Mux.scala 46:16:@100.4]
  wire  _T_87; // @[Mux.scala 46:19:@101.4]
  wire [3:0] _T_88; // @[Mux.scala 46:16:@102.4]
  wire  _T_89; // @[Mux.scala 46:19:@103.4]
  wire [3:0] _T_90; // @[Mux.scala 46:16:@104.4]
  wire  _T_91; // @[Mux.scala 46:19:@105.4]
  wire [3:0] _T_92; // @[Mux.scala 46:16:@106.4]
  wire  _T_93; // @[Mux.scala 46:19:@107.4]
  wire [3:0] _T_94; // @[Mux.scala 46:16:@108.4]
  wire  _T_95; // @[Mux.scala 46:19:@109.4]
  wire [3:0] _T_96; // @[Mux.scala 46:16:@110.4]
  wire  _T_97; // @[Mux.scala 46:19:@111.4]
  wire [3:0] _T_98; // @[Mux.scala 46:16:@112.4]
  wire  _T_99; // @[Mux.scala 46:19:@113.4]
  wire [3:0] _T_100; // @[Mux.scala 46:16:@114.4]
  wire  _T_101; // @[Mux.scala 46:19:@115.4]
  wire [3:0] _T_102; // @[Mux.scala 46:16:@116.4]
  wire  _T_103; // @[Mux.scala 46:19:@117.4]
  wire [3:0] _T_104; // @[Mux.scala 46:16:@118.4]
  wire [2:0] _T_127; // @[Mux.scala 46:16:@123.4]
  wire [2:0] _T_129; // @[Mux.scala 46:16:@125.4]
  wire [2:0] _T_131; // @[Mux.scala 46:16:@127.4]
  wire [2:0] _T_133; // @[Mux.scala 46:16:@129.4]
  wire [2:0] _T_135; // @[Mux.scala 46:16:@131.4]
  wire [2:0] _T_137; // @[Mux.scala 46:16:@133.4]
  wire [2:0] _T_139; // @[Mux.scala 46:16:@135.4]
  wire [2:0] _T_141; // @[Mux.scala 46:16:@137.4]
  wire [2:0] _T_143; // @[Mux.scala 46:16:@139.4]
  wire [2:0] _T_145; // @[Mux.scala 46:16:@141.4]
  wire [2:0] _T_147; // @[Mux.scala 46:16:@143.4]
  wire [2:0] _T_149; // @[Mux.scala 46:16:@145.4]
  assign funct3 = io_ins[14:12]; // @[insType.scala 58:24:@66.4]
  assign opcode = io_ins[6:2]; // @[insType.scala 59:24:@67.4]
  assign _T_18 = opcode == 5'he; // @[insType.scala 61:24:@68.4]
  assign _T_20 = opcode == 5'h6; // @[insType.scala 61:49:@69.4]
  assign _T_26 = io_ins[0]; // @[insType.scala 66:30:@76.4]
  assign _T_56 = 3'h7 == funct3; // @[Mux.scala 46:19:@77.4]
  assign _T_57 = _T_56 ? 4'he : 4'h0; // @[Mux.scala 46:16:@78.4]
  assign _T_58 = 3'h6 == funct3; // @[Mux.scala 46:19:@79.4]
  assign _T_59 = _T_58 ? 4'hd : _T_57; // @[Mux.scala 46:16:@80.4]
  assign _T_60 = 3'h5 == funct3; // @[Mux.scala 46:19:@81.4]
  assign _T_61 = _T_60 ? 4'hc : _T_59; // @[Mux.scala 46:16:@82.4]
  assign _T_62 = 3'h4 == funct3; // @[Mux.scala 46:19:@83.4]
  assign _T_63 = _T_62 ? 4'hb : _T_61; // @[Mux.scala 46:16:@84.4]
  assign _T_64 = 3'h1 == funct3; // @[Mux.scala 46:19:@85.4]
  assign _T_65 = _T_64 ? 4'ha : _T_63; // @[Mux.scala 46:16:@86.4]
  assign _T_66 = 3'h0 == funct3; // @[Mux.scala 46:19:@87.4]
  assign _T_67 = _T_66 ? 4'h9 : _T_65; // @[Mux.scala 46:16:@88.4]
  assign _T_74 = funct3 != 3'h0; // @[insType.scala 96:38:@89.4]
  assign _T_75 = io_ins[14]; // @[insType.scala 97:25:@90.4]
  assign _T_76 = _T_75 ? 4'h7 : 4'h6; // @[insType.scala 97:18:@91.4]
  assign _T_77 = _T_74 ? _T_76 : 4'h1; // @[insType.scala 96:30:@92.4]
  assign _T_79 = 5'h3 == opcode; // @[Mux.scala 46:19:@93.4]
  assign _T_80 = _T_79 ? 4'h5 : 4'h0; // @[Mux.scala 46:16:@94.4]
  assign _T_81 = 5'h1c == opcode; // @[Mux.scala 46:19:@95.4]
  assign _T_82 = _T_81 ? _T_77 : _T_80; // @[Mux.scala 46:16:@96.4]
  assign _T_83 = 5'h19 == opcode; // @[Mux.scala 46:19:@97.4]
  assign _T_84 = _T_83 ? 4'hf : _T_82; // @[Mux.scala 46:16:@98.4]
  assign _T_85 = 5'h1b == opcode; // @[Mux.scala 46:19:@99.4]
  assign _T_86 = _T_85 ? 4'h8 : _T_84; // @[Mux.scala 46:16:@100.4]
  assign _T_87 = 5'hd == opcode; // @[Mux.scala 46:19:@101.4]
  assign _T_88 = _T_87 ? 4'h4 : _T_86; // @[Mux.scala 46:16:@102.4]
  assign _T_89 = 5'h5 == opcode; // @[Mux.scala 46:19:@103.4]
  assign _T_90 = _T_89 ? 4'h3 : _T_88; // @[Mux.scala 46:16:@104.4]
  assign _T_91 = 5'h18 == opcode; // @[Mux.scala 46:19:@105.4]
  assign _T_92 = _T_91 ? _T_67 : _T_90; // @[Mux.scala 46:16:@106.4]
  assign _T_93 = 5'h8 == opcode; // @[Mux.scala 46:19:@107.4]
  assign _T_94 = _T_93 ? 4'h2 : _T_92; // @[Mux.scala 46:16:@108.4]
  assign _T_95 = 5'h6 == opcode; // @[Mux.scala 46:19:@109.4]
  assign _T_96 = _T_95 ? 4'h0 : _T_94; // @[Mux.scala 46:16:@110.4]
  assign _T_97 = 5'h4 == opcode; // @[Mux.scala 46:19:@111.4]
  assign _T_98 = _T_97 ? 4'h0 : _T_96; // @[Mux.scala 46:16:@112.4]
  assign _T_99 = 5'h0 == opcode; // @[Mux.scala 46:19:@113.4]
  assign _T_100 = _T_99 ? 4'h2 : _T_98; // @[Mux.scala 46:16:@114.4]
  assign _T_101 = 5'he == opcode; // @[Mux.scala 46:19:@115.4]
  assign _T_102 = _T_101 ? 4'h0 : _T_100; // @[Mux.scala 46:16:@116.4]
  assign _T_103 = 5'hc == opcode; // @[Mux.scala 46:19:@117.4]
  assign _T_104 = _T_103 ? 4'h0 : _T_102; // @[Mux.scala 46:16:@118.4]
  assign _T_127 = _T_81 ? 3'h2 : 3'h0; // @[Mux.scala 46:16:@123.4]
  assign _T_129 = _T_85 ? 3'h6 : _T_127; // @[Mux.scala 46:16:@125.4]
  assign _T_131 = _T_87 ? 3'h5 : _T_129; // @[Mux.scala 46:16:@127.4]
  assign _T_133 = _T_89 ? 3'h5 : _T_131; // @[Mux.scala 46:16:@129.4]
  assign _T_135 = _T_91 ? 3'h4 : _T_133; // @[Mux.scala 46:16:@131.4]
  assign _T_137 = _T_93 ? 3'h3 : _T_135; // @[Mux.scala 46:16:@133.4]
  assign _T_139 = _T_95 ? 3'h2 : _T_137; // @[Mux.scala 46:16:@135.4]
  assign _T_141 = _T_83 ? 3'h2 : _T_139; // @[Mux.scala 46:16:@137.4]
  assign _T_143 = _T_97 ? 3'h2 : _T_141; // @[Mux.scala 46:16:@139.4]
  assign _T_145 = _T_99 ? 3'h2 : _T_143; // @[Mux.scala 46:16:@141.4]
  assign _T_147 = _T_101 ? 3'h1 : _T_145; // @[Mux.scala 46:16:@143.4]
  assign _T_149 = _T_103 ? 3'h1 : _T_147; // @[Mux.scala 46:16:@145.4]
  assign io_ins_type = _T_26 ? _T_149 : 3'h0; // @[insType.scala 104:17:@147.4]
  assign io_exe_type = _T_26 ? _T_104 : 4'h0; // @[insType.scala 66:17:@120.4]
  assign io_op32 = _T_18 | _T_20; // @[insType.scala 61:13:@71.4]
  assign io_is_ecall = io_ins == 32'h73; // @[insType.scala 63:17:@73.4]
  assign io_is_ebreak = io_ins == 32'h100073; // @[insType.scala 64:18:@75.4]
endmodule
module ImmGen( // @[:@149.2]
  input  [31:0] io_ins, // @[:@152.4]
  input  [2:0]  io_ins_type, // @[:@152.4]
  output [63:0] io_imm // @[:@152.4]
);
  wire  sign; // @[immGen.scala 14:22:@154.4]
  wire  _T_13; // @[immGen.scala 22:25:@155.4]
  wire  _T_14; // @[immGen.scala 22:36:@156.4]
  wire [1:0] _T_15; // @[Cat.scala 30:58:@157.4]
  wire [1:0] _T_16; // @[immGen.scala 22:41:@158.4]
  wire  _T_18; // @[immGen.scala 22:41:@159.4]
  wire [4:0] _T_20; // @[immGen.scala 23:36:@160.4]
  wire [63:0] _T_21; // @[Cat.scala 30:58:@161.4]
  wire [51:0] _T_25; // @[Bitwise.scala 72:12:@163.4]
  wire [11:0] _T_26; // @[immGen.scala 24:41:@164.4]
  wire [63:0] _T_27; // @[Cat.scala 30:58:@165.4]
  wire [63:0] _T_28; // @[immGen.scala 21:31:@166.4]
  wire [6:0] _T_33; // @[immGen.scala 26:54:@169.4]
  wire [4:0] _T_34; // @[immGen.scala 26:69:@170.4]
  wire [63:0] _T_36; // @[Cat.scala 30:58:@172.4]
  wire  _T_42; // @[immGen.scala 27:66:@176.4]
  wire [5:0] _T_43; // @[immGen.scala 27:77:@177.4]
  wire [3:0] _T_44; // @[immGen.scala 27:92:@178.4]
  wire [64:0] _T_50; // @[Cat.scala 30:58:@183.4]
  wire [31:0] _T_54; // @[Bitwise.scala 72:12:@185.4]
  wire [19:0] _T_55; // @[immGen.scala 28:54:@186.4]
  wire [63:0] _T_58; // @[Cat.scala 30:58:@188.4]
  wire [42:0] _T_62; // @[Bitwise.scala 72:12:@190.4]
  wire [7:0] _T_64; // @[immGen.scala 29:66:@192.4]
  wire  _T_65; // @[immGen.scala 29:81:@193.4]
  wire [9:0] _T_66; // @[immGen.scala 29:93:@194.4]
  wire [63:0] _T_72; // @[Cat.scala 30:58:@199.4]
  wire  _T_73; // @[Mux.scala 46:19:@200.4]
  wire [63:0] _T_74; // @[Mux.scala 46:16:@201.4]
  wire  _T_75; // @[Mux.scala 46:19:@202.4]
  wire [63:0] _T_76; // @[Mux.scala 46:16:@203.4]
  wire  _T_77; // @[Mux.scala 46:19:@204.4]
  wire [64:0] _T_78; // @[Mux.scala 46:16:@205.4]
  wire  _T_79; // @[Mux.scala 46:19:@206.4]
  wire [64:0] _T_80; // @[Mux.scala 46:16:@207.4]
  wire  _T_81; // @[Mux.scala 46:19:@208.4]
  wire [64:0] _T_82; // @[Mux.scala 46:16:@209.4]
  wire  _T_83; // @[Mux.scala 46:19:@210.4]
  wire [64:0] _T_84; // @[Mux.scala 46:16:@211.4]
  assign sign = io_ins[31]; // @[immGen.scala 14:22:@154.4]
  assign _T_13 = io_ins[6]; // @[immGen.scala 22:25:@155.4]
  assign _T_14 = io_ins[4]; // @[immGen.scala 22:36:@156.4]
  assign _T_15 = {_T_13,_T_14}; // @[Cat.scala 30:58:@157.4]
  assign _T_16 = ~ _T_15; // @[immGen.scala 22:41:@158.4]
  assign _T_18 = _T_16 == 2'h0; // @[immGen.scala 22:41:@159.4]
  assign _T_20 = io_ins[19:15]; // @[immGen.scala 23:36:@160.4]
  assign _T_21 = {59'h0,_T_20}; // @[Cat.scala 30:58:@161.4]
  assign _T_25 = sign ? 52'hfffffffffffff : 52'h0; // @[Bitwise.scala 72:12:@163.4]
  assign _T_26 = io_ins[31:20]; // @[immGen.scala 24:41:@164.4]
  assign _T_27 = {_T_25,_T_26}; // @[Cat.scala 30:58:@165.4]
  assign _T_28 = _T_18 ? _T_21 : _T_27; // @[immGen.scala 21:31:@166.4]
  assign _T_33 = io_ins[31:25]; // @[immGen.scala 26:54:@169.4]
  assign _T_34 = io_ins[11:7]; // @[immGen.scala 26:69:@170.4]
  assign _T_36 = {_T_25,_T_33,_T_34}; // @[Cat.scala 30:58:@172.4]
  assign _T_42 = io_ins[7]; // @[immGen.scala 27:66:@176.4]
  assign _T_43 = io_ins[30:25]; // @[immGen.scala 27:77:@177.4]
  assign _T_44 = io_ins[11:8]; // @[immGen.scala 27:92:@178.4]
  assign _T_50 = {_T_25,sign,_T_42,_T_43,_T_44,1'h0}; // @[Cat.scala 30:58:@183.4]
  assign _T_54 = sign ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12:@185.4]
  assign _T_55 = io_ins[31:12]; // @[immGen.scala 28:54:@186.4]
  assign _T_58 = {_T_54,_T_55,12'h0}; // @[Cat.scala 30:58:@188.4]
  assign _T_62 = sign ? 43'h7ffffffffff : 43'h0; // @[Bitwise.scala 72:12:@190.4]
  assign _T_64 = io_ins[19:12]; // @[immGen.scala 29:66:@192.4]
  assign _T_65 = io_ins[20]; // @[immGen.scala 29:81:@193.4]
  assign _T_66 = io_ins[30:21]; // @[immGen.scala 29:93:@194.4]
  assign _T_72 = {_T_62,sign,_T_64,_T_65,_T_66,1'h0}; // @[Cat.scala 30:58:@199.4]
  assign _T_73 = 3'h6 == io_ins_type; // @[Mux.scala 46:19:@200.4]
  assign _T_74 = _T_73 ? _T_72 : 64'h0; // @[Mux.scala 46:16:@201.4]
  assign _T_75 = 3'h5 == io_ins_type; // @[Mux.scala 46:19:@202.4]
  assign _T_76 = _T_75 ? _T_58 : _T_74; // @[Mux.scala 46:16:@203.4]
  assign _T_77 = 3'h4 == io_ins_type; // @[Mux.scala 46:19:@204.4]
  assign _T_78 = _T_77 ? _T_50 : {{1'd0}, _T_76}; // @[Mux.scala 46:16:@205.4]
  assign _T_79 = 3'h3 == io_ins_type; // @[Mux.scala 46:19:@206.4]
  assign _T_80 = _T_79 ? {{1'd0}, _T_36} : _T_78; // @[Mux.scala 46:16:@207.4]
  assign _T_81 = 3'h2 == io_ins_type; // @[Mux.scala 46:19:@208.4]
  assign _T_82 = _T_81 ? {{1'd0}, _T_28} : _T_80; // @[Mux.scala 46:16:@209.4]
  assign _T_83 = 3'h1 == io_ins_type; // @[Mux.scala 46:19:@210.4]
  assign _T_84 = _T_83 ? 65'h0 : _T_82; // @[Mux.scala 46:16:@211.4]
  assign io_imm = _T_84[63:0]; // @[immGen.scala 16:12:@212.4]
endmodule
module ALUGen( // @[:@214.2]
  input  [31:0] io_ins, // @[:@217.4]
  input  [2:0]  io_ins_type, // @[:@217.4]
  output [3:0]  io_ALUOp // @[:@217.4]
);
  wire  _T_25; // @[aluGen.scala 19:27:@219.4]
  wire [2:0] _T_26; // @[aluGen.scala 19:39:@220.4]
  wire [3:0] _T_27; // @[Cat.scala 30:58:@221.4]
  wire  _T_39; // @[Mux.scala 46:19:@222.4]
  wire [3:0] _T_40; // @[Mux.scala 46:16:@223.4]
  wire  _T_41; // @[Mux.scala 46:19:@224.4]
  wire [3:0] _T_42; // @[Mux.scala 46:16:@225.4]
  wire  _T_43; // @[Mux.scala 46:19:@226.4]
  wire [3:0] _T_44; // @[Mux.scala 46:16:@227.4]
  wire  _T_45; // @[Mux.scala 46:19:@228.4]
  wire [3:0] _T_46; // @[Mux.scala 46:16:@229.4]
  wire  _T_47; // @[Mux.scala 46:19:@230.4]
  wire [3:0] _T_48; // @[Mux.scala 46:16:@231.4]
  wire  _T_49; // @[Mux.scala 46:19:@232.4]
  wire [3:0] _T_50; // @[Mux.scala 46:16:@233.4]
  wire  _T_51; // @[Mux.scala 46:19:@234.4]
  wire [3:0] _T_52; // @[Mux.scala 46:16:@235.4]
  wire  _T_53; // @[Mux.scala 46:19:@236.4]
  wire [3:0] _T_54; // @[Mux.scala 46:16:@237.4]
  wire  _T_55; // @[Mux.scala 46:19:@238.4]
  wire [3:0] _T_56; // @[Mux.scala 46:16:@239.4]
  wire  _T_57; // @[Mux.scala 46:19:@240.4]
  wire [3:0] _T_58; // @[Mux.scala 46:16:@241.4]
  wire  _T_59; // @[aluGen.scala 35:27:@242.4]
  wire  _T_60; // @[aluGen.scala 35:42:@243.4]
  wire [4:0] _T_63; // @[Cat.scala 30:58:@246.4]
  wire [3:0] _T_73; // @[aluGen.scala 45:38:@248.4]
  wire  _T_80; // @[Mux.scala 46:19:@249.4]
  wire [3:0] _T_81; // @[Mux.scala 46:16:@250.4]
  wire  _T_82; // @[Mux.scala 46:19:@251.4]
  wire [3:0] _T_83; // @[Mux.scala 46:16:@252.4]
  wire  _T_84; // @[Mux.scala 46:19:@253.4]
  wire [3:0] _T_85; // @[Mux.scala 46:16:@254.4]
  wire  _T_86; // @[Mux.scala 46:19:@255.4]
  wire [3:0] _T_87; // @[Mux.scala 46:16:@256.4]
  wire  _T_88; // @[Mux.scala 46:19:@257.4]
  wire [3:0] _T_89; // @[Mux.scala 46:16:@258.4]
  wire  _T_90; // @[Mux.scala 46:19:@259.4]
  wire [3:0] _T_91; // @[Mux.scala 46:16:@260.4]
  wire  _T_92; // @[Mux.scala 46:19:@261.4]
  wire [3:0] _T_93; // @[Mux.scala 46:16:@262.4]
  wire  _T_94; // @[Mux.scala 46:19:@263.4]
  wire [3:0] _T_95; // @[Mux.scala 46:16:@264.4]
  wire  _T_96; // @[Mux.scala 46:19:@265.4]
  wire [3:0] _T_97; // @[Mux.scala 46:16:@266.4]
  wire  _T_98; // @[Mux.scala 46:19:@267.4]
  wire [3:0] _T_99; // @[Mux.scala 46:16:@268.4]
  wire  _T_100; // @[Mux.scala 46:19:@269.4]
  wire [3:0] _T_101; // @[Mux.scala 46:16:@270.4]
  wire  _T_102; // @[Mux.scala 46:19:@271.4]
  wire [3:0] _T_103; // @[Mux.scala 46:16:@272.4]
  wire  _T_104; // @[Mux.scala 46:19:@273.4]
  wire [3:0] _T_105; // @[Mux.scala 46:16:@274.4]
  wire  _T_106; // @[Mux.scala 46:19:@275.4]
  wire [3:0] _T_107; // @[Mux.scala 46:16:@276.4]
  wire  _T_108; // @[Mux.scala 46:19:@277.4]
  wire [3:0] _T_109; // @[Mux.scala 46:16:@278.4]
  wire  _T_110; // @[Mux.scala 46:19:@279.4]
  wire [3:0] _T_111; // @[Mux.scala 46:16:@280.4]
  wire  _T_112; // @[Mux.scala 46:19:@281.4]
  assign _T_25 = io_ins[30]; // @[aluGen.scala 19:27:@219.4]
  assign _T_26 = io_ins[14:12]; // @[aluGen.scala 19:39:@220.4]
  assign _T_27 = {_T_25,_T_26}; // @[Cat.scala 30:58:@221.4]
  assign _T_39 = 4'h7 == _T_27; // @[Mux.scala 46:19:@222.4]
  assign _T_40 = _T_39 ? 4'h4 : 4'h0; // @[Mux.scala 46:16:@223.4]
  assign _T_41 = 4'h6 == _T_27; // @[Mux.scala 46:19:@224.4]
  assign _T_42 = _T_41 ? 4'h5 : _T_40; // @[Mux.scala 46:16:@225.4]
  assign _T_43 = 4'hd == _T_27; // @[Mux.scala 46:19:@226.4]
  assign _T_44 = _T_43 ? 4'ha : _T_42; // @[Mux.scala 46:16:@227.4]
  assign _T_45 = 4'h5 == _T_27; // @[Mux.scala 46:19:@228.4]
  assign _T_46 = _T_45 ? 4'h9 : _T_44; // @[Mux.scala 46:16:@229.4]
  assign _T_47 = 4'h4 == _T_27; // @[Mux.scala 46:19:@230.4]
  assign _T_48 = _T_47 ? 4'h6 : _T_46; // @[Mux.scala 46:16:@231.4]
  assign _T_49 = 4'h3 == _T_27; // @[Mux.scala 46:19:@232.4]
  assign _T_50 = _T_49 ? 4'hc : _T_48; // @[Mux.scala 46:16:@233.4]
  assign _T_51 = 4'h2 == _T_27; // @[Mux.scala 46:19:@234.4]
  assign _T_52 = _T_51 ? 4'h7 : _T_50; // @[Mux.scala 46:16:@235.4]
  assign _T_53 = 4'h1 == _T_27; // @[Mux.scala 46:19:@236.4]
  assign _T_54 = _T_53 ? 4'h8 : _T_52; // @[Mux.scala 46:16:@237.4]
  assign _T_55 = 4'h8 == _T_27; // @[Mux.scala 46:19:@238.4]
  assign _T_56 = _T_55 ? 4'hb : _T_54; // @[Mux.scala 46:16:@239.4]
  assign _T_57 = 4'h0 == _T_27; // @[Mux.scala 46:19:@240.4]
  assign _T_58 = _T_57 ? 4'h3 : _T_56; // @[Mux.scala 46:16:@241.4]
  assign _T_59 = io_ins[6]; // @[aluGen.scala 35:27:@242.4]
  assign _T_60 = io_ins[4]; // @[aluGen.scala 35:42:@243.4]
  assign _T_63 = {_T_59,_T_60,_T_26}; // @[Cat.scala 30:58:@246.4]
  assign _T_73 = _T_25 ? 4'ha : 4'h9; // @[aluGen.scala 45:38:@248.4]
  assign _T_80 = 5'h1d == _T_63; // @[Mux.scala 46:19:@249.4]
  assign _T_81 = _T_80 ? 4'h1 : 4'h3; // @[Mux.scala 46:16:@250.4]
  assign _T_82 = 5'h19 == _T_63; // @[Mux.scala 46:19:@251.4]
  assign _T_83 = _T_82 ? 4'h1 : _T_81; // @[Mux.scala 46:16:@252.4]
  assign _T_84 = 5'h1f == _T_63; // @[Mux.scala 46:19:@253.4]
  assign _T_85 = _T_84 ? 4'h6 : _T_83; // @[Mux.scala 46:16:@254.4]
  assign _T_86 = 5'h1b == _T_63; // @[Mux.scala 46:19:@255.4]
  assign _T_87 = _T_86 ? 4'h6 : _T_85; // @[Mux.scala 46:16:@256.4]
  assign _T_88 = 5'h1e == _T_63; // @[Mux.scala 46:19:@257.4]
  assign _T_89 = _T_88 ? 4'h4 : _T_87; // @[Mux.scala 46:16:@258.4]
  assign _T_90 = 5'h1a == _T_63; // @[Mux.scala 46:19:@259.4]
  assign _T_91 = _T_90 ? 4'h4 : _T_89; // @[Mux.scala 46:16:@260.4]
  assign _T_92 = 5'hd == _T_63; // @[Mux.scala 46:19:@261.4]
  assign _T_93 = _T_92 ? _T_73 : _T_91; // @[Mux.scala 46:16:@262.4]
  assign _T_94 = 5'h9 == _T_63; // @[Mux.scala 46:19:@263.4]
  assign _T_95 = _T_94 ? 4'h8 : _T_93; // @[Mux.scala 46:16:@264.4]
  assign _T_96 = 5'hf == _T_63; // @[Mux.scala 46:19:@265.4]
  assign _T_97 = _T_96 ? 4'h4 : _T_95; // @[Mux.scala 46:16:@266.4]
  assign _T_98 = 5'he == _T_63; // @[Mux.scala 46:19:@267.4]
  assign _T_99 = _T_98 ? 4'h5 : _T_97; // @[Mux.scala 46:16:@268.4]
  assign _T_100 = 5'hc == _T_63; // @[Mux.scala 46:19:@269.4]
  assign _T_101 = _T_100 ? 4'h6 : _T_99; // @[Mux.scala 46:16:@270.4]
  assign _T_102 = 5'hb == _T_63; // @[Mux.scala 46:19:@271.4]
  assign _T_103 = _T_102 ? 4'hc : _T_101; // @[Mux.scala 46:16:@272.4]
  assign _T_104 = 5'ha == _T_63; // @[Mux.scala 46:19:@273.4]
  assign _T_105 = _T_104 ? 4'h7 : _T_103; // @[Mux.scala 46:16:@274.4]
  assign _T_106 = 5'h8 == _T_63; // @[Mux.scala 46:19:@275.4]
  assign _T_107 = _T_106 ? 4'h3 : _T_105; // @[Mux.scala 46:16:@276.4]
  assign _T_108 = 3'h2 == io_ins_type; // @[Mux.scala 46:19:@277.4]
  assign _T_109 = _T_108 ? _T_107 : 4'h0; // @[Mux.scala 46:16:@278.4]
  assign _T_110 = 3'h1 == io_ins_type; // @[Mux.scala 46:19:@279.4]
  assign _T_111 = _T_110 ? _T_58 : _T_109; // @[Mux.scala 46:16:@280.4]
  assign _T_112 = 3'h3 == io_ins_type; // @[Mux.scala 46:19:@281.4]
  assign io_ALUOp = _T_112 ? 4'h3 : _T_111; // @[aluGen.scala 13:14:@283.4]
endmodule
module Decoder( // @[:@285.2]
  input  [31:0] io_ins, // @[:@288.4]
  input         io_lastload_valid, // @[:@288.4]
  input  [4:0]  io_lastload_index, // @[:@288.4]
  output        io_loadinfo_valid, // @[:@288.4]
  output [4:0]  io_loadinfo_index, // @[:@288.4]
  output [63:0] io_imm, // @[:@288.4]
  output [3:0]  io_ALUOp, // @[:@288.4]
  output [3:0]  io_exe_type, // @[:@288.4]
  output [3:0]  io_ls_mode, // @[:@288.4]
  output        io_op32, // @[:@288.4]
  output        io_bubble, // @[:@288.4]
  output [4:0]  io_regr_r1, // @[:@288.4]
  output [4:0]  io_regr_r2, // @[:@288.4]
  input  [63:0] io_regr_r1d, // @[:@288.4]
  input  [63:0] io_regr_r2d, // @[:@288.4]
  output        io_dreg_rs2_valid, // @[:@288.4]
  output [63:0] io_dreg_rs1_value, // @[:@288.4]
  output [63:0] io_dreg_rs2_value, // @[:@288.4]
  output        io_dreg_rd_valid, // @[:@288.4]
  output [4:0]  io_dreg_rd_index, // @[:@288.4]
  output [11:0] io_csr_addr, // @[:@288.4]
  input  [63:0] io_csr_rdata, // @[:@288.4]
  output        io_csr_content_valid, // @[:@288.4]
  output [11:0] io_csr_content_csr_idx, // @[:@288.4]
  output [63:0] io_csr_content_csr_data, // @[:@288.4]
  input         io_csr_from_ex_valid, // @[:@288.4]
  input  [11:0] io_csr_from_ex_csr_idx, // @[:@288.4]
  input  [63:0] io_csr_from_ex_csr_data, // @[:@288.4]
  input         io_csr_from_mem_valid, // @[:@288.4]
  input  [11:0] io_csr_from_mem_csr_idx, // @[:@288.4]
  input  [63:0] io_csr_from_mem_csr_data, // @[:@288.4]
  input         io_exWrReg_wbrv, // @[:@288.4]
  input  [4:0]  io_exWrReg_wbri, // @[:@288.4]
  input  [63:0] io_exWrReg_wbrd, // @[:@288.4]
  input         io_memWrReg_wbrv, // @[:@288.4]
  input  [4:0]  io_memWrReg_wbri, // @[:@288.4]
  input  [63:0] io_memWrReg_wbrd // @[:@288.4]
);
  wire [31:0] itype_io_ins; // @[decoder.scala 37:23:@290.4]
  wire [2:0] itype_io_ins_type; // @[decoder.scala 37:23:@290.4]
  wire [3:0] itype_io_exe_type; // @[decoder.scala 37:23:@290.4]
  wire  itype_io_op32; // @[decoder.scala 37:23:@290.4]
  wire  itype_io_is_ecall; // @[decoder.scala 37:23:@290.4]
  wire  itype_io_is_ebreak; // @[decoder.scala 37:23:@290.4]
  wire [31:0] immg_io_ins; // @[decoder.scala 38:22:@293.4]
  wire [2:0] immg_io_ins_type; // @[decoder.scala 38:22:@293.4]
  wire [63:0] immg_io_imm; // @[decoder.scala 38:22:@293.4]
  wire [31:0] alug_io_ins; // @[decoder.scala 39:22:@296.4]
  wire [2:0] alug_io_ins_type; // @[decoder.scala 39:22:@296.4]
  wire [3:0] alug_io_ALUOp; // @[decoder.scala 39:22:@296.4]
  wire [4:0] rs1_index; // @[decoder.scala 51:27:@308.4]
  wire [4:0] rs2_index; // @[decoder.scala 52:27:@309.4]
  wire  _T_131; // @[decoder.scala 54:43:@310.4]
  wire  _T_132; // @[decoder.scala 54:24:@311.4]
  wire  _T_133; // @[decoder.scala 55:45:@312.4]
  wire  _T_134; // @[decoder.scala 55:25:@313.4]
  wire [63:0] _T_136; // @[Mux.scala 31:69:@314.4]
  wire  _T_137; // @[decoder.scala 59:43:@316.4]
  wire  _T_138; // @[decoder.scala 59:24:@317.4]
  wire  _T_139; // @[decoder.scala 60:45:@318.4]
  wire  _T_140; // @[decoder.scala 60:25:@319.4]
  wire [63:0] _T_142; // @[Mux.scala 31:69:@320.4]
  wire [4:0] rd_index; // @[decoder.scala 63:27:@322.4]
  wire  _T_143; // @[decoder.scala 64:40:@323.4]
  wire  _T_144; // @[decoder.scala 64:77:@324.4]
  wire  _T_145; // @[decoder.scala 64:56:@325.4]
  wire  _T_146; // @[decoder.scala 64:114:@326.4]
  wire  rs2_valid; // @[decoder.scala 64:93:@327.4]
  wire  _T_147; // @[decoder.scala 65:52:@328.4]
  wire  rs1_valid; // @[decoder.scala 65:31:@329.4]
  wire  _T_150; // @[decoder.scala 67:42:@332.4]
  wire  _T_151; // @[decoder.scala 67:100:@333.4]
  wire  _T_152; // @[decoder.scala 67:79:@334.4]
  wire  _T_153; // @[decoder.scala 67:137:@335.4]
  wire  _T_154; // @[decoder.scala 67:116:@336.4]
  wire  _T_156; // @[decoder.scala 68:17:@337.4]
  wire  _T_157; // @[decoder.scala 67:154:@338.4]
  wire  _T_159; // @[decoder.scala 69:7:@339.4]
  wire  _T_160; // @[decoder.scala 68:26:@340.4]
  wire  _T_162; // @[decoder.scala 69:29:@341.4]
  wire  _T_163; // @[decoder.scala 71:27:@343.4]
  wire  _T_164; // @[decoder.scala 72:20:@344.4]
  wire  _T_166; // @[decoder.scala 72:13:@345.4]
  wire [2:0] _T_167; // @[decoder.scala 72:31:@346.4]
  wire [3:0] _T_168; // @[Cat.scala 30:58:@347.4]
  wire [3:0] ls_mode; // @[decoder.scala 70:24:@348.4]
  wire  _T_169; // @[decoder.scala 75:75:@349.4]
  wire  _T_170; // @[decoder.scala 75:54:@350.4]
  wire  _T_171; // @[decoder.scala 75:125:@351.4]
  wire  _T_172; // @[decoder.scala 75:104:@352.4]
  wire  _T_173; // @[decoder.scala 75:90:@353.4]
  wire  _T_177; // @[Mux.scala 46:19:@355.4]
  wire  _T_179; // @[Mux.scala 46:19:@357.4]
  wire  _T_181; // @[decoder.scala 93:38:@370.4]
  wire  _T_182; // @[decoder.scala 93:61:@371.4]
  wire  _T_186; // @[decoder.scala 102:22:@381.4]
  wire  _T_187; // @[decoder.scala 102:49:@382.4]
  wire  _T_188; // @[decoder.scala 103:22:@383.4]
  wire  _T_189; // @[decoder.scala 103:50:@384.4]
  wire [63:0] _T_191; // @[Mux.scala 31:69:@385.4]
  InsType itype ( // @[decoder.scala 37:23:@290.4]
    .io_ins(itype_io_ins),
    .io_ins_type(itype_io_ins_type),
    .io_exe_type(itype_io_exe_type),
    .io_op32(itype_io_op32),
    .io_is_ecall(itype_io_is_ecall),
    .io_is_ebreak(itype_io_is_ebreak)
  );
  ImmGen immg ( // @[decoder.scala 38:22:@293.4]
    .io_ins(immg_io_ins),
    .io_ins_type(immg_io_ins_type),
    .io_imm(immg_io_imm)
  );
  ALUGen alug ( // @[decoder.scala 39:22:@296.4]
    .io_ins(alug_io_ins),
    .io_ins_type(alug_io_ins_type),
    .io_ALUOp(alug_io_ALUOp)
  );
  assign rs1_index = io_ins[19:15]; // @[decoder.scala 51:27:@308.4]
  assign rs2_index = io_ins[24:20]; // @[decoder.scala 52:27:@309.4]
  assign _T_131 = io_exWrReg_wbri == rs1_index; // @[decoder.scala 54:43:@310.4]
  assign _T_132 = io_exWrReg_wbrv & _T_131; // @[decoder.scala 54:24:@311.4]
  assign _T_133 = io_memWrReg_wbri == rs1_index; // @[decoder.scala 55:45:@312.4]
  assign _T_134 = io_memWrReg_wbrv & _T_133; // @[decoder.scala 55:25:@313.4]
  assign _T_136 = _T_134 ? io_memWrReg_wbrd : io_regr_r1d; // @[Mux.scala 31:69:@314.4]
  assign _T_137 = io_exWrReg_wbri == rs2_index; // @[decoder.scala 59:43:@316.4]
  assign _T_138 = io_exWrReg_wbrv & _T_137; // @[decoder.scala 59:24:@317.4]
  assign _T_139 = io_memWrReg_wbri == rs2_index; // @[decoder.scala 60:45:@318.4]
  assign _T_140 = io_memWrReg_wbrv & _T_139; // @[decoder.scala 60:25:@319.4]
  assign _T_142 = _T_140 ? io_memWrReg_wbrd : io_regr_r2d; // @[Mux.scala 31:69:@320.4]
  assign rd_index = io_ins[11:7]; // @[decoder.scala 63:27:@322.4]
  assign _T_143 = itype_io_ins_type == 3'h1; // @[decoder.scala 64:40:@323.4]
  assign _T_144 = itype_io_ins_type == 3'h3; // @[decoder.scala 64:77:@324.4]
  assign _T_145 = _T_143 | _T_144; // @[decoder.scala 64:56:@325.4]
  assign _T_146 = itype_io_ins_type == 3'h4; // @[decoder.scala 64:114:@326.4]
  assign rs2_valid = _T_145 | _T_146; // @[decoder.scala 64:93:@327.4]
  assign _T_147 = itype_io_ins_type == 3'h2; // @[decoder.scala 65:52:@328.4]
  assign rs1_valid = rs2_valid | _T_147; // @[decoder.scala 65:31:@329.4]
  assign _T_150 = _T_143 | _T_147; // @[decoder.scala 67:42:@332.4]
  assign _T_151 = itype_io_ins_type == 3'h5; // @[decoder.scala 67:100:@333.4]
  assign _T_152 = _T_150 | _T_151; // @[decoder.scala 67:79:@334.4]
  assign _T_153 = itype_io_ins_type == 3'h6; // @[decoder.scala 67:137:@335.4]
  assign _T_154 = _T_152 | _T_153; // @[decoder.scala 67:116:@336.4]
  assign _T_156 = rd_index != 5'h0; // @[decoder.scala 68:17:@337.4]
  assign _T_157 = _T_154 & _T_156; // @[decoder.scala 67:154:@338.4]
  assign _T_159 = itype_io_is_ecall == 1'h0; // @[decoder.scala 69:7:@339.4]
  assign _T_160 = _T_157 & _T_159; // @[decoder.scala 68:26:@340.4]
  assign _T_162 = itype_io_is_ebreak == 1'h0; // @[decoder.scala 69:29:@341.4]
  assign _T_163 = itype_io_exe_type == 4'h2; // @[decoder.scala 71:27:@343.4]
  assign _T_164 = io_ins[5]; // @[decoder.scala 72:20:@344.4]
  assign _T_166 = _T_164 == 1'h0; // @[decoder.scala 72:13:@345.4]
  assign _T_167 = io_ins[14:12]; // @[decoder.scala 72:31:@346.4]
  assign _T_168 = {_T_166,_T_167}; // @[Cat.scala 30:58:@347.4]
  assign ls_mode = _T_163 ? _T_168 : 4'hf; // @[decoder.scala 70:24:@348.4]
  assign _T_169 = io_lastload_index == rs1_index; // @[decoder.scala 75:75:@349.4]
  assign _T_170 = rs1_valid & _T_169; // @[decoder.scala 75:54:@350.4]
  assign _T_171 = io_lastload_index == rs2_index; // @[decoder.scala 75:125:@351.4]
  assign _T_172 = rs2_valid & _T_171; // @[decoder.scala 75:104:@352.4]
  assign _T_173 = _T_170 | _T_172; // @[decoder.scala 75:90:@353.4]
  assign _T_177 = 4'h7 == itype_io_exe_type; // @[Mux.scala 46:19:@355.4]
  assign _T_179 = 4'h6 == itype_io_exe_type; // @[Mux.scala 46:19:@357.4]
  assign _T_181 = ls_mode != 4'hf; // @[decoder.scala 93:38:@370.4]
  assign _T_182 = ls_mode[3]; // @[decoder.scala 93:61:@371.4]
  assign _T_186 = io_csr_addr == io_csr_from_ex_csr_idx; // @[decoder.scala 102:22:@381.4]
  assign _T_187 = _T_186 & io_csr_from_ex_valid; // @[decoder.scala 102:49:@382.4]
  assign _T_188 = io_csr_addr == io_csr_from_mem_csr_idx; // @[decoder.scala 103:22:@383.4]
  assign _T_189 = _T_188 & io_csr_from_mem_valid; // @[decoder.scala 103:50:@384.4]
  assign _T_191 = _T_189 ? io_csr_from_mem_csr_data : io_csr_rdata; // @[Mux.scala 31:69:@385.4]
  assign io_loadinfo_valid = _T_181 & _T_182; // @[decoder.scala 93:27:@373.4]
  assign io_loadinfo_index = io_ins[11:7]; // @[decoder.scala 94:27:@374.4]
  assign io_imm = immg_io_imm; // @[decoder.scala 46:23:@304.4]
  assign io_ALUOp = alug_io_ALUOp; // @[decoder.scala 47:23:@305.4]
  assign io_exe_type = itype_io_exe_type; // @[decoder.scala 48:23:@306.4]
  assign io_ls_mode = _T_163 ? _T_168 : 4'hf; // @[decoder.scala 91:23:@367.4]
  assign io_op32 = itype_io_op32; // @[decoder.scala 49:23:@307.4]
  assign io_bubble = io_lastload_valid & _T_173; // @[decoder.scala 95:23:@375.4]
  assign io_regr_r1 = io_ins[19:15]; // @[decoder.scala 86:23:@363.4]
  assign io_regr_r2 = io_ins[24:20]; // @[decoder.scala 87:23:@364.4]
  assign io_dreg_rs2_valid = _T_145 | _T_146; // @[decoder.scala 82:23:@359.4]
  assign io_dreg_rs1_value = _T_132 ? io_exWrReg_wbrd : _T_136; // @[decoder.scala 88:23:@365.4]
  assign io_dreg_rs2_value = _T_138 ? io_exWrReg_wbrd : _T_142; // @[decoder.scala 89:23:@366.4]
  assign io_dreg_rd_valid = _T_160 & _T_162; // @[decoder.scala 84:23:@361.4]
  assign io_dreg_rd_index = io_ins[11:7]; // @[decoder.scala 85:23:@362.4]
  assign io_csr_addr = io_ins[31:20]; // @[decoder.scala 97:23:@377.4]
  assign io_csr_content_valid = _T_179 ? 1'h1 : _T_177; // @[decoder.scala 98:29:@378.4]
  assign io_csr_content_csr_idx = io_ins[31:20]; // @[decoder.scala 99:32:@380.4]
  assign io_csr_content_csr_data = _T_187 ? io_csr_from_ex_csr_data : _T_191; // @[decoder.scala 101:29:@387.4]
  assign itype_io_ins = io_ins; // @[decoder.scala 41:23:@299.4]
  assign immg_io_ins = io_ins; // @[decoder.scala 42:23:@300.4]
  assign immg_io_ins_type = itype_io_ins_type; // @[decoder.scala 44:23:@302.4]
  assign alug_io_ins = io_ins; // @[decoder.scala 43:23:@301.4]
  assign alug_io_ins_type = itype_io_ins_type; // @[decoder.scala 45:23:@303.4]
endmodule
module ALU( // @[:@389.2]
  input  [3:0]  io_ALUOp, // @[:@392.4]
  input         io_op32, // @[:@392.4]
  input  [63:0] io_inputA, // @[:@392.4]
  input  [63:0] io_inputB, // @[:@392.4]
  output [63:0] io_output // @[:@392.4]
);
  wire [5:0] shamt; // @[alu.scala 31:26:@394.4]
  wire [4:0] shamt32; // @[alu.scala 32:28:@395.4]
  wire [31:0] inputA32; // @[alu.scala 33:29:@396.4]
  wire [31:0] inputB32; // @[alu.scala 34:29:@397.4]
  wire [32:0] _T_16; // @[alu.scala 39:39:@398.4]
  wire [31:0] _T_17; // @[alu.scala 39:39:@399.4]
  wire [62:0] _GEN_0; // @[alu.scala 40:39:@400.4]
  wire [62:0] _T_18; // @[alu.scala 40:39:@400.4]
  wire [31:0] _T_19; // @[alu.scala 41:38:@401.4]
  wire [31:0] _T_20; // @[alu.scala 42:40:@402.4]
  wire [31:0] _T_21; // @[alu.scala 42:47:@403.4]
  wire [31:0] _T_22; // @[alu.scala 42:59:@404.4]
  wire [32:0] _T_23; // @[alu.scala 43:39:@405.4]
  wire [32:0] _T_24; // @[alu.scala 43:39:@406.4]
  wire [31:0] _T_25; // @[alu.scala 43:39:@407.4]
  wire  _T_26; // @[Mux.scala 46:19:@408.4]
  wire [31:0] _T_27; // @[Mux.scala 46:16:@409.4]
  wire  _T_28; // @[Mux.scala 46:19:@410.4]
  wire [31:0] _T_29; // @[Mux.scala 46:16:@411.4]
  wire  _T_30; // @[Mux.scala 46:19:@412.4]
  wire [31:0] _T_31; // @[Mux.scala 46:16:@413.4]
  wire  _T_32; // @[Mux.scala 46:19:@414.4]
  wire [62:0] _T_33; // @[Mux.scala 46:16:@415.4]
  wire  _T_34; // @[Mux.scala 46:19:@416.4]
  wire [62:0] op32res; // @[Mux.scala 46:16:@417.4]
  wire  _T_35; // @[alu.scala 47:29:@418.4]
  wire [31:0] _T_39; // @[Bitwise.scala 72:12:@420.4]
  wire [31:0] _T_40; // @[alu.scala 47:43:@421.4]
  wire [63:0] _T_41; // @[Cat.scala 30:58:@422.4]
  wire [64:0] _T_44; // @[alu.scala 55:44:@423.4]
  wire [63:0] _T_45; // @[alu.scala 55:44:@424.4]
  wire [63:0] _T_46; // @[alu.scala 56:44:@425.4]
  wire [63:0] _T_47; // @[alu.scala 57:43:@426.4]
  wire [63:0] _T_48; // @[alu.scala 58:44:@427.4]
  wire  _T_49; // @[alu.scala 59:46:@428.4]
  wire [63:0] _T_50; // @[alu.scala 60:45:@429.4]
  wire [63:0] _T_51; // @[alu.scala 60:64:@430.4]
  wire  _T_52; // @[alu.scala 60:52:@431.4]
  wire [126:0] _GEN_1; // @[alu.scala 61:44:@432.4]
  wire [126:0] _T_53; // @[alu.scala 61:44:@432.4]
  wire [63:0] _T_54; // @[alu.scala 62:43:@433.4]
  wire [63:0] _T_56; // @[alu.scala 63:52:@435.4]
  wire [63:0] _T_57; // @[alu.scala 63:62:@436.4]
  wire [64:0] _T_58; // @[alu.scala 64:44:@437.4]
  wire [64:0] _T_59; // @[alu.scala 64:44:@438.4]
  wire [63:0] _T_60; // @[alu.scala 64:44:@439.4]
  wire [63:0] _T_62; // @[Mux.scala 46:16:@441.4]
  wire [63:0] _T_64; // @[Mux.scala 46:16:@443.4]
  wire [63:0] _T_66; // @[Mux.scala 46:16:@445.4]
  wire [126:0] _T_68; // @[Mux.scala 46:16:@447.4]
  wire  _T_69; // @[Mux.scala 46:19:@448.4]
  wire [126:0] _T_70; // @[Mux.scala 46:16:@449.4]
  wire  _T_71; // @[Mux.scala 46:19:@450.4]
  wire [126:0] _T_72; // @[Mux.scala 46:16:@451.4]
  wire  _T_73; // @[Mux.scala 46:19:@452.4]
  wire [126:0] _T_74; // @[Mux.scala 46:16:@453.4]
  wire  _T_75; // @[Mux.scala 46:19:@454.4]
  wire [126:0] _T_76; // @[Mux.scala 46:16:@455.4]
  wire  _T_77; // @[Mux.scala 46:19:@456.4]
  wire [126:0] _T_78; // @[Mux.scala 46:16:@457.4]
  wire [126:0] _T_80; // @[Mux.scala 46:16:@459.4]
  wire  _T_81; // @[Mux.scala 46:19:@460.4]
  wire [126:0] _T_82; // @[Mux.scala 46:16:@461.4]
  wire  _T_83; // @[Mux.scala 46:19:@462.4]
  wire [126:0] _T_84; // @[Mux.scala 46:16:@463.4]
  wire  _T_85; // @[Mux.scala 46:19:@464.4]
  wire [126:0] _T_86; // @[Mux.scala 46:16:@465.4]
  wire [126:0] _T_87; // @[alu.scala 46:21:@466.4]
  assign shamt = io_inputB[5:0]; // @[alu.scala 31:26:@394.4]
  assign shamt32 = io_inputB[4:0]; // @[alu.scala 32:28:@395.4]
  assign inputA32 = io_inputA[31:0]; // @[alu.scala 33:29:@396.4]
  assign inputB32 = io_inputB[31:0]; // @[alu.scala 34:29:@397.4]
  assign _T_16 = inputA32 + inputB32; // @[alu.scala 39:39:@398.4]
  assign _T_17 = inputA32 + inputB32; // @[alu.scala 39:39:@399.4]
  assign _GEN_0 = {{31'd0}, inputA32}; // @[alu.scala 40:39:@400.4]
  assign _T_18 = _GEN_0 << shamt32; // @[alu.scala 40:39:@400.4]
  assign _T_19 = inputA32 >> shamt32; // @[alu.scala 41:38:@401.4]
  assign _T_20 = $signed(inputA32); // @[alu.scala 42:40:@402.4]
  assign _T_21 = $signed(_T_20) >>> shamt32; // @[alu.scala 42:47:@403.4]
  assign _T_22 = $unsigned(_T_21); // @[alu.scala 42:59:@404.4]
  assign _T_23 = inputA32 - inputB32; // @[alu.scala 43:39:@405.4]
  assign _T_24 = $unsigned(_T_23); // @[alu.scala 43:39:@406.4]
  assign _T_25 = _T_24[31:0]; // @[alu.scala 43:39:@407.4]
  assign _T_26 = 4'hb == io_ALUOp; // @[Mux.scala 46:19:@408.4]
  assign _T_27 = _T_26 ? _T_25 : 32'h0; // @[Mux.scala 46:16:@409.4]
  assign _T_28 = 4'ha == io_ALUOp; // @[Mux.scala 46:19:@410.4]
  assign _T_29 = _T_28 ? _T_22 : _T_27; // @[Mux.scala 46:16:@411.4]
  assign _T_30 = 4'h9 == io_ALUOp; // @[Mux.scala 46:19:@412.4]
  assign _T_31 = _T_30 ? _T_19 : _T_29; // @[Mux.scala 46:16:@413.4]
  assign _T_32 = 4'h8 == io_ALUOp; // @[Mux.scala 46:19:@414.4]
  assign _T_33 = _T_32 ? _T_18 : {{31'd0}, _T_31}; // @[Mux.scala 46:16:@415.4]
  assign _T_34 = 4'h3 == io_ALUOp; // @[Mux.scala 46:19:@416.4]
  assign op32res = _T_34 ? {{31'd0}, _T_17} : _T_33; // @[Mux.scala 46:16:@417.4]
  assign _T_35 = op32res[31]; // @[alu.scala 47:29:@418.4]
  assign _T_39 = _T_35 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12:@420.4]
  assign _T_40 = op32res[31:0]; // @[alu.scala 47:43:@421.4]
  assign _T_41 = {_T_39,_T_40}; // @[Cat.scala 30:58:@422.4]
  assign _T_44 = io_inputA + io_inputB; // @[alu.scala 55:44:@423.4]
  assign _T_45 = io_inputA + io_inputB; // @[alu.scala 55:44:@424.4]
  assign _T_46 = io_inputA & io_inputB; // @[alu.scala 56:44:@425.4]
  assign _T_47 = io_inputA | io_inputB; // @[alu.scala 57:43:@426.4]
  assign _T_48 = io_inputA ^ io_inputB; // @[alu.scala 58:44:@427.4]
  assign _T_49 = io_inputA < io_inputB; // @[alu.scala 59:46:@428.4]
  assign _T_50 = $signed(io_inputA); // @[alu.scala 60:45:@429.4]
  assign _T_51 = $signed(io_inputB); // @[alu.scala 60:64:@430.4]
  assign _T_52 = $signed(_T_50) < $signed(_T_51); // @[alu.scala 60:52:@431.4]
  assign _GEN_1 = {{63'd0}, io_inputA}; // @[alu.scala 61:44:@432.4]
  assign _T_53 = _GEN_1 << shamt; // @[alu.scala 61:44:@432.4]
  assign _T_54 = io_inputA >> shamt; // @[alu.scala 62:43:@433.4]
  assign _T_56 = $signed(_T_50) >>> shamt; // @[alu.scala 63:52:@435.4]
  assign _T_57 = $unsigned(_T_56); // @[alu.scala 63:62:@436.4]
  assign _T_58 = io_inputA - io_inputB; // @[alu.scala 64:44:@437.4]
  assign _T_59 = $unsigned(_T_58); // @[alu.scala 64:44:@438.4]
  assign _T_60 = _T_59[63:0]; // @[alu.scala 64:44:@439.4]
  assign _T_62 = _T_26 ? _T_60 : 64'h0; // @[Mux.scala 46:16:@441.4]
  assign _T_64 = _T_28 ? _T_57 : _T_62; // @[Mux.scala 46:16:@443.4]
  assign _T_66 = _T_30 ? _T_54 : _T_64; // @[Mux.scala 46:16:@445.4]
  assign _T_68 = _T_32 ? _T_53 : {{63'd0}, _T_66}; // @[Mux.scala 46:16:@447.4]
  assign _T_69 = 4'h7 == io_ALUOp; // @[Mux.scala 46:19:@448.4]
  assign _T_70 = _T_69 ? {{126'd0}, _T_52} : _T_68; // @[Mux.scala 46:16:@449.4]
  assign _T_71 = 4'hc == io_ALUOp; // @[Mux.scala 46:19:@450.4]
  assign _T_72 = _T_71 ? {{126'd0}, _T_49} : _T_70; // @[Mux.scala 46:16:@451.4]
  assign _T_73 = 4'h6 == io_ALUOp; // @[Mux.scala 46:19:@452.4]
  assign _T_74 = _T_73 ? {{63'd0}, _T_48} : _T_72; // @[Mux.scala 46:16:@453.4]
  assign _T_75 = 4'h5 == io_ALUOp; // @[Mux.scala 46:19:@454.4]
  assign _T_76 = _T_75 ? {{63'd0}, _T_47} : _T_74; // @[Mux.scala 46:16:@455.4]
  assign _T_77 = 4'h4 == io_ALUOp; // @[Mux.scala 46:19:@456.4]
  assign _T_78 = _T_77 ? {{63'd0}, _T_46} : _T_76; // @[Mux.scala 46:16:@457.4]
  assign _T_80 = _T_34 ? {{63'd0}, _T_45} : _T_78; // @[Mux.scala 46:16:@459.4]
  assign _T_81 = 4'h2 == io_ALUOp; // @[Mux.scala 46:19:@460.4]
  assign _T_82 = _T_81 ? {{63'd0}, io_inputB} : _T_80; // @[Mux.scala 46:16:@461.4]
  assign _T_83 = 4'h1 == io_ALUOp; // @[Mux.scala 46:19:@462.4]
  assign _T_84 = _T_83 ? {{63'd0}, io_inputA} : _T_82; // @[Mux.scala 46:16:@463.4]
  assign _T_85 = 4'h0 == io_ALUOp; // @[Mux.scala 46:19:@464.4]
  assign _T_86 = _T_85 ? 127'h0 : _T_84; // @[Mux.scala 46:16:@465.4]
  assign _T_87 = io_op32 ? {{63'd0}, _T_41} : _T_86; // @[alu.scala 46:21:@466.4]
  assign io_output = _T_87[63:0]; // @[alu.scala 46:15:@467.4]
endmodule
module BranchCtrl( // @[:@469.2]
  input  [3:0]  io_exeType, // @[:@472.4]
  input  [63:0] io_input1, // @[:@472.4]
  input  [63:0] io_input2, // @[:@472.4]
  output        io_jump // @[:@472.4]
);
  wire [64:0] _T_13; // @[branch.scala 27:25:@474.4]
  wire [64:0] _T_14; // @[branch.scala 27:25:@475.4]
  wire [63:0] x; // @[branch.scala 27:25:@476.4]
  wire  ne; // @[branch.scala 28:17:@477.4]
  wire  eq; // @[branch.scala 29:15:@478.4]
  wire  _T_17; // @[branch.scala 30:24:@479.4]
  wire  _T_18; // @[branch.scala 30:42:@480.4]
  wire  st; // @[branch.scala 30:29:@481.4]
  wire  _T_19; // @[branch.scala 31:24:@482.4]
  wire  lt; // @[branch.scala 31:18:@484.4]
  wire  ge; // @[branch.scala 32:15:@485.4]
  wire  _T_23; // @[branch.scala 33:39:@487.4]
  wire  ltu; // @[branch.scala 33:18:@488.4]
  wire  geu; // @[branch.scala 34:15:@489.4]
  wire  _T_36; // @[Mux.scala 46:19:@490.4]
  wire  _T_38; // @[Mux.scala 46:19:@492.4]
  wire  _T_39; // @[Mux.scala 46:16:@493.4]
  wire  _T_40; // @[Mux.scala 46:19:@494.4]
  wire  _T_41; // @[Mux.scala 46:16:@495.4]
  wire  _T_42; // @[Mux.scala 46:19:@496.4]
  wire  _T_43; // @[Mux.scala 46:16:@497.4]
  wire  _T_44; // @[Mux.scala 46:19:@498.4]
  wire  _T_45; // @[Mux.scala 46:16:@499.4]
  wire  _T_46; // @[Mux.scala 46:19:@500.4]
  wire  _T_47; // @[Mux.scala 46:16:@501.4]
  wire  _T_48; // @[Mux.scala 46:19:@502.4]
  wire  _T_49; // @[Mux.scala 46:16:@503.4]
  assign _T_13 = io_input1 - io_input2; // @[branch.scala 27:25:@474.4]
  assign _T_14 = $unsigned(_T_13); // @[branch.scala 27:25:@475.4]
  assign x = _T_14[63:0]; // @[branch.scala 27:25:@476.4]
  assign ne = x != 64'h0; // @[branch.scala 28:17:@477.4]
  assign eq = ne == 1'h0; // @[branch.scala 29:15:@478.4]
  assign _T_17 = io_input1[63]; // @[branch.scala 30:24:@479.4]
  assign _T_18 = io_input2[62]; // @[branch.scala 30:42:@480.4]
  assign st = _T_17 == _T_18; // @[branch.scala 30:29:@481.4]
  assign _T_19 = x[63]; // @[branch.scala 31:24:@482.4]
  assign lt = st ? _T_19 : _T_17; // @[branch.scala 31:18:@484.4]
  assign ge = lt == 1'h0; // @[branch.scala 32:15:@485.4]
  assign _T_23 = io_input2[63]; // @[branch.scala 33:39:@487.4]
  assign ltu = st ? _T_19 : _T_23; // @[branch.scala 33:18:@488.4]
  assign geu = ltu == 1'h0; // @[branch.scala 34:15:@489.4]
  assign _T_36 = 4'h8 == io_exeType; // @[Mux.scala 46:19:@490.4]
  assign _T_38 = 4'he == io_exeType; // @[Mux.scala 46:19:@492.4]
  assign _T_39 = _T_38 ? geu : _T_36; // @[Mux.scala 46:16:@493.4]
  assign _T_40 = 4'hd == io_exeType; // @[Mux.scala 46:19:@494.4]
  assign _T_41 = _T_40 ? ltu : _T_39; // @[Mux.scala 46:16:@495.4]
  assign _T_42 = 4'hc == io_exeType; // @[Mux.scala 46:19:@496.4]
  assign _T_43 = _T_42 ? ge : _T_41; // @[Mux.scala 46:16:@497.4]
  assign _T_44 = 4'hb == io_exeType; // @[Mux.scala 46:19:@498.4]
  assign _T_45 = _T_44 ? lt : _T_43; // @[Mux.scala 46:16:@499.4]
  assign _T_46 = 4'ha == io_exeType; // @[Mux.scala 46:19:@500.4]
  assign _T_47 = _T_46 ? ne : _T_45; // @[Mux.scala 46:16:@501.4]
  assign _T_48 = 4'h9 == io_exeType; // @[Mux.scala 46:19:@502.4]
  assign _T_49 = _T_48 ? eq : _T_47; // @[Mux.scala 46:16:@503.4]
  assign io_jump = _T_36 ? 1'h1 : _T_49; // @[branch.scala 36:13:@506.4]
endmodule
module Branch( // @[:@508.2]
  input  [3:0]  io_exeType, // @[:@511.4]
  input  [63:0] io_input1, // @[:@511.4]
  input  [63:0] io_input2, // @[:@511.4]
  input  [63:0] io_pc, // @[:@511.4]
  input  [63:0] io_imm, // @[:@511.4]
  output        io_jump, // @[:@511.4]
  output [63:0] io_jdest // @[:@511.4]
);
  wire [3:0] bctrl_io_exeType; // @[branch.scala 64:23:@513.4]
  wire [63:0] bctrl_io_input1; // @[branch.scala 64:23:@513.4]
  wire [63:0] bctrl_io_input2; // @[branch.scala 64:23:@513.4]
  wire  bctrl_io_jump; // @[branch.scala 64:23:@513.4]
  wire  _T_19; // @[branch.scala 71:33:@520.4]
  wire [64:0] _T_20; // @[branch.scala 71:57:@521.4]
  wire [63:0] _T_21; // @[branch.scala 71:57:@522.4]
  wire [64:0] _T_22; // @[branch.scala 71:73:@523.4]
  wire [63:0] _T_23; // @[branch.scala 71:73:@524.4]
  BranchCtrl bctrl ( // @[branch.scala 64:23:@513.4]
    .io_exeType(bctrl_io_exeType),
    .io_input1(bctrl_io_input1),
    .io_input2(bctrl_io_input2),
    .io_jump(bctrl_io_jump)
  );
  assign _T_19 = io_exeType == 4'hf; // @[branch.scala 71:33:@520.4]
  assign _T_20 = io_input1 + io_imm; // @[branch.scala 71:57:@521.4]
  assign _T_21 = io_input1 + io_imm; // @[branch.scala 71:57:@522.4]
  assign _T_22 = io_pc + io_imm; // @[branch.scala 71:73:@523.4]
  assign _T_23 = io_pc + io_imm; // @[branch.scala 71:73:@524.4]
  assign io_jump = bctrl_io_jump; // @[branch.scala 69:26:@519.4]
  assign io_jdest = _T_19 ? _T_21 : _T_23; // @[branch.scala 71:14:@526.4]
  assign bctrl_io_exeType = io_exeType; // @[branch.scala 66:26:@516.4]
  assign bctrl_io_input1 = io_input1; // @[branch.scala 67:26:@517.4]
  assign bctrl_io_input2 = io_input2; // @[branch.scala 68:26:@518.4]
endmodule
module Execute( // @[:@528.2]
  input  [63:0] io_imm, // @[:@531.4]
  input  [3:0]  io_ALUOp, // @[:@531.4]
  input  [63:0] io_pc, // @[:@531.4]
  input  [3:0]  io_exe_type, // @[:@531.4]
  input         io_op32, // @[:@531.4]
  input         io_dreg_rs2_valid, // @[:@531.4]
  input  [63:0] io_dreg_rs1_value, // @[:@531.4]
  input  [63:0] io_dreg_rs2_value, // @[:@531.4]
  input         io_dreg_rd_valid, // @[:@531.4]
  input  [4:0]  io_dreg_rd_index, // @[:@531.4]
  output        io_nls, // @[:@531.4]
  output [63:0] io_addr, // @[:@531.4]
  output [63:0] io_data, // @[:@531.4]
  output        io_jump, // @[:@531.4]
  output [63:0] io_jdest, // @[:@531.4]
  output        io_wreg_wbrv, // @[:@531.4]
  output [4:0]  io_wreg_wbri, // @[:@531.4]
  output [63:0] io_wreg_wbrd, // @[:@531.4]
  output        io_wcsr_valid, // @[:@531.4]
  output [11:0] io_wcsr_csr_idx, // @[:@531.4]
  output [63:0] io_wcsr_csr_data, // @[:@531.4]
  input         io_csr_op_valid, // @[:@531.4]
  input  [11:0] io_csr_op_csr_idx, // @[:@531.4]
  input  [63:0] io_csr_op_csr_data // @[:@531.4]
);
  wire [3:0] alu_io_ALUOp; // @[execute.scala 28:21:@533.4]
  wire  alu_io_op32; // @[execute.scala 28:21:@533.4]
  wire [63:0] alu_io_inputA; // @[execute.scala 28:21:@533.4]
  wire [63:0] alu_io_inputB; // @[execute.scala 28:21:@533.4]
  wire [63:0] alu_io_output; // @[execute.scala 28:21:@533.4]
  wire [3:0] bra_io_exeType; // @[execute.scala 29:21:@536.4]
  wire [63:0] bra_io_input1; // @[execute.scala 29:21:@536.4]
  wire [63:0] bra_io_input2; // @[execute.scala 29:21:@536.4]
  wire [63:0] bra_io_pc; // @[execute.scala 29:21:@536.4]
  wire [63:0] bra_io_imm; // @[execute.scala 29:21:@536.4]
  wire  bra_io_jump; // @[execute.scala 29:21:@536.4]
  wire [63:0] bra_io_jdest; // @[execute.scala 29:21:@536.4]
  wire  _T_79; // @[execute.scala 31:38:@539.4]
  wire  _T_80; // @[execute.scala 35:38:@541.4]
  wire  _T_82; // @[execute.scala 35:50:@543.4]
  wire [63:0] _T_83; // @[execute.scala 37:14:@544.4]
  wire  nls; // @[execute.scala 39:28:@546.4]
  wire  _T_85; // @[execute.scala 40:36:@547.4]
  wire  _T_87; // @[execute.scala 42:43:@549.4]
  wire [64:0] _T_90; // @[execute.scala 42:69:@550.4]
  wire [63:0] _T_91; // @[execute.scala 42:69:@551.4]
  wire [63:0] _T_92; // @[execute.scala 42:25:@552.4]
  wire [64:0] _T_100; // @[execute.scala 45:30:@557.4]
  wire [63:0] _T_101; // @[execute.scala 45:30:@558.4]
  wire  _T_102; // @[Mux.scala 46:19:@559.4]
  wire [63:0] _T_103; // @[Mux.scala 46:16:@560.4]
  wire  _T_104; // @[Mux.scala 46:19:@561.4]
  wire [63:0] _T_105; // @[Mux.scala 46:16:@562.4]
  wire  _T_106; // @[Mux.scala 46:19:@563.4]
  wire [63:0] _T_107; // @[Mux.scala 46:16:@564.4]
  wire  _T_108; // @[Mux.scala 46:19:@565.4]
  wire [63:0] _T_109; // @[Mux.scala 46:16:@566.4]
  wire  _T_110; // @[Mux.scala 46:19:@567.4]
  wire [63:0] _T_111; // @[Mux.scala 46:16:@568.4]
  wire  _T_112; // @[Mux.scala 46:19:@569.4]
  wire [64:0] _T_113; // @[execute.scala 59:34:@578.4]
  ALU alu ( // @[execute.scala 28:21:@533.4]
    .io_ALUOp(alu_io_ALUOp),
    .io_op32(alu_io_op32),
    .io_inputA(alu_io_inputA),
    .io_inputB(alu_io_inputB),
    .io_output(alu_io_output)
  );
  Branch bra ( // @[execute.scala 29:21:@536.4]
    .io_exeType(bra_io_exeType),
    .io_input1(bra_io_input1),
    .io_input2(bra_io_input2),
    .io_pc(bra_io_pc),
    .io_imm(bra_io_imm),
    .io_jump(bra_io_jump),
    .io_jdest(bra_io_jdest)
  );
  assign _T_79 = io_exe_type == 4'h7; // @[execute.scala 31:38:@539.4]
  assign _T_80 = io_exe_type == 4'h6; // @[execute.scala 35:38:@541.4]
  assign _T_82 = _T_80 | _T_79; // @[execute.scala 35:50:@543.4]
  assign _T_83 = io_dreg_rs2_valid ? io_dreg_rs2_value : io_imm; // @[execute.scala 37:14:@544.4]
  assign nls = io_exe_type == 4'h2; // @[execute.scala 39:28:@546.4]
  assign _T_85 = nls == 1'h0; // @[execute.scala 40:36:@547.4]
  assign _T_87 = io_dreg_rd_index == 5'h0; // @[execute.scala 42:43:@549.4]
  assign _T_90 = io_pc + 64'h4; // @[execute.scala 42:69:@550.4]
  assign _T_91 = io_pc + 64'h4; // @[execute.scala 42:69:@551.4]
  assign _T_92 = _T_87 ? 64'h0 : _T_91; // @[execute.scala 42:25:@552.4]
  assign _T_100 = io_imm + io_pc; // @[execute.scala 45:30:@557.4]
  assign _T_101 = io_imm + io_pc; // @[execute.scala 45:30:@558.4]
  assign _T_102 = 4'h7 == io_exe_type; // @[Mux.scala 46:19:@559.4]
  assign _T_103 = _T_102 ? io_csr_op_csr_data : alu_io_output; // @[Mux.scala 46:16:@560.4]
  assign _T_104 = 4'h6 == io_exe_type; // @[Mux.scala 46:19:@561.4]
  assign _T_105 = _T_104 ? io_csr_op_csr_data : _T_103; // @[Mux.scala 46:16:@562.4]
  assign _T_106 = 4'h3 == io_exe_type; // @[Mux.scala 46:19:@563.4]
  assign _T_107 = _T_106 ? _T_101 : _T_105; // @[Mux.scala 46:16:@564.4]
  assign _T_108 = 4'h4 == io_exe_type; // @[Mux.scala 46:19:@565.4]
  assign _T_109 = _T_108 ? io_imm : _T_107; // @[Mux.scala 46:16:@566.4]
  assign _T_110 = 4'hf == io_exe_type; // @[Mux.scala 46:19:@567.4]
  assign _T_111 = _T_110 ? _T_92 : _T_109; // @[Mux.scala 46:16:@568.4]
  assign _T_112 = 4'h8 == io_exe_type; // @[Mux.scala 46:19:@569.4]
  assign _T_113 = io_dreg_rs1_value + io_imm; // @[execute.scala 59:34:@578.4]
  assign io_nls = io_exe_type == 4'h2; // @[execute.scala 70:12:@589.4]
  assign io_addr = io_dreg_rs1_value + io_imm; // @[execute.scala 59:13:@580.4]
  assign io_data = io_dreg_rs2_value; // @[execute.scala 60:13:@581.4]
  assign io_jump = bra_io_jump; // @[execute.scala 67:19:@587.4]
  assign io_jdest = bra_io_jdest; // @[execute.scala 68:19:@588.4]
  assign io_wreg_wbrv = io_dreg_rd_valid & _T_85; // @[execute.scala 55:19:@575.4]
  assign io_wreg_wbri = io_dreg_rd_index; // @[execute.scala 56:19:@576.4]
  assign io_wreg_wbrd = _T_112 ? _T_92 : _T_111; // @[execute.scala 57:19:@577.4]
  assign io_wcsr_valid = io_csr_op_valid; // @[execute.scala 72:19:@590.4]
  assign io_wcsr_csr_idx = io_csr_op_csr_idx; // @[execute.scala 73:21:@591.4]
  assign io_wcsr_csr_data = alu_io_output; // @[execute.scala 74:22:@592.4]
  assign alu_io_ALUOp = io_ALUOp; // @[execute.scala 50:19:@571.4]
  assign alu_io_op32 = io_op32; // @[execute.scala 53:19:@574.4]
  assign alu_io_inputA = _T_79 ? io_imm : io_dreg_rs1_value; // @[execute.scala 51:19:@572.4]
  assign alu_io_inputB = _T_82 ? io_csr_op_csr_data : _T_83; // @[execute.scala 52:19:@573.4]
  assign bra_io_exeType = io_exe_type; // @[execute.scala 62:20:@582.4]
  assign bra_io_input1 = io_dreg_rs1_value; // @[execute.scala 63:20:@583.4]
  assign bra_io_input2 = io_dreg_rs2_value; // @[execute.scala 64:20:@584.4]
  assign bra_io_pc = io_pc; // @[execute.scala 65:20:@585.4]
  assign bra_io_imm = io_imm; // @[execute.scala 66:20:@586.4]
endmodule
module MemoryCtrl( // @[:@594.2]
  input         io_nls, // @[:@597.4]
  input  [3:0]  io_lsm, // @[:@597.4]
  input  [63:0] io_addr, // @[:@597.4]
  input  [63:0] io_data, // @[:@597.4]
  output        io_ready, // @[:@597.4]
  input         io_ereg_wbrv, // @[:@597.4]
  input  [4:0]  io_ereg_wbri, // @[:@597.4]
  input  [63:0] io_ereg_wbrd, // @[:@597.4]
  output        io_wreg_wbrv, // @[:@597.4]
  output [4:0]  io_wreg_wbri, // @[:@597.4]
  output [63:0] io_wreg_wbrd, // @[:@597.4]
  output [3:0]  io_mem_mode, // @[:@597.4]
  input         io_mem_ready, // @[:@597.4]
  output [63:0] io_mem_addr, // @[:@597.4]
  input  [63:0] io_mem_rdata, // @[:@597.4]
  output [63:0] io_mem_wdata // @[:@597.4]
);
  wire  _T_59; // @[memoryCtrl.scala 48:21:@603.4]
  wire  _T_61; // @[memoryCtrl.scala 50:45:@606.4]
  wire  _T_62; // @[memoryCtrl.scala 50:67:@607.4]
  wire  _T_63; // @[memoryCtrl.scala 50:58:@608.4]
  assign _T_59 = io_nls == 1'h0; // @[memoryCtrl.scala 48:21:@603.4]
  assign _T_61 = io_lsm != 4'hf; // @[memoryCtrl.scala 50:45:@606.4]
  assign _T_62 = io_lsm[3]; // @[memoryCtrl.scala 50:67:@607.4]
  assign _T_63 = _T_61 & _T_62; // @[memoryCtrl.scala 50:58:@608.4]
  assign io_ready = _T_59 | io_mem_ready; // @[memoryCtrl.scala 48:18:@605.4]
  assign io_wreg_wbrv = io_ereg_wbrv | _T_63; // @[memoryCtrl.scala 50:18:@610.4]
  assign io_wreg_wbri = io_ereg_wbri; // @[memoryCtrl.scala 51:18:@611.4]
  assign io_wreg_wbrd = io_nls ? io_mem_rdata : io_ereg_wbrd; // @[memoryCtrl.scala 52:18:@613.4]
  assign io_mem_mode = io_nls ? io_lsm : 4'hf; // @[memoryCtrl.scala 44:18:@600.4]
  assign io_mem_addr = io_addr; // @[memoryCtrl.scala 45:17:@601.4]
  assign io_mem_wdata = io_data; // @[memoryCtrl.scala 46:18:@602.4]
endmodule
module WriteBack( // @[:@615.2]
  input         io_wreg_wbrv, // @[:@618.4]
  input  [4:0]  io_wreg_wbri, // @[:@618.4]
  input  [63:0] io_wreg_wbrd, // @[:@618.4]
  output        io_reg_wen, // @[:@618.4]
  output [4:0]  io_reg_w, // @[:@618.4]
  output [63:0] io_reg_wd // @[:@618.4]
);
  assign io_reg_wen = io_wreg_wbrv; // @[writeback.scala 12:16:@620.4]
  assign io_reg_w = io_wreg_wbri; // @[writeback.scala 13:16:@621.4]
  assign io_reg_wd = io_wreg_wbrd; // @[writeback.scala 14:16:@622.4]
endmodule
module RegCtrl( // @[:@624.2]
  input         clock, // @[:@625.4]
  input  [4:0]  io_r_r1, // @[:@627.4]
  input  [4:0]  io_r_r2, // @[:@627.4]
  output [63:0] io_r_r1d, // @[:@627.4]
  output [63:0] io_r_r2d, // @[:@627.4]
  input         io_w_wen, // @[:@627.4]
  input  [4:0]  io_w_w, // @[:@627.4]
  input  [63:0] io_w_wd, // @[:@627.4]
  input         io_pass // @[:@627.4]
);
  reg [63:0] regs [0:31]; // @[reg.scala 9:19:@629.4]
  reg [63:0] _RAND_0;
  wire [63:0] regs__T_25_data; // @[reg.scala 9:19:@629.4]
  wire [4:0] regs__T_25_addr; // @[reg.scala 9:19:@629.4]
  wire [63:0] regs__T_29_data; // @[reg.scala 9:19:@629.4]
  wire [4:0] regs__T_29_addr; // @[reg.scala 9:19:@629.4]
  wire [63:0] regs__T_35_data; // @[reg.scala 9:19:@629.4]
  wire [4:0] regs__T_35_addr; // @[reg.scala 9:19:@629.4]
  wire  regs__T_35_mask; // @[reg.scala 9:19:@629.4]
  wire  regs__T_35_en; // @[reg.scala 9:19:@629.4]
  wire  _T_23; // @[reg.scala 11:29:@630.4]
  wire  _T_24; // @[reg.scala 11:18:@631.4]
  wire  _T_27; // @[reg.scala 16:29:@635.4]
  wire  _T_28; // @[reg.scala 16:18:@636.4]
  wire  _T_32; // @[reg.scala 20:30:@640.4]
  wire  _T_33; // @[reg.scala 20:20:@641.4]
  assign regs__T_25_addr = io_r_r1;
  assign regs__T_25_data = regs[regs__T_25_addr]; // @[reg.scala 9:19:@629.4]
  assign regs__T_29_addr = io_r_r2;
  assign regs__T_29_data = regs[regs__T_29_addr]; // @[reg.scala 9:19:@629.4]
  assign regs__T_35_data = io_w_wd;
  assign regs__T_35_addr = io_w_w;
  assign regs__T_35_mask = 1'h1;
  assign regs__T_35_en = _T_33 & io_pass;
  assign _T_23 = io_r_r1 == io_w_w; // @[reg.scala 11:29:@630.4]
  assign _T_24 = io_w_wen & _T_23; // @[reg.scala 11:18:@631.4]
  assign _T_27 = io_r_r2 == io_w_w; // @[reg.scala 16:29:@635.4]
  assign _T_28 = io_w_wen & _T_27; // @[reg.scala 16:18:@636.4]
  assign _T_32 = io_w_w != 5'h0; // @[reg.scala 20:30:@640.4]
  assign _T_33 = io_w_wen & _T_32; // @[reg.scala 20:20:@641.4]
  assign io_r_r1d = _T_24 ? io_w_wd : regs__T_25_data; // @[reg.scala 10:14:@634.4]
  assign io_r_r2d = _T_28 ? io_w_wd : regs__T_29_data; // @[reg.scala 15:14:@639.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  _RAND_0 = {2{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    regs[initvar] = _RAND_0[63:0];
  `endif // RANDOMIZE_MEM_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(regs__T_35_en & regs__T_35_mask) begin
      regs[regs__T_35_addr] <= regs__T_35_data; // @[reg.scala 9:19:@629.4]
    end
  end
endmodule
module MMU( // @[:@648.2]
  input         clock, // @[:@649.4]
  input         reset, // @[:@650.4]
  input  [3:0]  io_insr_mode, // @[:@651.4]
  output        io_insr_ready, // @[:@651.4]
  input  [63:0] io_insr_addr, // @[:@651.4]
  output [63:0] io_insr_rdata, // @[:@651.4]
  input  [3:0]  io_mem_mode, // @[:@651.4]
  output        io_mem_ready, // @[:@651.4]
  input  [63:0] io_mem_addr, // @[:@651.4]
  output [63:0] io_mem_rdata, // @[:@651.4]
  input  [63:0] io_mem_wdata, // @[:@651.4]
  output [3:0]  io_if_iom_mode, // @[:@651.4]
  input         io_if_iom_ready, // @[:@651.4]
  output [63:0] io_if_iom_addr, // @[:@651.4]
  input  [63:0] io_if_iom_rdata, // @[:@651.4]
  output [3:0]  io_mem_iom_mode, // @[:@651.4]
  input         io_mem_iom_ready, // @[:@651.4]
  output [63:0] io_mem_iom_addr, // @[:@651.4]
  input  [63:0] io_mem_iom_rdata, // @[:@651.4]
  output [63:0] io_mem_iom_wdata // @[:@651.4]
);
  reg [63:0] if_addr; // @[MMU.scala 14:24:@653.4]
  reg [63:0] _RAND_0;
  wire  _T_70; // @[MMU.scala 26:49:@662.4]
  wire [63:0] _GEN_0; // @[MMU.scala 29:26:@666.4]
  assign _T_70 = if_addr == io_insr_addr; // @[MMU.scala 26:49:@662.4]
  assign _GEN_0 = io_if_iom_ready ? io_insr_addr : if_addr; // @[MMU.scala 29:26:@666.4]
  assign io_insr_ready = io_if_iom_ready & _T_70; // @[MMU.scala 26:18:@664.4]
  assign io_insr_rdata = io_if_iom_rdata; // @[MMU.scala 20:21:@657.4]
  assign io_mem_ready = io_mem_iom_ready; // @[MMU.scala 27:17:@665.4]
  assign io_mem_rdata = io_mem_iom_rdata; // @[MMU.scala 23:21:@660.4]
  assign io_if_iom_mode = io_insr_mode; // @[MMU.scala 17:21:@654.4]
  assign io_if_iom_addr = io_insr_addr; // @[MMU.scala 18:20:@655.4]
  assign io_mem_iom_mode = io_mem_mode; // @[MMU.scala 21:21:@658.4]
  assign io_mem_iom_addr = io_mem_addr; // @[MMU.scala 22:20:@659.4]
  assign io_mem_iom_wdata = io_mem_wdata; // @[MMU.scala 24:21:@661.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  if_addr = _RAND_0[63:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      if_addr <= 64'h0;
    end else begin
      if (io_if_iom_ready) begin
        if_addr <= io_insr_addr;
      end
    end
  end
endmodule
module IOManager( // @[:@687.2]
  input         clock, // @[:@688.4]
  input         reset, // @[:@689.4]
  input  [3:0]  io_mem_if_mode, // @[:@690.4]
  output        io_mem_if_ready, // @[:@690.4]
  input  [63:0] io_mem_if_addr, // @[:@690.4]
  output [63:0] io_mem_if_rdata, // @[:@690.4]
  input  [3:0]  io_mem_mem_mode, // @[:@690.4]
  output        io_mem_mem_ready, // @[:@690.4]
  input  [63:0] io_mem_mem_addr, // @[:@690.4]
  output [63:0] io_mem_mem_rdata, // @[:@690.4]
  input  [63:0] io_mem_mem_wdata, // @[:@690.4]
  output [3:0]  io_mem_out_mode, // @[:@690.4]
  input         io_mem_out_ready, // @[:@690.4]
  output [63:0] io_mem_out_addr, // @[:@690.4]
  input  [63:0] io_mem_out_rdata, // @[:@690.4]
  output [63:0] io_mem_out_wdata, // @[:@690.4]
  output [3:0]  io_serial_out_mode, // @[:@690.4]
  input         io_serial_out_ready, // @[:@690.4]
  output [63:0] io_serial_out_addr, // @[:@690.4]
  input  [63:0] io_serial_out_rdata, // @[:@690.4]
  output [63:0] io_serial_out_wdata // @[:@690.4]
);
  reg [1:0] ifWait; // @[iomanager.scala 48:25:@718.4]
  reg [31:0] _RAND_0;
  reg [1:0] memWait; // @[iomanager.scala 49:26:@719.4]
  reg [31:0] _RAND_1;
  wire  _T_71; // @[Conditional.scala 37:30:@720.4]
  wire  _T_72; // @[Conditional.scala 37:30:@726.6]
  wire [63:0] _GEN_0; // @[Conditional.scala 39:67:@727.6]
  wire  _GEN_1; // @[Conditional.scala 39:67:@727.6]
  wire  _GEN_3; // @[Conditional.scala 40:58:@721.4]
  wire  _T_73; // @[Conditional.scala 37:30:@731.4]
  wire  _T_74; // @[Conditional.scala 37:30:@737.6]
  wire [63:0] _GEN_4; // @[Conditional.scala 39:67:@738.6]
  wire  _GEN_5; // @[Conditional.scala 39:67:@738.6]
  wire  _GEN_7; // @[Conditional.scala 40:58:@732.4]
  wire  _T_75; // @[iomanager.scala 73:26:@742.4]
  wire  _T_77; // @[iomanager.scala 73:42:@743.4]
  wire  _T_78; // @[iomanager.scala 73:39:@744.4]
  wire [1:0] _T_79; // @[iomanager.scala 73:18:@745.4]
  wire  _T_80; // @[iomanager.scala 74:28:@747.4]
  wire  _T_82; // @[iomanager.scala 74:44:@748.4]
  wire  _T_83; // @[iomanager.scala 74:41:@749.4]
  wire [1:0] _T_84; // @[iomanager.scala 74:19:@750.4]
  wire  _T_85; // @[iomanager.scala 78:18:@752.4]
  wire  _T_86; // @[iomanager.scala 78:43:@753.4]
  wire  _T_87; // @[iomanager.scala 78:31:@754.4]
  wire  _T_93; // @[iomanager.scala 13:43:@757.6]
  wire  _T_95; // @[memoryCtrl.scala 21:37:@763.8]
  wire  _T_97; // @[memoryCtrl.scala 21:34:@764.8]
  wire [1:0] _GEN_8; // @[iomanager.scala 81:38:@765.8]
  wire  _T_100; // @[iomanager.scala 14:25:@775.8]
  wire  _T_101; // @[iomanager.scala 14:49:@776.8]
  wire  _T_102; // @[iomanager.scala 14:41:@777.8]
  wire [1:0] _GEN_10; // @[iomanager.scala 90:38:@784.10]
  wire  _T_110; // @[iomanager.scala 98:15:@795.10]
  wire [63:0] _GEN_12; // @[iomanager.scala 88:37:@778.8]
  wire [3:0] _GEN_13; // @[iomanager.scala 88:37:@778.8]
  wire [63:0] _GEN_14; // @[iomanager.scala 88:37:@778.8]
  wire [1:0] _GEN_15; // @[iomanager.scala 88:37:@778.8]
  wire  _GEN_16; // @[iomanager.scala 88:37:@778.8]
  wire [63:0] _GEN_17; // @[iomanager.scala 79:28:@759.6]
  wire [3:0] _GEN_18; // @[iomanager.scala 79:28:@759.6]
  wire [63:0] _GEN_19; // @[iomanager.scala 79:28:@759.6]
  wire [1:0] _GEN_20; // @[iomanager.scala 79:28:@759.6]
  wire  _GEN_21; // @[iomanager.scala 79:28:@759.6]
  wire [63:0] _GEN_22; // @[iomanager.scala 79:28:@759.6]
  wire [3:0] _GEN_23; // @[iomanager.scala 79:28:@759.6]
  wire [63:0] _GEN_24; // @[iomanager.scala 79:28:@759.6]
  wire [63:0] _GEN_25; // @[iomanager.scala 78:57:@755.4]
  wire [3:0] _GEN_26; // @[iomanager.scala 78:57:@755.4]
  wire [63:0] _GEN_27; // @[iomanager.scala 78:57:@755.4]
  wire [1:0] _GEN_28; // @[iomanager.scala 78:57:@755.4]
  wire  _T_111; // @[iomanager.scala 103:17:@801.4]
  wire  _T_113; // @[iomanager.scala 103:30:@803.4]
  wire  _T_114; // @[iomanager.scala 103:66:@804.4]
  wire  _T_115; // @[iomanager.scala 103:54:@805.4]
  wire  _T_116; // @[iomanager.scala 103:91:@806.4]
  wire  _T_117; // @[iomanager.scala 103:79:@807.4]
  wire  _T_119; // @[iomanager.scala 13:43:@810.6]
  wire [63:0] _GEN_33; // @[iomanager.scala 104:30:@812.6]
  wire [3:0] _GEN_34; // @[iomanager.scala 104:30:@812.6]
  wire [63:0] _GEN_35; // @[iomanager.scala 104:30:@812.6]
  wire [1:0] _GEN_36; // @[iomanager.scala 104:30:@812.6]
  wire  _GEN_37; // @[iomanager.scala 104:30:@812.6]
  wire [1:0] _GEN_41; // @[iomanager.scala 103:105:@808.4]
  wire  _GEN_43; // @[iomanager.scala 98:15:@797.12]
  wire  _GEN_44; // @[iomanager.scala 98:15:@797.12]
  wire  _GEN_45; // @[iomanager.scala 98:15:@797.12]
  wire  _GEN_46; // @[iomanager.scala 98:15:@797.12]
  wire  _GEN_47; // @[iomanager.scala 109:19:@823.10]
  wire  _GEN_48; // @[iomanager.scala 109:19:@823.10]
  assign _T_71 = 2'h1 == ifWait; // @[Conditional.scala 37:30:@720.4]
  assign _T_72 = 2'h2 == ifWait; // @[Conditional.scala 37:30:@726.6]
  assign _GEN_0 = _T_72 ? io_serial_out_rdata : 64'h0; // @[Conditional.scala 39:67:@727.6]
  assign _GEN_1 = _T_72 ? io_serial_out_ready : 1'h0; // @[Conditional.scala 39:67:@727.6]
  assign _GEN_3 = _T_71 ? io_mem_out_ready : _GEN_1; // @[Conditional.scala 40:58:@721.4]
  assign _T_73 = 2'h1 == memWait; // @[Conditional.scala 37:30:@731.4]
  assign _T_74 = 2'h2 == memWait; // @[Conditional.scala 37:30:@737.6]
  assign _GEN_4 = _T_74 ? io_serial_out_rdata : 64'h0; // @[Conditional.scala 39:67:@738.6]
  assign _GEN_5 = _T_74 ? io_serial_out_ready : 1'h0; // @[Conditional.scala 39:67:@738.6]
  assign _GEN_7 = _T_73 ? io_mem_out_ready : _GEN_5; // @[Conditional.scala 40:58:@732.4]
  assign _T_75 = ifWait != 2'h0; // @[iomanager.scala 73:26:@742.4]
  assign _T_77 = io_mem_if_ready == 1'h0; // @[iomanager.scala 73:42:@743.4]
  assign _T_78 = _T_75 & _T_77; // @[iomanager.scala 73:39:@744.4]
  assign _T_79 = _T_78 ? ifWait : 2'h0; // @[iomanager.scala 73:18:@745.4]
  assign _T_80 = memWait != 2'h0; // @[iomanager.scala 74:28:@747.4]
  assign _T_82 = io_mem_mem_ready == 1'h0; // @[iomanager.scala 74:44:@748.4]
  assign _T_83 = _T_80 & _T_82; // @[iomanager.scala 74:41:@749.4]
  assign _T_84 = _T_83 ? memWait : 2'h0; // @[iomanager.scala 74:19:@750.4]
  assign _T_85 = memWait == 2'h0; // @[iomanager.scala 78:18:@752.4]
  assign _T_86 = io_mem_mem_mode != 4'hf; // @[iomanager.scala 78:43:@753.4]
  assign _T_87 = _T_85 & _T_86; // @[iomanager.scala 78:31:@754.4]
  assign _T_93 = io_mem_mem_addr < 64'h800000; // @[iomanager.scala 13:43:@757.6]
  assign _T_95 = io_mem_mem_mode[3]; // @[memoryCtrl.scala 21:37:@763.8]
  assign _T_97 = _T_95 == 1'h0; // @[memoryCtrl.scala 21:34:@764.8]
  assign _GEN_8 = _T_97 ? 2'h0 : 2'h1; // @[iomanager.scala 81:38:@765.8]
  assign _T_100 = io_mem_mem_addr >= 64'h10000000; // @[iomanager.scala 14:25:@775.8]
  assign _T_101 = io_mem_mem_addr < 64'h10000008; // @[iomanager.scala 14:49:@776.8]
  assign _T_102 = _T_100 & _T_101; // @[iomanager.scala 14:41:@777.8]
  assign _GEN_10 = _T_97 ? 2'h0 : 2'h2; // @[iomanager.scala 90:38:@784.10]
  assign _T_110 = reset == 1'h0; // @[iomanager.scala 98:15:@795.10]
  assign _GEN_12 = _T_102 ? io_mem_mem_wdata : 64'h0; // @[iomanager.scala 88:37:@778.8]
  assign _GEN_13 = _T_102 ? io_mem_mem_mode : 4'hf; // @[iomanager.scala 88:37:@778.8]
  assign _GEN_14 = _T_102 ? io_mem_mem_addr : 64'h0; // @[iomanager.scala 88:37:@778.8]
  assign _GEN_15 = _T_102 ? _GEN_10 : _T_84; // @[iomanager.scala 88:37:@778.8]
  assign _GEN_16 = _T_102 ? _T_97 : _GEN_7; // @[iomanager.scala 88:37:@778.8]
  assign _GEN_17 = _T_93 ? io_mem_mem_wdata : 64'h0; // @[iomanager.scala 79:28:@759.6]
  assign _GEN_18 = _T_93 ? io_mem_mem_mode : 4'hf; // @[iomanager.scala 79:28:@759.6]
  assign _GEN_19 = _T_93 ? io_mem_mem_addr : 64'h0; // @[iomanager.scala 79:28:@759.6]
  assign _GEN_20 = _T_93 ? _GEN_8 : _GEN_15; // @[iomanager.scala 79:28:@759.6]
  assign _GEN_21 = _T_93 ? _T_97 : _GEN_16; // @[iomanager.scala 79:28:@759.6]
  assign _GEN_22 = _T_93 ? 64'h0 : _GEN_12; // @[iomanager.scala 79:28:@759.6]
  assign _GEN_23 = _T_93 ? 4'hf : _GEN_13; // @[iomanager.scala 79:28:@759.6]
  assign _GEN_24 = _T_93 ? 64'h0 : _GEN_14; // @[iomanager.scala 79:28:@759.6]
  assign _GEN_25 = _T_87 ? _GEN_17 : 64'h0; // @[iomanager.scala 78:57:@755.4]
  assign _GEN_26 = _T_87 ? _GEN_18 : 4'hf; // @[iomanager.scala 78:57:@755.4]
  assign _GEN_27 = _T_87 ? _GEN_19 : 64'h0; // @[iomanager.scala 78:57:@755.4]
  assign _GEN_28 = _T_87 ? _GEN_20 : _T_84; // @[iomanager.scala 78:57:@755.4]
  assign _T_111 = ifWait == 2'h0; // @[iomanager.scala 103:17:@801.4]
  assign _T_113 = _T_111 & _T_85; // @[iomanager.scala 103:30:@803.4]
  assign _T_114 = io_mem_mem_mode == 4'hf; // @[iomanager.scala 103:66:@804.4]
  assign _T_115 = _T_113 & _T_114; // @[iomanager.scala 103:54:@805.4]
  assign _T_116 = io_mem_if_mode != 4'hf; // @[iomanager.scala 103:91:@806.4]
  assign _T_117 = _T_115 & _T_116; // @[iomanager.scala 103:79:@807.4]
  assign _T_119 = io_mem_if_addr < 64'h800000; // @[iomanager.scala 13:43:@810.6]
  assign _GEN_33 = _T_119 ? 64'h0 : _GEN_25; // @[iomanager.scala 104:30:@812.6]
  assign _GEN_34 = _T_119 ? io_mem_if_mode : _GEN_26; // @[iomanager.scala 104:30:@812.6]
  assign _GEN_35 = _T_119 ? io_mem_if_addr : _GEN_27; // @[iomanager.scala 104:30:@812.6]
  assign _GEN_36 = _T_119 ? 2'h1 : _T_79; // @[iomanager.scala 104:30:@812.6]
  assign _GEN_37 = _T_119 ? 1'h0 : _GEN_3; // @[iomanager.scala 104:30:@812.6]
  assign _GEN_41 = _T_117 ? _GEN_36 : _T_79; // @[iomanager.scala 103:105:@808.4]
  assign io_mem_if_ready = _T_117 ? _GEN_37 : _GEN_3; // @[iomanager.scala 40:16:@706.4 iomanager.scala 56:18:@723.6 iomanager.scala 56:18:@729.8 iomanager.scala 107:23:@817.8]
  assign io_mem_if_rdata = _T_71 ? io_mem_out_rdata : _GEN_0; // @[iomanager.scala 40:16:@704.4 iomanager.scala 55:18:@722.6 iomanager.scala 55:18:@728.8]
  assign io_mem_mem_ready = _T_87 ? _GEN_21 : _GEN_7; // @[iomanager.scala 39:16:@701.4 iomanager.scala 56:18:@734.6 iomanager.scala 56:18:@740.8 iomanager.scala 83:23:@767.10 iomanager.scala 86:23:@771.10 iomanager.scala 92:23:@786.12 iomanager.scala 95:23:@790.12]
  assign io_mem_mem_rdata = _T_73 ? io_mem_out_rdata : _GEN_4; // @[iomanager.scala 39:16:@699.4 iomanager.scala 55:18:@733.6 iomanager.scala 55:18:@739.8]
  assign io_mem_out_mode = _T_117 ? _GEN_34 : _GEN_26; // @[iomanager.scala 41:20:@712.4 iomanager.scala 61:20:@761.8 iomanager.scala 61:20:@814.8]
  assign io_mem_out_addr = _T_117 ? _GEN_35 : _GEN_27; // @[iomanager.scala 41:20:@710.4 iomanager.scala 62:20:@762.8 iomanager.scala 62:20:@815.8]
  assign io_mem_out_wdata = _T_117 ? _GEN_33 : _GEN_25; // @[iomanager.scala 41:20:@708.4 iomanager.scala 60:20:@760.8 iomanager.scala 60:20:@813.8]
  assign io_serial_out_mode = _T_87 ? _GEN_23 : 4'hf; // @[iomanager.scala 42:20:@717.4 iomanager.scala 61:20:@780.10]
  assign io_serial_out_addr = _T_87 ? _GEN_24 : 64'h0; // @[iomanager.scala 42:20:@715.4 iomanager.scala 62:20:@781.10]
  assign io_serial_out_wdata = _T_87 ? _GEN_22 : 64'h0; // @[iomanager.scala 42:20:@713.4 iomanager.scala 60:20:@779.10]
  assign _GEN_43 = _T_93 == 1'h0; // @[iomanager.scala 98:15:@797.12]
  assign _GEN_44 = _T_87 & _GEN_43; // @[iomanager.scala 98:15:@797.12]
  assign _GEN_45 = _T_102 == 1'h0; // @[iomanager.scala 98:15:@797.12]
  assign _GEN_46 = _GEN_44 & _GEN_45; // @[iomanager.scala 98:15:@797.12]
  assign _GEN_47 = _T_119 == 1'h0; // @[iomanager.scala 109:19:@823.10]
  assign _GEN_48 = _T_117 & _GEN_47; // @[iomanager.scala 109:19:@823.10]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  ifWait = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  memWait = _RAND_1[1:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      ifWait <= 2'h0;
    end else begin
      if (_T_117) begin
        if (_T_119) begin
          ifWait <= 2'h1;
        end else begin
          if (!(_T_78)) begin
            ifWait <= 2'h0;
          end
        end
      end else begin
        if (!(_T_78)) begin
          ifWait <= 2'h0;
        end
      end
    end
    if (reset) begin
      memWait <= 2'h0;
    end else begin
      if (_T_87) begin
        if (_T_93) begin
          if (_T_97) begin
            memWait <= 2'h0;
          end else begin
            memWait <= 2'h1;
          end
        end else begin
          if (_T_102) begin
            if (_T_97) begin
              memWait <= 2'h0;
            end else begin
              memWait <= 2'h2;
            end
          end else begin
            if (!(_T_83)) begin
              memWait <= 2'h0;
            end
          end
        end
      end else begin
        if (!(_T_83)) begin
          memWait <= 2'h0;
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_46 & _T_110) begin
          $fwrite(32'h80000002,"[IO] MEM access invalid address: %x\n",io_mem_mem_addr); // @[iomanager.scala 98:15:@797.12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_48 & _T_110) begin
          $fwrite(32'h80000002,"[IO] IF access invalid address: %x\n",io_mem_if_addr); // @[iomanager.scala 109:19:@823.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module IF_ID( // @[:@828.2]
  input         clock, // @[:@829.4]
  input         reset, // @[:@830.4]
  input         io_en, // @[:@831.4]
  input         io_pass, // @[:@831.4]
  input  [31:0] io_insi, // @[:@831.4]
  input  [63:0] io_pci, // @[:@831.4]
  input  [63:0] io_insci, // @[:@831.4]
  input  [63:0] io_icdi, // @[:@831.4]
  input         io_lastloadin_valid, // @[:@831.4]
  input  [4:0]  io_lastloadin_index, // @[:@831.4]
  output [31:0] io_inso, // @[:@831.4]
  output [63:0] io_pco, // @[:@831.4]
  output [63:0] io_insco, // @[:@831.4]
  output [63:0] io_icdo, // @[:@831.4]
  output        io_lastloadout_valid, // @[:@831.4]
  output [4:0]  io_lastloadout_index // @[:@831.4]
);
  reg [31:0] ins; // @[if_id.scala 24:23:@833.4]
  reg [31:0] _RAND_0;
  reg [63:0] pc; // @[if_id.scala 26:23:@835.4]
  reg [63:0] _RAND_1;
  reg [63:0] insc; // @[if_id.scala 27:23:@836.4]
  reg [63:0] _RAND_2;
  reg [63:0] icd; // @[if_id.scala 28:23:@838.4]
  reg [63:0] _RAND_3;
  reg  lastload_valid; // @[if_id.scala 29:35:@839.4]
  reg [31:0] _RAND_4;
  reg [4:0] lastload_index; // @[if_id.scala 30:35:@840.4]
  reg [31:0] _RAND_5;
  wire  _T_53; // @[if_id.scala 39:17:@847.4]
  wire [31:0] _GEN_0; // @[if_id.scala 39:29:@848.4]
  wire [63:0] _GEN_1; // @[if_id.scala 39:29:@848.4]
  wire [63:0] _GEN_2; // @[if_id.scala 39:29:@848.4]
  wire [63:0] _GEN_3; // @[if_id.scala 39:29:@848.4]
  wire  _GEN_4; // @[if_id.scala 39:29:@848.4]
  wire [4:0] _GEN_5; // @[if_id.scala 39:29:@848.4]
  assign _T_53 = io_en & io_pass; // @[if_id.scala 39:17:@847.4]
  assign _GEN_0 = _T_53 ? io_insi : ins; // @[if_id.scala 39:29:@848.4]
  assign _GEN_1 = _T_53 ? io_pci : pc; // @[if_id.scala 39:29:@848.4]
  assign _GEN_2 = _T_53 ? io_insci : insc; // @[if_id.scala 39:29:@848.4]
  assign _GEN_3 = _T_53 ? io_icdi : icd; // @[if_id.scala 39:29:@848.4]
  assign _GEN_4 = _T_53 ? io_lastloadin_valid : lastload_valid; // @[if_id.scala 39:29:@848.4]
  assign _GEN_5 = _T_53 ? io_lastloadin_index : lastload_index; // @[if_id.scala 39:29:@848.4]
  assign io_inso = ins; // @[if_id.scala 32:14:@841.4]
  assign io_pco = pc; // @[if_id.scala 33:14:@842.4]
  assign io_insco = insc; // @[if_id.scala 34:14:@843.4]
  assign io_icdo = icd; // @[if_id.scala 35:14:@844.4]
  assign io_lastloadout_valid = lastload_valid; // @[if_id.scala 36:28:@845.4]
  assign io_lastloadout_index = lastload_index; // @[if_id.scala 37:28:@846.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  ins = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{`RANDOM}};
  pc = _RAND_1[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {2{`RANDOM}};
  insc = _RAND_2[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {2{`RANDOM}};
  icd = _RAND_3[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  lastload_valid = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  lastload_index = _RAND_5[4:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      ins <= 32'h0;
    end else begin
      if (_T_53) begin
        ins <= io_insi;
      end
    end
    if (reset) begin
      pc <= 64'hffc;
    end else begin
      if (_T_53) begin
        pc <= io_pci;
      end
    end
    if (reset) begin
      insc <= 64'h0;
    end else begin
      if (_T_53) begin
        insc <= io_insci;
      end
    end
    if (reset) begin
      icd <= 64'hffffffffffffffff;
    end else begin
      if (_T_53) begin
        icd <= io_icdi;
      end
    end
    if (reset) begin
      lastload_valid <= 1'h0;
    end else begin
      if (_T_53) begin
        lastload_valid <= io_lastloadin_valid;
      end
    end
    if (reset) begin
      lastload_index <= 5'h0;
    end else begin
      if (_T_53) begin
        lastload_index <= io_lastloadin_index;
      end
    end
  end
endmodule
module ID_EX( // @[:@857.2]
  input         clock, // @[:@858.4]
  input         reset, // @[:@859.4]
  input         io_en, // @[:@860.4]
  input         io_bid, // @[:@860.4]
  input         io_bex, // @[:@860.4]
  input         io_pass, // @[:@860.4]
  input  [63:0] io_immi, // @[:@860.4]
  input  [3:0]  io_ALUOpi, // @[:@860.4]
  input  [3:0]  io_exeti, // @[:@860.4]
  input  [63:0] io_pci, // @[:@860.4]
  input  [3:0]  io_lsmi, // @[:@860.4]
  input         io_op32i, // @[:@860.4]
  input         io_csr_wb_i_valid, // @[:@860.4]
  input  [11:0] io_csr_wb_i_csr_idx, // @[:@860.4]
  input  [63:0] io_csr_wb_i_csr_data, // @[:@860.4]
  input         io_dregi_rs2_valid, // @[:@860.4]
  input  [63:0] io_dregi_rs1_value, // @[:@860.4]
  input  [63:0] io_dregi_rs2_value, // @[:@860.4]
  input         io_dregi_rd_valid, // @[:@860.4]
  input  [4:0]  io_dregi_rd_index, // @[:@860.4]
  output [63:0] io_immo, // @[:@860.4]
  output [3:0]  io_ALUOpo, // @[:@860.4]
  output [3:0]  io_exeto, // @[:@860.4]
  output [63:0] io_pco, // @[:@860.4]
  output [3:0]  io_lsmo, // @[:@860.4]
  output        io_op32o, // @[:@860.4]
  output        io_csr_wb_o_valid, // @[:@860.4]
  output [11:0] io_csr_wb_o_csr_idx, // @[:@860.4]
  output [63:0] io_csr_wb_o_csr_data, // @[:@860.4]
  output        io_drego_rs2_valid, // @[:@860.4]
  output [63:0] io_drego_rs1_value, // @[:@860.4]
  output [63:0] io_drego_rs2_value, // @[:@860.4]
  output        io_drego_rd_valid, // @[:@860.4]
  output [4:0]  io_drego_rd_index // @[:@860.4]
);
  reg [63:0] imm; // @[id_ex.scala 35:24:@862.4]
  reg [63:0] _RAND_0;
  reg [3:0] ALUOp; // @[id_ex.scala 36:24:@863.4]
  reg [31:0] _RAND_1;
  reg [3:0] exet; // @[id_ex.scala 37:24:@864.4]
  reg [31:0] _RAND_2;
  reg [63:0] pc; // @[id_ex.scala 38:24:@865.4]
  reg [63:0] _RAND_3;
  reg  regInfo_rs2_valid; // @[id_ex.scala 39:26:@881.4]
  reg [31:0] _RAND_4;
  reg [63:0] regInfo_rs1_value; // @[id_ex.scala 39:26:@881.4]
  reg [63:0] _RAND_5;
  reg [63:0] regInfo_rs2_value; // @[id_ex.scala 39:26:@881.4]
  reg [63:0] _RAND_6;
  reg  regInfo_rd_valid; // @[id_ex.scala 39:26:@881.4]
  reg [31:0] _RAND_7;
  reg [4:0] regInfo_rd_index; // @[id_ex.scala 39:26:@881.4]
  reg [31:0] _RAND_8;
  reg [3:0] lsm; // @[id_ex.scala 40:24:@882.4]
  reg [31:0] _RAND_9;
  reg  op32; // @[id_ex.scala 42:24:@884.4]
  reg [31:0] _RAND_10;
  wire  bubble; // @[id_ex.scala 44:25:@885.4]
  wire [63:0] bm; // @[id_ex.scala 45:21:@887.4]
  reg  csr_wb_valid; // @[id_ex.scala 47:26:@897.4]
  reg [31:0] _RAND_11;
  reg [11:0] csr_wb_csr_idx; // @[id_ex.scala 47:26:@897.4]
  reg [31:0] _RAND_12;
  reg [63:0] csr_wb_csr_data; // @[id_ex.scala 47:26:@897.4]
  reg [63:0] _RAND_13;
  wire  _T_184; // @[id_ex.scala 59:17:@914.4]
  wire [63:0] _T_185; // @[id_ex.scala 60:28:@916.6]
  wire [3:0] _T_186; // @[id_ex.scala 61:32:@918.6]
  wire [3:0] _T_187; // @[id_ex.scala 61:28:@919.6]
  wire [3:0] _T_189; // @[id_ex.scala 62:28:@922.6]
  wire [63:0] _T_190; // @[id_ex.scala 63:28:@924.6]
  wire  _T_191; // @[id_ex.scala 64:26:@926.6]
  wire  _T_222_rs2_valid; // @[id_ex.scala 64:23:@942.6]
  wire [63:0] _T_222_rs1_value; // @[id_ex.scala 64:23:@942.6]
  wire [63:0] _T_222_rs2_value; // @[id_ex.scala 64:23:@942.6]
  wire  _T_222_rd_valid; // @[id_ex.scala 64:23:@942.6]
  wire [4:0] _T_222_rd_index; // @[id_ex.scala 64:23:@942.6]
  wire [3:0] _T_229; // @[id_ex.scala 65:21:@949.6]
  wire  _T_233; // @[id_ex.scala 67:27:@955.6]
  wire [63:0] _GEN_0; // @[id_ex.scala 59:29:@915.4]
  wire [3:0] _GEN_1; // @[id_ex.scala 59:29:@915.4]
  wire [3:0] _GEN_2; // @[id_ex.scala 59:29:@915.4]
  wire [63:0] _GEN_3; // @[id_ex.scala 59:29:@915.4]
  wire [4:0] _GEN_4; // @[id_ex.scala 59:29:@915.4]
  wire  _GEN_5; // @[id_ex.scala 59:29:@915.4]
  wire [63:0] _GEN_6; // @[id_ex.scala 59:29:@915.4]
  wire [63:0] _GEN_7; // @[id_ex.scala 59:29:@915.4]
  wire  _GEN_8; // @[id_ex.scala 59:29:@915.4]
  wire [3:0] _GEN_10; // @[id_ex.scala 59:29:@915.4]
  wire  _GEN_12; // @[id_ex.scala 59:29:@915.4]
  wire [63:0] _GEN_13; // @[id_ex.scala 59:29:@915.4]
  wire [11:0] _GEN_14; // @[id_ex.scala 59:29:@915.4]
  wire  _GEN_15; // @[id_ex.scala 59:29:@915.4]
  assign bubble = io_bid | io_bex; // @[id_ex.scala 44:25:@885.4]
  assign bm = bubble ? 64'h0 : 64'hffffffffffffffff; // @[id_ex.scala 45:21:@887.4]
  assign _T_184 = io_en & io_pass; // @[id_ex.scala 59:17:@914.4]
  assign _T_185 = io_immi & bm; // @[id_ex.scala 60:28:@916.6]
  assign _T_186 = bm[3:0]; // @[id_ex.scala 61:32:@918.6]
  assign _T_187 = io_ALUOpi & _T_186; // @[id_ex.scala 61:28:@919.6]
  assign _T_189 = io_exeti & _T_186; // @[id_ex.scala 62:28:@922.6]
  assign _T_190 = io_pci & bm; // @[id_ex.scala 63:28:@924.6]
  assign _T_191 = bm[0]; // @[id_ex.scala 64:26:@926.6]
  assign _T_222_rs2_valid = _T_191 ? io_dregi_rs2_valid : 1'h0; // @[id_ex.scala 64:23:@942.6]
  assign _T_222_rs1_value = _T_191 ? io_dregi_rs1_value : 64'h0; // @[id_ex.scala 64:23:@942.6]
  assign _T_222_rs2_value = _T_191 ? io_dregi_rs2_value : 64'h0; // @[id_ex.scala 64:23:@942.6]
  assign _T_222_rd_valid = _T_191 ? io_dregi_rd_valid : 1'h0; // @[id_ex.scala 64:23:@942.6]
  assign _T_222_rd_index = _T_191 ? io_dregi_rd_index : 5'h0; // @[id_ex.scala 64:23:@942.6]
  assign _T_229 = bubble ? 4'hf : io_lsmi; // @[id_ex.scala 65:21:@949.6]
  assign _T_233 = io_op32i & _T_191; // @[id_ex.scala 67:27:@955.6]
  assign _GEN_0 = _T_184 ? _T_185 : imm; // @[id_ex.scala 59:29:@915.4]
  assign _GEN_1 = _T_184 ? _T_187 : ALUOp; // @[id_ex.scala 59:29:@915.4]
  assign _GEN_2 = _T_184 ? _T_189 : exet; // @[id_ex.scala 59:29:@915.4]
  assign _GEN_3 = _T_184 ? _T_190 : pc; // @[id_ex.scala 59:29:@915.4]
  assign _GEN_4 = _T_184 ? _T_222_rd_index : regInfo_rd_index; // @[id_ex.scala 59:29:@915.4]
  assign _GEN_5 = _T_184 ? _T_222_rd_valid : regInfo_rd_valid; // @[id_ex.scala 59:29:@915.4]
  assign _GEN_6 = _T_184 ? _T_222_rs2_value : regInfo_rs2_value; // @[id_ex.scala 59:29:@915.4]
  assign _GEN_7 = _T_184 ? _T_222_rs1_value : regInfo_rs1_value; // @[id_ex.scala 59:29:@915.4]
  assign _GEN_8 = _T_184 ? _T_222_rs2_valid : regInfo_rs2_valid; // @[id_ex.scala 59:29:@915.4]
  assign _GEN_10 = _T_184 ? _T_229 : lsm; // @[id_ex.scala 59:29:@915.4]
  assign _GEN_12 = _T_184 ? _T_233 : op32; // @[id_ex.scala 59:29:@915.4]
  assign _GEN_13 = _T_184 ? io_csr_wb_i_csr_data : csr_wb_csr_data; // @[id_ex.scala 59:29:@915.4]
  assign _GEN_14 = _T_184 ? io_csr_wb_i_csr_idx : csr_wb_csr_idx; // @[id_ex.scala 59:29:@915.4]
  assign _GEN_15 = _T_184 ? io_csr_wb_i_valid : csr_wb_valid; // @[id_ex.scala 59:29:@915.4]
  assign io_immo = imm; // @[id_ex.scala 49:15:@898.4]
  assign io_ALUOpo = ALUOp; // @[id_ex.scala 50:15:@899.4]
  assign io_exeto = exet; // @[id_ex.scala 51:15:@900.4]
  assign io_pco = pc; // @[id_ex.scala 52:15:@901.4]
  assign io_lsmo = lsm; // @[id_ex.scala 54:15:@908.4]
  assign io_op32o = op32; // @[id_ex.scala 56:15:@910.4]
  assign io_csr_wb_o_valid = csr_wb_valid; // @[id_ex.scala 57:18:@913.4]
  assign io_csr_wb_o_csr_idx = csr_wb_csr_idx; // @[id_ex.scala 57:18:@912.4]
  assign io_csr_wb_o_csr_data = csr_wb_csr_data; // @[id_ex.scala 57:18:@911.4]
  assign io_drego_rs2_valid = regInfo_rs2_valid; // @[id_ex.scala 53:14:@906.4]
  assign io_drego_rs1_value = regInfo_rs1_value; // @[id_ex.scala 53:14:@905.4]
  assign io_drego_rs2_value = regInfo_rs2_value; // @[id_ex.scala 53:14:@904.4]
  assign io_drego_rd_valid = regInfo_rd_valid; // @[id_ex.scala 53:14:@903.4]
  assign io_drego_rd_index = regInfo_rd_index; // @[id_ex.scala 53:14:@902.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  imm = _RAND_0[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ALUOp = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  exet = _RAND_2[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {2{`RANDOM}};
  pc = _RAND_3[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  regInfo_rs2_valid = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {2{`RANDOM}};
  regInfo_rs1_value = _RAND_5[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {2{`RANDOM}};
  regInfo_rs2_value = _RAND_6[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  regInfo_rd_valid = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  regInfo_rd_index = _RAND_8[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  lsm = _RAND_9[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  op32 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  csr_wb_valid = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  csr_wb_csr_idx = _RAND_12[11:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {2{`RANDOM}};
  csr_wb_csr_data = _RAND_13[63:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      imm <= 64'h0;
    end else begin
      if (_T_184) begin
        imm <= _T_185;
      end
    end
    if (reset) begin
      ALUOp <= 4'h0;
    end else begin
      if (_T_184) begin
        ALUOp <= _T_187;
      end
    end
    if (reset) begin
      exet <= 4'h0;
    end else begin
      if (_T_184) begin
        exet <= _T_189;
      end
    end
    if (reset) begin
      pc <= 64'h0;
    end else begin
      if (_T_184) begin
        pc <= _T_190;
      end
    end
    if (reset) begin
      regInfo_rs2_valid <= 1'h0;
    end else begin
      if (_T_184) begin
        if (_T_191) begin
          regInfo_rs2_valid <= io_dregi_rs2_valid;
        end else begin
          regInfo_rs2_valid <= 1'h0;
        end
      end
    end
    if (reset) begin
      regInfo_rs1_value <= 64'h0;
    end else begin
      if (_T_184) begin
        if (_T_191) begin
          regInfo_rs1_value <= io_dregi_rs1_value;
        end else begin
          regInfo_rs1_value <= 64'h0;
        end
      end
    end
    if (reset) begin
      regInfo_rs2_value <= 64'h0;
    end else begin
      if (_T_184) begin
        if (_T_191) begin
          regInfo_rs2_value <= io_dregi_rs2_value;
        end else begin
          regInfo_rs2_value <= 64'h0;
        end
      end
    end
    if (reset) begin
      regInfo_rd_valid <= 1'h0;
    end else begin
      if (_T_184) begin
        if (_T_191) begin
          regInfo_rd_valid <= io_dregi_rd_valid;
        end else begin
          regInfo_rd_valid <= 1'h0;
        end
      end
    end
    if (reset) begin
      regInfo_rd_index <= 5'h0;
    end else begin
      if (_T_184) begin
        if (_T_191) begin
          regInfo_rd_index <= io_dregi_rd_index;
        end else begin
          regInfo_rd_index <= 5'h0;
        end
      end
    end
    if (reset) begin
      lsm <= 4'hf;
    end else begin
      if (_T_184) begin
        if (bubble) begin
          lsm <= 4'hf;
        end else begin
          lsm <= io_lsmi;
        end
      end
    end
    if (reset) begin
      op32 <= 1'h0;
    end else begin
      if (_T_184) begin
        op32 <= _T_233;
      end
    end
    if (reset) begin
      csr_wb_valid <= 1'h0;
    end else begin
      if (_T_184) begin
        csr_wb_valid <= io_csr_wb_i_valid;
      end
    end
    if (reset) begin
      csr_wb_csr_idx <= 12'h0;
    end else begin
      if (_T_184) begin
        csr_wb_csr_idx <= io_csr_wb_i_csr_idx;
      end
    end
    if (reset) begin
      csr_wb_csr_data <= 64'h0;
    end else begin
      if (_T_184) begin
        csr_wb_csr_data <= io_csr_wb_i_csr_data;
      end
    end
  end
endmodule
module EX_MEM( // @[:@962.2]
  input         clock, // @[:@963.4]
  input         reset, // @[:@964.4]
  input         io_en, // @[:@965.4]
  input         io_pass, // @[:@965.4]
  input         io_nlsi, // @[:@965.4]
  input  [3:0]  io_lsmi, // @[:@965.4]
  input  [63:0] io_addri, // @[:@965.4]
  input  [63:0] io_datai, // @[:@965.4]
  input         io_wregi_wbrv, // @[:@965.4]
  input  [4:0]  io_wregi_wbri, // @[:@965.4]
  input  [63:0] io_wregi_wbrd, // @[:@965.4]
  input         io_csr_wb_i_valid, // @[:@965.4]
  input  [11:0] io_csr_wb_i_csr_idx, // @[:@965.4]
  input  [63:0] io_csr_wb_i_csr_data, // @[:@965.4]
  output        io_nlso, // @[:@965.4]
  output [3:0]  io_lsmo, // @[:@965.4]
  output [63:0] io_addro, // @[:@965.4]
  output [63:0] io_datao, // @[:@965.4]
  output        io_wrego_wbrv, // @[:@965.4]
  output [4:0]  io_wrego_wbri, // @[:@965.4]
  output [63:0] io_wrego_wbrd, // @[:@965.4]
  output        io_csr_wb_o_valid, // @[:@965.4]
  output [11:0] io_csr_wb_o_csr_idx, // @[:@965.4]
  output [63:0] io_csr_wb_o_csr_data // @[:@965.4]
);
  reg  nls; // @[ex_mem.scala 26:23:@967.4]
  reg [31:0] _RAND_0;
  reg  wbrv; // @[ex_mem.scala 27:23:@968.4]
  reg [31:0] _RAND_1;
  reg [63:0] wbrd; // @[ex_mem.scala 28:23:@969.4]
  reg [63:0] _RAND_2;
  reg [4:0] wbri; // @[ex_mem.scala 29:23:@970.4]
  reg [31:0] _RAND_3;
  reg [3:0] lsm; // @[ex_mem.scala 30:23:@971.4]
  reg [31:0] _RAND_4;
  reg [63:0] addr; // @[ex_mem.scala 31:23:@972.4]
  reg [63:0] _RAND_5;
  reg [63:0] data; // @[ex_mem.scala 32:23:@973.4]
  reg [63:0] _RAND_6;
  reg  csr_wb_valid; // @[ex_mem.scala 33:26:@983.4]
  reg [31:0] _RAND_7;
  reg [11:0] csr_wb_csr_idx; // @[ex_mem.scala 33:26:@983.4]
  reg [31:0] _RAND_8;
  reg [63:0] csr_wb_csr_data; // @[ex_mem.scala 33:26:@983.4]
  reg [63:0] _RAND_9;
  wire  _T_104; // @[ex_mem.scala 44:17:@994.4]
  wire  _GEN_0; // @[ex_mem.scala 44:29:@995.4]
  wire [4:0] _GEN_1; // @[ex_mem.scala 44:29:@995.4]
  wire  _GEN_2; // @[ex_mem.scala 44:29:@995.4]
  wire [63:0] _GEN_3; // @[ex_mem.scala 44:29:@995.4]
  wire [3:0] _GEN_4; // @[ex_mem.scala 44:29:@995.4]
  wire [63:0] _GEN_5; // @[ex_mem.scala 44:29:@995.4]
  wire [63:0] _GEN_6; // @[ex_mem.scala 44:29:@995.4]
  wire [63:0] _GEN_7; // @[ex_mem.scala 44:29:@995.4]
  wire [11:0] _GEN_8; // @[ex_mem.scala 44:29:@995.4]
  wire  _GEN_9; // @[ex_mem.scala 44:29:@995.4]
  assign _T_104 = io_en & io_pass; // @[ex_mem.scala 44:17:@994.4]
  assign _GEN_0 = _T_104 ? io_nlsi : nls; // @[ex_mem.scala 44:29:@995.4]
  assign _GEN_1 = _T_104 ? io_wregi_wbri : wbri; // @[ex_mem.scala 44:29:@995.4]
  assign _GEN_2 = _T_104 ? io_wregi_wbrv : wbrv; // @[ex_mem.scala 44:29:@995.4]
  assign _GEN_3 = _T_104 ? io_wregi_wbrd : wbrd; // @[ex_mem.scala 44:29:@995.4]
  assign _GEN_4 = _T_104 ? io_lsmi : lsm; // @[ex_mem.scala 44:29:@995.4]
  assign _GEN_5 = _T_104 ? io_addri : addr; // @[ex_mem.scala 44:29:@995.4]
  assign _GEN_6 = _T_104 ? io_datai : data; // @[ex_mem.scala 44:29:@995.4]
  assign _GEN_7 = _T_104 ? io_csr_wb_i_csr_data : csr_wb_csr_data; // @[ex_mem.scala 44:29:@995.4]
  assign _GEN_8 = _T_104 ? io_csr_wb_i_csr_idx : csr_wb_csr_idx; // @[ex_mem.scala 44:29:@995.4]
  assign _GEN_9 = _T_104 ? io_csr_wb_i_valid : csr_wb_valid; // @[ex_mem.scala 44:29:@995.4]
  assign io_nlso = nls; // @[ex_mem.scala 35:13:@984.4]
  assign io_lsmo = lsm; // @[ex_mem.scala 39:13:@988.4]
  assign io_addro = addr; // @[ex_mem.scala 40:14:@989.4]
  assign io_datao = data; // @[ex_mem.scala 41:14:@990.4]
  assign io_wrego_wbrv = wbrv; // @[ex_mem.scala 37:19:@986.4]
  assign io_wrego_wbri = wbri; // @[ex_mem.scala 38:19:@987.4]
  assign io_wrego_wbrd = wbrd; // @[ex_mem.scala 36:19:@985.4]
  assign io_csr_wb_o_valid = csr_wb_valid; // @[ex_mem.scala 42:18:@993.4]
  assign io_csr_wb_o_csr_idx = csr_wb_csr_idx; // @[ex_mem.scala 42:18:@992.4]
  assign io_csr_wb_o_csr_data = csr_wb_csr_data; // @[ex_mem.scala 42:18:@991.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  nls = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  wbrv = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {2{`RANDOM}};
  wbrd = _RAND_2[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  wbri = _RAND_3[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  lsm = _RAND_4[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {2{`RANDOM}};
  addr = _RAND_5[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {2{`RANDOM}};
  data = _RAND_6[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  csr_wb_valid = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  csr_wb_csr_idx = _RAND_8[11:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {2{`RANDOM}};
  csr_wb_csr_data = _RAND_9[63:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      nls <= 1'h0;
    end else begin
      if (_T_104) begin
        nls <= io_nlsi;
      end
    end
    if (reset) begin
      wbrv <= 1'h0;
    end else begin
      if (_T_104) begin
        wbrv <= io_wregi_wbrv;
      end
    end
    if (reset) begin
      wbrd <= 64'h0;
    end else begin
      if (_T_104) begin
        wbrd <= io_wregi_wbrd;
      end
    end
    if (reset) begin
      wbri <= 5'h0;
    end else begin
      if (_T_104) begin
        wbri <= io_wregi_wbri;
      end
    end
    if (reset) begin
      lsm <= 4'hf;
    end else begin
      if (_T_104) begin
        lsm <= io_lsmi;
      end
    end
    if (reset) begin
      addr <= 64'h0;
    end else begin
      if (_T_104) begin
        addr <= io_addri;
      end
    end
    if (reset) begin
      data <= 64'h0;
    end else begin
      if (_T_104) begin
        data <= io_datai;
      end
    end
    if (reset) begin
      csr_wb_valid <= 1'h0;
    end else begin
      if (_T_104) begin
        csr_wb_valid <= io_csr_wb_i_valid;
      end
    end
    if (reset) begin
      csr_wb_csr_idx <= 12'h0;
    end else begin
      if (_T_104) begin
        csr_wb_csr_idx <= io_csr_wb_i_csr_idx;
      end
    end
    if (reset) begin
      csr_wb_csr_data <= 64'h0;
    end else begin
      if (_T_104) begin
        csr_wb_csr_data <= io_csr_wb_i_csr_data;
      end
    end
  end
endmodule
module MEM_WB( // @[:@1008.2]
  input         clock, // @[:@1009.4]
  input         reset, // @[:@1010.4]
  input         io_en, // @[:@1011.4]
  input         io_pass, // @[:@1011.4]
  input         io_wregi_wbrv, // @[:@1011.4]
  input  [4:0]  io_wregi_wbri, // @[:@1011.4]
  input  [63:0] io_wregi_wbrd, // @[:@1011.4]
  input         io_csr_wb_i_valid, // @[:@1011.4]
  input  [11:0] io_csr_wb_i_csr_idx, // @[:@1011.4]
  input  [63:0] io_csr_wb_i_csr_data, // @[:@1011.4]
  output        io_wrego_wbrv, // @[:@1011.4]
  output [4:0]  io_wrego_wbri, // @[:@1011.4]
  output [63:0] io_wrego_wbrd, // @[:@1011.4]
  output        io_csr_wb_o_valid, // @[:@1011.4]
  output [11:0] io_csr_wb_o_csr_idx, // @[:@1011.4]
  output [63:0] io_csr_wb_o_csr_data // @[:@1011.4]
);
  reg  wbrv; // @[mem_wb.scala 17:23:@1013.4]
  reg [31:0] _RAND_0;
  reg [63:0] wbrd; // @[mem_wb.scala 18:23:@1014.4]
  reg [63:0] _RAND_1;
  reg [4:0] wbri; // @[mem_wb.scala 19:23:@1015.4]
  reg [31:0] _RAND_2;
  reg  csr_wb_valid; // @[mem_wb.scala 20:26:@1025.4]
  reg [31:0] _RAND_3;
  reg [11:0] csr_wb_csr_idx; // @[mem_wb.scala 20:26:@1025.4]
  reg [31:0] _RAND_4;
  reg [63:0] csr_wb_csr_data; // @[mem_wb.scala 20:26:@1025.4]
  reg [63:0] _RAND_5;
  wire  _T_80; // @[mem_wb.scala 27:17:@1032.4]
  wire [4:0] _GEN_0; // @[mem_wb.scala 27:29:@1033.4]
  wire  _GEN_1; // @[mem_wb.scala 27:29:@1033.4]
  wire [63:0] _GEN_2; // @[mem_wb.scala 27:29:@1033.4]
  wire [63:0] _GEN_3; // @[mem_wb.scala 27:29:@1033.4]
  wire [11:0] _GEN_4; // @[mem_wb.scala 27:29:@1033.4]
  wire  _GEN_5; // @[mem_wb.scala 27:29:@1033.4]
  assign _T_80 = io_en & io_pass; // @[mem_wb.scala 27:17:@1032.4]
  assign _GEN_0 = _T_80 ? io_wregi_wbri : wbri; // @[mem_wb.scala 27:29:@1033.4]
  assign _GEN_1 = _T_80 ? io_wregi_wbrv : wbrv; // @[mem_wb.scala 27:29:@1033.4]
  assign _GEN_2 = _T_80 ? io_wregi_wbrd : wbrd; // @[mem_wb.scala 27:29:@1033.4]
  assign _GEN_3 = _T_80 ? io_csr_wb_i_csr_data : csr_wb_csr_data; // @[mem_wb.scala 27:29:@1033.4]
  assign _GEN_4 = _T_80 ? io_csr_wb_i_csr_idx : csr_wb_csr_idx; // @[mem_wb.scala 27:29:@1033.4]
  assign _GEN_5 = _T_80 ? io_csr_wb_i_valid : csr_wb_valid; // @[mem_wb.scala 27:29:@1033.4]
  assign io_wrego_wbrv = wbrv; // @[mem_wb.scala 23:19:@1027.4]
  assign io_wrego_wbri = wbri; // @[mem_wb.scala 24:19:@1028.4]
  assign io_wrego_wbrd = wbrd; // @[mem_wb.scala 22:19:@1026.4]
  assign io_csr_wb_o_valid = csr_wb_valid; // @[mem_wb.scala 25:18:@1031.4]
  assign io_csr_wb_o_csr_idx = csr_wb_csr_idx; // @[mem_wb.scala 25:18:@1030.4]
  assign io_csr_wb_o_csr_data = csr_wb_csr_data; // @[mem_wb.scala 25:18:@1029.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  wbrv = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{`RANDOM}};
  wbrd = _RAND_1[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  wbri = _RAND_2[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  csr_wb_valid = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  csr_wb_csr_idx = _RAND_4[11:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {2{`RANDOM}};
  csr_wb_csr_data = _RAND_5[63:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      wbrv <= 1'h0;
    end else begin
      if (_T_80) begin
        wbrv <= io_wregi_wbrv;
      end
    end
    if (reset) begin
      wbrd <= 64'h0;
    end else begin
      if (_T_80) begin
        wbrd <= io_wregi_wbrd;
      end
    end
    if (reset) begin
      wbri <= 5'h0;
    end else begin
      if (_T_80) begin
        wbri <= io_wregi_wbri;
      end
    end
    if (reset) begin
      csr_wb_valid <= 1'h0;
    end else begin
      if (_T_80) begin
        csr_wb_valid <= io_csr_wb_i_valid;
      end
    end
    if (reset) begin
      csr_wb_csr_idx <= 12'h0;
    end else begin
      if (_T_80) begin
        csr_wb_csr_idx <= io_csr_wb_i_csr_idx;
      end
    end
    if (reset) begin
      csr_wb_csr_data <= 64'h0;
    end else begin
      if (_T_80) begin
        csr_wb_csr_data <= io_csr_wb_i_csr_data;
      end
    end
  end
endmodule
module CSR( // @[:@1042.2]
  input         clock, // @[:@1043.4]
  input         reset, // @[:@1044.4]
  input  [11:0] io_id_addr, // @[:@1045.4]
  output [63:0] io_id_rdata, // @[:@1045.4]
  input         io_wrOp_valid, // @[:@1045.4]
  input  [11:0] io_wrOp_csr_idx, // @[:@1045.4]
  input  [63:0] io_wrOp_csr_data // @[:@1045.4]
);
  reg [63:0] csr [0:1023]; // @[CSR.scala 16:16:@1051.4]
  reg [63:0] _RAND_0;
  wire [63:0] csr__T_69_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_69_addr; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_158_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_158_addr; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_159_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_159_addr; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_184_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_184_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_184_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_184_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_190_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_190_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_190_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_190_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_196_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_196_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_196_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_196_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_202_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_202_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_202_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_202_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_207_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_207_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_207_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_207_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_212_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_212_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_212_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_212_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_217_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_217_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_217_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_217_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_222_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_222_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_222_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_222_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_227_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_227_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_227_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_227_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_232_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_232_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_232_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_232_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_237_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_237_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_237_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_237_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_242_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_242_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_242_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_242_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_247_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_247_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_247_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_247_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_252_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_252_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_252_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_252_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_257_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_257_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_257_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_257_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_262_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_262_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_262_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_262_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_267_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_267_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_267_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_267_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_272_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_272_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_272_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_272_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_277_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_277_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_277_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_277_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_282_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_282_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_282_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_282_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_287_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_287_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_287_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_287_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_292_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_292_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_292_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_292_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_297_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_297_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_297_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_297_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_302_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_302_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_302_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_302_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_307_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_307_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_307_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_307_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_312_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_312_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_312_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_312_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_317_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_317_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_317_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_317_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_322_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_322_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_322_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_322_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_327_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_327_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_327_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_327_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_332_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_332_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_332_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_332_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_337_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_337_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_337_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_337_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_342_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_342_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_342_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_342_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_347_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_347_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_347_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_347_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_352_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_352_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_352_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_352_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_357_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_357_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_357_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_357_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_363_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_363_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_363_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_363_en; // @[CSR.scala 16:16:@1051.4]
  wire [63:0] csr__T_369_data; // @[CSR.scala 16:16:@1051.4]
  wire [9:0] csr__T_369_addr; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_369_mask; // @[CSR.scala 16:16:@1051.4]
  wire  csr__T_369_en; // @[CSR.scala 16:16:@1051.4]
  reg [63:0] mtime; // @[CSR.scala 94:24:@1104.4]
  reg [63:0] _RAND_1;
  wire [64:0] _T_66; // @[CSR.scala 95:18:@1105.4]
  wire [63:0] _T_67; // @[CSR.scala 95:18:@1106.4]
  wire  _T_160; // @[Mux.scala 46:19:@1158.4]
  wire [63:0] _T_161; // @[Mux.scala 46:16:@1159.4]
  wire  _T_162; // @[Mux.scala 46:19:@1160.4]
  wire [63:0] _T_163; // @[Mux.scala 46:16:@1161.4]
  wire  _T_164; // @[Mux.scala 46:19:@1162.4]
  wire [63:0] _T_165; // @[Mux.scala 46:16:@1163.4]
  wire  _T_166; // @[Mux.scala 46:19:@1164.4]
  wire [63:0] _T_167; // @[Mux.scala 46:16:@1165.4]
  wire  _T_168; // @[Mux.scala 46:19:@1166.4]
  wire [63:0] _T_169; // @[Mux.scala 46:16:@1167.4]
  wire  _T_170; // @[Mux.scala 46:19:@1168.4]
  wire [63:0] _T_171; // @[Mux.scala 46:16:@1169.4]
  wire  _T_172; // @[Mux.scala 46:19:@1170.4]
  wire [63:0] _T_173; // @[Mux.scala 46:16:@1171.4]
  wire  _T_174; // @[Mux.scala 46:19:@1172.4]
  wire [63:0] _T_175; // @[Mux.scala 46:16:@1173.4]
  wire  _T_176; // @[Mux.scala 46:19:@1174.4]
  wire [63:0] _T_177; // @[Mux.scala 46:16:@1175.4]
  wire  _T_178; // @[Mux.scala 46:19:@1176.4]
  wire [63:0] _T_179; // @[Mux.scala 46:16:@1177.4]
  wire  _T_180; // @[Mux.scala 46:19:@1178.4]
  wire  _T_182; // @[CSR.scala 118:14:@1183.6]
  wire  _T_187; // @[CSR.scala 120:15:@1188.8]
  wire  _T_188; // @[CSR.scala 118:14:@1193.6]
  wire  _T_194; // @[CSR.scala 118:14:@1203.6]
  wire  _T_200; // @[CSR.scala 118:14:@1213.6]
  wire  _T_206; // @[CSR.scala 118:14:@1223.6]
  wire  _T_211; // @[CSR.scala 118:14:@1233.6]
  wire  _T_216; // @[CSR.scala 118:14:@1243.6]
  wire  _T_221; // @[CSR.scala 118:14:@1253.6]
  wire  _T_226; // @[CSR.scala 118:14:@1263.6]
  wire  _T_231; // @[CSR.scala 118:14:@1273.6]
  wire  _T_236; // @[CSR.scala 118:14:@1283.6]
  wire  _T_241; // @[CSR.scala 118:14:@1293.6]
  wire  _T_246; // @[CSR.scala 118:14:@1303.6]
  wire  _T_251; // @[CSR.scala 118:14:@1313.6]
  wire  _T_256; // @[CSR.scala 118:14:@1323.6]
  wire  _T_261; // @[CSR.scala 118:14:@1333.6]
  wire  _T_266; // @[CSR.scala 118:14:@1343.6]
  wire  _T_271; // @[CSR.scala 118:14:@1353.6]
  wire  _T_276; // @[CSR.scala 118:14:@1363.6]
  wire  _T_281; // @[CSR.scala 118:14:@1373.6]
  wire  _T_286; // @[CSR.scala 118:14:@1383.6]
  wire  _T_291; // @[CSR.scala 118:14:@1393.6]
  wire  _T_296; // @[CSR.scala 118:14:@1403.6]
  wire  _T_301; // @[CSR.scala 118:14:@1413.6]
  wire  _T_306; // @[CSR.scala 118:14:@1423.6]
  wire  _T_311; // @[CSR.scala 118:14:@1433.6]
  wire  _T_316; // @[CSR.scala 118:14:@1443.6]
  wire  _T_321; // @[CSR.scala 118:14:@1453.6]
  wire  _T_326; // @[CSR.scala 118:14:@1463.6]
  wire  _T_331; // @[CSR.scala 118:14:@1473.6]
  wire  _T_336; // @[CSR.scala 118:14:@1483.6]
  wire  _T_341; // @[CSR.scala 118:14:@1493.6]
  wire  _T_346; // @[CSR.scala 118:14:@1503.6]
  wire  _T_351; // @[CSR.scala 118:14:@1513.6]
  wire  _T_356; // @[CSR.scala 118:14:@1523.6]
  wire  _T_361; // @[CSR.scala 118:14:@1533.6]
  wire  _T_367; // @[CSR.scala 118:14:@1543.6]
  wire  _GEN_524; // @[CSR.scala 120:15:@1190.10]
  wire  _GEN_525; // @[CSR.scala 120:15:@1200.10]
  wire  _GEN_526; // @[CSR.scala 120:15:@1210.10]
  wire  _GEN_527; // @[CSR.scala 120:15:@1220.10]
  wire  _GEN_528; // @[CSR.scala 120:15:@1230.10]
  wire  _GEN_529; // @[CSR.scala 120:15:@1240.10]
  wire  _GEN_530; // @[CSR.scala 120:15:@1250.10]
  wire  _GEN_531; // @[CSR.scala 120:15:@1260.10]
  wire  _GEN_532; // @[CSR.scala 120:15:@1270.10]
  wire  _GEN_533; // @[CSR.scala 120:15:@1280.10]
  wire  _GEN_534; // @[CSR.scala 120:15:@1290.10]
  wire  _GEN_535; // @[CSR.scala 120:15:@1300.10]
  wire  _GEN_536; // @[CSR.scala 120:15:@1310.10]
  wire  _GEN_537; // @[CSR.scala 120:15:@1320.10]
  wire  _GEN_538; // @[CSR.scala 120:15:@1330.10]
  wire  _GEN_539; // @[CSR.scala 120:15:@1340.10]
  wire  _GEN_540; // @[CSR.scala 120:15:@1350.10]
  wire  _GEN_541; // @[CSR.scala 120:15:@1360.10]
  wire  _GEN_542; // @[CSR.scala 120:15:@1370.10]
  wire  _GEN_543; // @[CSR.scala 120:15:@1380.10]
  wire  _GEN_544; // @[CSR.scala 120:15:@1390.10]
  wire  _GEN_545; // @[CSR.scala 120:15:@1400.10]
  wire  _GEN_546; // @[CSR.scala 120:15:@1410.10]
  wire  _GEN_547; // @[CSR.scala 120:15:@1420.10]
  wire  _GEN_548; // @[CSR.scala 120:15:@1430.10]
  wire  _GEN_549; // @[CSR.scala 120:15:@1440.10]
  wire  _GEN_550; // @[CSR.scala 120:15:@1450.10]
  wire  _GEN_551; // @[CSR.scala 120:15:@1460.10]
  wire  _GEN_552; // @[CSR.scala 120:15:@1470.10]
  wire  _GEN_553; // @[CSR.scala 120:15:@1480.10]
  wire  _GEN_554; // @[CSR.scala 120:15:@1490.10]
  wire  _GEN_555; // @[CSR.scala 120:15:@1500.10]
  wire  _GEN_556; // @[CSR.scala 120:15:@1510.10]
  wire  _GEN_557; // @[CSR.scala 120:15:@1520.10]
  wire  _GEN_558; // @[CSR.scala 120:15:@1530.10]
  wire  _GEN_559; // @[CSR.scala 120:15:@1540.10]
  wire  _GEN_560; // @[CSR.scala 120:15:@1550.10]
  assign csr__T_69_addr = io_id_addr[9:0];
  assign csr__T_69_data = csr[csr__T_69_addr]; // @[CSR.scala 16:16:@1051.4]
  assign csr__T_158_addr = 10'h304;
  assign csr__T_158_data = csr[csr__T_158_addr]; // @[CSR.scala 16:16:@1051.4]
  assign csr__T_159_addr = 10'h344;
  assign csr__T_159_data = csr[csr__T_159_addr]; // @[CSR.scala 16:16:@1051.4]
  assign csr__T_184_data = io_wrOp_csr_data;
  assign csr__T_184_addr = 10'h311;
  assign csr__T_184_mask = 1'h1;
  assign csr__T_184_en = io_wrOp_valid ? _T_182 : 1'h0;
  assign csr__T_190_data = io_wrOp_csr_data;
  assign csr__T_190_addr = 10'h312;
  assign csr__T_190_mask = 1'h1;
  assign csr__T_190_en = io_wrOp_valid ? _T_188 : 1'h0;
  assign csr__T_196_data = io_wrOp_csr_data;
  assign csr__T_196_addr = 10'h313;
  assign csr__T_196_mask = 1'h1;
  assign csr__T_196_en = io_wrOp_valid ? _T_194 : 1'h0;
  assign csr__T_202_data = io_wrOp_csr_data;
  assign csr__T_202_addr = 10'h314;
  assign csr__T_202_mask = 1'h1;
  assign csr__T_202_en = io_wrOp_valid ? _T_200 : 1'h0;
  assign csr__T_207_data = io_wrOp_csr_data;
  assign csr__T_207_addr = 10'h300;
  assign csr__T_207_mask = 1'h1;
  assign csr__T_207_en = io_wrOp_valid ? _T_206 : 1'h0;
  assign csr__T_212_data = io_wrOp_csr_data;
  assign csr__T_212_addr = 10'h301;
  assign csr__T_212_mask = 1'h1;
  assign csr__T_212_en = io_wrOp_valid ? _T_211 : 1'h0;
  assign csr__T_217_data = io_wrOp_csr_data;
  assign csr__T_217_addr = 10'h302;
  assign csr__T_217_mask = 1'h1;
  assign csr__T_217_en = io_wrOp_valid ? _T_216 : 1'h0;
  assign csr__T_222_data = io_wrOp_csr_data;
  assign csr__T_222_addr = 10'h303;
  assign csr__T_222_mask = 1'h1;
  assign csr__T_222_en = io_wrOp_valid ? _T_221 : 1'h0;
  assign csr__T_227_data = io_wrOp_csr_data;
  assign csr__T_227_addr = 10'h304;
  assign csr__T_227_mask = 1'h1;
  assign csr__T_227_en = io_wrOp_valid ? _T_226 : 1'h0;
  assign csr__T_232_data = io_wrOp_csr_data;
  assign csr__T_232_addr = 10'h305;
  assign csr__T_232_mask = 1'h1;
  assign csr__T_232_en = io_wrOp_valid ? _T_231 : 1'h0;
  assign csr__T_237_data = io_wrOp_csr_data;
  assign csr__T_237_addr = 10'h306;
  assign csr__T_237_mask = 1'h1;
  assign csr__T_237_en = io_wrOp_valid ? _T_236 : 1'h0;
  assign csr__T_242_data = io_wrOp_csr_data;
  assign csr__T_242_addr = 10'h340;
  assign csr__T_242_mask = 1'h1;
  assign csr__T_242_en = io_wrOp_valid ? _T_241 : 1'h0;
  assign csr__T_247_data = io_wrOp_csr_data;
  assign csr__T_247_addr = 10'h341;
  assign csr__T_247_mask = 1'h1;
  assign csr__T_247_en = io_wrOp_valid ? _T_246 : 1'h0;
  assign csr__T_252_data = io_wrOp_csr_data;
  assign csr__T_252_addr = 10'h342;
  assign csr__T_252_mask = 1'h1;
  assign csr__T_252_en = io_wrOp_valid ? _T_251 : 1'h0;
  assign csr__T_257_data = io_wrOp_csr_data;
  assign csr__T_257_addr = 10'h343;
  assign csr__T_257_mask = 1'h1;
  assign csr__T_257_en = io_wrOp_valid ? _T_256 : 1'h0;
  assign csr__T_262_data = io_wrOp_csr_data;
  assign csr__T_262_addr = 10'h344;
  assign csr__T_262_mask = 1'h1;
  assign csr__T_262_en = io_wrOp_valid ? _T_261 : 1'h0;
  assign csr__T_267_data = io_wrOp_csr_data;
  assign csr__T_267_addr = 10'h100;
  assign csr__T_267_mask = 1'h1;
  assign csr__T_267_en = io_wrOp_valid ? _T_266 : 1'h0;
  assign csr__T_272_data = io_wrOp_csr_data;
  assign csr__T_272_addr = 10'h102;
  assign csr__T_272_mask = 1'h1;
  assign csr__T_272_en = io_wrOp_valid ? _T_271 : 1'h0;
  assign csr__T_277_data = io_wrOp_csr_data;
  assign csr__T_277_addr = 10'h103;
  assign csr__T_277_mask = 1'h1;
  assign csr__T_277_en = io_wrOp_valid ? _T_276 : 1'h0;
  assign csr__T_282_data = io_wrOp_csr_data;
  assign csr__T_282_addr = 10'h104;
  assign csr__T_282_mask = 1'h1;
  assign csr__T_282_en = io_wrOp_valid ? _T_281 : 1'h0;
  assign csr__T_287_data = io_wrOp_csr_data;
  assign csr__T_287_addr = 10'h105;
  assign csr__T_287_mask = 1'h1;
  assign csr__T_287_en = io_wrOp_valid ? _T_286 : 1'h0;
  assign csr__T_292_data = io_wrOp_csr_data;
  assign csr__T_292_addr = 10'h106;
  assign csr__T_292_mask = 1'h1;
  assign csr__T_292_en = io_wrOp_valid ? _T_291 : 1'h0;
  assign csr__T_297_data = io_wrOp_csr_data;
  assign csr__T_297_addr = 10'h140;
  assign csr__T_297_mask = 1'h1;
  assign csr__T_297_en = io_wrOp_valid ? _T_296 : 1'h0;
  assign csr__T_302_data = io_wrOp_csr_data;
  assign csr__T_302_addr = 10'h141;
  assign csr__T_302_mask = 1'h1;
  assign csr__T_302_en = io_wrOp_valid ? _T_301 : 1'h0;
  assign csr__T_307_data = io_wrOp_csr_data;
  assign csr__T_307_addr = 10'h142;
  assign csr__T_307_mask = 1'h1;
  assign csr__T_307_en = io_wrOp_valid ? _T_306 : 1'h0;
  assign csr__T_312_data = io_wrOp_csr_data;
  assign csr__T_312_addr = 10'h143;
  assign csr__T_312_mask = 1'h1;
  assign csr__T_312_en = io_wrOp_valid ? _T_311 : 1'h0;
  assign csr__T_317_data = io_wrOp_csr_data;
  assign csr__T_317_addr = 10'h144;
  assign csr__T_317_mask = 1'h1;
  assign csr__T_317_en = io_wrOp_valid ? _T_316 : 1'h0;
  assign csr__T_322_data = io_wrOp_csr_data;
  assign csr__T_322_addr = 10'h180;
  assign csr__T_322_mask = 1'h1;
  assign csr__T_322_en = io_wrOp_valid ? _T_321 : 1'h0;
  assign csr__T_327_data = io_wrOp_csr_data;
  assign csr__T_327_addr = 10'h5;
  assign csr__T_327_mask = 1'h1;
  assign csr__T_327_en = io_wrOp_valid ? _T_326 : 1'h0;
  assign csr__T_332_data = io_wrOp_csr_data;
  assign csr__T_332_addr = 10'h40;
  assign csr__T_332_mask = 1'h1;
  assign csr__T_332_en = io_wrOp_valid ? _T_331 : 1'h0;
  assign csr__T_337_data = io_wrOp_csr_data;
  assign csr__T_337_addr = 10'h41;
  assign csr__T_337_mask = 1'h1;
  assign csr__T_337_en = io_wrOp_valid ? _T_336 : 1'h0;
  assign csr__T_342_data = io_wrOp_csr_data;
  assign csr__T_342_addr = 10'h42;
  assign csr__T_342_mask = 1'h1;
  assign csr__T_342_en = io_wrOp_valid ? _T_341 : 1'h0;
  assign csr__T_347_data = io_wrOp_csr_data;
  assign csr__T_347_addr = 10'h43;
  assign csr__T_347_mask = 1'h1;
  assign csr__T_347_en = io_wrOp_valid ? _T_346 : 1'h0;
  assign csr__T_352_data = io_wrOp_csr_data;
  assign csr__T_352_addr = 10'h44;
  assign csr__T_352_mask = 1'h1;
  assign csr__T_352_en = io_wrOp_valid ? _T_351 : 1'h0;
  assign csr__T_357_data = io_wrOp_csr_data;
  assign csr__T_357_addr = 10'h321;
  assign csr__T_357_mask = 1'h1;
  assign csr__T_357_en = io_wrOp_valid ? _T_356 : 1'h0;
  assign csr__T_363_data = io_wrOp_csr_data;
  assign csr__T_363_addr = 10'h1;
  assign csr__T_363_mask = 1'h1;
  assign csr__T_363_en = io_wrOp_valid ? _T_361 : 1'h0;
  assign csr__T_369_data = io_wrOp_csr_data;
  assign csr__T_369_addr = 10'h0;
  assign csr__T_369_mask = 1'h1;
  assign csr__T_369_en = io_wrOp_valid ? _T_367 : 1'h0;
  assign _T_66 = mtime + 64'h1; // @[CSR.scala 95:18:@1105.4]
  assign _T_67 = mtime + 64'h1; // @[CSR.scala 95:18:@1106.4]
  assign _T_160 = 12'hc00 == io_id_addr; // @[Mux.scala 46:19:@1158.4]
  assign _T_161 = _T_160 ? mtime : csr__T_69_data; // @[Mux.scala 46:16:@1159.4]
  assign _T_162 = 12'hc01 == io_id_addr; // @[Mux.scala 46:19:@1160.4]
  assign _T_163 = _T_162 ? mtime : _T_161; // @[Mux.scala 46:16:@1161.4]
  assign _T_164 = 12'h144 == io_id_addr; // @[Mux.scala 46:19:@1162.4]
  assign _T_165 = _T_164 ? csr__T_159_data : _T_163; // @[Mux.scala 46:16:@1163.4]
  assign _T_166 = 12'h104 == io_id_addr; // @[Mux.scala 46:19:@1164.4]
  assign _T_167 = _T_166 ? csr__T_158_data : _T_165; // @[Mux.scala 46:16:@1165.4]
  assign _T_168 = 12'h100 == io_id_addr; // @[Mux.scala 46:19:@1166.4]
  assign _T_169 = _T_168 ? 64'h0 : _T_167; // @[Mux.scala 46:16:@1167.4]
  assign _T_170 = 12'h300 == io_id_addr; // @[Mux.scala 46:19:@1168.4]
  assign _T_171 = _T_170 ? 64'h0 : _T_169; // @[Mux.scala 46:16:@1169.4]
  assign _T_172 = 12'h301 == io_id_addr; // @[Mux.scala 46:19:@1170.4]
  assign _T_173 = _T_172 ? 64'h0 : _T_171; // @[Mux.scala 46:16:@1171.4]
  assign _T_174 = 12'hf14 == io_id_addr; // @[Mux.scala 46:19:@1172.4]
  assign _T_175 = _T_174 ? 64'h0 : _T_173; // @[Mux.scala 46:16:@1173.4]
  assign _T_176 = 12'hf13 == io_id_addr; // @[Mux.scala 46:19:@1174.4]
  assign _T_177 = _T_176 ? 64'h91d : _T_175; // @[Mux.scala 46:16:@1175.4]
  assign _T_178 = 12'hf12 == io_id_addr; // @[Mux.scala 46:19:@1176.4]
  assign _T_179 = _T_178 ? 64'h8fffffff : _T_177; // @[Mux.scala 46:16:@1177.4]
  assign _T_180 = 12'hf11 == io_id_addr; // @[Mux.scala 46:19:@1178.4]
  assign _T_182 = 12'hf11 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1183.6]
  assign _T_187 = reset == 1'h0; // @[CSR.scala 120:15:@1188.8]
  assign _T_188 = 12'hf12 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1193.6]
  assign _T_194 = 12'hf13 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1203.6]
  assign _T_200 = 12'hf14 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1213.6]
  assign _T_206 = 12'h300 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1223.6]
  assign _T_211 = 12'h301 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1233.6]
  assign _T_216 = 12'h302 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1243.6]
  assign _T_221 = 12'h303 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1253.6]
  assign _T_226 = 12'h304 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1263.6]
  assign _T_231 = 12'h305 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1273.6]
  assign _T_236 = 12'h306 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1283.6]
  assign _T_241 = 12'h340 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1293.6]
  assign _T_246 = 12'h341 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1303.6]
  assign _T_251 = 12'h342 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1313.6]
  assign _T_256 = 12'h343 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1323.6]
  assign _T_261 = 12'h344 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1333.6]
  assign _T_266 = 12'h100 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1343.6]
  assign _T_271 = 12'h102 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1353.6]
  assign _T_276 = 12'h103 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1363.6]
  assign _T_281 = 12'h104 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1373.6]
  assign _T_286 = 12'h105 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1383.6]
  assign _T_291 = 12'h106 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1393.6]
  assign _T_296 = 12'h140 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1403.6]
  assign _T_301 = 12'h141 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1413.6]
  assign _T_306 = 12'h142 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1423.6]
  assign _T_311 = 12'h143 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1433.6]
  assign _T_316 = 12'h144 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1443.6]
  assign _T_321 = 12'h180 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1453.6]
  assign _T_326 = 12'h5 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1463.6]
  assign _T_331 = 12'h40 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1473.6]
  assign _T_336 = 12'h41 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1483.6]
  assign _T_341 = 12'h42 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1493.6]
  assign _T_346 = 12'h43 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1503.6]
  assign _T_351 = 12'h44 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1513.6]
  assign _T_356 = 12'h321 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1523.6]
  assign _T_361 = 12'hc01 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1533.6]
  assign _T_367 = 12'hc00 == io_wrOp_csr_idx; // @[CSR.scala 118:14:@1543.6]
  assign io_id_rdata = _T_180 ? 64'h91d : _T_179; // @[CSR.scala 97:15:@1180.4]
  assign _GEN_524 = io_wrOp_valid & _T_182; // @[CSR.scala 120:15:@1190.10]
  assign _GEN_525 = io_wrOp_valid & _T_188; // @[CSR.scala 120:15:@1200.10]
  assign _GEN_526 = io_wrOp_valid & _T_194; // @[CSR.scala 120:15:@1210.10]
  assign _GEN_527 = io_wrOp_valid & _T_200; // @[CSR.scala 120:15:@1220.10]
  assign _GEN_528 = io_wrOp_valid & _T_206; // @[CSR.scala 120:15:@1230.10]
  assign _GEN_529 = io_wrOp_valid & _T_211; // @[CSR.scala 120:15:@1240.10]
  assign _GEN_530 = io_wrOp_valid & _T_216; // @[CSR.scala 120:15:@1250.10]
  assign _GEN_531 = io_wrOp_valid & _T_221; // @[CSR.scala 120:15:@1260.10]
  assign _GEN_532 = io_wrOp_valid & _T_226; // @[CSR.scala 120:15:@1270.10]
  assign _GEN_533 = io_wrOp_valid & _T_231; // @[CSR.scala 120:15:@1280.10]
  assign _GEN_534 = io_wrOp_valid & _T_236; // @[CSR.scala 120:15:@1290.10]
  assign _GEN_535 = io_wrOp_valid & _T_241; // @[CSR.scala 120:15:@1300.10]
  assign _GEN_536 = io_wrOp_valid & _T_246; // @[CSR.scala 120:15:@1310.10]
  assign _GEN_537 = io_wrOp_valid & _T_251; // @[CSR.scala 120:15:@1320.10]
  assign _GEN_538 = io_wrOp_valid & _T_256; // @[CSR.scala 120:15:@1330.10]
  assign _GEN_539 = io_wrOp_valid & _T_261; // @[CSR.scala 120:15:@1340.10]
  assign _GEN_540 = io_wrOp_valid & _T_266; // @[CSR.scala 120:15:@1350.10]
  assign _GEN_541 = io_wrOp_valid & _T_271; // @[CSR.scala 120:15:@1360.10]
  assign _GEN_542 = io_wrOp_valid & _T_276; // @[CSR.scala 120:15:@1370.10]
  assign _GEN_543 = io_wrOp_valid & _T_281; // @[CSR.scala 120:15:@1380.10]
  assign _GEN_544 = io_wrOp_valid & _T_286; // @[CSR.scala 120:15:@1390.10]
  assign _GEN_545 = io_wrOp_valid & _T_291; // @[CSR.scala 120:15:@1400.10]
  assign _GEN_546 = io_wrOp_valid & _T_296; // @[CSR.scala 120:15:@1410.10]
  assign _GEN_547 = io_wrOp_valid & _T_301; // @[CSR.scala 120:15:@1420.10]
  assign _GEN_548 = io_wrOp_valid & _T_306; // @[CSR.scala 120:15:@1430.10]
  assign _GEN_549 = io_wrOp_valid & _T_311; // @[CSR.scala 120:15:@1440.10]
  assign _GEN_550 = io_wrOp_valid & _T_316; // @[CSR.scala 120:15:@1450.10]
  assign _GEN_551 = io_wrOp_valid & _T_321; // @[CSR.scala 120:15:@1460.10]
  assign _GEN_552 = io_wrOp_valid & _T_326; // @[CSR.scala 120:15:@1470.10]
  assign _GEN_553 = io_wrOp_valid & _T_331; // @[CSR.scala 120:15:@1480.10]
  assign _GEN_554 = io_wrOp_valid & _T_336; // @[CSR.scala 120:15:@1490.10]
  assign _GEN_555 = io_wrOp_valid & _T_341; // @[CSR.scala 120:15:@1500.10]
  assign _GEN_556 = io_wrOp_valid & _T_346; // @[CSR.scala 120:15:@1510.10]
  assign _GEN_557 = io_wrOp_valid & _T_351; // @[CSR.scala 120:15:@1520.10]
  assign _GEN_558 = io_wrOp_valid & _T_356; // @[CSR.scala 120:15:@1530.10]
  assign _GEN_559 = io_wrOp_valid & _T_361; // @[CSR.scala 120:15:@1540.10]
  assign _GEN_560 = io_wrOp_valid & _T_367; // @[CSR.scala 120:15:@1550.10]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  _RAND_0 = {2{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    csr[initvar] = _RAND_0[63:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{`RANDOM}};
  mtime = _RAND_1[63:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(csr__T_184_en & csr__T_184_mask) begin
      csr[csr__T_184_addr] <= csr__T_184_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_190_en & csr__T_190_mask) begin
      csr[csr__T_190_addr] <= csr__T_190_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_196_en & csr__T_196_mask) begin
      csr[csr__T_196_addr] <= csr__T_196_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_202_en & csr__T_202_mask) begin
      csr[csr__T_202_addr] <= csr__T_202_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_207_en & csr__T_207_mask) begin
      csr[csr__T_207_addr] <= csr__T_207_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_212_en & csr__T_212_mask) begin
      csr[csr__T_212_addr] <= csr__T_212_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_217_en & csr__T_217_mask) begin
      csr[csr__T_217_addr] <= csr__T_217_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_222_en & csr__T_222_mask) begin
      csr[csr__T_222_addr] <= csr__T_222_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_227_en & csr__T_227_mask) begin
      csr[csr__T_227_addr] <= csr__T_227_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_232_en & csr__T_232_mask) begin
      csr[csr__T_232_addr] <= csr__T_232_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_237_en & csr__T_237_mask) begin
      csr[csr__T_237_addr] <= csr__T_237_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_242_en & csr__T_242_mask) begin
      csr[csr__T_242_addr] <= csr__T_242_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_247_en & csr__T_247_mask) begin
      csr[csr__T_247_addr] <= csr__T_247_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_252_en & csr__T_252_mask) begin
      csr[csr__T_252_addr] <= csr__T_252_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_257_en & csr__T_257_mask) begin
      csr[csr__T_257_addr] <= csr__T_257_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_262_en & csr__T_262_mask) begin
      csr[csr__T_262_addr] <= csr__T_262_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_267_en & csr__T_267_mask) begin
      csr[csr__T_267_addr] <= csr__T_267_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_272_en & csr__T_272_mask) begin
      csr[csr__T_272_addr] <= csr__T_272_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_277_en & csr__T_277_mask) begin
      csr[csr__T_277_addr] <= csr__T_277_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_282_en & csr__T_282_mask) begin
      csr[csr__T_282_addr] <= csr__T_282_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_287_en & csr__T_287_mask) begin
      csr[csr__T_287_addr] <= csr__T_287_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_292_en & csr__T_292_mask) begin
      csr[csr__T_292_addr] <= csr__T_292_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_297_en & csr__T_297_mask) begin
      csr[csr__T_297_addr] <= csr__T_297_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_302_en & csr__T_302_mask) begin
      csr[csr__T_302_addr] <= csr__T_302_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_307_en & csr__T_307_mask) begin
      csr[csr__T_307_addr] <= csr__T_307_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_312_en & csr__T_312_mask) begin
      csr[csr__T_312_addr] <= csr__T_312_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_317_en & csr__T_317_mask) begin
      csr[csr__T_317_addr] <= csr__T_317_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_322_en & csr__T_322_mask) begin
      csr[csr__T_322_addr] <= csr__T_322_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_327_en & csr__T_327_mask) begin
      csr[csr__T_327_addr] <= csr__T_327_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_332_en & csr__T_332_mask) begin
      csr[csr__T_332_addr] <= csr__T_332_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_337_en & csr__T_337_mask) begin
      csr[csr__T_337_addr] <= csr__T_337_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_342_en & csr__T_342_mask) begin
      csr[csr__T_342_addr] <= csr__T_342_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_347_en & csr__T_347_mask) begin
      csr[csr__T_347_addr] <= csr__T_347_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_352_en & csr__T_352_mask) begin
      csr[csr__T_352_addr] <= csr__T_352_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_357_en & csr__T_357_mask) begin
      csr[csr__T_357_addr] <= csr__T_357_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_363_en & csr__T_363_mask) begin
      csr[csr__T_363_addr] <= csr__T_363_data; // @[CSR.scala 16:16:@1051.4]
    end
    if(csr__T_369_en & csr__T_369_mask) begin
      csr[csr__T_369_addr] <= csr__T_369_data; // @[CSR.scala 16:16:@1051.4]
    end
    if (reset) begin
      mtime <= 64'h0;
    end else begin
      mtime <= _T_67;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_524 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",12'hf11,io_wrOp_csr_data); // @[CSR.scala 120:15:@1190.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_525 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",12'hf12,io_wrOp_csr_data); // @[CSR.scala 120:15:@1200.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_526 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",12'hf13,io_wrOp_csr_data); // @[CSR.scala 120:15:@1210.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_527 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",12'hf14,io_wrOp_csr_data); // @[CSR.scala 120:15:@1220.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_528 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",10'h300,io_wrOp_csr_data); // @[CSR.scala 120:15:@1230.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_529 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",10'h301,io_wrOp_csr_data); // @[CSR.scala 120:15:@1240.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_530 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",10'h302,io_wrOp_csr_data); // @[CSR.scala 120:15:@1250.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_531 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",10'h303,io_wrOp_csr_data); // @[CSR.scala 120:15:@1260.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_532 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",10'h304,io_wrOp_csr_data); // @[CSR.scala 120:15:@1270.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_533 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",10'h305,io_wrOp_csr_data); // @[CSR.scala 120:15:@1280.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_534 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",10'h306,io_wrOp_csr_data); // @[CSR.scala 120:15:@1290.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_535 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",10'h340,io_wrOp_csr_data); // @[CSR.scala 120:15:@1300.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_536 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",10'h341,io_wrOp_csr_data); // @[CSR.scala 120:15:@1310.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_537 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",10'h342,io_wrOp_csr_data); // @[CSR.scala 120:15:@1320.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_538 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",10'h343,io_wrOp_csr_data); // @[CSR.scala 120:15:@1330.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_539 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",10'h344,io_wrOp_csr_data); // @[CSR.scala 120:15:@1340.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_540 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",9'h100,io_wrOp_csr_data); // @[CSR.scala 120:15:@1350.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_541 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",9'h102,io_wrOp_csr_data); // @[CSR.scala 120:15:@1360.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_542 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",9'h103,io_wrOp_csr_data); // @[CSR.scala 120:15:@1370.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_543 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",9'h104,io_wrOp_csr_data); // @[CSR.scala 120:15:@1380.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_544 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",9'h105,io_wrOp_csr_data); // @[CSR.scala 120:15:@1390.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_545 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",9'h106,io_wrOp_csr_data); // @[CSR.scala 120:15:@1400.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_546 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",9'h140,io_wrOp_csr_data); // @[CSR.scala 120:15:@1410.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_547 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",9'h141,io_wrOp_csr_data); // @[CSR.scala 120:15:@1420.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_548 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",9'h142,io_wrOp_csr_data); // @[CSR.scala 120:15:@1430.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_549 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",9'h143,io_wrOp_csr_data); // @[CSR.scala 120:15:@1440.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_550 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",9'h144,io_wrOp_csr_data); // @[CSR.scala 120:15:@1450.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_551 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",9'h180,io_wrOp_csr_data); // @[CSR.scala 120:15:@1460.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_552 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",3'h5,io_wrOp_csr_data); // @[CSR.scala 120:15:@1470.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_553 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",7'h40,io_wrOp_csr_data); // @[CSR.scala 120:15:@1480.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_554 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",7'h41,io_wrOp_csr_data); // @[CSR.scala 120:15:@1490.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_555 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",7'h42,io_wrOp_csr_data); // @[CSR.scala 120:15:@1500.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_556 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",7'h43,io_wrOp_csr_data); // @[CSR.scala 120:15:@1510.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_557 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",7'h44,io_wrOp_csr_data); // @[CSR.scala 120:15:@1520.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_558 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",10'h321,io_wrOp_csr_data); // @[CSR.scala 120:15:@1530.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_559 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",12'hc01,io_wrOp_csr_data); // @[CSR.scala 120:15:@1540.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_560 & _T_187) begin
          $fwrite(32'h80000002,"set csr[%d] = %x\n",12'hc00,io_wrOp_csr_data); // @[CSR.scala 120:15:@1550.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module CPU( // @[:@1555.2]
  input         clock, // @[:@1556.4]
  input         reset, // @[:@1557.4]
  input         io_en, // @[:@1558.4]
  output [3:0]  io_mem_mode, // @[:@1558.4]
  input         io_mem_ready, // @[:@1558.4]
  output [63:0] io_mem_addr, // @[:@1558.4]
  input  [63:0] io_mem_rdata, // @[:@1558.4]
  output [63:0] io_mem_wdata, // @[:@1558.4]
  output [3:0]  io_serial_mode, // @[:@1558.4]
  input         io_serial_ready, // @[:@1558.4]
  output [63:0] io_serial_addr, // @[:@1558.4]
  input  [63:0] io_serial_rdata, // @[:@1558.4]
  output [63:0] io_serial_wdata // @[:@1558.4]
);
  wire  insr_io_jump; // @[cpu.scala 13:22:@1560.4]
  wire [63:0] insr_io_jdest; // @[cpu.scala 13:22:@1560.4]
  wire  insr_io_nls; // @[cpu.scala 13:22:@1560.4]
  wire [63:0] insr_io_lpc; // @[cpu.scala 13:22:@1560.4]
  wire [63:0] insr_io_insp; // @[cpu.scala 13:22:@1560.4]
  wire [63:0] insr_io_inspd; // @[cpu.scala 13:22:@1560.4]
  wire  insr_io_bubble; // @[cpu.scala 13:22:@1560.4]
  wire [31:0] insr_io_ins; // @[cpu.scala 13:22:@1560.4]
  wire [63:0] insr_io_pc; // @[cpu.scala 13:22:@1560.4]
  wire [63:0] insr_io_insn; // @[cpu.scala 13:22:@1560.4]
  wire [63:0] insr_io_insnd; // @[cpu.scala 13:22:@1560.4]
  wire [3:0] insr_io_mmu_mode; // @[cpu.scala 13:22:@1560.4]
  wire  insr_io_mmu_ready; // @[cpu.scala 13:22:@1560.4]
  wire [63:0] insr_io_mmu_addr; // @[cpu.scala 13:22:@1560.4]
  wire [63:0] insr_io_mmu_rdata; // @[cpu.scala 13:22:@1560.4]
  wire [31:0] insd_io_ins; // @[cpu.scala 14:22:@1563.4]
  wire  insd_io_lastload_valid; // @[cpu.scala 14:22:@1563.4]
  wire [4:0] insd_io_lastload_index; // @[cpu.scala 14:22:@1563.4]
  wire  insd_io_loadinfo_valid; // @[cpu.scala 14:22:@1563.4]
  wire [4:0] insd_io_loadinfo_index; // @[cpu.scala 14:22:@1563.4]
  wire [63:0] insd_io_imm; // @[cpu.scala 14:22:@1563.4]
  wire [3:0] insd_io_ALUOp; // @[cpu.scala 14:22:@1563.4]
  wire [3:0] insd_io_exe_type; // @[cpu.scala 14:22:@1563.4]
  wire [3:0] insd_io_ls_mode; // @[cpu.scala 14:22:@1563.4]
  wire  insd_io_op32; // @[cpu.scala 14:22:@1563.4]
  wire  insd_io_bubble; // @[cpu.scala 14:22:@1563.4]
  wire [4:0] insd_io_regr_r1; // @[cpu.scala 14:22:@1563.4]
  wire [4:0] insd_io_regr_r2; // @[cpu.scala 14:22:@1563.4]
  wire [63:0] insd_io_regr_r1d; // @[cpu.scala 14:22:@1563.4]
  wire [63:0] insd_io_regr_r2d; // @[cpu.scala 14:22:@1563.4]
  wire  insd_io_dreg_rs2_valid; // @[cpu.scala 14:22:@1563.4]
  wire [63:0] insd_io_dreg_rs1_value; // @[cpu.scala 14:22:@1563.4]
  wire [63:0] insd_io_dreg_rs2_value; // @[cpu.scala 14:22:@1563.4]
  wire  insd_io_dreg_rd_valid; // @[cpu.scala 14:22:@1563.4]
  wire [4:0] insd_io_dreg_rd_index; // @[cpu.scala 14:22:@1563.4]
  wire [11:0] insd_io_csr_addr; // @[cpu.scala 14:22:@1563.4]
  wire [63:0] insd_io_csr_rdata; // @[cpu.scala 14:22:@1563.4]
  wire  insd_io_csr_content_valid; // @[cpu.scala 14:22:@1563.4]
  wire [11:0] insd_io_csr_content_csr_idx; // @[cpu.scala 14:22:@1563.4]
  wire [63:0] insd_io_csr_content_csr_data; // @[cpu.scala 14:22:@1563.4]
  wire  insd_io_csr_from_ex_valid; // @[cpu.scala 14:22:@1563.4]
  wire [11:0] insd_io_csr_from_ex_csr_idx; // @[cpu.scala 14:22:@1563.4]
  wire [63:0] insd_io_csr_from_ex_csr_data; // @[cpu.scala 14:22:@1563.4]
  wire  insd_io_csr_from_mem_valid; // @[cpu.scala 14:22:@1563.4]
  wire [11:0] insd_io_csr_from_mem_csr_idx; // @[cpu.scala 14:22:@1563.4]
  wire [63:0] insd_io_csr_from_mem_csr_data; // @[cpu.scala 14:22:@1563.4]
  wire  insd_io_exWrReg_wbrv; // @[cpu.scala 14:22:@1563.4]
  wire [4:0] insd_io_exWrReg_wbri; // @[cpu.scala 14:22:@1563.4]
  wire [63:0] insd_io_exWrReg_wbrd; // @[cpu.scala 14:22:@1563.4]
  wire  insd_io_memWrReg_wbrv; // @[cpu.scala 14:22:@1563.4]
  wire [4:0] insd_io_memWrReg_wbri; // @[cpu.scala 14:22:@1563.4]
  wire [63:0] insd_io_memWrReg_wbrd; // @[cpu.scala 14:22:@1563.4]
  wire [63:0] exec_io_imm; // @[cpu.scala 15:22:@1566.4]
  wire [3:0] exec_io_ALUOp; // @[cpu.scala 15:22:@1566.4]
  wire [63:0] exec_io_pc; // @[cpu.scala 15:22:@1566.4]
  wire [3:0] exec_io_exe_type; // @[cpu.scala 15:22:@1566.4]
  wire  exec_io_op32; // @[cpu.scala 15:22:@1566.4]
  wire  exec_io_dreg_rs2_valid; // @[cpu.scala 15:22:@1566.4]
  wire [63:0] exec_io_dreg_rs1_value; // @[cpu.scala 15:22:@1566.4]
  wire [63:0] exec_io_dreg_rs2_value; // @[cpu.scala 15:22:@1566.4]
  wire  exec_io_dreg_rd_valid; // @[cpu.scala 15:22:@1566.4]
  wire [4:0] exec_io_dreg_rd_index; // @[cpu.scala 15:22:@1566.4]
  wire  exec_io_nls; // @[cpu.scala 15:22:@1566.4]
  wire [63:0] exec_io_addr; // @[cpu.scala 15:22:@1566.4]
  wire [63:0] exec_io_data; // @[cpu.scala 15:22:@1566.4]
  wire  exec_io_jump; // @[cpu.scala 15:22:@1566.4]
  wire [63:0] exec_io_jdest; // @[cpu.scala 15:22:@1566.4]
  wire  exec_io_wreg_wbrv; // @[cpu.scala 15:22:@1566.4]
  wire [4:0] exec_io_wreg_wbri; // @[cpu.scala 15:22:@1566.4]
  wire [63:0] exec_io_wreg_wbrd; // @[cpu.scala 15:22:@1566.4]
  wire  exec_io_wcsr_valid; // @[cpu.scala 15:22:@1566.4]
  wire [11:0] exec_io_wcsr_csr_idx; // @[cpu.scala 15:22:@1566.4]
  wire [63:0] exec_io_wcsr_csr_data; // @[cpu.scala 15:22:@1566.4]
  wire  exec_io_csr_op_valid; // @[cpu.scala 15:22:@1566.4]
  wire [11:0] exec_io_csr_op_csr_idx; // @[cpu.scala 15:22:@1566.4]
  wire [63:0] exec_io_csr_op_csr_data; // @[cpu.scala 15:22:@1566.4]
  wire  memc_io_nls; // @[cpu.scala 16:22:@1569.4]
  wire [3:0] memc_io_lsm; // @[cpu.scala 16:22:@1569.4]
  wire [63:0] memc_io_addr; // @[cpu.scala 16:22:@1569.4]
  wire [63:0] memc_io_data; // @[cpu.scala 16:22:@1569.4]
  wire  memc_io_ready; // @[cpu.scala 16:22:@1569.4]
  wire  memc_io_ereg_wbrv; // @[cpu.scala 16:22:@1569.4]
  wire [4:0] memc_io_ereg_wbri; // @[cpu.scala 16:22:@1569.4]
  wire [63:0] memc_io_ereg_wbrd; // @[cpu.scala 16:22:@1569.4]
  wire  memc_io_wreg_wbrv; // @[cpu.scala 16:22:@1569.4]
  wire [4:0] memc_io_wreg_wbri; // @[cpu.scala 16:22:@1569.4]
  wire [63:0] memc_io_wreg_wbrd; // @[cpu.scala 16:22:@1569.4]
  wire [3:0] memc_io_mem_mode; // @[cpu.scala 16:22:@1569.4]
  wire  memc_io_mem_ready; // @[cpu.scala 16:22:@1569.4]
  wire [63:0] memc_io_mem_addr; // @[cpu.scala 16:22:@1569.4]
  wire [63:0] memc_io_mem_rdata; // @[cpu.scala 16:22:@1569.4]
  wire [63:0] memc_io_mem_wdata; // @[cpu.scala 16:22:@1569.4]
  wire  wrbk_io_wreg_wbrv; // @[cpu.scala 17:22:@1572.4]
  wire [4:0] wrbk_io_wreg_wbri; // @[cpu.scala 17:22:@1572.4]
  wire [63:0] wrbk_io_wreg_wbrd; // @[cpu.scala 17:22:@1572.4]
  wire  wrbk_io_reg_wen; // @[cpu.scala 17:22:@1572.4]
  wire [4:0] wrbk_io_reg_w; // @[cpu.scala 17:22:@1572.4]
  wire [63:0] wrbk_io_reg_wd; // @[cpu.scala 17:22:@1572.4]
  wire  regc_clock; // @[cpu.scala 18:22:@1575.4]
  wire [4:0] regc_io_r_r1; // @[cpu.scala 18:22:@1575.4]
  wire [4:0] regc_io_r_r2; // @[cpu.scala 18:22:@1575.4]
  wire [63:0] regc_io_r_r1d; // @[cpu.scala 18:22:@1575.4]
  wire [63:0] regc_io_r_r2d; // @[cpu.scala 18:22:@1575.4]
  wire  regc_io_w_wen; // @[cpu.scala 18:22:@1575.4]
  wire [4:0] regc_io_w_w; // @[cpu.scala 18:22:@1575.4]
  wire [63:0] regc_io_w_wd; // @[cpu.scala 18:22:@1575.4]
  wire  regc_io_pass; // @[cpu.scala 18:22:@1575.4]
  wire  mmu_clock; // @[cpu.scala 19:22:@1578.4]
  wire  mmu_reset; // @[cpu.scala 19:22:@1578.4]
  wire [3:0] mmu_io_insr_mode; // @[cpu.scala 19:22:@1578.4]
  wire  mmu_io_insr_ready; // @[cpu.scala 19:22:@1578.4]
  wire [63:0] mmu_io_insr_addr; // @[cpu.scala 19:22:@1578.4]
  wire [63:0] mmu_io_insr_rdata; // @[cpu.scala 19:22:@1578.4]
  wire [3:0] mmu_io_mem_mode; // @[cpu.scala 19:22:@1578.4]
  wire  mmu_io_mem_ready; // @[cpu.scala 19:22:@1578.4]
  wire [63:0] mmu_io_mem_addr; // @[cpu.scala 19:22:@1578.4]
  wire [63:0] mmu_io_mem_rdata; // @[cpu.scala 19:22:@1578.4]
  wire [63:0] mmu_io_mem_wdata; // @[cpu.scala 19:22:@1578.4]
  wire [3:0] mmu_io_if_iom_mode; // @[cpu.scala 19:22:@1578.4]
  wire  mmu_io_if_iom_ready; // @[cpu.scala 19:22:@1578.4]
  wire [63:0] mmu_io_if_iom_addr; // @[cpu.scala 19:22:@1578.4]
  wire [63:0] mmu_io_if_iom_rdata; // @[cpu.scala 19:22:@1578.4]
  wire [3:0] mmu_io_mem_iom_mode; // @[cpu.scala 19:22:@1578.4]
  wire  mmu_io_mem_iom_ready; // @[cpu.scala 19:22:@1578.4]
  wire [63:0] mmu_io_mem_iom_addr; // @[cpu.scala 19:22:@1578.4]
  wire [63:0] mmu_io_mem_iom_rdata; // @[cpu.scala 19:22:@1578.4]
  wire [63:0] mmu_io_mem_iom_wdata; // @[cpu.scala 19:22:@1578.4]
  wire  iomn_clock; // @[cpu.scala 20:22:@1581.4]
  wire  iomn_reset; // @[cpu.scala 20:22:@1581.4]
  wire [3:0] iomn_io_mem_if_mode; // @[cpu.scala 20:22:@1581.4]
  wire  iomn_io_mem_if_ready; // @[cpu.scala 20:22:@1581.4]
  wire [63:0] iomn_io_mem_if_addr; // @[cpu.scala 20:22:@1581.4]
  wire [63:0] iomn_io_mem_if_rdata; // @[cpu.scala 20:22:@1581.4]
  wire [3:0] iomn_io_mem_mem_mode; // @[cpu.scala 20:22:@1581.4]
  wire  iomn_io_mem_mem_ready; // @[cpu.scala 20:22:@1581.4]
  wire [63:0] iomn_io_mem_mem_addr; // @[cpu.scala 20:22:@1581.4]
  wire [63:0] iomn_io_mem_mem_rdata; // @[cpu.scala 20:22:@1581.4]
  wire [63:0] iomn_io_mem_mem_wdata; // @[cpu.scala 20:22:@1581.4]
  wire [3:0] iomn_io_mem_out_mode; // @[cpu.scala 20:22:@1581.4]
  wire  iomn_io_mem_out_ready; // @[cpu.scala 20:22:@1581.4]
  wire [63:0] iomn_io_mem_out_addr; // @[cpu.scala 20:22:@1581.4]
  wire [63:0] iomn_io_mem_out_rdata; // @[cpu.scala 20:22:@1581.4]
  wire [63:0] iomn_io_mem_out_wdata; // @[cpu.scala 20:22:@1581.4]
  wire [3:0] iomn_io_serial_out_mode; // @[cpu.scala 20:22:@1581.4]
  wire  iomn_io_serial_out_ready; // @[cpu.scala 20:22:@1581.4]
  wire [63:0] iomn_io_serial_out_addr; // @[cpu.scala 20:22:@1581.4]
  wire [63:0] iomn_io_serial_out_rdata; // @[cpu.scala 20:22:@1581.4]
  wire [63:0] iomn_io_serial_out_wdata; // @[cpu.scala 20:22:@1581.4]
  wire  if_id_clock; // @[cpu.scala 21:24:@1584.4]
  wire  if_id_reset; // @[cpu.scala 21:24:@1584.4]
  wire  if_id_io_en; // @[cpu.scala 21:24:@1584.4]
  wire  if_id_io_pass; // @[cpu.scala 21:24:@1584.4]
  wire [31:0] if_id_io_insi; // @[cpu.scala 21:24:@1584.4]
  wire [63:0] if_id_io_pci; // @[cpu.scala 21:24:@1584.4]
  wire [63:0] if_id_io_insci; // @[cpu.scala 21:24:@1584.4]
  wire [63:0] if_id_io_icdi; // @[cpu.scala 21:24:@1584.4]
  wire  if_id_io_lastloadin_valid; // @[cpu.scala 21:24:@1584.4]
  wire [4:0] if_id_io_lastloadin_index; // @[cpu.scala 21:24:@1584.4]
  wire [31:0] if_id_io_inso; // @[cpu.scala 21:24:@1584.4]
  wire [63:0] if_id_io_pco; // @[cpu.scala 21:24:@1584.4]
  wire [63:0] if_id_io_insco; // @[cpu.scala 21:24:@1584.4]
  wire [63:0] if_id_io_icdo; // @[cpu.scala 21:24:@1584.4]
  wire  if_id_io_lastloadout_valid; // @[cpu.scala 21:24:@1584.4]
  wire [4:0] if_id_io_lastloadout_index; // @[cpu.scala 21:24:@1584.4]
  wire  id_ex_clock; // @[cpu.scala 22:24:@1587.4]
  wire  id_ex_reset; // @[cpu.scala 22:24:@1587.4]
  wire  id_ex_io_en; // @[cpu.scala 22:24:@1587.4]
  wire  id_ex_io_bid; // @[cpu.scala 22:24:@1587.4]
  wire  id_ex_io_bex; // @[cpu.scala 22:24:@1587.4]
  wire  id_ex_io_pass; // @[cpu.scala 22:24:@1587.4]
  wire [63:0] id_ex_io_immi; // @[cpu.scala 22:24:@1587.4]
  wire [3:0] id_ex_io_ALUOpi; // @[cpu.scala 22:24:@1587.4]
  wire [3:0] id_ex_io_exeti; // @[cpu.scala 22:24:@1587.4]
  wire [63:0] id_ex_io_pci; // @[cpu.scala 22:24:@1587.4]
  wire [3:0] id_ex_io_lsmi; // @[cpu.scala 22:24:@1587.4]
  wire  id_ex_io_op32i; // @[cpu.scala 22:24:@1587.4]
  wire  id_ex_io_csr_wb_i_valid; // @[cpu.scala 22:24:@1587.4]
  wire [11:0] id_ex_io_csr_wb_i_csr_idx; // @[cpu.scala 22:24:@1587.4]
  wire [63:0] id_ex_io_csr_wb_i_csr_data; // @[cpu.scala 22:24:@1587.4]
  wire  id_ex_io_dregi_rs2_valid; // @[cpu.scala 22:24:@1587.4]
  wire [63:0] id_ex_io_dregi_rs1_value; // @[cpu.scala 22:24:@1587.4]
  wire [63:0] id_ex_io_dregi_rs2_value; // @[cpu.scala 22:24:@1587.4]
  wire  id_ex_io_dregi_rd_valid; // @[cpu.scala 22:24:@1587.4]
  wire [4:0] id_ex_io_dregi_rd_index; // @[cpu.scala 22:24:@1587.4]
  wire [63:0] id_ex_io_immo; // @[cpu.scala 22:24:@1587.4]
  wire [3:0] id_ex_io_ALUOpo; // @[cpu.scala 22:24:@1587.4]
  wire [3:0] id_ex_io_exeto; // @[cpu.scala 22:24:@1587.4]
  wire [63:0] id_ex_io_pco; // @[cpu.scala 22:24:@1587.4]
  wire [3:0] id_ex_io_lsmo; // @[cpu.scala 22:24:@1587.4]
  wire  id_ex_io_op32o; // @[cpu.scala 22:24:@1587.4]
  wire  id_ex_io_csr_wb_o_valid; // @[cpu.scala 22:24:@1587.4]
  wire [11:0] id_ex_io_csr_wb_o_csr_idx; // @[cpu.scala 22:24:@1587.4]
  wire [63:0] id_ex_io_csr_wb_o_csr_data; // @[cpu.scala 22:24:@1587.4]
  wire  id_ex_io_drego_rs2_valid; // @[cpu.scala 22:24:@1587.4]
  wire [63:0] id_ex_io_drego_rs1_value; // @[cpu.scala 22:24:@1587.4]
  wire [63:0] id_ex_io_drego_rs2_value; // @[cpu.scala 22:24:@1587.4]
  wire  id_ex_io_drego_rd_valid; // @[cpu.scala 22:24:@1587.4]
  wire [4:0] id_ex_io_drego_rd_index; // @[cpu.scala 22:24:@1587.4]
  wire  ex_mem_clock; // @[cpu.scala 23:24:@1590.4]
  wire  ex_mem_reset; // @[cpu.scala 23:24:@1590.4]
  wire  ex_mem_io_en; // @[cpu.scala 23:24:@1590.4]
  wire  ex_mem_io_pass; // @[cpu.scala 23:24:@1590.4]
  wire  ex_mem_io_nlsi; // @[cpu.scala 23:24:@1590.4]
  wire [3:0] ex_mem_io_lsmi; // @[cpu.scala 23:24:@1590.4]
  wire [63:0] ex_mem_io_addri; // @[cpu.scala 23:24:@1590.4]
  wire [63:0] ex_mem_io_datai; // @[cpu.scala 23:24:@1590.4]
  wire  ex_mem_io_wregi_wbrv; // @[cpu.scala 23:24:@1590.4]
  wire [4:0] ex_mem_io_wregi_wbri; // @[cpu.scala 23:24:@1590.4]
  wire [63:0] ex_mem_io_wregi_wbrd; // @[cpu.scala 23:24:@1590.4]
  wire  ex_mem_io_csr_wb_i_valid; // @[cpu.scala 23:24:@1590.4]
  wire [11:0] ex_mem_io_csr_wb_i_csr_idx; // @[cpu.scala 23:24:@1590.4]
  wire [63:0] ex_mem_io_csr_wb_i_csr_data; // @[cpu.scala 23:24:@1590.4]
  wire  ex_mem_io_nlso; // @[cpu.scala 23:24:@1590.4]
  wire [3:0] ex_mem_io_lsmo; // @[cpu.scala 23:24:@1590.4]
  wire [63:0] ex_mem_io_addro; // @[cpu.scala 23:24:@1590.4]
  wire [63:0] ex_mem_io_datao; // @[cpu.scala 23:24:@1590.4]
  wire  ex_mem_io_wrego_wbrv; // @[cpu.scala 23:24:@1590.4]
  wire [4:0] ex_mem_io_wrego_wbri; // @[cpu.scala 23:24:@1590.4]
  wire [63:0] ex_mem_io_wrego_wbrd; // @[cpu.scala 23:24:@1590.4]
  wire  ex_mem_io_csr_wb_o_valid; // @[cpu.scala 23:24:@1590.4]
  wire [11:0] ex_mem_io_csr_wb_o_csr_idx; // @[cpu.scala 23:24:@1590.4]
  wire [63:0] ex_mem_io_csr_wb_o_csr_data; // @[cpu.scala 23:24:@1590.4]
  wire  mem_wb_clock; // @[cpu.scala 24:24:@1593.4]
  wire  mem_wb_reset; // @[cpu.scala 24:24:@1593.4]
  wire  mem_wb_io_en; // @[cpu.scala 24:24:@1593.4]
  wire  mem_wb_io_pass; // @[cpu.scala 24:24:@1593.4]
  wire  mem_wb_io_wregi_wbrv; // @[cpu.scala 24:24:@1593.4]
  wire [4:0] mem_wb_io_wregi_wbri; // @[cpu.scala 24:24:@1593.4]
  wire [63:0] mem_wb_io_wregi_wbrd; // @[cpu.scala 24:24:@1593.4]
  wire  mem_wb_io_csr_wb_i_valid; // @[cpu.scala 24:24:@1593.4]
  wire [11:0] mem_wb_io_csr_wb_i_csr_idx; // @[cpu.scala 24:24:@1593.4]
  wire [63:0] mem_wb_io_csr_wb_i_csr_data; // @[cpu.scala 24:24:@1593.4]
  wire  mem_wb_io_wrego_wbrv; // @[cpu.scala 24:24:@1593.4]
  wire [4:0] mem_wb_io_wrego_wbri; // @[cpu.scala 24:24:@1593.4]
  wire [63:0] mem_wb_io_wrego_wbrd; // @[cpu.scala 24:24:@1593.4]
  wire  mem_wb_io_csr_wb_o_valid; // @[cpu.scala 24:24:@1593.4]
  wire [11:0] mem_wb_io_csr_wb_o_csr_idx; // @[cpu.scala 24:24:@1593.4]
  wire [63:0] mem_wb_io_csr_wb_o_csr_data; // @[cpu.scala 24:24:@1593.4]
  wire  csr_clock; // @[cpu.scala 25:24:@1596.4]
  wire  csr_reset; // @[cpu.scala 25:24:@1596.4]
  wire [11:0] csr_io_id_addr; // @[cpu.scala 25:24:@1596.4]
  wire [63:0] csr_io_id_rdata; // @[cpu.scala 25:24:@1596.4]
  wire  csr_io_wrOp_valid; // @[cpu.scala 25:24:@1596.4]
  wire [11:0] csr_io_wrOp_csr_idx; // @[cpu.scala 25:24:@1596.4]
  wire [63:0] csr_io_wrOp_csr_data; // @[cpu.scala 25:24:@1596.4]
  InsReader insr ( // @[cpu.scala 13:22:@1560.4]
    .io_jump(insr_io_jump),
    .io_jdest(insr_io_jdest),
    .io_nls(insr_io_nls),
    .io_lpc(insr_io_lpc),
    .io_insp(insr_io_insp),
    .io_inspd(insr_io_inspd),
    .io_bubble(insr_io_bubble),
    .io_ins(insr_io_ins),
    .io_pc(insr_io_pc),
    .io_insn(insr_io_insn),
    .io_insnd(insr_io_insnd),
    .io_mmu_mode(insr_io_mmu_mode),
    .io_mmu_ready(insr_io_mmu_ready),
    .io_mmu_addr(insr_io_mmu_addr),
    .io_mmu_rdata(insr_io_mmu_rdata)
  );
  Decoder insd ( // @[cpu.scala 14:22:@1563.4]
    .io_ins(insd_io_ins),
    .io_lastload_valid(insd_io_lastload_valid),
    .io_lastload_index(insd_io_lastload_index),
    .io_loadinfo_valid(insd_io_loadinfo_valid),
    .io_loadinfo_index(insd_io_loadinfo_index),
    .io_imm(insd_io_imm),
    .io_ALUOp(insd_io_ALUOp),
    .io_exe_type(insd_io_exe_type),
    .io_ls_mode(insd_io_ls_mode),
    .io_op32(insd_io_op32),
    .io_bubble(insd_io_bubble),
    .io_regr_r1(insd_io_regr_r1),
    .io_regr_r2(insd_io_regr_r2),
    .io_regr_r1d(insd_io_regr_r1d),
    .io_regr_r2d(insd_io_regr_r2d),
    .io_dreg_rs2_valid(insd_io_dreg_rs2_valid),
    .io_dreg_rs1_value(insd_io_dreg_rs1_value),
    .io_dreg_rs2_value(insd_io_dreg_rs2_value),
    .io_dreg_rd_valid(insd_io_dreg_rd_valid),
    .io_dreg_rd_index(insd_io_dreg_rd_index),
    .io_csr_addr(insd_io_csr_addr),
    .io_csr_rdata(insd_io_csr_rdata),
    .io_csr_content_valid(insd_io_csr_content_valid),
    .io_csr_content_csr_idx(insd_io_csr_content_csr_idx),
    .io_csr_content_csr_data(insd_io_csr_content_csr_data),
    .io_csr_from_ex_valid(insd_io_csr_from_ex_valid),
    .io_csr_from_ex_csr_idx(insd_io_csr_from_ex_csr_idx),
    .io_csr_from_ex_csr_data(insd_io_csr_from_ex_csr_data),
    .io_csr_from_mem_valid(insd_io_csr_from_mem_valid),
    .io_csr_from_mem_csr_idx(insd_io_csr_from_mem_csr_idx),
    .io_csr_from_mem_csr_data(insd_io_csr_from_mem_csr_data),
    .io_exWrReg_wbrv(insd_io_exWrReg_wbrv),
    .io_exWrReg_wbri(insd_io_exWrReg_wbri),
    .io_exWrReg_wbrd(insd_io_exWrReg_wbrd),
    .io_memWrReg_wbrv(insd_io_memWrReg_wbrv),
    .io_memWrReg_wbri(insd_io_memWrReg_wbri),
    .io_memWrReg_wbrd(insd_io_memWrReg_wbrd)
  );
  Execute exec ( // @[cpu.scala 15:22:@1566.4]
    .io_imm(exec_io_imm),
    .io_ALUOp(exec_io_ALUOp),
    .io_pc(exec_io_pc),
    .io_exe_type(exec_io_exe_type),
    .io_op32(exec_io_op32),
    .io_dreg_rs2_valid(exec_io_dreg_rs2_valid),
    .io_dreg_rs1_value(exec_io_dreg_rs1_value),
    .io_dreg_rs2_value(exec_io_dreg_rs2_value),
    .io_dreg_rd_valid(exec_io_dreg_rd_valid),
    .io_dreg_rd_index(exec_io_dreg_rd_index),
    .io_nls(exec_io_nls),
    .io_addr(exec_io_addr),
    .io_data(exec_io_data),
    .io_jump(exec_io_jump),
    .io_jdest(exec_io_jdest),
    .io_wreg_wbrv(exec_io_wreg_wbrv),
    .io_wreg_wbri(exec_io_wreg_wbri),
    .io_wreg_wbrd(exec_io_wreg_wbrd),
    .io_wcsr_valid(exec_io_wcsr_valid),
    .io_wcsr_csr_idx(exec_io_wcsr_csr_idx),
    .io_wcsr_csr_data(exec_io_wcsr_csr_data),
    .io_csr_op_valid(exec_io_csr_op_valid),
    .io_csr_op_csr_idx(exec_io_csr_op_csr_idx),
    .io_csr_op_csr_data(exec_io_csr_op_csr_data)
  );
  MemoryCtrl memc ( // @[cpu.scala 16:22:@1569.4]
    .io_nls(memc_io_nls),
    .io_lsm(memc_io_lsm),
    .io_addr(memc_io_addr),
    .io_data(memc_io_data),
    .io_ready(memc_io_ready),
    .io_ereg_wbrv(memc_io_ereg_wbrv),
    .io_ereg_wbri(memc_io_ereg_wbri),
    .io_ereg_wbrd(memc_io_ereg_wbrd),
    .io_wreg_wbrv(memc_io_wreg_wbrv),
    .io_wreg_wbri(memc_io_wreg_wbri),
    .io_wreg_wbrd(memc_io_wreg_wbrd),
    .io_mem_mode(memc_io_mem_mode),
    .io_mem_ready(memc_io_mem_ready),
    .io_mem_addr(memc_io_mem_addr),
    .io_mem_rdata(memc_io_mem_rdata),
    .io_mem_wdata(memc_io_mem_wdata)
  );
  WriteBack wrbk ( // @[cpu.scala 17:22:@1572.4]
    .io_wreg_wbrv(wrbk_io_wreg_wbrv),
    .io_wreg_wbri(wrbk_io_wreg_wbri),
    .io_wreg_wbrd(wrbk_io_wreg_wbrd),
    .io_reg_wen(wrbk_io_reg_wen),
    .io_reg_w(wrbk_io_reg_w),
    .io_reg_wd(wrbk_io_reg_wd)
  );
  RegCtrl regc ( // @[cpu.scala 18:22:@1575.4]
    .clock(regc_clock),
    .io_r_r1(regc_io_r_r1),
    .io_r_r2(regc_io_r_r2),
    .io_r_r1d(regc_io_r_r1d),
    .io_r_r2d(regc_io_r_r2d),
    .io_w_wen(regc_io_w_wen),
    .io_w_w(regc_io_w_w),
    .io_w_wd(regc_io_w_wd),
    .io_pass(regc_io_pass)
  );
  MMU mmu ( // @[cpu.scala 19:22:@1578.4]
    .clock(mmu_clock),
    .reset(mmu_reset),
    .io_insr_mode(mmu_io_insr_mode),
    .io_insr_ready(mmu_io_insr_ready),
    .io_insr_addr(mmu_io_insr_addr),
    .io_insr_rdata(mmu_io_insr_rdata),
    .io_mem_mode(mmu_io_mem_mode),
    .io_mem_ready(mmu_io_mem_ready),
    .io_mem_addr(mmu_io_mem_addr),
    .io_mem_rdata(mmu_io_mem_rdata),
    .io_mem_wdata(mmu_io_mem_wdata),
    .io_if_iom_mode(mmu_io_if_iom_mode),
    .io_if_iom_ready(mmu_io_if_iom_ready),
    .io_if_iom_addr(mmu_io_if_iom_addr),
    .io_if_iom_rdata(mmu_io_if_iom_rdata),
    .io_mem_iom_mode(mmu_io_mem_iom_mode),
    .io_mem_iom_ready(mmu_io_mem_iom_ready),
    .io_mem_iom_addr(mmu_io_mem_iom_addr),
    .io_mem_iom_rdata(mmu_io_mem_iom_rdata),
    .io_mem_iom_wdata(mmu_io_mem_iom_wdata)
  );
  IOManager iomn ( // @[cpu.scala 20:22:@1581.4]
    .clock(iomn_clock),
    .reset(iomn_reset),
    .io_mem_if_mode(iomn_io_mem_if_mode),
    .io_mem_if_ready(iomn_io_mem_if_ready),
    .io_mem_if_addr(iomn_io_mem_if_addr),
    .io_mem_if_rdata(iomn_io_mem_if_rdata),
    .io_mem_mem_mode(iomn_io_mem_mem_mode),
    .io_mem_mem_ready(iomn_io_mem_mem_ready),
    .io_mem_mem_addr(iomn_io_mem_mem_addr),
    .io_mem_mem_rdata(iomn_io_mem_mem_rdata),
    .io_mem_mem_wdata(iomn_io_mem_mem_wdata),
    .io_mem_out_mode(iomn_io_mem_out_mode),
    .io_mem_out_ready(iomn_io_mem_out_ready),
    .io_mem_out_addr(iomn_io_mem_out_addr),
    .io_mem_out_rdata(iomn_io_mem_out_rdata),
    .io_mem_out_wdata(iomn_io_mem_out_wdata),
    .io_serial_out_mode(iomn_io_serial_out_mode),
    .io_serial_out_ready(iomn_io_serial_out_ready),
    .io_serial_out_addr(iomn_io_serial_out_addr),
    .io_serial_out_rdata(iomn_io_serial_out_rdata),
    .io_serial_out_wdata(iomn_io_serial_out_wdata)
  );
  IF_ID if_id ( // @[cpu.scala 21:24:@1584.4]
    .clock(if_id_clock),
    .reset(if_id_reset),
    .io_en(if_id_io_en),
    .io_pass(if_id_io_pass),
    .io_insi(if_id_io_insi),
    .io_pci(if_id_io_pci),
    .io_insci(if_id_io_insci),
    .io_icdi(if_id_io_icdi),
    .io_lastloadin_valid(if_id_io_lastloadin_valid),
    .io_lastloadin_index(if_id_io_lastloadin_index),
    .io_inso(if_id_io_inso),
    .io_pco(if_id_io_pco),
    .io_insco(if_id_io_insco),
    .io_icdo(if_id_io_icdo),
    .io_lastloadout_valid(if_id_io_lastloadout_valid),
    .io_lastloadout_index(if_id_io_lastloadout_index)
  );
  ID_EX id_ex ( // @[cpu.scala 22:24:@1587.4]
    .clock(id_ex_clock),
    .reset(id_ex_reset),
    .io_en(id_ex_io_en),
    .io_bid(id_ex_io_bid),
    .io_bex(id_ex_io_bex),
    .io_pass(id_ex_io_pass),
    .io_immi(id_ex_io_immi),
    .io_ALUOpi(id_ex_io_ALUOpi),
    .io_exeti(id_ex_io_exeti),
    .io_pci(id_ex_io_pci),
    .io_lsmi(id_ex_io_lsmi),
    .io_op32i(id_ex_io_op32i),
    .io_csr_wb_i_valid(id_ex_io_csr_wb_i_valid),
    .io_csr_wb_i_csr_idx(id_ex_io_csr_wb_i_csr_idx),
    .io_csr_wb_i_csr_data(id_ex_io_csr_wb_i_csr_data),
    .io_dregi_rs2_valid(id_ex_io_dregi_rs2_valid),
    .io_dregi_rs1_value(id_ex_io_dregi_rs1_value),
    .io_dregi_rs2_value(id_ex_io_dregi_rs2_value),
    .io_dregi_rd_valid(id_ex_io_dregi_rd_valid),
    .io_dregi_rd_index(id_ex_io_dregi_rd_index),
    .io_immo(id_ex_io_immo),
    .io_ALUOpo(id_ex_io_ALUOpo),
    .io_exeto(id_ex_io_exeto),
    .io_pco(id_ex_io_pco),
    .io_lsmo(id_ex_io_lsmo),
    .io_op32o(id_ex_io_op32o),
    .io_csr_wb_o_valid(id_ex_io_csr_wb_o_valid),
    .io_csr_wb_o_csr_idx(id_ex_io_csr_wb_o_csr_idx),
    .io_csr_wb_o_csr_data(id_ex_io_csr_wb_o_csr_data),
    .io_drego_rs2_valid(id_ex_io_drego_rs2_valid),
    .io_drego_rs1_value(id_ex_io_drego_rs1_value),
    .io_drego_rs2_value(id_ex_io_drego_rs2_value),
    .io_drego_rd_valid(id_ex_io_drego_rd_valid),
    .io_drego_rd_index(id_ex_io_drego_rd_index)
  );
  EX_MEM ex_mem ( // @[cpu.scala 23:24:@1590.4]
    .clock(ex_mem_clock),
    .reset(ex_mem_reset),
    .io_en(ex_mem_io_en),
    .io_pass(ex_mem_io_pass),
    .io_nlsi(ex_mem_io_nlsi),
    .io_lsmi(ex_mem_io_lsmi),
    .io_addri(ex_mem_io_addri),
    .io_datai(ex_mem_io_datai),
    .io_wregi_wbrv(ex_mem_io_wregi_wbrv),
    .io_wregi_wbri(ex_mem_io_wregi_wbri),
    .io_wregi_wbrd(ex_mem_io_wregi_wbrd),
    .io_csr_wb_i_valid(ex_mem_io_csr_wb_i_valid),
    .io_csr_wb_i_csr_idx(ex_mem_io_csr_wb_i_csr_idx),
    .io_csr_wb_i_csr_data(ex_mem_io_csr_wb_i_csr_data),
    .io_nlso(ex_mem_io_nlso),
    .io_lsmo(ex_mem_io_lsmo),
    .io_addro(ex_mem_io_addro),
    .io_datao(ex_mem_io_datao),
    .io_wrego_wbrv(ex_mem_io_wrego_wbrv),
    .io_wrego_wbri(ex_mem_io_wrego_wbri),
    .io_wrego_wbrd(ex_mem_io_wrego_wbrd),
    .io_csr_wb_o_valid(ex_mem_io_csr_wb_o_valid),
    .io_csr_wb_o_csr_idx(ex_mem_io_csr_wb_o_csr_idx),
    .io_csr_wb_o_csr_data(ex_mem_io_csr_wb_o_csr_data)
  );
  MEM_WB mem_wb ( // @[cpu.scala 24:24:@1593.4]
    .clock(mem_wb_clock),
    .reset(mem_wb_reset),
    .io_en(mem_wb_io_en),
    .io_pass(mem_wb_io_pass),
    .io_wregi_wbrv(mem_wb_io_wregi_wbrv),
    .io_wregi_wbri(mem_wb_io_wregi_wbri),
    .io_wregi_wbrd(mem_wb_io_wregi_wbrd),
    .io_csr_wb_i_valid(mem_wb_io_csr_wb_i_valid),
    .io_csr_wb_i_csr_idx(mem_wb_io_csr_wb_i_csr_idx),
    .io_csr_wb_i_csr_data(mem_wb_io_csr_wb_i_csr_data),
    .io_wrego_wbrv(mem_wb_io_wrego_wbrv),
    .io_wrego_wbri(mem_wb_io_wrego_wbri),
    .io_wrego_wbrd(mem_wb_io_wrego_wbrd),
    .io_csr_wb_o_valid(mem_wb_io_csr_wb_o_valid),
    .io_csr_wb_o_csr_idx(mem_wb_io_csr_wb_o_csr_idx),
    .io_csr_wb_o_csr_data(mem_wb_io_csr_wb_o_csr_data)
  );
  CSR csr ( // @[cpu.scala 25:24:@1596.4]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_id_addr(csr_io_id_addr),
    .io_id_rdata(csr_io_id_rdata),
    .io_wrOp_valid(csr_io_wrOp_valid),
    .io_wrOp_csr_idx(csr_io_wrOp_csr_idx),
    .io_wrOp_csr_data(csr_io_wrOp_csr_data)
  );
  assign io_mem_mode = iomn_io_mem_out_mode; // @[cpu.scala 32:20:@1622.4]
  assign io_mem_addr = iomn_io_mem_out_addr; // @[cpu.scala 32:20:@1620.4]
  assign io_mem_wdata = iomn_io_mem_out_wdata; // @[cpu.scala 32:20:@1618.4]
  assign io_serial_mode = iomn_io_serial_out_mode; // @[cpu.scala 33:20:@1627.4]
  assign io_serial_addr = iomn_io_serial_out_addr; // @[cpu.scala 33:20:@1625.4]
  assign io_serial_wdata = iomn_io_serial_out_wdata; // @[cpu.scala 33:20:@1623.4]
  assign insr_io_jump = exec_io_jump; // @[cpu.scala 44:20:@1641.4]
  assign insr_io_jdest = exec_io_jdest; // @[cpu.scala 45:20:@1642.4]
  assign insr_io_nls = ex_mem_io_nlso; // @[cpu.scala 46:20:@1643.4]
  assign insr_io_lpc = if_id_io_pco; // @[cpu.scala 64:20:@1657.4]
  assign insr_io_insp = if_id_io_insco; // @[cpu.scala 66:20:@1659.4]
  assign insr_io_inspd = if_id_io_icdo; // @[cpu.scala 67:20:@1660.4]
  assign insr_io_bubble = insd_io_bubble; // @[cpu.scala 47:20:@1644.4]
  assign insr_io_mmu_ready = mmu_io_insr_ready; // @[cpu.scala 28:20:@1601.4]
  assign insr_io_mmu_rdata = mmu_io_insr_rdata; // @[cpu.scala 28:20:@1599.4]
  assign insd_io_ins = if_id_io_inso; // @[cpu.scala 65:20:@1658.4]
  assign insd_io_lastload_valid = if_id_io_lastloadout_valid; // @[cpu.scala 68:26:@1662.4]
  assign insd_io_lastload_index = if_id_io_lastloadout_index; // @[cpu.scala 68:26:@1661.4]
  assign insd_io_regr_r1d = regc_io_r_r1d; // @[cpu.scala 36:19:@1629.4]
  assign insd_io_regr_r2d = regc_io_r_r2d; // @[cpu.scala 36:19:@1628.4]
  assign insd_io_csr_rdata = csr_io_id_rdata; // @[cpu.scala 124:21:@1738.4]
  assign insd_io_csr_from_ex_valid = exec_io_wcsr_valid; // @[cpu.scala 119:25:@1730.4]
  assign insd_io_csr_from_ex_csr_idx = exec_io_wcsr_csr_idx; // @[cpu.scala 119:25:@1729.4]
  assign insd_io_csr_from_ex_csr_data = exec_io_wcsr_csr_data; // @[cpu.scala 119:25:@1728.4]
  assign insd_io_csr_from_mem_valid = ex_mem_io_csr_wb_o_valid; // @[cpu.scala 120:26:@1733.4]
  assign insd_io_csr_from_mem_csr_idx = ex_mem_io_csr_wb_o_csr_idx; // @[cpu.scala 120:26:@1732.4]
  assign insd_io_csr_from_mem_csr_data = ex_mem_io_csr_wb_o_csr_data; // @[cpu.scala 120:26:@1731.4]
  assign insd_io_exWrReg_wbrv = exec_io_wreg_wbrv; // @[cpu.scala 40:22:@1637.4]
  assign insd_io_exWrReg_wbri = exec_io_wreg_wbri; // @[cpu.scala 40:22:@1636.4]
  assign insd_io_exWrReg_wbrd = exec_io_wreg_wbrd; // @[cpu.scala 40:22:@1635.4]
  assign insd_io_memWrReg_wbrv = memc_io_wreg_wbrv; // @[cpu.scala 41:22:@1640.4]
  assign insd_io_memWrReg_wbri = memc_io_wreg_wbri; // @[cpu.scala 41:22:@1639.4]
  assign insd_io_memWrReg_wbrd = memc_io_wreg_wbrd; // @[cpu.scala 41:22:@1638.4]
  assign exec_io_imm = id_ex_io_immo; // @[cpu.scala 86:21:@1682.4]
  assign exec_io_ALUOp = id_ex_io_ALUOpo; // @[cpu.scala 87:21:@1683.4]
  assign exec_io_pc = id_ex_io_pco; // @[cpu.scala 89:21:@1685.4]
  assign exec_io_exe_type = id_ex_io_exeto; // @[cpu.scala 88:21:@1684.4]
  assign exec_io_op32 = id_ex_io_op32o; // @[cpu.scala 92:21:@1693.4]
  assign exec_io_dreg_rs2_valid = id_ex_io_drego_rs2_valid; // @[cpu.scala 90:21:@1690.4]
  assign exec_io_dreg_rs1_value = id_ex_io_drego_rs1_value; // @[cpu.scala 90:21:@1689.4]
  assign exec_io_dreg_rs2_value = id_ex_io_drego_rs2_value; // @[cpu.scala 90:21:@1688.4]
  assign exec_io_dreg_rd_valid = id_ex_io_drego_rd_valid; // @[cpu.scala 90:21:@1687.4]
  assign exec_io_dreg_rd_index = id_ex_io_drego_rd_index; // @[cpu.scala 90:21:@1686.4]
  assign exec_io_csr_op_valid = id_ex_io_csr_wb_o_valid; // @[cpu.scala 94:24:@1696.4]
  assign exec_io_csr_op_csr_idx = id_ex_io_csr_wb_o_csr_idx; // @[cpu.scala 94:24:@1695.4]
  assign exec_io_csr_op_csr_data = id_ex_io_csr_wb_o_csr_data; // @[cpu.scala 94:24:@1694.4]
  assign memc_io_nls = ex_mem_io_nlso; // @[cpu.scala 105:21:@1708.4]
  assign memc_io_lsm = ex_mem_io_lsmo; // @[cpu.scala 107:21:@1712.4]
  assign memc_io_addr = ex_mem_io_addro; // @[cpu.scala 108:21:@1713.4]
  assign memc_io_data = ex_mem_io_datao; // @[cpu.scala 109:21:@1714.4]
  assign memc_io_ereg_wbrv = ex_mem_io_wrego_wbrv; // @[cpu.scala 106:21:@1711.4]
  assign memc_io_ereg_wbri = ex_mem_io_wrego_wbri; // @[cpu.scala 106:21:@1710.4]
  assign memc_io_ereg_wbrd = ex_mem_io_wrego_wbrd; // @[cpu.scala 106:21:@1709.4]
  assign memc_io_mem_ready = mmu_io_mem_ready; // @[cpu.scala 30:20:@1611.4]
  assign memc_io_mem_rdata = mmu_io_mem_rdata; // @[cpu.scala 30:20:@1609.4]
  assign wrbk_io_wreg_wbrv = mem_wb_io_wrego_wbrv; // @[cpu.scala 115:21:@1724.4]
  assign wrbk_io_wreg_wbri = mem_wb_io_wrego_wbri; // @[cpu.scala 115:21:@1723.4]
  assign wrbk_io_wreg_wbrd = mem_wb_io_wrego_wbrd; // @[cpu.scala 115:21:@1722.4]
  assign regc_clock = clock; // @[:@1576.4]
  assign regc_io_r_r1 = insd_io_regr_r1; // @[cpu.scala 36:19:@1631.4]
  assign regc_io_r_r2 = insd_io_regr_r2; // @[cpu.scala 36:19:@1630.4]
  assign regc_io_w_wen = wrbk_io_reg_wen; // @[cpu.scala 37:19:@1634.4]
  assign regc_io_w_w = wrbk_io_reg_w; // @[cpu.scala 37:19:@1633.4]
  assign regc_io_w_wd = wrbk_io_reg_wd; // @[cpu.scala 37:19:@1632.4]
  assign regc_io_pass = memc_io_ready; // @[cpu.scala 54:20:@1649.4]
  assign mmu_clock = clock; // @[:@1579.4]
  assign mmu_reset = reset; // @[:@1580.4]
  assign mmu_io_insr_mode = insr_io_mmu_mode; // @[cpu.scala 28:20:@1602.4]
  assign mmu_io_insr_addr = insr_io_mmu_addr; // @[cpu.scala 28:20:@1600.4]
  assign mmu_io_mem_mode = memc_io_mem_mode; // @[cpu.scala 30:20:@1612.4]
  assign mmu_io_mem_addr = memc_io_mem_addr; // @[cpu.scala 30:20:@1610.4]
  assign mmu_io_mem_wdata = memc_io_mem_wdata; // @[cpu.scala 30:20:@1608.4]
  assign mmu_io_if_iom_ready = iomn_io_mem_if_ready; // @[cpu.scala 29:20:@1606.4]
  assign mmu_io_if_iom_rdata = iomn_io_mem_if_rdata; // @[cpu.scala 29:20:@1604.4]
  assign mmu_io_mem_iom_ready = iomn_io_mem_mem_ready; // @[cpu.scala 31:20:@1616.4]
  assign mmu_io_mem_iom_rdata = iomn_io_mem_mem_rdata; // @[cpu.scala 31:20:@1614.4]
  assign iomn_clock = clock; // @[:@1582.4]
  assign iomn_reset = reset; // @[:@1583.4]
  assign iomn_io_mem_if_mode = mmu_io_if_iom_mode; // @[cpu.scala 29:20:@1607.4]
  assign iomn_io_mem_if_addr = mmu_io_if_iom_addr; // @[cpu.scala 29:20:@1605.4]
  assign iomn_io_mem_mem_mode = mmu_io_mem_iom_mode; // @[cpu.scala 31:20:@1617.4]
  assign iomn_io_mem_mem_addr = mmu_io_mem_iom_addr; // @[cpu.scala 31:20:@1615.4]
  assign iomn_io_mem_mem_wdata = mmu_io_mem_iom_wdata; // @[cpu.scala 31:20:@1613.4]
  assign iomn_io_mem_out_ready = io_mem_ready; // @[cpu.scala 32:20:@1621.4]
  assign iomn_io_mem_out_rdata = io_mem_rdata; // @[cpu.scala 32:20:@1619.4]
  assign iomn_io_serial_out_ready = io_serial_ready; // @[cpu.scala 33:20:@1626.4]
  assign iomn_io_serial_out_rdata = io_serial_rdata; // @[cpu.scala 33:20:@1624.4]
  assign if_id_clock = clock; // @[:@1585.4]
  assign if_id_reset = reset; // @[:@1586.4]
  assign if_id_io_en = io_en; // @[cpu.scala 57:20:@1650.4]
  assign if_id_io_pass = memc_io_ready; // @[cpu.scala 50:20:@1645.4]
  assign if_id_io_insi = insr_io_ins; // @[cpu.scala 60:20:@1653.4]
  assign if_id_io_pci = insr_io_pc; // @[cpu.scala 61:20:@1654.4]
  assign if_id_io_insci = insr_io_insn; // @[cpu.scala 58:20:@1651.4]
  assign if_id_io_icdi = insr_io_insnd; // @[cpu.scala 59:20:@1652.4]
  assign if_id_io_lastloadin_valid = insd_io_loadinfo_valid; // @[cpu.scala 62:25:@1656.4]
  assign if_id_io_lastloadin_index = insd_io_loadinfo_index; // @[cpu.scala 62:25:@1655.4]
  assign id_ex_clock = clock; // @[:@1588.4]
  assign id_ex_reset = reset; // @[:@1589.4]
  assign id_ex_io_en = io_en; // @[cpu.scala 71:21:@1663.4]
  assign id_ex_io_bid = insd_io_bubble; // @[cpu.scala 72:21:@1664.4]
  assign id_ex_io_bex = exec_io_jump; // @[cpu.scala 73:21:@1665.4]
  assign id_ex_io_pass = memc_io_ready; // @[cpu.scala 51:20:@1646.4]
  assign id_ex_io_immi = insd_io_imm; // @[cpu.scala 75:21:@1666.4]
  assign id_ex_io_ALUOpi = insd_io_ALUOp; // @[cpu.scala 76:21:@1667.4]
  assign id_ex_io_exeti = insd_io_exe_type; // @[cpu.scala 77:21:@1668.4]
  assign id_ex_io_pci = if_id_io_pco; // @[cpu.scala 78:21:@1669.4]
  assign id_ex_io_lsmi = insd_io_ls_mode; // @[cpu.scala 80:21:@1676.4]
  assign id_ex_io_op32i = insd_io_op32; // @[cpu.scala 82:21:@1678.4]
  assign id_ex_io_csr_wb_i_valid = insd_io_csr_content_valid; // @[cpu.scala 84:24:@1681.4]
  assign id_ex_io_csr_wb_i_csr_idx = insd_io_csr_content_csr_idx; // @[cpu.scala 84:24:@1680.4]
  assign id_ex_io_csr_wb_i_csr_data = insd_io_csr_content_csr_data; // @[cpu.scala 84:24:@1679.4]
  assign id_ex_io_dregi_rs2_valid = insd_io_dreg_rs2_valid; // @[cpu.scala 79:21:@1674.4]
  assign id_ex_io_dregi_rs1_value = insd_io_dreg_rs1_value; // @[cpu.scala 79:21:@1673.4]
  assign id_ex_io_dregi_rs2_value = insd_io_dreg_rs2_value; // @[cpu.scala 79:21:@1672.4]
  assign id_ex_io_dregi_rd_valid = insd_io_dreg_rd_valid; // @[cpu.scala 79:21:@1671.4]
  assign id_ex_io_dregi_rd_index = insd_io_dreg_rd_index; // @[cpu.scala 79:21:@1670.4]
  assign ex_mem_clock = clock; // @[:@1591.4]
  assign ex_mem_reset = reset; // @[:@1592.4]
  assign ex_mem_io_en = io_en; // @[cpu.scala 97:21:@1697.4]
  assign ex_mem_io_pass = memc_io_ready; // @[cpu.scala 52:20:@1647.4]
  assign ex_mem_io_nlsi = exec_io_nls; // @[cpu.scala 99:21:@1699.4]
  assign ex_mem_io_lsmi = id_ex_io_lsmo; // @[cpu.scala 98:21:@1698.4]
  assign ex_mem_io_addri = exec_io_addr; // @[cpu.scala 101:21:@1703.4]
  assign ex_mem_io_datai = exec_io_data; // @[cpu.scala 102:21:@1704.4]
  assign ex_mem_io_wregi_wbrv = exec_io_wreg_wbrv; // @[cpu.scala 100:21:@1702.4]
  assign ex_mem_io_wregi_wbri = exec_io_wreg_wbri; // @[cpu.scala 100:21:@1701.4]
  assign ex_mem_io_wregi_wbrd = exec_io_wreg_wbrd; // @[cpu.scala 100:21:@1700.4]
  assign ex_mem_io_csr_wb_i_valid = exec_io_wcsr_valid; // @[cpu.scala 103:24:@1707.4]
  assign ex_mem_io_csr_wb_i_csr_idx = exec_io_wcsr_csr_idx; // @[cpu.scala 103:24:@1706.4]
  assign ex_mem_io_csr_wb_i_csr_data = exec_io_wcsr_csr_data; // @[cpu.scala 103:24:@1705.4]
  assign mem_wb_clock = clock; // @[:@1594.4]
  assign mem_wb_reset = reset; // @[:@1595.4]
  assign mem_wb_io_en = io_en; // @[cpu.scala 113:21:@1718.4]
  assign mem_wb_io_pass = memc_io_ready; // @[cpu.scala 53:20:@1648.4]
  assign mem_wb_io_wregi_wbrv = memc_io_wreg_wbrv; // @[cpu.scala 114:21:@1721.4]
  assign mem_wb_io_wregi_wbri = memc_io_wreg_wbri; // @[cpu.scala 114:21:@1720.4]
  assign mem_wb_io_wregi_wbrd = memc_io_wreg_wbrd; // @[cpu.scala 114:21:@1719.4]
  assign mem_wb_io_csr_wb_i_valid = ex_mem_io_csr_wb_o_valid; // @[cpu.scala 110:24:@1717.4]
  assign mem_wb_io_csr_wb_i_csr_idx = ex_mem_io_csr_wb_o_csr_idx; // @[cpu.scala 110:24:@1716.4]
  assign mem_wb_io_csr_wb_i_csr_data = ex_mem_io_csr_wb_o_csr_data; // @[cpu.scala 110:24:@1715.4]
  assign csr_clock = clock; // @[:@1597.4]
  assign csr_reset = reset; // @[:@1598.4]
  assign csr_io_id_addr = insd_io_csr_addr; // @[cpu.scala 124:21:@1739.4]
  assign csr_io_wrOp_valid = mem_wb_io_csr_wb_o_valid; // @[cpu.scala 116:24:@1727.4]
  assign csr_io_wrOp_csr_idx = mem_wb_io_csr_wb_o_csr_idx; // @[cpu.scala 116:24:@1726.4]
  assign csr_io_wrOp_csr_data = mem_wb_io_csr_wb_o_csr_data; // @[cpu.scala 116:24:@1725.4]
endmodule
