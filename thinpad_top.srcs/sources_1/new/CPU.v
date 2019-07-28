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
  input  [63:0] io_mmu_rdata, // @[:@6.4]
  output [31:0] io_excep_pc // @[:@6.4]
);
  wire [64:0] _T_54; // @[insreader.scala 26:24:@8.4]
  wire [63:0] npc; // @[insreader.scala 26:24:@9.4]
  wire [60:0] _T_55; // @[insreader.scala 27:36:@10.4]
  wire [60:0] _T_56; // @[insreader.scala 27:50:@11.4]
  wire  _T_57; // @[insreader.scala 27:43:@12.4]
  wire  cnrc; // @[insreader.scala 27:25:@13.4]
  wire [63:0] _T_58; // @[insreader.scala 39:22:@14.4]
  wire [63:0] _T_59; // @[insreader.scala 38:12:@15.4]
  wire [63:0] pco; // @[insreader.scala 36:20:@16.4]
  wire  _T_60; // @[insreader.scala 42:29:@17.4]
  wire  _T_62; // @[insreader.scala 42:17:@18.4]
  wire  nread; // @[insreader.scala 42:40:@19.4]
  wire  _T_64; // @[insreader.scala 44:22:@20.4]
  wire  _T_65; // @[insreader.scala 44:19:@21.4]
  wire  _T_66; // @[insreader.scala 45:16:@22.4]
  wire [31:0] _T_67; // @[insreader.scala 45:28:@23.4]
  wire [31:0] _T_68; // @[insreader.scala 45:44:@24.4]
  wire [31:0] _T_69; // @[insreader.scala 44:32:@25.4]
  wire [31:0] _T_72; // @[insreader.scala 50:37:@27.4]
  wire [31:0] _T_73; // @[insreader.scala 50:58:@28.4]
  wire [31:0] _T_74; // @[insreader.scala 49:16:@29.4]
  wire [31:0] _T_75; // @[insreader.scala 46:15:@30.4]
  wire [31:0] ins; // @[insreader.scala 43:20:@31.4]
  wire [63:0] insn; // @[insreader.scala 54:20:@32.4]
  wire [63:0] jnpc; // @[insreader.scala 55:20:@33.4]
  wire [63:0] addr; // @[insreader.scala 56:21:@35.4]
  wire  _T_98; // @[insreader.scala 67:26:@45.4]
  wire [64:0] _T_100; // @[insreader.scala 67:54:@46.4]
  wire [64:0] _T_101; // @[insreader.scala 67:54:@47.4]
  wire [63:0] _T_102; // @[insreader.scala 67:54:@48.4]
  wire [63:0] _T_108; // @[insreader.scala 68:19:@53.4]
  wire  _T_113; // @[insreader.scala 70:34:@59.4]
  assign _T_54 = io_lpc + 64'h4; // @[insreader.scala 26:24:@8.4]
  assign npc = io_lpc + 64'h4; // @[insreader.scala 26:24:@9.4]
  assign _T_55 = io_inspd[63:3]; // @[insreader.scala 27:36:@10.4]
  assign _T_56 = npc[63:3]; // @[insreader.scala 27:50:@11.4]
  assign _T_57 = _T_55 != _T_56; // @[insreader.scala 27:43:@12.4]
  assign cnrc = io_jump | _T_57; // @[insreader.scala 27:25:@13.4]
  assign _T_58 = io_jump ? io_jdest : npc; // @[insreader.scala 39:22:@14.4]
  assign _T_59 = cnrc ? _T_58 : npc; // @[insreader.scala 38:12:@15.4]
  assign pco = io_bubble ? io_lpc : _T_59; // @[insreader.scala 36:20:@16.4]
  assign _T_60 = io_bubble | io_nls; // @[insreader.scala 42:29:@17.4]
  assign _T_62 = _T_60 == 1'h0; // @[insreader.scala 42:17:@18.4]
  assign nread = _T_62 & cnrc; // @[insreader.scala 42:40:@19.4]
  assign _T_64 = cnrc == 1'h0; // @[insreader.scala 44:22:@20.4]
  assign _T_65 = io_bubble | _T_64; // @[insreader.scala 44:19:@21.4]
  assign _T_66 = pco[2]; // @[insreader.scala 45:16:@22.4]
  assign _T_67 = io_insp[63:32]; // @[insreader.scala 45:28:@23.4]
  assign _T_68 = io_insp[31:0]; // @[insreader.scala 45:44:@24.4]
  assign _T_69 = _T_66 ? _T_67 : _T_68; // @[insreader.scala 44:32:@25.4]
  assign _T_72 = io_mmu_rdata[63:32]; // @[insreader.scala 50:37:@27.4]
  assign _T_73 = io_mmu_rdata[31:0]; // @[insreader.scala 50:58:@28.4]
  assign _T_74 = _T_66 ? _T_72 : _T_73; // @[insreader.scala 49:16:@29.4]
  assign _T_75 = io_nls ? 32'h0 : _T_74; // @[insreader.scala 46:15:@30.4]
  assign ins = _T_65 ? _T_69 : _T_75; // @[insreader.scala 43:20:@31.4]
  assign insn = nread ? io_mmu_rdata : io_insp; // @[insreader.scala 54:20:@32.4]
  assign jnpc = io_jump ? io_jdest : pco; // @[insreader.scala 55:20:@33.4]
  assign addr = jnpc & 64'hfffffffffffffff8; // @[insreader.scala 56:21:@35.4]
  assign _T_98 = _T_64 | io_mmu_ready; // @[insreader.scala 67:26:@45.4]
  assign _T_100 = jnpc - 64'h4; // @[insreader.scala 67:54:@46.4]
  assign _T_101 = $unsigned(_T_100); // @[insreader.scala 67:54:@47.4]
  assign _T_102 = _T_101[63:0]; // @[insreader.scala 67:54:@48.4]
  assign _T_108 = _T_98 ? {{32'd0}, ins} : 64'h0; // @[insreader.scala 68:19:@53.4]
  assign _T_113 = io_mmu_ready & nread; // @[insreader.scala 70:34:@59.4]
  assign io_ins = _T_108[31:0]; // @[insreader.scala 68:13:@54.4]
  assign io_pc = _T_98 ? jnpc : _T_102; // @[insreader.scala 67:13:@50.4]
  assign io_insn = _T_98 ? insn : io_insp; // @[insreader.scala 69:13:@58.4]
  assign io_insnd = _T_113 ? addr : io_inspd; // @[insreader.scala 70:14:@61.4]
  assign io_mmu_mode = nread ? 4'hb : 4'hf; // @[insreader.scala 59:18:@39.4]
  assign io_mmu_addr = nread ? addr : 64'h0; // @[insreader.scala 58:17:@37.4]
  assign io_excep_pc = io_pc[31:0]; // @[insreader.scala 62:17:@40.4]
endmodule
module InsType( // @[:@65.2]
  input  [31:0] io_ins, // @[:@68.4]
  output [2:0]  io_ins_type, // @[:@68.4]
  output [3:0]  io_exe_type, // @[:@68.4]
  output        io_op32 // @[:@68.4]
);
  wire [2:0] funct3; // @[insType.scala 54:24:@70.4]
  wire [4:0] opcode; // @[insType.scala 55:24:@71.4]
  wire  _T_14; // @[insType.scala 57:24:@72.4]
  wire  _T_16; // @[insType.scala 57:49:@73.4]
  wire  _T_18; // @[insType.scala 59:30:@76.4]
  wire  _T_48; // @[Mux.scala 46:19:@77.4]
  wire [3:0] _T_49; // @[Mux.scala 46:16:@78.4]
  wire  _T_50; // @[Mux.scala 46:19:@79.4]
  wire [3:0] _T_51; // @[Mux.scala 46:16:@80.4]
  wire  _T_52; // @[Mux.scala 46:19:@81.4]
  wire [3:0] _T_53; // @[Mux.scala 46:16:@82.4]
  wire  _T_54; // @[Mux.scala 46:19:@83.4]
  wire [3:0] _T_55; // @[Mux.scala 46:16:@84.4]
  wire  _T_56; // @[Mux.scala 46:19:@85.4]
  wire [3:0] _T_57; // @[Mux.scala 46:16:@86.4]
  wire  _T_58; // @[Mux.scala 46:19:@87.4]
  wire [3:0] _T_59; // @[Mux.scala 46:16:@88.4]
  wire  _T_66; // @[insType.scala 89:38:@89.4]
  wire  _T_67; // @[insType.scala 90:25:@90.4]
  wire [3:0] _T_68; // @[insType.scala 90:18:@91.4]
  wire [3:0] _T_69; // @[insType.scala 89:30:@92.4]
  wire  _T_71; // @[Mux.scala 46:19:@93.4]
  wire [3:0] _T_72; // @[Mux.scala 46:16:@94.4]
  wire  _T_73; // @[Mux.scala 46:19:@95.4]
  wire [3:0] _T_74; // @[Mux.scala 46:16:@96.4]
  wire  _T_75; // @[Mux.scala 46:19:@97.4]
  wire [3:0] _T_76; // @[Mux.scala 46:16:@98.4]
  wire  _T_77; // @[Mux.scala 46:19:@99.4]
  wire [3:0] _T_78; // @[Mux.scala 46:16:@100.4]
  wire  _T_79; // @[Mux.scala 46:19:@101.4]
  wire [3:0] _T_80; // @[Mux.scala 46:16:@102.4]
  wire  _T_81; // @[Mux.scala 46:19:@103.4]
  wire [3:0] _T_82; // @[Mux.scala 46:16:@104.4]
  wire  _T_83; // @[Mux.scala 46:19:@105.4]
  wire [3:0] _T_84; // @[Mux.scala 46:16:@106.4]
  wire  _T_85; // @[Mux.scala 46:19:@107.4]
  wire [3:0] _T_86; // @[Mux.scala 46:16:@108.4]
  wire  _T_87; // @[Mux.scala 46:19:@109.4]
  wire [3:0] _T_88; // @[Mux.scala 46:16:@110.4]
  wire  _T_89; // @[Mux.scala 46:19:@111.4]
  wire [3:0] _T_90; // @[Mux.scala 46:16:@112.4]
  wire  _T_91; // @[Mux.scala 46:19:@113.4]
  wire [3:0] _T_92; // @[Mux.scala 46:16:@114.4]
  wire  _T_93; // @[Mux.scala 46:19:@115.4]
  wire [3:0] _T_94; // @[Mux.scala 46:16:@116.4]
  wire  _T_95; // @[Mux.scala 46:19:@117.4]
  wire [3:0] _T_96; // @[Mux.scala 46:16:@118.4]
  wire [2:0] _T_119; // @[Mux.scala 46:16:@123.4]
  wire [2:0] _T_121; // @[Mux.scala 46:16:@125.4]
  wire [2:0] _T_123; // @[Mux.scala 46:16:@127.4]
  wire [2:0] _T_125; // @[Mux.scala 46:16:@129.4]
  wire [2:0] _T_127; // @[Mux.scala 46:16:@131.4]
  wire [2:0] _T_129; // @[Mux.scala 46:16:@133.4]
  wire [2:0] _T_131; // @[Mux.scala 46:16:@135.4]
  wire [2:0] _T_133; // @[Mux.scala 46:16:@137.4]
  wire [2:0] _T_135; // @[Mux.scala 46:16:@139.4]
  wire [2:0] _T_137; // @[Mux.scala 46:16:@141.4]
  wire [2:0] _T_139; // @[Mux.scala 46:16:@143.4]
  wire [2:0] _T_141; // @[Mux.scala 46:16:@145.4]
  assign funct3 = io_ins[14:12]; // @[insType.scala 54:24:@70.4]
  assign opcode = io_ins[6:2]; // @[insType.scala 55:24:@71.4]
  assign _T_14 = opcode == 5'he; // @[insType.scala 57:24:@72.4]
  assign _T_16 = opcode == 5'h6; // @[insType.scala 57:49:@73.4]
  assign _T_18 = io_ins[0]; // @[insType.scala 59:30:@76.4]
  assign _T_48 = 3'h7 == funct3; // @[Mux.scala 46:19:@77.4]
  assign _T_49 = _T_48 ? 4'he : 4'h0; // @[Mux.scala 46:16:@78.4]
  assign _T_50 = 3'h6 == funct3; // @[Mux.scala 46:19:@79.4]
  assign _T_51 = _T_50 ? 4'hd : _T_49; // @[Mux.scala 46:16:@80.4]
  assign _T_52 = 3'h5 == funct3; // @[Mux.scala 46:19:@81.4]
  assign _T_53 = _T_52 ? 4'hc : _T_51; // @[Mux.scala 46:16:@82.4]
  assign _T_54 = 3'h4 == funct3; // @[Mux.scala 46:19:@83.4]
  assign _T_55 = _T_54 ? 4'hb : _T_53; // @[Mux.scala 46:16:@84.4]
  assign _T_56 = 3'h1 == funct3; // @[Mux.scala 46:19:@85.4]
  assign _T_57 = _T_56 ? 4'ha : _T_55; // @[Mux.scala 46:16:@86.4]
  assign _T_58 = 3'h0 == funct3; // @[Mux.scala 46:19:@87.4]
  assign _T_59 = _T_58 ? 4'h9 : _T_57; // @[Mux.scala 46:16:@88.4]
  assign _T_66 = funct3 != 3'h0; // @[insType.scala 89:38:@89.4]
  assign _T_67 = io_ins[14]; // @[insType.scala 90:25:@90.4]
  assign _T_68 = _T_67 ? 4'h7 : 4'h6; // @[insType.scala 90:18:@91.4]
  assign _T_69 = _T_66 ? _T_68 : 4'h1; // @[insType.scala 89:30:@92.4]
  assign _T_71 = 5'h3 == opcode; // @[Mux.scala 46:19:@93.4]
  assign _T_72 = _T_71 ? 4'h5 : 4'h0; // @[Mux.scala 46:16:@94.4]
  assign _T_73 = 5'h1c == opcode; // @[Mux.scala 46:19:@95.4]
  assign _T_74 = _T_73 ? _T_69 : _T_72; // @[Mux.scala 46:16:@96.4]
  assign _T_75 = 5'h19 == opcode; // @[Mux.scala 46:19:@97.4]
  assign _T_76 = _T_75 ? 4'hf : _T_74; // @[Mux.scala 46:16:@98.4]
  assign _T_77 = 5'h1b == opcode; // @[Mux.scala 46:19:@99.4]
  assign _T_78 = _T_77 ? 4'h8 : _T_76; // @[Mux.scala 46:16:@100.4]
  assign _T_79 = 5'hd == opcode; // @[Mux.scala 46:19:@101.4]
  assign _T_80 = _T_79 ? 4'h4 : _T_78; // @[Mux.scala 46:16:@102.4]
  assign _T_81 = 5'h5 == opcode; // @[Mux.scala 46:19:@103.4]
  assign _T_82 = _T_81 ? 4'h3 : _T_80; // @[Mux.scala 46:16:@104.4]
  assign _T_83 = 5'h18 == opcode; // @[Mux.scala 46:19:@105.4]
  assign _T_84 = _T_83 ? _T_59 : _T_82; // @[Mux.scala 46:16:@106.4]
  assign _T_85 = 5'h8 == opcode; // @[Mux.scala 46:19:@107.4]
  assign _T_86 = _T_85 ? 4'h2 : _T_84; // @[Mux.scala 46:16:@108.4]
  assign _T_87 = 5'h6 == opcode; // @[Mux.scala 46:19:@109.4]
  assign _T_88 = _T_87 ? 4'h0 : _T_86; // @[Mux.scala 46:16:@110.4]
  assign _T_89 = 5'h4 == opcode; // @[Mux.scala 46:19:@111.4]
  assign _T_90 = _T_89 ? 4'h0 : _T_88; // @[Mux.scala 46:16:@112.4]
  assign _T_91 = 5'h0 == opcode; // @[Mux.scala 46:19:@113.4]
  assign _T_92 = _T_91 ? 4'h2 : _T_90; // @[Mux.scala 46:16:@114.4]
  assign _T_93 = 5'he == opcode; // @[Mux.scala 46:19:@115.4]
  assign _T_94 = _T_93 ? 4'h0 : _T_92; // @[Mux.scala 46:16:@116.4]
  assign _T_95 = 5'hc == opcode; // @[Mux.scala 46:19:@117.4]
  assign _T_96 = _T_95 ? 4'h0 : _T_94; // @[Mux.scala 46:16:@118.4]
  assign _T_119 = _T_73 ? 3'h2 : 3'h0; // @[Mux.scala 46:16:@123.4]
  assign _T_121 = _T_77 ? 3'h6 : _T_119; // @[Mux.scala 46:16:@125.4]
  assign _T_123 = _T_79 ? 3'h5 : _T_121; // @[Mux.scala 46:16:@127.4]
  assign _T_125 = _T_81 ? 3'h5 : _T_123; // @[Mux.scala 46:16:@129.4]
  assign _T_127 = _T_83 ? 3'h4 : _T_125; // @[Mux.scala 46:16:@131.4]
  assign _T_129 = _T_85 ? 3'h3 : _T_127; // @[Mux.scala 46:16:@133.4]
  assign _T_131 = _T_87 ? 3'h2 : _T_129; // @[Mux.scala 46:16:@135.4]
  assign _T_133 = _T_75 ? 3'h2 : _T_131; // @[Mux.scala 46:16:@137.4]
  assign _T_135 = _T_89 ? 3'h2 : _T_133; // @[Mux.scala 46:16:@139.4]
  assign _T_137 = _T_91 ? 3'h2 : _T_135; // @[Mux.scala 46:16:@141.4]
  assign _T_139 = _T_93 ? 3'h1 : _T_137; // @[Mux.scala 46:16:@143.4]
  assign _T_141 = _T_95 ? 3'h1 : _T_139; // @[Mux.scala 46:16:@145.4]
  assign io_ins_type = _T_18 ? _T_141 : 3'h0; // @[insType.scala 97:17:@147.4]
  assign io_exe_type = _T_18 ? _T_96 : 4'h0; // @[insType.scala 59:17:@120.4]
  assign io_op32 = _T_14 | _T_16; // @[insType.scala 57:13:@75.4]
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
  wire  _T_26; // @[aluGen.scala 19:27:@219.4]
  wire [2:0] _T_27; // @[aluGen.scala 19:39:@220.4]
  wire [3:0] _T_28; // @[Cat.scala 30:58:@221.4]
  wire  _T_40; // @[Mux.scala 46:19:@222.4]
  wire [3:0] _T_41; // @[Mux.scala 46:16:@223.4]
  wire  _T_42; // @[Mux.scala 46:19:@224.4]
  wire [3:0] _T_43; // @[Mux.scala 46:16:@225.4]
  wire  _T_44; // @[Mux.scala 46:19:@226.4]
  wire [3:0] _T_45; // @[Mux.scala 46:16:@227.4]
  wire  _T_46; // @[Mux.scala 46:19:@228.4]
  wire [3:0] _T_47; // @[Mux.scala 46:16:@229.4]
  wire  _T_48; // @[Mux.scala 46:19:@230.4]
  wire [3:0] _T_49; // @[Mux.scala 46:16:@231.4]
  wire  _T_50; // @[Mux.scala 46:19:@232.4]
  wire [3:0] _T_51; // @[Mux.scala 46:16:@233.4]
  wire  _T_52; // @[Mux.scala 46:19:@234.4]
  wire [3:0] _T_53; // @[Mux.scala 46:16:@235.4]
  wire  _T_54; // @[Mux.scala 46:19:@236.4]
  wire [3:0] _T_55; // @[Mux.scala 46:16:@237.4]
  wire  _T_56; // @[Mux.scala 46:19:@238.4]
  wire [3:0] _T_57; // @[Mux.scala 46:16:@239.4]
  wire  _T_58; // @[Mux.scala 46:19:@240.4]
  wire [3:0] _T_59; // @[Mux.scala 46:16:@241.4]
  wire  _T_60; // @[aluGen.scala 35:27:@242.4]
  wire  _T_61; // @[aluGen.scala 35:42:@243.4]
  wire [4:0] _T_64; // @[Cat.scala 30:58:@246.4]
  wire [3:0] _T_74; // @[aluGen.scala 45:38:@248.4]
  wire  _T_81; // @[Mux.scala 46:19:@249.4]
  wire [3:0] _T_82; // @[Mux.scala 46:16:@250.4]
  wire  _T_83; // @[Mux.scala 46:19:@251.4]
  wire [3:0] _T_84; // @[Mux.scala 46:16:@252.4]
  wire  _T_85; // @[Mux.scala 46:19:@253.4]
  wire [3:0] _T_86; // @[Mux.scala 46:16:@254.4]
  wire  _T_87; // @[Mux.scala 46:19:@255.4]
  wire [3:0] _T_88; // @[Mux.scala 46:16:@256.4]
  wire  _T_89; // @[Mux.scala 46:19:@257.4]
  wire [3:0] _T_90; // @[Mux.scala 46:16:@258.4]
  wire  _T_91; // @[Mux.scala 46:19:@259.4]
  wire [3:0] _T_92; // @[Mux.scala 46:16:@260.4]
  wire  _T_93; // @[Mux.scala 46:19:@261.4]
  wire [3:0] _T_94; // @[Mux.scala 46:16:@262.4]
  wire  _T_95; // @[Mux.scala 46:19:@263.4]
  wire [3:0] _T_96; // @[Mux.scala 46:16:@264.4]
  wire  _T_97; // @[Mux.scala 46:19:@265.4]
  wire [3:0] _T_98; // @[Mux.scala 46:16:@266.4]
  wire  _T_99; // @[Mux.scala 46:19:@267.4]
  wire [3:0] _T_100; // @[Mux.scala 46:16:@268.4]
  wire  _T_101; // @[Mux.scala 46:19:@269.4]
  wire [3:0] _T_102; // @[Mux.scala 46:16:@270.4]
  wire  _T_103; // @[Mux.scala 46:19:@271.4]
  wire [3:0] _T_104; // @[Mux.scala 46:16:@272.4]
  wire  _T_105; // @[Mux.scala 46:19:@273.4]
  wire [3:0] _T_106; // @[Mux.scala 46:16:@274.4]
  wire  _T_107; // @[Mux.scala 46:19:@275.4]
  wire [3:0] _T_108; // @[Mux.scala 46:16:@276.4]
  wire  _T_109; // @[Mux.scala 46:19:@277.4]
  wire [3:0] _T_110; // @[Mux.scala 46:16:@278.4]
  wire  _T_111; // @[Mux.scala 46:19:@279.4]
  wire [3:0] _T_112; // @[Mux.scala 46:16:@280.4]
  wire  _T_113; // @[Mux.scala 46:19:@281.4]
  assign _T_26 = io_ins[30]; // @[aluGen.scala 19:27:@219.4]
  assign _T_27 = io_ins[14:12]; // @[aluGen.scala 19:39:@220.4]
  assign _T_28 = {_T_26,_T_27}; // @[Cat.scala 30:58:@221.4]
  assign _T_40 = 4'h7 == _T_28; // @[Mux.scala 46:19:@222.4]
  assign _T_41 = _T_40 ? 4'h4 : 4'h0; // @[Mux.scala 46:16:@223.4]
  assign _T_42 = 4'h6 == _T_28; // @[Mux.scala 46:19:@224.4]
  assign _T_43 = _T_42 ? 4'h5 : _T_41; // @[Mux.scala 46:16:@225.4]
  assign _T_44 = 4'hd == _T_28; // @[Mux.scala 46:19:@226.4]
  assign _T_45 = _T_44 ? 4'ha : _T_43; // @[Mux.scala 46:16:@227.4]
  assign _T_46 = 4'h5 == _T_28; // @[Mux.scala 46:19:@228.4]
  assign _T_47 = _T_46 ? 4'h9 : _T_45; // @[Mux.scala 46:16:@229.4]
  assign _T_48 = 4'h4 == _T_28; // @[Mux.scala 46:19:@230.4]
  assign _T_49 = _T_48 ? 4'h6 : _T_47; // @[Mux.scala 46:16:@231.4]
  assign _T_50 = 4'h3 == _T_28; // @[Mux.scala 46:19:@232.4]
  assign _T_51 = _T_50 ? 4'hc : _T_49; // @[Mux.scala 46:16:@233.4]
  assign _T_52 = 4'h2 == _T_28; // @[Mux.scala 46:19:@234.4]
  assign _T_53 = _T_52 ? 4'h7 : _T_51; // @[Mux.scala 46:16:@235.4]
  assign _T_54 = 4'h1 == _T_28; // @[Mux.scala 46:19:@236.4]
  assign _T_55 = _T_54 ? 4'h8 : _T_53; // @[Mux.scala 46:16:@237.4]
  assign _T_56 = 4'h8 == _T_28; // @[Mux.scala 46:19:@238.4]
  assign _T_57 = _T_56 ? 4'hb : _T_55; // @[Mux.scala 46:16:@239.4]
  assign _T_58 = 4'h0 == _T_28; // @[Mux.scala 46:19:@240.4]
  assign _T_59 = _T_58 ? 4'h3 : _T_57; // @[Mux.scala 46:16:@241.4]
  assign _T_60 = io_ins[6]; // @[aluGen.scala 35:27:@242.4]
  assign _T_61 = io_ins[4]; // @[aluGen.scala 35:42:@243.4]
  assign _T_64 = {_T_60,_T_61,_T_27}; // @[Cat.scala 30:58:@246.4]
  assign _T_74 = _T_26 ? 4'ha : 4'h9; // @[aluGen.scala 45:38:@248.4]
  assign _T_81 = 5'h1d == _T_64; // @[Mux.scala 46:19:@249.4]
  assign _T_82 = _T_81 ? 4'h1 : 4'h3; // @[Mux.scala 46:16:@250.4]
  assign _T_83 = 5'h19 == _T_64; // @[Mux.scala 46:19:@251.4]
  assign _T_84 = _T_83 ? 4'h1 : _T_82; // @[Mux.scala 46:16:@252.4]
  assign _T_85 = 5'h1f == _T_64; // @[Mux.scala 46:19:@253.4]
  assign _T_86 = _T_85 ? 4'hd : _T_84; // @[Mux.scala 46:16:@254.4]
  assign _T_87 = 5'h1b == _T_64; // @[Mux.scala 46:19:@255.4]
  assign _T_88 = _T_87 ? 4'hd : _T_86; // @[Mux.scala 46:16:@256.4]
  assign _T_89 = 5'h1e == _T_64; // @[Mux.scala 46:19:@257.4]
  assign _T_90 = _T_89 ? 4'h5 : _T_88; // @[Mux.scala 46:16:@258.4]
  assign _T_91 = 5'h1a == _T_64; // @[Mux.scala 46:19:@259.4]
  assign _T_92 = _T_91 ? 4'h5 : _T_90; // @[Mux.scala 46:16:@260.4]
  assign _T_93 = 5'hd == _T_64; // @[Mux.scala 46:19:@261.4]
  assign _T_94 = _T_93 ? _T_74 : _T_92; // @[Mux.scala 46:16:@262.4]
  assign _T_95 = 5'h9 == _T_64; // @[Mux.scala 46:19:@263.4]
  assign _T_96 = _T_95 ? 4'h8 : _T_94; // @[Mux.scala 46:16:@264.4]
  assign _T_97 = 5'hf == _T_64; // @[Mux.scala 46:19:@265.4]
  assign _T_98 = _T_97 ? 4'h4 : _T_96; // @[Mux.scala 46:16:@266.4]
  assign _T_99 = 5'he == _T_64; // @[Mux.scala 46:19:@267.4]
  assign _T_100 = _T_99 ? 4'h5 : _T_98; // @[Mux.scala 46:16:@268.4]
  assign _T_101 = 5'hc == _T_64; // @[Mux.scala 46:19:@269.4]
  assign _T_102 = _T_101 ? 4'h6 : _T_100; // @[Mux.scala 46:16:@270.4]
  assign _T_103 = 5'hb == _T_64; // @[Mux.scala 46:19:@271.4]
  assign _T_104 = _T_103 ? 4'hc : _T_102; // @[Mux.scala 46:16:@272.4]
  assign _T_105 = 5'ha == _T_64; // @[Mux.scala 46:19:@273.4]
  assign _T_106 = _T_105 ? 4'h7 : _T_104; // @[Mux.scala 46:16:@274.4]
  assign _T_107 = 5'h8 == _T_64; // @[Mux.scala 46:19:@275.4]
  assign _T_108 = _T_107 ? 4'h3 : _T_106; // @[Mux.scala 46:16:@276.4]
  assign _T_109 = 3'h2 == io_ins_type; // @[Mux.scala 46:19:@277.4]
  assign _T_110 = _T_109 ? _T_108 : 4'h0; // @[Mux.scala 46:16:@278.4]
  assign _T_111 = 3'h1 == io_ins_type; // @[Mux.scala 46:19:@279.4]
  assign _T_112 = _T_111 ? _T_59 : _T_110; // @[Mux.scala 46:16:@280.4]
  assign _T_113 = 3'h3 == io_ins_type; // @[Mux.scala 46:19:@281.4]
  assign io_ALUOp = _T_113 ? 4'h3 : _T_112; // @[aluGen.scala 13:14:@283.4]
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
  input  [1:0]  io_csr_priv, // @[:@288.4]
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
  input  [63:0] io_memWrReg_wbrd, // @[:@288.4]
  input  [31:0] io_if_excep_pc, // @[:@288.4]
  output        io_ex_excep_valid, // @[:@288.4]
  output [31:0] io_ex_excep_code, // @[:@288.4]
  output [31:0] io_ex_excep_value, // @[:@288.4]
  output [31:0] io_ex_excep_pc // @[:@288.4]
);
  wire [31:0] itype_io_ins; // @[decoder.scala 36:23:@290.4]
  wire [2:0] itype_io_ins_type; // @[decoder.scala 36:23:@290.4]
  wire [3:0] itype_io_exe_type; // @[decoder.scala 36:23:@290.4]
  wire  itype_io_op32; // @[decoder.scala 36:23:@290.4]
  wire [31:0] immg_io_ins; // @[decoder.scala 37:22:@293.4]
  wire [2:0] immg_io_ins_type; // @[decoder.scala 37:22:@293.4]
  wire [63:0] immg_io_imm; // @[decoder.scala 37:22:@293.4]
  wire [31:0] alug_io_ins; // @[decoder.scala 38:22:@296.4]
  wire [2:0] alug_io_ins_type; // @[decoder.scala 38:22:@296.4]
  wire [3:0] alug_io_ALUOp; // @[decoder.scala 38:22:@296.4]
  wire [4:0] rs1_index; // @[decoder.scala 50:27:@308.4]
  wire [4:0] rs2_index; // @[decoder.scala 51:27:@309.4]
  wire  _T_169; // @[decoder.scala 53:43:@310.4]
  wire  _T_170; // @[decoder.scala 53:24:@311.4]
  wire  _T_171; // @[decoder.scala 54:45:@312.4]
  wire  _T_172; // @[decoder.scala 54:25:@313.4]
  wire [63:0] _T_174; // @[Mux.scala 31:69:@314.4]
  wire [63:0] rs1_value; // @[Mux.scala 31:69:@315.4]
  wire  _T_175; // @[decoder.scala 58:43:@316.4]
  wire  _T_176; // @[decoder.scala 58:24:@317.4]
  wire  _T_177; // @[decoder.scala 59:45:@318.4]
  wire  _T_178; // @[decoder.scala 59:25:@319.4]
  wire [63:0] _T_180; // @[Mux.scala 31:69:@320.4]
  wire [4:0] rd_index; // @[decoder.scala 62:27:@322.4]
  wire  _T_181; // @[decoder.scala 63:40:@323.4]
  wire  _T_182; // @[decoder.scala 63:77:@324.4]
  wire  _T_183; // @[decoder.scala 63:56:@325.4]
  wire  _T_184; // @[decoder.scala 63:114:@326.4]
  wire  rs2_valid; // @[decoder.scala 63:93:@327.4]
  wire  _T_185; // @[decoder.scala 64:52:@328.4]
  wire  rs1_valid; // @[decoder.scala 64:31:@329.4]
  wire  _T_188; // @[decoder.scala 66:42:@332.4]
  wire  _T_189; // @[decoder.scala 66:100:@333.4]
  wire  _T_190; // @[decoder.scala 66:79:@334.4]
  wire  _T_191; // @[decoder.scala 66:137:@335.4]
  wire  _T_192; // @[decoder.scala 66:116:@336.4]
  wire  _T_194; // @[decoder.scala 67:17:@337.4]
  wire  _T_195; // @[decoder.scala 66:154:@338.4]
  wire  _T_196; // @[decoder.scala 67:47:@339.4]
  wire  _T_197; // @[decoder.scala 69:27:@341.4]
  wire  _T_198; // @[decoder.scala 70:20:@342.4]
  wire  _T_200; // @[decoder.scala 70:13:@343.4]
  wire [2:0] _T_201; // @[decoder.scala 70:31:@344.4]
  wire [3:0] _T_202; // @[Cat.scala 30:58:@345.4]
  wire [3:0] ls_mode; // @[decoder.scala 68:24:@346.4]
  wire  _T_203; // @[decoder.scala 73:75:@347.4]
  wire  _T_204; // @[decoder.scala 73:54:@348.4]
  wire  _T_205; // @[decoder.scala 73:125:@349.4]
  wire  _T_206; // @[decoder.scala 73:104:@350.4]
  wire  _T_207; // @[decoder.scala 73:90:@351.4]
  wire  _T_208; // @[decoder.scala 76:28:@353.4]
  wire  _T_210; // @[decoder.scala 76:53:@354.4]
  wire  _T_211; // @[decoder.scala 76:40:@355.4]
  wire  _T_213; // @[decoder.scala 77:28:@356.4]
  wire  _T_216; // @[decoder.scala 77:41:@358.4]
  wire  _T_221; // @[decoder.scala 92:38:@370.4]
  wire  _T_222; // @[decoder.scala 92:61:@371.4]
  wire  _T_226; // @[decoder.scala 101:22:@381.4]
  wire  _T_227; // @[decoder.scala 101:49:@382.4]
  wire  _T_228; // @[decoder.scala 102:22:@383.4]
  wire  _T_229; // @[decoder.scala 102:50:@384.4]
  wire [63:0] _T_231; // @[Mux.scala 31:69:@385.4]
  wire  _T_233; // @[decoder.scala 107:28:@392.4]
  wire [6:0] _T_234; // @[decoder.scala 108:29:@394.6]
  wire  _T_237; // @[decoder.scala 110:22:@396.6]
  wire  _T_244; // @[decoder.scala 114:49:@402.10]
  wire  _T_246; // @[decoder.scala 115:29:@403.10]
  wire [4:0] _T_280; // @[decoder.scala 115:18:@404.10]
  wire [4:0] _T_281; // @[decoder.scala 114:36:@405.10]
  wire [31:0] _GEN_2; // @[decoder.scala 111:35:@399.8]
  wire  _T_285; // @[Conditional.scala 37:30:@412.10]
  wire [3:0] _GEN_17; // @[Const.scala 66:31:@416.12]
  wire [3:0] _T_289; // @[Const.scala 66:31:@416.12]
  wire  _T_291; // @[Conditional.scala 37:30:@420.12]
  wire  _T_294; // @[Conditional.scala 37:30:@426.14]
  wire [1:0] _T_295; // @[decoder.scala 130:33:@428.16]
  wire  _T_297; // @[decoder.scala 132:53:@430.16]
  wire [4:0] _GEN_18; // @[Const.scala 67:30:@432.16]
  wire [4:0] _T_300; // @[Const.scala 67:30:@432.16]
  wire [4:0] _T_301; // @[decoder.scala 132:40:@433.16]
  wire [31:0] _GEN_4; // @[Conditional.scala 39:67:@427.14]
  wire  _GEN_5; // @[Conditional.scala 39:67:@421.12]
  wire [31:0] _GEN_6; // @[Conditional.scala 39:67:@421.12]
  wire  _GEN_7; // @[Conditional.scala 40:58:@413.10]
  wire [31:0] _GEN_8; // @[Conditional.scala 40:58:@413.10]
  wire  _GEN_11; // @[decoder.scala 110:49:@397.6]
  wire [63:0] _GEN_12; // @[decoder.scala 110:49:@397.6]
  wire [31:0] _GEN_13; // @[decoder.scala 110:49:@397.6]
  wire [63:0] _GEN_15; // @[decoder.scala 107:42:@393.4]
  InsType itype ( // @[decoder.scala 36:23:@290.4]
    .io_ins(itype_io_ins),
    .io_ins_type(itype_io_ins_type),
    .io_exe_type(itype_io_exe_type),
    .io_op32(itype_io_op32)
  );
  ImmGen immg ( // @[decoder.scala 37:22:@293.4]
    .io_ins(immg_io_ins),
    .io_ins_type(immg_io_ins_type),
    .io_imm(immg_io_imm)
  );
  ALUGen alug ( // @[decoder.scala 38:22:@296.4]
    .io_ins(alug_io_ins),
    .io_ins_type(alug_io_ins_type),
    .io_ALUOp(alug_io_ALUOp)
  );
  assign rs1_index = io_ins[19:15]; // @[decoder.scala 50:27:@308.4]
  assign rs2_index = io_ins[24:20]; // @[decoder.scala 51:27:@309.4]
  assign _T_169 = io_exWrReg_wbri == rs1_index; // @[decoder.scala 53:43:@310.4]
  assign _T_170 = io_exWrReg_wbrv & _T_169; // @[decoder.scala 53:24:@311.4]
  assign _T_171 = io_memWrReg_wbri == rs1_index; // @[decoder.scala 54:45:@312.4]
  assign _T_172 = io_memWrReg_wbrv & _T_171; // @[decoder.scala 54:25:@313.4]
  assign _T_174 = _T_172 ? io_memWrReg_wbrd : io_regr_r1d; // @[Mux.scala 31:69:@314.4]
  assign rs1_value = _T_170 ? io_exWrReg_wbrd : _T_174; // @[Mux.scala 31:69:@315.4]
  assign _T_175 = io_exWrReg_wbri == rs2_index; // @[decoder.scala 58:43:@316.4]
  assign _T_176 = io_exWrReg_wbrv & _T_175; // @[decoder.scala 58:24:@317.4]
  assign _T_177 = io_memWrReg_wbri == rs2_index; // @[decoder.scala 59:45:@318.4]
  assign _T_178 = io_memWrReg_wbrv & _T_177; // @[decoder.scala 59:25:@319.4]
  assign _T_180 = _T_178 ? io_memWrReg_wbrd : io_regr_r2d; // @[Mux.scala 31:69:@320.4]
  assign rd_index = io_ins[11:7]; // @[decoder.scala 62:27:@322.4]
  assign _T_181 = itype_io_ins_type == 3'h1; // @[decoder.scala 63:40:@323.4]
  assign _T_182 = itype_io_ins_type == 3'h3; // @[decoder.scala 63:77:@324.4]
  assign _T_183 = _T_181 | _T_182; // @[decoder.scala 63:56:@325.4]
  assign _T_184 = itype_io_ins_type == 3'h4; // @[decoder.scala 63:114:@326.4]
  assign rs2_valid = _T_183 | _T_184; // @[decoder.scala 63:93:@327.4]
  assign _T_185 = itype_io_ins_type == 3'h2; // @[decoder.scala 64:52:@328.4]
  assign rs1_valid = rs2_valid | _T_185; // @[decoder.scala 64:31:@329.4]
  assign _T_188 = _T_181 | _T_185; // @[decoder.scala 66:42:@332.4]
  assign _T_189 = itype_io_ins_type == 3'h5; // @[decoder.scala 66:100:@333.4]
  assign _T_190 = _T_188 | _T_189; // @[decoder.scala 66:79:@334.4]
  assign _T_191 = itype_io_ins_type == 3'h6; // @[decoder.scala 66:137:@335.4]
  assign _T_192 = _T_190 | _T_191; // @[decoder.scala 66:116:@336.4]
  assign _T_194 = rd_index != 5'h0; // @[decoder.scala 67:17:@337.4]
  assign _T_195 = _T_192 & _T_194; // @[decoder.scala 66:154:@338.4]
  assign _T_196 = itype_io_exe_type != 4'h1; // @[decoder.scala 67:47:@339.4]
  assign _T_197 = itype_io_exe_type == 4'h2; // @[decoder.scala 69:27:@341.4]
  assign _T_198 = io_ins[5]; // @[decoder.scala 70:20:@342.4]
  assign _T_200 = _T_198 == 1'h0; // @[decoder.scala 70:13:@343.4]
  assign _T_201 = io_ins[14:12]; // @[decoder.scala 70:31:@344.4]
  assign _T_202 = {_T_200,_T_201}; // @[Cat.scala 30:58:@345.4]
  assign ls_mode = _T_197 ? _T_202 : 4'hf; // @[decoder.scala 68:24:@346.4]
  assign _T_203 = io_lastload_index == rs1_index; // @[decoder.scala 73:75:@347.4]
  assign _T_204 = rs1_valid & _T_203; // @[decoder.scala 73:54:@348.4]
  assign _T_205 = io_lastload_index == rs2_index; // @[decoder.scala 73:125:@349.4]
  assign _T_206 = rs2_valid & _T_205; // @[decoder.scala 73:104:@350.4]
  assign _T_207 = _T_204 | _T_206; // @[decoder.scala 73:90:@351.4]
  assign _T_208 = itype_io_exe_type == 4'h6; // @[decoder.scala 76:28:@353.4]
  assign _T_210 = rs1_index != 5'h0; // @[decoder.scala 76:53:@354.4]
  assign _T_211 = _T_208 & _T_210; // @[decoder.scala 76:40:@355.4]
  assign _T_213 = itype_io_exe_type == 4'h7; // @[decoder.scala 77:28:@356.4]
  assign _T_216 = _T_213 & _T_210; // @[decoder.scala 77:41:@358.4]
  assign _T_221 = ls_mode != 4'hf; // @[decoder.scala 92:38:@370.4]
  assign _T_222 = ls_mode[3]; // @[decoder.scala 92:61:@371.4]
  assign _T_226 = io_csr_addr == io_csr_from_ex_csr_idx; // @[decoder.scala 101:22:@381.4]
  assign _T_227 = _T_226 & io_csr_from_ex_valid; // @[decoder.scala 101:49:@382.4]
  assign _T_228 = io_csr_addr == io_csr_from_mem_csr_idx; // @[decoder.scala 102:22:@383.4]
  assign _T_229 = _T_228 & io_csr_from_mem_valid; // @[decoder.scala 102:50:@384.4]
  assign _T_231 = _T_229 ? io_csr_from_mem_csr_data : io_csr_rdata; // @[Mux.scala 31:69:@385.4]
  assign _T_233 = itype_io_exe_type == 4'h1; // @[decoder.scala 107:28:@392.4]
  assign _T_234 = io_ins[31:25]; // @[decoder.scala 108:29:@394.6]
  assign _T_237 = _T_234 == 7'h9; // @[decoder.scala 110:22:@396.6]
  assign _T_244 = io_csr_priv >= 2'h1; // @[decoder.scala 114:49:@402.10]
  assign _T_246 = rs1_index == 5'h0; // @[decoder.scala 115:29:@403.10]
  assign _T_280 = _T_246 ? 5'h15 : 5'h14; // @[decoder.scala 115:18:@404.10]
  assign _T_281 = _T_244 ? _T_280 : 5'h2; // @[decoder.scala 114:36:@405.10]
  assign _GEN_2 = {{27'd0}, _T_281}; // @[decoder.scala 111:35:@399.8]
  assign _T_285 = 5'h0 == rs2_index; // @[Conditional.scala 37:30:@412.10]
  assign _GEN_17 = {{2'd0}, io_csr_priv}; // @[Const.scala 66:31:@416.12]
  assign _T_289 = 4'h8 | _GEN_17; // @[Const.scala 66:31:@416.12]
  assign _T_291 = 5'h1 == rs2_index; // @[Conditional.scala 37:30:@420.12]
  assign _T_294 = 5'h2 == rs2_index; // @[Conditional.scala 37:30:@426.14]
  assign _T_295 = io_ins[29:28]; // @[decoder.scala 130:33:@428.16]
  assign _T_297 = io_csr_priv >= _T_295; // @[decoder.scala 132:53:@430.16]
  assign _GEN_18 = {{3'd0}, _T_295}; // @[Const.scala 67:30:@432.16]
  assign _T_300 = 5'h10 | _GEN_18; // @[Const.scala 67:30:@432.16]
  assign _T_301 = _T_297 ? _T_300 : 5'h2; // @[decoder.scala 132:40:@433.16]
  assign _GEN_4 = _T_294 ? {{27'd0}, _T_301} : 32'h0; // @[Conditional.scala 39:67:@427.14]
  assign _GEN_5 = _T_291 ? 1'h1 : _T_294; // @[Conditional.scala 39:67:@421.12]
  assign _GEN_6 = _T_291 ? 32'h3 : _GEN_4; // @[Conditional.scala 39:67:@421.12]
  assign _GEN_7 = _T_285 ? 1'h1 : _GEN_5; // @[Conditional.scala 40:58:@413.10]
  assign _GEN_8 = _T_285 ? {{28'd0}, _T_289} : _GEN_6; // @[Conditional.scala 40:58:@413.10]
  assign _GEN_11 = _T_237 ? 1'h1 : _GEN_7; // @[decoder.scala 110:49:@397.6]
  assign _GEN_12 = _T_237 ? rs1_value : 64'h0; // @[decoder.scala 110:49:@397.6]
  assign _GEN_13 = _T_237 ? _GEN_2 : _GEN_8; // @[decoder.scala 110:49:@397.6]
  assign _GEN_15 = _T_233 ? _GEN_12 : 64'h0; // @[decoder.scala 107:42:@393.4]
  assign io_loadinfo_valid = _T_221 & _T_222; // @[decoder.scala 92:27:@373.4]
  assign io_loadinfo_index = io_ins[11:7]; // @[decoder.scala 93:27:@374.4]
  assign io_imm = immg_io_imm; // @[decoder.scala 45:23:@304.4]
  assign io_ALUOp = alug_io_ALUOp; // @[decoder.scala 46:23:@305.4]
  assign io_exe_type = itype_io_exe_type; // @[decoder.scala 47:23:@306.4]
  assign io_ls_mode = _T_197 ? _T_202 : 4'hf; // @[decoder.scala 91:23:@369.4]
  assign io_op32 = itype_io_op32; // @[decoder.scala 48:23:@307.4]
  assign io_bubble = io_lastload_valid & _T_207; // @[decoder.scala 94:23:@375.4]
  assign io_regr_r1 = io_ins[19:15]; // @[decoder.scala 86:23:@365.4]
  assign io_regr_r2 = io_ins[24:20]; // @[decoder.scala 87:23:@366.4]
  assign io_dreg_rs2_valid = _T_183 | _T_184; // @[decoder.scala 82:23:@361.4]
  assign io_dreg_rs1_value = _T_170 ? io_exWrReg_wbrd : _T_174; // @[decoder.scala 88:23:@367.4]
  assign io_dreg_rs2_value = _T_176 ? io_exWrReg_wbrd : _T_180; // @[decoder.scala 89:23:@368.4]
  assign io_dreg_rd_valid = _T_195 & _T_196; // @[decoder.scala 84:23:@363.4]
  assign io_dreg_rd_index = io_ins[11:7]; // @[decoder.scala 85:23:@364.4]
  assign io_csr_addr = io_ins[31:20]; // @[decoder.scala 96:23:@377.4]
  assign io_csr_content_valid = _T_211 ? 1'h1 : _T_216; // @[decoder.scala 97:29:@378.4]
  assign io_csr_content_csr_idx = io_ins[31:20]; // @[decoder.scala 98:32:@380.4]
  assign io_csr_content_csr_data = _T_227 ? io_csr_from_ex_csr_data : _T_231; // @[decoder.scala 100:29:@387.4]
  assign io_ex_excep_valid = _T_233 ? _GEN_11 : 1'h0; // @[decoder.scala 106:17:@391.4 decoder.scala 112:31:@400.10 decoder.scala 122:35:@414.12 decoder.scala 126:35:@422.14 decoder.scala 131:35:@429.16]
  assign io_ex_excep_code = _T_233 ? _GEN_13 : 32'h0; // @[decoder.scala 106:17:@390.4 decoder.scala 114:30:@406.10 decoder.scala 123:34:@417.12 decoder.scala 127:34:@423.14 decoder.scala 132:34:@434.16]
  assign io_ex_excep_value = _GEN_15[31:0]; // @[decoder.scala 106:17:@389.4 decoder.scala 113:31:@401.10]
  assign io_ex_excep_pc = io_if_excep_pc; // @[decoder.scala 106:17:@388.4]
  assign itype_io_ins = io_ins; // @[decoder.scala 40:23:@299.4]
  assign immg_io_ins = io_ins; // @[decoder.scala 41:23:@300.4]
  assign immg_io_ins_type = itype_io_ins_type; // @[decoder.scala 43:23:@302.4]
  assign alug_io_ins = io_ins; // @[decoder.scala 42:23:@301.4]
  assign alug_io_ins_type = itype_io_ins_type; // @[decoder.scala 44:23:@303.4]
endmodule
module ALU( // @[:@440.2]
  input  [3:0]  io_ALUOp, // @[:@443.4]
  input         io_op32, // @[:@443.4]
  input  [63:0] io_inputA, // @[:@443.4]
  input  [63:0] io_inputB, // @[:@443.4]
  output [63:0] io_output // @[:@443.4]
);
  wire [5:0] shamt; // @[alu.scala 32:26:@445.4]
  wire [4:0] shamt32; // @[alu.scala 33:28:@446.4]
  wire [31:0] inputA32; // @[alu.scala 34:29:@447.4]
  wire [31:0] inputB32; // @[alu.scala 35:29:@448.4]
  wire [32:0] _T_16; // @[alu.scala 40:39:@449.4]
  wire [31:0] _T_17; // @[alu.scala 40:39:@450.4]
  wire [62:0] _GEN_0; // @[alu.scala 41:39:@451.4]
  wire [62:0] _T_18; // @[alu.scala 41:39:@451.4]
  wire [31:0] _T_19; // @[alu.scala 42:38:@452.4]
  wire [31:0] _T_20; // @[alu.scala 43:40:@453.4]
  wire [31:0] _T_21; // @[alu.scala 43:47:@454.4]
  wire [31:0] _T_22; // @[alu.scala 43:59:@455.4]
  wire [32:0] _T_23; // @[alu.scala 44:39:@456.4]
  wire [32:0] _T_24; // @[alu.scala 44:39:@457.4]
  wire [31:0] _T_25; // @[alu.scala 44:39:@458.4]
  wire  _T_26; // @[Mux.scala 46:19:@459.4]
  wire [31:0] _T_27; // @[Mux.scala 46:16:@460.4]
  wire  _T_28; // @[Mux.scala 46:19:@461.4]
  wire [31:0] _T_29; // @[Mux.scala 46:16:@462.4]
  wire  _T_30; // @[Mux.scala 46:19:@463.4]
  wire [31:0] _T_31; // @[Mux.scala 46:16:@464.4]
  wire  _T_32; // @[Mux.scala 46:19:@465.4]
  wire [62:0] _T_33; // @[Mux.scala 46:16:@466.4]
  wire  _T_34; // @[Mux.scala 46:19:@467.4]
  wire [62:0] op32res; // @[Mux.scala 46:16:@468.4]
  wire  _T_35; // @[alu.scala 48:29:@469.4]
  wire [31:0] _T_39; // @[Bitwise.scala 72:12:@471.4]
  wire [31:0] _T_40; // @[alu.scala 48:43:@472.4]
  wire [63:0] _T_41; // @[Cat.scala 30:58:@473.4]
  wire [64:0] _T_44; // @[alu.scala 56:44:@474.4]
  wire [63:0] _T_45; // @[alu.scala 56:44:@475.4]
  wire [63:0] _T_46; // @[alu.scala 57:44:@476.4]
  wire [63:0] _T_47; // @[alu.scala 58:43:@477.4]
  wire [63:0] _T_48; // @[alu.scala 59:44:@478.4]
  wire  _T_49; // @[alu.scala 60:46:@479.4]
  wire [63:0] _T_50; // @[alu.scala 61:45:@480.4]
  wire [63:0] _T_51; // @[alu.scala 61:64:@481.4]
  wire  _T_52; // @[alu.scala 61:52:@482.4]
  wire [126:0] _GEN_1; // @[alu.scala 62:44:@483.4]
  wire [126:0] _T_53; // @[alu.scala 62:44:@483.4]
  wire [63:0] _T_54; // @[alu.scala 63:43:@484.4]
  wire [63:0] _T_56; // @[alu.scala 64:52:@486.4]
  wire [63:0] _T_57; // @[alu.scala 64:62:@487.4]
  wire [64:0] _T_58; // @[alu.scala 65:44:@488.4]
  wire [64:0] _T_59; // @[alu.scala 65:44:@489.4]
  wire [63:0] _T_60; // @[alu.scala 65:44:@490.4]
  wire [63:0] _T_61; // @[alu.scala 66:34:@491.4]
  wire [63:0] _T_62; // @[alu.scala 66:45:@492.4]
  wire  _T_63; // @[Mux.scala 46:19:@493.4]
  wire [63:0] _T_64; // @[Mux.scala 46:16:@494.4]
  wire [63:0] _T_66; // @[Mux.scala 46:16:@496.4]
  wire [63:0] _T_68; // @[Mux.scala 46:16:@498.4]
  wire [63:0] _T_70; // @[Mux.scala 46:16:@500.4]
  wire [126:0] _T_72; // @[Mux.scala 46:16:@502.4]
  wire  _T_73; // @[Mux.scala 46:19:@503.4]
  wire [126:0] _T_74; // @[Mux.scala 46:16:@504.4]
  wire  _T_75; // @[Mux.scala 46:19:@505.4]
  wire [126:0] _T_76; // @[Mux.scala 46:16:@506.4]
  wire  _T_77; // @[Mux.scala 46:19:@507.4]
  wire [126:0] _T_78; // @[Mux.scala 46:16:@508.4]
  wire  _T_79; // @[Mux.scala 46:19:@509.4]
  wire [126:0] _T_80; // @[Mux.scala 46:16:@510.4]
  wire  _T_81; // @[Mux.scala 46:19:@511.4]
  wire [126:0] _T_82; // @[Mux.scala 46:16:@512.4]
  wire [126:0] _T_84; // @[Mux.scala 46:16:@514.4]
  wire  _T_85; // @[Mux.scala 46:19:@515.4]
  wire [126:0] _T_86; // @[Mux.scala 46:16:@516.4]
  wire  _T_87; // @[Mux.scala 46:19:@517.4]
  wire [126:0] _T_88; // @[Mux.scala 46:16:@518.4]
  wire  _T_89; // @[Mux.scala 46:19:@519.4]
  wire [126:0] _T_90; // @[Mux.scala 46:16:@520.4]
  wire [126:0] _T_91; // @[alu.scala 47:21:@521.4]
  assign shamt = io_inputB[5:0]; // @[alu.scala 32:26:@445.4]
  assign shamt32 = io_inputB[4:0]; // @[alu.scala 33:28:@446.4]
  assign inputA32 = io_inputA[31:0]; // @[alu.scala 34:29:@447.4]
  assign inputB32 = io_inputB[31:0]; // @[alu.scala 35:29:@448.4]
  assign _T_16 = inputA32 + inputB32; // @[alu.scala 40:39:@449.4]
  assign _T_17 = inputA32 + inputB32; // @[alu.scala 40:39:@450.4]
  assign _GEN_0 = {{31'd0}, inputA32}; // @[alu.scala 41:39:@451.4]
  assign _T_18 = _GEN_0 << shamt32; // @[alu.scala 41:39:@451.4]
  assign _T_19 = inputA32 >> shamt32; // @[alu.scala 42:38:@452.4]
  assign _T_20 = $signed(inputA32); // @[alu.scala 43:40:@453.4]
  assign _T_21 = $signed(_T_20) >>> shamt32; // @[alu.scala 43:47:@454.4]
  assign _T_22 = $unsigned(_T_21); // @[alu.scala 43:59:@455.4]
  assign _T_23 = inputA32 - inputB32; // @[alu.scala 44:39:@456.4]
  assign _T_24 = $unsigned(_T_23); // @[alu.scala 44:39:@457.4]
  assign _T_25 = _T_24[31:0]; // @[alu.scala 44:39:@458.4]
  assign _T_26 = 4'hb == io_ALUOp; // @[Mux.scala 46:19:@459.4]
  assign _T_27 = _T_26 ? _T_25 : 32'h0; // @[Mux.scala 46:16:@460.4]
  assign _T_28 = 4'ha == io_ALUOp; // @[Mux.scala 46:19:@461.4]
  assign _T_29 = _T_28 ? _T_22 : _T_27; // @[Mux.scala 46:16:@462.4]
  assign _T_30 = 4'h9 == io_ALUOp; // @[Mux.scala 46:19:@463.4]
  assign _T_31 = _T_30 ? _T_19 : _T_29; // @[Mux.scala 46:16:@464.4]
  assign _T_32 = 4'h8 == io_ALUOp; // @[Mux.scala 46:19:@465.4]
  assign _T_33 = _T_32 ? _T_18 : {{31'd0}, _T_31}; // @[Mux.scala 46:16:@466.4]
  assign _T_34 = 4'h3 == io_ALUOp; // @[Mux.scala 46:19:@467.4]
  assign op32res = _T_34 ? {{31'd0}, _T_17} : _T_33; // @[Mux.scala 46:16:@468.4]
  assign _T_35 = op32res[31]; // @[alu.scala 48:29:@469.4]
  assign _T_39 = _T_35 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12:@471.4]
  assign _T_40 = op32res[31:0]; // @[alu.scala 48:43:@472.4]
  assign _T_41 = {_T_39,_T_40}; // @[Cat.scala 30:58:@473.4]
  assign _T_44 = io_inputA + io_inputB; // @[alu.scala 56:44:@474.4]
  assign _T_45 = io_inputA + io_inputB; // @[alu.scala 56:44:@475.4]
  assign _T_46 = io_inputA & io_inputB; // @[alu.scala 57:44:@476.4]
  assign _T_47 = io_inputA | io_inputB; // @[alu.scala 58:43:@477.4]
  assign _T_48 = io_inputA ^ io_inputB; // @[alu.scala 59:44:@478.4]
  assign _T_49 = io_inputA < io_inputB; // @[alu.scala 60:46:@479.4]
  assign _T_50 = $signed(io_inputA); // @[alu.scala 61:45:@480.4]
  assign _T_51 = $signed(io_inputB); // @[alu.scala 61:64:@481.4]
  assign _T_52 = $signed(_T_50) < $signed(_T_51); // @[alu.scala 61:52:@482.4]
  assign _GEN_1 = {{63'd0}, io_inputA}; // @[alu.scala 62:44:@483.4]
  assign _T_53 = _GEN_1 << shamt; // @[alu.scala 62:44:@483.4]
  assign _T_54 = io_inputA >> shamt; // @[alu.scala 63:43:@484.4]
  assign _T_56 = $signed(_T_50) >>> shamt; // @[alu.scala 64:52:@486.4]
  assign _T_57 = $unsigned(_T_56); // @[alu.scala 64:62:@487.4]
  assign _T_58 = io_inputA - io_inputB; // @[alu.scala 65:44:@488.4]
  assign _T_59 = $unsigned(_T_58); // @[alu.scala 65:44:@489.4]
  assign _T_60 = _T_59[63:0]; // @[alu.scala 65:44:@490.4]
  assign _T_61 = ~ io_inputA; // @[alu.scala 66:34:@491.4]
  assign _T_62 = _T_61 & io_inputB; // @[alu.scala 66:45:@492.4]
  assign _T_63 = 4'hd == io_ALUOp; // @[Mux.scala 46:19:@493.4]
  assign _T_64 = _T_63 ? _T_62 : 64'h0; // @[Mux.scala 46:16:@494.4]
  assign _T_66 = _T_26 ? _T_60 : _T_64; // @[Mux.scala 46:16:@496.4]
  assign _T_68 = _T_28 ? _T_57 : _T_66; // @[Mux.scala 46:16:@498.4]
  assign _T_70 = _T_30 ? _T_54 : _T_68; // @[Mux.scala 46:16:@500.4]
  assign _T_72 = _T_32 ? _T_53 : {{63'd0}, _T_70}; // @[Mux.scala 46:16:@502.4]
  assign _T_73 = 4'h7 == io_ALUOp; // @[Mux.scala 46:19:@503.4]
  assign _T_74 = _T_73 ? {{126'd0}, _T_52} : _T_72; // @[Mux.scala 46:16:@504.4]
  assign _T_75 = 4'hc == io_ALUOp; // @[Mux.scala 46:19:@505.4]
  assign _T_76 = _T_75 ? {{126'd0}, _T_49} : _T_74; // @[Mux.scala 46:16:@506.4]
  assign _T_77 = 4'h6 == io_ALUOp; // @[Mux.scala 46:19:@507.4]
  assign _T_78 = _T_77 ? {{63'd0}, _T_48} : _T_76; // @[Mux.scala 46:16:@508.4]
  assign _T_79 = 4'h5 == io_ALUOp; // @[Mux.scala 46:19:@509.4]
  assign _T_80 = _T_79 ? {{63'd0}, _T_47} : _T_78; // @[Mux.scala 46:16:@510.4]
  assign _T_81 = 4'h4 == io_ALUOp; // @[Mux.scala 46:19:@511.4]
  assign _T_82 = _T_81 ? {{63'd0}, _T_46} : _T_80; // @[Mux.scala 46:16:@512.4]
  assign _T_84 = _T_34 ? {{63'd0}, _T_45} : _T_82; // @[Mux.scala 46:16:@514.4]
  assign _T_85 = 4'h2 == io_ALUOp; // @[Mux.scala 46:19:@515.4]
  assign _T_86 = _T_85 ? {{63'd0}, io_inputB} : _T_84; // @[Mux.scala 46:16:@516.4]
  assign _T_87 = 4'h1 == io_ALUOp; // @[Mux.scala 46:19:@517.4]
  assign _T_88 = _T_87 ? {{63'd0}, io_inputA} : _T_86; // @[Mux.scala 46:16:@518.4]
  assign _T_89 = 4'h0 == io_ALUOp; // @[Mux.scala 46:19:@519.4]
  assign _T_90 = _T_89 ? 127'h0 : _T_88; // @[Mux.scala 46:16:@520.4]
  assign _T_91 = io_op32 ? {{63'd0}, _T_41} : _T_90; // @[alu.scala 47:21:@521.4]
  assign io_output = _T_91[63:0]; // @[alu.scala 47:15:@522.4]
endmodule
module BranchCtrl( // @[:@526.2]
  input  [3:0]  io_exeType, // @[:@529.4]
  input  [63:0] io_input1, // @[:@529.4]
  input  [63:0] io_input2, // @[:@529.4]
  output        io_jump // @[:@529.4]
);
  wire [64:0] _T_13; // @[branch.scala 27:25:@531.4]
  wire [64:0] _T_14; // @[branch.scala 27:25:@532.4]
  wire [63:0] x; // @[branch.scala 27:25:@533.4]
  wire  ne; // @[branch.scala 28:17:@534.4]
  wire  eq; // @[branch.scala 29:15:@535.4]
  wire  _T_17; // @[branch.scala 30:24:@536.4]
  wire  _T_18; // @[branch.scala 30:42:@537.4]
  wire  st; // @[branch.scala 30:29:@538.4]
  wire  _T_19; // @[branch.scala 31:24:@539.4]
  wire  lt; // @[branch.scala 31:18:@541.4]
  wire  ge; // @[branch.scala 32:15:@542.4]
  wire  _T_23; // @[branch.scala 33:39:@544.4]
  wire  ltu; // @[branch.scala 33:18:@545.4]
  wire  geu; // @[branch.scala 34:15:@546.4]
  wire  _T_36; // @[Mux.scala 46:19:@547.4]
  wire  _T_38; // @[Mux.scala 46:19:@549.4]
  wire  _T_39; // @[Mux.scala 46:16:@550.4]
  wire  _T_40; // @[Mux.scala 46:19:@551.4]
  wire  _T_41; // @[Mux.scala 46:16:@552.4]
  wire  _T_42; // @[Mux.scala 46:19:@553.4]
  wire  _T_43; // @[Mux.scala 46:16:@554.4]
  wire  _T_44; // @[Mux.scala 46:19:@555.4]
  wire  _T_45; // @[Mux.scala 46:16:@556.4]
  wire  _T_46; // @[Mux.scala 46:19:@557.4]
  wire  _T_47; // @[Mux.scala 46:16:@558.4]
  wire  _T_48; // @[Mux.scala 46:19:@559.4]
  wire  _T_49; // @[Mux.scala 46:16:@560.4]
  wire  _T_50; // @[Mux.scala 46:19:@561.4]
  assign _T_13 = io_input1 - io_input2; // @[branch.scala 27:25:@531.4]
  assign _T_14 = $unsigned(_T_13); // @[branch.scala 27:25:@532.4]
  assign x = _T_14[63:0]; // @[branch.scala 27:25:@533.4]
  assign ne = x != 64'h0; // @[branch.scala 28:17:@534.4]
  assign eq = ne == 1'h0; // @[branch.scala 29:15:@535.4]
  assign _T_17 = io_input1[63]; // @[branch.scala 30:24:@536.4]
  assign _T_18 = io_input2[62]; // @[branch.scala 30:42:@537.4]
  assign st = _T_17 == _T_18; // @[branch.scala 30:29:@538.4]
  assign _T_19 = x[63]; // @[branch.scala 31:24:@539.4]
  assign lt = st ? _T_19 : _T_17; // @[branch.scala 31:18:@541.4]
  assign ge = lt == 1'h0; // @[branch.scala 32:15:@542.4]
  assign _T_23 = io_input2[63]; // @[branch.scala 33:39:@544.4]
  assign ltu = st ? _T_19 : _T_23; // @[branch.scala 33:18:@545.4]
  assign geu = ltu == 1'h0; // @[branch.scala 34:15:@546.4]
  assign _T_36 = 4'hf == io_exeType; // @[Mux.scala 46:19:@547.4]
  assign _T_38 = 4'he == io_exeType; // @[Mux.scala 46:19:@549.4]
  assign _T_39 = _T_38 ? geu : _T_36; // @[Mux.scala 46:16:@550.4]
  assign _T_40 = 4'hd == io_exeType; // @[Mux.scala 46:19:@551.4]
  assign _T_41 = _T_40 ? ltu : _T_39; // @[Mux.scala 46:16:@552.4]
  assign _T_42 = 4'hc == io_exeType; // @[Mux.scala 46:19:@553.4]
  assign _T_43 = _T_42 ? ge : _T_41; // @[Mux.scala 46:16:@554.4]
  assign _T_44 = 4'hb == io_exeType; // @[Mux.scala 46:19:@555.4]
  assign _T_45 = _T_44 ? lt : _T_43; // @[Mux.scala 46:16:@556.4]
  assign _T_46 = 4'ha == io_exeType; // @[Mux.scala 46:19:@557.4]
  assign _T_47 = _T_46 ? ne : _T_45; // @[Mux.scala 46:16:@558.4]
  assign _T_48 = 4'h9 == io_exeType; // @[Mux.scala 46:19:@559.4]
  assign _T_49 = _T_48 ? eq : _T_47; // @[Mux.scala 46:16:@560.4]
  assign _T_50 = 4'h8 == io_exeType; // @[Mux.scala 46:19:@561.4]
  assign io_jump = _T_50 ? 1'h1 : _T_49; // @[branch.scala 36:13:@563.4]
endmodule
module Branch( // @[:@565.2]
  input  [3:0]  io_exeType, // @[:@568.4]
  input  [63:0] io_input1, // @[:@568.4]
  input  [63:0] io_input2, // @[:@568.4]
  input  [63:0] io_pc, // @[:@568.4]
  input  [63:0] io_imm, // @[:@568.4]
  output        io_jump, // @[:@568.4]
  output [63:0] io_jdest // @[:@568.4]
);
  wire [3:0] bctrl_io_exeType; // @[branch.scala 64:23:@570.4]
  wire [63:0] bctrl_io_input1; // @[branch.scala 64:23:@570.4]
  wire [63:0] bctrl_io_input2; // @[branch.scala 64:23:@570.4]
  wire  bctrl_io_jump; // @[branch.scala 64:23:@570.4]
  wire  _T_19; // @[branch.scala 71:33:@577.4]
  wire [64:0] _T_20; // @[branch.scala 71:57:@578.4]
  wire [63:0] _T_21; // @[branch.scala 71:57:@579.4]
  wire [64:0] _T_22; // @[branch.scala 71:73:@580.4]
  wire [63:0] _T_23; // @[branch.scala 71:73:@581.4]
  BranchCtrl bctrl ( // @[branch.scala 64:23:@570.4]
    .io_exeType(bctrl_io_exeType),
    .io_input1(bctrl_io_input1),
    .io_input2(bctrl_io_input2),
    .io_jump(bctrl_io_jump)
  );
  assign _T_19 = io_exeType == 4'hf; // @[branch.scala 71:33:@577.4]
  assign _T_20 = io_input1 + io_imm; // @[branch.scala 71:57:@578.4]
  assign _T_21 = io_input1 + io_imm; // @[branch.scala 71:57:@579.4]
  assign _T_22 = io_pc + io_imm; // @[branch.scala 71:73:@580.4]
  assign _T_23 = io_pc + io_imm; // @[branch.scala 71:73:@581.4]
  assign io_jump = bctrl_io_jump; // @[branch.scala 69:26:@576.4]
  assign io_jdest = _T_19 ? _T_21 : _T_23; // @[branch.scala 71:14:@583.4]
  assign bctrl_io_exeType = io_exeType; // @[branch.scala 66:26:@573.4]
  assign bctrl_io_input1 = io_input1; // @[branch.scala 67:26:@574.4]
  assign bctrl_io_input2 = io_input2; // @[branch.scala 68:26:@575.4]
endmodule
module Execute( // @[:@585.2]
  input  [63:0] io_imm, // @[:@588.4]
  input  [3:0]  io_ALUOp, // @[:@588.4]
  input  [63:0] io_pc, // @[:@588.4]
  input  [3:0]  io_exe_type, // @[:@588.4]
  input         io_op32, // @[:@588.4]
  input         io_dreg_rs2_valid, // @[:@588.4]
  input  [63:0] io_dreg_rs1_value, // @[:@588.4]
  input  [63:0] io_dreg_rs2_value, // @[:@588.4]
  input         io_dreg_rd_valid, // @[:@588.4]
  input  [4:0]  io_dreg_rd_index, // @[:@588.4]
  output        io_nls, // @[:@588.4]
  output [63:0] io_addr, // @[:@588.4]
  output [63:0] io_data, // @[:@588.4]
  output        io_jump, // @[:@588.4]
  output [63:0] io_jdest, // @[:@588.4]
  output        io_wreg_wbrv, // @[:@588.4]
  output [4:0]  io_wreg_wbri, // @[:@588.4]
  output [63:0] io_wreg_wbrd, // @[:@588.4]
  output        io_wcsr_valid, // @[:@588.4]
  output [11:0] io_wcsr_csr_idx, // @[:@588.4]
  output [63:0] io_wcsr_csr_data, // @[:@588.4]
  input         io_csr_op_valid, // @[:@588.4]
  input  [11:0] io_csr_op_csr_idx, // @[:@588.4]
  input  [63:0] io_csr_op_csr_data, // @[:@588.4]
  input         io_id_excep_valid, // @[:@588.4]
  input  [31:0] io_id_excep_code, // @[:@588.4]
  input  [31:0] io_id_excep_value, // @[:@588.4]
  input  [31:0] io_id_excep_pc, // @[:@588.4]
  output        io_mem_excep_valid, // @[:@588.4]
  output [31:0] io_mem_excep_code, // @[:@588.4]
  output [31:0] io_mem_excep_value, // @[:@588.4]
  output [31:0] io_mem_excep_pc // @[:@588.4]
);
  wire [3:0] alu_io_ALUOp; // @[execute.scala 30:21:@590.4]
  wire  alu_io_op32; // @[execute.scala 30:21:@590.4]
  wire [63:0] alu_io_inputA; // @[execute.scala 30:21:@590.4]
  wire [63:0] alu_io_inputB; // @[execute.scala 30:21:@590.4]
  wire [63:0] alu_io_output; // @[execute.scala 30:21:@590.4]
  wire [3:0] bra_io_exeType; // @[execute.scala 31:21:@593.4]
  wire [63:0] bra_io_input1; // @[execute.scala 31:21:@593.4]
  wire [63:0] bra_io_input2; // @[execute.scala 31:21:@593.4]
  wire [63:0] bra_io_pc; // @[execute.scala 31:21:@593.4]
  wire [63:0] bra_io_imm; // @[execute.scala 31:21:@593.4]
  wire  bra_io_jump; // @[execute.scala 31:21:@593.4]
  wire [63:0] bra_io_jdest; // @[execute.scala 31:21:@593.4]
  wire  _T_103; // @[execute.scala 33:38:@596.4]
  wire  _T_104; // @[execute.scala 37:38:@598.4]
  wire  _T_106; // @[execute.scala 37:50:@600.4]
  wire [63:0] _T_107; // @[execute.scala 39:14:@601.4]
  wire  nls; // @[execute.scala 41:28:@603.4]
  wire  _T_109; // @[execute.scala 42:36:@604.4]
  wire  _T_111; // @[execute.scala 44:43:@606.4]
  wire [64:0] _T_114; // @[execute.scala 44:69:@607.4]
  wire [63:0] _T_115; // @[execute.scala 44:69:@608.4]
  wire [63:0] _T_116; // @[execute.scala 44:25:@609.4]
  wire [64:0] _T_124; // @[execute.scala 47:30:@614.4]
  wire [63:0] _T_125; // @[execute.scala 47:30:@615.4]
  wire  _T_126; // @[Mux.scala 46:19:@616.4]
  wire [63:0] _T_127; // @[Mux.scala 46:16:@617.4]
  wire  _T_128; // @[Mux.scala 46:19:@618.4]
  wire [63:0] _T_129; // @[Mux.scala 46:16:@619.4]
  wire  _T_130; // @[Mux.scala 46:19:@620.4]
  wire [63:0] _T_131; // @[Mux.scala 46:16:@621.4]
  wire  _T_132; // @[Mux.scala 46:19:@622.4]
  wire [63:0] _T_133; // @[Mux.scala 46:16:@623.4]
  wire  _T_134; // @[Mux.scala 46:19:@624.4]
  wire [63:0] _T_135; // @[Mux.scala 46:16:@625.4]
  wire  _T_136; // @[Mux.scala 46:19:@626.4]
  wire [64:0] _T_137; // @[execute.scala 61:34:@635.4]
  ALU alu ( // @[execute.scala 30:21:@590.4]
    .io_ALUOp(alu_io_ALUOp),
    .io_op32(alu_io_op32),
    .io_inputA(alu_io_inputA),
    .io_inputB(alu_io_inputB),
    .io_output(alu_io_output)
  );
  Branch bra ( // @[execute.scala 31:21:@593.4]
    .io_exeType(bra_io_exeType),
    .io_input1(bra_io_input1),
    .io_input2(bra_io_input2),
    .io_pc(bra_io_pc),
    .io_imm(bra_io_imm),
    .io_jump(bra_io_jump),
    .io_jdest(bra_io_jdest)
  );
  assign _T_103 = io_exe_type == 4'h7; // @[execute.scala 33:38:@596.4]
  assign _T_104 = io_exe_type == 4'h6; // @[execute.scala 37:38:@598.4]
  assign _T_106 = _T_104 | _T_103; // @[execute.scala 37:50:@600.4]
  assign _T_107 = io_dreg_rs2_valid ? io_dreg_rs2_value : io_imm; // @[execute.scala 39:14:@601.4]
  assign nls = io_exe_type == 4'h2; // @[execute.scala 41:28:@603.4]
  assign _T_109 = nls == 1'h0; // @[execute.scala 42:36:@604.4]
  assign _T_111 = io_dreg_rd_index == 5'h0; // @[execute.scala 44:43:@606.4]
  assign _T_114 = io_pc + 64'h4; // @[execute.scala 44:69:@607.4]
  assign _T_115 = io_pc + 64'h4; // @[execute.scala 44:69:@608.4]
  assign _T_116 = _T_111 ? 64'h0 : _T_115; // @[execute.scala 44:25:@609.4]
  assign _T_124 = io_imm + io_pc; // @[execute.scala 47:30:@614.4]
  assign _T_125 = io_imm + io_pc; // @[execute.scala 47:30:@615.4]
  assign _T_126 = 4'h7 == io_exe_type; // @[Mux.scala 46:19:@616.4]
  assign _T_127 = _T_126 ? io_csr_op_csr_data : alu_io_output; // @[Mux.scala 46:16:@617.4]
  assign _T_128 = 4'h6 == io_exe_type; // @[Mux.scala 46:19:@618.4]
  assign _T_129 = _T_128 ? io_csr_op_csr_data : _T_127; // @[Mux.scala 46:16:@619.4]
  assign _T_130 = 4'h3 == io_exe_type; // @[Mux.scala 46:19:@620.4]
  assign _T_131 = _T_130 ? _T_125 : _T_129; // @[Mux.scala 46:16:@621.4]
  assign _T_132 = 4'h4 == io_exe_type; // @[Mux.scala 46:19:@622.4]
  assign _T_133 = _T_132 ? io_imm : _T_131; // @[Mux.scala 46:16:@623.4]
  assign _T_134 = 4'hf == io_exe_type; // @[Mux.scala 46:19:@624.4]
  assign _T_135 = _T_134 ? _T_116 : _T_133; // @[Mux.scala 46:16:@625.4]
  assign _T_136 = 4'h8 == io_exe_type; // @[Mux.scala 46:19:@626.4]
  assign _T_137 = io_dreg_rs1_value + io_imm; // @[execute.scala 61:34:@635.4]
  assign io_nls = io_exe_type == 4'h2; // @[execute.scala 72:12:@646.4]
  assign io_addr = io_dreg_rs1_value + io_imm; // @[execute.scala 61:13:@637.4]
  assign io_data = io_dreg_rs2_value; // @[execute.scala 62:13:@638.4]
  assign io_jump = bra_io_jump; // @[execute.scala 69:19:@644.4]
  assign io_jdest = bra_io_jdest; // @[execute.scala 70:19:@645.4]
  assign io_wreg_wbrv = io_dreg_rd_valid & _T_109; // @[execute.scala 57:19:@632.4]
  assign io_wreg_wbri = io_dreg_rd_index; // @[execute.scala 58:19:@633.4]
  assign io_wreg_wbrd = _T_136 ? _T_116 : _T_135; // @[execute.scala 59:19:@634.4]
  assign io_wcsr_valid = io_csr_op_valid; // @[execute.scala 74:19:@647.4]
  assign io_wcsr_csr_idx = io_csr_op_csr_idx; // @[execute.scala 75:21:@648.4]
  assign io_wcsr_csr_data = alu_io_output; // @[execute.scala 76:22:@649.4]
  assign io_mem_excep_valid = io_id_excep_valid; // @[execute.scala 78:18:@653.4]
  assign io_mem_excep_code = io_id_excep_code; // @[execute.scala 78:18:@652.4]
  assign io_mem_excep_value = io_id_excep_value; // @[execute.scala 78:18:@651.4]
  assign io_mem_excep_pc = io_id_excep_pc; // @[execute.scala 78:18:@650.4]
  assign alu_io_ALUOp = io_ALUOp; // @[execute.scala 52:19:@628.4]
  assign alu_io_op32 = io_op32; // @[execute.scala 55:19:@631.4]
  assign alu_io_inputA = _T_103 ? io_imm : io_dreg_rs1_value; // @[execute.scala 53:19:@629.4]
  assign alu_io_inputB = _T_106 ? io_csr_op_csr_data : _T_107; // @[execute.scala 54:19:@630.4]
  assign bra_io_exeType = io_exe_type; // @[execute.scala 64:20:@639.4]
  assign bra_io_input1 = io_dreg_rs1_value; // @[execute.scala 65:20:@640.4]
  assign bra_io_input2 = io_dreg_rs2_value; // @[execute.scala 66:20:@641.4]
  assign bra_io_pc = io_pc; // @[execute.scala 67:20:@642.4]
  assign bra_io_imm = io_imm; // @[execute.scala 68:20:@643.4]
endmodule
module MemoryCtrl( // @[:@655.2]
  input         io_nls, // @[:@658.4]
  input  [3:0]  io_lsm, // @[:@658.4]
  input  [63:0] io_addr, // @[:@658.4]
  input  [63:0] io_data, // @[:@658.4]
  output        io_ready, // @[:@658.4]
  input         io_ereg_wbrv, // @[:@658.4]
  input  [4:0]  io_ereg_wbri, // @[:@658.4]
  input  [63:0] io_ereg_wbrd, // @[:@658.4]
  output        io_wreg_wbrv, // @[:@658.4]
  output [4:0]  io_wreg_wbri, // @[:@658.4]
  output [63:0] io_wreg_wbrd, // @[:@658.4]
  output [3:0]  io_mem_mode, // @[:@658.4]
  input         io_mem_ready, // @[:@658.4]
  output [63:0] io_mem_addr, // @[:@658.4]
  input  [63:0] io_mem_rdata, // @[:@658.4]
  output [63:0] io_mem_wdata, // @[:@658.4]
  input         io_excep_valid, // @[:@658.4]
  input  [31:0] io_excep_code, // @[:@658.4]
  input  [31:0] io_excep_value, // @[:@658.4]
  input  [31:0] io_excep_pc, // @[:@658.4]
  input         io_csr_wb_valid, // @[:@658.4]
  input  [11:0] io_csr_wb_csr_idx, // @[:@658.4]
  input  [63:0] io_csr_wb_csr_data, // @[:@658.4]
  output        io_csr_wrCSROp_valid, // @[:@658.4]
  output [11:0] io_csr_wrCSROp_csr_idx, // @[:@658.4]
  output [63:0] io_csr_wrCSROp_csr_data, // @[:@658.4]
  output        io_csr_excep_valid, // @[:@658.4]
  output [31:0] io_csr_excep_code, // @[:@658.4]
  output [31:0] io_csr_excep_value, // @[:@658.4]
  output [31:0] io_csr_excep_pc, // @[:@658.4]
  input         io_inter_valid, // @[:@658.4]
  input  [31:0] io_inter_bits // @[:@658.4]
);
  wire  _T_123; // @[memoryCtrl.scala 53:21:@664.4]
  wire  _T_125; // @[memoryCtrl.scala 55:45:@667.4]
  wire  _T_126; // @[memoryCtrl.scala 55:67:@668.4]
  wire  _T_127; // @[memoryCtrl.scala 55:58:@669.4]
  assign _T_123 = io_nls == 1'h0; // @[memoryCtrl.scala 53:21:@664.4]
  assign _T_125 = io_lsm != 4'hf; // @[memoryCtrl.scala 55:45:@667.4]
  assign _T_126 = io_lsm[3]; // @[memoryCtrl.scala 55:67:@668.4]
  assign _T_127 = _T_125 & _T_126; // @[memoryCtrl.scala 55:58:@669.4]
  assign io_ready = _T_123 | io_mem_ready; // @[memoryCtrl.scala 53:18:@666.4]
  assign io_wreg_wbrv = io_ereg_wbrv | _T_127; // @[memoryCtrl.scala 55:18:@671.4]
  assign io_wreg_wbri = io_ereg_wbri; // @[memoryCtrl.scala 56:18:@672.4]
  assign io_wreg_wbrd = io_nls ? io_mem_rdata : io_ereg_wbrd; // @[memoryCtrl.scala 57:18:@674.4]
  assign io_mem_mode = io_nls ? io_lsm : 4'hf; // @[memoryCtrl.scala 49:18:@661.4]
  assign io_mem_addr = io_addr; // @[memoryCtrl.scala 50:17:@662.4]
  assign io_mem_wdata = io_data; // @[memoryCtrl.scala 51:18:@663.4]
  assign io_csr_wrCSROp_valid = io_csr_wb_valid; // @[memoryCtrl.scala 59:20:@677.4]
  assign io_csr_wrCSROp_csr_idx = io_csr_wb_csr_idx; // @[memoryCtrl.scala 59:20:@676.4]
  assign io_csr_wrCSROp_csr_data = io_csr_wb_csr_data; // @[memoryCtrl.scala 59:20:@675.4]
  assign io_csr_excep_valid = io_inter_valid ? 1'h1 : io_excep_valid; // @[memoryCtrl.scala 60:20:@681.4 memoryCtrl.scala 62:26:@683.6]
  assign io_csr_excep_code = io_inter_valid ? io_inter_bits : io_excep_code; // @[memoryCtrl.scala 60:20:@680.4 memoryCtrl.scala 63:26:@684.6]
  assign io_csr_excep_value = io_excep_value; // @[memoryCtrl.scala 60:20:@679.4]
  assign io_csr_excep_pc = io_excep_pc; // @[memoryCtrl.scala 60:20:@678.4]
endmodule
module WriteBack( // @[:@687.2]
  input         io_wreg_wbrv, // @[:@690.4]
  input  [4:0]  io_wreg_wbri, // @[:@690.4]
  input  [63:0] io_wreg_wbrd, // @[:@690.4]
  output        io_reg_wen, // @[:@690.4]
  output [4:0]  io_reg_w, // @[:@690.4]
  output [63:0] io_reg_wd // @[:@690.4]
);
  assign io_reg_wen = io_wreg_wbrv; // @[writeback.scala 12:16:@692.4]
  assign io_reg_w = io_wreg_wbri; // @[writeback.scala 13:16:@693.4]
  assign io_reg_wd = io_wreg_wbrd; // @[writeback.scala 14:16:@694.4]
endmodule
module RegCtrl( // @[:@696.2]
  input         clock, // @[:@697.4]
  input         reset, // @[:@698.4]
  input  [4:0]  io_r_r1, // @[:@699.4]
  input  [4:0]  io_r_r2, // @[:@699.4]
  output [63:0] io_r_r1d, // @[:@699.4]
  output [63:0] io_r_r2d, // @[:@699.4]
  input         io_w_wen, // @[:@699.4]
  input  [4:0]  io_w_w, // @[:@699.4]
  input  [63:0] io_w_wd, // @[:@699.4]
  input         io_pass // @[:@699.4]
);
  reg [63:0] regs [0:31]; // @[reg.scala 9:19:@701.4]
  reg [63:0] _RAND_0;
  wire [63:0] regs__T_25_data; // @[reg.scala 9:19:@701.4]
  wire [4:0] regs__T_25_addr; // @[reg.scala 9:19:@701.4]
  wire [63:0] regs__T_29_data; // @[reg.scala 9:19:@701.4]
  wire [4:0] regs__T_29_addr; // @[reg.scala 9:19:@701.4]
  wire [63:0] regs__T_35_data; // @[reg.scala 9:19:@701.4]
  wire [4:0] regs__T_35_addr; // @[reg.scala 9:19:@701.4]
  wire  regs__T_35_mask; // @[reg.scala 9:19:@701.4]
  wire  regs__T_35_en; // @[reg.scala 9:19:@701.4]
  wire  _T_23; // @[reg.scala 11:29:@702.4]
  wire  _T_24; // @[reg.scala 11:18:@703.4]
  wire  _T_27; // @[reg.scala 16:29:@707.4]
  wire  _T_28; // @[reg.scala 16:18:@708.4]
  wire  _T_32; // @[reg.scala 20:30:@712.4]
  wire  _T_33; // @[reg.scala 20:20:@713.4]
  wire  _T_34; // @[reg.scala 20:38:@714.4]
  wire  _T_38; // @[reg.scala 22:15:@719.6]
  assign regs__T_25_addr = io_r_r1;
  assign regs__T_25_data = regs[regs__T_25_addr]; // @[reg.scala 9:19:@701.4]
  assign regs__T_29_addr = io_r_r2;
  assign regs__T_29_data = regs[regs__T_29_addr]; // @[reg.scala 9:19:@701.4]
  assign regs__T_35_data = io_w_wd;
  assign regs__T_35_addr = io_w_w;
  assign regs__T_35_mask = 1'h1;
  assign regs__T_35_en = _T_33 & io_pass;
  assign _T_23 = io_r_r1 == io_w_w; // @[reg.scala 11:29:@702.4]
  assign _T_24 = io_w_wen & _T_23; // @[reg.scala 11:18:@703.4]
  assign _T_27 = io_r_r2 == io_w_w; // @[reg.scala 16:29:@707.4]
  assign _T_28 = io_w_wen & _T_27; // @[reg.scala 16:18:@708.4]
  assign _T_32 = io_w_w != 5'h0; // @[reg.scala 20:30:@712.4]
  assign _T_33 = io_w_wen & _T_32; // @[reg.scala 20:20:@713.4]
  assign _T_34 = _T_33 & io_pass; // @[reg.scala 20:38:@714.4]
  assign _T_38 = reset == 1'h0; // @[reg.scala 22:15:@719.6]
  assign io_r_r1d = _T_24 ? io_w_wd : regs__T_25_data; // @[reg.scala 10:14:@706.4]
  assign io_r_r2d = _T_28 ? io_w_wd : regs__T_29_data; // @[reg.scala 15:14:@711.4]
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
      regs[regs__T_35_addr] <= regs__T_35_data; // @[reg.scala 9:19:@701.4]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_34 & _T_38) begin
          $fwrite(32'h80000002,"set reg[%d] = %x\n",io_w_w,io_w_wd); // @[reg.scala 22:15:@721.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module MMU( // @[:@725.2]
  input         clock, // @[:@726.4]
  input         reset, // @[:@727.4]
  input  [3:0]  io_insr_mode, // @[:@728.4]
  output        io_insr_ready, // @[:@728.4]
  input  [63:0] io_insr_addr, // @[:@728.4]
  output [63:0] io_insr_rdata, // @[:@728.4]
  input  [3:0]  io_mem_mode, // @[:@728.4]
  output        io_mem_ready, // @[:@728.4]
  input  [63:0] io_mem_addr, // @[:@728.4]
  output [63:0] io_mem_rdata, // @[:@728.4]
  input  [63:0] io_mem_wdata, // @[:@728.4]
  output [3:0]  io_if_iom_mode, // @[:@728.4]
  input         io_if_iom_ready, // @[:@728.4]
  output [63:0] io_if_iom_addr, // @[:@728.4]
  input  [63:0] io_if_iom_rdata, // @[:@728.4]
  output [3:0]  io_mem_iom_mode, // @[:@728.4]
  input         io_mem_iom_ready, // @[:@728.4]
  output [63:0] io_mem_iom_addr, // @[:@728.4]
  input  [63:0] io_mem_iom_rdata, // @[:@728.4]
  output [63:0] io_mem_iom_wdata // @[:@728.4]
);
  reg [63:0] if_addr; // @[MMU.scala 14:24:@730.4]
  reg [63:0] _RAND_0;
  wire  _T_70; // @[MMU.scala 26:49:@739.4]
  wire [63:0] _GEN_0; // @[MMU.scala 29:26:@743.4]
  assign _T_70 = if_addr == io_insr_addr; // @[MMU.scala 26:49:@739.4]
  assign _GEN_0 = io_if_iom_ready ? io_insr_addr : if_addr; // @[MMU.scala 29:26:@743.4]
  assign io_insr_ready = io_if_iom_ready & _T_70; // @[MMU.scala 26:18:@741.4]
  assign io_insr_rdata = io_if_iom_rdata; // @[MMU.scala 20:21:@734.4]
  assign io_mem_ready = io_mem_iom_ready; // @[MMU.scala 27:17:@742.4]
  assign io_mem_rdata = io_mem_iom_rdata; // @[MMU.scala 23:21:@737.4]
  assign io_if_iom_mode = io_insr_mode; // @[MMU.scala 17:21:@731.4]
  assign io_if_iom_addr = io_insr_addr; // @[MMU.scala 18:20:@732.4]
  assign io_mem_iom_mode = io_mem_mode; // @[MMU.scala 21:21:@735.4]
  assign io_mem_iom_addr = io_mem_addr; // @[MMU.scala 22:20:@736.4]
  assign io_mem_iom_wdata = io_mem_wdata; // @[MMU.scala 24:21:@738.4]
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
module IOManager( // @[:@764.2]
  input         clock, // @[:@765.4]
  input         reset, // @[:@766.4]
  input  [3:0]  io_mem_if_mode, // @[:@767.4]
  output        io_mem_if_ready, // @[:@767.4]
  input  [63:0] io_mem_if_addr, // @[:@767.4]
  output [63:0] io_mem_if_rdata, // @[:@767.4]
  input  [3:0]  io_mem_mem_mode, // @[:@767.4]
  output        io_mem_mem_ready, // @[:@767.4]
  input  [63:0] io_mem_mem_addr, // @[:@767.4]
  output [63:0] io_mem_mem_rdata, // @[:@767.4]
  input  [63:0] io_mem_mem_wdata, // @[:@767.4]
  output [3:0]  io_mem_out_mode, // @[:@767.4]
  input         io_mem_out_ready, // @[:@767.4]
  output [63:0] io_mem_out_addr, // @[:@767.4]
  input  [63:0] io_mem_out_rdata, // @[:@767.4]
  output [63:0] io_mem_out_wdata, // @[:@767.4]
  output [3:0]  io_serial_out_mode, // @[:@767.4]
  input         io_serial_out_ready, // @[:@767.4]
  output [63:0] io_serial_out_addr, // @[:@767.4]
  input  [63:0] io_serial_out_rdata, // @[:@767.4]
  output [63:0] io_serial_out_wdata // @[:@767.4]
);
  reg [1:0] ifWait; // @[iomanager.scala 48:25:@795.4]
  reg [31:0] _RAND_0;
  reg [1:0] memWait; // @[iomanager.scala 49:26:@796.4]
  reg [31:0] _RAND_1;
  wire  _T_71; // @[Conditional.scala 37:30:@797.4]
  wire  _T_72; // @[Conditional.scala 37:30:@803.6]
  wire [63:0] _GEN_0; // @[Conditional.scala 39:67:@804.6]
  wire  _GEN_1; // @[Conditional.scala 39:67:@804.6]
  wire  _GEN_3; // @[Conditional.scala 40:58:@798.4]
  wire  _T_73; // @[Conditional.scala 37:30:@808.4]
  wire  _T_74; // @[Conditional.scala 37:30:@814.6]
  wire [63:0] _GEN_4; // @[Conditional.scala 39:67:@815.6]
  wire  _GEN_5; // @[Conditional.scala 39:67:@815.6]
  wire  _GEN_7; // @[Conditional.scala 40:58:@809.4]
  wire  _T_75; // @[iomanager.scala 73:26:@819.4]
  wire  _T_77; // @[iomanager.scala 73:42:@820.4]
  wire  _T_78; // @[iomanager.scala 73:39:@821.4]
  wire [1:0] _T_79; // @[iomanager.scala 73:18:@822.4]
  wire  _T_80; // @[iomanager.scala 74:28:@824.4]
  wire  _T_82; // @[iomanager.scala 74:44:@825.4]
  wire  _T_83; // @[iomanager.scala 74:41:@826.4]
  wire [1:0] _T_84; // @[iomanager.scala 74:19:@827.4]
  wire  _T_85; // @[iomanager.scala 78:18:@829.4]
  wire  _T_86; // @[iomanager.scala 78:43:@830.4]
  wire  _T_87; // @[iomanager.scala 78:31:@831.4]
  wire  _T_93; // @[iomanager.scala 13:43:@834.6]
  wire  _T_95; // @[memoryCtrl.scala 21:37:@840.8]
  wire  _T_97; // @[memoryCtrl.scala 21:34:@841.8]
  wire [1:0] _GEN_8; // @[iomanager.scala 81:38:@842.8]
  wire  _T_100; // @[iomanager.scala 14:25:@852.8]
  wire  _T_101; // @[iomanager.scala 14:49:@853.8]
  wire  _T_102; // @[iomanager.scala 14:41:@854.8]
  wire [1:0] _GEN_10; // @[iomanager.scala 90:38:@861.10]
  wire  _T_110; // @[iomanager.scala 98:15:@872.10]
  wire [63:0] _GEN_12; // @[iomanager.scala 88:37:@855.8]
  wire [3:0] _GEN_13; // @[iomanager.scala 88:37:@855.8]
  wire [63:0] _GEN_14; // @[iomanager.scala 88:37:@855.8]
  wire [1:0] _GEN_15; // @[iomanager.scala 88:37:@855.8]
  wire  _GEN_16; // @[iomanager.scala 88:37:@855.8]
  wire [63:0] _GEN_17; // @[iomanager.scala 79:28:@836.6]
  wire [3:0] _GEN_18; // @[iomanager.scala 79:28:@836.6]
  wire [63:0] _GEN_19; // @[iomanager.scala 79:28:@836.6]
  wire [1:0] _GEN_20; // @[iomanager.scala 79:28:@836.6]
  wire  _GEN_21; // @[iomanager.scala 79:28:@836.6]
  wire [63:0] _GEN_22; // @[iomanager.scala 79:28:@836.6]
  wire [3:0] _GEN_23; // @[iomanager.scala 79:28:@836.6]
  wire [63:0] _GEN_24; // @[iomanager.scala 79:28:@836.6]
  wire [63:0] _GEN_25; // @[iomanager.scala 78:57:@832.4]
  wire [3:0] _GEN_26; // @[iomanager.scala 78:57:@832.4]
  wire [63:0] _GEN_27; // @[iomanager.scala 78:57:@832.4]
  wire [1:0] _GEN_28; // @[iomanager.scala 78:57:@832.4]
  wire  _T_111; // @[iomanager.scala 103:17:@878.4]
  wire  _T_113; // @[iomanager.scala 103:30:@880.4]
  wire  _T_114; // @[iomanager.scala 103:66:@881.4]
  wire  _T_115; // @[iomanager.scala 103:54:@882.4]
  wire  _T_116; // @[iomanager.scala 103:91:@883.4]
  wire  _T_117; // @[iomanager.scala 103:79:@884.4]
  wire  _T_119; // @[iomanager.scala 13:43:@887.6]
  wire [63:0] _GEN_33; // @[iomanager.scala 104:30:@889.6]
  wire [3:0] _GEN_34; // @[iomanager.scala 104:30:@889.6]
  wire [63:0] _GEN_35; // @[iomanager.scala 104:30:@889.6]
  wire [1:0] _GEN_36; // @[iomanager.scala 104:30:@889.6]
  wire  _GEN_37; // @[iomanager.scala 104:30:@889.6]
  wire [1:0] _GEN_41; // @[iomanager.scala 103:105:@885.4]
  wire  _GEN_43; // @[iomanager.scala 98:15:@874.12]
  wire  _GEN_44; // @[iomanager.scala 98:15:@874.12]
  wire  _GEN_45; // @[iomanager.scala 98:15:@874.12]
  wire  _GEN_46; // @[iomanager.scala 98:15:@874.12]
  wire  _GEN_47; // @[iomanager.scala 109:19:@900.10]
  wire  _GEN_48; // @[iomanager.scala 109:19:@900.10]
  assign _T_71 = 2'h1 == ifWait; // @[Conditional.scala 37:30:@797.4]
  assign _T_72 = 2'h2 == ifWait; // @[Conditional.scala 37:30:@803.6]
  assign _GEN_0 = _T_72 ? io_serial_out_rdata : 64'h0; // @[Conditional.scala 39:67:@804.6]
  assign _GEN_1 = _T_72 ? io_serial_out_ready : 1'h0; // @[Conditional.scala 39:67:@804.6]
  assign _GEN_3 = _T_71 ? io_mem_out_ready : _GEN_1; // @[Conditional.scala 40:58:@798.4]
  assign _T_73 = 2'h1 == memWait; // @[Conditional.scala 37:30:@808.4]
  assign _T_74 = 2'h2 == memWait; // @[Conditional.scala 37:30:@814.6]
  assign _GEN_4 = _T_74 ? io_serial_out_rdata : 64'h0; // @[Conditional.scala 39:67:@815.6]
  assign _GEN_5 = _T_74 ? io_serial_out_ready : 1'h0; // @[Conditional.scala 39:67:@815.6]
  assign _GEN_7 = _T_73 ? io_mem_out_ready : _GEN_5; // @[Conditional.scala 40:58:@809.4]
  assign _T_75 = ifWait != 2'h0; // @[iomanager.scala 73:26:@819.4]
  assign _T_77 = io_mem_if_ready == 1'h0; // @[iomanager.scala 73:42:@820.4]
  assign _T_78 = _T_75 & _T_77; // @[iomanager.scala 73:39:@821.4]
  assign _T_79 = _T_78 ? ifWait : 2'h0; // @[iomanager.scala 73:18:@822.4]
  assign _T_80 = memWait != 2'h0; // @[iomanager.scala 74:28:@824.4]
  assign _T_82 = io_mem_mem_ready == 1'h0; // @[iomanager.scala 74:44:@825.4]
  assign _T_83 = _T_80 & _T_82; // @[iomanager.scala 74:41:@826.4]
  assign _T_84 = _T_83 ? memWait : 2'h0; // @[iomanager.scala 74:19:@827.4]
  assign _T_85 = memWait == 2'h0; // @[iomanager.scala 78:18:@829.4]
  assign _T_86 = io_mem_mem_mode != 4'hf; // @[iomanager.scala 78:43:@830.4]
  assign _T_87 = _T_85 & _T_86; // @[iomanager.scala 78:31:@831.4]
  assign _T_93 = io_mem_mem_addr < 64'h800000; // @[iomanager.scala 13:43:@834.6]
  assign _T_95 = io_mem_mem_mode[3]; // @[memoryCtrl.scala 21:37:@840.8]
  assign _T_97 = _T_95 == 1'h0; // @[memoryCtrl.scala 21:34:@841.8]
  assign _GEN_8 = _T_97 ? 2'h0 : 2'h1; // @[iomanager.scala 81:38:@842.8]
  assign _T_100 = io_mem_mem_addr >= 64'h10000000; // @[iomanager.scala 14:25:@852.8]
  assign _T_101 = io_mem_mem_addr < 64'h10000008; // @[iomanager.scala 14:49:@853.8]
  assign _T_102 = _T_100 & _T_101; // @[iomanager.scala 14:41:@854.8]
  assign _GEN_10 = _T_97 ? 2'h0 : 2'h2; // @[iomanager.scala 90:38:@861.10]
  assign _T_110 = reset == 1'h0; // @[iomanager.scala 98:15:@872.10]
  assign _GEN_12 = _T_102 ? io_mem_mem_wdata : 64'h0; // @[iomanager.scala 88:37:@855.8]
  assign _GEN_13 = _T_102 ? io_mem_mem_mode : 4'hf; // @[iomanager.scala 88:37:@855.8]
  assign _GEN_14 = _T_102 ? io_mem_mem_addr : 64'h0; // @[iomanager.scala 88:37:@855.8]
  assign _GEN_15 = _T_102 ? _GEN_10 : _T_84; // @[iomanager.scala 88:37:@855.8]
  assign _GEN_16 = _T_102 ? _T_97 : _GEN_7; // @[iomanager.scala 88:37:@855.8]
  assign _GEN_17 = _T_93 ? io_mem_mem_wdata : 64'h0; // @[iomanager.scala 79:28:@836.6]
  assign _GEN_18 = _T_93 ? io_mem_mem_mode : 4'hf; // @[iomanager.scala 79:28:@836.6]
  assign _GEN_19 = _T_93 ? io_mem_mem_addr : 64'h0; // @[iomanager.scala 79:28:@836.6]
  assign _GEN_20 = _T_93 ? _GEN_8 : _GEN_15; // @[iomanager.scala 79:28:@836.6]
  assign _GEN_21 = _T_93 ? _T_97 : _GEN_16; // @[iomanager.scala 79:28:@836.6]
  assign _GEN_22 = _T_93 ? 64'h0 : _GEN_12; // @[iomanager.scala 79:28:@836.6]
  assign _GEN_23 = _T_93 ? 4'hf : _GEN_13; // @[iomanager.scala 79:28:@836.6]
  assign _GEN_24 = _T_93 ? 64'h0 : _GEN_14; // @[iomanager.scala 79:28:@836.6]
  assign _GEN_25 = _T_87 ? _GEN_17 : 64'h0; // @[iomanager.scala 78:57:@832.4]
  assign _GEN_26 = _T_87 ? _GEN_18 : 4'hf; // @[iomanager.scala 78:57:@832.4]
  assign _GEN_27 = _T_87 ? _GEN_19 : 64'h0; // @[iomanager.scala 78:57:@832.4]
  assign _GEN_28 = _T_87 ? _GEN_20 : _T_84; // @[iomanager.scala 78:57:@832.4]
  assign _T_111 = ifWait == 2'h0; // @[iomanager.scala 103:17:@878.4]
  assign _T_113 = _T_111 & _T_85; // @[iomanager.scala 103:30:@880.4]
  assign _T_114 = io_mem_mem_mode == 4'hf; // @[iomanager.scala 103:66:@881.4]
  assign _T_115 = _T_113 & _T_114; // @[iomanager.scala 103:54:@882.4]
  assign _T_116 = io_mem_if_mode != 4'hf; // @[iomanager.scala 103:91:@883.4]
  assign _T_117 = _T_115 & _T_116; // @[iomanager.scala 103:79:@884.4]
  assign _T_119 = io_mem_if_addr < 64'h800000; // @[iomanager.scala 13:43:@887.6]
  assign _GEN_33 = _T_119 ? 64'h0 : _GEN_25; // @[iomanager.scala 104:30:@889.6]
  assign _GEN_34 = _T_119 ? io_mem_if_mode : _GEN_26; // @[iomanager.scala 104:30:@889.6]
  assign _GEN_35 = _T_119 ? io_mem_if_addr : _GEN_27; // @[iomanager.scala 104:30:@889.6]
  assign _GEN_36 = _T_119 ? 2'h1 : _T_79; // @[iomanager.scala 104:30:@889.6]
  assign _GEN_37 = _T_119 ? 1'h0 : _GEN_3; // @[iomanager.scala 104:30:@889.6]
  assign _GEN_41 = _T_117 ? _GEN_36 : _T_79; // @[iomanager.scala 103:105:@885.4]
  assign io_mem_if_ready = _T_117 ? _GEN_37 : _GEN_3; // @[iomanager.scala 40:16:@783.4 iomanager.scala 56:18:@800.6 iomanager.scala 56:18:@806.8 iomanager.scala 107:23:@894.8]
  assign io_mem_if_rdata = _T_71 ? io_mem_out_rdata : _GEN_0; // @[iomanager.scala 40:16:@781.4 iomanager.scala 55:18:@799.6 iomanager.scala 55:18:@805.8]
  assign io_mem_mem_ready = _T_87 ? _GEN_21 : _GEN_7; // @[iomanager.scala 39:16:@778.4 iomanager.scala 56:18:@811.6 iomanager.scala 56:18:@817.8 iomanager.scala 83:23:@844.10 iomanager.scala 86:23:@848.10 iomanager.scala 92:23:@863.12 iomanager.scala 95:23:@867.12]
  assign io_mem_mem_rdata = _T_73 ? io_mem_out_rdata : _GEN_4; // @[iomanager.scala 39:16:@776.4 iomanager.scala 55:18:@810.6 iomanager.scala 55:18:@816.8]
  assign io_mem_out_mode = _T_117 ? _GEN_34 : _GEN_26; // @[iomanager.scala 41:20:@789.4 iomanager.scala 61:20:@838.8 iomanager.scala 61:20:@891.8]
  assign io_mem_out_addr = _T_117 ? _GEN_35 : _GEN_27; // @[iomanager.scala 41:20:@787.4 iomanager.scala 62:20:@839.8 iomanager.scala 62:20:@892.8]
  assign io_mem_out_wdata = _T_117 ? _GEN_33 : _GEN_25; // @[iomanager.scala 41:20:@785.4 iomanager.scala 60:20:@837.8 iomanager.scala 60:20:@890.8]
  assign io_serial_out_mode = _T_87 ? _GEN_23 : 4'hf; // @[iomanager.scala 42:20:@794.4 iomanager.scala 61:20:@857.10]
  assign io_serial_out_addr = _T_87 ? _GEN_24 : 64'h0; // @[iomanager.scala 42:20:@792.4 iomanager.scala 62:20:@858.10]
  assign io_serial_out_wdata = _T_87 ? _GEN_22 : 64'h0; // @[iomanager.scala 42:20:@790.4 iomanager.scala 60:20:@856.10]
  assign _GEN_43 = _T_93 == 1'h0; // @[iomanager.scala 98:15:@874.12]
  assign _GEN_44 = _T_87 & _GEN_43; // @[iomanager.scala 98:15:@874.12]
  assign _GEN_45 = _T_102 == 1'h0; // @[iomanager.scala 98:15:@874.12]
  assign _GEN_46 = _GEN_44 & _GEN_45; // @[iomanager.scala 98:15:@874.12]
  assign _GEN_47 = _T_119 == 1'h0; // @[iomanager.scala 109:19:@900.10]
  assign _GEN_48 = _T_117 & _GEN_47; // @[iomanager.scala 109:19:@900.10]
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
          $fwrite(32'h80000002,"[IO] MEM access invalid address: %x\n",io_mem_mem_addr); // @[iomanager.scala 98:15:@874.12]
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
          $fwrite(32'h80000002,"[IO] IF access invalid address: %x\n",io_mem_if_addr); // @[iomanager.scala 109:19:@900.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module IF_ID( // @[:@905.2]
  input         clock, // @[:@906.4]
  input         reset, // @[:@907.4]
  input         io_en, // @[:@908.4]
  input         io_pass, // @[:@908.4]
  input  [31:0] io_insi, // @[:@908.4]
  input  [63:0] io_pci, // @[:@908.4]
  input  [63:0] io_insci, // @[:@908.4]
  input  [63:0] io_icdi, // @[:@908.4]
  input         io_lastloadin_valid, // @[:@908.4]
  input  [4:0]  io_lastloadin_index, // @[:@908.4]
  input  [31:0] io_excep_i_pc, // @[:@908.4]
  output [31:0] io_inso, // @[:@908.4]
  output [63:0] io_pco, // @[:@908.4]
  output [63:0] io_insco, // @[:@908.4]
  output [63:0] io_icdo, // @[:@908.4]
  output        io_lastloadout_valid, // @[:@908.4]
  output [4:0]  io_lastloadout_index, // @[:@908.4]
  output [31:0] io_excep_o_pc // @[:@908.4]
);
  reg [31:0] ins; // @[if_id.scala 26:23:@910.4]
  reg [31:0] _RAND_0;
  reg [63:0] pc; // @[if_id.scala 28:23:@912.4]
  reg [63:0] _RAND_1;
  reg [63:0] insc; // @[if_id.scala 29:23:@913.4]
  reg [63:0] _RAND_2;
  reg [63:0] icd; // @[if_id.scala 30:23:@915.4]
  reg [63:0] _RAND_3;
  reg  lastload_valid; // @[if_id.scala 31:35:@916.4]
  reg [31:0] _RAND_4;
  reg [4:0] lastload_index; // @[if_id.scala 32:35:@917.4]
  reg [31:0] _RAND_5;
  reg [31:0] excep_pc; // @[if_id.scala 33:24:@929.4]
  reg [31:0] _RAND_6;
  wire  _T_130; // @[if_id.scala 43:17:@940.4]
  wire [31:0] _GEN_0; // @[if_id.scala 43:29:@941.4]
  wire [63:0] _GEN_1; // @[if_id.scala 43:29:@941.4]
  wire [63:0] _GEN_2; // @[if_id.scala 43:29:@941.4]
  wire [63:0] _GEN_3; // @[if_id.scala 43:29:@941.4]
  wire  _GEN_4; // @[if_id.scala 43:29:@941.4]
  wire [4:0] _GEN_5; // @[if_id.scala 43:29:@941.4]
  wire [31:0] _GEN_6; // @[if_id.scala 43:29:@941.4]
  assign _T_130 = io_en & io_pass; // @[if_id.scala 43:17:@940.4]
  assign _GEN_0 = _T_130 ? io_insi : 32'h0; // @[if_id.scala 43:29:@941.4]
  assign _GEN_1 = _T_130 ? io_pci : pc; // @[if_id.scala 43:29:@941.4]
  assign _GEN_2 = _T_130 ? io_insci : 64'h0; // @[if_id.scala 43:29:@941.4]
  assign _GEN_3 = _T_130 ? io_icdi : 64'h0; // @[if_id.scala 43:29:@941.4]
  assign _GEN_4 = _T_130 ? io_lastloadin_valid : 1'h0; // @[if_id.scala 43:29:@941.4]
  assign _GEN_5 = _T_130 ? io_lastloadin_index : 5'h0; // @[if_id.scala 43:29:@941.4]
  assign _GEN_6 = _T_130 ? io_excep_i_pc : 32'h0; // @[if_id.scala 43:29:@941.4]
  assign io_inso = ins; // @[if_id.scala 35:14:@930.4]
  assign io_pco = pc; // @[if_id.scala 36:14:@931.4]
  assign io_insco = insc; // @[if_id.scala 37:14:@932.4]
  assign io_icdo = icd; // @[if_id.scala 38:14:@933.4]
  assign io_lastloadout_valid = lastload_valid; // @[if_id.scala 39:28:@934.4]
  assign io_lastloadout_index = lastload_index; // @[if_id.scala 40:28:@935.4]
  assign io_excep_o_pc = excep_pc; // @[if_id.scala 41:16:@936.4]
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
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  excep_pc = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      ins <= 32'h0;
    end else begin
      if (_T_130) begin
        ins <= io_insi;
      end else begin
        ins <= 32'h0;
      end
    end
    if (reset) begin
      pc <= 64'hffc;
    end else begin
      if (_T_130) begin
        pc <= io_pci;
      end
    end
    if (reset) begin
      insc <= 64'h0;
    end else begin
      if (_T_130) begin
        insc <= io_insci;
      end else begin
        insc <= 64'h0;
      end
    end
    if (reset) begin
      icd <= 64'hffffffffffffffff;
    end else begin
      if (_T_130) begin
        icd <= io_icdi;
      end else begin
        icd <= 64'h0;
      end
    end
    if (reset) begin
      lastload_valid <= 1'h0;
    end else begin
      if (_T_130) begin
        lastload_valid <= io_lastloadin_valid;
      end else begin
        lastload_valid <= 1'h0;
      end
    end
    if (reset) begin
      lastload_index <= 5'h0;
    end else begin
      if (_T_130) begin
        lastload_index <= io_lastloadin_index;
      end else begin
        lastload_index <= 5'h0;
      end
    end
    if (reset) begin
      excep_pc <= 32'h0;
    end else begin
      if (_T_130) begin
        excep_pc <= io_excep_i_pc;
      end else begin
        excep_pc <= 32'h0;
      end
    end
  end
endmodule
module ID_EX( // @[:@976.2]
  input         clock, // @[:@977.4]
  input         reset, // @[:@978.4]
  input         io_en, // @[:@979.4]
  input         io_bid, // @[:@979.4]
  input         io_bex, // @[:@979.4]
  input         io_flush, // @[:@979.4]
  input         io_pass, // @[:@979.4]
  input  [63:0] io_immi, // @[:@979.4]
  input  [3:0]  io_ALUOpi, // @[:@979.4]
  input  [3:0]  io_exeti, // @[:@979.4]
  input  [63:0] io_pci, // @[:@979.4]
  input  [3:0]  io_lsmi, // @[:@979.4]
  input         io_op32i, // @[:@979.4]
  input         io_csr_wb_i_valid, // @[:@979.4]
  input  [11:0] io_csr_wb_i_csr_idx, // @[:@979.4]
  input  [63:0] io_csr_wb_i_csr_data, // @[:@979.4]
  input         io_dregi_rs2_valid, // @[:@979.4]
  input  [63:0] io_dregi_rs1_value, // @[:@979.4]
  input  [63:0] io_dregi_rs2_value, // @[:@979.4]
  input         io_dregi_rd_valid, // @[:@979.4]
  input  [4:0]  io_dregi_rd_index, // @[:@979.4]
  input         io_excep_i_valid, // @[:@979.4]
  input  [31:0] io_excep_i_code, // @[:@979.4]
  input  [31:0] io_excep_i_value, // @[:@979.4]
  input  [31:0] io_excep_i_pc, // @[:@979.4]
  output [63:0] io_immo, // @[:@979.4]
  output [3:0]  io_ALUOpo, // @[:@979.4]
  output [3:0]  io_exeto, // @[:@979.4]
  output [63:0] io_pco, // @[:@979.4]
  output [3:0]  io_lsmo, // @[:@979.4]
  output        io_op32o, // @[:@979.4]
  output        io_csr_wb_o_valid, // @[:@979.4]
  output [11:0] io_csr_wb_o_csr_idx, // @[:@979.4]
  output [63:0] io_csr_wb_o_csr_data, // @[:@979.4]
  output        io_drego_rs2_valid, // @[:@979.4]
  output [63:0] io_drego_rs1_value, // @[:@979.4]
  output [63:0] io_drego_rs2_value, // @[:@979.4]
  output        io_drego_rd_valid, // @[:@979.4]
  output [4:0]  io_drego_rd_index, // @[:@979.4]
  output        io_excep_o_valid, // @[:@979.4]
  output [31:0] io_excep_o_code, // @[:@979.4]
  output [31:0] io_excep_o_value, // @[:@979.4]
  output [31:0] io_excep_o_pc // @[:@979.4]
);
  reg [63:0] imm; // @[id_ex.scala 36:24:@981.4]
  reg [63:0] _RAND_0;
  reg [3:0] ALUOp; // @[id_ex.scala 37:24:@982.4]
  reg [31:0] _RAND_1;
  reg [3:0] exet; // @[id_ex.scala 38:24:@983.4]
  reg [31:0] _RAND_2;
  reg [63:0] pc; // @[id_ex.scala 39:24:@984.4]
  reg [63:0] _RAND_3;
  reg  regInfo_rs2_valid; // @[id_ex.scala 40:26:@1000.4]
  reg [31:0] _RAND_4;
  reg [63:0] regInfo_rs1_value; // @[id_ex.scala 40:26:@1000.4]
  reg [63:0] _RAND_5;
  reg [63:0] regInfo_rs2_value; // @[id_ex.scala 40:26:@1000.4]
  reg [63:0] _RAND_6;
  reg  regInfo_rd_valid; // @[id_ex.scala 40:26:@1000.4]
  reg [31:0] _RAND_7;
  reg [4:0] regInfo_rd_index; // @[id_ex.scala 40:26:@1000.4]
  reg [31:0] _RAND_8;
  reg [3:0] lsm; // @[id_ex.scala 41:24:@1001.4]
  reg [31:0] _RAND_9;
  reg  op32; // @[id_ex.scala 42:24:@1002.4]
  reg [31:0] _RAND_10;
  wire  _T_178; // @[id_ex.scala 44:25:@1003.4]
  wire  bubble; // @[id_ex.scala 44:35:@1004.4]
  wire [63:0] bm; // @[id_ex.scala 45:21:@1006.4]
  reg  csr_wb_valid; // @[id_ex.scala 47:26:@1016.4]
  reg [31:0] _RAND_11;
  reg [11:0] csr_wb_csr_idx; // @[id_ex.scala 47:26:@1016.4]
  reg [31:0] _RAND_12;
  reg [63:0] csr_wb_csr_data; // @[id_ex.scala 47:26:@1016.4]
  reg [63:0] _RAND_13;
  reg  excep_valid; // @[id_ex.scala 48:25:@1028.4]
  reg [31:0] _RAND_14;
  reg [31:0] excep_code; // @[id_ex.scala 48:25:@1028.4]
  reg [31:0] _RAND_15;
  reg [31:0] excep_value; // @[id_ex.scala 48:25:@1028.4]
  reg [31:0] _RAND_16;
  reg [31:0] excep_pc; // @[id_ex.scala 48:25:@1028.4]
  reg [31:0] _RAND_17;
  wire  _T_238; // @[id_ex.scala 60:17:@1048.4]
  wire [63:0] _T_239; // @[id_ex.scala 61:28:@1050.6]
  wire [3:0] _T_240; // @[id_ex.scala 62:32:@1052.6]
  wire [3:0] _T_241; // @[id_ex.scala 62:28:@1053.6]
  wire [3:0] _T_243; // @[id_ex.scala 63:28:@1056.6]
  wire [63:0] _T_244; // @[id_ex.scala 64:28:@1058.6]
  wire  _T_245; // @[id_ex.scala 65:26:@1060.6]
  wire  _T_276_rs2_valid; // @[id_ex.scala 65:23:@1076.6]
  wire [63:0] _T_276_rs1_value; // @[id_ex.scala 65:23:@1076.6]
  wire [63:0] _T_276_rs2_value; // @[id_ex.scala 65:23:@1076.6]
  wire  _T_276_rd_valid; // @[id_ex.scala 65:23:@1076.6]
  wire [4:0] _T_276_rd_index; // @[id_ex.scala 65:23:@1076.6]
  wire [3:0] _T_283; // @[id_ex.scala 66:21:@1083.6]
  wire  _T_285; // @[id_ex.scala 67:27:@1086.6]
  wire  _T_309_valid; // @[id_ex.scala 69:21:@1103.6]
  wire [31:0] _T_309_code; // @[id_ex.scala 69:21:@1103.6]
  wire [31:0] _T_309_value; // @[id_ex.scala 69:21:@1103.6]
  wire [31:0] _T_309_pc; // @[id_ex.scala 69:21:@1103.6]
  wire [63:0] _GEN_0; // @[id_ex.scala 60:29:@1049.4]
  wire [3:0] _GEN_1; // @[id_ex.scala 60:29:@1049.4]
  wire [3:0] _GEN_2; // @[id_ex.scala 60:29:@1049.4]
  wire [63:0] _GEN_3; // @[id_ex.scala 60:29:@1049.4]
  wire [4:0] _GEN_4; // @[id_ex.scala 60:29:@1049.4]
  wire  _GEN_5; // @[id_ex.scala 60:29:@1049.4]
  wire [63:0] _GEN_6; // @[id_ex.scala 60:29:@1049.4]
  wire [63:0] _GEN_7; // @[id_ex.scala 60:29:@1049.4]
  wire  _GEN_8; // @[id_ex.scala 60:29:@1049.4]
  wire [3:0] _GEN_10; // @[id_ex.scala 60:29:@1049.4]
  wire  _GEN_11; // @[id_ex.scala 60:29:@1049.4]
  wire [63:0] _GEN_12; // @[id_ex.scala 60:29:@1049.4]
  wire [11:0] _GEN_13; // @[id_ex.scala 60:29:@1049.4]
  wire  _GEN_14; // @[id_ex.scala 60:29:@1049.4]
  wire [31:0] _GEN_15; // @[id_ex.scala 60:29:@1049.4]
  wire [31:0] _GEN_16; // @[id_ex.scala 60:29:@1049.4]
  wire [31:0] _GEN_17; // @[id_ex.scala 60:29:@1049.4]
  wire  _GEN_18; // @[id_ex.scala 60:29:@1049.4]
  assign _T_178 = io_bid | io_bex; // @[id_ex.scala 44:25:@1003.4]
  assign bubble = _T_178 | io_flush; // @[id_ex.scala 44:35:@1004.4]
  assign bm = bubble ? 64'h0 : 64'hffffffffffffffff; // @[id_ex.scala 45:21:@1006.4]
  assign _T_238 = io_en & io_pass; // @[id_ex.scala 60:17:@1048.4]
  assign _T_239 = io_immi & bm; // @[id_ex.scala 61:28:@1050.6]
  assign _T_240 = bm[3:0]; // @[id_ex.scala 62:32:@1052.6]
  assign _T_241 = io_ALUOpi & _T_240; // @[id_ex.scala 62:28:@1053.6]
  assign _T_243 = io_exeti & _T_240; // @[id_ex.scala 63:28:@1056.6]
  assign _T_244 = io_pci & bm; // @[id_ex.scala 64:28:@1058.6]
  assign _T_245 = bm[0]; // @[id_ex.scala 65:26:@1060.6]
  assign _T_276_rs2_valid = _T_245 ? io_dregi_rs2_valid : 1'h0; // @[id_ex.scala 65:23:@1076.6]
  assign _T_276_rs1_value = _T_245 ? io_dregi_rs1_value : 64'h0; // @[id_ex.scala 65:23:@1076.6]
  assign _T_276_rs2_value = _T_245 ? io_dregi_rs2_value : 64'h0; // @[id_ex.scala 65:23:@1076.6]
  assign _T_276_rd_valid = _T_245 ? io_dregi_rd_valid : 1'h0; // @[id_ex.scala 65:23:@1076.6]
  assign _T_276_rd_index = _T_245 ? io_dregi_rd_index : 5'h0; // @[id_ex.scala 65:23:@1076.6]
  assign _T_283 = bubble ? 4'hf : io_lsmi; // @[id_ex.scala 66:21:@1083.6]
  assign _T_285 = io_op32i & _T_245; // @[id_ex.scala 67:27:@1086.6]
  assign _T_309_valid = _T_245 ? io_excep_i_valid : 1'h0; // @[id_ex.scala 69:21:@1103.6]
  assign _T_309_code = _T_245 ? io_excep_i_code : 32'h0; // @[id_ex.scala 69:21:@1103.6]
  assign _T_309_value = _T_245 ? io_excep_i_value : 32'h0; // @[id_ex.scala 69:21:@1103.6]
  assign _T_309_pc = _T_245 ? io_excep_i_pc : 32'h0; // @[id_ex.scala 69:21:@1103.6]
  assign _GEN_0 = _T_238 ? _T_239 : imm; // @[id_ex.scala 60:29:@1049.4]
  assign _GEN_1 = _T_238 ? _T_241 : ALUOp; // @[id_ex.scala 60:29:@1049.4]
  assign _GEN_2 = _T_238 ? _T_243 : exet; // @[id_ex.scala 60:29:@1049.4]
  assign _GEN_3 = _T_238 ? _T_244 : pc; // @[id_ex.scala 60:29:@1049.4]
  assign _GEN_4 = _T_238 ? _T_276_rd_index : regInfo_rd_index; // @[id_ex.scala 60:29:@1049.4]
  assign _GEN_5 = _T_238 ? _T_276_rd_valid : regInfo_rd_valid; // @[id_ex.scala 60:29:@1049.4]
  assign _GEN_6 = _T_238 ? _T_276_rs2_value : regInfo_rs2_value; // @[id_ex.scala 60:29:@1049.4]
  assign _GEN_7 = _T_238 ? _T_276_rs1_value : regInfo_rs1_value; // @[id_ex.scala 60:29:@1049.4]
  assign _GEN_8 = _T_238 ? _T_276_rs2_valid : regInfo_rs2_valid; // @[id_ex.scala 60:29:@1049.4]
  assign _GEN_10 = _T_238 ? _T_283 : lsm; // @[id_ex.scala 60:29:@1049.4]
  assign _GEN_11 = _T_238 ? _T_285 : op32; // @[id_ex.scala 60:29:@1049.4]
  assign _GEN_12 = _T_238 ? io_csr_wb_i_csr_data : csr_wb_csr_data; // @[id_ex.scala 60:29:@1049.4]
  assign _GEN_13 = _T_238 ? io_csr_wb_i_csr_idx : csr_wb_csr_idx; // @[id_ex.scala 60:29:@1049.4]
  assign _GEN_14 = _T_238 ? io_csr_wb_i_valid : csr_wb_valid; // @[id_ex.scala 60:29:@1049.4]
  assign _GEN_15 = _T_238 ? _T_309_pc : excep_pc; // @[id_ex.scala 60:29:@1049.4]
  assign _GEN_16 = _T_238 ? _T_309_value : excep_value; // @[id_ex.scala 60:29:@1049.4]
  assign _GEN_17 = _T_238 ? _T_309_code : excep_code; // @[id_ex.scala 60:29:@1049.4]
  assign _GEN_18 = _T_238 ? _T_309_valid : excep_valid; // @[id_ex.scala 60:29:@1049.4]
  assign io_immo = imm; // @[id_ex.scala 50:15:@1029.4]
  assign io_ALUOpo = ALUOp; // @[id_ex.scala 51:15:@1030.4]
  assign io_exeto = exet; // @[id_ex.scala 52:15:@1031.4]
  assign io_pco = pc; // @[id_ex.scala 53:15:@1032.4]
  assign io_lsmo = lsm; // @[id_ex.scala 55:15:@1039.4]
  assign io_op32o = op32; // @[id_ex.scala 56:15:@1040.4]
  assign io_csr_wb_o_valid = csr_wb_valid; // @[id_ex.scala 57:18:@1043.4]
  assign io_csr_wb_o_csr_idx = csr_wb_csr_idx; // @[id_ex.scala 57:18:@1042.4]
  assign io_csr_wb_o_csr_data = csr_wb_csr_data; // @[id_ex.scala 57:18:@1041.4]
  assign io_drego_rs2_valid = regInfo_rs2_valid; // @[id_ex.scala 54:14:@1037.4]
  assign io_drego_rs1_value = regInfo_rs1_value; // @[id_ex.scala 54:14:@1036.4]
  assign io_drego_rs2_value = regInfo_rs2_value; // @[id_ex.scala 54:14:@1035.4]
  assign io_drego_rd_valid = regInfo_rd_valid; // @[id_ex.scala 54:14:@1034.4]
  assign io_drego_rd_index = regInfo_rd_index; // @[id_ex.scala 54:14:@1033.4]
  assign io_excep_o_valid = excep_valid; // @[id_ex.scala 58:16:@1047.4]
  assign io_excep_o_code = excep_code; // @[id_ex.scala 58:16:@1046.4]
  assign io_excep_o_value = excep_value; // @[id_ex.scala 58:16:@1045.4]
  assign io_excep_o_pc = excep_pc; // @[id_ex.scala 58:16:@1044.4]
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
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  excep_valid = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  excep_code = _RAND_15[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  excep_value = _RAND_16[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  excep_pc = _RAND_17[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      imm <= 64'h0;
    end else begin
      if (_T_238) begin
        imm <= _T_239;
      end
    end
    if (reset) begin
      ALUOp <= 4'h0;
    end else begin
      if (_T_238) begin
        ALUOp <= _T_241;
      end
    end
    if (reset) begin
      exet <= 4'h0;
    end else begin
      if (_T_238) begin
        exet <= _T_243;
      end
    end
    if (reset) begin
      pc <= 64'h0;
    end else begin
      if (_T_238) begin
        pc <= _T_244;
      end
    end
    if (reset) begin
      regInfo_rs2_valid <= 1'h0;
    end else begin
      if (_T_238) begin
        if (_T_245) begin
          regInfo_rs2_valid <= io_dregi_rs2_valid;
        end else begin
          regInfo_rs2_valid <= 1'h0;
        end
      end
    end
    if (reset) begin
      regInfo_rs1_value <= 64'h0;
    end else begin
      if (_T_238) begin
        if (_T_245) begin
          regInfo_rs1_value <= io_dregi_rs1_value;
        end else begin
          regInfo_rs1_value <= 64'h0;
        end
      end
    end
    if (reset) begin
      regInfo_rs2_value <= 64'h0;
    end else begin
      if (_T_238) begin
        if (_T_245) begin
          regInfo_rs2_value <= io_dregi_rs2_value;
        end else begin
          regInfo_rs2_value <= 64'h0;
        end
      end
    end
    if (reset) begin
      regInfo_rd_valid <= 1'h0;
    end else begin
      if (_T_238) begin
        if (_T_245) begin
          regInfo_rd_valid <= io_dregi_rd_valid;
        end else begin
          regInfo_rd_valid <= 1'h0;
        end
      end
    end
    if (reset) begin
      regInfo_rd_index <= 5'h0;
    end else begin
      if (_T_238) begin
        if (_T_245) begin
          regInfo_rd_index <= io_dregi_rd_index;
        end else begin
          regInfo_rd_index <= 5'h0;
        end
      end
    end
    if (reset) begin
      lsm <= 4'hf;
    end else begin
      if (_T_238) begin
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
      if (_T_238) begin
        op32 <= _T_285;
      end
    end
    if (reset) begin
      csr_wb_valid <= 1'h0;
    end else begin
      if (_T_238) begin
        csr_wb_valid <= io_csr_wb_i_valid;
      end
    end
    if (reset) begin
      csr_wb_csr_idx <= 12'h0;
    end else begin
      if (_T_238) begin
        csr_wb_csr_idx <= io_csr_wb_i_csr_idx;
      end
    end
    if (reset) begin
      csr_wb_csr_data <= 64'h0;
    end else begin
      if (_T_238) begin
        csr_wb_csr_data <= io_csr_wb_i_csr_data;
      end
    end
    if (reset) begin
      excep_valid <= 1'h0;
    end else begin
      if (_T_238) begin
        if (_T_245) begin
          excep_valid <= io_excep_i_valid;
        end else begin
          excep_valid <= 1'h0;
        end
      end
    end
    if (reset) begin
      excep_code <= 32'h0;
    end else begin
      if (_T_238) begin
        if (_T_245) begin
          excep_code <= io_excep_i_code;
        end else begin
          excep_code <= 32'h0;
        end
      end
    end
    if (reset) begin
      excep_value <= 32'h0;
    end else begin
      if (_T_238) begin
        if (_T_245) begin
          excep_value <= io_excep_i_value;
        end else begin
          excep_value <= 32'h0;
        end
      end
    end
    if (reset) begin
      excep_pc <= 32'h0;
    end else begin
      if (_T_238) begin
        if (_T_245) begin
          excep_pc <= io_excep_i_pc;
        end else begin
          excep_pc <= 32'h0;
        end
      end
    end
  end
endmodule
module EX_MEM( // @[:@1110.2]
  input         clock, // @[:@1111.4]
  input         reset, // @[:@1112.4]
  input         io_en, // @[:@1113.4]
  input         io_pass, // @[:@1113.4]
  input         io_nlsi, // @[:@1113.4]
  input  [3:0]  io_lsmi, // @[:@1113.4]
  input  [63:0] io_addri, // @[:@1113.4]
  input  [63:0] io_datai, // @[:@1113.4]
  input         io_wregi_wbrv, // @[:@1113.4]
  input  [4:0]  io_wregi_wbri, // @[:@1113.4]
  input  [63:0] io_wregi_wbrd, // @[:@1113.4]
  input         io_csr_wb_i_valid, // @[:@1113.4]
  input  [11:0] io_csr_wb_i_csr_idx, // @[:@1113.4]
  input  [63:0] io_csr_wb_i_csr_data, // @[:@1113.4]
  input         io_excep_i_valid, // @[:@1113.4]
  input  [31:0] io_excep_i_code, // @[:@1113.4]
  input  [31:0] io_excep_i_value, // @[:@1113.4]
  input  [31:0] io_excep_i_pc, // @[:@1113.4]
  input         io_inter_i_valid, // @[:@1113.4]
  input  [31:0] io_inter_i_bits, // @[:@1113.4]
  output        io_nlso, // @[:@1113.4]
  output [3:0]  io_lsmo, // @[:@1113.4]
  output [63:0] io_addro, // @[:@1113.4]
  output [63:0] io_datao, // @[:@1113.4]
  output        io_wrego_wbrv, // @[:@1113.4]
  output [4:0]  io_wrego_wbri, // @[:@1113.4]
  output [63:0] io_wrego_wbrd, // @[:@1113.4]
  output        io_csr_wb_o_valid, // @[:@1113.4]
  output [11:0] io_csr_wb_o_csr_idx, // @[:@1113.4]
  output [63:0] io_csr_wb_o_csr_data, // @[:@1113.4]
  output        io_excep_o_valid, // @[:@1113.4]
  output [31:0] io_excep_o_code, // @[:@1113.4]
  output [31:0] io_excep_o_value, // @[:@1113.4]
  output [31:0] io_excep_o_pc, // @[:@1113.4]
  output        io_inter_o_valid, // @[:@1113.4]
  output [31:0] io_inter_o_bits // @[:@1113.4]
);
  reg  nls; // @[ex_mem.scala 30:23:@1115.4]
  reg [31:0] _RAND_0;
  reg  wbrv; // @[ex_mem.scala 31:23:@1116.4]
  reg [31:0] _RAND_1;
  reg [63:0] wbrd; // @[ex_mem.scala 32:23:@1117.4]
  reg [63:0] _RAND_2;
  reg [4:0] wbri; // @[ex_mem.scala 33:23:@1118.4]
  reg [31:0] _RAND_3;
  reg [3:0] lsm; // @[ex_mem.scala 34:23:@1119.4]
  reg [31:0] _RAND_4;
  reg [63:0] addr; // @[ex_mem.scala 35:23:@1120.4]
  reg [63:0] _RAND_5;
  reg [63:0] data; // @[ex_mem.scala 36:23:@1121.4]
  reg [63:0] _RAND_6;
  reg  csr_wb_valid; // @[ex_mem.scala 37:26:@1131.4]
  reg [31:0] _RAND_7;
  reg [11:0] csr_wb_csr_idx; // @[ex_mem.scala 37:26:@1131.4]
  reg [31:0] _RAND_8;
  reg [63:0] csr_wb_csr_data; // @[ex_mem.scala 37:26:@1131.4]
  reg [63:0] _RAND_9;
  reg  excep_valid; // @[ex_mem.scala 38:26:@1143.4]
  reg [31:0] _RAND_10;
  reg [31:0] excep_code; // @[ex_mem.scala 38:26:@1143.4]
  reg [31:0] _RAND_11;
  reg [31:0] excep_value; // @[ex_mem.scala 38:26:@1143.4]
  reg [31:0] _RAND_12;
  reg [31:0] excep_pc; // @[ex_mem.scala 38:26:@1143.4]
  reg [31:0] _RAND_13;
  reg  inter_valid; // @[ex_mem.scala 39:26:@1151.4]
  reg [31:0] _RAND_14;
  reg [31:0] inter_bits; // @[ex_mem.scala 39:26:@1151.4]
  reg [31:0] _RAND_15;
  wire  _T_192; // @[ex_mem.scala 52:17:@1168.4]
  wire  _T_195; // @[ex_mem.scala 65:15:@1188.8]
  wire  _GEN_0; // @[ex_mem.scala 52:29:@1169.4]
  wire [4:0] _GEN_1; // @[ex_mem.scala 52:29:@1169.4]
  wire  _GEN_2; // @[ex_mem.scala 52:29:@1169.4]
  wire [63:0] _GEN_3; // @[ex_mem.scala 52:29:@1169.4]
  wire [3:0] _GEN_4; // @[ex_mem.scala 52:29:@1169.4]
  wire [63:0] _GEN_5; // @[ex_mem.scala 52:29:@1169.4]
  wire [63:0] _GEN_6; // @[ex_mem.scala 52:29:@1169.4]
  wire [63:0] _GEN_7; // @[ex_mem.scala 52:29:@1169.4]
  wire [11:0] _GEN_8; // @[ex_mem.scala 52:29:@1169.4]
  wire  _GEN_9; // @[ex_mem.scala 52:29:@1169.4]
  wire [31:0] _GEN_10; // @[ex_mem.scala 52:29:@1169.4]
  wire [31:0] _GEN_11; // @[ex_mem.scala 52:29:@1169.4]
  wire [31:0] _GEN_12; // @[ex_mem.scala 52:29:@1169.4]
  wire  _GEN_13; // @[ex_mem.scala 52:29:@1169.4]
  wire [31:0] _GEN_14; // @[ex_mem.scala 52:29:@1169.4]
  wire  _GEN_15; // @[ex_mem.scala 52:29:@1169.4]
  wire  _GEN_16; // @[ex_mem.scala 65:15:@1190.10]
  assign _T_192 = io_en & io_pass; // @[ex_mem.scala 52:17:@1168.4]
  assign _T_195 = reset == 1'h0; // @[ex_mem.scala 65:15:@1188.8]
  assign _GEN_0 = _T_192 ? io_nlsi : nls; // @[ex_mem.scala 52:29:@1169.4]
  assign _GEN_1 = _T_192 ? io_wregi_wbri : wbri; // @[ex_mem.scala 52:29:@1169.4]
  assign _GEN_2 = _T_192 ? io_wregi_wbrv : wbrv; // @[ex_mem.scala 52:29:@1169.4]
  assign _GEN_3 = _T_192 ? io_wregi_wbrd : wbrd; // @[ex_mem.scala 52:29:@1169.4]
  assign _GEN_4 = _T_192 ? io_lsmi : lsm; // @[ex_mem.scala 52:29:@1169.4]
  assign _GEN_5 = _T_192 ? io_addri : addr; // @[ex_mem.scala 52:29:@1169.4]
  assign _GEN_6 = _T_192 ? io_datai : data; // @[ex_mem.scala 52:29:@1169.4]
  assign _GEN_7 = _T_192 ? io_csr_wb_i_csr_data : csr_wb_csr_data; // @[ex_mem.scala 52:29:@1169.4]
  assign _GEN_8 = _T_192 ? io_csr_wb_i_csr_idx : csr_wb_csr_idx; // @[ex_mem.scala 52:29:@1169.4]
  assign _GEN_9 = _T_192 ? io_csr_wb_i_valid : csr_wb_valid; // @[ex_mem.scala 52:29:@1169.4]
  assign _GEN_10 = _T_192 ? io_excep_i_pc : excep_pc; // @[ex_mem.scala 52:29:@1169.4]
  assign _GEN_11 = _T_192 ? io_excep_i_value : excep_value; // @[ex_mem.scala 52:29:@1169.4]
  assign _GEN_12 = _T_192 ? io_excep_i_code : excep_code; // @[ex_mem.scala 52:29:@1169.4]
  assign _GEN_13 = _T_192 ? io_excep_i_valid : excep_valid; // @[ex_mem.scala 52:29:@1169.4]
  assign _GEN_14 = _T_192 ? io_inter_i_bits : inter_bits; // @[ex_mem.scala 52:29:@1169.4]
  assign _GEN_15 = _T_192 ? io_inter_i_valid : inter_valid; // @[ex_mem.scala 52:29:@1169.4]
  assign io_nlso = nls; // @[ex_mem.scala 41:13:@1152.4]
  assign io_lsmo = lsm; // @[ex_mem.scala 45:13:@1156.4]
  assign io_addro = addr; // @[ex_mem.scala 46:14:@1157.4]
  assign io_datao = data; // @[ex_mem.scala 47:14:@1158.4]
  assign io_wrego_wbrv = wbrv; // @[ex_mem.scala 43:19:@1154.4]
  assign io_wrego_wbri = wbri; // @[ex_mem.scala 44:19:@1155.4]
  assign io_wrego_wbrd = wbrd; // @[ex_mem.scala 42:19:@1153.4]
  assign io_csr_wb_o_valid = csr_wb_valid; // @[ex_mem.scala 48:18:@1161.4]
  assign io_csr_wb_o_csr_idx = csr_wb_csr_idx; // @[ex_mem.scala 48:18:@1160.4]
  assign io_csr_wb_o_csr_data = csr_wb_csr_data; // @[ex_mem.scala 48:18:@1159.4]
  assign io_excep_o_valid = excep_valid; // @[ex_mem.scala 49:18:@1165.4]
  assign io_excep_o_code = excep_code; // @[ex_mem.scala 49:18:@1164.4]
  assign io_excep_o_value = excep_value; // @[ex_mem.scala 49:18:@1163.4]
  assign io_excep_o_pc = excep_pc; // @[ex_mem.scala 49:18:@1162.4]
  assign io_inter_o_valid = inter_valid; // @[ex_mem.scala 50:18:@1167.4]
  assign io_inter_o_bits = inter_bits; // @[ex_mem.scala 50:18:@1166.4]
  assign _GEN_16 = _T_192 & io_inter_i_valid; // @[ex_mem.scala 65:15:@1190.10]
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
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  excep_valid = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  excep_code = _RAND_11[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  excep_value = _RAND_12[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  excep_pc = _RAND_13[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  inter_valid = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  inter_bits = _RAND_15[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      nls <= 1'h0;
    end else begin
      if (_T_192) begin
        nls <= io_nlsi;
      end
    end
    if (reset) begin
      wbrv <= 1'h0;
    end else begin
      if (_T_192) begin
        wbrv <= io_wregi_wbrv;
      end
    end
    if (reset) begin
      wbrd <= 64'h0;
    end else begin
      if (_T_192) begin
        wbrd <= io_wregi_wbrd;
      end
    end
    if (reset) begin
      wbri <= 5'h0;
    end else begin
      if (_T_192) begin
        wbri <= io_wregi_wbri;
      end
    end
    if (reset) begin
      lsm <= 4'hf;
    end else begin
      if (_T_192) begin
        lsm <= io_lsmi;
      end
    end
    if (reset) begin
      addr <= 64'h0;
    end else begin
      if (_T_192) begin
        addr <= io_addri;
      end
    end
    if (reset) begin
      data <= 64'h0;
    end else begin
      if (_T_192) begin
        data <= io_datai;
      end
    end
    if (reset) begin
      csr_wb_valid <= 1'h0;
    end else begin
      if (_T_192) begin
        csr_wb_valid <= io_csr_wb_i_valid;
      end
    end
    if (reset) begin
      csr_wb_csr_idx <= 12'h0;
    end else begin
      if (_T_192) begin
        csr_wb_csr_idx <= io_csr_wb_i_csr_idx;
      end
    end
    if (reset) begin
      csr_wb_csr_data <= 64'h0;
    end else begin
      if (_T_192) begin
        csr_wb_csr_data <= io_csr_wb_i_csr_data;
      end
    end
    if (reset) begin
      excep_valid <= 1'h0;
    end else begin
      if (_T_192) begin
        excep_valid <= io_excep_i_valid;
      end
    end
    if (reset) begin
      excep_code <= 32'h0;
    end else begin
      if (_T_192) begin
        excep_code <= io_excep_i_code;
      end
    end
    if (reset) begin
      excep_value <= 32'h0;
    end else begin
      if (_T_192) begin
        excep_value <= io_excep_i_value;
      end
    end
    if (reset) begin
      excep_pc <= 32'h0;
    end else begin
      if (_T_192) begin
        excep_pc <= io_excep_i_pc;
      end
    end
    if (reset) begin
      inter_valid <= 1'h0;
    end else begin
      if (_T_192) begin
        inter_valid <= io_inter_i_valid;
      end
    end
    if (reset) begin
      inter_bits <= 32'h0;
    end else begin
      if (_T_192) begin
        inter_bits <= io_inter_i_bits;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_16 & _T_195) begin
          $fwrite(32'h80000002,"get a interrupt %d\n",io_inter_i_bits); // @[ex_mem.scala 65:15:@1190.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module MEM_WB( // @[:@1195.2]
  input         clock, // @[:@1196.4]
  input         reset, // @[:@1197.4]
  input         io_en, // @[:@1198.4]
  input         io_pass, // @[:@1198.4]
  input         io_wregi_wbrv, // @[:@1198.4]
  input  [4:0]  io_wregi_wbri, // @[:@1198.4]
  input  [63:0] io_wregi_wbrd, // @[:@1198.4]
  output        io_wrego_wbrv, // @[:@1198.4]
  output [4:0]  io_wrego_wbri, // @[:@1198.4]
  output [63:0] io_wrego_wbrd // @[:@1198.4]
);
  reg  wbrv; // @[mem_wb.scala 15:23:@1200.4]
  reg [31:0] _RAND_0;
  reg [63:0] wbrd; // @[mem_wb.scala 16:23:@1201.4]
  reg [63:0] _RAND_1;
  reg [4:0] wbri; // @[mem_wb.scala 17:23:@1202.4]
  reg [31:0] _RAND_2;
  wire  _T_35; // @[mem_wb.scala 23:17:@1206.4]
  wire [4:0] _GEN_0; // @[mem_wb.scala 23:29:@1207.4]
  wire  _GEN_1; // @[mem_wb.scala 23:29:@1207.4]
  wire [63:0] _GEN_2; // @[mem_wb.scala 23:29:@1207.4]
  assign _T_35 = io_en & io_pass; // @[mem_wb.scala 23:17:@1206.4]
  assign _GEN_0 = _T_35 ? io_wregi_wbri : wbri; // @[mem_wb.scala 23:29:@1207.4]
  assign _GEN_1 = _T_35 ? io_wregi_wbrv : wbrv; // @[mem_wb.scala 23:29:@1207.4]
  assign _GEN_2 = _T_35 ? io_wregi_wbrd : wbrd; // @[mem_wb.scala 23:29:@1207.4]
  assign io_wrego_wbrv = wbrv; // @[mem_wb.scala 20:19:@1204.4]
  assign io_wrego_wbri = wbri; // @[mem_wb.scala 21:19:@1205.4]
  assign io_wrego_wbrd = wbrd; // @[mem_wb.scala 19:19:@1203.4]
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
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      wbrv <= 1'h0;
    end else begin
      if (_T_35) begin
        wbrv <= io_wregi_wbrv;
      end
    end
    if (reset) begin
      wbrd <= 64'h0;
    end else begin
      if (_T_35) begin
        wbrd <= io_wregi_wbrd;
      end
    end
    if (reset) begin
      wbri <= 5'h0;
    end else begin
      if (_T_35) begin
        wbri <= io_wregi_wbri;
      end
    end
  end
endmodule
module CSR( // @[:@1213.2]
  input         clock, // @[:@1214.4]
  input         reset, // @[:@1215.4]
  input  [11:0] io_id_addr, // @[:@1216.4]
  output [63:0] io_id_rdata, // @[:@1216.4]
  output [1:0]  io_id_priv, // @[:@1216.4]
  input         io_mem_wrCSROp_valid, // @[:@1216.4]
  input  [11:0] io_mem_wrCSROp_csr_idx, // @[:@1216.4]
  input  [63:0] io_mem_wrCSROp_csr_data, // @[:@1216.4]
  input         io_mem_excep_valid, // @[:@1216.4]
  input  [31:0] io_mem_excep_code, // @[:@1216.4]
  input  [31:0] io_mem_excep_value, // @[:@1216.4]
  input  [31:0] io_mem_excep_pc, // @[:@1216.4]
  output        io_flush, // @[:@1216.4]
  output        io_inter_valid, // @[:@1216.4]
  output [31:0] io_inter_bits // @[:@1216.4]
);
  reg [63:0] csr [0:1023]; // @[CSR.scala 22:16:@1222.4]
  reg [63:0] _RAND_0;
  wire [63:0] csr__T_146_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_146_addr; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_235_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_235_addr; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_236_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_236_addr; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_mtvec_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_mtvec_addr; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_stvec_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_stvec_addr; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_utvec_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_utvec_addr; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_medeleg_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_medeleg_addr; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_mideleg_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_mideleg_addr; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_sedeleg_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_sedeleg_addr; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_sideleg_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_sideleg_addr; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_mie_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_mie_addr; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_mip_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_mip_addr; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_mtimecmp_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_mtimecmp_addr; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_mepc_r_0_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_mepc_r_0_addr; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_sepc_r_0_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_sepc_r_0_addr; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_uepc_r_0_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_uepc_r_0_addr; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_261_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_261_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_261_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_261_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_270_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_270_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_270_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_270_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_279_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_279_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_279_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_279_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_288_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_288_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_288_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_288_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_296_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_296_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_296_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_296_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_304_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_304_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_304_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_304_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_312_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_312_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_312_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_312_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_320_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_320_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_320_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_320_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_328_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_328_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_328_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_328_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_336_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_336_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_336_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_336_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_344_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_344_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_344_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_344_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_352_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_352_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_352_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_352_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_360_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_360_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_360_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_360_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_368_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_368_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_368_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_368_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_376_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_376_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_376_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_376_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_384_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_384_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_384_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_384_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_392_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_392_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_392_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_392_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_400_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_400_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_400_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_400_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_408_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_408_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_408_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_408_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_416_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_416_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_416_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_416_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_424_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_424_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_424_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_424_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_432_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_432_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_432_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_432_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_440_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_440_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_440_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_440_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_448_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_448_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_448_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_448_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_456_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_456_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_456_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_456_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_464_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_464_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_464_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_464_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_472_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_472_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_472_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_472_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_480_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_480_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_480_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_480_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_488_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_488_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_488_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_488_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_496_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_496_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_496_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_496_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_504_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_504_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_504_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_504_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_512_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_512_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_512_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_512_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_520_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_520_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_520_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_520_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_528_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_528_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_528_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_528_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_536_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_536_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_536_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_536_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_545_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_545_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_545_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_545_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_554_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_554_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_554_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_554_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_mcause_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_mcause_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr_mcause_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr_mcause_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_scause_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_scause_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr_scause_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr_scause_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_ucause_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_ucause_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr_ucause_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr_ucause_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_mtval_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_mtval_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr_mtval_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr_mtval_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_stval_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_stval_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr_stval_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr_stval_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_utval_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_utval_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr_utval_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr_utval_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr__T_627_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr__T_627_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_627_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr__T_627_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_mepc_w_0_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_mepc_w_0_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr_mepc_w_0_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr_mepc_w_0_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_sepc_w_0_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_sepc_w_0_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr_sepc_w_0_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr_sepc_w_0_en; // @[CSR.scala 22:16:@1222.4]
  wire [63:0] csr_uepc_w_0_data; // @[CSR.scala 22:16:@1222.4]
  wire [9:0] csr_uepc_w_0_addr; // @[CSR.scala 22:16:@1222.4]
  wire  csr_uepc_w_0_mask; // @[CSR.scala 22:16:@1222.4]
  wire  csr_uepc_w_0_en; // @[CSR.scala 22:16:@1222.4]
  reg [1:0] prv; // @[CSR.scala 19:24:@1219.4]
  reg [31:0] _RAND_1;
  reg  mstatus_SD; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_2;
  reg [26:0] mstatus_zero1; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_3;
  reg [1:0] mstatus_SXL; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_4;
  reg [1:0] mstatus_UXL; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_5;
  reg  mstatus_TSR; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_6;
  reg [8:0] mstatus_zero2; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_7;
  reg  mstatus_TW; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_8;
  reg  mstatus_TVM; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_9;
  reg  mstatus_MXR; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_10;
  reg  mstatus_SUM; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_11;
  reg  mstatus_MPriv; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_12;
  reg [1:0] mstatus_XS; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_13;
  reg [1:0] mstatus_FS; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_14;
  reg [1:0] mstatus_MPP; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_15;
  reg [1:0] mstatus_old_HPP; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_16;
  reg  mstatus_SPP; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_17;
  reg  mstatus_MPIE; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_18;
  reg  mstatus_old_HPIE; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_19;
  reg  mstatus_SPIE; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_20;
  reg  mstatus_UPIE; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_21;
  reg  mstatus_MIE; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_22;
  reg  mstatus_old_HIE; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_23;
  reg  mstatus_SIE; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_24;
  reg  mstatus_UIE; // @[CSR.scala 99:24:@1274.4]
  reg [31:0] _RAND_25;
  reg [63:0] mtime; // @[CSR.scala 100:24:@1275.4]
  reg [63:0] _RAND_26;
  wire [64:0] _T_143; // @[CSR.scala 101:18:@1276.4]
  wire [63:0] _T_144; // @[CSR.scala 101:18:@1277.4]
  wire [5:0] _T_193; // @[CSR.scala 109:29:@1285.4]
  wire [14:0] _T_199; // @[CSR.scala 109:29:@1291.4]
  wire [6:0] _T_204; // @[CSR.scala 109:29:@1296.4]
  wire [63:0] _T_211; // @[CSR.scala 109:29:@1303.4]
  wire  _T_237; // @[Mux.scala 46:19:@1329.4]
  wire [63:0] _T_238; // @[Mux.scala 46:16:@1330.4]
  wire  _T_239; // @[Mux.scala 46:19:@1331.4]
  wire [63:0] _T_240; // @[Mux.scala 46:16:@1332.4]
  wire  _T_241; // @[Mux.scala 46:19:@1333.4]
  wire [63:0] _T_242; // @[Mux.scala 46:16:@1334.4]
  wire  _T_243; // @[Mux.scala 46:19:@1335.4]
  wire [63:0] _T_244; // @[Mux.scala 46:16:@1336.4]
  wire  _T_245; // @[Mux.scala 46:19:@1337.4]
  wire [63:0] _T_246; // @[Mux.scala 46:16:@1338.4]
  wire  _T_247; // @[Mux.scala 46:19:@1339.4]
  wire [63:0] _T_248; // @[Mux.scala 46:16:@1340.4]
  wire  _T_249; // @[Mux.scala 46:19:@1341.4]
  wire [63:0] _T_250; // @[Mux.scala 46:16:@1342.4]
  wire  _T_251; // @[Mux.scala 46:19:@1343.4]
  wire [63:0] _T_252; // @[Mux.scala 46:16:@1344.4]
  wire  _T_253; // @[Mux.scala 46:19:@1345.4]
  wire [63:0] _T_254; // @[Mux.scala 46:16:@1346.4]
  wire  _T_255; // @[Mux.scala 46:19:@1347.4]
  wire [63:0] _T_256; // @[Mux.scala 46:16:@1348.4]
  wire  _T_257; // @[Mux.scala 46:19:@1349.4]
  wire  _T_259; // @[CSR.scala 124:14:@1354.6]
  wire  _T_264; // @[CSR.scala 126:15:@1359.8]
  wire  _T_268; // @[CSR.scala 124:14:@1369.6]
  wire  _T_277; // @[CSR.scala 124:14:@1384.6]
  wire  _T_286; // @[CSR.scala 124:14:@1399.6]
  wire  _T_295; // @[CSR.scala 124:14:@1414.6]
  wire  _T_303; // @[CSR.scala 124:14:@1429.6]
  wire  _T_311; // @[CSR.scala 124:14:@1444.6]
  wire  _T_319; // @[CSR.scala 124:14:@1459.6]
  wire  _T_327; // @[CSR.scala 124:14:@1474.6]
  wire  _T_335; // @[CSR.scala 124:14:@1489.6]
  wire  _T_343; // @[CSR.scala 124:14:@1504.6]
  wire  _T_351; // @[CSR.scala 124:14:@1519.6]
  wire  _T_359; // @[CSR.scala 124:14:@1534.6]
  wire  _T_367; // @[CSR.scala 124:14:@1549.6]
  wire  _T_375; // @[CSR.scala 124:14:@1564.6]
  wire  _T_383; // @[CSR.scala 124:14:@1579.6]
  wire  _T_391; // @[CSR.scala 124:14:@1594.6]
  wire  _T_399; // @[CSR.scala 124:14:@1609.6]
  wire  _T_407; // @[CSR.scala 124:14:@1624.6]
  wire  _T_415; // @[CSR.scala 124:14:@1639.6]
  wire  _T_423; // @[CSR.scala 124:14:@1654.6]
  wire  _T_431; // @[CSR.scala 124:14:@1669.6]
  wire  _T_439; // @[CSR.scala 124:14:@1684.6]
  wire  _T_447; // @[CSR.scala 124:14:@1699.6]
  wire  _T_455; // @[CSR.scala 124:14:@1714.6]
  wire  _T_463; // @[CSR.scala 124:14:@1729.6]
  wire  _T_471; // @[CSR.scala 124:14:@1744.6]
  wire  _T_479; // @[CSR.scala 124:14:@1759.6]
  wire  _T_487; // @[CSR.scala 124:14:@1774.6]
  wire  _T_495; // @[CSR.scala 124:14:@1789.6]
  wire  _T_503; // @[CSR.scala 124:14:@1804.6]
  wire  _T_511; // @[CSR.scala 124:14:@1819.6]
  wire  _T_519; // @[CSR.scala 124:14:@1834.6]
  wire  _T_527; // @[CSR.scala 124:14:@1849.6]
  wire  _T_535; // @[CSR.scala 124:14:@1864.6]
  wire  _T_543; // @[CSR.scala 124:14:@1879.6]
  wire  _T_552; // @[CSR.scala 124:14:@1894.6]
  wire  _T_561; // @[CSR.scala 130:33:@1909.6]
  wire  _T_567; // @[CSR.scala 131:50:@1914.8]
  wire  _T_568; // @[CSR.scala 131:50:@1916.8]
  wire  _T_569; // @[CSR.scala 131:50:@1918.8]
  wire  _T_570; // @[CSR.scala 131:50:@1920.8]
  wire  _T_571; // @[CSR.scala 131:50:@1922.8]
  wire  _T_572; // @[CSR.scala 131:50:@1924.8]
  wire  _T_573; // @[CSR.scala 131:50:@1926.8]
  wire  _T_574; // @[CSR.scala 131:50:@1928.8]
  wire  _T_575; // @[CSR.scala 131:50:@1930.8]
  wire [1:0] _T_576; // @[CSR.scala 131:50:@1932.8]
  wire [1:0] _T_577; // @[CSR.scala 131:50:@1934.8]
  wire [1:0] _T_578; // @[CSR.scala 131:50:@1936.8]
  wire [1:0] _T_579; // @[CSR.scala 131:50:@1938.8]
  wire  _T_580; // @[CSR.scala 131:50:@1940.8]
  wire  _T_581; // @[CSR.scala 131:50:@1942.8]
  wire  _T_582; // @[CSR.scala 131:50:@1944.8]
  wire  _T_583; // @[CSR.scala 131:50:@1946.8]
  wire  _T_584; // @[CSR.scala 131:50:@1948.8]
  wire [8:0] _T_585; // @[CSR.scala 131:50:@1950.8]
  wire  _T_586; // @[CSR.scala 131:50:@1952.8]
  wire [1:0] _T_587; // @[CSR.scala 131:50:@1954.8]
  wire [1:0] _T_588; // @[CSR.scala 131:50:@1956.8]
  wire [26:0] _T_589; // @[CSR.scala 131:50:@1958.8]
  wire  _T_590; // @[CSR.scala 131:50:@1960.8]
  wire  _GEN_185; // @[CSR.scala 130:51:@1910.6]
  wire  _GEN_186; // @[CSR.scala 130:51:@1910.6]
  wire  _GEN_187; // @[CSR.scala 130:51:@1910.6]
  wire  _GEN_188; // @[CSR.scala 130:51:@1910.6]
  wire  _GEN_189; // @[CSR.scala 130:51:@1910.6]
  wire  _GEN_190; // @[CSR.scala 130:51:@1910.6]
  wire  _GEN_191; // @[CSR.scala 130:51:@1910.6]
  wire  _GEN_192; // @[CSR.scala 130:51:@1910.6]
  wire  _GEN_193; // @[CSR.scala 130:51:@1910.6]
  wire [1:0] _GEN_194; // @[CSR.scala 130:51:@1910.6]
  wire [1:0] _GEN_195; // @[CSR.scala 130:51:@1910.6]
  wire [1:0] _GEN_196; // @[CSR.scala 130:51:@1910.6]
  wire [1:0] _GEN_197; // @[CSR.scala 130:51:@1910.6]
  wire  _GEN_198; // @[CSR.scala 130:51:@1910.6]
  wire  _GEN_199; // @[CSR.scala 130:51:@1910.6]
  wire  _GEN_200; // @[CSR.scala 130:51:@1910.6]
  wire  _GEN_201; // @[CSR.scala 130:51:@1910.6]
  wire  _GEN_202; // @[CSR.scala 130:51:@1910.6]
  wire [8:0] _GEN_203; // @[CSR.scala 130:51:@1910.6]
  wire  _GEN_204; // @[CSR.scala 130:51:@1910.6]
  wire [1:0] _GEN_205; // @[CSR.scala 130:51:@1910.6]
  wire [1:0] _GEN_206; // @[CSR.scala 130:51:@1910.6]
  wire [26:0] _GEN_207; // @[CSR.scala 130:51:@1910.6]
  wire  _GEN_208; // @[CSR.scala 130:51:@1910.6]
  wire  _T_591; // @[CSR.scala 133:33:@1987.6]
  wire  _GEN_209; // @[CSR.scala 133:51:@1988.6]
  wire  _GEN_210; // @[CSR.scala 133:51:@1988.6]
  wire  _GEN_211; // @[CSR.scala 133:51:@1988.6]
  wire  _GEN_212; // @[CSR.scala 133:51:@1988.6]
  wire  _GEN_213; // @[CSR.scala 133:51:@1988.6]
  wire  _GEN_214; // @[CSR.scala 133:51:@1988.6]
  wire  _GEN_215; // @[CSR.scala 133:51:@1988.6]
  wire  _GEN_216; // @[CSR.scala 133:51:@1988.6]
  wire  _GEN_217; // @[CSR.scala 133:51:@1988.6]
  wire [1:0] _GEN_218; // @[CSR.scala 133:51:@1988.6]
  wire [1:0] _GEN_219; // @[CSR.scala 133:51:@1988.6]
  wire [1:0] _GEN_220; // @[CSR.scala 133:51:@1988.6]
  wire [1:0] _GEN_221; // @[CSR.scala 133:51:@1988.6]
  wire  _GEN_222; // @[CSR.scala 133:51:@1988.6]
  wire  _GEN_223; // @[CSR.scala 133:51:@1988.6]
  wire  _GEN_224; // @[CSR.scala 133:51:@1988.6]
  wire  _GEN_225; // @[CSR.scala 133:51:@1988.6]
  wire  _GEN_226; // @[CSR.scala 133:51:@1988.6]
  wire [8:0] _GEN_227; // @[CSR.scala 133:51:@1988.6]
  wire  _GEN_228; // @[CSR.scala 133:51:@1988.6]
  wire [1:0] _GEN_229; // @[CSR.scala 133:51:@1988.6]
  wire [1:0] _GEN_230; // @[CSR.scala 133:51:@1988.6]
  wire [26:0] _GEN_231; // @[CSR.scala 133:51:@1988.6]
  wire  _GEN_232; // @[CSR.scala 133:51:@1988.6]
  wire  _GEN_418; // @[CSR.scala 122:30:@1353.4]
  wire  _GEN_419; // @[CSR.scala 122:30:@1353.4]
  wire  _GEN_420; // @[CSR.scala 122:30:@1353.4]
  wire  _GEN_421; // @[CSR.scala 122:30:@1353.4]
  wire  _GEN_422; // @[CSR.scala 122:30:@1353.4]
  wire  _GEN_423; // @[CSR.scala 122:30:@1353.4]
  wire  _GEN_424; // @[CSR.scala 122:30:@1353.4]
  wire  _GEN_425; // @[CSR.scala 122:30:@1353.4]
  wire  _GEN_426; // @[CSR.scala 122:30:@1353.4]
  wire [1:0] _GEN_427; // @[CSR.scala 122:30:@1353.4]
  wire [1:0] _GEN_428; // @[CSR.scala 122:30:@1353.4]
  wire [1:0] _GEN_429; // @[CSR.scala 122:30:@1353.4]
  wire [1:0] _GEN_430; // @[CSR.scala 122:30:@1353.4]
  wire  _GEN_431; // @[CSR.scala 122:30:@1353.4]
  wire  _GEN_432; // @[CSR.scala 122:30:@1353.4]
  wire  _GEN_433; // @[CSR.scala 122:30:@1353.4]
  wire  _GEN_434; // @[CSR.scala 122:30:@1353.4]
  wire  _GEN_435; // @[CSR.scala 122:30:@1353.4]
  wire [8:0] _GEN_436; // @[CSR.scala 122:30:@1353.4]
  wire  _GEN_437; // @[CSR.scala 122:30:@1353.4]
  wire [1:0] _GEN_438; // @[CSR.scala 122:30:@1353.4]
  wire [1:0] _GEN_439; // @[CSR.scala 122:30:@1353.4]
  wire [26:0] _GEN_440; // @[CSR.scala 122:30:@1353.4]
  wire  _GEN_441; // @[CSR.scala 122:30:@1353.4]
  wire  _T_622; // @[Mux.scala 46:19:@2085.4]
  wire  _T_623; // @[Mux.scala 46:16:@2086.4]
  wire  _T_624; // @[Mux.scala 46:19:@2087.4]
  wire  _T_625; // @[Mux.scala 46:16:@2088.4]
  wire  _T_626; // @[Mux.scala 46:19:@2089.4]
  wire  ie; // @[Mux.scala 46:16:@2090.4]
  wire  time_inter; // @[CSR.scala 165:27:@2091.4]
  wire  _T_629; // @[CSR.scala 169:10:@2093.4]
  wire  _T_632; // @[CSR.scala 171:10:@2095.4]
  wire  _T_634; // @[CSR.scala 172:10:@2097.4]
  wire  _T_637; // @[CSR.scala 174:22:@2100.4]
  wire  _T_640; // @[CSR.scala 176:22:@2102.4]
  wire  _T_642; // @[CSR.scala 177:22:@2104.4]
  wire [3:0] _T_643; // @[CSR.scala 178:8:@2105.4]
  wire [7:0] _T_647; // @[Cat.scala 30:58:@2109.4]
  wire [63:0] ipie; // @[CSR.scala 181:20:@2116.4]
  wire [63:0] _T_653; // @[CSR.scala 182:25:@2117.4]
  wire [63:0] ipie_m; // @[CSR.scala 182:23:@2118.4]
  wire [63:0] ipie_s; // @[CSR.scala 183:23:@2119.4]
  wire  _T_654; // @[CSR.scala 186:14:@2120.4]
  wire  _T_656; // @[CSR.scala 187:14:@2121.4]
  wire  _T_658; // @[CSR.scala 188:14:@2122.4]
  wire  _T_660; // @[CSR.scala 190:14:@2123.4]
  wire  _T_662; // @[CSR.scala 191:14:@2124.4]
  wire  _T_664; // @[CSR.scala 192:14:@2125.4]
  wire  _T_666; // @[CSR.scala 194:14:@2126.4]
  wire  _T_668; // @[CSR.scala 195:14:@2127.4]
  wire  _T_670; // @[CSR.scala 196:14:@2128.4]
  wire  _T_672; // @[CSR.scala 198:14:@2129.4]
  wire  _T_674; // @[CSR.scala 199:14:@2130.4]
  wire  _T_676; // @[CSR.scala 200:14:@2131.4]
  wire  _T_678; // @[CSR.scala 202:14:@2132.4]
  wire  _T_680; // @[CSR.scala 203:14:@2133.4]
  wire  _T_682; // @[CSR.scala 204:14:@2134.4]
  wire  _T_684; // @[CSR.scala 206:14:@2135.4]
  wire  _T_686; // @[CSR.scala 207:14:@2136.4]
  wire [1:0] _T_694; // @[Mux.scala 31:69:@2140.4]
  wire [2:0] _T_695; // @[Mux.scala 31:69:@2141.4]
  wire [2:0] _T_696; // @[Mux.scala 31:69:@2142.4]
  wire [2:0] _T_697; // @[Mux.scala 31:69:@2143.4]
  wire [3:0] _T_698; // @[Mux.scala 31:69:@2144.4]
  wire [3:0] _T_699; // @[Mux.scala 31:69:@2145.4]
  wire [3:0] _T_700; // @[Mux.scala 31:69:@2146.4]
  wire [3:0] _T_701; // @[Mux.scala 31:69:@2147.4]
  wire [3:0] _T_702; // @[Mux.scala 31:69:@2148.4]
  wire [3:0] _T_703; // @[Mux.scala 31:69:@2149.4]
  wire [3:0] _T_704; // @[Mux.scala 31:69:@2150.4]
  wire [3:0] _T_705; // @[Mux.scala 31:69:@2151.4]
  wire [3:0] _T_706; // @[Mux.scala 31:69:@2152.4]
  wire [3:0] _T_707; // @[Mux.scala 31:69:@2153.4]
  wire [3:0] _T_708; // @[Mux.scala 31:69:@2154.4]
  wire [3:0] ic; // @[Mux.scala 31:69:@2155.4]
  wire [63:0] _T_709; // @[CSR.scala 213:38:@2156.4]
  wire  _T_710; // @[CSR.scala 213:38:@2157.4]
  wire [1:0] inter_new_mode; // @[CSR.scala 213:29:@2158.4]
  wire  _T_711; // @[CSR.scala 214:42:@2159.4]
  wire  _T_712; // @[CSR.scala 214:69:@2160.4]
  wire  _T_713; // @[CSR.scala 214:78:@2161.4]
  wire  inter_enable; // @[CSR.scala 214:49:@2162.4]
  wire  _T_715; // @[CSR.scala 216:44:@2163.4]
  wire [31:0] _GEN_783; // @[CSR.scala 217:47:@2167.4]
  wire [29:0] _T_720; // @[Const.scala 68:33:@2172.6]
  wire  _T_723; // @[Const.scala 68:40:@2173.6]
  wire [1:0] _T_724; // @[Const.scala 69:32:@2175.8]
  wire  _T_725; // @[Conditional.scala 37:30:@2176.8]
  wire  _T_727; // @[Conditional.scala 37:30:@2185.10]
  wire  _T_730; // @[Conditional.scala 37:30:@2194.12]
  wire  _GEN_442; // @[Conditional.scala 39:67:@2195.12]
  wire  _GEN_443; // @[Conditional.scala 39:67:@2195.12]
  wire [1:0] _GEN_444; // @[Conditional.scala 39:67:@2195.12]
  wire  _GEN_446; // @[Conditional.scala 39:67:@2186.10]
  wire  _GEN_447; // @[Conditional.scala 39:67:@2186.10]
  wire  _GEN_448; // @[Conditional.scala 39:67:@2186.10]
  wire [1:0] _GEN_449; // @[Conditional.scala 39:67:@2186.10]
  wire  _GEN_451; // @[Conditional.scala 39:67:@2186.10]
  wire  _GEN_452; // @[Conditional.scala 39:67:@2186.10]
  wire  _GEN_453; // @[Conditional.scala 40:58:@2177.8]
  wire  _GEN_454; // @[Conditional.scala 40:58:@2177.8]
  wire [1:0] _GEN_455; // @[Conditional.scala 40:58:@2177.8]
  wire [1:0] _GEN_456; // @[Conditional.scala 40:58:@2177.8]
  wire  _GEN_458; // @[Conditional.scala 40:58:@2177.8]
  wire  _GEN_459; // @[Conditional.scala 40:58:@2177.8]
  wire  _GEN_460; // @[Conditional.scala 40:58:@2177.8]
  wire  _GEN_461; // @[Conditional.scala 40:58:@2177.8]
  wire  _GEN_462; // @[Conditional.scala 40:58:@2177.8]
  wire  _T_732; // @[CSR.scala 250:31:@2203.8]
  wire  _T_733; // @[CSR.scala 250:67:@2204.8]
  wire  _T_734; // @[CSR.scala 250:51:@2205.8]
  wire  _T_735; // @[CSR.scala 255:18:@2209.10]
  wire  _T_737; // @[CSR.scala 255:12:@2210.10]
  wire [4:0] _T_738; // @[CSR.scala 255:40:@2211.10]
  wire [63:0] _T_739; // @[CSR.scala 255:34:@2212.10]
  wire  _T_740; // @[CSR.scala 255:34:@2213.10]
  wire  _T_742; // @[CSR.scala 255:26:@2214.10]
  wire  _T_743; // @[CSR.scala 255:23:@2215.10]
  wire [63:0] _T_746; // @[CSR.scala 256:34:@2218.10]
  wire  _T_747; // @[CSR.scala 256:34:@2219.10]
  wire  _T_749; // @[CSR.scala 256:26:@2220.10]
  wire  _T_750; // @[CSR.scala 256:23:@2221.10]
  wire [63:0] _T_755; // @[CSR.scala 257:34:@2225.10]
  wire  _T_756; // @[CSR.scala 257:34:@2226.10]
  wire  _T_758; // @[CSR.scala 257:26:@2227.10]
  wire  _T_759; // @[CSR.scala 257:23:@2228.10]
  wire [63:0] _T_762; // @[CSR.scala 258:34:@2231.10]
  wire  _T_763; // @[CSR.scala 258:34:@2232.10]
  wire  _T_765; // @[CSR.scala 258:26:@2233.10]
  wire  _T_766; // @[CSR.scala 258:23:@2234.10]
  wire [1:0] _T_768; // @[Mux.scala 31:69:@2235.10]
  wire [1:0] _T_769; // @[Mux.scala 31:69:@2236.10]
  wire [1:0] _T_770; // @[Mux.scala 31:69:@2237.10]
  wire [1:0] _T_771; // @[Mux.scala 31:69:@2238.10]
  wire [1:0] _GEN_499; // @[CSR.scala 250:88:@2206.8]
  wire [1:0] _GEN_522; // @[CSR.scala 227:32:@2174.6]
  wire [1:0] nextPrv; // @[CSR.scala 226:22:@2171.4]
  wire  _T_772; // @[Conditional.scala 37:30:@2240.10]
  wire  _T_774; // @[Conditional.scala 37:30:@2249.12]
  wire  _T_776; // @[Conditional.scala 37:30:@2258.14]
  wire  _GEN_463; // @[Conditional.scala 39:67:@2259.14]
  wire  _GEN_464; // @[Conditional.scala 39:67:@2259.14]
  wire  _GEN_469; // @[Conditional.scala 39:67:@2250.12]
  wire  _GEN_470; // @[Conditional.scala 39:67:@2250.12]
  wire  _GEN_475; // @[Conditional.scala 39:67:@2250.12]
  wire  _GEN_476; // @[Conditional.scala 39:67:@2250.12]
  wire  _GEN_478; // @[Conditional.scala 39:67:@2250.12]
  wire  _GEN_481; // @[Conditional.scala 40:58:@2241.10]
  wire  _GEN_482; // @[Conditional.scala 40:58:@2241.10]
  wire  _GEN_487; // @[Conditional.scala 40:58:@2241.10]
  wire  _GEN_488; // @[Conditional.scala 40:58:@2241.10]
  wire  _GEN_490; // @[Conditional.scala 40:58:@2241.10]
  wire  _GEN_493; // @[Conditional.scala 40:58:@2241.10]
  wire  _GEN_494; // @[Conditional.scala 40:58:@2241.10]
  wire  _GEN_496; // @[Conditional.scala 40:58:@2241.10]
  wire  _GEN_500; // @[CSR.scala 250:88:@2206.8]
  wire  _GEN_501; // @[CSR.scala 250:88:@2206.8]
  wire  _GEN_503; // @[CSR.scala 250:88:@2206.8]
  wire  _GEN_506; // @[CSR.scala 250:88:@2206.8]
  wire  _GEN_507; // @[CSR.scala 250:88:@2206.8]
  wire  _GEN_509; // @[CSR.scala 250:88:@2206.8]
  wire  _GEN_512; // @[CSR.scala 250:88:@2206.8]
  wire  _GEN_513; // @[CSR.scala 250:88:@2206.8]
  wire  _GEN_515; // @[CSR.scala 250:88:@2206.8]
  wire  _GEN_519; // @[CSR.scala 227:32:@2174.6]
  wire  _GEN_520; // @[CSR.scala 227:32:@2174.6]
  wire [1:0] _GEN_521; // @[CSR.scala 227:32:@2174.6]
  wire  _GEN_524; // @[CSR.scala 227:32:@2174.6]
  wire  _GEN_525; // @[CSR.scala 227:32:@2174.6]
  wire  _GEN_526; // @[CSR.scala 227:32:@2174.6]
  wire  _GEN_527; // @[CSR.scala 227:32:@2174.6]
  wire  _GEN_528; // @[CSR.scala 227:32:@2174.6]
  wire  _GEN_530; // @[CSR.scala 227:32:@2174.6]
  wire  _GEN_534; // @[CSR.scala 227:32:@2174.6]
  wire  _GEN_538; // @[CSR.scala 227:32:@2174.6]
  wire  _GEN_541; // @[CSR.scala 226:22:@2171.4]
  wire  _GEN_542; // @[CSR.scala 226:22:@2171.4]
  wire [1:0] _GEN_543; // @[CSR.scala 226:22:@2171.4]
  wire  _GEN_546; // @[CSR.scala 226:22:@2171.4]
  wire  _GEN_547; // @[CSR.scala 226:22:@2171.4]
  wire  _GEN_548; // @[CSR.scala 226:22:@2171.4]
  wire  _GEN_549; // @[CSR.scala 226:22:@2171.4]
  wire  _GEN_550; // @[CSR.scala 226:22:@2171.4]
  wire  _GEN_786; // @[CSR.scala 126:15:@1361.10]
  wire  _GEN_788; // @[CSR.scala 126:15:@1376.10]
  wire  _GEN_790; // @[CSR.scala 126:15:@1391.10]
  wire  _GEN_792; // @[CSR.scala 126:15:@1406.10]
  wire  _GEN_794; // @[CSR.scala 126:15:@1421.10]
  wire  _GEN_796; // @[CSR.scala 126:15:@1436.10]
  wire  _GEN_798; // @[CSR.scala 126:15:@1451.10]
  wire  _GEN_800; // @[CSR.scala 126:15:@1466.10]
  wire  _GEN_802; // @[CSR.scala 126:15:@1481.10]
  wire  _GEN_804; // @[CSR.scala 126:15:@1496.10]
  wire  _GEN_806; // @[CSR.scala 126:15:@1511.10]
  wire  _GEN_808; // @[CSR.scala 126:15:@1526.10]
  wire  _GEN_810; // @[CSR.scala 126:15:@1541.10]
  wire  _GEN_812; // @[CSR.scala 126:15:@1556.10]
  wire  _GEN_814; // @[CSR.scala 126:15:@1571.10]
  wire  _GEN_816; // @[CSR.scala 126:15:@1586.10]
  wire  _GEN_818; // @[CSR.scala 126:15:@1601.10]
  wire  _GEN_820; // @[CSR.scala 126:15:@1616.10]
  wire  _GEN_822; // @[CSR.scala 126:15:@1631.10]
  wire  _GEN_824; // @[CSR.scala 126:15:@1646.10]
  wire  _GEN_826; // @[CSR.scala 126:15:@1661.10]
  wire  _GEN_828; // @[CSR.scala 126:15:@1676.10]
  wire  _GEN_830; // @[CSR.scala 126:15:@1691.10]
  wire  _GEN_832; // @[CSR.scala 126:15:@1706.10]
  wire  _GEN_834; // @[CSR.scala 126:15:@1721.10]
  wire  _GEN_836; // @[CSR.scala 126:15:@1736.10]
  wire  _GEN_838; // @[CSR.scala 126:15:@1751.10]
  wire  _GEN_840; // @[CSR.scala 126:15:@1766.10]
  wire  _GEN_842; // @[CSR.scala 126:15:@1781.10]
  wire  _GEN_844; // @[CSR.scala 126:15:@1796.10]
  wire  _GEN_846; // @[CSR.scala 126:15:@1811.10]
  wire  _GEN_848; // @[CSR.scala 126:15:@1826.10]
  wire  _GEN_850; // @[CSR.scala 126:15:@1841.10]
  wire  _GEN_852; // @[CSR.scala 126:15:@1856.10]
  wire  _GEN_854; // @[CSR.scala 126:15:@1871.10]
  wire  _GEN_856; // @[CSR.scala 126:15:@1886.10]
  wire  _GEN_858; // @[CSR.scala 126:15:@1901.10]
  assign csr__T_146_addr = io_id_addr[9:0];
  assign csr__T_146_data = csr[csr__T_146_addr]; // @[CSR.scala 22:16:@1222.4]
  assign csr__T_235_addr = 10'h304;
  assign csr__T_235_data = csr[csr__T_235_addr]; // @[CSR.scala 22:16:@1222.4]
  assign csr__T_236_addr = 10'h344;
  assign csr__T_236_data = csr[csr__T_236_addr]; // @[CSR.scala 22:16:@1222.4]
  assign csr_mtvec_addr = 10'h305;
  assign csr_mtvec_data = csr[csr_mtvec_addr]; // @[CSR.scala 22:16:@1222.4]
  assign csr_stvec_addr = 10'h105;
  assign csr_stvec_data = csr[csr_stvec_addr]; // @[CSR.scala 22:16:@1222.4]
  assign csr_utvec_addr = 10'h5;
  assign csr_utvec_data = csr[csr_utvec_addr]; // @[CSR.scala 22:16:@1222.4]
  assign csr_medeleg_addr = 10'h302;
  assign csr_medeleg_data = csr[csr_medeleg_addr]; // @[CSR.scala 22:16:@1222.4]
  assign csr_mideleg_addr = 10'h303;
  assign csr_mideleg_data = csr[csr_mideleg_addr]; // @[CSR.scala 22:16:@1222.4]
  assign csr_sedeleg_addr = 10'h102;
  assign csr_sedeleg_data = csr[csr_sedeleg_addr]; // @[CSR.scala 22:16:@1222.4]
  assign csr_sideleg_addr = 10'h103;
  assign csr_sideleg_data = csr[csr_sideleg_addr]; // @[CSR.scala 22:16:@1222.4]
  assign csr_mie_addr = 10'h304;
  assign csr_mie_data = csr[csr_mie_addr]; // @[CSR.scala 22:16:@1222.4]
  assign csr_mip_addr = 10'h344;
  assign csr_mip_data = csr[csr_mip_addr]; // @[CSR.scala 22:16:@1222.4]
  assign csr_mtimecmp_addr = 10'h321;
  assign csr_mtimecmp_data = csr[csr_mtimecmp_addr]; // @[CSR.scala 22:16:@1222.4]
  assign csr_mepc_r_0_addr = 10'h341;
  assign csr_mepc_r_0_data = csr[csr_mepc_r_0_addr]; // @[CSR.scala 22:16:@1222.4]
  assign csr_sepc_r_0_addr = 10'h141;
  assign csr_sepc_r_0_data = csr[csr_sepc_r_0_addr]; // @[CSR.scala 22:16:@1222.4]
  assign csr_uepc_r_0_addr = 10'h41;
  assign csr_uepc_r_0_data = csr[csr_uepc_r_0_addr]; // @[CSR.scala 22:16:@1222.4]
  assign csr__T_261_data = io_mem_wrCSROp_csr_data;
  assign csr__T_261_addr = 10'h311;
  assign csr__T_261_mask = 1'h1;
  assign csr__T_261_en = io_mem_wrCSROp_valid ? _T_259 : 1'h0;
  assign csr__T_270_data = io_mem_wrCSROp_csr_data;
  assign csr__T_270_addr = 10'h312;
  assign csr__T_270_mask = 1'h1;
  assign csr__T_270_en = io_mem_wrCSROp_valid ? _T_268 : 1'h0;
  assign csr__T_279_data = io_mem_wrCSROp_csr_data;
  assign csr__T_279_addr = 10'h313;
  assign csr__T_279_mask = 1'h1;
  assign csr__T_279_en = io_mem_wrCSROp_valid ? _T_277 : 1'h0;
  assign csr__T_288_data = io_mem_wrCSROp_csr_data;
  assign csr__T_288_addr = 10'h314;
  assign csr__T_288_mask = 1'h1;
  assign csr__T_288_en = io_mem_wrCSROp_valid ? _T_286 : 1'h0;
  assign csr__T_296_data = io_mem_wrCSROp_csr_data;
  assign csr__T_296_addr = 10'h300;
  assign csr__T_296_mask = 1'h1;
  assign csr__T_296_en = io_mem_wrCSROp_valid ? _T_295 : 1'h0;
  assign csr__T_304_data = io_mem_wrCSROp_csr_data;
  assign csr__T_304_addr = 10'h301;
  assign csr__T_304_mask = 1'h1;
  assign csr__T_304_en = io_mem_wrCSROp_valid ? _T_303 : 1'h0;
  assign csr__T_312_data = io_mem_wrCSROp_csr_data;
  assign csr__T_312_addr = 10'h302;
  assign csr__T_312_mask = 1'h1;
  assign csr__T_312_en = io_mem_wrCSROp_valid ? _T_311 : 1'h0;
  assign csr__T_320_data = io_mem_wrCSROp_csr_data;
  assign csr__T_320_addr = 10'h303;
  assign csr__T_320_mask = 1'h1;
  assign csr__T_320_en = io_mem_wrCSROp_valid ? _T_319 : 1'h0;
  assign csr__T_328_data = io_mem_wrCSROp_csr_data;
  assign csr__T_328_addr = 10'h304;
  assign csr__T_328_mask = 1'h1;
  assign csr__T_328_en = io_mem_wrCSROp_valid ? _T_327 : 1'h0;
  assign csr__T_336_data = io_mem_wrCSROp_csr_data;
  assign csr__T_336_addr = 10'h305;
  assign csr__T_336_mask = 1'h1;
  assign csr__T_336_en = io_mem_wrCSROp_valid ? _T_335 : 1'h0;
  assign csr__T_344_data = io_mem_wrCSROp_csr_data;
  assign csr__T_344_addr = 10'h306;
  assign csr__T_344_mask = 1'h1;
  assign csr__T_344_en = io_mem_wrCSROp_valid ? _T_343 : 1'h0;
  assign csr__T_352_data = io_mem_wrCSROp_csr_data;
  assign csr__T_352_addr = 10'h340;
  assign csr__T_352_mask = 1'h1;
  assign csr__T_352_en = io_mem_wrCSROp_valid ? _T_351 : 1'h0;
  assign csr__T_360_data = io_mem_wrCSROp_csr_data;
  assign csr__T_360_addr = 10'h341;
  assign csr__T_360_mask = 1'h1;
  assign csr__T_360_en = io_mem_wrCSROp_valid ? _T_359 : 1'h0;
  assign csr__T_368_data = io_mem_wrCSROp_csr_data;
  assign csr__T_368_addr = 10'h342;
  assign csr__T_368_mask = 1'h1;
  assign csr__T_368_en = io_mem_wrCSROp_valid ? _T_367 : 1'h0;
  assign csr__T_376_data = io_mem_wrCSROp_csr_data;
  assign csr__T_376_addr = 10'h343;
  assign csr__T_376_mask = 1'h1;
  assign csr__T_376_en = io_mem_wrCSROp_valid ? _T_375 : 1'h0;
  assign csr__T_384_data = io_mem_wrCSROp_csr_data;
  assign csr__T_384_addr = 10'h344;
  assign csr__T_384_mask = 1'h1;
  assign csr__T_384_en = io_mem_wrCSROp_valid ? _T_383 : 1'h0;
  assign csr__T_392_data = io_mem_wrCSROp_csr_data;
  assign csr__T_392_addr = 10'h100;
  assign csr__T_392_mask = 1'h1;
  assign csr__T_392_en = io_mem_wrCSROp_valid ? _T_391 : 1'h0;
  assign csr__T_400_data = io_mem_wrCSROp_csr_data;
  assign csr__T_400_addr = 10'h102;
  assign csr__T_400_mask = 1'h1;
  assign csr__T_400_en = io_mem_wrCSROp_valid ? _T_399 : 1'h0;
  assign csr__T_408_data = io_mem_wrCSROp_csr_data;
  assign csr__T_408_addr = 10'h103;
  assign csr__T_408_mask = 1'h1;
  assign csr__T_408_en = io_mem_wrCSROp_valid ? _T_407 : 1'h0;
  assign csr__T_416_data = io_mem_wrCSROp_csr_data;
  assign csr__T_416_addr = 10'h104;
  assign csr__T_416_mask = 1'h1;
  assign csr__T_416_en = io_mem_wrCSROp_valid ? _T_415 : 1'h0;
  assign csr__T_424_data = io_mem_wrCSROp_csr_data;
  assign csr__T_424_addr = 10'h105;
  assign csr__T_424_mask = 1'h1;
  assign csr__T_424_en = io_mem_wrCSROp_valid ? _T_423 : 1'h0;
  assign csr__T_432_data = io_mem_wrCSROp_csr_data;
  assign csr__T_432_addr = 10'h106;
  assign csr__T_432_mask = 1'h1;
  assign csr__T_432_en = io_mem_wrCSROp_valid ? _T_431 : 1'h0;
  assign csr__T_440_data = io_mem_wrCSROp_csr_data;
  assign csr__T_440_addr = 10'h140;
  assign csr__T_440_mask = 1'h1;
  assign csr__T_440_en = io_mem_wrCSROp_valid ? _T_439 : 1'h0;
  assign csr__T_448_data = io_mem_wrCSROp_csr_data;
  assign csr__T_448_addr = 10'h141;
  assign csr__T_448_mask = 1'h1;
  assign csr__T_448_en = io_mem_wrCSROp_valid ? _T_447 : 1'h0;
  assign csr__T_456_data = io_mem_wrCSROp_csr_data;
  assign csr__T_456_addr = 10'h142;
  assign csr__T_456_mask = 1'h1;
  assign csr__T_456_en = io_mem_wrCSROp_valid ? _T_455 : 1'h0;
  assign csr__T_464_data = io_mem_wrCSROp_csr_data;
  assign csr__T_464_addr = 10'h143;
  assign csr__T_464_mask = 1'h1;
  assign csr__T_464_en = io_mem_wrCSROp_valid ? _T_463 : 1'h0;
  assign csr__T_472_data = io_mem_wrCSROp_csr_data;
  assign csr__T_472_addr = 10'h144;
  assign csr__T_472_mask = 1'h1;
  assign csr__T_472_en = io_mem_wrCSROp_valid ? _T_471 : 1'h0;
  assign csr__T_480_data = io_mem_wrCSROp_csr_data;
  assign csr__T_480_addr = 10'h180;
  assign csr__T_480_mask = 1'h1;
  assign csr__T_480_en = io_mem_wrCSROp_valid ? _T_479 : 1'h0;
  assign csr__T_488_data = io_mem_wrCSROp_csr_data;
  assign csr__T_488_addr = 10'h5;
  assign csr__T_488_mask = 1'h1;
  assign csr__T_488_en = io_mem_wrCSROp_valid ? _T_487 : 1'h0;
  assign csr__T_496_data = io_mem_wrCSROp_csr_data;
  assign csr__T_496_addr = 10'h40;
  assign csr__T_496_mask = 1'h1;
  assign csr__T_496_en = io_mem_wrCSROp_valid ? _T_495 : 1'h0;
  assign csr__T_504_data = io_mem_wrCSROp_csr_data;
  assign csr__T_504_addr = 10'h41;
  assign csr__T_504_mask = 1'h1;
  assign csr__T_504_en = io_mem_wrCSROp_valid ? _T_503 : 1'h0;
  assign csr__T_512_data = io_mem_wrCSROp_csr_data;
  assign csr__T_512_addr = 10'h42;
  assign csr__T_512_mask = 1'h1;
  assign csr__T_512_en = io_mem_wrCSROp_valid ? _T_511 : 1'h0;
  assign csr__T_520_data = io_mem_wrCSROp_csr_data;
  assign csr__T_520_addr = 10'h43;
  assign csr__T_520_mask = 1'h1;
  assign csr__T_520_en = io_mem_wrCSROp_valid ? _T_519 : 1'h0;
  assign csr__T_528_data = io_mem_wrCSROp_csr_data;
  assign csr__T_528_addr = 10'h44;
  assign csr__T_528_mask = 1'h1;
  assign csr__T_528_en = io_mem_wrCSROp_valid ? _T_527 : 1'h0;
  assign csr__T_536_data = io_mem_wrCSROp_csr_data;
  assign csr__T_536_addr = 10'h321;
  assign csr__T_536_mask = 1'h1;
  assign csr__T_536_en = io_mem_wrCSROp_valid ? _T_535 : 1'h0;
  assign csr__T_545_data = io_mem_wrCSROp_csr_data;
  assign csr__T_545_addr = 10'h1;
  assign csr__T_545_mask = 1'h1;
  assign csr__T_545_en = io_mem_wrCSROp_valid ? _T_543 : 1'h0;
  assign csr__T_554_data = io_mem_wrCSROp_csr_data;
  assign csr__T_554_addr = 10'h0;
  assign csr__T_554_mask = 1'h1;
  assign csr__T_554_en = io_mem_wrCSROp_valid ? _T_552 : 1'h0;
  assign csr_mcause_data = {{32'd0}, io_mem_excep_code};
  assign csr_mcause_addr = 10'h342;
  assign csr_mcause_mask = io_mem_excep_valid ? _GEN_530 : 1'h0;
  assign csr_mcause_en = 1'h1;
  assign csr_scause_data = {{32'd0}, io_mem_excep_code};
  assign csr_scause_addr = 10'h142;
  assign csr_scause_mask = io_mem_excep_valid ? _GEN_534 : 1'h0;
  assign csr_scause_en = 1'h1;
  assign csr_ucause_data = {{32'd0}, io_mem_excep_code};
  assign csr_ucause_addr = 10'h42;
  assign csr_ucause_mask = io_mem_excep_valid ? _GEN_538 : 1'h0;
  assign csr_ucause_en = 1'h1;
  assign csr_mtval_data = {{32'd0}, io_mem_excep_value};
  assign csr_mtval_addr = 10'h343;
  assign csr_mtval_mask = io_mem_excep_valid ? _GEN_530 : 1'h0;
  assign csr_mtval_en = 1'h1;
  assign csr_stval_data = {{32'd0}, io_mem_excep_value};
  assign csr_stval_addr = 10'h143;
  assign csr_stval_mask = io_mem_excep_valid ? _GEN_534 : 1'h0;
  assign csr_stval_en = 1'h1;
  assign csr_utval_data = {{32'd0}, io_mem_excep_value};
  assign csr_utval_addr = 10'h43;
  assign csr_utval_mask = io_mem_excep_valid ? _GEN_538 : 1'h0;
  assign csr_utval_en = 1'h1;
  assign csr__T_627_data = {56'h0,_T_647};
  assign csr__T_627_addr = 10'h344;
  assign csr__T_627_mask = 1'h1;
  assign csr__T_627_en = 1'h1;
  assign csr_mepc_w_0_data = {{32'd0}, io_mem_excep_pc};
  assign csr_mepc_w_0_addr = 10'h341;
  assign csr_mepc_w_0_mask = io_mem_excep_valid ? _GEN_530 : 1'h0;
  assign csr_mepc_w_0_en = io_mem_excep_valid ? _GEN_530 : 1'h0;
  assign csr_sepc_w_0_data = {{32'd0}, io_mem_excep_pc};
  assign csr_sepc_w_0_addr = 10'h141;
  assign csr_sepc_w_0_mask = io_mem_excep_valid ? _GEN_534 : 1'h0;
  assign csr_sepc_w_0_en = io_mem_excep_valid ? _GEN_534 : 1'h0;
  assign csr_uepc_w_0_data = {{32'd0}, io_mem_excep_pc};
  assign csr_uepc_w_0_addr = 10'h41;
  assign csr_uepc_w_0_mask = io_mem_excep_valid ? _GEN_538 : 1'h0;
  assign csr_uepc_w_0_en = io_mem_excep_valid ? _GEN_538 : 1'h0;
  assign _T_143 = mtime + 64'h1; // @[CSR.scala 101:18:@1276.4]
  assign _T_144 = mtime + 64'h1; // @[CSR.scala 101:18:@1277.4]
  assign _T_193 = {mstatus_SPIE,mstatus_UPIE,mstatus_MIE,mstatus_old_HIE,mstatus_SIE,mstatus_UIE}; // @[CSR.scala 109:29:@1285.4]
  assign _T_199 = {mstatus_FS,mstatus_MPP,mstatus_old_HPP,mstatus_SPP,mstatus_MPIE,mstatus_old_HPIE,_T_193}; // @[CSR.scala 109:29:@1291.4]
  assign _T_204 = {mstatus_TW,mstatus_TVM,mstatus_MXR,mstatus_SUM,mstatus_MPriv,mstatus_XS}; // @[CSR.scala 109:29:@1296.4]
  assign _T_211 = {mstatus_SD,mstatus_zero1,mstatus_SXL,mstatus_UXL,mstatus_TSR,mstatus_zero2,_T_204,_T_199}; // @[CSR.scala 109:29:@1303.4]
  assign _T_237 = 12'hc00 == io_id_addr; // @[Mux.scala 46:19:@1329.4]
  assign _T_238 = _T_237 ? mtime : csr__T_146_data; // @[Mux.scala 46:16:@1330.4]
  assign _T_239 = 12'hc01 == io_id_addr; // @[Mux.scala 46:19:@1331.4]
  assign _T_240 = _T_239 ? mtime : _T_238; // @[Mux.scala 46:16:@1332.4]
  assign _T_241 = 12'h144 == io_id_addr; // @[Mux.scala 46:19:@1333.4]
  assign _T_242 = _T_241 ? csr__T_236_data : _T_240; // @[Mux.scala 46:16:@1334.4]
  assign _T_243 = 12'h104 == io_id_addr; // @[Mux.scala 46:19:@1335.4]
  assign _T_244 = _T_243 ? csr__T_235_data : _T_242; // @[Mux.scala 46:16:@1336.4]
  assign _T_245 = 12'h100 == io_id_addr; // @[Mux.scala 46:19:@1337.4]
  assign _T_246 = _T_245 ? _T_211 : _T_244; // @[Mux.scala 46:16:@1338.4]
  assign _T_247 = 12'h300 == io_id_addr; // @[Mux.scala 46:19:@1339.4]
  assign _T_248 = _T_247 ? _T_211 : _T_246; // @[Mux.scala 46:16:@1340.4]
  assign _T_249 = 12'h301 == io_id_addr; // @[Mux.scala 46:19:@1341.4]
  assign _T_250 = _T_249 ? 64'h0 : _T_248; // @[Mux.scala 46:16:@1342.4]
  assign _T_251 = 12'hf14 == io_id_addr; // @[Mux.scala 46:19:@1343.4]
  assign _T_252 = _T_251 ? 64'h0 : _T_250; // @[Mux.scala 46:16:@1344.4]
  assign _T_253 = 12'hf13 == io_id_addr; // @[Mux.scala 46:19:@1345.4]
  assign _T_254 = _T_253 ? 64'h91d : _T_252; // @[Mux.scala 46:16:@1346.4]
  assign _T_255 = 12'hf12 == io_id_addr; // @[Mux.scala 46:19:@1347.4]
  assign _T_256 = _T_255 ? 64'h8fffffff : _T_254; // @[Mux.scala 46:16:@1348.4]
  assign _T_257 = 12'hf11 == io_id_addr; // @[Mux.scala 46:19:@1349.4]
  assign _T_259 = 12'hf11 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1354.6]
  assign _T_264 = reset == 1'h0; // @[CSR.scala 126:15:@1359.8]
  assign _T_268 = 12'hf12 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1369.6]
  assign _T_277 = 12'hf13 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1384.6]
  assign _T_286 = 12'hf14 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1399.6]
  assign _T_295 = 12'h300 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1414.6]
  assign _T_303 = 12'h301 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1429.6]
  assign _T_311 = 12'h302 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1444.6]
  assign _T_319 = 12'h303 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1459.6]
  assign _T_327 = 12'h304 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1474.6]
  assign _T_335 = 12'h305 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1489.6]
  assign _T_343 = 12'h306 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1504.6]
  assign _T_351 = 12'h340 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1519.6]
  assign _T_359 = 12'h341 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1534.6]
  assign _T_367 = 12'h342 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1549.6]
  assign _T_375 = 12'h343 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1564.6]
  assign _T_383 = 12'h344 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1579.6]
  assign _T_391 = 12'h100 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1594.6]
  assign _T_399 = 12'h102 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1609.6]
  assign _T_407 = 12'h103 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1624.6]
  assign _T_415 = 12'h104 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1639.6]
  assign _T_423 = 12'h105 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1654.6]
  assign _T_431 = 12'h106 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1669.6]
  assign _T_439 = 12'h140 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1684.6]
  assign _T_447 = 12'h141 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1699.6]
  assign _T_455 = 12'h142 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1714.6]
  assign _T_463 = 12'h143 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1729.6]
  assign _T_471 = 12'h144 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1744.6]
  assign _T_479 = 12'h180 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1759.6]
  assign _T_487 = 12'h5 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1774.6]
  assign _T_495 = 12'h40 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1789.6]
  assign _T_503 = 12'h41 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1804.6]
  assign _T_511 = 12'h42 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1819.6]
  assign _T_519 = 12'h43 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1834.6]
  assign _T_527 = 12'h44 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1849.6]
  assign _T_535 = 12'h321 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1864.6]
  assign _T_543 = 12'hc01 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1879.6]
  assign _T_552 = 12'hc00 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 124:14:@1894.6]
  assign _T_561 = io_mem_wrCSROp_csr_idx == 12'h300; // @[CSR.scala 130:33:@1909.6]
  assign _T_567 = io_mem_wrCSROp_csr_data[0]; // @[CSR.scala 131:50:@1914.8]
  assign _T_568 = io_mem_wrCSROp_csr_data[1]; // @[CSR.scala 131:50:@1916.8]
  assign _T_569 = io_mem_wrCSROp_csr_data[2]; // @[CSR.scala 131:50:@1918.8]
  assign _T_570 = io_mem_wrCSROp_csr_data[3]; // @[CSR.scala 131:50:@1920.8]
  assign _T_571 = io_mem_wrCSROp_csr_data[4]; // @[CSR.scala 131:50:@1922.8]
  assign _T_572 = io_mem_wrCSROp_csr_data[5]; // @[CSR.scala 131:50:@1924.8]
  assign _T_573 = io_mem_wrCSROp_csr_data[6]; // @[CSR.scala 131:50:@1926.8]
  assign _T_574 = io_mem_wrCSROp_csr_data[7]; // @[CSR.scala 131:50:@1928.8]
  assign _T_575 = io_mem_wrCSROp_csr_data[8]; // @[CSR.scala 131:50:@1930.8]
  assign _T_576 = io_mem_wrCSROp_csr_data[10:9]; // @[CSR.scala 131:50:@1932.8]
  assign _T_577 = io_mem_wrCSROp_csr_data[12:11]; // @[CSR.scala 131:50:@1934.8]
  assign _T_578 = io_mem_wrCSROp_csr_data[14:13]; // @[CSR.scala 131:50:@1936.8]
  assign _T_579 = io_mem_wrCSROp_csr_data[16:15]; // @[CSR.scala 131:50:@1938.8]
  assign _T_580 = io_mem_wrCSROp_csr_data[17]; // @[CSR.scala 131:50:@1940.8]
  assign _T_581 = io_mem_wrCSROp_csr_data[18]; // @[CSR.scala 131:50:@1942.8]
  assign _T_582 = io_mem_wrCSROp_csr_data[19]; // @[CSR.scala 131:50:@1944.8]
  assign _T_583 = io_mem_wrCSROp_csr_data[20]; // @[CSR.scala 131:50:@1946.8]
  assign _T_584 = io_mem_wrCSROp_csr_data[21]; // @[CSR.scala 131:50:@1948.8]
  assign _T_585 = io_mem_wrCSROp_csr_data[30:22]; // @[CSR.scala 131:50:@1950.8]
  assign _T_586 = io_mem_wrCSROp_csr_data[31]; // @[CSR.scala 131:50:@1952.8]
  assign _T_587 = io_mem_wrCSROp_csr_data[33:32]; // @[CSR.scala 131:50:@1954.8]
  assign _T_588 = io_mem_wrCSROp_csr_data[35:34]; // @[CSR.scala 131:50:@1956.8]
  assign _T_589 = io_mem_wrCSROp_csr_data[62:36]; // @[CSR.scala 131:50:@1958.8]
  assign _T_590 = io_mem_wrCSROp_csr_data[63]; // @[CSR.scala 131:50:@1960.8]
  assign _GEN_185 = _T_561 ? _T_567 : mstatus_UIE; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_186 = _T_561 ? _T_568 : mstatus_SIE; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_187 = _T_561 ? _T_569 : mstatus_old_HIE; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_188 = _T_561 ? _T_570 : mstatus_MIE; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_189 = _T_561 ? _T_571 : mstatus_UPIE; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_190 = _T_561 ? _T_572 : mstatus_SPIE; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_191 = _T_561 ? _T_573 : mstatus_old_HPIE; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_192 = _T_561 ? _T_574 : mstatus_MPIE; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_193 = _T_561 ? _T_575 : mstatus_SPP; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_194 = _T_561 ? _T_576 : mstatus_old_HPP; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_195 = _T_561 ? _T_577 : mstatus_MPP; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_196 = _T_561 ? _T_578 : mstatus_FS; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_197 = _T_561 ? _T_579 : mstatus_XS; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_198 = _T_561 ? _T_580 : mstatus_MPriv; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_199 = _T_561 ? _T_581 : mstatus_SUM; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_200 = _T_561 ? _T_582 : mstatus_MXR; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_201 = _T_561 ? _T_583 : mstatus_TVM; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_202 = _T_561 ? _T_584 : mstatus_TW; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_203 = _T_561 ? _T_585 : mstatus_zero2; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_204 = _T_561 ? _T_586 : mstatus_TSR; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_205 = _T_561 ? _T_587 : mstatus_UXL; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_206 = _T_561 ? _T_588 : mstatus_SXL; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_207 = _T_561 ? _T_589 : mstatus_zero1; // @[CSR.scala 130:51:@1910.6]
  assign _GEN_208 = _T_561 ? _T_590 : mstatus_SD; // @[CSR.scala 130:51:@1910.6]
  assign _T_591 = io_mem_wrCSROp_csr_idx == 12'h100; // @[CSR.scala 133:33:@1987.6]
  assign _GEN_209 = _T_591 ? _T_567 : _GEN_185; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_210 = _T_591 ? _T_568 : _GEN_186; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_211 = _T_591 ? _T_569 : _GEN_187; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_212 = _T_591 ? _T_570 : _GEN_188; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_213 = _T_591 ? _T_571 : _GEN_189; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_214 = _T_591 ? _T_572 : _GEN_190; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_215 = _T_591 ? _T_573 : _GEN_191; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_216 = _T_591 ? _T_574 : _GEN_192; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_217 = _T_591 ? _T_575 : _GEN_193; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_218 = _T_591 ? _T_576 : _GEN_194; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_219 = _T_591 ? _T_577 : _GEN_195; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_220 = _T_591 ? _T_578 : _GEN_196; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_221 = _T_591 ? _T_579 : _GEN_197; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_222 = _T_591 ? _T_580 : _GEN_198; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_223 = _T_591 ? _T_581 : _GEN_199; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_224 = _T_591 ? _T_582 : _GEN_200; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_225 = _T_591 ? _T_583 : _GEN_201; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_226 = _T_591 ? _T_584 : _GEN_202; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_227 = _T_591 ? _T_585 : _GEN_203; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_228 = _T_591 ? _T_586 : _GEN_204; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_229 = _T_591 ? _T_587 : _GEN_205; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_230 = _T_591 ? _T_588 : _GEN_206; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_231 = _T_591 ? _T_589 : _GEN_207; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_232 = _T_591 ? _T_590 : _GEN_208; // @[CSR.scala 133:51:@1988.6]
  assign _GEN_418 = io_mem_wrCSROp_valid ? _GEN_209 : mstatus_UIE; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_419 = io_mem_wrCSROp_valid ? _GEN_210 : mstatus_SIE; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_420 = io_mem_wrCSROp_valid ? _GEN_211 : mstatus_old_HIE; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_421 = io_mem_wrCSROp_valid ? _GEN_212 : mstatus_MIE; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_422 = io_mem_wrCSROp_valid ? _GEN_213 : mstatus_UPIE; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_423 = io_mem_wrCSROp_valid ? _GEN_214 : mstatus_SPIE; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_424 = io_mem_wrCSROp_valid ? _GEN_215 : mstatus_old_HPIE; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_425 = io_mem_wrCSROp_valid ? _GEN_216 : mstatus_MPIE; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_426 = io_mem_wrCSROp_valid ? _GEN_217 : mstatus_SPP; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_427 = io_mem_wrCSROp_valid ? _GEN_218 : mstatus_old_HPP; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_428 = io_mem_wrCSROp_valid ? _GEN_219 : mstatus_MPP; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_429 = io_mem_wrCSROp_valid ? _GEN_220 : mstatus_FS; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_430 = io_mem_wrCSROp_valid ? _GEN_221 : mstatus_XS; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_431 = io_mem_wrCSROp_valid ? _GEN_222 : mstatus_MPriv; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_432 = io_mem_wrCSROp_valid ? _GEN_223 : mstatus_SUM; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_433 = io_mem_wrCSROp_valid ? _GEN_224 : mstatus_MXR; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_434 = io_mem_wrCSROp_valid ? _GEN_225 : mstatus_TVM; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_435 = io_mem_wrCSROp_valid ? _GEN_226 : mstatus_TW; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_436 = io_mem_wrCSROp_valid ? _GEN_227 : mstatus_zero2; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_437 = io_mem_wrCSROp_valid ? _GEN_228 : mstatus_TSR; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_438 = io_mem_wrCSROp_valid ? _GEN_229 : mstatus_UXL; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_439 = io_mem_wrCSROp_valid ? _GEN_230 : mstatus_SXL; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_440 = io_mem_wrCSROp_valid ? _GEN_231 : mstatus_zero1; // @[CSR.scala 122:30:@1353.4]
  assign _GEN_441 = io_mem_wrCSROp_valid ? _GEN_232 : mstatus_SD; // @[CSR.scala 122:30:@1353.4]
  assign _T_622 = 2'h0 == prv; // @[Mux.scala 46:19:@2085.4]
  assign _T_623 = _T_622 ? mstatus_UIE : 1'h0; // @[Mux.scala 46:16:@2086.4]
  assign _T_624 = 2'h1 == prv; // @[Mux.scala 46:19:@2087.4]
  assign _T_625 = _T_624 ? mstatus_SIE : _T_623; // @[Mux.scala 46:16:@2088.4]
  assign _T_626 = 2'h3 == prv; // @[Mux.scala 46:19:@2089.4]
  assign ie = _T_626 ? mstatus_MIE : _T_625; // @[Mux.scala 46:16:@2090.4]
  assign time_inter = mtime >= csr_mtimecmp_data; // @[CSR.scala 165:27:@2091.4]
  assign _T_629 = prv == 2'h3; // @[CSR.scala 169:10:@2093.4]
  assign _T_632 = prv == 2'h1; // @[CSR.scala 171:10:@2095.4]
  assign _T_634 = prv == 2'h0; // @[CSR.scala 172:10:@2097.4]
  assign _T_637 = _T_629 & time_inter; // @[CSR.scala 174:22:@2100.4]
  assign _T_640 = _T_632 & time_inter; // @[CSR.scala 176:22:@2102.4]
  assign _T_642 = _T_634 & time_inter; // @[CSR.scala 177:22:@2104.4]
  assign _T_643 = csr_mip_data[3:0]; // @[CSR.scala 178:8:@2105.4]
  assign _T_647 = {_T_637,1'h0,_T_640,_T_642,_T_643}; // @[Cat.scala 30:58:@2109.4]
  assign ipie = csr_mip_data & csr_mie_data; // @[CSR.scala 181:20:@2116.4]
  assign _T_653 = ~ csr_mideleg_data; // @[CSR.scala 182:25:@2117.4]
  assign ipie_m = ipie & _T_653; // @[CSR.scala 182:23:@2118.4]
  assign ipie_s = ipie & csr_mideleg_data; // @[CSR.scala 183:23:@2119.4]
  assign _T_654 = ipie_m[11]; // @[CSR.scala 186:14:@2120.4]
  assign _T_656 = ipie_m[9]; // @[CSR.scala 187:14:@2121.4]
  assign _T_658 = ipie_m[8]; // @[CSR.scala 188:14:@2122.4]
  assign _T_660 = ipie_m[7]; // @[CSR.scala 190:14:@2123.4]
  assign _T_662 = ipie_m[5]; // @[CSR.scala 191:14:@2124.4]
  assign _T_664 = ipie_m[4]; // @[CSR.scala 192:14:@2125.4]
  assign _T_666 = ipie_m[3]; // @[CSR.scala 194:14:@2126.4]
  assign _T_668 = ipie_m[1]; // @[CSR.scala 195:14:@2127.4]
  assign _T_670 = ipie_m[0]; // @[CSR.scala 196:14:@2128.4]
  assign _T_672 = ipie_s[11]; // @[CSR.scala 198:14:@2129.4]
  assign _T_674 = ipie_s[9]; // @[CSR.scala 199:14:@2130.4]
  assign _T_676 = ipie_s[8]; // @[CSR.scala 200:14:@2131.4]
  assign _T_678 = ipie_s[7]; // @[CSR.scala 202:14:@2132.4]
  assign _T_680 = ipie_s[5]; // @[CSR.scala 203:14:@2133.4]
  assign _T_682 = ipie_s[4]; // @[CSR.scala 204:14:@2134.4]
  assign _T_684 = ipie_s[3]; // @[CSR.scala 206:14:@2135.4]
  assign _T_686 = ipie_s[1]; // @[CSR.scala 207:14:@2136.4]
  assign _T_694 = _T_684 ? 2'h3 : {{1'd0}, _T_686}; // @[Mux.scala 31:69:@2140.4]
  assign _T_695 = _T_682 ? 3'h4 : {{1'd0}, _T_694}; // @[Mux.scala 31:69:@2141.4]
  assign _T_696 = _T_680 ? 3'h5 : _T_695; // @[Mux.scala 31:69:@2142.4]
  assign _T_697 = _T_678 ? 3'h7 : _T_696; // @[Mux.scala 31:69:@2143.4]
  assign _T_698 = _T_676 ? 4'h8 : {{1'd0}, _T_697}; // @[Mux.scala 31:69:@2144.4]
  assign _T_699 = _T_674 ? 4'h9 : _T_698; // @[Mux.scala 31:69:@2145.4]
  assign _T_700 = _T_672 ? 4'hb : _T_699; // @[Mux.scala 31:69:@2146.4]
  assign _T_701 = _T_670 ? 4'h0 : _T_700; // @[Mux.scala 31:69:@2147.4]
  assign _T_702 = _T_668 ? 4'h1 : _T_701; // @[Mux.scala 31:69:@2148.4]
  assign _T_703 = _T_666 ? 4'h3 : _T_702; // @[Mux.scala 31:69:@2149.4]
  assign _T_704 = _T_664 ? 4'h4 : _T_703; // @[Mux.scala 31:69:@2150.4]
  assign _T_705 = _T_662 ? 4'h5 : _T_704; // @[Mux.scala 31:69:@2151.4]
  assign _T_706 = _T_660 ? 4'h7 : _T_705; // @[Mux.scala 31:69:@2152.4]
  assign _T_707 = _T_658 ? 4'h8 : _T_706; // @[Mux.scala 31:69:@2153.4]
  assign _T_708 = _T_656 ? 4'h9 : _T_707; // @[Mux.scala 31:69:@2154.4]
  assign ic = _T_654 ? 4'hb : _T_708; // @[Mux.scala 31:69:@2155.4]
  assign _T_709 = csr_mideleg_data >> ic; // @[CSR.scala 213:38:@2156.4]
  assign _T_710 = _T_709[0]; // @[CSR.scala 213:38:@2157.4]
  assign inter_new_mode = _T_710 ? 2'h1 : 2'h3; // @[CSR.scala 213:29:@2158.4]
  assign _T_711 = inter_new_mode > prv; // @[CSR.scala 214:42:@2159.4]
  assign _T_712 = inter_new_mode == prv; // @[CSR.scala 214:69:@2160.4]
  assign _T_713 = _T_712 & ie; // @[CSR.scala 214:78:@2161.4]
  assign inter_enable = _T_711 | _T_713; // @[CSR.scala 214:49:@2162.4]
  assign _T_715 = ipie != 64'h0; // @[CSR.scala 216:44:@2163.4]
  assign _GEN_783 = {{28'd0}, ic}; // @[CSR.scala 217:47:@2167.4]
  assign _T_720 = io_mem_excep_code[31:2]; // @[Const.scala 68:33:@2172.6]
  assign _T_723 = _T_720 == 30'h4; // @[Const.scala 68:40:@2173.6]
  assign _T_724 = io_mem_excep_code[1:0]; // @[Const.scala 69:32:@2175.8]
  assign _T_725 = 2'h3 == _T_724; // @[Conditional.scala 37:30:@2176.8]
  assign _T_727 = 2'h1 == _T_724; // @[Conditional.scala 37:30:@2185.10]
  assign _T_730 = 2'h0 == _T_724; // @[Conditional.scala 37:30:@2194.12]
  assign _GEN_442 = _T_730 ? mstatus_MPIE : _GEN_418; // @[Conditional.scala 39:67:@2195.12]
  assign _GEN_443 = _T_730 ? 1'h1 : _GEN_422; // @[Conditional.scala 39:67:@2195.12]
  assign _GEN_444 = _T_730 ? 2'h0 : prv; // @[Conditional.scala 39:67:@2195.12]
  assign _GEN_446 = _T_727 ? mstatus_SPIE : _GEN_419; // @[Conditional.scala 39:67:@2186.10]
  assign _GEN_447 = _T_727 ? 1'h1 : _GEN_423; // @[Conditional.scala 39:67:@2186.10]
  assign _GEN_448 = _T_727 ? 1'h0 : _GEN_426; // @[Conditional.scala 39:67:@2186.10]
  assign _GEN_449 = _T_727 ? {{1'd0}, mstatus_SPP} : _GEN_444; // @[Conditional.scala 39:67:@2186.10]
  assign _GEN_451 = _T_727 ? _GEN_418 : _GEN_442; // @[Conditional.scala 39:67:@2186.10]
  assign _GEN_452 = _T_727 ? _GEN_422 : _GEN_443; // @[Conditional.scala 39:67:@2186.10]
  assign _GEN_453 = _T_725 ? mstatus_MPIE : _GEN_421; // @[Conditional.scala 40:58:@2177.8]
  assign _GEN_454 = _T_725 ? 1'h1 : _GEN_425; // @[Conditional.scala 40:58:@2177.8]
  assign _GEN_455 = _T_725 ? 2'h0 : _GEN_428; // @[Conditional.scala 40:58:@2177.8]
  assign _GEN_456 = _T_725 ? mstatus_MPP : _GEN_449; // @[Conditional.scala 40:58:@2177.8]
  assign _GEN_458 = _T_725 ? _GEN_419 : _GEN_446; // @[Conditional.scala 40:58:@2177.8]
  assign _GEN_459 = _T_725 ? _GEN_423 : _GEN_447; // @[Conditional.scala 40:58:@2177.8]
  assign _GEN_460 = _T_725 ? _GEN_426 : _GEN_448; // @[Conditional.scala 40:58:@2177.8]
  assign _GEN_461 = _T_725 ? _GEN_418 : _GEN_451; // @[Conditional.scala 40:58:@2177.8]
  assign _GEN_462 = _T_725 ? _GEN_422 : _GEN_452; // @[Conditional.scala 40:58:@2177.8]
  assign _T_732 = io_mem_excep_code == 32'h14; // @[CSR.scala 250:31:@2203.8]
  assign _T_733 = io_mem_excep_code == 32'h15; // @[CSR.scala 250:67:@2204.8]
  assign _T_734 = _T_732 | _T_733; // @[CSR.scala 250:51:@2205.8]
  assign _T_735 = io_mem_excep_code[31]; // @[CSR.scala 255:18:@2209.10]
  assign _T_737 = _T_735 == 1'h0; // @[CSR.scala 255:12:@2210.10]
  assign _T_738 = io_mem_excep_code[4:0]; // @[CSR.scala 255:40:@2211.10]
  assign _T_739 = csr_medeleg_data >> _T_738; // @[CSR.scala 255:34:@2212.10]
  assign _T_740 = _T_739[0]; // @[CSR.scala 255:34:@2213.10]
  assign _T_742 = _T_740 == 1'h0; // @[CSR.scala 255:26:@2214.10]
  assign _T_743 = _T_737 & _T_742; // @[CSR.scala 255:23:@2215.10]
  assign _T_746 = csr_mideleg_data >> _T_738; // @[CSR.scala 256:34:@2218.10]
  assign _T_747 = _T_746[0]; // @[CSR.scala 256:34:@2219.10]
  assign _T_749 = _T_747 == 1'h0; // @[CSR.scala 256:26:@2220.10]
  assign _T_750 = _T_735 & _T_749; // @[CSR.scala 256:23:@2221.10]
  assign _T_755 = csr_sedeleg_data >> _T_738; // @[CSR.scala 257:34:@2225.10]
  assign _T_756 = _T_755[0]; // @[CSR.scala 257:34:@2226.10]
  assign _T_758 = _T_756 == 1'h0; // @[CSR.scala 257:26:@2227.10]
  assign _T_759 = _T_737 & _T_758; // @[CSR.scala 257:23:@2228.10]
  assign _T_762 = csr_sideleg_data >> _T_738; // @[CSR.scala 258:34:@2231.10]
  assign _T_763 = _T_762[0]; // @[CSR.scala 258:34:@2232.10]
  assign _T_765 = _T_763 == 1'h0; // @[CSR.scala 258:26:@2233.10]
  assign _T_766 = _T_735 & _T_765; // @[CSR.scala 258:23:@2234.10]
  assign _T_768 = _T_766 ? 2'h1 : 2'h0; // @[Mux.scala 31:69:@2235.10]
  assign _T_769 = _T_759 ? 2'h1 : _T_768; // @[Mux.scala 31:69:@2236.10]
  assign _T_770 = _T_750 ? 2'h3 : _T_769; // @[Mux.scala 31:69:@2237.10]
  assign _T_771 = _T_743 ? 2'h3 : _T_770; // @[Mux.scala 31:69:@2238.10]
  assign _GEN_499 = _T_734 ? prv : _T_771; // @[CSR.scala 250:88:@2206.8]
  assign _GEN_522 = _T_723 ? _GEN_456 : _GEN_499; // @[CSR.scala 227:32:@2174.6]
  assign nextPrv = io_mem_excep_valid ? _GEN_522 : prv; // @[CSR.scala 226:22:@2171.4]
  assign _T_772 = 2'h3 == nextPrv; // @[Conditional.scala 37:30:@2240.10]
  assign _T_774 = 2'h1 == nextPrv; // @[Conditional.scala 37:30:@2249.12]
  assign _T_776 = 2'h0 == nextPrv; // @[Conditional.scala 37:30:@2258.14]
  assign _GEN_463 = _T_776 ? mstatus_UIE : _GEN_422; // @[Conditional.scala 39:67:@2259.14]
  assign _GEN_464 = _T_776 ? 1'h0 : _GEN_418; // @[Conditional.scala 39:67:@2259.14]
  assign _GEN_469 = _T_774 ? mstatus_SIE : _GEN_423; // @[Conditional.scala 39:67:@2250.12]
  assign _GEN_470 = _T_774 ? 1'h0 : _GEN_419; // @[Conditional.scala 39:67:@2250.12]
  assign _GEN_475 = _T_774 ? _GEN_422 : _GEN_463; // @[Conditional.scala 39:67:@2250.12]
  assign _GEN_476 = _T_774 ? _GEN_418 : _GEN_464; // @[Conditional.scala 39:67:@2250.12]
  assign _GEN_478 = _T_774 ? 1'h0 : _T_776; // @[Conditional.scala 39:67:@2250.12]
  assign _GEN_481 = _T_772 ? mstatus_MIE : _GEN_425; // @[Conditional.scala 40:58:@2241.10]
  assign _GEN_482 = _T_772 ? 1'h0 : _GEN_421; // @[Conditional.scala 40:58:@2241.10]
  assign _GEN_487 = _T_772 ? _GEN_423 : _GEN_469; // @[Conditional.scala 40:58:@2241.10]
  assign _GEN_488 = _T_772 ? _GEN_419 : _GEN_470; // @[Conditional.scala 40:58:@2241.10]
  assign _GEN_490 = _T_772 ? 1'h0 : _T_774; // @[Conditional.scala 40:58:@2241.10]
  assign _GEN_493 = _T_772 ? _GEN_422 : _GEN_475; // @[Conditional.scala 40:58:@2241.10]
  assign _GEN_494 = _T_772 ? _GEN_418 : _GEN_476; // @[Conditional.scala 40:58:@2241.10]
  assign _GEN_496 = _T_772 ? 1'h0 : _GEN_478; // @[Conditional.scala 40:58:@2241.10]
  assign _GEN_500 = _T_734 ? _GEN_425 : _GEN_481; // @[CSR.scala 250:88:@2206.8]
  assign _GEN_501 = _T_734 ? _GEN_421 : _GEN_482; // @[CSR.scala 250:88:@2206.8]
  assign _GEN_503 = _T_734 ? 1'h0 : _T_772; // @[CSR.scala 250:88:@2206.8]
  assign _GEN_506 = _T_734 ? _GEN_423 : _GEN_487; // @[CSR.scala 250:88:@2206.8]
  assign _GEN_507 = _T_734 ? _GEN_419 : _GEN_488; // @[CSR.scala 250:88:@2206.8]
  assign _GEN_509 = _T_734 ? 1'h0 : _GEN_490; // @[CSR.scala 250:88:@2206.8]
  assign _GEN_512 = _T_734 ? _GEN_422 : _GEN_493; // @[CSR.scala 250:88:@2206.8]
  assign _GEN_513 = _T_734 ? _GEN_418 : _GEN_494; // @[CSR.scala 250:88:@2206.8]
  assign _GEN_515 = _T_734 ? 1'h0 : _GEN_496; // @[CSR.scala 250:88:@2206.8]
  assign _GEN_519 = _T_723 ? _GEN_453 : _GEN_501; // @[CSR.scala 227:32:@2174.6]
  assign _GEN_520 = _T_723 ? _GEN_454 : _GEN_500; // @[CSR.scala 227:32:@2174.6]
  assign _GEN_521 = _T_723 ? _GEN_455 : _GEN_428; // @[CSR.scala 227:32:@2174.6]
  assign _GEN_524 = _T_723 ? _GEN_458 : _GEN_507; // @[CSR.scala 227:32:@2174.6]
  assign _GEN_525 = _T_723 ? _GEN_459 : _GEN_506; // @[CSR.scala 227:32:@2174.6]
  assign _GEN_526 = _T_723 ? _GEN_460 : _GEN_426; // @[CSR.scala 227:32:@2174.6]
  assign _GEN_527 = _T_723 ? _GEN_461 : _GEN_513; // @[CSR.scala 227:32:@2174.6]
  assign _GEN_528 = _T_723 ? _GEN_462 : _GEN_512; // @[CSR.scala 227:32:@2174.6]
  assign _GEN_530 = _T_723 ? 1'h0 : _GEN_503; // @[CSR.scala 227:32:@2174.6]
  assign _GEN_534 = _T_723 ? 1'h0 : _GEN_509; // @[CSR.scala 227:32:@2174.6]
  assign _GEN_538 = _T_723 ? 1'h0 : _GEN_515; // @[CSR.scala 227:32:@2174.6]
  assign _GEN_541 = io_mem_excep_valid ? _GEN_519 : _GEN_421; // @[CSR.scala 226:22:@2171.4]
  assign _GEN_542 = io_mem_excep_valid ? _GEN_520 : _GEN_425; // @[CSR.scala 226:22:@2171.4]
  assign _GEN_543 = io_mem_excep_valid ? _GEN_521 : _GEN_428; // @[CSR.scala 226:22:@2171.4]
  assign _GEN_546 = io_mem_excep_valid ? _GEN_524 : _GEN_419; // @[CSR.scala 226:22:@2171.4]
  assign _GEN_547 = io_mem_excep_valid ? _GEN_525 : _GEN_423; // @[CSR.scala 226:22:@2171.4]
  assign _GEN_548 = io_mem_excep_valid ? _GEN_526 : _GEN_426; // @[CSR.scala 226:22:@2171.4]
  assign _GEN_549 = io_mem_excep_valid ? _GEN_527 : _GEN_418; // @[CSR.scala 226:22:@2171.4]
  assign _GEN_550 = io_mem_excep_valid ? _GEN_528 : _GEN_422; // @[CSR.scala 226:22:@2171.4]
  assign io_id_rdata = _T_257 ? 64'h91d : _T_256; // @[CSR.scala 103:15:@1351.4]
  assign io_id_priv = prv; // @[CSR.scala 116:14:@1352.4]
  assign io_flush = io_mem_excep_valid; // @[CSR.scala 223:14:@2169.4]
  assign io_inter_valid = inter_enable & _T_715; // @[CSR.scala 216:20:@2165.4]
  assign io_inter_bits = 32'h80000000 | _GEN_783; // @[CSR.scala 217:20:@2168.4]
  assign _GEN_786 = io_mem_wrCSROp_valid & _T_259; // @[CSR.scala 126:15:@1361.10]
  assign _GEN_788 = io_mem_wrCSROp_valid & _T_268; // @[CSR.scala 126:15:@1376.10]
  assign _GEN_790 = io_mem_wrCSROp_valid & _T_277; // @[CSR.scala 126:15:@1391.10]
  assign _GEN_792 = io_mem_wrCSROp_valid & _T_286; // @[CSR.scala 126:15:@1406.10]
  assign _GEN_794 = io_mem_wrCSROp_valid & _T_295; // @[CSR.scala 126:15:@1421.10]
  assign _GEN_796 = io_mem_wrCSROp_valid & _T_303; // @[CSR.scala 126:15:@1436.10]
  assign _GEN_798 = io_mem_wrCSROp_valid & _T_311; // @[CSR.scala 126:15:@1451.10]
  assign _GEN_800 = io_mem_wrCSROp_valid & _T_319; // @[CSR.scala 126:15:@1466.10]
  assign _GEN_802 = io_mem_wrCSROp_valid & _T_327; // @[CSR.scala 126:15:@1481.10]
  assign _GEN_804 = io_mem_wrCSROp_valid & _T_335; // @[CSR.scala 126:15:@1496.10]
  assign _GEN_806 = io_mem_wrCSROp_valid & _T_343; // @[CSR.scala 126:15:@1511.10]
  assign _GEN_808 = io_mem_wrCSROp_valid & _T_351; // @[CSR.scala 126:15:@1526.10]
  assign _GEN_810 = io_mem_wrCSROp_valid & _T_359; // @[CSR.scala 126:15:@1541.10]
  assign _GEN_812 = io_mem_wrCSROp_valid & _T_367; // @[CSR.scala 126:15:@1556.10]
  assign _GEN_814 = io_mem_wrCSROp_valid & _T_375; // @[CSR.scala 126:15:@1571.10]
  assign _GEN_816 = io_mem_wrCSROp_valid & _T_383; // @[CSR.scala 126:15:@1586.10]
  assign _GEN_818 = io_mem_wrCSROp_valid & _T_391; // @[CSR.scala 126:15:@1601.10]
  assign _GEN_820 = io_mem_wrCSROp_valid & _T_399; // @[CSR.scala 126:15:@1616.10]
  assign _GEN_822 = io_mem_wrCSROp_valid & _T_407; // @[CSR.scala 126:15:@1631.10]
  assign _GEN_824 = io_mem_wrCSROp_valid & _T_415; // @[CSR.scala 126:15:@1646.10]
  assign _GEN_826 = io_mem_wrCSROp_valid & _T_423; // @[CSR.scala 126:15:@1661.10]
  assign _GEN_828 = io_mem_wrCSROp_valid & _T_431; // @[CSR.scala 126:15:@1676.10]
  assign _GEN_830 = io_mem_wrCSROp_valid & _T_439; // @[CSR.scala 126:15:@1691.10]
  assign _GEN_832 = io_mem_wrCSROp_valid & _T_447; // @[CSR.scala 126:15:@1706.10]
  assign _GEN_834 = io_mem_wrCSROp_valid & _T_455; // @[CSR.scala 126:15:@1721.10]
  assign _GEN_836 = io_mem_wrCSROp_valid & _T_463; // @[CSR.scala 126:15:@1736.10]
  assign _GEN_838 = io_mem_wrCSROp_valid & _T_471; // @[CSR.scala 126:15:@1751.10]
  assign _GEN_840 = io_mem_wrCSROp_valid & _T_479; // @[CSR.scala 126:15:@1766.10]
  assign _GEN_842 = io_mem_wrCSROp_valid & _T_487; // @[CSR.scala 126:15:@1781.10]
  assign _GEN_844 = io_mem_wrCSROp_valid & _T_495; // @[CSR.scala 126:15:@1796.10]
  assign _GEN_846 = io_mem_wrCSROp_valid & _T_503; // @[CSR.scala 126:15:@1811.10]
  assign _GEN_848 = io_mem_wrCSROp_valid & _T_511; // @[CSR.scala 126:15:@1826.10]
  assign _GEN_850 = io_mem_wrCSROp_valid & _T_519; // @[CSR.scala 126:15:@1841.10]
  assign _GEN_852 = io_mem_wrCSROp_valid & _T_527; // @[CSR.scala 126:15:@1856.10]
  assign _GEN_854 = io_mem_wrCSROp_valid & _T_535; // @[CSR.scala 126:15:@1871.10]
  assign _GEN_856 = io_mem_wrCSROp_valid & _T_543; // @[CSR.scala 126:15:@1886.10]
  assign _GEN_858 = io_mem_wrCSROp_valid & _T_552; // @[CSR.scala 126:15:@1901.10]
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
  _RAND_1 = {1{`RANDOM}};
  prv = _RAND_1[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  mstatus_SD = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  mstatus_zero1 = _RAND_3[26:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  mstatus_SXL = _RAND_4[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  mstatus_UXL = _RAND_5[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  mstatus_TSR = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  mstatus_zero2 = _RAND_7[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  mstatus_TW = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  mstatus_TVM = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  mstatus_MXR = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  mstatus_SUM = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  mstatus_MPriv = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  mstatus_XS = _RAND_13[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  mstatus_FS = _RAND_14[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  mstatus_MPP = _RAND_15[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  mstatus_old_HPP = _RAND_16[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  mstatus_SPP = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  mstatus_MPIE = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  mstatus_old_HPIE = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  mstatus_SPIE = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  mstatus_UPIE = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  mstatus_MIE = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  mstatus_old_HIE = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  mstatus_SIE = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  mstatus_UIE = _RAND_25[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {2{`RANDOM}};
  mtime = _RAND_26[63:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(csr__T_261_en & csr__T_261_mask) begin
      csr[csr__T_261_addr] <= csr__T_261_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_270_en & csr__T_270_mask) begin
      csr[csr__T_270_addr] <= csr__T_270_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_279_en & csr__T_279_mask) begin
      csr[csr__T_279_addr] <= csr__T_279_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_288_en & csr__T_288_mask) begin
      csr[csr__T_288_addr] <= csr__T_288_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_296_en & csr__T_296_mask) begin
      csr[csr__T_296_addr] <= csr__T_296_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_304_en & csr__T_304_mask) begin
      csr[csr__T_304_addr] <= csr__T_304_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_312_en & csr__T_312_mask) begin
      csr[csr__T_312_addr] <= csr__T_312_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_320_en & csr__T_320_mask) begin
      csr[csr__T_320_addr] <= csr__T_320_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_328_en & csr__T_328_mask) begin
      csr[csr__T_328_addr] <= csr__T_328_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_336_en & csr__T_336_mask) begin
      csr[csr__T_336_addr] <= csr__T_336_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_344_en & csr__T_344_mask) begin
      csr[csr__T_344_addr] <= csr__T_344_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_352_en & csr__T_352_mask) begin
      csr[csr__T_352_addr] <= csr__T_352_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_360_en & csr__T_360_mask) begin
      csr[csr__T_360_addr] <= csr__T_360_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_368_en & csr__T_368_mask) begin
      csr[csr__T_368_addr] <= csr__T_368_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_376_en & csr__T_376_mask) begin
      csr[csr__T_376_addr] <= csr__T_376_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_384_en & csr__T_384_mask) begin
      csr[csr__T_384_addr] <= csr__T_384_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_392_en & csr__T_392_mask) begin
      csr[csr__T_392_addr] <= csr__T_392_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_400_en & csr__T_400_mask) begin
      csr[csr__T_400_addr] <= csr__T_400_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_408_en & csr__T_408_mask) begin
      csr[csr__T_408_addr] <= csr__T_408_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_416_en & csr__T_416_mask) begin
      csr[csr__T_416_addr] <= csr__T_416_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_424_en & csr__T_424_mask) begin
      csr[csr__T_424_addr] <= csr__T_424_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_432_en & csr__T_432_mask) begin
      csr[csr__T_432_addr] <= csr__T_432_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_440_en & csr__T_440_mask) begin
      csr[csr__T_440_addr] <= csr__T_440_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_448_en & csr__T_448_mask) begin
      csr[csr__T_448_addr] <= csr__T_448_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_456_en & csr__T_456_mask) begin
      csr[csr__T_456_addr] <= csr__T_456_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_464_en & csr__T_464_mask) begin
      csr[csr__T_464_addr] <= csr__T_464_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_472_en & csr__T_472_mask) begin
      csr[csr__T_472_addr] <= csr__T_472_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_480_en & csr__T_480_mask) begin
      csr[csr__T_480_addr] <= csr__T_480_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_488_en & csr__T_488_mask) begin
      csr[csr__T_488_addr] <= csr__T_488_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_496_en & csr__T_496_mask) begin
      csr[csr__T_496_addr] <= csr__T_496_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_504_en & csr__T_504_mask) begin
      csr[csr__T_504_addr] <= csr__T_504_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_512_en & csr__T_512_mask) begin
      csr[csr__T_512_addr] <= csr__T_512_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_520_en & csr__T_520_mask) begin
      csr[csr__T_520_addr] <= csr__T_520_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_528_en & csr__T_528_mask) begin
      csr[csr__T_528_addr] <= csr__T_528_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_536_en & csr__T_536_mask) begin
      csr[csr__T_536_addr] <= csr__T_536_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_545_en & csr__T_545_mask) begin
      csr[csr__T_545_addr] <= csr__T_545_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_554_en & csr__T_554_mask) begin
      csr[csr__T_554_addr] <= csr__T_554_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr_mcause_en & csr_mcause_mask) begin
      csr[csr_mcause_addr] <= csr_mcause_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr_scause_en & csr_scause_mask) begin
      csr[csr_scause_addr] <= csr_scause_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr_ucause_en & csr_ucause_mask) begin
      csr[csr_ucause_addr] <= csr_ucause_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr_mtval_en & csr_mtval_mask) begin
      csr[csr_mtval_addr] <= csr_mtval_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr_stval_en & csr_stval_mask) begin
      csr[csr_stval_addr] <= csr_stval_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr_utval_en & csr_utval_mask) begin
      csr[csr_utval_addr] <= csr_utval_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr__T_627_en & csr__T_627_mask) begin
      csr[csr__T_627_addr] <= csr__T_627_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr_mepc_w_0_en & csr_mepc_w_0_mask) begin
      csr[csr_mepc_w_0_addr] <= csr_mepc_w_0_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr_sepc_w_0_en & csr_sepc_w_0_mask) begin
      csr[csr_sepc_w_0_addr] <= csr_sepc_w_0_data; // @[CSR.scala 22:16:@1222.4]
    end
    if(csr_uepc_w_0_en & csr_uepc_w_0_mask) begin
      csr[csr_uepc_w_0_addr] <= csr_uepc_w_0_data; // @[CSR.scala 22:16:@1222.4]
    end
    if (reset) begin
      prv <= 2'h3;
    end else begin
      if (io_mem_excep_valid) begin
        if (_T_723) begin
          if (_T_725) begin
            prv <= mstatus_MPP;
          end else begin
            if (_T_727) begin
              prv <= {{1'd0}, mstatus_SPP};
            end else begin
              if (_T_730) begin
                prv <= 2'h0;
              end
            end
          end
        end else begin
          if (!(_T_734)) begin
            if (_T_743) begin
              prv <= 2'h3;
            end else begin
              if (_T_750) begin
                prv <= 2'h3;
              end else begin
                if (_T_759) begin
                  prv <= 2'h1;
                end else begin
                  if (_T_766) begin
                    prv <= 2'h1;
                  end else begin
                    prv <= 2'h0;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      mstatus_SD <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_591) begin
          mstatus_SD <= _T_590;
        end else begin
          if (_T_561) begin
            mstatus_SD <= _T_590;
          end
        end
      end
    end
    if (reset) begin
      mstatus_zero1 <= 27'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_591) begin
          mstatus_zero1 <= _T_589;
        end else begin
          if (_T_561) begin
            mstatus_zero1 <= _T_589;
          end
        end
      end
    end
    if (reset) begin
      mstatus_SXL <= 2'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_591) begin
          mstatus_SXL <= _T_588;
        end else begin
          if (_T_561) begin
            mstatus_SXL <= _T_588;
          end
        end
      end
    end
    if (reset) begin
      mstatus_UXL <= 2'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_591) begin
          mstatus_UXL <= _T_587;
        end else begin
          if (_T_561) begin
            mstatus_UXL <= _T_587;
          end
        end
      end
    end
    if (reset) begin
      mstatus_TSR <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_591) begin
          mstatus_TSR <= _T_586;
        end else begin
          if (_T_561) begin
            mstatus_TSR <= _T_586;
          end
        end
      end
    end
    if (reset) begin
      mstatus_zero2 <= 9'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_591) begin
          mstatus_zero2 <= _T_585;
        end else begin
          if (_T_561) begin
            mstatus_zero2 <= _T_585;
          end
        end
      end
    end
    if (reset) begin
      mstatus_TW <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_591) begin
          mstatus_TW <= _T_584;
        end else begin
          if (_T_561) begin
            mstatus_TW <= _T_584;
          end
        end
      end
    end
    if (reset) begin
      mstatus_TVM <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_591) begin
          mstatus_TVM <= _T_583;
        end else begin
          if (_T_561) begin
            mstatus_TVM <= _T_583;
          end
        end
      end
    end
    if (reset) begin
      mstatus_MXR <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_591) begin
          mstatus_MXR <= _T_582;
        end else begin
          if (_T_561) begin
            mstatus_MXR <= _T_582;
          end
        end
      end
    end
    if (reset) begin
      mstatus_SUM <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_591) begin
          mstatus_SUM <= _T_581;
        end else begin
          if (_T_561) begin
            mstatus_SUM <= _T_581;
          end
        end
      end
    end
    if (reset) begin
      mstatus_MPriv <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_591) begin
          mstatus_MPriv <= _T_580;
        end else begin
          if (_T_561) begin
            mstatus_MPriv <= _T_580;
          end
        end
      end
    end
    if (reset) begin
      mstatus_XS <= 2'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_591) begin
          mstatus_XS <= _T_579;
        end else begin
          if (_T_561) begin
            mstatus_XS <= _T_579;
          end
        end
      end
    end
    if (reset) begin
      mstatus_FS <= 2'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_591) begin
          mstatus_FS <= _T_578;
        end else begin
          if (_T_561) begin
            mstatus_FS <= _T_578;
          end
        end
      end
    end
    if (reset) begin
      mstatus_MPP <= 2'h0;
    end else begin
      if (io_mem_excep_valid) begin
        if (_T_723) begin
          if (_T_725) begin
            mstatus_MPP <= 2'h0;
          end else begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_591) begin
                mstatus_MPP <= _T_577;
              end else begin
                if (_T_561) begin
                  mstatus_MPP <= _T_577;
                end
              end
            end
          end
        end else begin
          if (io_mem_wrCSROp_valid) begin
            if (_T_591) begin
              mstatus_MPP <= _T_577;
            end else begin
              if (_T_561) begin
                mstatus_MPP <= _T_577;
              end
            end
          end
        end
      end else begin
        if (io_mem_wrCSROp_valid) begin
          if (_T_591) begin
            mstatus_MPP <= _T_577;
          end else begin
            if (_T_561) begin
              mstatus_MPP <= _T_577;
            end
          end
        end
      end
    end
    if (reset) begin
      mstatus_old_HPP <= 2'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_591) begin
          mstatus_old_HPP <= _T_576;
        end else begin
          if (_T_561) begin
            mstatus_old_HPP <= _T_576;
          end
        end
      end
    end
    if (reset) begin
      mstatus_SPP <= 1'h0;
    end else begin
      if (io_mem_excep_valid) begin
        if (_T_723) begin
          if (_T_725) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_591) begin
                mstatus_SPP <= _T_575;
              end else begin
                if (_T_561) begin
                  mstatus_SPP <= _T_575;
                end
              end
            end
          end else begin
            if (_T_727) begin
              mstatus_SPP <= 1'h0;
            end else begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_591) begin
                  mstatus_SPP <= _T_575;
                end else begin
                  if (_T_561) begin
                    mstatus_SPP <= _T_575;
                  end
                end
              end
            end
          end
        end else begin
          if (io_mem_wrCSROp_valid) begin
            if (_T_591) begin
              mstatus_SPP <= _T_575;
            end else begin
              if (_T_561) begin
                mstatus_SPP <= _T_575;
              end
            end
          end
        end
      end else begin
        if (io_mem_wrCSROp_valid) begin
          if (_T_591) begin
            mstatus_SPP <= _T_575;
          end else begin
            if (_T_561) begin
              mstatus_SPP <= _T_575;
            end
          end
        end
      end
    end
    if (reset) begin
      mstatus_MPIE <= 1'h0;
    end else begin
      if (io_mem_excep_valid) begin
        if (_T_723) begin
          if (_T_725) begin
            mstatus_MPIE <= 1'h1;
          end else begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_591) begin
                mstatus_MPIE <= _T_574;
              end else begin
                if (_T_561) begin
                  mstatus_MPIE <= _T_574;
                end
              end
            end
          end
        end else begin
          if (_T_734) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_591) begin
                mstatus_MPIE <= _T_574;
              end else begin
                if (_T_561) begin
                  mstatus_MPIE <= _T_574;
                end
              end
            end
          end else begin
            if (_T_772) begin
              mstatus_MPIE <= mstatus_MIE;
            end else begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_591) begin
                  mstatus_MPIE <= _T_574;
                end else begin
                  if (_T_561) begin
                    mstatus_MPIE <= _T_574;
                  end
                end
              end
            end
          end
        end
      end else begin
        if (io_mem_wrCSROp_valid) begin
          if (_T_591) begin
            mstatus_MPIE <= _T_574;
          end else begin
            if (_T_561) begin
              mstatus_MPIE <= _T_574;
            end
          end
        end
      end
    end
    if (reset) begin
      mstatus_old_HPIE <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_591) begin
          mstatus_old_HPIE <= _T_573;
        end else begin
          if (_T_561) begin
            mstatus_old_HPIE <= _T_573;
          end
        end
      end
    end
    if (reset) begin
      mstatus_SPIE <= 1'h0;
    end else begin
      if (io_mem_excep_valid) begin
        if (_T_723) begin
          if (_T_725) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_591) begin
                mstatus_SPIE <= _T_572;
              end else begin
                if (_T_561) begin
                  mstatus_SPIE <= _T_572;
                end
              end
            end
          end else begin
            if (_T_727) begin
              mstatus_SPIE <= 1'h1;
            end else begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_591) begin
                  mstatus_SPIE <= _T_572;
                end else begin
                  if (_T_561) begin
                    mstatus_SPIE <= _T_572;
                  end
                end
              end
            end
          end
        end else begin
          if (_T_734) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_591) begin
                mstatus_SPIE <= _T_572;
              end else begin
                if (_T_561) begin
                  mstatus_SPIE <= _T_572;
                end
              end
            end
          end else begin
            if (_T_772) begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_591) begin
                  mstatus_SPIE <= _T_572;
                end else begin
                  if (_T_561) begin
                    mstatus_SPIE <= _T_572;
                  end
                end
              end
            end else begin
              if (_T_774) begin
                mstatus_SPIE <= mstatus_SIE;
              end else begin
                mstatus_SPIE <= _GEN_423;
              end
            end
          end
        end
      end else begin
        mstatus_SPIE <= _GEN_423;
      end
    end
    if (reset) begin
      mstatus_UPIE <= 1'h0;
    end else begin
      if (io_mem_excep_valid) begin
        if (_T_723) begin
          if (_T_725) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_591) begin
                mstatus_UPIE <= _T_571;
              end else begin
                if (_T_561) begin
                  mstatus_UPIE <= _T_571;
                end
              end
            end
          end else begin
            if (_T_727) begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_591) begin
                  mstatus_UPIE <= _T_571;
                end else begin
                  if (_T_561) begin
                    mstatus_UPIE <= _T_571;
                  end
                end
              end
            end else begin
              if (_T_730) begin
                mstatus_UPIE <= 1'h1;
              end else begin
                if (io_mem_wrCSROp_valid) begin
                  if (_T_591) begin
                    mstatus_UPIE <= _T_571;
                  end else begin
                    if (_T_561) begin
                      mstatus_UPIE <= _T_571;
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (_T_734) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_591) begin
                mstatus_UPIE <= _T_571;
              end else begin
                if (_T_561) begin
                  mstatus_UPIE <= _T_571;
                end
              end
            end
          end else begin
            if (_T_772) begin
              mstatus_UPIE <= _GEN_422;
            end else begin
              if (_T_774) begin
                mstatus_UPIE <= _GEN_422;
              end else begin
                if (_T_776) begin
                  mstatus_UPIE <= mstatus_UIE;
                end else begin
                  mstatus_UPIE <= _GEN_422;
                end
              end
            end
          end
        end
      end else begin
        mstatus_UPIE <= _GEN_422;
      end
    end
    if (reset) begin
      mstatus_MIE <= 1'h0;
    end else begin
      if (io_mem_excep_valid) begin
        if (_T_723) begin
          if (_T_725) begin
            mstatus_MIE <= mstatus_MPIE;
          end else begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_591) begin
                mstatus_MIE <= _T_570;
              end else begin
                if (_T_561) begin
                  mstatus_MIE <= _T_570;
                end
              end
            end
          end
        end else begin
          if (_T_734) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_591) begin
                mstatus_MIE <= _T_570;
              end else begin
                if (_T_561) begin
                  mstatus_MIE <= _T_570;
                end
              end
            end
          end else begin
            if (_T_772) begin
              mstatus_MIE <= 1'h0;
            end else begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_591) begin
                  mstatus_MIE <= _T_570;
                end else begin
                  if (_T_561) begin
                    mstatus_MIE <= _T_570;
                  end
                end
              end
            end
          end
        end
      end else begin
        if (io_mem_wrCSROp_valid) begin
          if (_T_591) begin
            mstatus_MIE <= _T_570;
          end else begin
            if (_T_561) begin
              mstatus_MIE <= _T_570;
            end
          end
        end
      end
    end
    if (reset) begin
      mstatus_old_HIE <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_591) begin
          mstatus_old_HIE <= _T_569;
        end else begin
          if (_T_561) begin
            mstatus_old_HIE <= _T_569;
          end
        end
      end
    end
    if (reset) begin
      mstatus_SIE <= 1'h0;
    end else begin
      if (io_mem_excep_valid) begin
        if (_T_723) begin
          if (_T_725) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_591) begin
                mstatus_SIE <= _T_568;
              end else begin
                if (_T_561) begin
                  mstatus_SIE <= _T_568;
                end
              end
            end
          end else begin
            if (_T_727) begin
              mstatus_SIE <= mstatus_SPIE;
            end else begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_591) begin
                  mstatus_SIE <= _T_568;
                end else begin
                  if (_T_561) begin
                    mstatus_SIE <= _T_568;
                  end
                end
              end
            end
          end
        end else begin
          if (_T_734) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_591) begin
                mstatus_SIE <= _T_568;
              end else begin
                if (_T_561) begin
                  mstatus_SIE <= _T_568;
                end
              end
            end
          end else begin
            if (_T_772) begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_591) begin
                  mstatus_SIE <= _T_568;
                end else begin
                  if (_T_561) begin
                    mstatus_SIE <= _T_568;
                  end
                end
              end
            end else begin
              if (_T_774) begin
                mstatus_SIE <= 1'h0;
              end else begin
                mstatus_SIE <= _GEN_419;
              end
            end
          end
        end
      end else begin
        mstatus_SIE <= _GEN_419;
      end
    end
    if (reset) begin
      mstatus_UIE <= 1'h0;
    end else begin
      if (io_mem_excep_valid) begin
        if (_T_723) begin
          if (_T_725) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_591) begin
                mstatus_UIE <= _T_567;
              end else begin
                if (_T_561) begin
                  mstatus_UIE <= _T_567;
                end
              end
            end
          end else begin
            if (_T_727) begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_591) begin
                  mstatus_UIE <= _T_567;
                end else begin
                  if (_T_561) begin
                    mstatus_UIE <= _T_567;
                  end
                end
              end
            end else begin
              if (_T_730) begin
                mstatus_UIE <= mstatus_MPIE;
              end else begin
                if (io_mem_wrCSROp_valid) begin
                  if (_T_591) begin
                    mstatus_UIE <= _T_567;
                  end else begin
                    if (_T_561) begin
                      mstatus_UIE <= _T_567;
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (_T_734) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_591) begin
                mstatus_UIE <= _T_567;
              end else begin
                if (_T_561) begin
                  mstatus_UIE <= _T_567;
                end
              end
            end
          end else begin
            if (_T_772) begin
              mstatus_UIE <= _GEN_418;
            end else begin
              if (_T_774) begin
                mstatus_UIE <= _GEN_418;
              end else begin
                if (_T_776) begin
                  mstatus_UIE <= 1'h0;
                end else begin
                  mstatus_UIE <= _GEN_418;
                end
              end
            end
          end
        end
      end else begin
        mstatus_UIE <= _GEN_418;
      end
    end
    if (reset) begin
      mtime <= 64'h0;
    end else begin
      mtime <= _T_144;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_786 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",12'hf11,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1361.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_786 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1366.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_788 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",12'hf12,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1376.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_788 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1381.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_790 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",12'hf13,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1391.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_790 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1396.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_792 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",12'hf14,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1406.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_792 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1411.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_794 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",10'h300,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1421.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_794 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1426.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_796 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",10'h301,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1436.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_796 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1441.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_798 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",10'h302,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1451.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_798 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1456.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_800 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",10'h303,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1466.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_800 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1471.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_802 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",10'h304,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1481.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_802 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1486.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_804 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",10'h305,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1496.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_804 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1501.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_806 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",10'h306,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1511.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_806 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1516.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_808 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",10'h340,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1526.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_808 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1531.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_810 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",10'h341,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1541.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_810 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1546.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_812 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",10'h342,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1556.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_812 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1561.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_814 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",10'h343,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1571.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_814 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1576.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_816 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",10'h344,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1586.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_816 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1591.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_818 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",9'h100,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1601.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_818 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1606.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_820 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",9'h102,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1616.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_820 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1621.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_822 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",9'h103,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1631.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_822 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1636.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_824 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",9'h104,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1646.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_824 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1651.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_826 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",9'h105,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1661.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_826 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1666.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_828 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",9'h106,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1676.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_828 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1681.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_830 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",9'h140,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1691.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_830 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1696.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_832 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",9'h141,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1706.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_832 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1711.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_834 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",9'h142,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1721.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_834 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1726.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_836 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",9'h143,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1736.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_836 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1741.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_838 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",9'h144,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1751.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_838 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1756.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_840 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",9'h180,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1766.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_840 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1771.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_842 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",3'h5,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1781.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_842 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1786.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_844 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",7'h40,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1796.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_844 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1801.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_846 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",7'h41,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1811.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_846 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1816.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_848 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",7'h42,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1826.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_848 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1831.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_850 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",7'h43,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1841.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_850 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1846.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_852 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",7'h44,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1856.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_852 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1861.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_854 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",10'h321,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1871.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_854 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1876.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_856 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",12'hc01,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1886.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_856 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1891.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_858 & _T_264) begin
          $fwrite(32'h80000002,"set csr[%x] = 0x%x\n",12'hc00,io_mem_wrCSROp_csr_data); // @[CSR.scala 126:15:@1901.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_858 & _T_264) begin
          $fwrite(32'h80000002,"mtime %x \n",mtime); // @[CSR.scala 127:15:@1906.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module CPU( // @[:@2284.2]
  input         clock, // @[:@2285.4]
  input         reset, // @[:@2286.4]
  input         io_en, // @[:@2287.4]
  output [63:0] io_debug_pc, // @[:@2287.4]
  output [31:0] io_debug_ins, // @[:@2287.4]
  output [3:0]  io_mem_mode, // @[:@2287.4]
  input         io_mem_ready, // @[:@2287.4]
  output [63:0] io_mem_addr, // @[:@2287.4]
  input  [63:0] io_mem_rdata, // @[:@2287.4]
  output [63:0] io_mem_wdata, // @[:@2287.4]
  output [3:0]  io_serial_mode, // @[:@2287.4]
  input         io_serial_ready, // @[:@2287.4]
  output [63:0] io_serial_addr, // @[:@2287.4]
  input  [63:0] io_serial_rdata, // @[:@2287.4]
  output [63:0] io_serial_wdata // @[:@2287.4]
);
  wire  insr_io_jump; // @[cpu.scala 15:22:@2289.4]
  wire [63:0] insr_io_jdest; // @[cpu.scala 15:22:@2289.4]
  wire  insr_io_nls; // @[cpu.scala 15:22:@2289.4]
  wire [63:0] insr_io_lpc; // @[cpu.scala 15:22:@2289.4]
  wire [63:0] insr_io_insp; // @[cpu.scala 15:22:@2289.4]
  wire [63:0] insr_io_inspd; // @[cpu.scala 15:22:@2289.4]
  wire  insr_io_bubble; // @[cpu.scala 15:22:@2289.4]
  wire [31:0] insr_io_ins; // @[cpu.scala 15:22:@2289.4]
  wire [63:0] insr_io_pc; // @[cpu.scala 15:22:@2289.4]
  wire [63:0] insr_io_insn; // @[cpu.scala 15:22:@2289.4]
  wire [63:0] insr_io_insnd; // @[cpu.scala 15:22:@2289.4]
  wire [3:0] insr_io_mmu_mode; // @[cpu.scala 15:22:@2289.4]
  wire  insr_io_mmu_ready; // @[cpu.scala 15:22:@2289.4]
  wire [63:0] insr_io_mmu_addr; // @[cpu.scala 15:22:@2289.4]
  wire [63:0] insr_io_mmu_rdata; // @[cpu.scala 15:22:@2289.4]
  wire [31:0] insr_io_excep_pc; // @[cpu.scala 15:22:@2289.4]
  wire [31:0] insd_io_ins; // @[cpu.scala 16:22:@2292.4]
  wire  insd_io_lastload_valid; // @[cpu.scala 16:22:@2292.4]
  wire [4:0] insd_io_lastload_index; // @[cpu.scala 16:22:@2292.4]
  wire  insd_io_loadinfo_valid; // @[cpu.scala 16:22:@2292.4]
  wire [4:0] insd_io_loadinfo_index; // @[cpu.scala 16:22:@2292.4]
  wire [63:0] insd_io_imm; // @[cpu.scala 16:22:@2292.4]
  wire [3:0] insd_io_ALUOp; // @[cpu.scala 16:22:@2292.4]
  wire [3:0] insd_io_exe_type; // @[cpu.scala 16:22:@2292.4]
  wire [3:0] insd_io_ls_mode; // @[cpu.scala 16:22:@2292.4]
  wire  insd_io_op32; // @[cpu.scala 16:22:@2292.4]
  wire  insd_io_bubble; // @[cpu.scala 16:22:@2292.4]
  wire [4:0] insd_io_regr_r1; // @[cpu.scala 16:22:@2292.4]
  wire [4:0] insd_io_regr_r2; // @[cpu.scala 16:22:@2292.4]
  wire [63:0] insd_io_regr_r1d; // @[cpu.scala 16:22:@2292.4]
  wire [63:0] insd_io_regr_r2d; // @[cpu.scala 16:22:@2292.4]
  wire  insd_io_dreg_rs2_valid; // @[cpu.scala 16:22:@2292.4]
  wire [63:0] insd_io_dreg_rs1_value; // @[cpu.scala 16:22:@2292.4]
  wire [63:0] insd_io_dreg_rs2_value; // @[cpu.scala 16:22:@2292.4]
  wire  insd_io_dreg_rd_valid; // @[cpu.scala 16:22:@2292.4]
  wire [4:0] insd_io_dreg_rd_index; // @[cpu.scala 16:22:@2292.4]
  wire [11:0] insd_io_csr_addr; // @[cpu.scala 16:22:@2292.4]
  wire [63:0] insd_io_csr_rdata; // @[cpu.scala 16:22:@2292.4]
  wire [1:0] insd_io_csr_priv; // @[cpu.scala 16:22:@2292.4]
  wire  insd_io_csr_content_valid; // @[cpu.scala 16:22:@2292.4]
  wire [11:0] insd_io_csr_content_csr_idx; // @[cpu.scala 16:22:@2292.4]
  wire [63:0] insd_io_csr_content_csr_data; // @[cpu.scala 16:22:@2292.4]
  wire  insd_io_csr_from_ex_valid; // @[cpu.scala 16:22:@2292.4]
  wire [11:0] insd_io_csr_from_ex_csr_idx; // @[cpu.scala 16:22:@2292.4]
  wire [63:0] insd_io_csr_from_ex_csr_data; // @[cpu.scala 16:22:@2292.4]
  wire  insd_io_csr_from_mem_valid; // @[cpu.scala 16:22:@2292.4]
  wire [11:0] insd_io_csr_from_mem_csr_idx; // @[cpu.scala 16:22:@2292.4]
  wire [63:0] insd_io_csr_from_mem_csr_data; // @[cpu.scala 16:22:@2292.4]
  wire  insd_io_exWrReg_wbrv; // @[cpu.scala 16:22:@2292.4]
  wire [4:0] insd_io_exWrReg_wbri; // @[cpu.scala 16:22:@2292.4]
  wire [63:0] insd_io_exWrReg_wbrd; // @[cpu.scala 16:22:@2292.4]
  wire  insd_io_memWrReg_wbrv; // @[cpu.scala 16:22:@2292.4]
  wire [4:0] insd_io_memWrReg_wbri; // @[cpu.scala 16:22:@2292.4]
  wire [63:0] insd_io_memWrReg_wbrd; // @[cpu.scala 16:22:@2292.4]
  wire [31:0] insd_io_if_excep_pc; // @[cpu.scala 16:22:@2292.4]
  wire  insd_io_ex_excep_valid; // @[cpu.scala 16:22:@2292.4]
  wire [31:0] insd_io_ex_excep_code; // @[cpu.scala 16:22:@2292.4]
  wire [31:0] insd_io_ex_excep_value; // @[cpu.scala 16:22:@2292.4]
  wire [31:0] insd_io_ex_excep_pc; // @[cpu.scala 16:22:@2292.4]
  wire [63:0] exec_io_imm; // @[cpu.scala 17:22:@2295.4]
  wire [3:0] exec_io_ALUOp; // @[cpu.scala 17:22:@2295.4]
  wire [63:0] exec_io_pc; // @[cpu.scala 17:22:@2295.4]
  wire [3:0] exec_io_exe_type; // @[cpu.scala 17:22:@2295.4]
  wire  exec_io_op32; // @[cpu.scala 17:22:@2295.4]
  wire  exec_io_dreg_rs2_valid; // @[cpu.scala 17:22:@2295.4]
  wire [63:0] exec_io_dreg_rs1_value; // @[cpu.scala 17:22:@2295.4]
  wire [63:0] exec_io_dreg_rs2_value; // @[cpu.scala 17:22:@2295.4]
  wire  exec_io_dreg_rd_valid; // @[cpu.scala 17:22:@2295.4]
  wire [4:0] exec_io_dreg_rd_index; // @[cpu.scala 17:22:@2295.4]
  wire  exec_io_nls; // @[cpu.scala 17:22:@2295.4]
  wire [63:0] exec_io_addr; // @[cpu.scala 17:22:@2295.4]
  wire [63:0] exec_io_data; // @[cpu.scala 17:22:@2295.4]
  wire  exec_io_jump; // @[cpu.scala 17:22:@2295.4]
  wire [63:0] exec_io_jdest; // @[cpu.scala 17:22:@2295.4]
  wire  exec_io_wreg_wbrv; // @[cpu.scala 17:22:@2295.4]
  wire [4:0] exec_io_wreg_wbri; // @[cpu.scala 17:22:@2295.4]
  wire [63:0] exec_io_wreg_wbrd; // @[cpu.scala 17:22:@2295.4]
  wire  exec_io_wcsr_valid; // @[cpu.scala 17:22:@2295.4]
  wire [11:0] exec_io_wcsr_csr_idx; // @[cpu.scala 17:22:@2295.4]
  wire [63:0] exec_io_wcsr_csr_data; // @[cpu.scala 17:22:@2295.4]
  wire  exec_io_csr_op_valid; // @[cpu.scala 17:22:@2295.4]
  wire [11:0] exec_io_csr_op_csr_idx; // @[cpu.scala 17:22:@2295.4]
  wire [63:0] exec_io_csr_op_csr_data; // @[cpu.scala 17:22:@2295.4]
  wire  exec_io_id_excep_valid; // @[cpu.scala 17:22:@2295.4]
  wire [31:0] exec_io_id_excep_code; // @[cpu.scala 17:22:@2295.4]
  wire [31:0] exec_io_id_excep_value; // @[cpu.scala 17:22:@2295.4]
  wire [31:0] exec_io_id_excep_pc; // @[cpu.scala 17:22:@2295.4]
  wire  exec_io_mem_excep_valid; // @[cpu.scala 17:22:@2295.4]
  wire [31:0] exec_io_mem_excep_code; // @[cpu.scala 17:22:@2295.4]
  wire [31:0] exec_io_mem_excep_value; // @[cpu.scala 17:22:@2295.4]
  wire [31:0] exec_io_mem_excep_pc; // @[cpu.scala 17:22:@2295.4]
  wire  memc_io_nls; // @[cpu.scala 18:22:@2298.4]
  wire [3:0] memc_io_lsm; // @[cpu.scala 18:22:@2298.4]
  wire [63:0] memc_io_addr; // @[cpu.scala 18:22:@2298.4]
  wire [63:0] memc_io_data; // @[cpu.scala 18:22:@2298.4]
  wire  memc_io_ready; // @[cpu.scala 18:22:@2298.4]
  wire  memc_io_ereg_wbrv; // @[cpu.scala 18:22:@2298.4]
  wire [4:0] memc_io_ereg_wbri; // @[cpu.scala 18:22:@2298.4]
  wire [63:0] memc_io_ereg_wbrd; // @[cpu.scala 18:22:@2298.4]
  wire  memc_io_wreg_wbrv; // @[cpu.scala 18:22:@2298.4]
  wire [4:0] memc_io_wreg_wbri; // @[cpu.scala 18:22:@2298.4]
  wire [63:0] memc_io_wreg_wbrd; // @[cpu.scala 18:22:@2298.4]
  wire [3:0] memc_io_mem_mode; // @[cpu.scala 18:22:@2298.4]
  wire  memc_io_mem_ready; // @[cpu.scala 18:22:@2298.4]
  wire [63:0] memc_io_mem_addr; // @[cpu.scala 18:22:@2298.4]
  wire [63:0] memc_io_mem_rdata; // @[cpu.scala 18:22:@2298.4]
  wire [63:0] memc_io_mem_wdata; // @[cpu.scala 18:22:@2298.4]
  wire  memc_io_excep_valid; // @[cpu.scala 18:22:@2298.4]
  wire [31:0] memc_io_excep_code; // @[cpu.scala 18:22:@2298.4]
  wire [31:0] memc_io_excep_value; // @[cpu.scala 18:22:@2298.4]
  wire [31:0] memc_io_excep_pc; // @[cpu.scala 18:22:@2298.4]
  wire  memc_io_csr_wb_valid; // @[cpu.scala 18:22:@2298.4]
  wire [11:0] memc_io_csr_wb_csr_idx; // @[cpu.scala 18:22:@2298.4]
  wire [63:0] memc_io_csr_wb_csr_data; // @[cpu.scala 18:22:@2298.4]
  wire  memc_io_csr_wrCSROp_valid; // @[cpu.scala 18:22:@2298.4]
  wire [11:0] memc_io_csr_wrCSROp_csr_idx; // @[cpu.scala 18:22:@2298.4]
  wire [63:0] memc_io_csr_wrCSROp_csr_data; // @[cpu.scala 18:22:@2298.4]
  wire  memc_io_csr_excep_valid; // @[cpu.scala 18:22:@2298.4]
  wire [31:0] memc_io_csr_excep_code; // @[cpu.scala 18:22:@2298.4]
  wire [31:0] memc_io_csr_excep_value; // @[cpu.scala 18:22:@2298.4]
  wire [31:0] memc_io_csr_excep_pc; // @[cpu.scala 18:22:@2298.4]
  wire  memc_io_inter_valid; // @[cpu.scala 18:22:@2298.4]
  wire [31:0] memc_io_inter_bits; // @[cpu.scala 18:22:@2298.4]
  wire  wrbk_io_wreg_wbrv; // @[cpu.scala 19:22:@2301.4]
  wire [4:0] wrbk_io_wreg_wbri; // @[cpu.scala 19:22:@2301.4]
  wire [63:0] wrbk_io_wreg_wbrd; // @[cpu.scala 19:22:@2301.4]
  wire  wrbk_io_reg_wen; // @[cpu.scala 19:22:@2301.4]
  wire [4:0] wrbk_io_reg_w; // @[cpu.scala 19:22:@2301.4]
  wire [63:0] wrbk_io_reg_wd; // @[cpu.scala 19:22:@2301.4]
  wire  regc_clock; // @[cpu.scala 20:22:@2304.4]
  wire  regc_reset; // @[cpu.scala 20:22:@2304.4]
  wire [4:0] regc_io_r_r1; // @[cpu.scala 20:22:@2304.4]
  wire [4:0] regc_io_r_r2; // @[cpu.scala 20:22:@2304.4]
  wire [63:0] regc_io_r_r1d; // @[cpu.scala 20:22:@2304.4]
  wire [63:0] regc_io_r_r2d; // @[cpu.scala 20:22:@2304.4]
  wire  regc_io_w_wen; // @[cpu.scala 20:22:@2304.4]
  wire [4:0] regc_io_w_w; // @[cpu.scala 20:22:@2304.4]
  wire [63:0] regc_io_w_wd; // @[cpu.scala 20:22:@2304.4]
  wire  regc_io_pass; // @[cpu.scala 20:22:@2304.4]
  wire  mmu_clock; // @[cpu.scala 21:22:@2307.4]
  wire  mmu_reset; // @[cpu.scala 21:22:@2307.4]
  wire [3:0] mmu_io_insr_mode; // @[cpu.scala 21:22:@2307.4]
  wire  mmu_io_insr_ready; // @[cpu.scala 21:22:@2307.4]
  wire [63:0] mmu_io_insr_addr; // @[cpu.scala 21:22:@2307.4]
  wire [63:0] mmu_io_insr_rdata; // @[cpu.scala 21:22:@2307.4]
  wire [3:0] mmu_io_mem_mode; // @[cpu.scala 21:22:@2307.4]
  wire  mmu_io_mem_ready; // @[cpu.scala 21:22:@2307.4]
  wire [63:0] mmu_io_mem_addr; // @[cpu.scala 21:22:@2307.4]
  wire [63:0] mmu_io_mem_rdata; // @[cpu.scala 21:22:@2307.4]
  wire [63:0] mmu_io_mem_wdata; // @[cpu.scala 21:22:@2307.4]
  wire [3:0] mmu_io_if_iom_mode; // @[cpu.scala 21:22:@2307.4]
  wire  mmu_io_if_iom_ready; // @[cpu.scala 21:22:@2307.4]
  wire [63:0] mmu_io_if_iom_addr; // @[cpu.scala 21:22:@2307.4]
  wire [63:0] mmu_io_if_iom_rdata; // @[cpu.scala 21:22:@2307.4]
  wire [3:0] mmu_io_mem_iom_mode; // @[cpu.scala 21:22:@2307.4]
  wire  mmu_io_mem_iom_ready; // @[cpu.scala 21:22:@2307.4]
  wire [63:0] mmu_io_mem_iom_addr; // @[cpu.scala 21:22:@2307.4]
  wire [63:0] mmu_io_mem_iom_rdata; // @[cpu.scala 21:22:@2307.4]
  wire [63:0] mmu_io_mem_iom_wdata; // @[cpu.scala 21:22:@2307.4]
  wire  iomn_clock; // @[cpu.scala 22:22:@2310.4]
  wire  iomn_reset; // @[cpu.scala 22:22:@2310.4]
  wire [3:0] iomn_io_mem_if_mode; // @[cpu.scala 22:22:@2310.4]
  wire  iomn_io_mem_if_ready; // @[cpu.scala 22:22:@2310.4]
  wire [63:0] iomn_io_mem_if_addr; // @[cpu.scala 22:22:@2310.4]
  wire [63:0] iomn_io_mem_if_rdata; // @[cpu.scala 22:22:@2310.4]
  wire [3:0] iomn_io_mem_mem_mode; // @[cpu.scala 22:22:@2310.4]
  wire  iomn_io_mem_mem_ready; // @[cpu.scala 22:22:@2310.4]
  wire [63:0] iomn_io_mem_mem_addr; // @[cpu.scala 22:22:@2310.4]
  wire [63:0] iomn_io_mem_mem_rdata; // @[cpu.scala 22:22:@2310.4]
  wire [63:0] iomn_io_mem_mem_wdata; // @[cpu.scala 22:22:@2310.4]
  wire [3:0] iomn_io_mem_out_mode; // @[cpu.scala 22:22:@2310.4]
  wire  iomn_io_mem_out_ready; // @[cpu.scala 22:22:@2310.4]
  wire [63:0] iomn_io_mem_out_addr; // @[cpu.scala 22:22:@2310.4]
  wire [63:0] iomn_io_mem_out_rdata; // @[cpu.scala 22:22:@2310.4]
  wire [63:0] iomn_io_mem_out_wdata; // @[cpu.scala 22:22:@2310.4]
  wire [3:0] iomn_io_serial_out_mode; // @[cpu.scala 22:22:@2310.4]
  wire  iomn_io_serial_out_ready; // @[cpu.scala 22:22:@2310.4]
  wire [63:0] iomn_io_serial_out_addr; // @[cpu.scala 22:22:@2310.4]
  wire [63:0] iomn_io_serial_out_rdata; // @[cpu.scala 22:22:@2310.4]
  wire [63:0] iomn_io_serial_out_wdata; // @[cpu.scala 22:22:@2310.4]
  wire  if_id_clock; // @[cpu.scala 23:24:@2313.4]
  wire  if_id_reset; // @[cpu.scala 23:24:@2313.4]
  wire  if_id_io_en; // @[cpu.scala 23:24:@2313.4]
  wire  if_id_io_pass; // @[cpu.scala 23:24:@2313.4]
  wire [31:0] if_id_io_insi; // @[cpu.scala 23:24:@2313.4]
  wire [63:0] if_id_io_pci; // @[cpu.scala 23:24:@2313.4]
  wire [63:0] if_id_io_insci; // @[cpu.scala 23:24:@2313.4]
  wire [63:0] if_id_io_icdi; // @[cpu.scala 23:24:@2313.4]
  wire  if_id_io_lastloadin_valid; // @[cpu.scala 23:24:@2313.4]
  wire [4:0] if_id_io_lastloadin_index; // @[cpu.scala 23:24:@2313.4]
  wire [31:0] if_id_io_excep_i_pc; // @[cpu.scala 23:24:@2313.4]
  wire [31:0] if_id_io_inso; // @[cpu.scala 23:24:@2313.4]
  wire [63:0] if_id_io_pco; // @[cpu.scala 23:24:@2313.4]
  wire [63:0] if_id_io_insco; // @[cpu.scala 23:24:@2313.4]
  wire [63:0] if_id_io_icdo; // @[cpu.scala 23:24:@2313.4]
  wire  if_id_io_lastloadout_valid; // @[cpu.scala 23:24:@2313.4]
  wire [4:0] if_id_io_lastloadout_index; // @[cpu.scala 23:24:@2313.4]
  wire [31:0] if_id_io_excep_o_pc; // @[cpu.scala 23:24:@2313.4]
  wire  id_ex_clock; // @[cpu.scala 24:24:@2316.4]
  wire  id_ex_reset; // @[cpu.scala 24:24:@2316.4]
  wire  id_ex_io_en; // @[cpu.scala 24:24:@2316.4]
  wire  id_ex_io_bid; // @[cpu.scala 24:24:@2316.4]
  wire  id_ex_io_bex; // @[cpu.scala 24:24:@2316.4]
  wire  id_ex_io_flush; // @[cpu.scala 24:24:@2316.4]
  wire  id_ex_io_pass; // @[cpu.scala 24:24:@2316.4]
  wire [63:0] id_ex_io_immi; // @[cpu.scala 24:24:@2316.4]
  wire [3:0] id_ex_io_ALUOpi; // @[cpu.scala 24:24:@2316.4]
  wire [3:0] id_ex_io_exeti; // @[cpu.scala 24:24:@2316.4]
  wire [63:0] id_ex_io_pci; // @[cpu.scala 24:24:@2316.4]
  wire [3:0] id_ex_io_lsmi; // @[cpu.scala 24:24:@2316.4]
  wire  id_ex_io_op32i; // @[cpu.scala 24:24:@2316.4]
  wire  id_ex_io_csr_wb_i_valid; // @[cpu.scala 24:24:@2316.4]
  wire [11:0] id_ex_io_csr_wb_i_csr_idx; // @[cpu.scala 24:24:@2316.4]
  wire [63:0] id_ex_io_csr_wb_i_csr_data; // @[cpu.scala 24:24:@2316.4]
  wire  id_ex_io_dregi_rs2_valid; // @[cpu.scala 24:24:@2316.4]
  wire [63:0] id_ex_io_dregi_rs1_value; // @[cpu.scala 24:24:@2316.4]
  wire [63:0] id_ex_io_dregi_rs2_value; // @[cpu.scala 24:24:@2316.4]
  wire  id_ex_io_dregi_rd_valid; // @[cpu.scala 24:24:@2316.4]
  wire [4:0] id_ex_io_dregi_rd_index; // @[cpu.scala 24:24:@2316.4]
  wire  id_ex_io_excep_i_valid; // @[cpu.scala 24:24:@2316.4]
  wire [31:0] id_ex_io_excep_i_code; // @[cpu.scala 24:24:@2316.4]
  wire [31:0] id_ex_io_excep_i_value; // @[cpu.scala 24:24:@2316.4]
  wire [31:0] id_ex_io_excep_i_pc; // @[cpu.scala 24:24:@2316.4]
  wire [63:0] id_ex_io_immo; // @[cpu.scala 24:24:@2316.4]
  wire [3:0] id_ex_io_ALUOpo; // @[cpu.scala 24:24:@2316.4]
  wire [3:0] id_ex_io_exeto; // @[cpu.scala 24:24:@2316.4]
  wire [63:0] id_ex_io_pco; // @[cpu.scala 24:24:@2316.4]
  wire [3:0] id_ex_io_lsmo; // @[cpu.scala 24:24:@2316.4]
  wire  id_ex_io_op32o; // @[cpu.scala 24:24:@2316.4]
  wire  id_ex_io_csr_wb_o_valid; // @[cpu.scala 24:24:@2316.4]
  wire [11:0] id_ex_io_csr_wb_o_csr_idx; // @[cpu.scala 24:24:@2316.4]
  wire [63:0] id_ex_io_csr_wb_o_csr_data; // @[cpu.scala 24:24:@2316.4]
  wire  id_ex_io_drego_rs2_valid; // @[cpu.scala 24:24:@2316.4]
  wire [63:0] id_ex_io_drego_rs1_value; // @[cpu.scala 24:24:@2316.4]
  wire [63:0] id_ex_io_drego_rs2_value; // @[cpu.scala 24:24:@2316.4]
  wire  id_ex_io_drego_rd_valid; // @[cpu.scala 24:24:@2316.4]
  wire [4:0] id_ex_io_drego_rd_index; // @[cpu.scala 24:24:@2316.4]
  wire  id_ex_io_excep_o_valid; // @[cpu.scala 24:24:@2316.4]
  wire [31:0] id_ex_io_excep_o_code; // @[cpu.scala 24:24:@2316.4]
  wire [31:0] id_ex_io_excep_o_value; // @[cpu.scala 24:24:@2316.4]
  wire [31:0] id_ex_io_excep_o_pc; // @[cpu.scala 24:24:@2316.4]
  wire  ex_mem_clock; // @[cpu.scala 25:24:@2319.4]
  wire  ex_mem_reset; // @[cpu.scala 25:24:@2319.4]
  wire  ex_mem_io_en; // @[cpu.scala 25:24:@2319.4]
  wire  ex_mem_io_pass; // @[cpu.scala 25:24:@2319.4]
  wire  ex_mem_io_nlsi; // @[cpu.scala 25:24:@2319.4]
  wire [3:0] ex_mem_io_lsmi; // @[cpu.scala 25:24:@2319.4]
  wire [63:0] ex_mem_io_addri; // @[cpu.scala 25:24:@2319.4]
  wire [63:0] ex_mem_io_datai; // @[cpu.scala 25:24:@2319.4]
  wire  ex_mem_io_wregi_wbrv; // @[cpu.scala 25:24:@2319.4]
  wire [4:0] ex_mem_io_wregi_wbri; // @[cpu.scala 25:24:@2319.4]
  wire [63:0] ex_mem_io_wregi_wbrd; // @[cpu.scala 25:24:@2319.4]
  wire  ex_mem_io_csr_wb_i_valid; // @[cpu.scala 25:24:@2319.4]
  wire [11:0] ex_mem_io_csr_wb_i_csr_idx; // @[cpu.scala 25:24:@2319.4]
  wire [63:0] ex_mem_io_csr_wb_i_csr_data; // @[cpu.scala 25:24:@2319.4]
  wire  ex_mem_io_excep_i_valid; // @[cpu.scala 25:24:@2319.4]
  wire [31:0] ex_mem_io_excep_i_code; // @[cpu.scala 25:24:@2319.4]
  wire [31:0] ex_mem_io_excep_i_value; // @[cpu.scala 25:24:@2319.4]
  wire [31:0] ex_mem_io_excep_i_pc; // @[cpu.scala 25:24:@2319.4]
  wire  ex_mem_io_inter_i_valid; // @[cpu.scala 25:24:@2319.4]
  wire [31:0] ex_mem_io_inter_i_bits; // @[cpu.scala 25:24:@2319.4]
  wire  ex_mem_io_nlso; // @[cpu.scala 25:24:@2319.4]
  wire [3:0] ex_mem_io_lsmo; // @[cpu.scala 25:24:@2319.4]
  wire [63:0] ex_mem_io_addro; // @[cpu.scala 25:24:@2319.4]
  wire [63:0] ex_mem_io_datao; // @[cpu.scala 25:24:@2319.4]
  wire  ex_mem_io_wrego_wbrv; // @[cpu.scala 25:24:@2319.4]
  wire [4:0] ex_mem_io_wrego_wbri; // @[cpu.scala 25:24:@2319.4]
  wire [63:0] ex_mem_io_wrego_wbrd; // @[cpu.scala 25:24:@2319.4]
  wire  ex_mem_io_csr_wb_o_valid; // @[cpu.scala 25:24:@2319.4]
  wire [11:0] ex_mem_io_csr_wb_o_csr_idx; // @[cpu.scala 25:24:@2319.4]
  wire [63:0] ex_mem_io_csr_wb_o_csr_data; // @[cpu.scala 25:24:@2319.4]
  wire  ex_mem_io_excep_o_valid; // @[cpu.scala 25:24:@2319.4]
  wire [31:0] ex_mem_io_excep_o_code; // @[cpu.scala 25:24:@2319.4]
  wire [31:0] ex_mem_io_excep_o_value; // @[cpu.scala 25:24:@2319.4]
  wire [31:0] ex_mem_io_excep_o_pc; // @[cpu.scala 25:24:@2319.4]
  wire  ex_mem_io_inter_o_valid; // @[cpu.scala 25:24:@2319.4]
  wire [31:0] ex_mem_io_inter_o_bits; // @[cpu.scala 25:24:@2319.4]
  wire  mem_wb_clock; // @[cpu.scala 26:24:@2322.4]
  wire  mem_wb_reset; // @[cpu.scala 26:24:@2322.4]
  wire  mem_wb_io_en; // @[cpu.scala 26:24:@2322.4]
  wire  mem_wb_io_pass; // @[cpu.scala 26:24:@2322.4]
  wire  mem_wb_io_wregi_wbrv; // @[cpu.scala 26:24:@2322.4]
  wire [4:0] mem_wb_io_wregi_wbri; // @[cpu.scala 26:24:@2322.4]
  wire [63:0] mem_wb_io_wregi_wbrd; // @[cpu.scala 26:24:@2322.4]
  wire  mem_wb_io_wrego_wbrv; // @[cpu.scala 26:24:@2322.4]
  wire [4:0] mem_wb_io_wrego_wbri; // @[cpu.scala 26:24:@2322.4]
  wire [63:0] mem_wb_io_wrego_wbrd; // @[cpu.scala 26:24:@2322.4]
  wire  csr_clock; // @[cpu.scala 27:24:@2325.4]
  wire  csr_reset; // @[cpu.scala 27:24:@2325.4]
  wire [11:0] csr_io_id_addr; // @[cpu.scala 27:24:@2325.4]
  wire [63:0] csr_io_id_rdata; // @[cpu.scala 27:24:@2325.4]
  wire [1:0] csr_io_id_priv; // @[cpu.scala 27:24:@2325.4]
  wire  csr_io_mem_wrCSROp_valid; // @[cpu.scala 27:24:@2325.4]
  wire [11:0] csr_io_mem_wrCSROp_csr_idx; // @[cpu.scala 27:24:@2325.4]
  wire [63:0] csr_io_mem_wrCSROp_csr_data; // @[cpu.scala 27:24:@2325.4]
  wire  csr_io_mem_excep_valid; // @[cpu.scala 27:24:@2325.4]
  wire [31:0] csr_io_mem_excep_code; // @[cpu.scala 27:24:@2325.4]
  wire [31:0] csr_io_mem_excep_value; // @[cpu.scala 27:24:@2325.4]
  wire [31:0] csr_io_mem_excep_pc; // @[cpu.scala 27:24:@2325.4]
  wire  csr_io_flush; // @[cpu.scala 27:24:@2325.4]
  wire  csr_io_inter_valid; // @[cpu.scala 27:24:@2325.4]
  wire [31:0] csr_io_inter_bits; // @[cpu.scala 27:24:@2325.4]
  InsReader insr ( // @[cpu.scala 15:22:@2289.4]
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
    .io_mmu_rdata(insr_io_mmu_rdata),
    .io_excep_pc(insr_io_excep_pc)
  );
  Decoder insd ( // @[cpu.scala 16:22:@2292.4]
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
    .io_csr_priv(insd_io_csr_priv),
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
    .io_memWrReg_wbrd(insd_io_memWrReg_wbrd),
    .io_if_excep_pc(insd_io_if_excep_pc),
    .io_ex_excep_valid(insd_io_ex_excep_valid),
    .io_ex_excep_code(insd_io_ex_excep_code),
    .io_ex_excep_value(insd_io_ex_excep_value),
    .io_ex_excep_pc(insd_io_ex_excep_pc)
  );
  Execute exec ( // @[cpu.scala 17:22:@2295.4]
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
    .io_csr_op_csr_data(exec_io_csr_op_csr_data),
    .io_id_excep_valid(exec_io_id_excep_valid),
    .io_id_excep_code(exec_io_id_excep_code),
    .io_id_excep_value(exec_io_id_excep_value),
    .io_id_excep_pc(exec_io_id_excep_pc),
    .io_mem_excep_valid(exec_io_mem_excep_valid),
    .io_mem_excep_code(exec_io_mem_excep_code),
    .io_mem_excep_value(exec_io_mem_excep_value),
    .io_mem_excep_pc(exec_io_mem_excep_pc)
  );
  MemoryCtrl memc ( // @[cpu.scala 18:22:@2298.4]
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
    .io_mem_wdata(memc_io_mem_wdata),
    .io_excep_valid(memc_io_excep_valid),
    .io_excep_code(memc_io_excep_code),
    .io_excep_value(memc_io_excep_value),
    .io_excep_pc(memc_io_excep_pc),
    .io_csr_wb_valid(memc_io_csr_wb_valid),
    .io_csr_wb_csr_idx(memc_io_csr_wb_csr_idx),
    .io_csr_wb_csr_data(memc_io_csr_wb_csr_data),
    .io_csr_wrCSROp_valid(memc_io_csr_wrCSROp_valid),
    .io_csr_wrCSROp_csr_idx(memc_io_csr_wrCSROp_csr_idx),
    .io_csr_wrCSROp_csr_data(memc_io_csr_wrCSROp_csr_data),
    .io_csr_excep_valid(memc_io_csr_excep_valid),
    .io_csr_excep_code(memc_io_csr_excep_code),
    .io_csr_excep_value(memc_io_csr_excep_value),
    .io_csr_excep_pc(memc_io_csr_excep_pc),
    .io_inter_valid(memc_io_inter_valid),
    .io_inter_bits(memc_io_inter_bits)
  );
  WriteBack wrbk ( // @[cpu.scala 19:22:@2301.4]
    .io_wreg_wbrv(wrbk_io_wreg_wbrv),
    .io_wreg_wbri(wrbk_io_wreg_wbri),
    .io_wreg_wbrd(wrbk_io_wreg_wbrd),
    .io_reg_wen(wrbk_io_reg_wen),
    .io_reg_w(wrbk_io_reg_w),
    .io_reg_wd(wrbk_io_reg_wd)
  );
  RegCtrl regc ( // @[cpu.scala 20:22:@2304.4]
    .clock(regc_clock),
    .reset(regc_reset),
    .io_r_r1(regc_io_r_r1),
    .io_r_r2(regc_io_r_r2),
    .io_r_r1d(regc_io_r_r1d),
    .io_r_r2d(regc_io_r_r2d),
    .io_w_wen(regc_io_w_wen),
    .io_w_w(regc_io_w_w),
    .io_w_wd(regc_io_w_wd),
    .io_pass(regc_io_pass)
  );
  MMU mmu ( // @[cpu.scala 21:22:@2307.4]
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
  IOManager iomn ( // @[cpu.scala 22:22:@2310.4]
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
  IF_ID if_id ( // @[cpu.scala 23:24:@2313.4]
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
    .io_excep_i_pc(if_id_io_excep_i_pc),
    .io_inso(if_id_io_inso),
    .io_pco(if_id_io_pco),
    .io_insco(if_id_io_insco),
    .io_icdo(if_id_io_icdo),
    .io_lastloadout_valid(if_id_io_lastloadout_valid),
    .io_lastloadout_index(if_id_io_lastloadout_index),
    .io_excep_o_pc(if_id_io_excep_o_pc)
  );
  ID_EX id_ex ( // @[cpu.scala 24:24:@2316.4]
    .clock(id_ex_clock),
    .reset(id_ex_reset),
    .io_en(id_ex_io_en),
    .io_bid(id_ex_io_bid),
    .io_bex(id_ex_io_bex),
    .io_flush(id_ex_io_flush),
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
    .io_excep_i_valid(id_ex_io_excep_i_valid),
    .io_excep_i_code(id_ex_io_excep_i_code),
    .io_excep_i_value(id_ex_io_excep_i_value),
    .io_excep_i_pc(id_ex_io_excep_i_pc),
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
    .io_drego_rd_index(id_ex_io_drego_rd_index),
    .io_excep_o_valid(id_ex_io_excep_o_valid),
    .io_excep_o_code(id_ex_io_excep_o_code),
    .io_excep_o_value(id_ex_io_excep_o_value),
    .io_excep_o_pc(id_ex_io_excep_o_pc)
  );
  EX_MEM ex_mem ( // @[cpu.scala 25:24:@2319.4]
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
    .io_excep_i_valid(ex_mem_io_excep_i_valid),
    .io_excep_i_code(ex_mem_io_excep_i_code),
    .io_excep_i_value(ex_mem_io_excep_i_value),
    .io_excep_i_pc(ex_mem_io_excep_i_pc),
    .io_inter_i_valid(ex_mem_io_inter_i_valid),
    .io_inter_i_bits(ex_mem_io_inter_i_bits),
    .io_nlso(ex_mem_io_nlso),
    .io_lsmo(ex_mem_io_lsmo),
    .io_addro(ex_mem_io_addro),
    .io_datao(ex_mem_io_datao),
    .io_wrego_wbrv(ex_mem_io_wrego_wbrv),
    .io_wrego_wbri(ex_mem_io_wrego_wbri),
    .io_wrego_wbrd(ex_mem_io_wrego_wbrd),
    .io_csr_wb_o_valid(ex_mem_io_csr_wb_o_valid),
    .io_csr_wb_o_csr_idx(ex_mem_io_csr_wb_o_csr_idx),
    .io_csr_wb_o_csr_data(ex_mem_io_csr_wb_o_csr_data),
    .io_excep_o_valid(ex_mem_io_excep_o_valid),
    .io_excep_o_code(ex_mem_io_excep_o_code),
    .io_excep_o_value(ex_mem_io_excep_o_value),
    .io_excep_o_pc(ex_mem_io_excep_o_pc),
    .io_inter_o_valid(ex_mem_io_inter_o_valid),
    .io_inter_o_bits(ex_mem_io_inter_o_bits)
  );
  MEM_WB mem_wb ( // @[cpu.scala 26:24:@2322.4]
    .clock(mem_wb_clock),
    .reset(mem_wb_reset),
    .io_en(mem_wb_io_en),
    .io_pass(mem_wb_io_pass),
    .io_wregi_wbrv(mem_wb_io_wregi_wbrv),
    .io_wregi_wbri(mem_wb_io_wregi_wbri),
    .io_wregi_wbrd(mem_wb_io_wregi_wbrd),
    .io_wrego_wbrv(mem_wb_io_wrego_wbrv),
    .io_wrego_wbri(mem_wb_io_wrego_wbri),
    .io_wrego_wbrd(mem_wb_io_wrego_wbrd)
  );
  CSR csr ( // @[cpu.scala 27:24:@2325.4]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_id_addr(csr_io_id_addr),
    .io_id_rdata(csr_io_id_rdata),
    .io_id_priv(csr_io_id_priv),
    .io_mem_wrCSROp_valid(csr_io_mem_wrCSROp_valid),
    .io_mem_wrCSROp_csr_idx(csr_io_mem_wrCSROp_csr_idx),
    .io_mem_wrCSROp_csr_data(csr_io_mem_wrCSROp_csr_data),
    .io_mem_excep_valid(csr_io_mem_excep_valid),
    .io_mem_excep_code(csr_io_mem_excep_code),
    .io_mem_excep_value(csr_io_mem_excep_value),
    .io_mem_excep_pc(csr_io_mem_excep_pc),
    .io_flush(csr_io_flush),
    .io_inter_valid(csr_io_inter_valid),
    .io_inter_bits(csr_io_inter_bits)
  );
  assign io_debug_pc = if_id_io_pco; // @[cpu.scala 30:20:@2328.4]
  assign io_debug_ins = if_id_io_inso; // @[cpu.scala 31:20:@2329.4]
  assign io_mem_mode = iomn_io_mem_out_mode; // @[cpu.scala 38:20:@2353.4]
  assign io_mem_addr = iomn_io_mem_out_addr; // @[cpu.scala 38:20:@2351.4]
  assign io_mem_wdata = iomn_io_mem_out_wdata; // @[cpu.scala 38:20:@2349.4]
  assign io_serial_mode = iomn_io_serial_out_mode; // @[cpu.scala 39:20:@2358.4]
  assign io_serial_addr = iomn_io_serial_out_addr; // @[cpu.scala 39:20:@2356.4]
  assign io_serial_wdata = iomn_io_serial_out_wdata; // @[cpu.scala 39:20:@2354.4]
  assign insr_io_jump = csr_io_flush | exec_io_jump; // @[cpu.scala 50:20:@2373.4]
  assign insr_io_jdest = exec_io_jdest; // @[cpu.scala 51:20:@2375.4 cpu.scala 52:20:@2376.4]
  assign insr_io_nls = ex_mem_io_nlso; // @[cpu.scala 53:20:@2377.4]
  assign insr_io_lpc = if_id_io_pco; // @[cpu.scala 72:20:@2395.4]
  assign insr_io_insp = if_id_io_insco; // @[cpu.scala 74:20:@2397.4]
  assign insr_io_inspd = if_id_io_icdo; // @[cpu.scala 75:20:@2398.4]
  assign insr_io_bubble = insd_io_bubble; // @[cpu.scala 54:20:@2378.4]
  assign insr_io_mmu_ready = mmu_io_insr_ready; // @[cpu.scala 34:20:@2332.4]
  assign insr_io_mmu_rdata = mmu_io_insr_rdata; // @[cpu.scala 34:20:@2330.4]
  assign insd_io_ins = if_id_io_inso; // @[cpu.scala 73:20:@2396.4]
  assign insd_io_lastload_valid = if_id_io_lastloadout_valid; // @[cpu.scala 76:26:@2400.4]
  assign insd_io_lastload_index = if_id_io_lastloadout_index; // @[cpu.scala 76:26:@2399.4]
  assign insd_io_regr_r1d = regc_io_r_r1d; // @[cpu.scala 42:19:@2360.4]
  assign insd_io_regr_r2d = regc_io_r_r2d; // @[cpu.scala 42:19:@2359.4]
  assign insd_io_csr_rdata = csr_io_id_rdata; // @[cpu.scala 133:21:@2492.4]
  assign insd_io_csr_priv = csr_io_id_priv; // @[cpu.scala 133:21:@2491.4]
  assign insd_io_csr_from_ex_valid = exec_io_wcsr_valid; // @[cpu.scala 129:25:@2487.4]
  assign insd_io_csr_from_ex_csr_idx = exec_io_wcsr_csr_idx; // @[cpu.scala 129:25:@2486.4]
  assign insd_io_csr_from_ex_csr_data = exec_io_wcsr_csr_data; // @[cpu.scala 129:25:@2485.4]
  assign insd_io_csr_from_mem_valid = ex_mem_io_csr_wb_o_valid; // @[cpu.scala 130:26:@2490.4]
  assign insd_io_csr_from_mem_csr_idx = ex_mem_io_csr_wb_o_csr_idx; // @[cpu.scala 130:26:@2489.4]
  assign insd_io_csr_from_mem_csr_data = ex_mem_io_csr_wb_o_csr_data; // @[cpu.scala 130:26:@2488.4]
  assign insd_io_exWrReg_wbrv = exec_io_wreg_wbrv; // @[cpu.scala 46:22:@2368.4]
  assign insd_io_exWrReg_wbri = exec_io_wreg_wbri; // @[cpu.scala 46:22:@2367.4]
  assign insd_io_exWrReg_wbrd = exec_io_wreg_wbrd; // @[cpu.scala 46:22:@2366.4]
  assign insd_io_memWrReg_wbrv = memc_io_wreg_wbrv; // @[cpu.scala 47:22:@2371.4]
  assign insd_io_memWrReg_wbri = memc_io_wreg_wbri; // @[cpu.scala 47:22:@2370.4]
  assign insd_io_memWrReg_wbrd = memc_io_wreg_wbrd; // @[cpu.scala 47:22:@2369.4]
  assign insd_io_if_excep_pc = if_id_io_excep_o_pc; // @[cpu.scala 77:26:@2401.4]
  assign exec_io_imm = id_ex_io_immo; // @[cpu.scala 94:21:@2427.4]
  assign exec_io_ALUOp = id_ex_io_ALUOpo; // @[cpu.scala 95:21:@2428.4]
  assign exec_io_pc = id_ex_io_pco; // @[cpu.scala 97:21:@2430.4]
  assign exec_io_exe_type = id_ex_io_exeto; // @[cpu.scala 96:21:@2429.4]
  assign exec_io_op32 = id_ex_io_op32o; // @[cpu.scala 99:21:@2437.4]
  assign exec_io_dreg_rs2_valid = id_ex_io_drego_rs2_valid; // @[cpu.scala 98:21:@2435.4]
  assign exec_io_dreg_rs1_value = id_ex_io_drego_rs1_value; // @[cpu.scala 98:21:@2434.4]
  assign exec_io_dreg_rs2_value = id_ex_io_drego_rs2_value; // @[cpu.scala 98:21:@2433.4]
  assign exec_io_dreg_rd_valid = id_ex_io_drego_rd_valid; // @[cpu.scala 98:21:@2432.4]
  assign exec_io_dreg_rd_index = id_ex_io_drego_rd_index; // @[cpu.scala 98:21:@2431.4]
  assign exec_io_csr_op_valid = id_ex_io_csr_wb_o_valid; // @[cpu.scala 100:24:@2440.4]
  assign exec_io_csr_op_csr_idx = id_ex_io_csr_wb_o_csr_idx; // @[cpu.scala 100:24:@2439.4]
  assign exec_io_csr_op_csr_data = id_ex_io_csr_wb_o_csr_data; // @[cpu.scala 100:24:@2438.4]
  assign exec_io_id_excep_valid = id_ex_io_excep_o_valid; // @[cpu.scala 101:24:@2444.4]
  assign exec_io_id_excep_code = id_ex_io_excep_o_code; // @[cpu.scala 101:24:@2443.4]
  assign exec_io_id_excep_value = id_ex_io_excep_o_value; // @[cpu.scala 101:24:@2442.4]
  assign exec_io_id_excep_pc = id_ex_io_excep_o_pc; // @[cpu.scala 101:24:@2441.4]
  assign memc_io_nls = ex_mem_io_nlso; // @[cpu.scala 114:21:@2462.4]
  assign memc_io_lsm = ex_mem_io_lsmo; // @[cpu.scala 116:21:@2466.4]
  assign memc_io_addr = ex_mem_io_addro; // @[cpu.scala 117:21:@2467.4]
  assign memc_io_data = ex_mem_io_datao; // @[cpu.scala 118:21:@2468.4]
  assign memc_io_ereg_wbrv = ex_mem_io_wrego_wbrv; // @[cpu.scala 115:21:@2465.4]
  assign memc_io_ereg_wbri = ex_mem_io_wrego_wbri; // @[cpu.scala 115:21:@2464.4]
  assign memc_io_ereg_wbrd = ex_mem_io_wrego_wbrd; // @[cpu.scala 115:21:@2463.4]
  assign memc_io_mem_ready = mmu_io_mem_ready; // @[cpu.scala 36:20:@2342.4]
  assign memc_io_mem_rdata = mmu_io_mem_rdata; // @[cpu.scala 36:20:@2340.4]
  assign memc_io_excep_valid = ex_mem_io_excep_o_valid; // @[cpu.scala 120:24:@2475.4]
  assign memc_io_excep_code = ex_mem_io_excep_o_code; // @[cpu.scala 120:24:@2474.4]
  assign memc_io_excep_value = ex_mem_io_excep_o_value; // @[cpu.scala 120:24:@2473.4]
  assign memc_io_excep_pc = ex_mem_io_excep_o_pc; // @[cpu.scala 120:24:@2472.4]
  assign memc_io_csr_wb_valid = ex_mem_io_csr_wb_o_valid; // @[cpu.scala 119:24:@2471.4]
  assign memc_io_csr_wb_csr_idx = ex_mem_io_csr_wb_o_csr_idx; // @[cpu.scala 119:24:@2470.4]
  assign memc_io_csr_wb_csr_data = ex_mem_io_csr_wb_o_csr_data; // @[cpu.scala 119:24:@2469.4]
  assign memc_io_inter_valid = ex_mem_io_inter_o_valid; // @[cpu.scala 121:24:@2477.4]
  assign memc_io_inter_bits = ex_mem_io_inter_o_bits; // @[cpu.scala 121:24:@2476.4]
  assign wrbk_io_wreg_wbrv = mem_wb_io_wrego_wbrv; // @[cpu.scala 126:21:@2484.4]
  assign wrbk_io_wreg_wbri = mem_wb_io_wrego_wbri; // @[cpu.scala 126:21:@2483.4]
  assign wrbk_io_wreg_wbrd = mem_wb_io_wrego_wbrd; // @[cpu.scala 126:21:@2482.4]
  assign regc_clock = clock; // @[:@2305.4]
  assign regc_reset = reset; // @[:@2306.4]
  assign regc_io_r_r1 = insd_io_regr_r1; // @[cpu.scala 42:19:@2362.4]
  assign regc_io_r_r2 = insd_io_regr_r2; // @[cpu.scala 42:19:@2361.4]
  assign regc_io_w_wen = wrbk_io_reg_wen; // @[cpu.scala 43:19:@2365.4]
  assign regc_io_w_w = wrbk_io_reg_w; // @[cpu.scala 43:19:@2364.4]
  assign regc_io_w_wd = wrbk_io_reg_wd; // @[cpu.scala 43:19:@2363.4]
  assign regc_io_pass = memc_io_ready; // @[cpu.scala 61:20:@2383.4]
  assign mmu_clock = clock; // @[:@2308.4]
  assign mmu_reset = reset; // @[:@2309.4]
  assign mmu_io_insr_mode = insr_io_mmu_mode; // @[cpu.scala 34:20:@2333.4]
  assign mmu_io_insr_addr = insr_io_mmu_addr; // @[cpu.scala 34:20:@2331.4]
  assign mmu_io_mem_mode = memc_io_mem_mode; // @[cpu.scala 36:20:@2343.4]
  assign mmu_io_mem_addr = memc_io_mem_addr; // @[cpu.scala 36:20:@2341.4]
  assign mmu_io_mem_wdata = memc_io_mem_wdata; // @[cpu.scala 36:20:@2339.4]
  assign mmu_io_if_iom_ready = iomn_io_mem_if_ready; // @[cpu.scala 35:20:@2337.4]
  assign mmu_io_if_iom_rdata = iomn_io_mem_if_rdata; // @[cpu.scala 35:20:@2335.4]
  assign mmu_io_mem_iom_ready = iomn_io_mem_mem_ready; // @[cpu.scala 37:20:@2347.4]
  assign mmu_io_mem_iom_rdata = iomn_io_mem_mem_rdata; // @[cpu.scala 37:20:@2345.4]
  assign iomn_clock = clock; // @[:@2311.4]
  assign iomn_reset = reset; // @[:@2312.4]
  assign iomn_io_mem_if_mode = mmu_io_if_iom_mode; // @[cpu.scala 35:20:@2338.4]
  assign iomn_io_mem_if_addr = mmu_io_if_iom_addr; // @[cpu.scala 35:20:@2336.4]
  assign iomn_io_mem_mem_mode = mmu_io_mem_iom_mode; // @[cpu.scala 37:20:@2348.4]
  assign iomn_io_mem_mem_addr = mmu_io_mem_iom_addr; // @[cpu.scala 37:20:@2346.4]
  assign iomn_io_mem_mem_wdata = mmu_io_mem_iom_wdata; // @[cpu.scala 37:20:@2344.4]
  assign iomn_io_mem_out_ready = io_mem_ready; // @[cpu.scala 38:20:@2352.4]
  assign iomn_io_mem_out_rdata = io_mem_rdata; // @[cpu.scala 38:20:@2350.4]
  assign iomn_io_serial_out_ready = io_serial_ready; // @[cpu.scala 39:20:@2357.4]
  assign iomn_io_serial_out_rdata = io_serial_rdata; // @[cpu.scala 39:20:@2355.4]
  assign if_id_clock = clock; // @[:@2314.4]
  assign if_id_reset = reset; // @[:@2315.4]
  assign if_id_io_en = io_en; // @[cpu.scala 64:20:@2384.4]
  assign if_id_io_pass = csr_io_flush == 1'h0; // @[cpu.scala 57:20:@2379.4 cpu.scala 139:21:@2504.4]
  assign if_id_io_insi = insr_io_ins; // @[cpu.scala 67:20:@2387.4]
  assign if_id_io_pci = insr_io_pc; // @[cpu.scala 68:20:@2388.4]
  assign if_id_io_insci = insr_io_insn; // @[cpu.scala 65:20:@2385.4]
  assign if_id_io_icdi = insr_io_insnd; // @[cpu.scala 66:20:@2386.4]
  assign if_id_io_lastloadin_valid = insd_io_loadinfo_valid; // @[cpu.scala 69:25:@2390.4]
  assign if_id_io_lastloadin_index = insd_io_loadinfo_index; // @[cpu.scala 69:25:@2389.4]
  assign if_id_io_excep_i_pc = insr_io_excep_pc; // @[cpu.scala 70:25:@2391.4]
  assign id_ex_clock = clock; // @[:@2317.4]
  assign id_ex_reset = reset; // @[:@2318.4]
  assign id_ex_io_en = io_en; // @[cpu.scala 80:21:@2405.4]
  assign id_ex_io_bid = insd_io_bubble; // @[cpu.scala 81:21:@2406.4]
  assign id_ex_io_bex = exec_io_jump; // @[cpu.scala 82:21:@2407.4]
  assign id_ex_io_flush = csr_io_flush; // @[cpu.scala 140:21:@2505.4]
  assign id_ex_io_pass = memc_io_ready; // @[cpu.scala 58:20:@2380.4]
  assign id_ex_io_immi = insd_io_imm; // @[cpu.scala 84:21:@2408.4]
  assign id_ex_io_ALUOpi = insd_io_ALUOp; // @[cpu.scala 85:21:@2409.4]
  assign id_ex_io_exeti = insd_io_exe_type; // @[cpu.scala 86:21:@2410.4]
  assign id_ex_io_pci = if_id_io_pco; // @[cpu.scala 87:21:@2411.4]
  assign id_ex_io_lsmi = insd_io_ls_mode; // @[cpu.scala 89:21:@2418.4]
  assign id_ex_io_op32i = insd_io_op32; // @[cpu.scala 90:21:@2419.4]
  assign id_ex_io_csr_wb_i_valid = insd_io_csr_content_valid; // @[cpu.scala 91:24:@2422.4]
  assign id_ex_io_csr_wb_i_csr_idx = insd_io_csr_content_csr_idx; // @[cpu.scala 91:24:@2421.4]
  assign id_ex_io_csr_wb_i_csr_data = insd_io_csr_content_csr_data; // @[cpu.scala 91:24:@2420.4]
  assign id_ex_io_dregi_rs2_valid = insd_io_dreg_rs2_valid; // @[cpu.scala 88:21:@2416.4]
  assign id_ex_io_dregi_rs1_value = insd_io_dreg_rs1_value; // @[cpu.scala 88:21:@2415.4]
  assign id_ex_io_dregi_rs2_value = insd_io_dreg_rs2_value; // @[cpu.scala 88:21:@2414.4]
  assign id_ex_io_dregi_rd_valid = insd_io_dreg_rd_valid; // @[cpu.scala 88:21:@2413.4]
  assign id_ex_io_dregi_rd_index = insd_io_dreg_rd_index; // @[cpu.scala 88:21:@2412.4]
  assign id_ex_io_excep_i_valid = insd_io_ex_excep_valid; // @[cpu.scala 92:24:@2426.4]
  assign id_ex_io_excep_i_code = insd_io_ex_excep_code; // @[cpu.scala 92:24:@2425.4]
  assign id_ex_io_excep_i_value = insd_io_ex_excep_value; // @[cpu.scala 92:24:@2424.4]
  assign id_ex_io_excep_i_pc = insd_io_ex_excep_pc; // @[cpu.scala 92:24:@2423.4]
  assign ex_mem_clock = clock; // @[:@2320.4]
  assign ex_mem_reset = reset; // @[:@2321.4]
  assign ex_mem_io_en = io_en; // @[cpu.scala 104:21:@2445.4]
  assign ex_mem_io_pass = memc_io_ready; // @[cpu.scala 59:20:@2381.4]
  assign ex_mem_io_nlsi = exec_io_nls; // @[cpu.scala 106:21:@2447.4]
  assign ex_mem_io_lsmi = id_ex_io_lsmo; // @[cpu.scala 105:21:@2446.4]
  assign ex_mem_io_addri = exec_io_addr; // @[cpu.scala 108:21:@2451.4]
  assign ex_mem_io_datai = exec_io_data; // @[cpu.scala 109:21:@2452.4]
  assign ex_mem_io_wregi_wbrv = exec_io_wreg_wbrv; // @[cpu.scala 107:21:@2450.4]
  assign ex_mem_io_wregi_wbri = exec_io_wreg_wbri; // @[cpu.scala 107:21:@2449.4]
  assign ex_mem_io_wregi_wbrd = exec_io_wreg_wbrd; // @[cpu.scala 107:21:@2448.4]
  assign ex_mem_io_csr_wb_i_valid = exec_io_wcsr_valid; // @[cpu.scala 110:24:@2455.4]
  assign ex_mem_io_csr_wb_i_csr_idx = exec_io_wcsr_csr_idx; // @[cpu.scala 110:24:@2454.4]
  assign ex_mem_io_csr_wb_i_csr_data = exec_io_wcsr_csr_data; // @[cpu.scala 110:24:@2453.4]
  assign ex_mem_io_excep_i_valid = exec_io_mem_excep_valid; // @[cpu.scala 111:24:@2459.4]
  assign ex_mem_io_excep_i_code = exec_io_mem_excep_code; // @[cpu.scala 111:24:@2458.4]
  assign ex_mem_io_excep_i_value = exec_io_mem_excep_value; // @[cpu.scala 111:24:@2457.4]
  assign ex_mem_io_excep_i_pc = exec_io_mem_excep_pc; // @[cpu.scala 111:24:@2456.4]
  assign ex_mem_io_inter_i_valid = csr_io_inter_valid; // @[cpu.scala 112:24:@2461.4]
  assign ex_mem_io_inter_i_bits = csr_io_inter_bits; // @[cpu.scala 112:24:@2460.4]
  assign mem_wb_clock = clock; // @[:@2323.4]
  assign mem_wb_reset = reset; // @[:@2324.4]
  assign mem_wb_io_en = io_en; // @[cpu.scala 124:21:@2478.4]
  assign mem_wb_io_pass = memc_io_ready; // @[cpu.scala 60:20:@2382.4]
  assign mem_wb_io_wregi_wbrv = memc_io_wreg_wbrv; // @[cpu.scala 125:21:@2481.4]
  assign mem_wb_io_wregi_wbri = memc_io_wreg_wbri; // @[cpu.scala 125:21:@2480.4]
  assign mem_wb_io_wregi_wbrd = memc_io_wreg_wbrd; // @[cpu.scala 125:21:@2479.4]
  assign csr_clock = clock; // @[:@2326.4]
  assign csr_reset = reset; // @[:@2327.4]
  assign csr_io_id_addr = insd_io_csr_addr; // @[cpu.scala 133:21:@2493.4]
  assign csr_io_mem_wrCSROp_valid = memc_io_csr_wrCSROp_valid; // @[cpu.scala 134:21:@2500.4]
  assign csr_io_mem_wrCSROp_csr_idx = memc_io_csr_wrCSROp_csr_idx; // @[cpu.scala 134:21:@2499.4]
  assign csr_io_mem_wrCSROp_csr_data = memc_io_csr_wrCSROp_csr_data; // @[cpu.scala 134:21:@2498.4]
  assign csr_io_mem_excep_valid = memc_io_csr_excep_valid; // @[cpu.scala 134:21:@2497.4]
  assign csr_io_mem_excep_code = memc_io_csr_excep_code; // @[cpu.scala 134:21:@2496.4]
  assign csr_io_mem_excep_value = memc_io_csr_excep_value; // @[cpu.scala 134:21:@2495.4]
  assign csr_io_mem_excep_pc = memc_io_csr_excep_pc; // @[cpu.scala 134:21:@2494.4]
endmodule
