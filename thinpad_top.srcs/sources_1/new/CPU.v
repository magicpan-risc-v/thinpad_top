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
  output        io_mmu_if_rst, // @[:@6.4]
  output [63:0] io_excep_pc, // @[:@6.4]
  output        io_excep_inst_valid // @[:@6.4]
);
  wire [64:0] _T_66; // @[insreader.scala 27:24:@8.4]
  wire [63:0] npc; // @[insreader.scala 27:24:@9.4]
  wire [60:0] _T_67; // @[insreader.scala 28:36:@10.4]
  wire [60:0] _T_68; // @[insreader.scala 28:50:@11.4]
  wire  _T_69; // @[insreader.scala 28:43:@12.4]
  wire  cnrc; // @[insreader.scala 28:25:@13.4]
  wire  _T_71; // @[insreader.scala 29:23:@14.4]
  wire  _T_73; // @[insreader.scala 29:32:@15.4]
  wire  cache_valid; // @[insreader.scala 29:29:@16.4]
  wire [63:0] _T_74; // @[insreader.scala 41:22:@17.4]
  wire [63:0] _T_75; // @[insreader.scala 40:12:@18.4]
  wire [63:0] pco; // @[insreader.scala 38:20:@19.4]
  wire  _T_76; // @[insreader.scala 44:29:@20.4]
  wire  _T_78; // @[insreader.scala 44:17:@21.4]
  wire  nread; // @[insreader.scala 44:40:@22.4]
  wire  _T_81; // @[insreader.scala 46:19:@24.4]
  wire  _T_82; // @[insreader.scala 47:16:@25.4]
  wire [31:0] _T_83; // @[insreader.scala 47:28:@26.4]
  wire [31:0] _T_84; // @[insreader.scala 47:44:@27.4]
  wire [31:0] _T_85; // @[insreader.scala 46:32:@28.4]
  wire [31:0] _T_88; // @[insreader.scala 52:37:@30.4]
  wire [31:0] _T_89; // @[insreader.scala 52:58:@31.4]
  wire [31:0] _T_90; // @[insreader.scala 51:16:@32.4]
  wire [31:0] _T_91; // @[insreader.scala 48:15:@33.4]
  wire [31:0] ins; // @[insreader.scala 45:20:@34.4]
  wire [63:0] insn; // @[insreader.scala 56:20:@35.4]
  wire [63:0] jnpc; // @[insreader.scala 57:20:@36.4]
  wire [63:0] addr; // @[insreader.scala 58:21:@38.4]
  wire  _T_111; // @[insreader.scala 67:40:@46.4]
  wire [64:0] _T_116; // @[insreader.scala 71:60:@51.4]
  wire [64:0] _T_117; // @[insreader.scala 71:60:@52.4]
  wire [63:0] _T_118; // @[insreader.scala 71:60:@53.4]
  wire  _T_125; // @[insreader.scala 74:34:@62.4]
  assign _T_66 = io_lpc + 64'h4; // @[insreader.scala 27:24:@8.4]
  assign npc = io_lpc + 64'h4; // @[insreader.scala 27:24:@9.4]
  assign _T_67 = io_inspd[63:3]; // @[insreader.scala 28:36:@10.4]
  assign _T_68 = npc[63:3]; // @[insreader.scala 28:50:@11.4]
  assign _T_69 = _T_67 != _T_68; // @[insreader.scala 28:43:@12.4]
  assign cnrc = io_jump | _T_69; // @[insreader.scala 28:25:@13.4]
  assign _T_71 = cnrc == 1'h0; // @[insreader.scala 29:23:@14.4]
  assign _T_73 = io_nls == 1'h0; // @[insreader.scala 29:32:@15.4]
  assign cache_valid = _T_71 & _T_73; // @[insreader.scala 29:29:@16.4]
  assign _T_74 = io_jump ? io_jdest : npc; // @[insreader.scala 41:22:@17.4]
  assign _T_75 = cnrc ? _T_74 : npc; // @[insreader.scala 40:12:@18.4]
  assign pco = io_bubble ? io_lpc : _T_75; // @[insreader.scala 38:20:@19.4]
  assign _T_76 = io_bubble | io_nls; // @[insreader.scala 44:29:@20.4]
  assign _T_78 = _T_76 == 1'h0; // @[insreader.scala 44:17:@21.4]
  assign nread = _T_78 & cnrc; // @[insreader.scala 44:40:@22.4]
  assign _T_81 = io_bubble | _T_71; // @[insreader.scala 46:19:@24.4]
  assign _T_82 = pco[2]; // @[insreader.scala 47:16:@25.4]
  assign _T_83 = io_insp[63:32]; // @[insreader.scala 47:28:@26.4]
  assign _T_84 = io_insp[31:0]; // @[insreader.scala 47:44:@27.4]
  assign _T_85 = _T_82 ? _T_83 : _T_84; // @[insreader.scala 46:32:@28.4]
  assign _T_88 = io_mmu_rdata[63:32]; // @[insreader.scala 52:37:@30.4]
  assign _T_89 = io_mmu_rdata[31:0]; // @[insreader.scala 52:58:@31.4]
  assign _T_90 = _T_82 ? _T_88 : _T_89; // @[insreader.scala 51:16:@32.4]
  assign _T_91 = io_nls ? 32'h0 : _T_90; // @[insreader.scala 48:15:@33.4]
  assign ins = _T_81 ? _T_85 : _T_91; // @[insreader.scala 45:20:@34.4]
  assign insn = nread ? io_mmu_rdata : io_insp; // @[insreader.scala 56:20:@35.4]
  assign jnpc = io_jump ? io_jdest : pco; // @[insreader.scala 57:20:@36.4]
  assign addr = jnpc & 64'hfffffffffffffff8; // @[insreader.scala 58:21:@38.4]
  assign _T_111 = cache_valid | io_mmu_ready; // @[insreader.scala 67:40:@46.4]
  assign _T_116 = jnpc - 64'h4; // @[insreader.scala 71:60:@51.4]
  assign _T_117 = $unsigned(_T_116); // @[insreader.scala 71:60:@52.4]
  assign _T_118 = _T_117[63:0]; // @[insreader.scala 71:60:@53.4]
  assign _T_125 = io_mmu_ready & nread; // @[insreader.scala 74:34:@62.4]
  assign io_ins = _T_111 ? ins : 32'h0; // @[insreader.scala 72:13:@58.4]
  assign io_pc = _T_111 ? jnpc : _T_118; // @[insreader.scala 71:13:@55.4]
  assign io_insn = _T_111 ? insn : io_insp; // @[insreader.scala 73:13:@61.4]
  assign io_insnd = _T_125 ? addr : io_inspd; // @[insreader.scala 74:14:@64.4]
  assign io_mmu_mode = nread ? 4'hb : 4'hf; // @[insreader.scala 61:18:@42.4]
  assign io_mmu_addr = nread ? addr : 64'h0; // @[insreader.scala 60:17:@40.4]
  assign io_mmu_if_rst = io_jump; // @[insreader.scala 76:19:@65.4]
  assign io_excep_pc = io_pc; // @[insreader.scala 65:17:@44.4]
  assign io_excep_inst_valid = cache_valid | io_mmu_ready; // @[insreader.scala 67:25:@47.4]
endmodule
module InsType( // @[:@69.2]
  input  [31:0] io_ins, // @[:@72.4]
  output [2:0]  io_ins_type, // @[:@72.4]
  output [3:0]  io_exe_type, // @[:@72.4]
  output        io_op32 // @[:@72.4]
);
  wire [2:0] funct3; // @[insType.scala 54:24:@74.4]
  wire [4:0] opcode; // @[insType.scala 55:24:@75.4]
  wire  _T_14; // @[insType.scala 57:24:@76.4]
  wire  _T_16; // @[insType.scala 57:49:@77.4]
  wire  _T_18; // @[insType.scala 59:30:@80.4]
  wire  _T_48; // @[Mux.scala 46:19:@81.4]
  wire [3:0] _T_49; // @[Mux.scala 46:16:@82.4]
  wire  _T_50; // @[Mux.scala 46:19:@83.4]
  wire [3:0] _T_51; // @[Mux.scala 46:16:@84.4]
  wire  _T_52; // @[Mux.scala 46:19:@85.4]
  wire [3:0] _T_53; // @[Mux.scala 46:16:@86.4]
  wire  _T_54; // @[Mux.scala 46:19:@87.4]
  wire [3:0] _T_55; // @[Mux.scala 46:16:@88.4]
  wire  _T_56; // @[Mux.scala 46:19:@89.4]
  wire [3:0] _T_57; // @[Mux.scala 46:16:@90.4]
  wire  _T_58; // @[Mux.scala 46:19:@91.4]
  wire [3:0] _T_59; // @[Mux.scala 46:16:@92.4]
  wire  _T_66; // @[insType.scala 89:38:@93.4]
  wire  _T_67; // @[insType.scala 90:25:@94.4]
  wire [3:0] _T_68; // @[insType.scala 90:18:@95.4]
  wire [3:0] _T_69; // @[insType.scala 89:30:@96.4]
  wire  _T_71; // @[Mux.scala 46:19:@97.4]
  wire [3:0] _T_72; // @[Mux.scala 46:16:@98.4]
  wire  _T_73; // @[Mux.scala 46:19:@99.4]
  wire [3:0] _T_74; // @[Mux.scala 46:16:@100.4]
  wire  _T_75; // @[Mux.scala 46:19:@101.4]
  wire [3:0] _T_76; // @[Mux.scala 46:16:@102.4]
  wire  _T_77; // @[Mux.scala 46:19:@103.4]
  wire [3:0] _T_78; // @[Mux.scala 46:16:@104.4]
  wire  _T_79; // @[Mux.scala 46:19:@105.4]
  wire [3:0] _T_80; // @[Mux.scala 46:16:@106.4]
  wire  _T_81; // @[Mux.scala 46:19:@107.4]
  wire [3:0] _T_82; // @[Mux.scala 46:16:@108.4]
  wire  _T_83; // @[Mux.scala 46:19:@109.4]
  wire [3:0] _T_84; // @[Mux.scala 46:16:@110.4]
  wire  _T_85; // @[Mux.scala 46:19:@111.4]
  wire [3:0] _T_86; // @[Mux.scala 46:16:@112.4]
  wire  _T_87; // @[Mux.scala 46:19:@113.4]
  wire [3:0] _T_88; // @[Mux.scala 46:16:@114.4]
  wire  _T_89; // @[Mux.scala 46:19:@115.4]
  wire [3:0] _T_90; // @[Mux.scala 46:16:@116.4]
  wire  _T_91; // @[Mux.scala 46:19:@117.4]
  wire [3:0] _T_92; // @[Mux.scala 46:16:@118.4]
  wire  _T_93; // @[Mux.scala 46:19:@119.4]
  wire [3:0] _T_94; // @[Mux.scala 46:16:@120.4]
  wire  _T_95; // @[Mux.scala 46:19:@121.4]
  wire [3:0] _T_96; // @[Mux.scala 46:16:@122.4]
  wire [2:0] _T_119; // @[Mux.scala 46:16:@127.4]
  wire [2:0] _T_121; // @[Mux.scala 46:16:@129.4]
  wire [2:0] _T_123; // @[Mux.scala 46:16:@131.4]
  wire [2:0] _T_125; // @[Mux.scala 46:16:@133.4]
  wire [2:0] _T_127; // @[Mux.scala 46:16:@135.4]
  wire [2:0] _T_129; // @[Mux.scala 46:16:@137.4]
  wire [2:0] _T_131; // @[Mux.scala 46:16:@139.4]
  wire [2:0] _T_133; // @[Mux.scala 46:16:@141.4]
  wire [2:0] _T_135; // @[Mux.scala 46:16:@143.4]
  wire [2:0] _T_137; // @[Mux.scala 46:16:@145.4]
  wire [2:0] _T_139; // @[Mux.scala 46:16:@147.4]
  wire [2:0] _T_141; // @[Mux.scala 46:16:@149.4]
  assign funct3 = io_ins[14:12]; // @[insType.scala 54:24:@74.4]
  assign opcode = io_ins[6:2]; // @[insType.scala 55:24:@75.4]
  assign _T_14 = opcode == 5'he; // @[insType.scala 57:24:@76.4]
  assign _T_16 = opcode == 5'h6; // @[insType.scala 57:49:@77.4]
  assign _T_18 = io_ins[0]; // @[insType.scala 59:30:@80.4]
  assign _T_48 = 3'h7 == funct3; // @[Mux.scala 46:19:@81.4]
  assign _T_49 = _T_48 ? 4'he : 4'h0; // @[Mux.scala 46:16:@82.4]
  assign _T_50 = 3'h6 == funct3; // @[Mux.scala 46:19:@83.4]
  assign _T_51 = _T_50 ? 4'hd : _T_49; // @[Mux.scala 46:16:@84.4]
  assign _T_52 = 3'h5 == funct3; // @[Mux.scala 46:19:@85.4]
  assign _T_53 = _T_52 ? 4'hc : _T_51; // @[Mux.scala 46:16:@86.4]
  assign _T_54 = 3'h4 == funct3; // @[Mux.scala 46:19:@87.4]
  assign _T_55 = _T_54 ? 4'hb : _T_53; // @[Mux.scala 46:16:@88.4]
  assign _T_56 = 3'h1 == funct3; // @[Mux.scala 46:19:@89.4]
  assign _T_57 = _T_56 ? 4'ha : _T_55; // @[Mux.scala 46:16:@90.4]
  assign _T_58 = 3'h0 == funct3; // @[Mux.scala 46:19:@91.4]
  assign _T_59 = _T_58 ? 4'h9 : _T_57; // @[Mux.scala 46:16:@92.4]
  assign _T_66 = funct3 != 3'h0; // @[insType.scala 89:38:@93.4]
  assign _T_67 = io_ins[14]; // @[insType.scala 90:25:@94.4]
  assign _T_68 = _T_67 ? 4'h7 : 4'h6; // @[insType.scala 90:18:@95.4]
  assign _T_69 = _T_66 ? _T_68 : 4'h1; // @[insType.scala 89:30:@96.4]
  assign _T_71 = 5'h3 == opcode; // @[Mux.scala 46:19:@97.4]
  assign _T_72 = _T_71 ? 4'h5 : 4'h0; // @[Mux.scala 46:16:@98.4]
  assign _T_73 = 5'h1c == opcode; // @[Mux.scala 46:19:@99.4]
  assign _T_74 = _T_73 ? _T_69 : _T_72; // @[Mux.scala 46:16:@100.4]
  assign _T_75 = 5'h19 == opcode; // @[Mux.scala 46:19:@101.4]
  assign _T_76 = _T_75 ? 4'hf : _T_74; // @[Mux.scala 46:16:@102.4]
  assign _T_77 = 5'h1b == opcode; // @[Mux.scala 46:19:@103.4]
  assign _T_78 = _T_77 ? 4'h8 : _T_76; // @[Mux.scala 46:16:@104.4]
  assign _T_79 = 5'hd == opcode; // @[Mux.scala 46:19:@105.4]
  assign _T_80 = _T_79 ? 4'h4 : _T_78; // @[Mux.scala 46:16:@106.4]
  assign _T_81 = 5'h5 == opcode; // @[Mux.scala 46:19:@107.4]
  assign _T_82 = _T_81 ? 4'h3 : _T_80; // @[Mux.scala 46:16:@108.4]
  assign _T_83 = 5'h18 == opcode; // @[Mux.scala 46:19:@109.4]
  assign _T_84 = _T_83 ? _T_59 : _T_82; // @[Mux.scala 46:16:@110.4]
  assign _T_85 = 5'h8 == opcode; // @[Mux.scala 46:19:@111.4]
  assign _T_86 = _T_85 ? 4'h2 : _T_84; // @[Mux.scala 46:16:@112.4]
  assign _T_87 = 5'h6 == opcode; // @[Mux.scala 46:19:@113.4]
  assign _T_88 = _T_87 ? 4'h0 : _T_86; // @[Mux.scala 46:16:@114.4]
  assign _T_89 = 5'h4 == opcode; // @[Mux.scala 46:19:@115.4]
  assign _T_90 = _T_89 ? 4'h0 : _T_88; // @[Mux.scala 46:16:@116.4]
  assign _T_91 = 5'h0 == opcode; // @[Mux.scala 46:19:@117.4]
  assign _T_92 = _T_91 ? 4'h2 : _T_90; // @[Mux.scala 46:16:@118.4]
  assign _T_93 = 5'he == opcode; // @[Mux.scala 46:19:@119.4]
  assign _T_94 = _T_93 ? 4'h0 : _T_92; // @[Mux.scala 46:16:@120.4]
  assign _T_95 = 5'hc == opcode; // @[Mux.scala 46:19:@121.4]
  assign _T_96 = _T_95 ? 4'h0 : _T_94; // @[Mux.scala 46:16:@122.4]
  assign _T_119 = _T_73 ? 3'h2 : 3'h0; // @[Mux.scala 46:16:@127.4]
  assign _T_121 = _T_77 ? 3'h6 : _T_119; // @[Mux.scala 46:16:@129.4]
  assign _T_123 = _T_79 ? 3'h5 : _T_121; // @[Mux.scala 46:16:@131.4]
  assign _T_125 = _T_81 ? 3'h5 : _T_123; // @[Mux.scala 46:16:@133.4]
  assign _T_127 = _T_83 ? 3'h4 : _T_125; // @[Mux.scala 46:16:@135.4]
  assign _T_129 = _T_85 ? 3'h3 : _T_127; // @[Mux.scala 46:16:@137.4]
  assign _T_131 = _T_87 ? 3'h2 : _T_129; // @[Mux.scala 46:16:@139.4]
  assign _T_133 = _T_75 ? 3'h2 : _T_131; // @[Mux.scala 46:16:@141.4]
  assign _T_135 = _T_89 ? 3'h2 : _T_133; // @[Mux.scala 46:16:@143.4]
  assign _T_137 = _T_91 ? 3'h2 : _T_135; // @[Mux.scala 46:16:@145.4]
  assign _T_139 = _T_93 ? 3'h1 : _T_137; // @[Mux.scala 46:16:@147.4]
  assign _T_141 = _T_95 ? 3'h1 : _T_139; // @[Mux.scala 46:16:@149.4]
  assign io_ins_type = _T_18 ? _T_141 : 3'h0; // @[insType.scala 97:17:@151.4]
  assign io_exe_type = _T_18 ? _T_96 : 4'h0; // @[insType.scala 59:17:@124.4]
  assign io_op32 = _T_14 | _T_16; // @[insType.scala 57:13:@79.4]
endmodule
module ImmGen( // @[:@153.2]
  input  [31:0] io_ins, // @[:@156.4]
  input  [2:0]  io_ins_type, // @[:@156.4]
  output [63:0] io_imm // @[:@156.4]
);
  wire  sign; // @[immGen.scala 14:22:@158.4]
  wire  _T_13; // @[immGen.scala 22:25:@159.4]
  wire  _T_14; // @[immGen.scala 22:36:@160.4]
  wire [1:0] _T_15; // @[Cat.scala 30:58:@161.4]
  wire [1:0] _T_16; // @[immGen.scala 22:41:@162.4]
  wire  _T_18; // @[immGen.scala 22:41:@163.4]
  wire [4:0] _T_20; // @[immGen.scala 23:36:@164.4]
  wire [63:0] _T_21; // @[Cat.scala 30:58:@165.4]
  wire [51:0] _T_25; // @[Bitwise.scala 72:12:@167.4]
  wire [11:0] _T_26; // @[immGen.scala 24:41:@168.4]
  wire [63:0] _T_27; // @[Cat.scala 30:58:@169.4]
  wire [63:0] _T_28; // @[immGen.scala 21:31:@170.4]
  wire [6:0] _T_33; // @[immGen.scala 26:54:@173.4]
  wire [4:0] _T_34; // @[immGen.scala 26:69:@174.4]
  wire [63:0] _T_36; // @[Cat.scala 30:58:@176.4]
  wire  _T_42; // @[immGen.scala 27:66:@180.4]
  wire [5:0] _T_43; // @[immGen.scala 27:77:@181.4]
  wire [3:0] _T_44; // @[immGen.scala 27:92:@182.4]
  wire [64:0] _T_50; // @[Cat.scala 30:58:@187.4]
  wire [31:0] _T_54; // @[Bitwise.scala 72:12:@189.4]
  wire [19:0] _T_55; // @[immGen.scala 28:54:@190.4]
  wire [63:0] _T_58; // @[Cat.scala 30:58:@192.4]
  wire [42:0] _T_62; // @[Bitwise.scala 72:12:@194.4]
  wire [7:0] _T_64; // @[immGen.scala 29:66:@196.4]
  wire  _T_65; // @[immGen.scala 29:81:@197.4]
  wire [9:0] _T_66; // @[immGen.scala 29:93:@198.4]
  wire [63:0] _T_72; // @[Cat.scala 30:58:@203.4]
  wire  _T_73; // @[Mux.scala 46:19:@204.4]
  wire [63:0] _T_74; // @[Mux.scala 46:16:@205.4]
  wire  _T_75; // @[Mux.scala 46:19:@206.4]
  wire [63:0] _T_76; // @[Mux.scala 46:16:@207.4]
  wire  _T_77; // @[Mux.scala 46:19:@208.4]
  wire [64:0] _T_78; // @[Mux.scala 46:16:@209.4]
  wire  _T_79; // @[Mux.scala 46:19:@210.4]
  wire [64:0] _T_80; // @[Mux.scala 46:16:@211.4]
  wire  _T_81; // @[Mux.scala 46:19:@212.4]
  wire [64:0] _T_82; // @[Mux.scala 46:16:@213.4]
  wire  _T_83; // @[Mux.scala 46:19:@214.4]
  wire [64:0] _T_84; // @[Mux.scala 46:16:@215.4]
  assign sign = io_ins[31]; // @[immGen.scala 14:22:@158.4]
  assign _T_13 = io_ins[6]; // @[immGen.scala 22:25:@159.4]
  assign _T_14 = io_ins[4]; // @[immGen.scala 22:36:@160.4]
  assign _T_15 = {_T_13,_T_14}; // @[Cat.scala 30:58:@161.4]
  assign _T_16 = ~ _T_15; // @[immGen.scala 22:41:@162.4]
  assign _T_18 = _T_16 == 2'h0; // @[immGen.scala 22:41:@163.4]
  assign _T_20 = io_ins[19:15]; // @[immGen.scala 23:36:@164.4]
  assign _T_21 = {59'h0,_T_20}; // @[Cat.scala 30:58:@165.4]
  assign _T_25 = sign ? 52'hfffffffffffff : 52'h0; // @[Bitwise.scala 72:12:@167.4]
  assign _T_26 = io_ins[31:20]; // @[immGen.scala 24:41:@168.4]
  assign _T_27 = {_T_25,_T_26}; // @[Cat.scala 30:58:@169.4]
  assign _T_28 = _T_18 ? _T_21 : _T_27; // @[immGen.scala 21:31:@170.4]
  assign _T_33 = io_ins[31:25]; // @[immGen.scala 26:54:@173.4]
  assign _T_34 = io_ins[11:7]; // @[immGen.scala 26:69:@174.4]
  assign _T_36 = {_T_25,_T_33,_T_34}; // @[Cat.scala 30:58:@176.4]
  assign _T_42 = io_ins[7]; // @[immGen.scala 27:66:@180.4]
  assign _T_43 = io_ins[30:25]; // @[immGen.scala 27:77:@181.4]
  assign _T_44 = io_ins[11:8]; // @[immGen.scala 27:92:@182.4]
  assign _T_50 = {_T_25,sign,_T_42,_T_43,_T_44,1'h0}; // @[Cat.scala 30:58:@187.4]
  assign _T_54 = sign ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12:@189.4]
  assign _T_55 = io_ins[31:12]; // @[immGen.scala 28:54:@190.4]
  assign _T_58 = {_T_54,_T_55,12'h0}; // @[Cat.scala 30:58:@192.4]
  assign _T_62 = sign ? 43'h7ffffffffff : 43'h0; // @[Bitwise.scala 72:12:@194.4]
  assign _T_64 = io_ins[19:12]; // @[immGen.scala 29:66:@196.4]
  assign _T_65 = io_ins[20]; // @[immGen.scala 29:81:@197.4]
  assign _T_66 = io_ins[30:21]; // @[immGen.scala 29:93:@198.4]
  assign _T_72 = {_T_62,sign,_T_64,_T_65,_T_66,1'h0}; // @[Cat.scala 30:58:@203.4]
  assign _T_73 = 3'h6 == io_ins_type; // @[Mux.scala 46:19:@204.4]
  assign _T_74 = _T_73 ? _T_72 : 64'h0; // @[Mux.scala 46:16:@205.4]
  assign _T_75 = 3'h5 == io_ins_type; // @[Mux.scala 46:19:@206.4]
  assign _T_76 = _T_75 ? _T_58 : _T_74; // @[Mux.scala 46:16:@207.4]
  assign _T_77 = 3'h4 == io_ins_type; // @[Mux.scala 46:19:@208.4]
  assign _T_78 = _T_77 ? _T_50 : {{1'd0}, _T_76}; // @[Mux.scala 46:16:@209.4]
  assign _T_79 = 3'h3 == io_ins_type; // @[Mux.scala 46:19:@210.4]
  assign _T_80 = _T_79 ? {{1'd0}, _T_36} : _T_78; // @[Mux.scala 46:16:@211.4]
  assign _T_81 = 3'h2 == io_ins_type; // @[Mux.scala 46:19:@212.4]
  assign _T_82 = _T_81 ? {{1'd0}, _T_28} : _T_80; // @[Mux.scala 46:16:@213.4]
  assign _T_83 = 3'h1 == io_ins_type; // @[Mux.scala 46:19:@214.4]
  assign _T_84 = _T_83 ? 65'h0 : _T_82; // @[Mux.scala 46:16:@215.4]
  assign io_imm = _T_84[63:0]; // @[immGen.scala 16:12:@216.4]
endmodule
module ALUGen( // @[:@218.2]
  input  [31:0] io_ins, // @[:@221.4]
  input  [2:0]  io_ins_type, // @[:@221.4]
  output [4:0]  io_ALUOp // @[:@221.4]
);
  wire  _T_34; // @[aluGen.scala 18:38:@223.4]
  wire [2:0] _T_35; // @[aluGen.scala 20:31:@224.4]
  wire  _T_45; // @[Mux.scala 46:19:@225.4]
  wire [4:0] _T_46; // @[Mux.scala 46:16:@226.4]
  wire  _T_47; // @[Mux.scala 46:19:@227.4]
  wire [4:0] _T_48; // @[Mux.scala 46:16:@228.4]
  wire  _T_49; // @[Mux.scala 46:19:@229.4]
  wire [4:0] _T_50; // @[Mux.scala 46:16:@230.4]
  wire  _T_51; // @[Mux.scala 46:19:@231.4]
  wire [4:0] _T_52; // @[Mux.scala 46:16:@232.4]
  wire  _T_53; // @[Mux.scala 46:19:@233.4]
  wire [4:0] _T_54; // @[Mux.scala 46:16:@234.4]
  wire  _T_55; // @[Mux.scala 46:19:@235.4]
  wire [4:0] _T_56; // @[Mux.scala 46:16:@236.4]
  wire  _T_57; // @[Mux.scala 46:19:@237.4]
  wire [4:0] _T_58; // @[Mux.scala 46:16:@238.4]
  wire  _T_59; // @[Mux.scala 46:19:@239.4]
  wire [4:0] _T_60; // @[Mux.scala 46:16:@240.4]
  wire  _T_61; // @[aluGen.scala 34:31:@241.4]
  wire [3:0] _T_63; // @[Cat.scala 30:58:@243.4]
  wire  _T_75; // @[Mux.scala 46:19:@244.4]
  wire [4:0] _T_76; // @[Mux.scala 46:16:@245.4]
  wire  _T_77; // @[Mux.scala 46:19:@246.4]
  wire [4:0] _T_78; // @[Mux.scala 46:16:@247.4]
  wire  _T_79; // @[Mux.scala 46:19:@248.4]
  wire [4:0] _T_80; // @[Mux.scala 46:16:@249.4]
  wire  _T_81; // @[Mux.scala 46:19:@250.4]
  wire [4:0] _T_82; // @[Mux.scala 46:16:@251.4]
  wire  _T_83; // @[Mux.scala 46:19:@252.4]
  wire [4:0] _T_84; // @[Mux.scala 46:16:@253.4]
  wire  _T_85; // @[Mux.scala 46:19:@254.4]
  wire [4:0] _T_86; // @[Mux.scala 46:16:@255.4]
  wire  _T_87; // @[Mux.scala 46:19:@256.4]
  wire [4:0] _T_88; // @[Mux.scala 46:16:@257.4]
  wire  _T_89; // @[Mux.scala 46:19:@258.4]
  wire [4:0] _T_90; // @[Mux.scala 46:16:@259.4]
  wire  _T_91; // @[Mux.scala 46:19:@260.4]
  wire [4:0] _T_92; // @[Mux.scala 46:16:@261.4]
  wire  _T_93; // @[Mux.scala 46:19:@262.4]
  wire [4:0] _T_94; // @[Mux.scala 46:16:@263.4]
  wire [4:0] _T_95; // @[aluGen.scala 18:31:@264.4]
  wire  _T_96; // @[aluGen.scala 51:27:@265.4]
  wire  _T_97; // @[aluGen.scala 51:42:@266.4]
  wire [4:0] _T_100; // @[Cat.scala 30:58:@269.4]
  wire [4:0] _T_110; // @[aluGen.scala 61:38:@271.4]
  wire  _T_117; // @[Mux.scala 46:19:@272.4]
  wire [4:0] _T_118; // @[Mux.scala 46:16:@273.4]
  wire  _T_119; // @[Mux.scala 46:19:@274.4]
  wire [4:0] _T_120; // @[Mux.scala 46:16:@275.4]
  wire  _T_121; // @[Mux.scala 46:19:@276.4]
  wire [4:0] _T_122; // @[Mux.scala 46:16:@277.4]
  wire  _T_123; // @[Mux.scala 46:19:@278.4]
  wire [4:0] _T_124; // @[Mux.scala 46:16:@279.4]
  wire  _T_125; // @[Mux.scala 46:19:@280.4]
  wire [4:0] _T_126; // @[Mux.scala 46:16:@281.4]
  wire  _T_127; // @[Mux.scala 46:19:@282.4]
  wire [4:0] _T_128; // @[Mux.scala 46:16:@283.4]
  wire  _T_129; // @[Mux.scala 46:19:@284.4]
  wire [4:0] _T_130; // @[Mux.scala 46:16:@285.4]
  wire  _T_131; // @[Mux.scala 46:19:@286.4]
  wire [4:0] _T_132; // @[Mux.scala 46:16:@287.4]
  wire  _T_133; // @[Mux.scala 46:19:@288.4]
  wire [4:0] _T_134; // @[Mux.scala 46:16:@289.4]
  wire  _T_135; // @[Mux.scala 46:19:@290.4]
  wire [4:0] _T_136; // @[Mux.scala 46:16:@291.4]
  wire  _T_137; // @[Mux.scala 46:19:@292.4]
  wire [4:0] _T_138; // @[Mux.scala 46:16:@293.4]
  wire  _T_139; // @[Mux.scala 46:19:@294.4]
  wire [4:0] _T_140; // @[Mux.scala 46:16:@295.4]
  wire  _T_141; // @[Mux.scala 46:19:@296.4]
  wire [4:0] _T_142; // @[Mux.scala 46:16:@297.4]
  wire  _T_143; // @[Mux.scala 46:19:@298.4]
  wire [4:0] _T_144; // @[Mux.scala 46:16:@299.4]
  wire  _T_145; // @[Mux.scala 46:19:@300.4]
  wire [4:0] _T_146; // @[Mux.scala 46:16:@301.4]
  wire  _T_147; // @[Mux.scala 46:19:@302.4]
  wire [4:0] _T_148; // @[Mux.scala 46:16:@303.4]
  wire  _T_149; // @[Mux.scala 46:19:@304.4]
  assign _T_34 = io_ins[25]; // @[aluGen.scala 18:38:@223.4]
  assign _T_35 = io_ins[14:12]; // @[aluGen.scala 20:31:@224.4]
  assign _T_45 = 3'h7 == _T_35; // @[Mux.scala 46:19:@225.4]
  assign _T_46 = _T_45 ? 5'h18 : 5'h0; // @[Mux.scala 46:16:@226.4]
  assign _T_47 = 3'h6 == _T_35; // @[Mux.scala 46:19:@227.4]
  assign _T_48 = _T_47 ? 5'h17 : _T_46; // @[Mux.scala 46:16:@228.4]
  assign _T_49 = 3'h5 == _T_35; // @[Mux.scala 46:19:@229.4]
  assign _T_50 = _T_49 ? 5'h15 : _T_48; // @[Mux.scala 46:16:@230.4]
  assign _T_51 = 3'h4 == _T_35; // @[Mux.scala 46:19:@231.4]
  assign _T_52 = _T_51 ? 5'h13 : _T_50; // @[Mux.scala 46:16:@232.4]
  assign _T_53 = 3'h3 == _T_35; // @[Mux.scala 46:19:@233.4]
  assign _T_54 = _T_53 ? 5'h10 : _T_52; // @[Mux.scala 46:16:@234.4]
  assign _T_55 = 3'h2 == _T_35; // @[Mux.scala 46:19:@235.4]
  assign _T_56 = _T_55 ? 5'h11 : _T_54; // @[Mux.scala 46:16:@236.4]
  assign _T_57 = 3'h1 == _T_35; // @[Mux.scala 46:19:@237.4]
  assign _T_58 = _T_57 ? 5'hf : _T_56; // @[Mux.scala 46:16:@238.4]
  assign _T_59 = 3'h0 == _T_35; // @[Mux.scala 46:19:@239.4]
  assign _T_60 = _T_59 ? 5'he : _T_58; // @[Mux.scala 46:16:@240.4]
  assign _T_61 = io_ins[30]; // @[aluGen.scala 34:31:@241.4]
  assign _T_63 = {_T_61,_T_35}; // @[Cat.scala 30:58:@243.4]
  assign _T_75 = 4'h7 == _T_63; // @[Mux.scala 46:19:@244.4]
  assign _T_76 = _T_75 ? 5'h4 : 5'h0; // @[Mux.scala 46:16:@245.4]
  assign _T_77 = 4'h6 == _T_63; // @[Mux.scala 46:19:@246.4]
  assign _T_78 = _T_77 ? 5'h5 : _T_76; // @[Mux.scala 46:16:@247.4]
  assign _T_79 = 4'hd == _T_63; // @[Mux.scala 46:19:@248.4]
  assign _T_80 = _T_79 ? 5'ha : _T_78; // @[Mux.scala 46:16:@249.4]
  assign _T_81 = 4'h5 == _T_63; // @[Mux.scala 46:19:@250.4]
  assign _T_82 = _T_81 ? 5'h9 : _T_80; // @[Mux.scala 46:16:@251.4]
  assign _T_83 = 4'h4 == _T_63; // @[Mux.scala 46:19:@252.4]
  assign _T_84 = _T_83 ? 5'h6 : _T_82; // @[Mux.scala 46:16:@253.4]
  assign _T_85 = 4'h3 == _T_63; // @[Mux.scala 46:19:@254.4]
  assign _T_86 = _T_85 ? 5'hc : _T_84; // @[Mux.scala 46:16:@255.4]
  assign _T_87 = 4'h2 == _T_63; // @[Mux.scala 46:19:@256.4]
  assign _T_88 = _T_87 ? 5'h7 : _T_86; // @[Mux.scala 46:16:@257.4]
  assign _T_89 = 4'h1 == _T_63; // @[Mux.scala 46:19:@258.4]
  assign _T_90 = _T_89 ? 5'h8 : _T_88; // @[Mux.scala 46:16:@259.4]
  assign _T_91 = 4'h8 == _T_63; // @[Mux.scala 46:19:@260.4]
  assign _T_92 = _T_91 ? 5'hb : _T_90; // @[Mux.scala 46:16:@261.4]
  assign _T_93 = 4'h0 == _T_63; // @[Mux.scala 46:19:@262.4]
  assign _T_94 = _T_93 ? 5'h3 : _T_92; // @[Mux.scala 46:16:@263.4]
  assign _T_95 = _T_34 ? _T_60 : _T_94; // @[aluGen.scala 18:31:@264.4]
  assign _T_96 = io_ins[6]; // @[aluGen.scala 51:27:@265.4]
  assign _T_97 = io_ins[4]; // @[aluGen.scala 51:42:@266.4]
  assign _T_100 = {_T_96,_T_97,_T_35}; // @[Cat.scala 30:58:@269.4]
  assign _T_110 = _T_61 ? 5'ha : 5'h9; // @[aluGen.scala 61:38:@271.4]
  assign _T_117 = 5'h1d == _T_100; // @[Mux.scala 46:19:@272.4]
  assign _T_118 = _T_117 ? 5'h1 : 5'h3; // @[Mux.scala 46:16:@273.4]
  assign _T_119 = 5'h19 == _T_100; // @[Mux.scala 46:19:@274.4]
  assign _T_120 = _T_119 ? 5'h1 : _T_118; // @[Mux.scala 46:16:@275.4]
  assign _T_121 = 5'h1f == _T_100; // @[Mux.scala 46:19:@276.4]
  assign _T_122 = _T_121 ? 5'hd : _T_120; // @[Mux.scala 46:16:@277.4]
  assign _T_123 = 5'h1b == _T_100; // @[Mux.scala 46:19:@278.4]
  assign _T_124 = _T_123 ? 5'hd : _T_122; // @[Mux.scala 46:16:@279.4]
  assign _T_125 = 5'h1e == _T_100; // @[Mux.scala 46:19:@280.4]
  assign _T_126 = _T_125 ? 5'h5 : _T_124; // @[Mux.scala 46:16:@281.4]
  assign _T_127 = 5'h1a == _T_100; // @[Mux.scala 46:19:@282.4]
  assign _T_128 = _T_127 ? 5'h5 : _T_126; // @[Mux.scala 46:16:@283.4]
  assign _T_129 = 5'hd == _T_100; // @[Mux.scala 46:19:@284.4]
  assign _T_130 = _T_129 ? _T_110 : _T_128; // @[Mux.scala 46:16:@285.4]
  assign _T_131 = 5'h9 == _T_100; // @[Mux.scala 46:19:@286.4]
  assign _T_132 = _T_131 ? 5'h8 : _T_130; // @[Mux.scala 46:16:@287.4]
  assign _T_133 = 5'hf == _T_100; // @[Mux.scala 46:19:@288.4]
  assign _T_134 = _T_133 ? 5'h4 : _T_132; // @[Mux.scala 46:16:@289.4]
  assign _T_135 = 5'he == _T_100; // @[Mux.scala 46:19:@290.4]
  assign _T_136 = _T_135 ? 5'h5 : _T_134; // @[Mux.scala 46:16:@291.4]
  assign _T_137 = 5'hc == _T_100; // @[Mux.scala 46:19:@292.4]
  assign _T_138 = _T_137 ? 5'h6 : _T_136; // @[Mux.scala 46:16:@293.4]
  assign _T_139 = 5'hb == _T_100; // @[Mux.scala 46:19:@294.4]
  assign _T_140 = _T_139 ? 5'hc : _T_138; // @[Mux.scala 46:16:@295.4]
  assign _T_141 = 5'ha == _T_100; // @[Mux.scala 46:19:@296.4]
  assign _T_142 = _T_141 ? 5'h7 : _T_140; // @[Mux.scala 46:16:@297.4]
  assign _T_143 = 5'h8 == _T_100; // @[Mux.scala 46:19:@298.4]
  assign _T_144 = _T_143 ? 5'h3 : _T_142; // @[Mux.scala 46:16:@299.4]
  assign _T_145 = 3'h2 == io_ins_type; // @[Mux.scala 46:19:@300.4]
  assign _T_146 = _T_145 ? _T_144 : 5'h0; // @[Mux.scala 46:16:@301.4]
  assign _T_147 = 3'h1 == io_ins_type; // @[Mux.scala 46:19:@302.4]
  assign _T_148 = _T_147 ? _T_95 : _T_146; // @[Mux.scala 46:16:@303.4]
  assign _T_149 = 3'h3 == io_ins_type; // @[Mux.scala 46:19:@304.4]
  assign io_ALUOp = _T_149 ? 5'h3 : _T_148; // @[aluGen.scala 13:14:@306.4]
endmodule
module Decoder( // @[:@308.2]
  input  [31:0] io_ins, // @[:@311.4]
  input         io_lastload_valid, // @[:@311.4]
  input  [4:0]  io_lastload_index, // @[:@311.4]
  output        io_loadinfo_valid, // @[:@311.4]
  output [4:0]  io_loadinfo_index, // @[:@311.4]
  output [63:0] io_imm, // @[:@311.4]
  output [4:0]  io_ALUOp, // @[:@311.4]
  output [3:0]  io_exe_type, // @[:@311.4]
  output [3:0]  io_ls_mode, // @[:@311.4]
  output        io_op32, // @[:@311.4]
  output        io_bubble, // @[:@311.4]
  output [4:0]  io_regr_r1, // @[:@311.4]
  output [4:0]  io_regr_r2, // @[:@311.4]
  input  [63:0] io_regr_r1d, // @[:@311.4]
  input  [63:0] io_regr_r2d, // @[:@311.4]
  output        io_dreg_rs2_valid, // @[:@311.4]
  output [63:0] io_dreg_rs1_value, // @[:@311.4]
  output [63:0] io_dreg_rs2_value, // @[:@311.4]
  output        io_dreg_rd_valid, // @[:@311.4]
  output [4:0]  io_dreg_rd_index, // @[:@311.4]
  output [11:0] io_csr_addr, // @[:@311.4]
  input  [63:0] io_csr_rdata, // @[:@311.4]
  input  [1:0]  io_csr_priv, // @[:@311.4]
  output        io_csr_content_valid, // @[:@311.4]
  output [11:0] io_csr_content_csr_idx, // @[:@311.4]
  output [63:0] io_csr_content_csr_data, // @[:@311.4]
  input         io_csr_from_ex_valid, // @[:@311.4]
  input  [11:0] io_csr_from_ex_csr_idx, // @[:@311.4]
  input  [63:0] io_csr_from_ex_csr_data, // @[:@311.4]
  input         io_csr_from_mem_valid, // @[:@311.4]
  input  [11:0] io_csr_from_mem_csr_idx, // @[:@311.4]
  input  [63:0] io_csr_from_mem_csr_data, // @[:@311.4]
  input         io_exWrReg_wbrv, // @[:@311.4]
  input  [4:0]  io_exWrReg_wbri, // @[:@311.4]
  input  [63:0] io_exWrReg_wbrd, // @[:@311.4]
  input         io_memWrReg_wbrv, // @[:@311.4]
  input  [4:0]  io_memWrReg_wbri, // @[:@311.4]
  input  [63:0] io_memWrReg_wbrd, // @[:@311.4]
  input         io_if_excep_valid, // @[:@311.4]
  input  [63:0] io_if_excep_code, // @[:@311.4]
  input  [63:0] io_if_excep_value, // @[:@311.4]
  input  [63:0] io_if_excep_pc, // @[:@311.4]
  input         io_if_excep_inst_valid, // @[:@311.4]
  output        io_ex_excep_valid, // @[:@311.4]
  output [63:0] io_ex_excep_code, // @[:@311.4]
  output [63:0] io_ex_excep_value, // @[:@311.4]
  output [63:0] io_ex_excep_pc, // @[:@311.4]
  output        io_ex_excep_inst_valid, // @[:@311.4]
  output        io_mul_div_ins // @[:@311.4]
);
  wire [31:0] itype_io_ins; // @[decoder.scala 38:23:@313.4]
  wire [2:0] itype_io_ins_type; // @[decoder.scala 38:23:@313.4]
  wire [3:0] itype_io_exe_type; // @[decoder.scala 38:23:@313.4]
  wire  itype_io_op32; // @[decoder.scala 38:23:@313.4]
  wire [31:0] immg_io_ins; // @[decoder.scala 39:22:@316.4]
  wire [2:0] immg_io_ins_type; // @[decoder.scala 39:22:@316.4]
  wire [63:0] immg_io_imm; // @[decoder.scala 39:22:@316.4]
  wire [31:0] alug_io_ins; // @[decoder.scala 40:22:@319.4]
  wire [2:0] alug_io_ins_type; // @[decoder.scala 40:22:@319.4]
  wire [4:0] alug_io_ALUOp; // @[decoder.scala 40:22:@319.4]
  wire [4:0] rs1_index; // @[decoder.scala 52:27:@331.4]
  wire [4:0] rs2_index; // @[decoder.scala 53:27:@332.4]
  wire  _T_181; // @[decoder.scala 55:43:@333.4]
  wire  _T_182; // @[decoder.scala 55:24:@334.4]
  wire  _T_183; // @[decoder.scala 56:45:@335.4]
  wire  _T_184; // @[decoder.scala 56:25:@336.4]
  wire [63:0] _T_186; // @[Mux.scala 31:69:@337.4]
  wire [63:0] rs1_value; // @[Mux.scala 31:69:@338.4]
  wire  _T_187; // @[decoder.scala 60:43:@339.4]
  wire  _T_188; // @[decoder.scala 60:24:@340.4]
  wire  _T_189; // @[decoder.scala 61:45:@341.4]
  wire  _T_190; // @[decoder.scala 61:25:@342.4]
  wire [63:0] _T_192; // @[Mux.scala 31:69:@343.4]
  wire [4:0] rd_index; // @[decoder.scala 64:27:@345.4]
  wire  _T_193; // @[decoder.scala 65:40:@346.4]
  wire  _T_194; // @[decoder.scala 65:77:@347.4]
  wire  _T_195; // @[decoder.scala 65:56:@348.4]
  wire  _T_196; // @[decoder.scala 65:114:@349.4]
  wire  rs2_valid; // @[decoder.scala 65:93:@350.4]
  wire  _T_197; // @[decoder.scala 66:52:@351.4]
  wire  rs1_valid; // @[decoder.scala 66:31:@352.4]
  wire  _T_200; // @[decoder.scala 68:42:@355.4]
  wire  _T_201; // @[decoder.scala 68:100:@356.4]
  wire  _T_202; // @[decoder.scala 68:79:@357.4]
  wire  _T_203; // @[decoder.scala 68:137:@358.4]
  wire  _T_204; // @[decoder.scala 68:116:@359.4]
  wire  _T_206; // @[decoder.scala 69:17:@360.4]
  wire  _T_207; // @[decoder.scala 68:154:@361.4]
  wire  _T_208; // @[decoder.scala 69:47:@362.4]
  wire  _T_209; // @[decoder.scala 71:27:@364.4]
  wire  _T_210; // @[decoder.scala 72:20:@365.4]
  wire  _T_212; // @[decoder.scala 72:13:@366.4]
  wire [2:0] _T_213; // @[decoder.scala 72:31:@367.4]
  wire [3:0] _T_214; // @[Cat.scala 30:58:@368.4]
  wire [3:0] ls_mode; // @[decoder.scala 70:24:@369.4]
  wire  _T_215; // @[decoder.scala 75:75:@370.4]
  wire  _T_216; // @[decoder.scala 75:54:@371.4]
  wire  _T_217; // @[decoder.scala 75:125:@372.4]
  wire  _T_218; // @[decoder.scala 75:104:@373.4]
  wire  _T_219; // @[decoder.scala 75:90:@374.4]
  wire  _T_220; // @[decoder.scala 78:28:@376.4]
  wire  _T_222; // @[decoder.scala 78:53:@377.4]
  wire  _T_223; // @[decoder.scala 78:40:@378.4]
  wire  _T_225; // @[decoder.scala 79:28:@379.4]
  wire  _T_230; // @[decoder.scala 94:38:@391.4]
  wire  _T_231; // @[decoder.scala 94:61:@392.4]
  wire  _T_233; // @[decoder.scala 98:32:@397.4]
  wire  _T_234; // @[decoder.scala 98:59:@398.4]
  wire  _T_238; // @[decoder.scala 105:22:@406.4]
  wire  _T_239; // @[decoder.scala 105:49:@407.4]
  wire  _T_240; // @[decoder.scala 106:22:@408.4]
  wire  _T_241; // @[decoder.scala 106:50:@409.4]
  wire [63:0] _T_243; // @[Mux.scala 31:69:@410.4]
  wire  _T_245; // @[decoder.scala 111:28:@418.4]
  wire  _T_246; // @[decoder.scala 111:41:@419.4]
  wire [6:0] _T_247; // @[decoder.scala 112:29:@421.6]
  wire  _T_250; // @[decoder.scala 114:22:@423.6]
  wire  _T_252; // @[decoder.scala 115:16:@425.8]
  wire  _T_257; // @[decoder.scala 118:49:@429.10]
  wire  _T_259; // @[decoder.scala 119:29:@430.10]
  wire [4:0] _T_293; // @[decoder.scala 119:18:@431.10]
  wire [4:0] _T_294; // @[decoder.scala 118:36:@432.10]
  wire  _GEN_0; // @[decoder.scala 115:35:@426.8]
  wire [63:0] _GEN_1; // @[decoder.scala 115:35:@426.8]
  wire [63:0] _GEN_2; // @[decoder.scala 115:35:@426.8]
  wire  _T_298; // @[Conditional.scala 37:30:@439.10]
  wire [3:0] _GEN_17; // @[Const.scala 66:31:@443.12]
  wire [3:0] _T_302; // @[Const.scala 66:31:@443.12]
  wire  _T_304; // @[Conditional.scala 37:30:@447.12]
  wire  _T_307; // @[Conditional.scala 37:30:@453.14]
  wire [1:0] _T_308; // @[decoder.scala 134:33:@455.16]
  wire  _T_310; // @[decoder.scala 136:53:@457.16]
  wire [4:0] _GEN_18; // @[Const.scala 67:30:@459.16]
  wire [4:0] _T_313; // @[Const.scala 67:30:@459.16]
  wire [4:0] _T_314; // @[decoder.scala 136:40:@460.16]
  wire  _GEN_3; // @[Conditional.scala 39:67:@454.14]
  wire [63:0] _GEN_4; // @[Conditional.scala 39:67:@454.14]
  wire  _GEN_5; // @[Conditional.scala 39:67:@448.12]
  wire [63:0] _GEN_6; // @[Conditional.scala 39:67:@448.12]
  wire  _GEN_7; // @[Conditional.scala 40:58:@440.10]
  wire [63:0] _GEN_8; // @[Conditional.scala 40:58:@440.10]
  wire  _GEN_9; // @[decoder.scala 123:35:@438.8]
  wire [63:0] _GEN_10; // @[decoder.scala 123:35:@438.8]
  wire  _GEN_11; // @[decoder.scala 114:49:@424.6]
  wire [63:0] _GEN_12; // @[decoder.scala 114:49:@424.6]
  wire [63:0] _GEN_13; // @[decoder.scala 114:49:@424.6]
  InsType itype ( // @[decoder.scala 38:23:@313.4]
    .io_ins(itype_io_ins),
    .io_ins_type(itype_io_ins_type),
    .io_exe_type(itype_io_exe_type),
    .io_op32(itype_io_op32)
  );
  ImmGen immg ( // @[decoder.scala 39:22:@316.4]
    .io_ins(immg_io_ins),
    .io_ins_type(immg_io_ins_type),
    .io_imm(immg_io_imm)
  );
  ALUGen alug ( // @[decoder.scala 40:22:@319.4]
    .io_ins(alug_io_ins),
    .io_ins_type(alug_io_ins_type),
    .io_ALUOp(alug_io_ALUOp)
  );
  assign rs1_index = io_ins[19:15]; // @[decoder.scala 52:27:@331.4]
  assign rs2_index = io_ins[24:20]; // @[decoder.scala 53:27:@332.4]
  assign _T_181 = io_exWrReg_wbri == rs1_index; // @[decoder.scala 55:43:@333.4]
  assign _T_182 = io_exWrReg_wbrv & _T_181; // @[decoder.scala 55:24:@334.4]
  assign _T_183 = io_memWrReg_wbri == rs1_index; // @[decoder.scala 56:45:@335.4]
  assign _T_184 = io_memWrReg_wbrv & _T_183; // @[decoder.scala 56:25:@336.4]
  assign _T_186 = _T_184 ? io_memWrReg_wbrd : io_regr_r1d; // @[Mux.scala 31:69:@337.4]
  assign rs1_value = _T_182 ? io_exWrReg_wbrd : _T_186; // @[Mux.scala 31:69:@338.4]
  assign _T_187 = io_exWrReg_wbri == rs2_index; // @[decoder.scala 60:43:@339.4]
  assign _T_188 = io_exWrReg_wbrv & _T_187; // @[decoder.scala 60:24:@340.4]
  assign _T_189 = io_memWrReg_wbri == rs2_index; // @[decoder.scala 61:45:@341.4]
  assign _T_190 = io_memWrReg_wbrv & _T_189; // @[decoder.scala 61:25:@342.4]
  assign _T_192 = _T_190 ? io_memWrReg_wbrd : io_regr_r2d; // @[Mux.scala 31:69:@343.4]
  assign rd_index = io_ins[11:7]; // @[decoder.scala 64:27:@345.4]
  assign _T_193 = itype_io_ins_type == 3'h1; // @[decoder.scala 65:40:@346.4]
  assign _T_194 = itype_io_ins_type == 3'h3; // @[decoder.scala 65:77:@347.4]
  assign _T_195 = _T_193 | _T_194; // @[decoder.scala 65:56:@348.4]
  assign _T_196 = itype_io_ins_type == 3'h4; // @[decoder.scala 65:114:@349.4]
  assign rs2_valid = _T_195 | _T_196; // @[decoder.scala 65:93:@350.4]
  assign _T_197 = itype_io_ins_type == 3'h2; // @[decoder.scala 66:52:@351.4]
  assign rs1_valid = rs2_valid | _T_197; // @[decoder.scala 66:31:@352.4]
  assign _T_200 = _T_193 | _T_197; // @[decoder.scala 68:42:@355.4]
  assign _T_201 = itype_io_ins_type == 3'h5; // @[decoder.scala 68:100:@356.4]
  assign _T_202 = _T_200 | _T_201; // @[decoder.scala 68:79:@357.4]
  assign _T_203 = itype_io_ins_type == 3'h6; // @[decoder.scala 68:137:@358.4]
  assign _T_204 = _T_202 | _T_203; // @[decoder.scala 68:116:@359.4]
  assign _T_206 = rd_index != 5'h0; // @[decoder.scala 69:17:@360.4]
  assign _T_207 = _T_204 & _T_206; // @[decoder.scala 68:154:@361.4]
  assign _T_208 = itype_io_exe_type != 4'h1; // @[decoder.scala 69:47:@362.4]
  assign _T_209 = itype_io_exe_type == 4'h2; // @[decoder.scala 71:27:@364.4]
  assign _T_210 = io_ins[5]; // @[decoder.scala 72:20:@365.4]
  assign _T_212 = _T_210 == 1'h0; // @[decoder.scala 72:13:@366.4]
  assign _T_213 = io_ins[14:12]; // @[decoder.scala 72:31:@367.4]
  assign _T_214 = {_T_212,_T_213}; // @[Cat.scala 30:58:@368.4]
  assign ls_mode = _T_209 ? _T_214 : 4'hf; // @[decoder.scala 70:24:@369.4]
  assign _T_215 = io_lastload_index == rs1_index; // @[decoder.scala 75:75:@370.4]
  assign _T_216 = rs1_valid & _T_215; // @[decoder.scala 75:54:@371.4]
  assign _T_217 = io_lastload_index == rs2_index; // @[decoder.scala 75:125:@372.4]
  assign _T_218 = rs2_valid & _T_217; // @[decoder.scala 75:104:@373.4]
  assign _T_219 = _T_216 | _T_218; // @[decoder.scala 75:90:@374.4]
  assign _T_220 = itype_io_exe_type == 4'h6; // @[decoder.scala 78:28:@376.4]
  assign _T_222 = rs1_index != 5'h0; // @[decoder.scala 78:53:@377.4]
  assign _T_223 = _T_220 & _T_222; // @[decoder.scala 78:40:@378.4]
  assign _T_225 = itype_io_exe_type == 4'h7; // @[decoder.scala 79:28:@379.4]
  assign _T_230 = ls_mode != 4'hf; // @[decoder.scala 94:38:@391.4]
  assign _T_231 = ls_mode[3]; // @[decoder.scala 94:61:@392.4]
  assign _T_233 = io_ins[25]; // @[decoder.scala 98:32:@397.4]
  assign _T_234 = itype_io_exe_type == 4'h0; // @[decoder.scala 98:59:@398.4]
  assign _T_238 = io_csr_addr == io_csr_from_ex_csr_idx; // @[decoder.scala 105:22:@406.4]
  assign _T_239 = _T_238 & io_csr_from_ex_valid; // @[decoder.scala 105:49:@407.4]
  assign _T_240 = io_csr_addr == io_csr_from_mem_csr_idx; // @[decoder.scala 106:22:@408.4]
  assign _T_241 = _T_240 & io_csr_from_mem_valid; // @[decoder.scala 106:50:@409.4]
  assign _T_243 = _T_241 ? io_csr_from_mem_csr_data : io_csr_rdata; // @[Mux.scala 31:69:@410.4]
  assign _T_245 = itype_io_exe_type == 4'h1; // @[decoder.scala 111:28:@418.4]
  assign _T_246 = _T_245 & io_if_excep_inst_valid; // @[decoder.scala 111:41:@419.4]
  assign _T_247 = io_ins[31:25]; // @[decoder.scala 112:29:@421.6]
  assign _T_250 = _T_247 == 7'h9; // @[decoder.scala 114:22:@423.6]
  assign _T_252 = io_if_excep_valid == 1'h0; // @[decoder.scala 115:16:@425.8]
  assign _T_257 = io_csr_priv >= 2'h1; // @[decoder.scala 118:49:@429.10]
  assign _T_259 = rs1_index == 5'h0; // @[decoder.scala 119:29:@430.10]
  assign _T_293 = _T_259 ? 5'h15 : 5'h14; // @[decoder.scala 119:18:@431.10]
  assign _T_294 = _T_257 ? _T_293 : 5'h2; // @[decoder.scala 118:36:@432.10]
  assign _GEN_0 = _T_252 ? 1'h1 : io_if_excep_valid; // @[decoder.scala 115:35:@426.8]
  assign _GEN_1 = _T_252 ? rs1_value : io_if_excep_value; // @[decoder.scala 115:35:@426.8]
  assign _GEN_2 = _T_252 ? {{59'd0}, _T_294} : io_if_excep_code; // @[decoder.scala 115:35:@426.8]
  assign _T_298 = 5'h0 == rs2_index; // @[Conditional.scala 37:30:@439.10]
  assign _GEN_17 = {{2'd0}, io_csr_priv}; // @[Const.scala 66:31:@443.12]
  assign _T_302 = 4'h8 | _GEN_17; // @[Const.scala 66:31:@443.12]
  assign _T_304 = 5'h1 == rs2_index; // @[Conditional.scala 37:30:@447.12]
  assign _T_307 = 5'h2 == rs2_index; // @[Conditional.scala 37:30:@453.14]
  assign _T_308 = io_ins[29:28]; // @[decoder.scala 134:33:@455.16]
  assign _T_310 = io_csr_priv >= _T_308; // @[decoder.scala 136:53:@457.16]
  assign _GEN_18 = {{3'd0}, _T_308}; // @[Const.scala 67:30:@459.16]
  assign _T_313 = 5'h10 | _GEN_18; // @[Const.scala 67:30:@459.16]
  assign _T_314 = _T_310 ? _T_313 : 5'h2; // @[decoder.scala 136:40:@460.16]
  assign _GEN_3 = _T_307 ? 1'h1 : io_if_excep_valid; // @[Conditional.scala 39:67:@454.14]
  assign _GEN_4 = _T_307 ? {{59'd0}, _T_314} : io_if_excep_code; // @[Conditional.scala 39:67:@454.14]
  assign _GEN_5 = _T_304 ? 1'h1 : _GEN_3; // @[Conditional.scala 39:67:@448.12]
  assign _GEN_6 = _T_304 ? 64'h3 : _GEN_4; // @[Conditional.scala 39:67:@448.12]
  assign _GEN_7 = _T_298 ? 1'h1 : _GEN_5; // @[Conditional.scala 40:58:@440.10]
  assign _GEN_8 = _T_298 ? {{60'd0}, _T_302} : _GEN_6; // @[Conditional.scala 40:58:@440.10]
  assign _GEN_9 = _T_252 ? _GEN_7 : io_if_excep_valid; // @[decoder.scala 123:35:@438.8]
  assign _GEN_10 = _T_252 ? _GEN_8 : io_if_excep_code; // @[decoder.scala 123:35:@438.8]
  assign _GEN_11 = _T_250 ? _GEN_0 : _GEN_9; // @[decoder.scala 114:49:@424.6]
  assign _GEN_12 = _T_250 ? _GEN_1 : io_if_excep_value; // @[decoder.scala 114:49:@424.6]
  assign _GEN_13 = _T_250 ? _GEN_2 : _GEN_10; // @[decoder.scala 114:49:@424.6]
  assign io_loadinfo_valid = _T_230 & _T_231; // @[decoder.scala 94:27:@394.4]
  assign io_loadinfo_index = io_ins[11:7]; // @[decoder.scala 95:27:@395.4]
  assign io_imm = immg_io_imm; // @[decoder.scala 47:23:@327.4]
  assign io_ALUOp = alug_io_ALUOp; // @[decoder.scala 48:23:@328.4]
  assign io_exe_type = itype_io_exe_type; // @[decoder.scala 49:23:@329.4]
  assign io_ls_mode = _T_209 ? _T_214 : 4'hf; // @[decoder.scala 93:23:@390.4]
  assign io_op32 = itype_io_op32; // @[decoder.scala 50:23:@330.4]
  assign io_bubble = io_lastload_valid & _T_219; // @[decoder.scala 96:23:@396.4]
  assign io_regr_r1 = io_ins[19:15]; // @[decoder.scala 88:23:@386.4]
  assign io_regr_r2 = io_ins[24:20]; // @[decoder.scala 89:23:@387.4]
  assign io_dreg_rs2_valid = _T_195 | _T_196; // @[decoder.scala 84:23:@382.4]
  assign io_dreg_rs1_value = _T_182 ? io_exWrReg_wbrd : _T_186; // @[decoder.scala 90:23:@388.4]
  assign io_dreg_rs2_value = _T_188 ? io_exWrReg_wbrd : _T_192; // @[decoder.scala 91:23:@389.4]
  assign io_dreg_rd_valid = _T_207 & _T_208; // @[decoder.scala 86:23:@384.4]
  assign io_dreg_rd_index = io_ins[11:7]; // @[decoder.scala 87:23:@385.4]
  assign io_csr_addr = io_ins[31:20]; // @[decoder.scala 100:23:@402.4]
  assign io_csr_content_valid = _T_223 ? 1'h1 : _T_225; // @[decoder.scala 101:29:@403.4]
  assign io_csr_content_csr_idx = io_ins[31:20]; // @[decoder.scala 102:32:@405.4]
  assign io_csr_content_csr_data = _T_239 ? io_csr_from_ex_csr_data : _T_243; // @[decoder.scala 104:29:@412.4]
  assign io_ex_excep_valid = _T_246 ? _GEN_11 : io_if_excep_valid; // @[decoder.scala 110:17:@417.4 decoder.scala 116:31:@427.10 decoder.scala 126:35:@441.12 decoder.scala 130:35:@449.14 decoder.scala 135:35:@456.16]
  assign io_ex_excep_code = _T_246 ? _GEN_13 : io_if_excep_code; // @[decoder.scala 110:17:@416.4 decoder.scala 118:30:@433.10 decoder.scala 127:34:@444.12 decoder.scala 131:34:@450.14 decoder.scala 136:34:@461.16]
  assign io_ex_excep_value = _T_246 ? _GEN_12 : io_if_excep_value; // @[decoder.scala 110:17:@415.4 decoder.scala 117:31:@428.10]
  assign io_ex_excep_pc = io_if_excep_pc; // @[decoder.scala 110:17:@414.4]
  assign io_ex_excep_inst_valid = io_if_excep_inst_valid; // @[decoder.scala 110:17:@413.4]
  assign io_mul_div_ins = _T_233 & _T_234; // @[decoder.scala 98:23:@400.4]
  assign itype_io_ins = io_ins; // @[decoder.scala 42:23:@322.4]
  assign immg_io_ins = io_ins; // @[decoder.scala 43:23:@323.4]
  assign immg_io_ins_type = itype_io_ins_type; // @[decoder.scala 45:23:@325.4]
  assign alug_io_ins = io_ins; // @[decoder.scala 44:23:@324.4]
  assign alug_io_ins_type = itype_io_ins_type; // @[decoder.scala 46:23:@326.4]
endmodule
module ALU( // @[:@467.2]
  input  [4:0]  io_ALUOp, // @[:@470.4]
  input         io_op32, // @[:@470.4]
  input  [63:0] io_inputA, // @[:@470.4]
  input  [63:0] io_inputB, // @[:@470.4]
  output [63:0] io_output // @[:@470.4]
);
  wire [5:0] shamt; // @[alu.scala 40:26:@472.4]
  wire [4:0] shamt32; // @[alu.scala 41:28:@473.4]
  wire [31:0] inputA32; // @[alu.scala 42:29:@474.4]
  wire [31:0] inputB32; // @[alu.scala 43:29:@475.4]
  wire [32:0] _T_16; // @[alu.scala 48:39:@476.4]
  wire [31:0] _T_17; // @[alu.scala 48:39:@477.4]
  wire [62:0] _GEN_0; // @[alu.scala 49:39:@478.4]
  wire [62:0] _T_18; // @[alu.scala 49:39:@478.4]
  wire [31:0] _T_19; // @[alu.scala 50:38:@479.4]
  wire [31:0] _T_20; // @[alu.scala 51:40:@480.4]
  wire [31:0] _T_21; // @[alu.scala 51:47:@481.4]
  wire [31:0] _T_22; // @[alu.scala 51:59:@482.4]
  wire [32:0] _T_23; // @[alu.scala 52:39:@483.4]
  wire [32:0] _T_24; // @[alu.scala 52:39:@484.4]
  wire [31:0] _T_25; // @[alu.scala 52:39:@485.4]
  wire [63:0] _T_26; // @[alu.scala 53:40:@486.4]
  wire [31:0] _T_27; // @[alu.scala 53:51:@487.4]
  wire [31:0] _T_29; // @[alu.scala 54:58:@489.4]
  wire [32:0] _T_30; // @[alu.scala 54:47:@490.4]
  wire [31:0] _T_31; // @[alu.scala 54:65:@491.4]
  wire [31:0] _T_32; // @[alu.scala 55:41:@492.4]
  wire [31:0] _GEN_3; // @[alu.scala 56:48:@496.4]
  wire [31:0] _T_36; // @[alu.scala 56:48:@496.4]
  wire [31:0] _T_37; // @[alu.scala 56:67:@497.4]
  wire [31:0] _GEN_4; // @[alu.scala 57:41:@498.4]
  wire [31:0] _T_38; // @[alu.scala 57:41:@498.4]
  wire  _T_40; // @[Mux.scala 46:19:@500.4]
  wire [31:0] _T_41; // @[Mux.scala 46:16:@501.4]
  wire  _T_42; // @[Mux.scala 46:19:@502.4]
  wire [31:0] _T_43; // @[Mux.scala 46:16:@503.4]
  wire  _T_44; // @[Mux.scala 46:19:@504.4]
  wire [31:0] _T_45; // @[Mux.scala 46:16:@505.4]
  wire  _T_46; // @[Mux.scala 46:19:@506.4]
  wire [31:0] _T_47; // @[Mux.scala 46:16:@507.4]
  wire  _T_48; // @[Mux.scala 46:19:@508.4]
  wire [31:0] _T_49; // @[Mux.scala 46:16:@509.4]
  wire  _T_50; // @[Mux.scala 46:19:@510.4]
  wire [31:0] _T_51; // @[Mux.scala 46:16:@511.4]
  wire  _T_52; // @[Mux.scala 46:19:@512.4]
  wire [31:0] _T_53; // @[Mux.scala 46:16:@513.4]
  wire  _T_54; // @[Mux.scala 46:19:@514.4]
  wire [31:0] _T_55; // @[Mux.scala 46:16:@515.4]
  wire  _T_56; // @[Mux.scala 46:19:@516.4]
  wire [62:0] _T_57; // @[Mux.scala 46:16:@517.4]
  wire  _T_58; // @[Mux.scala 46:19:@518.4]
  wire [62:0] op32res; // @[Mux.scala 46:16:@519.4]
  wire  _T_59; // @[alu.scala 61:29:@520.4]
  wire [31:0] _T_63; // @[Bitwise.scala 72:12:@522.4]
  wire [31:0] _T_64; // @[alu.scala 61:43:@523.4]
  wire [63:0] _T_65; // @[Cat.scala 30:58:@524.4]
  wire [64:0] _T_68; // @[alu.scala 69:44:@525.4]
  wire [63:0] _T_69; // @[alu.scala 69:44:@526.4]
  wire [63:0] _T_70; // @[alu.scala 70:44:@527.4]
  wire [63:0] _T_71; // @[alu.scala 71:43:@528.4]
  wire [63:0] _T_72; // @[alu.scala 72:44:@529.4]
  wire  _T_73; // @[alu.scala 73:46:@530.4]
  wire [63:0] _T_74; // @[alu.scala 74:45:@531.4]
  wire [63:0] _T_75; // @[alu.scala 74:64:@532.4]
  wire  _T_76; // @[alu.scala 74:52:@533.4]
  wire [126:0] _GEN_1; // @[alu.scala 75:44:@534.4]
  wire [126:0] _T_77; // @[alu.scala 75:44:@534.4]
  wire [63:0] _T_78; // @[alu.scala 76:43:@535.4]
  wire [63:0] _T_80; // @[alu.scala 77:52:@537.4]
  wire [63:0] _T_81; // @[alu.scala 77:62:@538.4]
  wire [64:0] _T_82; // @[alu.scala 78:44:@539.4]
  wire [64:0] _T_83; // @[alu.scala 78:44:@540.4]
  wire [63:0] _T_84; // @[alu.scala 78:44:@541.4]
  wire [63:0] _T_85; // @[alu.scala 79:34:@542.4]
  wire [63:0] _T_86; // @[alu.scala 79:45:@543.4]
  wire [127:0] _T_89; // @[alu.scala 80:52:@546.4]
  wire [63:0] _T_90; // @[alu.scala 80:71:@547.4]
  wire [63:0] _T_94; // @[alu.scala 81:72:@551.4]
  wire [127:0] _T_95; // @[alu.scala 82:47:@552.4]
  wire [63:0] _T_96; // @[alu.scala 82:59:@553.4]
  wire [64:0] _T_98; // @[alu.scala 83:55:@555.4]
  wire [64:0] _GEN_2; // @[alu.scala 83:55:@556.4]
  wire [128:0] _T_99; // @[alu.scala 83:55:@556.4]
  wire [127:0] _T_100; // @[alu.scala 83:55:@557.4]
  wire [127:0] _T_101; // @[alu.scala 83:55:@558.4]
  wire [63:0] _T_102; // @[alu.scala 83:67:@559.4]
  wire [64:0] _T_105; // @[alu.scala 84:52:@562.4]
  wire [64:0] _T_106; // @[alu.scala 84:72:@563.4]
  wire [63:0] _T_107; // @[alu.scala 85:46:@564.4]
  wire [63:0] _GEN_5; // @[alu.scala 86:53:@567.4]
  wire [63:0] _T_110; // @[alu.scala 86:53:@567.4]
  wire [63:0] _T_111; // @[alu.scala 86:74:@568.4]
  wire [63:0] _GEN_6; // @[alu.scala 87:46:@569.4]
  wire [63:0] _T_112; // @[alu.scala 87:46:@569.4]
  wire [63:0] _T_114; // @[Mux.scala 46:16:@571.4]
  wire [63:0] _T_116; // @[Mux.scala 46:16:@573.4]
  wire [63:0] _T_118; // @[Mux.scala 46:16:@575.4]
  wire [64:0] _T_120; // @[Mux.scala 46:16:@577.4]
  wire  _T_121; // @[Mux.scala 46:19:@578.4]
  wire [64:0] _T_122; // @[Mux.scala 46:16:@579.4]
  wire  _T_123; // @[Mux.scala 46:19:@580.4]
  wire [64:0] _T_124; // @[Mux.scala 46:16:@581.4]
  wire  _T_125; // @[Mux.scala 46:19:@582.4]
  wire [64:0] _T_126; // @[Mux.scala 46:16:@583.4]
  wire [64:0] _T_128; // @[Mux.scala 46:16:@585.4]
  wire  _T_129; // @[Mux.scala 46:19:@586.4]
  wire [64:0] _T_130; // @[Mux.scala 46:16:@587.4]
  wire [64:0] _T_132; // @[Mux.scala 46:16:@589.4]
  wire [64:0] _T_134; // @[Mux.scala 46:16:@591.4]
  wire [64:0] _T_136; // @[Mux.scala 46:16:@593.4]
  wire [126:0] _T_138; // @[Mux.scala 46:16:@595.4]
  wire  _T_139; // @[Mux.scala 46:19:@596.4]
  wire [126:0] _T_140; // @[Mux.scala 46:16:@597.4]
  wire  _T_141; // @[Mux.scala 46:19:@598.4]
  wire [126:0] _T_142; // @[Mux.scala 46:16:@599.4]
  wire  _T_143; // @[Mux.scala 46:19:@600.4]
  wire [126:0] _T_144; // @[Mux.scala 46:16:@601.4]
  wire  _T_145; // @[Mux.scala 46:19:@602.4]
  wire [126:0] _T_146; // @[Mux.scala 46:16:@603.4]
  wire  _T_147; // @[Mux.scala 46:19:@604.4]
  wire [126:0] _T_148; // @[Mux.scala 46:16:@605.4]
  wire [126:0] _T_150; // @[Mux.scala 46:16:@607.4]
  wire  _T_151; // @[Mux.scala 46:19:@608.4]
  wire [126:0] _T_152; // @[Mux.scala 46:16:@609.4]
  wire  _T_153; // @[Mux.scala 46:19:@610.4]
  wire [126:0] _T_154; // @[Mux.scala 46:16:@611.4]
  wire  _T_155; // @[Mux.scala 46:19:@612.4]
  wire [126:0] _T_156; // @[Mux.scala 46:16:@613.4]
  wire [126:0] _T_157; // @[alu.scala 60:21:@614.4]
  assign shamt = io_inputB[5:0]; // @[alu.scala 40:26:@472.4]
  assign shamt32 = io_inputB[4:0]; // @[alu.scala 41:28:@473.4]
  assign inputA32 = io_inputA[31:0]; // @[alu.scala 42:29:@474.4]
  assign inputB32 = io_inputB[31:0]; // @[alu.scala 43:29:@475.4]
  assign _T_16 = inputA32 + inputB32; // @[alu.scala 48:39:@476.4]
  assign _T_17 = inputA32 + inputB32; // @[alu.scala 48:39:@477.4]
  assign _GEN_0 = {{31'd0}, inputA32}; // @[alu.scala 49:39:@478.4]
  assign _T_18 = _GEN_0 << shamt32; // @[alu.scala 49:39:@478.4]
  assign _T_19 = inputA32 >> shamt32; // @[alu.scala 50:38:@479.4]
  assign _T_20 = $signed(inputA32); // @[alu.scala 51:40:@480.4]
  assign _T_21 = $signed(_T_20) >>> shamt32; // @[alu.scala 51:47:@481.4]
  assign _T_22 = $unsigned(_T_21); // @[alu.scala 51:59:@482.4]
  assign _T_23 = inputA32 - inputB32; // @[alu.scala 52:39:@483.4]
  assign _T_24 = $unsigned(_T_23); // @[alu.scala 52:39:@484.4]
  assign _T_25 = _T_24[31:0]; // @[alu.scala 52:39:@485.4]
  assign _T_26 = inputA32 * inputB32; // @[alu.scala 53:40:@486.4]
  assign _T_27 = _T_26[31:0]; // @[alu.scala 53:51:@487.4]
  assign _T_29 = $signed(inputB32); // @[alu.scala 54:58:@489.4]
  assign _T_30 = $signed(_T_20) / $signed(_T_29); // @[alu.scala 54:47:@490.4]
  assign _T_31 = _T_30[31:0]; // @[alu.scala 54:65:@491.4]
  assign _T_32 = inputA32 / inputB32; // @[alu.scala 55:41:@492.4]
  assign _GEN_3 = $signed(_T_20) % $signed(_T_29); // @[alu.scala 56:48:@496.4]
  assign _T_36 = _GEN_3[31:0]; // @[alu.scala 56:48:@496.4]
  assign _T_37 = $unsigned(_T_36); // @[alu.scala 56:67:@497.4]
  assign _GEN_4 = inputA32 % inputB32; // @[alu.scala 57:41:@498.4]
  assign _T_38 = _GEN_4[31:0]; // @[alu.scala 57:41:@498.4]
  assign _T_40 = 5'h18 == io_ALUOp; // @[Mux.scala 46:19:@500.4]
  assign _T_41 = _T_40 ? _T_38 : 32'h0; // @[Mux.scala 46:16:@501.4]
  assign _T_42 = 5'h17 == io_ALUOp; // @[Mux.scala 46:19:@502.4]
  assign _T_43 = _T_42 ? _T_37 : _T_41; // @[Mux.scala 46:16:@503.4]
  assign _T_44 = 5'h15 == io_ALUOp; // @[Mux.scala 46:19:@504.4]
  assign _T_45 = _T_44 ? _T_32 : _T_43; // @[Mux.scala 46:16:@505.4]
  assign _T_46 = 5'h13 == io_ALUOp; // @[Mux.scala 46:19:@506.4]
  assign _T_47 = _T_46 ? _T_31 : _T_45; // @[Mux.scala 46:16:@507.4]
  assign _T_48 = 5'he == io_ALUOp; // @[Mux.scala 46:19:@508.4]
  assign _T_49 = _T_48 ? _T_27 : _T_47; // @[Mux.scala 46:16:@509.4]
  assign _T_50 = 5'hb == io_ALUOp; // @[Mux.scala 46:19:@510.4]
  assign _T_51 = _T_50 ? _T_25 : _T_49; // @[Mux.scala 46:16:@511.4]
  assign _T_52 = 5'ha == io_ALUOp; // @[Mux.scala 46:19:@512.4]
  assign _T_53 = _T_52 ? _T_22 : _T_51; // @[Mux.scala 46:16:@513.4]
  assign _T_54 = 5'h9 == io_ALUOp; // @[Mux.scala 46:19:@514.4]
  assign _T_55 = _T_54 ? _T_19 : _T_53; // @[Mux.scala 46:16:@515.4]
  assign _T_56 = 5'h8 == io_ALUOp; // @[Mux.scala 46:19:@516.4]
  assign _T_57 = _T_56 ? _T_18 : {{31'd0}, _T_55}; // @[Mux.scala 46:16:@517.4]
  assign _T_58 = 5'h3 == io_ALUOp; // @[Mux.scala 46:19:@518.4]
  assign op32res = _T_58 ? {{31'd0}, _T_17} : _T_57; // @[Mux.scala 46:16:@519.4]
  assign _T_59 = op32res[31]; // @[alu.scala 61:29:@520.4]
  assign _T_63 = _T_59 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12:@522.4]
  assign _T_64 = op32res[31:0]; // @[alu.scala 61:43:@523.4]
  assign _T_65 = {_T_63,_T_64}; // @[Cat.scala 30:58:@524.4]
  assign _T_68 = io_inputA + io_inputB; // @[alu.scala 69:44:@525.4]
  assign _T_69 = io_inputA + io_inputB; // @[alu.scala 69:44:@526.4]
  assign _T_70 = io_inputA & io_inputB; // @[alu.scala 70:44:@527.4]
  assign _T_71 = io_inputA | io_inputB; // @[alu.scala 71:43:@528.4]
  assign _T_72 = io_inputA ^ io_inputB; // @[alu.scala 72:44:@529.4]
  assign _T_73 = io_inputA < io_inputB; // @[alu.scala 73:46:@530.4]
  assign _T_74 = $signed(io_inputA); // @[alu.scala 74:45:@531.4]
  assign _T_75 = $signed(io_inputB); // @[alu.scala 74:64:@532.4]
  assign _T_76 = $signed(_T_74) < $signed(_T_75); // @[alu.scala 74:52:@533.4]
  assign _GEN_1 = {{63'd0}, io_inputA}; // @[alu.scala 75:44:@534.4]
  assign _T_77 = _GEN_1 << shamt; // @[alu.scala 75:44:@534.4]
  assign _T_78 = io_inputA >> shamt; // @[alu.scala 76:43:@535.4]
  assign _T_80 = $signed(_T_74) >>> shamt; // @[alu.scala 77:52:@537.4]
  assign _T_81 = $unsigned(_T_80); // @[alu.scala 77:62:@538.4]
  assign _T_82 = io_inputA - io_inputB; // @[alu.scala 78:44:@539.4]
  assign _T_83 = $unsigned(_T_82); // @[alu.scala 78:44:@540.4]
  assign _T_84 = _T_83[63:0]; // @[alu.scala 78:44:@541.4]
  assign _T_85 = ~ io_inputA; // @[alu.scala 79:34:@542.4]
  assign _T_86 = _T_85 & io_inputB; // @[alu.scala 79:45:@543.4]
  assign _T_89 = $signed(_T_74) * $signed(_T_75); // @[alu.scala 80:52:@546.4]
  assign _T_90 = _T_89[63:0]; // @[alu.scala 80:71:@547.4]
  assign _T_94 = _T_89[127:64]; // @[alu.scala 81:72:@551.4]
  assign _T_95 = io_inputA * io_inputB; // @[alu.scala 82:47:@552.4]
  assign _T_96 = _T_95[127:64]; // @[alu.scala 82:59:@553.4]
  assign _T_98 = {1'b0,$signed(io_inputB)}; // @[alu.scala 83:55:@555.4]
  assign _GEN_2 = {{1{_T_74[63]}},_T_74}; // @[alu.scala 83:55:@556.4]
  assign _T_99 = $signed(_GEN_2) * $signed(_T_98); // @[alu.scala 83:55:@556.4]
  assign _T_100 = _T_99[127:0]; // @[alu.scala 83:55:@557.4]
  assign _T_101 = $signed(_T_100); // @[alu.scala 83:55:@558.4]
  assign _T_102 = _T_101[127:64]; // @[alu.scala 83:67:@559.4]
  assign _T_105 = $signed(_T_74) / $signed(_T_75); // @[alu.scala 84:52:@562.4]
  assign _T_106 = $unsigned(_T_105); // @[alu.scala 84:72:@563.4]
  assign _T_107 = io_inputA / io_inputB; // @[alu.scala 85:46:@564.4]
  assign _GEN_5 = $signed(_T_74) % $signed(_T_75); // @[alu.scala 86:53:@567.4]
  assign _T_110 = _GEN_5[63:0]; // @[alu.scala 86:53:@567.4]
  assign _T_111 = $unsigned(_T_110); // @[alu.scala 86:74:@568.4]
  assign _GEN_6 = io_inputA % io_inputB; // @[alu.scala 87:46:@569.4]
  assign _T_112 = _GEN_6[63:0]; // @[alu.scala 87:46:@569.4]
  assign _T_114 = _T_40 ? _T_112 : 64'h0; // @[Mux.scala 46:16:@571.4]
  assign _T_116 = _T_42 ? _T_111 : _T_114; // @[Mux.scala 46:16:@573.4]
  assign _T_118 = _T_44 ? _T_107 : _T_116; // @[Mux.scala 46:16:@575.4]
  assign _T_120 = _T_46 ? _T_106 : {{1'd0}, _T_118}; // @[Mux.scala 46:16:@577.4]
  assign _T_121 = 5'h11 == io_ALUOp; // @[Mux.scala 46:19:@578.4]
  assign _T_122 = _T_121 ? {{1'd0}, _T_102} : _T_120; // @[Mux.scala 46:16:@579.4]
  assign _T_123 = 5'h10 == io_ALUOp; // @[Mux.scala 46:19:@580.4]
  assign _T_124 = _T_123 ? {{1'd0}, _T_96} : _T_122; // @[Mux.scala 46:16:@581.4]
  assign _T_125 = 5'hf == io_ALUOp; // @[Mux.scala 46:19:@582.4]
  assign _T_126 = _T_125 ? {{1'd0}, _T_94} : _T_124; // @[Mux.scala 46:16:@583.4]
  assign _T_128 = _T_48 ? {{1'd0}, _T_90} : _T_126; // @[Mux.scala 46:16:@585.4]
  assign _T_129 = 5'hd == io_ALUOp; // @[Mux.scala 46:19:@586.4]
  assign _T_130 = _T_129 ? {{1'd0}, _T_86} : _T_128; // @[Mux.scala 46:16:@587.4]
  assign _T_132 = _T_50 ? {{1'd0}, _T_84} : _T_130; // @[Mux.scala 46:16:@589.4]
  assign _T_134 = _T_52 ? {{1'd0}, _T_81} : _T_132; // @[Mux.scala 46:16:@591.4]
  assign _T_136 = _T_54 ? {{1'd0}, _T_78} : _T_134; // @[Mux.scala 46:16:@593.4]
  assign _T_138 = _T_56 ? _T_77 : {{62'd0}, _T_136}; // @[Mux.scala 46:16:@595.4]
  assign _T_139 = 5'h7 == io_ALUOp; // @[Mux.scala 46:19:@596.4]
  assign _T_140 = _T_139 ? {{126'd0}, _T_76} : _T_138; // @[Mux.scala 46:16:@597.4]
  assign _T_141 = 5'hc == io_ALUOp; // @[Mux.scala 46:19:@598.4]
  assign _T_142 = _T_141 ? {{126'd0}, _T_73} : _T_140; // @[Mux.scala 46:16:@599.4]
  assign _T_143 = 5'h6 == io_ALUOp; // @[Mux.scala 46:19:@600.4]
  assign _T_144 = _T_143 ? {{63'd0}, _T_72} : _T_142; // @[Mux.scala 46:16:@601.4]
  assign _T_145 = 5'h5 == io_ALUOp; // @[Mux.scala 46:19:@602.4]
  assign _T_146 = _T_145 ? {{63'd0}, _T_71} : _T_144; // @[Mux.scala 46:16:@603.4]
  assign _T_147 = 5'h4 == io_ALUOp; // @[Mux.scala 46:19:@604.4]
  assign _T_148 = _T_147 ? {{63'd0}, _T_70} : _T_146; // @[Mux.scala 46:16:@605.4]
  assign _T_150 = _T_58 ? {{63'd0}, _T_69} : _T_148; // @[Mux.scala 46:16:@607.4]
  assign _T_151 = 5'h2 == io_ALUOp; // @[Mux.scala 46:19:@608.4]
  assign _T_152 = _T_151 ? {{63'd0}, io_inputB} : _T_150; // @[Mux.scala 46:16:@609.4]
  assign _T_153 = 5'h1 == io_ALUOp; // @[Mux.scala 46:19:@610.4]
  assign _T_154 = _T_153 ? {{63'd0}, io_inputA} : _T_152; // @[Mux.scala 46:16:@611.4]
  assign _T_155 = 5'h0 == io_ALUOp; // @[Mux.scala 46:19:@612.4]
  assign _T_156 = _T_155 ? 127'h0 : _T_154; // @[Mux.scala 46:16:@613.4]
  assign _T_157 = io_op32 ? {{63'd0}, _T_65} : _T_156; // @[alu.scala 60:21:@614.4]
  assign io_output = _T_157[63:0]; // @[alu.scala 60:15:@615.4]
endmodule
module BranchCtrl( // @[:@619.2]
  input  [3:0]  io_exeType, // @[:@622.4]
  input  [63:0] io_input1, // @[:@622.4]
  input  [63:0] io_input2, // @[:@622.4]
  output        io_jump // @[:@622.4]
);
  wire [64:0] _T_13; // @[branch.scala 27:25:@624.4]
  wire [64:0] _T_14; // @[branch.scala 27:25:@625.4]
  wire [63:0] x; // @[branch.scala 27:25:@626.4]
  wire  ne; // @[branch.scala 28:17:@627.4]
  wire  eq; // @[branch.scala 29:15:@628.4]
  wire  _T_17; // @[branch.scala 30:24:@629.4]
  wire  _T_18; // @[branch.scala 30:42:@630.4]
  wire  st; // @[branch.scala 30:29:@631.4]
  wire  _T_19; // @[branch.scala 31:24:@632.4]
  wire  lt; // @[branch.scala 31:18:@634.4]
  wire  ge; // @[branch.scala 32:15:@635.4]
  wire  _T_23; // @[branch.scala 33:39:@637.4]
  wire  ltu; // @[branch.scala 33:18:@638.4]
  wire  geu; // @[branch.scala 34:15:@639.4]
  wire  _T_36; // @[Mux.scala 46:19:@640.4]
  wire  _T_38; // @[Mux.scala 46:19:@642.4]
  wire  _T_39; // @[Mux.scala 46:16:@643.4]
  wire  _T_40; // @[Mux.scala 46:19:@644.4]
  wire  _T_41; // @[Mux.scala 46:16:@645.4]
  wire  _T_42; // @[Mux.scala 46:19:@646.4]
  wire  _T_43; // @[Mux.scala 46:16:@647.4]
  wire  _T_44; // @[Mux.scala 46:19:@648.4]
  wire  _T_45; // @[Mux.scala 46:16:@649.4]
  wire  _T_46; // @[Mux.scala 46:19:@650.4]
  wire  _T_47; // @[Mux.scala 46:16:@651.4]
  wire  _T_48; // @[Mux.scala 46:19:@652.4]
  wire  _T_49; // @[Mux.scala 46:16:@653.4]
  wire  _T_50; // @[Mux.scala 46:19:@654.4]
  assign _T_13 = io_input1 - io_input2; // @[branch.scala 27:25:@624.4]
  assign _T_14 = $unsigned(_T_13); // @[branch.scala 27:25:@625.4]
  assign x = _T_14[63:0]; // @[branch.scala 27:25:@626.4]
  assign ne = x != 64'h0; // @[branch.scala 28:17:@627.4]
  assign eq = ne == 1'h0; // @[branch.scala 29:15:@628.4]
  assign _T_17 = io_input1[63]; // @[branch.scala 30:24:@629.4]
  assign _T_18 = io_input2[62]; // @[branch.scala 30:42:@630.4]
  assign st = _T_17 == _T_18; // @[branch.scala 30:29:@631.4]
  assign _T_19 = x[63]; // @[branch.scala 31:24:@632.4]
  assign lt = st ? _T_19 : _T_17; // @[branch.scala 31:18:@634.4]
  assign ge = lt == 1'h0; // @[branch.scala 32:15:@635.4]
  assign _T_23 = io_input2[63]; // @[branch.scala 33:39:@637.4]
  assign ltu = st ? _T_19 : _T_23; // @[branch.scala 33:18:@638.4]
  assign geu = ltu == 1'h0; // @[branch.scala 34:15:@639.4]
  assign _T_36 = 4'hf == io_exeType; // @[Mux.scala 46:19:@640.4]
  assign _T_38 = 4'he == io_exeType; // @[Mux.scala 46:19:@642.4]
  assign _T_39 = _T_38 ? geu : _T_36; // @[Mux.scala 46:16:@643.4]
  assign _T_40 = 4'hd == io_exeType; // @[Mux.scala 46:19:@644.4]
  assign _T_41 = _T_40 ? ltu : _T_39; // @[Mux.scala 46:16:@645.4]
  assign _T_42 = 4'hc == io_exeType; // @[Mux.scala 46:19:@646.4]
  assign _T_43 = _T_42 ? ge : _T_41; // @[Mux.scala 46:16:@647.4]
  assign _T_44 = 4'hb == io_exeType; // @[Mux.scala 46:19:@648.4]
  assign _T_45 = _T_44 ? lt : _T_43; // @[Mux.scala 46:16:@649.4]
  assign _T_46 = 4'ha == io_exeType; // @[Mux.scala 46:19:@650.4]
  assign _T_47 = _T_46 ? ne : _T_45; // @[Mux.scala 46:16:@651.4]
  assign _T_48 = 4'h9 == io_exeType; // @[Mux.scala 46:19:@652.4]
  assign _T_49 = _T_48 ? eq : _T_47; // @[Mux.scala 46:16:@653.4]
  assign _T_50 = 4'h8 == io_exeType; // @[Mux.scala 46:19:@654.4]
  assign io_jump = _T_50 ? 1'h1 : _T_49; // @[branch.scala 36:13:@656.4]
endmodule
module Branch( // @[:@658.2]
  input  [3:0]  io_exeType, // @[:@661.4]
  input  [63:0] io_input1, // @[:@661.4]
  input  [63:0] io_input2, // @[:@661.4]
  input  [63:0] io_pc, // @[:@661.4]
  input  [63:0] io_imm, // @[:@661.4]
  output        io_jump, // @[:@661.4]
  output [63:0] io_jdest // @[:@661.4]
);
  wire [3:0] bctrl_io_exeType; // @[branch.scala 64:23:@663.4]
  wire [63:0] bctrl_io_input1; // @[branch.scala 64:23:@663.4]
  wire [63:0] bctrl_io_input2; // @[branch.scala 64:23:@663.4]
  wire  bctrl_io_jump; // @[branch.scala 64:23:@663.4]
  wire  _T_19; // @[branch.scala 71:33:@670.4]
  wire [64:0] _T_20; // @[branch.scala 71:57:@671.4]
  wire [63:0] _T_21; // @[branch.scala 71:57:@672.4]
  wire [64:0] _T_22; // @[branch.scala 71:73:@673.4]
  wire [63:0] _T_23; // @[branch.scala 71:73:@674.4]
  BranchCtrl bctrl ( // @[branch.scala 64:23:@663.4]
    .io_exeType(bctrl_io_exeType),
    .io_input1(bctrl_io_input1),
    .io_input2(bctrl_io_input2),
    .io_jump(bctrl_io_jump)
  );
  assign _T_19 = io_exeType == 4'hf; // @[branch.scala 71:33:@670.4]
  assign _T_20 = io_input1 + io_imm; // @[branch.scala 71:57:@671.4]
  assign _T_21 = io_input1 + io_imm; // @[branch.scala 71:57:@672.4]
  assign _T_22 = io_pc + io_imm; // @[branch.scala 71:73:@673.4]
  assign _T_23 = io_pc + io_imm; // @[branch.scala 71:73:@674.4]
  assign io_jump = bctrl_io_jump; // @[branch.scala 69:26:@669.4]
  assign io_jdest = _T_19 ? _T_21 : _T_23; // @[branch.scala 71:14:@676.4]
  assign bctrl_io_exeType = io_exeType; // @[branch.scala 66:26:@666.4]
  assign bctrl_io_input1 = io_input1; // @[branch.scala 67:26:@667.4]
  assign bctrl_io_input2 = io_input2; // @[branch.scala 68:26:@668.4]
endmodule
module Execute( // @[:@678.2]
  input  [63:0] io_imm, // @[:@681.4]
  input  [3:0]  io_ALUOp, // @[:@681.4]
  input  [63:0] io_pc, // @[:@681.4]
  input  [3:0]  io_exe_type, // @[:@681.4]
  input         io_op32, // @[:@681.4]
  input         io_dreg_rs2_valid, // @[:@681.4]
  input  [63:0] io_dreg_rs1_value, // @[:@681.4]
  input  [63:0] io_dreg_rs2_value, // @[:@681.4]
  input         io_dreg_rd_valid, // @[:@681.4]
  input  [4:0]  io_dreg_rd_index, // @[:@681.4]
  output        io_nls, // @[:@681.4]
  output [63:0] io_addr, // @[:@681.4]
  output [63:0] io_data, // @[:@681.4]
  output        io_jump, // @[:@681.4]
  output [63:0] io_jdest, // @[:@681.4]
  output        io_wreg_wbrv, // @[:@681.4]
  output [4:0]  io_wreg_wbri, // @[:@681.4]
  output [63:0] io_wreg_wbrd, // @[:@681.4]
  output        io_wcsr_valid, // @[:@681.4]
  output [11:0] io_wcsr_csr_idx, // @[:@681.4]
  output [63:0] io_wcsr_csr_data, // @[:@681.4]
  input         io_csr_op_valid, // @[:@681.4]
  input  [11:0] io_csr_op_csr_idx, // @[:@681.4]
  input  [63:0] io_csr_op_csr_data, // @[:@681.4]
  input         io_id_excep_valid, // @[:@681.4]
  input  [63:0] io_id_excep_code, // @[:@681.4]
  input  [63:0] io_id_excep_value, // @[:@681.4]
  input  [63:0] io_id_excep_pc, // @[:@681.4]
  input         io_id_excep_inst_valid, // @[:@681.4]
  output        io_mem_excep_valid, // @[:@681.4]
  output [63:0] io_mem_excep_code, // @[:@681.4]
  output [63:0] io_mem_excep_value, // @[:@681.4]
  output [63:0] io_mem_excep_pc, // @[:@681.4]
  output        io_mem_excep_inst_valid // @[:@681.4]
);
  wire [4:0] alu_io_ALUOp; // @[execute.scala 30:21:@683.4]
  wire  alu_io_op32; // @[execute.scala 30:21:@683.4]
  wire [63:0] alu_io_inputA; // @[execute.scala 30:21:@683.4]
  wire [63:0] alu_io_inputB; // @[execute.scala 30:21:@683.4]
  wire [63:0] alu_io_output; // @[execute.scala 30:21:@683.4]
  wire [3:0] bra_io_exeType; // @[execute.scala 31:21:@686.4]
  wire [63:0] bra_io_input1; // @[execute.scala 31:21:@686.4]
  wire [63:0] bra_io_input2; // @[execute.scala 31:21:@686.4]
  wire [63:0] bra_io_pc; // @[execute.scala 31:21:@686.4]
  wire [63:0] bra_io_imm; // @[execute.scala 31:21:@686.4]
  wire  bra_io_jump; // @[execute.scala 31:21:@686.4]
  wire [63:0] bra_io_jdest; // @[execute.scala 31:21:@686.4]
  wire  _T_109; // @[execute.scala 33:38:@689.4]
  wire  _T_110; // @[execute.scala 37:38:@691.4]
  wire  _T_112; // @[execute.scala 37:50:@693.4]
  wire [63:0] _T_113; // @[execute.scala 39:14:@694.4]
  wire  nls; // @[execute.scala 41:28:@696.4]
  wire  _T_115; // @[execute.scala 42:36:@697.4]
  wire  _T_117; // @[execute.scala 44:43:@699.4]
  wire [64:0] _T_120; // @[execute.scala 44:69:@700.4]
  wire [63:0] _T_121; // @[execute.scala 44:69:@701.4]
  wire [63:0] _T_122; // @[execute.scala 44:25:@702.4]
  wire [64:0] _T_130; // @[execute.scala 47:30:@707.4]
  wire [63:0] _T_131; // @[execute.scala 47:30:@708.4]
  wire  _T_132; // @[Mux.scala 46:19:@709.4]
  wire [63:0] _T_133; // @[Mux.scala 46:16:@710.4]
  wire  _T_134; // @[Mux.scala 46:19:@711.4]
  wire [63:0] _T_135; // @[Mux.scala 46:16:@712.4]
  wire  _T_136; // @[Mux.scala 46:19:@713.4]
  wire [63:0] _T_137; // @[Mux.scala 46:16:@714.4]
  wire  _T_138; // @[Mux.scala 46:19:@715.4]
  wire [63:0] _T_139; // @[Mux.scala 46:16:@716.4]
  wire  _T_140; // @[Mux.scala 46:19:@717.4]
  wire [63:0] _T_141; // @[Mux.scala 46:16:@718.4]
  wire  _T_142; // @[Mux.scala 46:19:@719.4]
  wire [64:0] _T_143; // @[execute.scala 61:34:@728.4]
  ALU alu ( // @[execute.scala 30:21:@683.4]
    .io_ALUOp(alu_io_ALUOp),
    .io_op32(alu_io_op32),
    .io_inputA(alu_io_inputA),
    .io_inputB(alu_io_inputB),
    .io_output(alu_io_output)
  );
  Branch bra ( // @[execute.scala 31:21:@686.4]
    .io_exeType(bra_io_exeType),
    .io_input1(bra_io_input1),
    .io_input2(bra_io_input2),
    .io_pc(bra_io_pc),
    .io_imm(bra_io_imm),
    .io_jump(bra_io_jump),
    .io_jdest(bra_io_jdest)
  );
  assign _T_109 = io_exe_type == 4'h7; // @[execute.scala 33:38:@689.4]
  assign _T_110 = io_exe_type == 4'h6; // @[execute.scala 37:38:@691.4]
  assign _T_112 = _T_110 | _T_109; // @[execute.scala 37:50:@693.4]
  assign _T_113 = io_dreg_rs2_valid ? io_dreg_rs2_value : io_imm; // @[execute.scala 39:14:@694.4]
  assign nls = io_exe_type == 4'h2; // @[execute.scala 41:28:@696.4]
  assign _T_115 = nls == 1'h0; // @[execute.scala 42:36:@697.4]
  assign _T_117 = io_dreg_rd_index == 5'h0; // @[execute.scala 44:43:@699.4]
  assign _T_120 = io_pc + 64'h4; // @[execute.scala 44:69:@700.4]
  assign _T_121 = io_pc + 64'h4; // @[execute.scala 44:69:@701.4]
  assign _T_122 = _T_117 ? 64'h0 : _T_121; // @[execute.scala 44:25:@702.4]
  assign _T_130 = io_imm + io_pc; // @[execute.scala 47:30:@707.4]
  assign _T_131 = io_imm + io_pc; // @[execute.scala 47:30:@708.4]
  assign _T_132 = 4'h7 == io_exe_type; // @[Mux.scala 46:19:@709.4]
  assign _T_133 = _T_132 ? io_csr_op_csr_data : alu_io_output; // @[Mux.scala 46:16:@710.4]
  assign _T_134 = 4'h6 == io_exe_type; // @[Mux.scala 46:19:@711.4]
  assign _T_135 = _T_134 ? io_csr_op_csr_data : _T_133; // @[Mux.scala 46:16:@712.4]
  assign _T_136 = 4'h3 == io_exe_type; // @[Mux.scala 46:19:@713.4]
  assign _T_137 = _T_136 ? _T_131 : _T_135; // @[Mux.scala 46:16:@714.4]
  assign _T_138 = 4'h4 == io_exe_type; // @[Mux.scala 46:19:@715.4]
  assign _T_139 = _T_138 ? io_imm : _T_137; // @[Mux.scala 46:16:@716.4]
  assign _T_140 = 4'hf == io_exe_type; // @[Mux.scala 46:19:@717.4]
  assign _T_141 = _T_140 ? _T_122 : _T_139; // @[Mux.scala 46:16:@718.4]
  assign _T_142 = 4'h8 == io_exe_type; // @[Mux.scala 46:19:@719.4]
  assign _T_143 = io_dreg_rs1_value + io_imm; // @[execute.scala 61:34:@728.4]
  assign io_nls = io_exe_type == 4'h2; // @[execute.scala 72:12:@739.4]
  assign io_addr = io_dreg_rs1_value + io_imm; // @[execute.scala 61:13:@730.4]
  assign io_data = io_dreg_rs2_value; // @[execute.scala 62:13:@731.4]
  assign io_jump = bra_io_jump; // @[execute.scala 69:19:@737.4]
  assign io_jdest = bra_io_jdest; // @[execute.scala 70:19:@738.4]
  assign io_wreg_wbrv = io_dreg_rd_valid & _T_115; // @[execute.scala 57:19:@725.4]
  assign io_wreg_wbri = io_dreg_rd_index; // @[execute.scala 58:19:@726.4]
  assign io_wreg_wbrd = _T_142 ? _T_122 : _T_141; // @[execute.scala 59:19:@727.4]
  assign io_wcsr_valid = io_csr_op_valid; // @[execute.scala 74:19:@740.4]
  assign io_wcsr_csr_idx = io_csr_op_csr_idx; // @[execute.scala 75:21:@741.4]
  assign io_wcsr_csr_data = alu_io_output; // @[execute.scala 76:22:@742.4]
  assign io_mem_excep_valid = io_id_excep_valid; // @[execute.scala 78:18:@747.4]
  assign io_mem_excep_code = io_id_excep_code; // @[execute.scala 78:18:@746.4]
  assign io_mem_excep_value = io_id_excep_value; // @[execute.scala 78:18:@745.4]
  assign io_mem_excep_pc = io_id_excep_pc; // @[execute.scala 78:18:@744.4]
  assign io_mem_excep_inst_valid = io_id_excep_inst_valid; // @[execute.scala 78:18:@743.4]
  assign alu_io_ALUOp = {{1'd0}, io_ALUOp}; // @[execute.scala 52:19:@721.4]
  assign alu_io_op32 = io_op32; // @[execute.scala 55:19:@724.4]
  assign alu_io_inputA = _T_109 ? io_imm : io_dreg_rs1_value; // @[execute.scala 53:19:@722.4]
  assign alu_io_inputB = _T_112 ? io_csr_op_csr_data : _T_113; // @[execute.scala 54:19:@723.4]
  assign bra_io_exeType = io_exe_type; // @[execute.scala 64:20:@732.4]
  assign bra_io_input1 = io_dreg_rs1_value; // @[execute.scala 65:20:@733.4]
  assign bra_io_input2 = io_dreg_rs2_value; // @[execute.scala 66:20:@734.4]
  assign bra_io_pc = io_pc; // @[execute.scala 67:20:@735.4]
  assign bra_io_imm = io_imm; // @[execute.scala 68:20:@736.4]
endmodule
module MemoryCtrl( // @[:@749.2]
  input         io_nls, // @[:@752.4]
  input  [3:0]  io_lsm, // @[:@752.4]
  input  [63:0] io_addr, // @[:@752.4]
  input  [63:0] io_data, // @[:@752.4]
  output        io_ready, // @[:@752.4]
  input         io_ereg_wbrv, // @[:@752.4]
  input  [4:0]  io_ereg_wbri, // @[:@752.4]
  input  [63:0] io_ereg_wbrd, // @[:@752.4]
  output        io_wreg_wbrv, // @[:@752.4]
  output [4:0]  io_wreg_wbri, // @[:@752.4]
  output [63:0] io_wreg_wbrd, // @[:@752.4]
  output [3:0]  io_mem_mode, // @[:@752.4]
  input         io_mem_ready, // @[:@752.4]
  output [63:0] io_mem_addr, // @[:@752.4]
  input  [63:0] io_mem_rdata, // @[:@752.4]
  output [63:0] io_mem_wdata, // @[:@752.4]
  input         io_excep_valid, // @[:@752.4]
  input  [63:0] io_excep_code, // @[:@752.4]
  input  [63:0] io_excep_value, // @[:@752.4]
  input  [63:0] io_excep_pc, // @[:@752.4]
  input         io_excep_inst_valid, // @[:@752.4]
  input         io_csr_wb_valid, // @[:@752.4]
  input  [11:0] io_csr_wb_csr_idx, // @[:@752.4]
  input  [63:0] io_csr_wb_csr_data, // @[:@752.4]
  output        io_csr_wrCSROp_valid, // @[:@752.4]
  output [11:0] io_csr_wrCSROp_csr_idx, // @[:@752.4]
  output [63:0] io_csr_wrCSROp_csr_data, // @[:@752.4]
  output        io_csr_excep_valid, // @[:@752.4]
  output [63:0] io_csr_excep_code, // @[:@752.4]
  output [63:0] io_csr_excep_value, // @[:@752.4]
  output [63:0] io_csr_excep_pc, // @[:@752.4]
  output        io_csr_excep_inst_valid, // @[:@752.4]
  input         io_inter_valid, // @[:@752.4]
  input  [63:0] io_inter_bits // @[:@752.4]
);
  wire  _T_135; // @[memoryCtrl.scala 53:21:@758.4]
  wire  _T_137; // @[memoryCtrl.scala 55:45:@761.4]
  wire  _T_138; // @[memoryCtrl.scala 55:67:@762.4]
  wire  _T_139; // @[memoryCtrl.scala 55:58:@763.4]
  assign _T_135 = io_nls == 1'h0; // @[memoryCtrl.scala 53:21:@758.4]
  assign _T_137 = io_lsm != 4'hf; // @[memoryCtrl.scala 55:45:@761.4]
  assign _T_138 = io_lsm[3]; // @[memoryCtrl.scala 55:67:@762.4]
  assign _T_139 = _T_137 & _T_138; // @[memoryCtrl.scala 55:58:@763.4]
  assign io_ready = _T_135 | io_mem_ready; // @[memoryCtrl.scala 53:18:@760.4]
  assign io_wreg_wbrv = io_ereg_wbrv | _T_139; // @[memoryCtrl.scala 55:18:@765.4]
  assign io_wreg_wbri = io_ereg_wbri; // @[memoryCtrl.scala 56:18:@766.4]
  assign io_wreg_wbrd = io_nls ? io_mem_rdata : io_ereg_wbrd; // @[memoryCtrl.scala 57:18:@768.4]
  assign io_mem_mode = io_nls ? io_lsm : 4'hf; // @[memoryCtrl.scala 49:18:@755.4]
  assign io_mem_addr = io_addr; // @[memoryCtrl.scala 50:17:@756.4]
  assign io_mem_wdata = io_data; // @[memoryCtrl.scala 51:18:@757.4]
  assign io_csr_wrCSROp_valid = io_csr_wb_valid; // @[memoryCtrl.scala 63:20:@773.4]
  assign io_csr_wrCSROp_csr_idx = io_csr_wb_csr_idx; // @[memoryCtrl.scala 63:20:@772.4]
  assign io_csr_wrCSROp_csr_data = io_csr_wb_csr_data; // @[memoryCtrl.scala 63:20:@771.4]
  assign io_csr_excep_valid = io_inter_valid ? 1'h1 : io_excep_valid; // @[memoryCtrl.scala 64:20:@778.4 memoryCtrl.scala 66:26:@780.6]
  assign io_csr_excep_code = io_inter_valid ? io_inter_bits : io_excep_code; // @[memoryCtrl.scala 64:20:@777.4 memoryCtrl.scala 67:26:@781.6]
  assign io_csr_excep_value = io_excep_value; // @[memoryCtrl.scala 64:20:@776.4]
  assign io_csr_excep_pc = io_excep_pc; // @[memoryCtrl.scala 64:20:@775.4]
  assign io_csr_excep_inst_valid = io_excep_inst_valid; // @[memoryCtrl.scala 64:20:@774.4]
endmodule
module WriteBack( // @[:@784.2]
  input         io_wreg_wbrv, // @[:@787.4]
  input  [4:0]  io_wreg_wbri, // @[:@787.4]
  input  [63:0] io_wreg_wbrd, // @[:@787.4]
  output        io_reg_wen, // @[:@787.4]
  output [4:0]  io_reg_w, // @[:@787.4]
  output [63:0] io_reg_wd // @[:@787.4]
);
  assign io_reg_wen = io_wreg_wbrv; // @[writeback.scala 12:16:@789.4]
  assign io_reg_w = io_wreg_wbri; // @[writeback.scala 13:16:@790.4]
  assign io_reg_wd = io_wreg_wbrd; // @[writeback.scala 14:16:@791.4]
endmodule
module RegCtrl( // @[:@793.2]
  input         clock, // @[:@794.4]
  input  [4:0]  io_r_r1, // @[:@796.4]
  input  [4:0]  io_r_r2, // @[:@796.4]
  output [63:0] io_r_r1d, // @[:@796.4]
  output [63:0] io_r_r2d, // @[:@796.4]
  input         io_w_wen, // @[:@796.4]
  input  [4:0]  io_w_w, // @[:@796.4]
  input  [63:0] io_w_wd, // @[:@796.4]
  input         io_pass // @[:@796.4]
);
  reg [63:0] regs [0:31]; // @[reg.scala 9:19:@798.4]
  reg [63:0] _RAND_0;
  wire [63:0] regs__T_25_data; // @[reg.scala 9:19:@798.4]
  wire [4:0] regs__T_25_addr; // @[reg.scala 9:19:@798.4]
  wire [63:0] regs__T_29_data; // @[reg.scala 9:19:@798.4]
  wire [4:0] regs__T_29_addr; // @[reg.scala 9:19:@798.4]
  wire [63:0] regs__T_35_data; // @[reg.scala 9:19:@798.4]
  wire [4:0] regs__T_35_addr; // @[reg.scala 9:19:@798.4]
  wire  regs__T_35_mask; // @[reg.scala 9:19:@798.4]
  wire  regs__T_35_en; // @[reg.scala 9:19:@798.4]
  wire  _T_23; // @[reg.scala 11:29:@799.4]
  wire  _T_24; // @[reg.scala 11:18:@800.4]
  wire  _T_27; // @[reg.scala 16:29:@804.4]
  wire  _T_28; // @[reg.scala 16:18:@805.4]
  wire  _T_32; // @[reg.scala 20:30:@809.4]
  wire  _T_33; // @[reg.scala 20:20:@810.4]
  assign regs__T_25_addr = io_r_r1;
  assign regs__T_25_data = regs[regs__T_25_addr]; // @[reg.scala 9:19:@798.4]
  assign regs__T_29_addr = io_r_r2;
  assign regs__T_29_data = regs[regs__T_29_addr]; // @[reg.scala 9:19:@798.4]
  assign regs__T_35_data = io_w_wd;
  assign regs__T_35_addr = io_w_w;
  assign regs__T_35_mask = 1'h1;
  assign regs__T_35_en = _T_33 & io_pass;
  assign _T_23 = io_r_r1 == io_w_w; // @[reg.scala 11:29:@799.4]
  assign _T_24 = io_w_wen & _T_23; // @[reg.scala 11:18:@800.4]
  assign _T_27 = io_r_r2 == io_w_w; // @[reg.scala 16:29:@804.4]
  assign _T_28 = io_w_wen & _T_27; // @[reg.scala 16:18:@805.4]
  assign _T_32 = io_w_w != 5'h0; // @[reg.scala 20:30:@809.4]
  assign _T_33 = io_w_wen & _T_32; // @[reg.scala 20:20:@810.4]
  assign io_r_r1d = _T_24 ? io_w_wd : regs__T_25_data; // @[reg.scala 10:14:@803.4]
  assign io_r_r2d = _T_28 ? io_w_wd : regs__T_29_data; // @[reg.scala 15:14:@808.4]
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
      regs[regs__T_35_addr] <= regs__T_35_data; // @[reg.scala 9:19:@798.4]
    end
  end
endmodule
module PTW( // @[:@817.2]
  input         clock, // @[:@818.4]
  input         reset, // @[:@819.4]
  input  [8:0]  io_root_p2, // @[:@820.4]
  input  [8:0]  io_root_p1, // @[:@820.4]
  input  [8:0]  io_root_p0, // @[:@820.4]
  input  [8:0]  io_req_p2, // @[:@820.4]
  input  [8:0]  io_req_p1, // @[:@820.4]
  input  [8:0]  io_req_p0, // @[:@820.4]
  input         io_req_valid, // @[:@820.4]
  output [8:0]  io_rsp_ppn_p2, // @[:@820.4]
  output [8:0]  io_rsp_ppn_p1, // @[:@820.4]
  output [8:0]  io_rsp_ppn_p0, // @[:@820.4]
  output        io_rsp_U, // @[:@820.4]
  output        io_rsp_X, // @[:@820.4]
  output        io_rsp_W, // @[:@820.4]
  output        io_rsp_R, // @[:@820.4]
  output        io_ready, // @[:@820.4]
  output        io_pf, // @[:@820.4]
  output [3:0]  io_mem_mode, // @[:@820.4]
  input         io_mem_ready, // @[:@820.4]
  output [63:0] io_mem_addr, // @[:@820.4]
  input  [63:0] io_mem_rdata // @[:@820.4]
);
  reg [1:0] wait_status; // @[PTW.scala 48:30:@822.4]
  reg [31:0] _RAND_0;
  reg [8:0] req_p1; // @[PTW.scala 51:23:@832.4]
  reg [31:0] _RAND_1;
  reg [8:0] req_p0; // @[PTW.scala 51:23:@832.4]
  reg [31:0] _RAND_2;
  reg  read; // @[PTW.scala 52:23:@833.4]
  reg [31:0] _RAND_3;
  reg [31:0] addr; // @[PTW.scala 53:23:@834.4]
  reg [31:0] _RAND_4;
  wire  pte_V; // @[PTW.scala 55:36:@838.4]
  wire  pte_R; // @[PTW.scala 55:36:@840.4]
  wire  pte_W; // @[PTW.scala 55:36:@842.4]
  wire  pte_X; // @[PTW.scala 55:36:@844.4]
  wire  pte_U; // @[PTW.scala 55:36:@846.4]
  wire [8:0] pte_ppn_p0; // @[PTW.scala 55:36:@856.4]
  wire [8:0] pte_ppn_p1; // @[PTW.scala 55:36:@858.4]
  wire [8:0] pte_ppn_p2; // @[PTW.scala 55:36:@860.4]
  wire  _T_71; // @[PTW.scala 56:23:@866.4]
  wire  _T_73; // @[PTW.scala 56:34:@867.4]
  wire  _T_74; // @[PTW.scala 56:41:@868.4]
  wire  pte_invalid; // @[PTW.scala 56:30:@869.4]
  wire  pte_leaf; // @[PTW.scala 57:30:@870.4]
  wire [38:0] addr2; // @[Cat.scala 30:58:@874.4]
  wire [38:0] addr1; // @[Cat.scala 30:58:@878.4]
  wire [38:0] addr0; // @[Cat.scala 30:58:@882.4]
  wire [3:0] _T_87; // @[PTW.scala 64:24:@883.4]
  wire  _T_111; // @[Conditional.scala 37:30:@934.4]
  wire [1:0] _GEN_0; // @[PTW.scala 74:33:@936.6]
  wire [3:0] _GEN_1; // @[PTW.scala 74:33:@936.6]
  wire [38:0] _GEN_2; // @[PTW.scala 74:33:@936.6]
  wire [8:0] _GEN_4; // @[PTW.scala 74:33:@936.6]
  wire [8:0] _GEN_5; // @[PTW.scala 74:33:@936.6]
  wire  _GEN_7; // @[PTW.scala 74:33:@936.6]
  wire  _T_113; // @[Conditional.scala 37:30:@948.6]
  wire  _T_118; // @[PTW.scala 102:47:@976.14]
  wire  _T_120; // @[PTW.scala 102:65:@977.14]
  wire  _T_121; // @[PTW.scala 102:51:@978.14]
  wire [1:0] _GEN_8; // @[PTW.scala 96:40:@958.12]
  wire  _GEN_10; // @[PTW.scala 96:40:@958.12]
  wire  _GEN_11; // @[PTW.scala 96:40:@958.12]
  wire  _GEN_12; // @[PTW.scala 96:40:@958.12]
  wire  _GEN_13; // @[PTW.scala 96:40:@958.12]
  wire [8:0] _GEN_18; // @[PTW.scala 96:40:@958.12]
  wire [8:0] _GEN_19; // @[PTW.scala 96:40:@958.12]
  wire [8:0] _GEN_20; // @[PTW.scala 96:40:@958.12]
  wire  _GEN_23; // @[PTW.scala 96:40:@958.12]
  wire  _GEN_25; // @[PTW.scala 96:40:@958.12]
  wire [38:0] _GEN_26; // @[PTW.scala 96:40:@958.12]
  wire [1:0] _GEN_27; // @[PTW.scala 90:36:@951.10]
  wire  _GEN_28; // @[PTW.scala 90:36:@951.10]
  wire  _GEN_29; // @[PTW.scala 90:36:@951.10]
  wire  _GEN_30; // @[PTW.scala 90:36:@951.10]
  wire  _GEN_32; // @[PTW.scala 90:36:@951.10]
  wire  _GEN_33; // @[PTW.scala 90:36:@951.10]
  wire  _GEN_34; // @[PTW.scala 90:36:@951.10]
  wire  _GEN_35; // @[PTW.scala 90:36:@951.10]
  wire [8:0] _GEN_40; // @[PTW.scala 90:36:@951.10]
  wire [8:0] _GEN_41; // @[PTW.scala 90:36:@951.10]
  wire [8:0] _GEN_42; // @[PTW.scala 90:36:@951.10]
  wire [38:0] _GEN_45; // @[PTW.scala 90:36:@951.10]
  wire [1:0] _GEN_46; // @[PTW.scala 89:33:@950.8]
  wire  _GEN_47; // @[PTW.scala 89:33:@950.8]
  wire  _GEN_48; // @[PTW.scala 89:33:@950.8]
  wire  _GEN_49; // @[PTW.scala 89:33:@950.8]
  wire  _GEN_51; // @[PTW.scala 89:33:@950.8]
  wire  _GEN_52; // @[PTW.scala 89:33:@950.8]
  wire  _GEN_53; // @[PTW.scala 89:33:@950.8]
  wire  _GEN_54; // @[PTW.scala 89:33:@950.8]
  wire [8:0] _GEN_59; // @[PTW.scala 89:33:@950.8]
  wire [8:0] _GEN_60; // @[PTW.scala 89:33:@950.8]
  wire [8:0] _GEN_61; // @[PTW.scala 89:33:@950.8]
  wire [38:0] _GEN_64; // @[PTW.scala 89:33:@950.8]
  wire  _T_124; // @[Conditional.scala 37:30:@990.8]
  wire [1:0] _GEN_65; // @[PTW.scala 121:40:@1000.14]
  wire [8:0] _GEN_66; // @[PTW.scala 121:40:@1000.14]
  wire  _GEN_67; // @[PTW.scala 121:40:@1000.14]
  wire [38:0] _GEN_68; // @[PTW.scala 121:40:@1000.14]
  wire [1:0] _GEN_69; // @[PTW.scala 115:36:@993.12]
  wire  _GEN_70; // @[PTW.scala 115:36:@993.12]
  wire [8:0] _GEN_71; // @[PTW.scala 115:36:@993.12]
  wire [38:0] _GEN_72; // @[PTW.scala 115:36:@993.12]
  wire [1:0] _GEN_73; // @[PTW.scala 114:33:@992.10]
  wire  _GEN_74; // @[PTW.scala 114:33:@992.10]
  wire [8:0] _GEN_75; // @[PTW.scala 114:33:@992.10]
  wire [38:0] _GEN_76; // @[PTW.scala 114:33:@992.10]
  wire  _T_132; // @[Conditional.scala 37:30:@1029.10]
  wire  _T_136; // @[PTW.scala 142:38:@1035.14]
  wire  _T_137; // @[PTW.scala 142:35:@1036.14]
  wire  _GEN_79; // @[PTW.scala 142:49:@1037.14]
  wire  _GEN_80; // @[PTW.scala 142:49:@1037.14]
  wire  _GEN_81; // @[PTW.scala 142:49:@1037.14]
  wire  _GEN_82; // @[PTW.scala 142:49:@1037.14]
  wire [8:0] _GEN_87; // @[PTW.scala 142:49:@1037.14]
  wire [8:0] _GEN_88; // @[PTW.scala 142:49:@1037.14]
  wire [8:0] _GEN_89; // @[PTW.scala 142:49:@1037.14]
  wire [1:0] _GEN_92; // @[PTW.scala 138:33:@1031.12]
  wire  _GEN_93; // @[PTW.scala 138:33:@1031.12]
  wire  _GEN_95; // @[PTW.scala 138:33:@1031.12]
  wire  _GEN_97; // @[PTW.scala 138:33:@1031.12]
  wire  _GEN_98; // @[PTW.scala 138:33:@1031.12]
  wire  _GEN_99; // @[PTW.scala 138:33:@1031.12]
  wire  _GEN_100; // @[PTW.scala 138:33:@1031.12]
  wire [8:0] _GEN_105; // @[PTW.scala 138:33:@1031.12]
  wire [8:0] _GEN_106; // @[PTW.scala 138:33:@1031.12]
  wire [8:0] _GEN_107; // @[PTW.scala 138:33:@1031.12]
  wire [1:0] _GEN_110; // @[Conditional.scala 39:67:@1030.10]
  wire  _GEN_111; // @[Conditional.scala 39:67:@1030.10]
  wire  _GEN_112; // @[Conditional.scala 39:67:@1030.10]
  wire  _GEN_113; // @[Conditional.scala 39:67:@1030.10]
  wire  _GEN_115; // @[Conditional.scala 39:67:@1030.10]
  wire  _GEN_116; // @[Conditional.scala 39:67:@1030.10]
  wire  _GEN_117; // @[Conditional.scala 39:67:@1030.10]
  wire  _GEN_118; // @[Conditional.scala 39:67:@1030.10]
  wire [8:0] _GEN_123; // @[Conditional.scala 39:67:@1030.10]
  wire [8:0] _GEN_124; // @[Conditional.scala 39:67:@1030.10]
  wire [8:0] _GEN_125; // @[Conditional.scala 39:67:@1030.10]
  wire [1:0] _GEN_128; // @[Conditional.scala 39:67:@991.8]
  wire  _GEN_129; // @[Conditional.scala 39:67:@991.8]
  wire  _GEN_130; // @[Conditional.scala 39:67:@991.8]
  wire  _GEN_131; // @[Conditional.scala 39:67:@991.8]
  wire  _GEN_133; // @[Conditional.scala 39:67:@991.8]
  wire  _GEN_134; // @[Conditional.scala 39:67:@991.8]
  wire  _GEN_135; // @[Conditional.scala 39:67:@991.8]
  wire  _GEN_136; // @[Conditional.scala 39:67:@991.8]
  wire [8:0] _GEN_141; // @[Conditional.scala 39:67:@991.8]
  wire [8:0] _GEN_142; // @[Conditional.scala 39:67:@991.8]
  wire [8:0] _GEN_143; // @[Conditional.scala 39:67:@991.8]
  wire [38:0] _GEN_146; // @[Conditional.scala 39:67:@991.8]
  wire [1:0] _GEN_147; // @[Conditional.scala 39:67:@949.6]
  wire  _GEN_148; // @[Conditional.scala 39:67:@949.6]
  wire  _GEN_149; // @[Conditional.scala 39:67:@949.6]
  wire  _GEN_150; // @[Conditional.scala 39:67:@949.6]
  wire  _GEN_152; // @[Conditional.scala 39:67:@949.6]
  wire  _GEN_153; // @[Conditional.scala 39:67:@949.6]
  wire  _GEN_154; // @[Conditional.scala 39:67:@949.6]
  wire  _GEN_155; // @[Conditional.scala 39:67:@949.6]
  wire [8:0] _GEN_160; // @[Conditional.scala 39:67:@949.6]
  wire [8:0] _GEN_161; // @[Conditional.scala 39:67:@949.6]
  wire [8:0] _GEN_162; // @[Conditional.scala 39:67:@949.6]
  wire [38:0] _GEN_165; // @[Conditional.scala 39:67:@949.6]
  wire [1:0] _GEN_166; // @[Conditional.scala 40:58:@935.4]
  wire [38:0] _GEN_168; // @[Conditional.scala 40:58:@935.4]
  wire [8:0] _GEN_170; // @[Conditional.scala 40:58:@935.4]
  wire [8:0] _GEN_171; // @[Conditional.scala 40:58:@935.4]
  wire [38:0] _GEN_172; // @[Conditional.scala 40:58:@935.4]
  wire  _GEN_173; // @[Conditional.scala 40:58:@935.4]
  assign pte_V = io_mem_rdata[0]; // @[PTW.scala 55:36:@838.4]
  assign pte_R = io_mem_rdata[1]; // @[PTW.scala 55:36:@840.4]
  assign pte_W = io_mem_rdata[2]; // @[PTW.scala 55:36:@842.4]
  assign pte_X = io_mem_rdata[3]; // @[PTW.scala 55:36:@844.4]
  assign pte_U = io_mem_rdata[4]; // @[PTW.scala 55:36:@846.4]
  assign pte_ppn_p0 = io_mem_rdata[18:10]; // @[PTW.scala 55:36:@856.4]
  assign pte_ppn_p1 = io_mem_rdata[27:19]; // @[PTW.scala 55:36:@858.4]
  assign pte_ppn_p2 = io_mem_rdata[36:28]; // @[PTW.scala 55:36:@860.4]
  assign _T_71 = pte_V == 1'h0; // @[PTW.scala 56:23:@866.4]
  assign _T_73 = pte_R == 1'h0; // @[PTW.scala 56:34:@867.4]
  assign _T_74 = _T_73 & pte_W; // @[PTW.scala 56:41:@868.4]
  assign pte_invalid = _T_71 | _T_74; // @[PTW.scala 56:30:@869.4]
  assign pte_leaf = pte_R | pte_X; // @[PTW.scala 57:30:@870.4]
  assign addr2 = {io_root_p2,io_root_p1,io_root_p0,io_req_p2,3'h0}; // @[Cat.scala 30:58:@874.4]
  assign addr1 = {pte_ppn_p2,pte_ppn_p1,pte_ppn_p0,req_p1,3'h0}; // @[Cat.scala 30:58:@878.4]
  assign addr0 = {pte_ppn_p2,pte_ppn_p1,pte_ppn_p0,req_p0,3'h0}; // @[Cat.scala 30:58:@882.4]
  assign _T_87 = read ? 4'hb : 4'hf; // @[PTW.scala 64:24:@883.4]
  assign _T_111 = 2'h0 == wait_status; // @[Conditional.scala 37:30:@934.4]
  assign _GEN_0 = io_req_valid ? 2'h1 : wait_status; // @[PTW.scala 74:33:@936.6]
  assign _GEN_1 = io_req_valid ? 4'hb : _T_87; // @[PTW.scala 74:33:@936.6]
  assign _GEN_2 = io_req_valid ? addr2 : {{7'd0}, addr}; // @[PTW.scala 74:33:@936.6]
  assign _GEN_4 = io_req_valid ? io_req_p1 : req_p1; // @[PTW.scala 74:33:@936.6]
  assign _GEN_5 = io_req_valid ? io_req_p0 : req_p0; // @[PTW.scala 74:33:@936.6]
  assign _GEN_7 = io_req_valid ? 1'h1 : read; // @[PTW.scala 74:33:@936.6]
  assign _T_113 = 2'h1 == wait_status; // @[Conditional.scala 37:30:@948.6]
  assign _T_118 = pte_ppn_p1 != 9'h0; // @[PTW.scala 102:47:@976.14]
  assign _T_120 = pte_ppn_p0 != 9'h0; // @[PTW.scala 102:65:@977.14]
  assign _T_121 = _T_118 | _T_120; // @[PTW.scala 102:51:@978.14]
  assign _GEN_8 = pte_leaf ? 2'h0 : 2'h2; // @[PTW.scala 96:40:@958.12]
  assign _GEN_10 = pte_leaf ? pte_R : 1'h0; // @[PTW.scala 96:40:@958.12]
  assign _GEN_11 = pte_leaf ? pte_W : 1'h0; // @[PTW.scala 96:40:@958.12]
  assign _GEN_12 = pte_leaf ? pte_X : 1'h0; // @[PTW.scala 96:40:@958.12]
  assign _GEN_13 = pte_leaf ? pte_U : 1'h0; // @[PTW.scala 96:40:@958.12]
  assign _GEN_18 = pte_leaf ? req_p0 : 9'h0; // @[PTW.scala 96:40:@958.12]
  assign _GEN_19 = pte_leaf ? req_p1 : 9'h0; // @[PTW.scala 96:40:@958.12]
  assign _GEN_20 = pte_leaf ? pte_ppn_p2 : 9'h0; // @[PTW.scala 96:40:@958.12]
  assign _GEN_23 = pte_leaf ? _T_121 : 1'h0; // @[PTW.scala 96:40:@958.12]
  assign _GEN_25 = pte_leaf ? 1'h0 : read; // @[PTW.scala 96:40:@958.12]
  assign _GEN_26 = pte_leaf ? {{7'd0}, addr} : addr1; // @[PTW.scala 96:40:@958.12]
  assign _GEN_27 = pte_invalid ? 2'h0 : _GEN_8; // @[PTW.scala 90:36:@951.10]
  assign _GEN_28 = pte_invalid ? 1'h1 : _GEN_23; // @[PTW.scala 90:36:@951.10]
  assign _GEN_29 = pte_invalid ? 1'h1 : pte_leaf; // @[PTW.scala 90:36:@951.10]
  assign _GEN_30 = pte_invalid ? 1'h0 : _GEN_25; // @[PTW.scala 90:36:@951.10]
  assign _GEN_32 = pte_invalid ? 1'h0 : _GEN_10; // @[PTW.scala 90:36:@951.10]
  assign _GEN_33 = pte_invalid ? 1'h0 : _GEN_11; // @[PTW.scala 90:36:@951.10]
  assign _GEN_34 = pte_invalid ? 1'h0 : _GEN_12; // @[PTW.scala 90:36:@951.10]
  assign _GEN_35 = pte_invalid ? 1'h0 : _GEN_13; // @[PTW.scala 90:36:@951.10]
  assign _GEN_40 = pte_invalid ? 9'h0 : _GEN_18; // @[PTW.scala 90:36:@951.10]
  assign _GEN_41 = pte_invalid ? 9'h0 : _GEN_19; // @[PTW.scala 90:36:@951.10]
  assign _GEN_42 = pte_invalid ? 9'h0 : _GEN_20; // @[PTW.scala 90:36:@951.10]
  assign _GEN_45 = pte_invalid ? {{7'd0}, addr} : _GEN_26; // @[PTW.scala 90:36:@951.10]
  assign _GEN_46 = io_mem_ready ? _GEN_27 : wait_status; // @[PTW.scala 89:33:@950.8]
  assign _GEN_47 = io_mem_ready ? _GEN_28 : 1'h0; // @[PTW.scala 89:33:@950.8]
  assign _GEN_48 = io_mem_ready ? _GEN_29 : 1'h0; // @[PTW.scala 89:33:@950.8]
  assign _GEN_49 = io_mem_ready ? _GEN_30 : read; // @[PTW.scala 89:33:@950.8]
  assign _GEN_51 = io_mem_ready ? _GEN_32 : 1'h0; // @[PTW.scala 89:33:@950.8]
  assign _GEN_52 = io_mem_ready ? _GEN_33 : 1'h0; // @[PTW.scala 89:33:@950.8]
  assign _GEN_53 = io_mem_ready ? _GEN_34 : 1'h0; // @[PTW.scala 89:33:@950.8]
  assign _GEN_54 = io_mem_ready ? _GEN_35 : 1'h0; // @[PTW.scala 89:33:@950.8]
  assign _GEN_59 = io_mem_ready ? _GEN_40 : 9'h0; // @[PTW.scala 89:33:@950.8]
  assign _GEN_60 = io_mem_ready ? _GEN_41 : 9'h0; // @[PTW.scala 89:33:@950.8]
  assign _GEN_61 = io_mem_ready ? _GEN_42 : 9'h0; // @[PTW.scala 89:33:@950.8]
  assign _GEN_64 = io_mem_ready ? _GEN_45 : {{7'd0}, addr}; // @[PTW.scala 89:33:@950.8]
  assign _T_124 = 2'h2 == wait_status; // @[Conditional.scala 37:30:@990.8]
  assign _GEN_65 = pte_leaf ? 2'h0 : 2'h3; // @[PTW.scala 121:40:@1000.14]
  assign _GEN_66 = pte_leaf ? pte_ppn_p1 : 9'h0; // @[PTW.scala 121:40:@1000.14]
  assign _GEN_67 = pte_leaf ? _T_120 : 1'h0; // @[PTW.scala 121:40:@1000.14]
  assign _GEN_68 = pte_leaf ? {{7'd0}, addr} : addr0; // @[PTW.scala 121:40:@1000.14]
  assign _GEN_69 = pte_invalid ? 2'h0 : _GEN_65; // @[PTW.scala 115:36:@993.12]
  assign _GEN_70 = pte_invalid ? 1'h1 : _GEN_67; // @[PTW.scala 115:36:@993.12]
  assign _GEN_71 = pte_invalid ? 9'h0 : _GEN_66; // @[PTW.scala 115:36:@993.12]
  assign _GEN_72 = pte_invalid ? {{7'd0}, addr} : _GEN_68; // @[PTW.scala 115:36:@993.12]
  assign _GEN_73 = io_mem_ready ? _GEN_69 : wait_status; // @[PTW.scala 114:33:@992.10]
  assign _GEN_74 = io_mem_ready ? _GEN_70 : 1'h0; // @[PTW.scala 114:33:@992.10]
  assign _GEN_75 = io_mem_ready ? _GEN_71 : 9'h0; // @[PTW.scala 114:33:@992.10]
  assign _GEN_76 = io_mem_ready ? _GEN_72 : {{7'd0}, addr}; // @[PTW.scala 114:33:@992.10]
  assign _T_132 = 2'h3 == wait_status; // @[Conditional.scala 37:30:@1029.10]
  assign _T_136 = pte_leaf == 1'h0; // @[PTW.scala 142:38:@1035.14]
  assign _T_137 = pte_invalid | _T_136; // @[PTW.scala 142:35:@1036.14]
  assign _GEN_79 = _T_137 ? 1'h0 : pte_R; // @[PTW.scala 142:49:@1037.14]
  assign _GEN_80 = _T_137 ? 1'h0 : pte_W; // @[PTW.scala 142:49:@1037.14]
  assign _GEN_81 = _T_137 ? 1'h0 : pte_X; // @[PTW.scala 142:49:@1037.14]
  assign _GEN_82 = _T_137 ? 1'h0 : pte_U; // @[PTW.scala 142:49:@1037.14]
  assign _GEN_87 = _T_137 ? 9'h0 : pte_ppn_p0; // @[PTW.scala 142:49:@1037.14]
  assign _GEN_88 = _T_137 ? 9'h0 : pte_ppn_p1; // @[PTW.scala 142:49:@1037.14]
  assign _GEN_89 = _T_137 ? 9'h0 : pte_ppn_p2; // @[PTW.scala 142:49:@1037.14]
  assign _GEN_92 = io_mem_ready ? 2'h0 : wait_status; // @[PTW.scala 138:33:@1031.12]
  assign _GEN_93 = io_mem_ready ? 1'h0 : read; // @[PTW.scala 138:33:@1031.12]
  assign _GEN_95 = io_mem_ready ? _T_137 : 1'h0; // @[PTW.scala 138:33:@1031.12]
  assign _GEN_97 = io_mem_ready ? _GEN_79 : 1'h0; // @[PTW.scala 138:33:@1031.12]
  assign _GEN_98 = io_mem_ready ? _GEN_80 : 1'h0; // @[PTW.scala 138:33:@1031.12]
  assign _GEN_99 = io_mem_ready ? _GEN_81 : 1'h0; // @[PTW.scala 138:33:@1031.12]
  assign _GEN_100 = io_mem_ready ? _GEN_82 : 1'h0; // @[PTW.scala 138:33:@1031.12]
  assign _GEN_105 = io_mem_ready ? _GEN_87 : 9'h0; // @[PTW.scala 138:33:@1031.12]
  assign _GEN_106 = io_mem_ready ? _GEN_88 : 9'h0; // @[PTW.scala 138:33:@1031.12]
  assign _GEN_107 = io_mem_ready ? _GEN_89 : 9'h0; // @[PTW.scala 138:33:@1031.12]
  assign _GEN_110 = _T_132 ? _GEN_92 : wait_status; // @[Conditional.scala 39:67:@1030.10]
  assign _GEN_111 = _T_132 ? _GEN_93 : read; // @[Conditional.scala 39:67:@1030.10]
  assign _GEN_112 = _T_132 ? io_mem_ready : 1'h0; // @[Conditional.scala 39:67:@1030.10]
  assign _GEN_113 = _T_132 ? _GEN_95 : 1'h0; // @[Conditional.scala 39:67:@1030.10]
  assign _GEN_115 = _T_132 ? _GEN_97 : 1'h0; // @[Conditional.scala 39:67:@1030.10]
  assign _GEN_116 = _T_132 ? _GEN_98 : 1'h0; // @[Conditional.scala 39:67:@1030.10]
  assign _GEN_117 = _T_132 ? _GEN_99 : 1'h0; // @[Conditional.scala 39:67:@1030.10]
  assign _GEN_118 = _T_132 ? _GEN_100 : 1'h0; // @[Conditional.scala 39:67:@1030.10]
  assign _GEN_123 = _T_132 ? _GEN_105 : 9'h0; // @[Conditional.scala 39:67:@1030.10]
  assign _GEN_124 = _T_132 ? _GEN_106 : 9'h0; // @[Conditional.scala 39:67:@1030.10]
  assign _GEN_125 = _T_132 ? _GEN_107 : 9'h0; // @[Conditional.scala 39:67:@1030.10]
  assign _GEN_128 = _T_124 ? _GEN_73 : _GEN_110; // @[Conditional.scala 39:67:@991.8]
  assign _GEN_129 = _T_124 ? _GEN_74 : _GEN_113; // @[Conditional.scala 39:67:@991.8]
  assign _GEN_130 = _T_124 ? _GEN_48 : _GEN_112; // @[Conditional.scala 39:67:@991.8]
  assign _GEN_131 = _T_124 ? _GEN_49 : _GEN_111; // @[Conditional.scala 39:67:@991.8]
  assign _GEN_133 = _T_124 ? _GEN_51 : _GEN_115; // @[Conditional.scala 39:67:@991.8]
  assign _GEN_134 = _T_124 ? _GEN_52 : _GEN_116; // @[Conditional.scala 39:67:@991.8]
  assign _GEN_135 = _T_124 ? _GEN_53 : _GEN_117; // @[Conditional.scala 39:67:@991.8]
  assign _GEN_136 = _T_124 ? _GEN_54 : _GEN_118; // @[Conditional.scala 39:67:@991.8]
  assign _GEN_141 = _T_124 ? _GEN_59 : _GEN_123; // @[Conditional.scala 39:67:@991.8]
  assign _GEN_142 = _T_124 ? _GEN_75 : _GEN_124; // @[Conditional.scala 39:67:@991.8]
  assign _GEN_143 = _T_124 ? _GEN_61 : _GEN_125; // @[Conditional.scala 39:67:@991.8]
  assign _GEN_146 = _T_124 ? _GEN_76 : {{7'd0}, addr}; // @[Conditional.scala 39:67:@991.8]
  assign _GEN_147 = _T_113 ? _GEN_46 : _GEN_128; // @[Conditional.scala 39:67:@949.6]
  assign _GEN_148 = _T_113 ? _GEN_47 : _GEN_129; // @[Conditional.scala 39:67:@949.6]
  assign _GEN_149 = _T_113 ? _GEN_48 : _GEN_130; // @[Conditional.scala 39:67:@949.6]
  assign _GEN_150 = _T_113 ? _GEN_49 : _GEN_131; // @[Conditional.scala 39:67:@949.6]
  assign _GEN_152 = _T_113 ? _GEN_51 : _GEN_133; // @[Conditional.scala 39:67:@949.6]
  assign _GEN_153 = _T_113 ? _GEN_52 : _GEN_134; // @[Conditional.scala 39:67:@949.6]
  assign _GEN_154 = _T_113 ? _GEN_53 : _GEN_135; // @[Conditional.scala 39:67:@949.6]
  assign _GEN_155 = _T_113 ? _GEN_54 : _GEN_136; // @[Conditional.scala 39:67:@949.6]
  assign _GEN_160 = _T_113 ? _GEN_59 : _GEN_141; // @[Conditional.scala 39:67:@949.6]
  assign _GEN_161 = _T_113 ? _GEN_60 : _GEN_142; // @[Conditional.scala 39:67:@949.6]
  assign _GEN_162 = _T_113 ? _GEN_61 : _GEN_143; // @[Conditional.scala 39:67:@949.6]
  assign _GEN_165 = _T_113 ? _GEN_64 : _GEN_146; // @[Conditional.scala 39:67:@949.6]
  assign _GEN_166 = _T_111 ? _GEN_0 : _GEN_147; // @[Conditional.scala 40:58:@935.4]
  assign _GEN_168 = _T_111 ? _GEN_2 : {{7'd0}, addr}; // @[Conditional.scala 40:58:@935.4]
  assign _GEN_170 = _T_111 ? _GEN_4 : req_p1; // @[Conditional.scala 40:58:@935.4]
  assign _GEN_171 = _T_111 ? _GEN_5 : req_p0; // @[Conditional.scala 40:58:@935.4]
  assign _GEN_172 = _T_111 ? _GEN_2 : _GEN_165; // @[Conditional.scala 40:58:@935.4]
  assign _GEN_173 = _T_111 ? _GEN_7 : _GEN_150; // @[Conditional.scala 40:58:@935.4]
  assign io_rsp_ppn_p2 = _T_111 ? 9'h0 : _GEN_162; // @[PTW.scala 67:18:@929.4 PTW.scala 98:33:@971.14 PTW.scala 123:33:@1013.16 PTW.scala 145:33:@1052.16]
  assign io_rsp_ppn_p1 = _T_111 ? 9'h0 : _GEN_161; // @[PTW.scala 67:18:@928.4 PTW.scala 98:33:@970.14 PTW.scala 99:37:@974.14 PTW.scala 123:33:@1012.16 PTW.scala 145:33:@1051.16]
  assign io_rsp_ppn_p0 = _T_111 ? 9'h0 : _GEN_160; // @[PTW.scala 67:18:@927.4 PTW.scala 98:33:@969.14 PTW.scala 100:37:@975.14 PTW.scala 123:33:@1011.16 PTW.scala 124:37:@1016.16 PTW.scala 145:33:@1050.16]
  assign io_rsp_U = _T_111 ? 1'h0 : _GEN_155; // @[PTW.scala 67:18:@922.4 PTW.scala 98:33:@964.14 PTW.scala 123:33:@1006.16 PTW.scala 145:33:@1045.16]
  assign io_rsp_X = _T_111 ? 1'h0 : _GEN_154; // @[PTW.scala 67:18:@921.4 PTW.scala 98:33:@963.14 PTW.scala 123:33:@1005.16 PTW.scala 145:33:@1044.16]
  assign io_rsp_W = _T_111 ? 1'h0 : _GEN_153; // @[PTW.scala 67:18:@920.4 PTW.scala 98:33:@962.14 PTW.scala 123:33:@1004.16 PTW.scala 145:33:@1043.16]
  assign io_rsp_R = _T_111 ? 1'h0 : _GEN_152; // @[PTW.scala 67:18:@919.4 PTW.scala 98:33:@961.14 PTW.scala 123:33:@1003.16 PTW.scala 145:33:@1042.16]
  assign io_ready = _T_111 ? 1'h0 : _GEN_149; // @[PTW.scala 69:18:@933.4 PTW.scala 94:33:@954.12 PTW.scala 103:33:@980.14 PTW.scala 119:33:@996.14 PTW.scala 127:33:@1019.16 PTW.scala 141:29:@1034.14]
  assign io_pf = _T_111 ? 1'h0 : _GEN_148; // @[PTW.scala 68:18:@932.4 PTW.scala 93:33:@953.12 PTW.scala 102:33:@979.14 PTW.scala 118:33:@995.14 PTW.scala 126:33:@1018.16 PTW.scala 143:33:@1038.16]
  assign io_mem_mode = _T_111 ? _GEN_1 : _T_87; // @[PTW.scala 64:18:@884.4 PTW.scala 76:29:@938.8]
  assign io_mem_addr = {{25'd0}, _GEN_168}; // @[PTW.scala 65:18:@885.4 PTW.scala 77:29:@939.8]
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
  wait_status = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  req_p1 = _RAND_1[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  req_p0 = _RAND_2[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  read = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  addr = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      wait_status <= 2'h0;
    end else begin
      if (_T_111) begin
        if (io_req_valid) begin
          wait_status <= 2'h1;
        end
      end else begin
        if (_T_113) begin
          if (io_mem_ready) begin
            if (pte_invalid) begin
              wait_status <= 2'h0;
            end else begin
              if (pte_leaf) begin
                wait_status <= 2'h0;
              end else begin
                wait_status <= 2'h2;
              end
            end
          end
        end else begin
          if (_T_124) begin
            if (io_mem_ready) begin
              if (pte_invalid) begin
                wait_status <= 2'h0;
              end else begin
                if (pte_leaf) begin
                  wait_status <= 2'h0;
                end else begin
                  wait_status <= 2'h3;
                end
              end
            end
          end else begin
            if (_T_132) begin
              if (io_mem_ready) begin
                wait_status <= 2'h0;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      req_p1 <= 9'h0;
    end else begin
      if (_T_111) begin
        if (io_req_valid) begin
          req_p1 <= io_req_p1;
        end
      end
    end
    if (reset) begin
      req_p0 <= 9'h0;
    end else begin
      if (_T_111) begin
        if (io_req_valid) begin
          req_p0 <= io_req_p0;
        end
      end
    end
    if (reset) begin
      read <= 1'h0;
    end else begin
      if (_T_111) begin
        if (io_req_valid) begin
          read <= 1'h1;
        end
      end else begin
        if (_T_113) begin
          if (io_mem_ready) begin
            if (pte_invalid) begin
              read <= 1'h0;
            end else begin
              if (pte_leaf) begin
                read <= 1'h0;
              end
            end
          end
        end else begin
          if (_T_124) begin
            if (io_mem_ready) begin
              if (pte_invalid) begin
                read <= 1'h0;
              end else begin
                if (pte_leaf) begin
                  read <= 1'h0;
                end
              end
            end
          end else begin
            if (_T_132) begin
              if (io_mem_ready) begin
                read <= 1'h0;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      addr <= 32'h0;
    end else begin
      addr <= _GEN_172[31:0];
    end
  end
endmodule
module MMU( // @[:@1430.2]
  input         clock, // @[:@1431.4]
  input         reset, // @[:@1432.4]
  input  [3:0]  io_mem_mode, // @[:@1433.4]
  output        io_mem_ready, // @[:@1433.4]
  input  [63:0] io_mem_addr, // @[:@1433.4]
  output [63:0] io_mem_rdata, // @[:@1433.4]
  input  [63:0] io_mem_wdata, // @[:@1433.4]
  input  [3:0]  io_insr_mode, // @[:@1433.4]
  output        io_insr_ready, // @[:@1433.4]
  input  [63:0] io_insr_addr, // @[:@1433.4]
  output [63:0] io_insr_rdata, // @[:@1433.4]
  input         io_insr_rst, // @[:@1433.4]
  input  [63:0] io_csr_satp, // @[:@1433.4]
  input  [1:0]  io_csr_priv, // @[:@1433.4]
  input         io_csr_mxr, // @[:@1433.4]
  input         io_csr_sum, // @[:@1433.4]
  output [3:0]  io_if_iom_mode, // @[:@1433.4]
  input         io_if_iom_ready, // @[:@1433.4]
  output [63:0] io_if_iom_addr, // @[:@1433.4]
  input  [63:0] io_if_iom_rdata, // @[:@1433.4]
  output [3:0]  io_mem_iom_mode, // @[:@1433.4]
  input         io_mem_iom_ready, // @[:@1433.4]
  output [63:0] io_mem_iom_addr, // @[:@1433.4]
  input  [63:0] io_mem_iom_rdata, // @[:@1433.4]
  output [63:0] io_mem_iom_wdata // @[:@1433.4]
);
  wire  ptw_if_clock; // @[MMU.scala 37:23:@1435.4]
  wire  ptw_if_reset; // @[MMU.scala 37:23:@1435.4]
  wire [8:0] ptw_if_io_root_p2; // @[MMU.scala 37:23:@1435.4]
  wire [8:0] ptw_if_io_root_p1; // @[MMU.scala 37:23:@1435.4]
  wire [8:0] ptw_if_io_root_p0; // @[MMU.scala 37:23:@1435.4]
  wire [8:0] ptw_if_io_req_p2; // @[MMU.scala 37:23:@1435.4]
  wire [8:0] ptw_if_io_req_p1; // @[MMU.scala 37:23:@1435.4]
  wire [8:0] ptw_if_io_req_p0; // @[MMU.scala 37:23:@1435.4]
  wire  ptw_if_io_req_valid; // @[MMU.scala 37:23:@1435.4]
  wire [8:0] ptw_if_io_rsp_ppn_p2; // @[MMU.scala 37:23:@1435.4]
  wire [8:0] ptw_if_io_rsp_ppn_p1; // @[MMU.scala 37:23:@1435.4]
  wire [8:0] ptw_if_io_rsp_ppn_p0; // @[MMU.scala 37:23:@1435.4]
  wire  ptw_if_io_rsp_U; // @[MMU.scala 37:23:@1435.4]
  wire  ptw_if_io_rsp_X; // @[MMU.scala 37:23:@1435.4]
  wire  ptw_if_io_rsp_W; // @[MMU.scala 37:23:@1435.4]
  wire  ptw_if_io_rsp_R; // @[MMU.scala 37:23:@1435.4]
  wire  ptw_if_io_ready; // @[MMU.scala 37:23:@1435.4]
  wire  ptw_if_io_pf; // @[MMU.scala 37:23:@1435.4]
  wire [3:0] ptw_if_io_mem_mode; // @[MMU.scala 37:23:@1435.4]
  wire  ptw_if_io_mem_ready; // @[MMU.scala 37:23:@1435.4]
  wire [63:0] ptw_if_io_mem_addr; // @[MMU.scala 37:23:@1435.4]
  wire [63:0] ptw_if_io_mem_rdata; // @[MMU.scala 37:23:@1435.4]
  wire  ptw_mem_clock; // @[MMU.scala 38:23:@1438.4]
  wire  ptw_mem_reset; // @[MMU.scala 38:23:@1438.4]
  wire [8:0] ptw_mem_io_root_p2; // @[MMU.scala 38:23:@1438.4]
  wire [8:0] ptw_mem_io_root_p1; // @[MMU.scala 38:23:@1438.4]
  wire [8:0] ptw_mem_io_root_p0; // @[MMU.scala 38:23:@1438.4]
  wire [8:0] ptw_mem_io_req_p2; // @[MMU.scala 38:23:@1438.4]
  wire [8:0] ptw_mem_io_req_p1; // @[MMU.scala 38:23:@1438.4]
  wire [8:0] ptw_mem_io_req_p0; // @[MMU.scala 38:23:@1438.4]
  wire  ptw_mem_io_req_valid; // @[MMU.scala 38:23:@1438.4]
  wire [8:0] ptw_mem_io_rsp_ppn_p2; // @[MMU.scala 38:23:@1438.4]
  wire [8:0] ptw_mem_io_rsp_ppn_p1; // @[MMU.scala 38:23:@1438.4]
  wire [8:0] ptw_mem_io_rsp_ppn_p0; // @[MMU.scala 38:23:@1438.4]
  wire  ptw_mem_io_rsp_U; // @[MMU.scala 38:23:@1438.4]
  wire  ptw_mem_io_rsp_X; // @[MMU.scala 38:23:@1438.4]
  wire  ptw_mem_io_rsp_W; // @[MMU.scala 38:23:@1438.4]
  wire  ptw_mem_io_rsp_R; // @[MMU.scala 38:23:@1438.4]
  wire  ptw_mem_io_ready; // @[MMU.scala 38:23:@1438.4]
  wire  ptw_mem_io_pf; // @[MMU.scala 38:23:@1438.4]
  wire [3:0] ptw_mem_io_mem_mode; // @[MMU.scala 38:23:@1438.4]
  wire  ptw_mem_io_mem_ready; // @[MMU.scala 38:23:@1438.4]
  wire [63:0] ptw_mem_io_mem_addr; // @[MMU.scala 38:23:@1438.4]
  wire [63:0] ptw_mem_io_mem_rdata; // @[MMU.scala 38:23:@1438.4]
  reg [63:0] csr_satp; // @[MMU.scala 41:24:@1455.4]
  reg [63:0] _RAND_0;
  reg [1:0] csr_priv; // @[MMU.scala 41:24:@1455.4]
  reg [31:0] _RAND_1;
  reg  csr_mxr; // @[MMU.scala 41:24:@1455.4]
  reg [31:0] _RAND_2;
  reg  csr_sum; // @[MMU.scala 41:24:@1455.4]
  reg [31:0] _RAND_3;
  reg [1:0] if_status; // @[MMU.scala 44:27:@1456.4]
  reg [31:0] _RAND_4;
  reg [3:0] if_mode; // @[MMU.scala 45:27:@1457.4]
  reg [31:0] _RAND_5;
  reg [63:0] if_addr; // @[MMU.scala 46:27:@1458.4]
  reg [63:0] _RAND_6;
  reg [63:0] if_pha; // @[MMU.scala 47:27:@1459.4]
  reg [63:0] _RAND_7;
  reg  if_rst; // @[MMU.scala 48:27:@1460.4]
  reg [31:0] _RAND_8;
  reg [1:0] mem_status; // @[MMU.scala 49:27:@1461.4]
  reg [31:0] _RAND_9;
  reg [3:0] mem_mode; // @[MMU.scala 50:27:@1462.4]
  reg [31:0] _RAND_10;
  reg [63:0] mem_addr; // @[MMU.scala 51:27:@1463.4]
  reg [63:0] _RAND_11;
  reg [63:0] mem_pha; // @[MMU.scala 52:27:@1464.4]
  reg [63:0] _RAND_12;
  wire  if_free; // @[MMU.scala 54:30:@1465.4]
  wire  mem_free; // @[MMU.scala 55:31:@1466.4]
  wire  _T_106; // @[MMU.scala 59:32:@1467.4]
  wire [63:0] real_csr_satp; // @[MMU.scala 59:23:@1468.4]
  wire [1:0] real_csr_priv; // @[MMU.scala 59:23:@1468.4]
  wire  real_csr_mxr; // @[MMU.scala 59:23:@1468.4]
  wire  real_csr_sum; // @[MMU.scala 59:23:@1468.4]
  wire  _T_107; // @[MMU.scala 68:35:@1469.4]
  wire  _T_109; // @[MMU.scala 68:49:@1470.4]
  wire  e_if_user; // @[MMU.scala 68:46:@1471.4]
  wire  e_if_exec; // @[MMU.scala 69:21:@1472.4]
  wire  _T_111; // @[MMU.scala 70:34:@1473.4]
  wire  e_if; // @[MMU.scala 70:47:@1474.4]
  wire  _T_114; // @[MMU.scala 72:49:@1476.4]
  wire  e_mem_user; // @[MMU.scala 72:46:@1477.4]
  wire  _T_115; // @[memoryCtrl.scala 20:35:@1478.4]
  wire [3:0] _T_116; // @[memoryCtrl.scala 20:46:@1479.4]
  wire  _T_118; // @[memoryCtrl.scala 20:46:@1480.4]
  wire  _T_120; // @[memoryCtrl.scala 20:42:@1481.4]
  wire  _T_121; // @[memoryCtrl.scala 20:39:@1482.4]
  wire  _T_122; // @[MMU.scala 73:83:@1483.4]
  wire  _T_123; // @[MMU.scala 73:65:@1484.4]
  wire  _T_125; // @[MMU.scala 73:49:@1485.4]
  wire  e_mem_read; // @[MMU.scala 73:46:@1486.4]
  wire  _T_128; // @[memoryCtrl.scala 21:34:@1488.4]
  wire  _T_130; // @[MMU.scala 74:50:@1489.4]
  wire  e_mem_write; // @[MMU.scala 74:47:@1490.4]
  wire  _T_131; // @[MMU.scala 75:35:@1491.4]
  wire  _T_133; // @[MMU.scala 75:49:@1492.4]
  wire  _T_134; // @[MMU.scala 75:46:@1493.4]
  wire  e_mem_sum; // @[MMU.scala 75:63:@1494.4]
  wire  _T_135; // @[MMU.scala 76:35:@1495.4]
  wire  _T_136; // @[MMU.scala 76:49:@1496.4]
  wire  _T_137; // @[MMU.scala 76:63:@1497.4]
  wire  e_mem; // @[MMU.scala 76:78:@1498.4]
  wire [3:0] _T_138; // @[MMU.scala 79:30:@1499.4]
  wire  mmu_en; // @[MMU.scala 79:38:@1500.4]
  wire  is_mem; // @[MMU.scala 80:29:@1501.4]
  wire  _T_140; // @[MMU.scala 81:30:@1502.4]
  wire  _T_142; // @[MMU.scala 81:46:@1503.4]
  wire  is_if; // @[MMU.scala 81:43:@1504.4]
  wire [64:0] _T_145; // @[MMU.scala 92:62:@1507.4]
  wire [64:0] _T_146; // @[MMU.scala 92:62:@1508.4]
  wire [63:0] _T_147; // @[MMU.scala 92:62:@1509.4]
  wire [63:0] real_if_addr; // @[MMU.scala 92:26:@1510.4]
  wire [64:0] _T_148; // @[MMU.scala 93:62:@1511.4]
  wire [64:0] _T_149; // @[MMU.scala 93:62:@1512.4]
  wire [63:0] _T_150; // @[MMU.scala 93:62:@1513.4]
  wire [63:0] real_mem_addr; // @[MMU.scala 93:26:@1514.4]
  wire [11:0] _T_154; // @[MMU.scala 94:66:@1517.4]
  wire [63:0] ptw_if_addr; // @[Cat.scala 30:58:@1519.4]
  wire [11:0] _T_159; // @[MMU.scala 95:67:@1522.4]
  wire [63:0] ptw_mem_addr; // @[Cat.scala 30:58:@1524.4]
  wire [26:0] _T_171; // @[MMU.scala 100:36:@1535.4]
  wire  _GEN_5; // @[MMU.scala 156:22:@1654.4]
  wire  _T_229; // @[Conditional.scala 37:30:@1657.4]
  wire  _T_230; // @[MMU.scala 163:19:@1659.6]
  wire [3:0] _GEN_8; // @[MMU.scala 178:36:@1673.10]
  wire [63:0] _GEN_9; // @[MMU.scala 178:36:@1673.10]
  wire [1:0] _GEN_15; // @[MMU.scala 169:23:@1665.8]
  wire [3:0] _GEN_17; // @[MMU.scala 169:23:@1665.8]
  wire [63:0] _GEN_18; // @[MMU.scala 169:23:@1665.8]
  wire [63:0] _GEN_19; // @[MMU.scala 169:23:@1665.8]
  wire [3:0] _GEN_20; // @[MMU.scala 163:32:@1660.6]
  wire [3:0] _GEN_21; // @[MMU.scala 163:32:@1660.6]
  wire [63:0] _GEN_22; // @[MMU.scala 163:32:@1660.6]
  wire  _GEN_23; // @[MMU.scala 163:32:@1660.6]
  wire  _GEN_27; // @[MMU.scala 163:32:@1660.6]
  wire [1:0] _GEN_28; // @[MMU.scala 163:32:@1660.6]
  wire [63:0] _GEN_30; // @[MMU.scala 163:32:@1660.6]
  wire [63:0] _GEN_31; // @[MMU.scala 163:32:@1660.6]
  wire  _T_237; // @[Conditional.scala 37:30:@1692.6]
  wire [1:0] _GEN_33; // @[MMU.scala 204:21:@1697.10]
  wire [63:0] _GEN_34; // @[MMU.scala 204:21:@1697.10]
  wire  _GEN_53; // @[MMU.scala 199:30:@1696.8]
  wire [1:0] _GEN_54; // @[MMU.scala 199:30:@1696.8]
  wire [63:0] _GEN_55; // @[MMU.scala 199:30:@1696.8]
  wire  _T_249; // @[Conditional.scala 37:30:@1737.8]
  wire  _T_251; // @[MMU.scala 225:47:@1743.12]
  wire  _T_253; // @[MMU.scala 225:58:@1744.12]
  wire  _T_254; // @[MMU.scala 225:55:@1745.12]
  wire [63:0] _GEN_75; // @[MMU.scala 225:72:@1746.12]
  wire [63:0] _GEN_76; // @[MMU.scala 225:72:@1746.12]
  wire [1:0] _GEN_77; // @[MMU.scala 223:30:@1741.10]
  wire  _GEN_78; // @[MMU.scala 223:30:@1741.10]
  wire [63:0] _GEN_79; // @[MMU.scala 223:30:@1741.10]
  wire [63:0] _GEN_80; // @[MMU.scala 223:30:@1741.10]
  wire [3:0] _GEN_81; // @[Conditional.scala 39:67:@1738.8]
  wire [63:0] _GEN_82; // @[Conditional.scala 39:67:@1738.8]
  wire [1:0] _GEN_83; // @[Conditional.scala 39:67:@1738.8]
  wire  _GEN_84; // @[Conditional.scala 39:67:@1738.8]
  wire [63:0] _GEN_85; // @[Conditional.scala 39:67:@1738.8]
  wire [63:0] _GEN_86; // @[Conditional.scala 39:67:@1738.8]
  wire [3:0] _GEN_87; // @[Conditional.scala 39:67:@1693.6]
  wire [63:0] _GEN_88; // @[Conditional.scala 39:67:@1693.6]
  wire  _GEN_90; // @[Conditional.scala 39:67:@1693.6]
  wire [1:0] _GEN_91; // @[Conditional.scala 39:67:@1693.6]
  wire [63:0] _GEN_92; // @[Conditional.scala 39:67:@1693.6]
  wire [63:0] _GEN_111; // @[Conditional.scala 39:67:@1693.6]
  wire [3:0] _GEN_113; // @[Conditional.scala 40:58:@1658.4]
  wire [63:0] _GEN_114; // @[Conditional.scala 40:58:@1658.4]
  wire  _GEN_115; // @[Conditional.scala 40:58:@1658.4]
  wire [1:0] _GEN_120; // @[Conditional.scala 40:58:@1658.4]
  wire [63:0] _GEN_123; // @[Conditional.scala 40:58:@1658.4]
  wire  _T_256; // @[Conditional.scala 37:30:@1755.4]
  wire  _T_257; // @[MMU.scala 241:20:@1757.6]
  wire  _T_258; // @[MMU.scala 248:29:@1763.10]
  wire [3:0] _GEN_144; // @[MMU.scala 258:38:@1777.12]
  wire [63:0] _GEN_145; // @[MMU.scala 258:38:@1777.12]
  wire [1:0] _GEN_147; // @[MMU.scala 248:44:@1764.10]
  wire [63:0] _GEN_148; // @[MMU.scala 248:44:@1764.10]
  wire [63:0] _GEN_149; // @[MMU.scala 248:44:@1764.10]
  wire  _GEN_154; // @[MMU.scala 248:44:@1764.10]
  wire [3:0] _GEN_155; // @[MMU.scala 248:44:@1764.10]
  wire [1:0] _GEN_156; // @[MMU.scala 276:35:@1793.10]
  wire [1:0] _GEN_158; // @[MMU.scala 246:23:@1762.8]
  wire [63:0] _GEN_159; // @[MMU.scala 246:23:@1762.8]
  wire [63:0] _GEN_160; // @[MMU.scala 246:23:@1762.8]
  wire  _GEN_165; // @[MMU.scala 246:23:@1762.8]
  wire [3:0] _GEN_166; // @[MMU.scala 246:23:@1762.8]
  wire  _GEN_167; // @[MMU.scala 246:23:@1762.8]
  wire [3:0] _GEN_168; // @[MMU.scala 241:32:@1758.6]
  wire [3:0] _GEN_169; // @[MMU.scala 241:32:@1758.6]
  wire [63:0] _GEN_170; // @[MMU.scala 241:32:@1758.6]
  wire [1:0] _GEN_171; // @[MMU.scala 241:32:@1758.6]
  wire [63:0] _GEN_172; // @[MMU.scala 241:32:@1758.6]
  wire [63:0] _GEN_173; // @[MMU.scala 241:32:@1758.6]
  wire  _GEN_178; // @[MMU.scala 241:32:@1758.6]
  wire  _GEN_179; // @[MMU.scala 241:32:@1758.6]
  wire  _T_265; // @[Conditional.scala 37:30:@1801.6]
  wire [1:0] _GEN_181; // @[MMU.scala 287:22:@1806.10]
  wire [63:0] _GEN_182; // @[MMU.scala 287:22:@1806.10]
  wire  _GEN_201; // @[MMU.scala 286:31:@1805.8]
  wire [1:0] _GEN_202; // @[MMU.scala 286:31:@1805.8]
  wire [63:0] _GEN_203; // @[MMU.scala 286:31:@1805.8]
  wire  _T_277; // @[Conditional.scala 37:30:@1846.8]
  wire [1:0] _GEN_222; // @[MMU.scala 305:31:@1850.10]
  wire [3:0] _GEN_223; // @[Conditional.scala 39:67:@1847.8]
  wire [63:0] _GEN_224; // @[Conditional.scala 39:67:@1847.8]
  wire [1:0] _GEN_225; // @[Conditional.scala 39:67:@1847.8]
  wire  _GEN_226; // @[Conditional.scala 39:67:@1847.8]
  wire [3:0] _GEN_227; // @[Conditional.scala 39:67:@1802.6]
  wire [63:0] _GEN_228; // @[Conditional.scala 39:67:@1802.6]
  wire  _GEN_230; // @[Conditional.scala 39:67:@1802.6]
  wire [1:0] _GEN_231; // @[Conditional.scala 39:67:@1802.6]
  wire [63:0] _GEN_232; // @[Conditional.scala 39:67:@1802.6]
  wire [3:0] _GEN_252; // @[Conditional.scala 40:58:@1756.4]
  wire [63:0] _GEN_253; // @[Conditional.scala 40:58:@1756.4]
  wire [1:0] _GEN_254; // @[Conditional.scala 40:58:@1756.4]
  wire [63:0] _GEN_256; // @[Conditional.scala 40:58:@1756.4]
  PTW ptw_if ( // @[MMU.scala 37:23:@1435.4]
    .clock(ptw_if_clock),
    .reset(ptw_if_reset),
    .io_root_p2(ptw_if_io_root_p2),
    .io_root_p1(ptw_if_io_root_p1),
    .io_root_p0(ptw_if_io_root_p0),
    .io_req_p2(ptw_if_io_req_p2),
    .io_req_p1(ptw_if_io_req_p1),
    .io_req_p0(ptw_if_io_req_p0),
    .io_req_valid(ptw_if_io_req_valid),
    .io_rsp_ppn_p2(ptw_if_io_rsp_ppn_p2),
    .io_rsp_ppn_p1(ptw_if_io_rsp_ppn_p1),
    .io_rsp_ppn_p0(ptw_if_io_rsp_ppn_p0),
    .io_rsp_U(ptw_if_io_rsp_U),
    .io_rsp_X(ptw_if_io_rsp_X),
    .io_rsp_W(ptw_if_io_rsp_W),
    .io_rsp_R(ptw_if_io_rsp_R),
    .io_ready(ptw_if_io_ready),
    .io_pf(ptw_if_io_pf),
    .io_mem_mode(ptw_if_io_mem_mode),
    .io_mem_ready(ptw_if_io_mem_ready),
    .io_mem_addr(ptw_if_io_mem_addr),
    .io_mem_rdata(ptw_if_io_mem_rdata)
  );
  PTW ptw_mem ( // @[MMU.scala 38:23:@1438.4]
    .clock(ptw_mem_clock),
    .reset(ptw_mem_reset),
    .io_root_p2(ptw_mem_io_root_p2),
    .io_root_p1(ptw_mem_io_root_p1),
    .io_root_p0(ptw_mem_io_root_p0),
    .io_req_p2(ptw_mem_io_req_p2),
    .io_req_p1(ptw_mem_io_req_p1),
    .io_req_p0(ptw_mem_io_req_p0),
    .io_req_valid(ptw_mem_io_req_valid),
    .io_rsp_ppn_p2(ptw_mem_io_rsp_ppn_p2),
    .io_rsp_ppn_p1(ptw_mem_io_rsp_ppn_p1),
    .io_rsp_ppn_p0(ptw_mem_io_rsp_ppn_p0),
    .io_rsp_U(ptw_mem_io_rsp_U),
    .io_rsp_X(ptw_mem_io_rsp_X),
    .io_rsp_W(ptw_mem_io_rsp_W),
    .io_rsp_R(ptw_mem_io_rsp_R),
    .io_ready(ptw_mem_io_ready),
    .io_pf(ptw_mem_io_pf),
    .io_mem_mode(ptw_mem_io_mem_mode),
    .io_mem_ready(ptw_mem_io_mem_ready),
    .io_mem_addr(ptw_mem_io_mem_addr),
    .io_mem_rdata(ptw_mem_io_mem_rdata)
  );
  assign if_free = if_status == 2'h0; // @[MMU.scala 54:30:@1465.4]
  assign mem_free = mem_status == 2'h0; // @[MMU.scala 55:31:@1466.4]
  assign _T_106 = if_free & mem_free; // @[MMU.scala 59:32:@1467.4]
  assign real_csr_satp = _T_106 ? io_csr_satp : csr_satp; // @[MMU.scala 59:23:@1468.4]
  assign real_csr_priv = _T_106 ? io_csr_priv : csr_priv; // @[MMU.scala 59:23:@1468.4]
  assign real_csr_mxr = _T_106 ? io_csr_mxr : csr_mxr; // @[MMU.scala 59:23:@1468.4]
  assign real_csr_sum = _T_106 ? io_csr_sum : csr_sum; // @[MMU.scala 59:23:@1468.4]
  assign _T_107 = real_csr_priv == 2'h0; // @[MMU.scala 68:35:@1469.4]
  assign _T_109 = ptw_if_io_rsp_U == 1'h0; // @[MMU.scala 68:49:@1470.4]
  assign e_if_user = _T_107 & _T_109; // @[MMU.scala 68:46:@1471.4]
  assign e_if_exec = ptw_if_io_rsp_X == 1'h0; // @[MMU.scala 69:21:@1472.4]
  assign _T_111 = ptw_if_io_pf | e_if_user; // @[MMU.scala 70:34:@1473.4]
  assign e_if = _T_111 | e_if_exec; // @[MMU.scala 70:47:@1474.4]
  assign _T_114 = ptw_mem_io_rsp_U == 1'h0; // @[MMU.scala 72:49:@1476.4]
  assign e_mem_user = _T_107 & _T_114; // @[MMU.scala 72:46:@1477.4]
  assign _T_115 = io_mem_mode[3]; // @[memoryCtrl.scala 20:35:@1478.4]
  assign _T_116 = ~ io_mem_mode; // @[memoryCtrl.scala 20:46:@1479.4]
  assign _T_118 = _T_116 == 4'h0; // @[memoryCtrl.scala 20:46:@1480.4]
  assign _T_120 = _T_118 == 1'h0; // @[memoryCtrl.scala 20:42:@1481.4]
  assign _T_121 = _T_115 & _T_120; // @[memoryCtrl.scala 20:39:@1482.4]
  assign _T_122 = ptw_mem_io_rsp_X & real_csr_mxr; // @[MMU.scala 73:83:@1483.4]
  assign _T_123 = ptw_mem_io_rsp_R | _T_122; // @[MMU.scala 73:65:@1484.4]
  assign _T_125 = _T_123 == 1'h0; // @[MMU.scala 73:49:@1485.4]
  assign e_mem_read = _T_121 & _T_125; // @[MMU.scala 73:46:@1486.4]
  assign _T_128 = _T_115 == 1'h0; // @[memoryCtrl.scala 21:34:@1488.4]
  assign _T_130 = ptw_mem_io_rsp_W == 1'h0; // @[MMU.scala 74:50:@1489.4]
  assign e_mem_write = _T_128 & _T_130; // @[MMU.scala 74:47:@1490.4]
  assign _T_131 = real_csr_priv == 2'h1; // @[MMU.scala 75:35:@1491.4]
  assign _T_133 = real_csr_sum == 1'h0; // @[MMU.scala 75:49:@1492.4]
  assign _T_134 = _T_131 & _T_133; // @[MMU.scala 75:46:@1493.4]
  assign e_mem_sum = _T_134 & ptw_mem_io_rsp_U; // @[MMU.scala 75:63:@1494.4]
  assign _T_135 = ptw_mem_io_pf | e_mem_user; // @[MMU.scala 76:35:@1495.4]
  assign _T_136 = _T_135 | e_mem_read; // @[MMU.scala 76:49:@1496.4]
  assign _T_137 = _T_136 | e_mem_write; // @[MMU.scala 76:63:@1497.4]
  assign e_mem = _T_137 | e_mem_sum; // @[MMU.scala 76:78:@1498.4]
  assign _T_138 = real_csr_satp[63:60]; // @[MMU.scala 79:30:@1499.4]
  assign mmu_en = _T_138 == 4'h8; // @[MMU.scala 79:38:@1500.4]
  assign is_mem = io_mem_mode != 4'hf; // @[MMU.scala 80:29:@1501.4]
  assign _T_140 = io_insr_mode != 4'hf; // @[MMU.scala 81:30:@1502.4]
  assign _T_142 = is_mem == 1'h0; // @[MMU.scala 81:46:@1503.4]
  assign is_if = _T_140 & _T_142; // @[MMU.scala 81:43:@1504.4]
  assign _T_145 = io_insr_addr - 64'hffffffff40000000; // @[MMU.scala 92:62:@1507.4]
  assign _T_146 = $unsigned(_T_145); // @[MMU.scala 92:62:@1508.4]
  assign _T_147 = _T_146[63:0]; // @[MMU.scala 92:62:@1509.4]
  assign real_if_addr = mmu_en ? io_insr_addr : _T_147; // @[MMU.scala 92:26:@1510.4]
  assign _T_148 = io_mem_addr - 64'hffffffff40000000; // @[MMU.scala 93:62:@1511.4]
  assign _T_149 = $unsigned(_T_148); // @[MMU.scala 93:62:@1512.4]
  assign _T_150 = _T_149[63:0]; // @[MMU.scala 93:62:@1513.4]
  assign real_mem_addr = mmu_en ? io_mem_addr : _T_150; // @[MMU.scala 93:26:@1514.4]
  assign _T_154 = if_addr[11:0]; // @[MMU.scala 94:66:@1517.4]
  assign ptw_if_addr = {25'h0,ptw_if_io_rsp_ppn_p2,ptw_if_io_rsp_ppn_p1,ptw_if_io_rsp_ppn_p0,_T_154}; // @[Cat.scala 30:58:@1519.4]
  assign _T_159 = mem_addr[11:0]; // @[MMU.scala 95:67:@1522.4]
  assign ptw_mem_addr = {25'h0,ptw_mem_io_rsp_ppn_p2,ptw_mem_io_rsp_ppn_p1,ptw_mem_io_rsp_ppn_p0,_T_159}; // @[Cat.scala 30:58:@1524.4]
  assign _T_171 = real_csr_satp[26:0]; // @[MMU.scala 100:36:@1535.4]
  assign _GEN_5 = io_insr_rst ? 1'h1 : if_rst; // @[MMU.scala 156:22:@1654.4]
  assign _T_229 = 2'h0 == if_status; // @[Conditional.scala 37:30:@1657.4]
  assign _T_230 = is_if & mem_free; // @[MMU.scala 163:19:@1659.6]
  assign _GEN_8 = ptw_if_io_mem_mode; // @[MMU.scala 178:36:@1673.10]
  assign _GEN_9 = ptw_if_io_mem_addr; // @[MMU.scala 178:36:@1673.10]
  assign _GEN_15 = mmu_en ? 2'h1 : 2'h2; // @[MMU.scala 169:23:@1665.8]
  assign _GEN_17 = mmu_en ? _GEN_8 : io_insr_mode; // @[MMU.scala 169:23:@1665.8]
  assign _GEN_18 = mmu_en ? _GEN_9 : real_if_addr; // @[MMU.scala 169:23:@1665.8]
  assign _GEN_19 = mmu_en ? if_pha : real_if_addr; // @[MMU.scala 169:23:@1665.8]
  assign _GEN_20 = _T_230 ? _GEN_17 : 4'hf; // @[MMU.scala 163:32:@1660.6]
  assign _GEN_21 = _T_230 ? io_insr_mode : if_mode; // @[MMU.scala 163:32:@1660.6]
  assign _GEN_22 = _T_230 ? real_if_addr : if_addr; // @[MMU.scala 163:32:@1660.6]
  assign _GEN_23 = _T_230 ? 1'h0 : _GEN_5; // @[MMU.scala 163:32:@1660.6]
  assign _GEN_27 = _T_230 ? mmu_en : 1'h0; // @[MMU.scala 163:32:@1660.6]
  assign _GEN_28 = _T_230 ? _GEN_15 : if_status; // @[MMU.scala 163:32:@1660.6]
  assign _GEN_30 = _T_230 ? _GEN_18 : real_if_addr; // @[MMU.scala 163:32:@1660.6]
  assign _GEN_31 = _T_230 ? _GEN_19 : if_pha; // @[MMU.scala 163:32:@1660.6]
  assign _T_237 = 2'h1 == if_status; // @[Conditional.scala 37:30:@1692.6]
  assign _GEN_33 = e_if ? 2'h0 : 2'h2; // @[MMU.scala 204:21:@1697.10]
  assign _GEN_34 = e_if ? if_pha : ptw_if_addr; // @[MMU.scala 204:21:@1697.10]
  assign _GEN_53 = ptw_if_io_ready ? e_if : 1'h0; // @[MMU.scala 199:30:@1696.8]
  assign _GEN_54 = ptw_if_io_ready ? _GEN_33 : if_status; // @[MMU.scala 199:30:@1696.8]
  assign _GEN_55 = ptw_if_io_ready ? _GEN_34 : if_pha; // @[MMU.scala 199:30:@1696.8]
  assign _T_249 = 2'h2 == if_status; // @[Conditional.scala 37:30:@1737.8]
  assign _T_251 = if_rst == 1'h0; // @[MMU.scala 225:47:@1743.12]
  assign _T_253 = io_insr_rst == 1'h0; // @[MMU.scala 225:58:@1744.12]
  assign _T_254 = _T_251 & _T_253; // @[MMU.scala 225:55:@1745.12]
  assign _GEN_75 = _T_254 ? if_addr : real_if_addr; // @[MMU.scala 225:72:@1746.12]
  assign _GEN_76 = _T_254 ? if_pha : real_if_addr; // @[MMU.scala 225:72:@1746.12]
  assign _GEN_77 = io_if_iom_ready ? 2'h0 : if_status; // @[MMU.scala 223:30:@1741.10]
  assign _GEN_78 = io_if_iom_ready ? _T_254 : 1'h0; // @[MMU.scala 223:30:@1741.10]
  assign _GEN_79 = io_if_iom_ready ? _GEN_75 : if_addr; // @[MMU.scala 223:30:@1741.10]
  assign _GEN_80 = io_if_iom_ready ? _GEN_76 : if_pha; // @[MMU.scala 223:30:@1741.10]
  assign _GEN_81 = _T_249 ? if_mode : 4'hf; // @[Conditional.scala 39:67:@1738.8]
  assign _GEN_82 = _T_249 ? if_pha : real_if_addr; // @[Conditional.scala 39:67:@1738.8]
  assign _GEN_83 = _T_249 ? _GEN_77 : if_status; // @[Conditional.scala 39:67:@1738.8]
  assign _GEN_84 = _T_249 ? _GEN_78 : 1'h0; // @[Conditional.scala 39:67:@1738.8]
  assign _GEN_85 = _T_249 ? _GEN_79 : if_addr; // @[Conditional.scala 39:67:@1738.8]
  assign _GEN_86 = _T_249 ? _GEN_80 : if_pha; // @[Conditional.scala 39:67:@1738.8]
  assign _GEN_87 = _T_237 ? ptw_if_io_mem_mode : _GEN_81; // @[Conditional.scala 39:67:@1693.6]
  assign _GEN_88 = _T_237 ? ptw_if_io_mem_addr : _GEN_82; // @[Conditional.scala 39:67:@1693.6]
  assign _GEN_90 = _T_237 ? _GEN_53 : _GEN_84; // @[Conditional.scala 39:67:@1693.6]
  assign _GEN_91 = _T_237 ? _GEN_54 : _GEN_83; // @[Conditional.scala 39:67:@1693.6]
  assign _GEN_92 = _T_237 ? _GEN_55 : _GEN_86; // @[Conditional.scala 39:67:@1693.6]
  assign _GEN_111 = _T_237 ? if_addr : _GEN_85; // @[Conditional.scala 39:67:@1693.6]
  assign _GEN_113 = _T_229 ? _GEN_21 : if_mode; // @[Conditional.scala 40:58:@1658.4]
  assign _GEN_114 = _T_229 ? _GEN_22 : _GEN_111; // @[Conditional.scala 40:58:@1658.4]
  assign _GEN_115 = _T_229 ? _GEN_23 : _GEN_5; // @[Conditional.scala 40:58:@1658.4]
  assign _GEN_120 = _T_229 ? _GEN_28 : _GEN_91; // @[Conditional.scala 40:58:@1658.4]
  assign _GEN_123 = _T_229 ? _GEN_31 : _GEN_92; // @[Conditional.scala 40:58:@1658.4]
  assign _T_256 = 2'h0 == mem_status; // @[Conditional.scala 37:30:@1755.4]
  assign _T_257 = is_mem & if_free; // @[MMU.scala 241:20:@1757.6]
  assign _T_258 = io_mem_addr == 64'h123456789abcdef0; // @[MMU.scala 248:29:@1763.10]
  assign _GEN_144 = ptw_mem_io_mem_mode; // @[MMU.scala 258:38:@1777.12]
  assign _GEN_145 = ptw_mem_io_mem_addr; // @[MMU.scala 258:38:@1777.12]
  assign _GEN_147 = _T_258 ? 2'h2 : 2'h1; // @[MMU.scala 248:44:@1764.10]
  assign _GEN_148 = _T_258 ? 64'h807ffff8 : _GEN_145; // @[MMU.scala 248:44:@1764.10]
  assign _GEN_149 = _T_258 ? 64'h807ffff8 : mem_pha; // @[MMU.scala 248:44:@1764.10]
  assign _GEN_154 = _T_258 ? 1'h0 : 1'h1; // @[MMU.scala 248:44:@1764.10]
  assign _GEN_155 = _T_258 ? io_mem_mode : _GEN_144; // @[MMU.scala 248:44:@1764.10]
  assign _GEN_156 = io_mem_iom_ready ? 2'h0 : 2'h2; // @[MMU.scala 276:35:@1793.10]
  assign _GEN_158 = mmu_en ? _GEN_147 : _GEN_156; // @[MMU.scala 246:23:@1762.8]
  assign _GEN_159 = mmu_en ? _GEN_148 : real_mem_addr; // @[MMU.scala 246:23:@1762.8]
  assign _GEN_160 = mmu_en ? _GEN_149 : real_mem_addr; // @[MMU.scala 246:23:@1762.8]
  assign _GEN_165 = mmu_en ? _GEN_154 : 1'h0; // @[MMU.scala 246:23:@1762.8]
  assign _GEN_166 = mmu_en ? _GEN_155 : io_mem_mode; // @[MMU.scala 246:23:@1762.8]
  assign _GEN_167 = mmu_en ? 1'h0 : io_mem_iom_ready; // @[MMU.scala 246:23:@1762.8]
  assign _GEN_168 = _T_257 ? _GEN_166 : 4'hf; // @[MMU.scala 241:32:@1758.6]
  assign _GEN_169 = _T_257 ? io_mem_mode : mem_mode; // @[MMU.scala 241:32:@1758.6]
  assign _GEN_170 = _T_257 ? real_mem_addr : mem_addr; // @[MMU.scala 241:32:@1758.6]
  assign _GEN_171 = _T_257 ? _GEN_158 : mem_status; // @[MMU.scala 241:32:@1758.6]
  assign _GEN_172 = _T_257 ? _GEN_159 : real_mem_addr; // @[MMU.scala 241:32:@1758.6]
  assign _GEN_173 = _T_257 ? _GEN_160 : mem_pha; // @[MMU.scala 241:32:@1758.6]
  assign _GEN_178 = _T_257 ? _GEN_165 : 1'h0; // @[MMU.scala 241:32:@1758.6]
  assign _GEN_179 = _T_257 ? _GEN_167 : 1'h0; // @[MMU.scala 241:32:@1758.6]
  assign _T_265 = 2'h1 == mem_status; // @[Conditional.scala 37:30:@1801.6]
  assign _GEN_181 = e_mem ? 2'h0 : 2'h2; // @[MMU.scala 287:22:@1806.10]
  assign _GEN_182 = e_mem ? mem_pha : ptw_mem_addr; // @[MMU.scala 287:22:@1806.10]
  assign _GEN_201 = ptw_mem_io_ready ? e_mem : 1'h0; // @[MMU.scala 286:31:@1805.8]
  assign _GEN_202 = ptw_mem_io_ready ? _GEN_181 : mem_status; // @[MMU.scala 286:31:@1805.8]
  assign _GEN_203 = ptw_mem_io_ready ? _GEN_182 : mem_pha; // @[MMU.scala 286:31:@1805.8]
  assign _T_277 = 2'h2 == mem_status; // @[Conditional.scala 37:30:@1846.8]
  assign _GEN_222 = io_mem_iom_ready ? 2'h0 : mem_status; // @[MMU.scala 305:31:@1850.10]
  assign _GEN_223 = _T_277 ? mem_mode : 4'hf; // @[Conditional.scala 39:67:@1847.8]
  assign _GEN_224 = _T_277 ? mem_pha : real_mem_addr; // @[Conditional.scala 39:67:@1847.8]
  assign _GEN_225 = _T_277 ? _GEN_222 : mem_status; // @[Conditional.scala 39:67:@1847.8]
  assign _GEN_226 = _T_277 ? io_mem_iom_ready : 1'h0; // @[Conditional.scala 39:67:@1847.8]
  assign _GEN_227 = _T_265 ? ptw_mem_io_mem_mode : _GEN_223; // @[Conditional.scala 39:67:@1802.6]
  assign _GEN_228 = _T_265 ? ptw_mem_io_mem_addr : _GEN_224; // @[Conditional.scala 39:67:@1802.6]
  assign _GEN_230 = _T_265 ? _GEN_201 : _GEN_226; // @[Conditional.scala 39:67:@1802.6]
  assign _GEN_231 = _T_265 ? _GEN_202 : _GEN_225; // @[Conditional.scala 39:67:@1802.6]
  assign _GEN_232 = _T_265 ? _GEN_203 : mem_pha; // @[Conditional.scala 39:67:@1802.6]
  assign _GEN_252 = _T_256 ? _GEN_169 : mem_mode; // @[Conditional.scala 40:58:@1756.4]
  assign _GEN_253 = _T_256 ? _GEN_170 : mem_addr; // @[Conditional.scala 40:58:@1756.4]
  assign _GEN_254 = _T_256 ? _GEN_171 : _GEN_231; // @[Conditional.scala 40:58:@1756.4]
  assign _GEN_256 = _T_256 ? _GEN_173 : _GEN_232; // @[Conditional.scala 40:58:@1756.4]
  assign io_mem_ready = _T_256 ? _GEN_179 : _GEN_230; // @[MMU.scala 113:21:@1554.4 MMU.scala 278:27:@1795.12 MMU.scala 289:29:@1808.12 MMU.scala 307:23:@1852.12]
  assign io_mem_rdata = io_mem_iom_rdata; // @[MMU.scala 109:21:@1551.4]
  assign io_insr_ready = _T_229 ? 1'h0 : _GEN_90; // @[MMU.scala 112:21:@1553.4 MMU.scala 206:30:@1699.12 MMU.scala 230:25:@1747.14]
  assign io_insr_rdata = io_if_iom_rdata; // @[MMU.scala 106:21:@1548.4]
  assign io_if_iom_mode = _T_229 ? _GEN_20 : _GEN_87; // @[MMU.scala 103:21:@1545.4 MMU.scala 165:27:@1661.8 MMU.scala 181:33:@1676.12 MMU.scala 197:27:@1694.8 MMU.scala 221:25:@1739.10]
  assign io_if_iom_addr = _T_229 ? _GEN_30 : _GEN_88; // @[MMU.scala 104:21:@1546.4 MMU.scala 182:33:@1677.12 MMU.scala 186:33:@1681.12 MMU.scala 198:27:@1695.8 MMU.scala 222:22:@1740.10]
  assign io_mem_iom_mode = _T_256 ? _GEN_168 : _GEN_227; // @[MMU.scala 107:21:@1549.4 MMU.scala 242:27:@1759.8 MMU.scala 261:36:@1780.14 MMU.scala 284:28:@1803.8 MMU.scala 303:25:@1848.10]
  assign io_mem_iom_addr = _T_256 ? _GEN_172 : _GEN_228; // @[MMU.scala 108:21:@1550.4 MMU.scala 250:34:@1766.12 MMU.scala 262:36:@1781.14 MMU.scala 265:36:@1785.14 MMU.scala 285:28:@1804.8 MMU.scala 304:23:@1849.10]
  assign io_mem_iom_wdata = io_mem_wdata; // @[MMU.scala 110:21:@1552.4]
  assign ptw_if_clock = clock; // @[:@1436.4]
  assign ptw_if_reset = reset; // @[:@1437.4]
  assign ptw_if_io_root_p2 = _T_171[26:18]; // @[MMU.scala 117:21:@1559.4]
  assign ptw_if_io_root_p1 = _T_171[17:9]; // @[MMU.scala 117:21:@1558.4]
  assign ptw_if_io_root_p0 = _T_171[8:0]; // @[MMU.scala 117:21:@1557.4]
  assign ptw_if_io_req_p2 = io_insr_addr[38:30]; // @[MMU.scala 125:20:@1568.4]
  assign ptw_if_io_req_p1 = io_insr_addr[29:21]; // @[MMU.scala 126:20:@1570.4]
  assign ptw_if_io_req_p0 = io_insr_addr[20:12]; // @[MMU.scala 127:20:@1572.4]
  assign ptw_if_io_req_valid = _T_229 ? _GEN_27 : 1'h0; // @[MMU.scala 128:23:@1573.4 MMU.scala 180:33:@1675.12]
  assign ptw_if_io_mem_ready = io_if_iom_ready; // @[MMU.scala 120:24:@1563.4]
  assign ptw_if_io_mem_rdata = io_if_iom_rdata; // @[MMU.scala 121:24:@1564.4]
  assign ptw_mem_clock = clock; // @[:@1439.4]
  assign ptw_mem_reset = reset; // @[:@1440.4]
  assign ptw_mem_io_root_p2 = _T_171[26:18]; // @[MMU.scala 118:21:@1562.4]
  assign ptw_mem_io_root_p1 = _T_171[17:9]; // @[MMU.scala 118:21:@1561.4]
  assign ptw_mem_io_root_p0 = _T_171[8:0]; // @[MMU.scala 118:21:@1560.4]
  assign ptw_mem_io_req_p2 = io_mem_addr[38:30]; // @[MMU.scala 130:21:@1575.4]
  assign ptw_mem_io_req_p1 = io_mem_addr[29:21]; // @[MMU.scala 131:21:@1577.4]
  assign ptw_mem_io_req_p0 = io_mem_addr[20:12]; // @[MMU.scala 132:21:@1579.4]
  assign ptw_mem_io_req_valid = _T_256 ? _GEN_178 : 1'h0; // @[MMU.scala 133:24:@1580.4 MMU.scala 260:36:@1779.14]
  assign ptw_mem_io_mem_ready = io_mem_iom_ready; // @[MMU.scala 122:24:@1565.4]
  assign ptw_mem_io_mem_rdata = io_mem_iom_rdata; // @[MMU.scala 123:24:@1566.4]
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
  csr_satp = _RAND_0[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  csr_priv = _RAND_1[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  csr_mxr = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  csr_sum = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  if_status = _RAND_4[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  if_mode = _RAND_5[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {2{`RANDOM}};
  if_addr = _RAND_6[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {2{`RANDOM}};
  if_pha = _RAND_7[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  if_rst = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  mem_status = _RAND_9[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  mem_mode = _RAND_10[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {2{`RANDOM}};
  mem_addr = _RAND_11[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {2{`RANDOM}};
  mem_pha = _RAND_12[63:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      csr_satp <= 64'h0;
    end else begin
      if (_T_106) begin
        csr_satp <= io_csr_satp;
      end
    end
    if (reset) begin
      csr_priv <= 2'h0;
    end else begin
      if (_T_106) begin
        csr_priv <= io_csr_priv;
      end
    end
    if (reset) begin
      csr_mxr <= 1'h0;
    end else begin
      if (_T_106) begin
        csr_mxr <= io_csr_mxr;
      end
    end
    if (reset) begin
      csr_sum <= 1'h0;
    end else begin
      if (_T_106) begin
        csr_sum <= io_csr_sum;
      end
    end
    if (reset) begin
      if_status <= 2'h0;
    end else begin
      if (_T_229) begin
        if (_T_230) begin
          if (mmu_en) begin
            if_status <= 2'h1;
          end else begin
            if_status <= 2'h2;
          end
        end
      end else begin
        if (_T_237) begin
          if (ptw_if_io_ready) begin
            if (e_if) begin
              if_status <= 2'h0;
            end else begin
              if_status <= 2'h2;
            end
          end
        end else begin
          if (_T_249) begin
            if (io_if_iom_ready) begin
              if_status <= 2'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      if_mode <= 4'hf;
    end else begin
      if (_T_229) begin
        if (_T_230) begin
          if_mode <= io_insr_mode;
        end
      end
    end
    if (reset) begin
      if_addr <= 64'h0;
    end else begin
      if (_T_229) begin
        if (_T_230) begin
          if (mmu_en) begin
            if_addr <= io_insr_addr;
          end else begin
            if_addr <= _T_147;
          end
        end
      end else begin
        if (!(_T_237)) begin
          if (_T_249) begin
            if (io_if_iom_ready) begin
              if (!(_T_254)) begin
                if (mmu_en) begin
                  if_addr <= io_insr_addr;
                end else begin
                  if_addr <= _T_147;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      if_pha <= 64'h0;
    end else begin
      if (_T_229) begin
        if (_T_230) begin
          if (!(mmu_en)) begin
            if (mmu_en) begin
              if_pha <= io_insr_addr;
            end else begin
              if_pha <= _T_147;
            end
          end
        end
      end else begin
        if (_T_237) begin
          if (ptw_if_io_ready) begin
            if (!(e_if)) begin
              if_pha <= ptw_if_addr;
            end
          end
        end else begin
          if (_T_249) begin
            if (io_if_iom_ready) begin
              if (!(_T_254)) begin
                if (mmu_en) begin
                  if_pha <= io_insr_addr;
                end else begin
                  if_pha <= _T_147;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      if_rst <= 1'h0;
    end else begin
      if (_T_229) begin
        if (_T_230) begin
          if_rst <= 1'h0;
        end else begin
          if (io_insr_rst) begin
            if_rst <= 1'h1;
          end
        end
      end else begin
        if (io_insr_rst) begin
          if_rst <= 1'h1;
        end
      end
    end
    if (reset) begin
      mem_status <= 2'h0;
    end else begin
      if (_T_256) begin
        if (_T_257) begin
          if (mmu_en) begin
            if (_T_258) begin
              mem_status <= 2'h2;
            end else begin
              mem_status <= 2'h1;
            end
          end else begin
            if (io_mem_iom_ready) begin
              mem_status <= 2'h0;
            end else begin
              mem_status <= 2'h2;
            end
          end
        end
      end else begin
        if (_T_265) begin
          if (ptw_mem_io_ready) begin
            if (e_mem) begin
              mem_status <= 2'h0;
            end else begin
              mem_status <= 2'h2;
            end
          end
        end else begin
          if (_T_277) begin
            if (io_mem_iom_ready) begin
              mem_status <= 2'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      mem_mode <= 4'hf;
    end else begin
      if (_T_256) begin
        if (_T_257) begin
          mem_mode <= io_mem_mode;
        end
      end
    end
    if (reset) begin
      mem_addr <= 64'h0;
    end else begin
      if (_T_256) begin
        if (_T_257) begin
          if (mmu_en) begin
            mem_addr <= io_mem_addr;
          end else begin
            mem_addr <= _T_150;
          end
        end
      end
    end
    if (reset) begin
      mem_pha <= 64'h0;
    end else begin
      if (_T_256) begin
        if (_T_257) begin
          if (mmu_en) begin
            if (_T_258) begin
              mem_pha <= 64'h807ffff8;
            end
          end else begin
            if (mmu_en) begin
              mem_pha <= io_mem_addr;
            end else begin
              mem_pha <= _T_150;
            end
          end
        end
      end else begin
        if (_T_265) begin
          if (ptw_mem_io_ready) begin
            if (!(e_mem)) begin
              mem_pha <= ptw_mem_addr;
            end
          end
        end
      end
    end
  end
endmodule
module IOManager( // @[:@1873.2]
  input         clock, // @[:@1874.4]
  input         reset, // @[:@1875.4]
  input  [3:0]  io_mem_if_mode, // @[:@1876.4]
  output        io_mem_if_ready, // @[:@1876.4]
  input  [63:0] io_mem_if_addr, // @[:@1876.4]
  output [63:0] io_mem_if_rdata, // @[:@1876.4]
  input  [3:0]  io_mem_mem_mode, // @[:@1876.4]
  output        io_mem_mem_ready, // @[:@1876.4]
  input  [63:0] io_mem_mem_addr, // @[:@1876.4]
  output [63:0] io_mem_mem_rdata, // @[:@1876.4]
  input  [63:0] io_mem_mem_wdata, // @[:@1876.4]
  output [3:0]  io_mem_out_mode, // @[:@1876.4]
  input         io_mem_out_ready, // @[:@1876.4]
  output [63:0] io_mem_out_addr, // @[:@1876.4]
  input  [63:0] io_mem_out_rdata, // @[:@1876.4]
  output [63:0] io_mem_out_wdata, // @[:@1876.4]
  output [3:0]  io_serial_out_mode, // @[:@1876.4]
  input         io_serial_out_ready, // @[:@1876.4]
  output [63:0] io_serial_out_addr, // @[:@1876.4]
  input  [63:0] io_serial_out_rdata, // @[:@1876.4]
  output [63:0] io_serial_out_wdata, // @[:@1876.4]
  output [1:0]  io_debug_if_wait, // @[:@1876.4]
  output [1:0]  io_debug_mem_wait, // @[:@1876.4]
  output        io_debug_if_ready, // @[:@1876.4]
  output        io_debug_mem_ready, // @[:@1876.4]
  output [3:0]  io_debug_if_mode, // @[:@1876.4]
  output [3:0]  io_debug_mem_mode, // @[:@1876.4]
  output [63:0] io_debug_if_addr, // @[:@1876.4]
  output [63:0] io_debug_mem_addr, // @[:@1876.4]
  output        io_debug_if_error, // @[:@1876.4]
  output        io_debug_mem_error // @[:@1876.4]
);
  reg [1:0] ifWait; // @[iomanager.scala 60:25:@1904.4]
  reg [31:0] _RAND_0;
  reg [1:0] memWait; // @[iomanager.scala 61:26:@1905.4]
  reg [31:0] _RAND_1;
  reg  if_error; // @[iomanager.scala 62:27:@1906.4]
  reg [31:0] _RAND_2;
  reg  mem_error; // @[iomanager.scala 63:28:@1907.4]
  reg [31:0] _RAND_3;
  wire  _T_95; // @[Conditional.scala 37:30:@1908.4]
  wire  _T_96; // @[Conditional.scala 37:30:@1914.6]
  wire [63:0] _GEN_0; // @[Conditional.scala 39:67:@1915.6]
  wire  _GEN_1; // @[Conditional.scala 39:67:@1915.6]
  wire  _GEN_3; // @[Conditional.scala 40:58:@1909.4]
  wire  _T_97; // @[Conditional.scala 37:30:@1919.4]
  wire  _T_98; // @[Conditional.scala 37:30:@1925.6]
  wire [63:0] _GEN_4; // @[Conditional.scala 39:67:@1926.6]
  wire  _GEN_5; // @[Conditional.scala 39:67:@1926.6]
  wire  _GEN_7; // @[Conditional.scala 40:58:@1920.4]
  wire  _T_99; // @[iomanager.scala 87:26:@1930.4]
  wire  _T_101; // @[iomanager.scala 87:42:@1931.4]
  wire  _T_102; // @[iomanager.scala 87:39:@1932.4]
  wire [1:0] _T_103; // @[iomanager.scala 87:18:@1933.4]
  wire  _T_104; // @[iomanager.scala 88:28:@1935.4]
  wire  _T_106; // @[iomanager.scala 88:44:@1936.4]
  wire  _T_107; // @[iomanager.scala 88:41:@1937.4]
  wire [1:0] _T_108; // @[iomanager.scala 88:19:@1938.4]
  wire  _T_110; // @[iomanager.scala 100:18:@1942.4]
  wire  _T_111; // @[iomanager.scala 100:41:@1943.4]
  wire  _T_112; // @[iomanager.scala 100:31:@1944.4]
  wire  _T_113; // @[iomanager.scala 100:66:@1945.4]
  wire  _T_114; // @[iomanager.scala 100:54:@1946.4]
  wire  _T_119; // @[iomanager.scala 15:22:@1948.6]
  wire  _T_120; // @[iomanager.scala 15:43:@1949.6]
  wire  _T_121; // @[iomanager.scala 15:35:@1950.6]
  wire  _T_123; // @[iomanager.scala 16:25:@1959.8]
  wire  _T_124; // @[iomanager.scala 16:49:@1960.8]
  wire  _T_125; // @[iomanager.scala 16:41:@1961.8]
  wire  _T_129; // @[iomanager.scala 121:15:@1971.10]
  wire [63:0] _GEN_8; // @[iomanager.scala 111:37:@1962.8]
  wire [3:0] _GEN_9; // @[iomanager.scala 111:37:@1962.8]
  wire [63:0] _GEN_10; // @[iomanager.scala 111:37:@1962.8]
  wire [1:0] _GEN_11; // @[iomanager.scala 111:37:@1962.8]
  wire  _GEN_12; // @[iomanager.scala 111:37:@1962.8]
  wire  _GEN_13; // @[iomanager.scala 111:37:@1962.8]
  wire [63:0] _GEN_14; // @[iomanager.scala 101:28:@1951.6]
  wire [3:0] _GEN_15; // @[iomanager.scala 101:28:@1951.6]
  wire [63:0] _GEN_16; // @[iomanager.scala 101:28:@1951.6]
  wire [1:0] _GEN_17; // @[iomanager.scala 101:28:@1951.6]
  wire  _GEN_18; // @[iomanager.scala 101:28:@1951.6]
  wire [63:0] _GEN_19; // @[iomanager.scala 101:28:@1951.6]
  wire [3:0] _GEN_20; // @[iomanager.scala 101:28:@1951.6]
  wire [63:0] _GEN_21; // @[iomanager.scala 101:28:@1951.6]
  wire  _GEN_22; // @[iomanager.scala 101:28:@1951.6]
  wire [63:0] _GEN_23; // @[iomanager.scala 100:80:@1947.4]
  wire [3:0] _GEN_24; // @[iomanager.scala 100:80:@1947.4]
  wire [63:0] _GEN_25; // @[iomanager.scala 100:80:@1947.4]
  wire [1:0] _GEN_26; // @[iomanager.scala 100:80:@1947.4]
  wire  _GEN_31; // @[iomanager.scala 100:80:@1947.4]
  wire  _T_133; // @[iomanager.scala 127:30:@1980.4]
  wire  _T_134; // @[iomanager.scala 127:66:@1981.4]
  wire  _T_135; // @[iomanager.scala 127:54:@1982.4]
  wire  _T_136; // @[iomanager.scala 127:91:@1983.4]
  wire  _T_137; // @[iomanager.scala 127:79:@1984.4]
  wire  _T_138; // @[iomanager.scala 15:22:@1986.6]
  wire  _T_139; // @[iomanager.scala 15:43:@1987.6]
  wire  _T_140; // @[iomanager.scala 15:35:@1988.6]
  wire [63:0] _GEN_32; // @[iomanager.scala 128:30:@1989.6]
  wire [3:0] _GEN_33; // @[iomanager.scala 128:30:@1989.6]
  wire [63:0] _GEN_34; // @[iomanager.scala 128:30:@1989.6]
  wire [1:0] _GEN_35; // @[iomanager.scala 128:30:@1989.6]
  wire  _GEN_36; // @[iomanager.scala 128:30:@1989.6]
  wire  _GEN_37; // @[iomanager.scala 128:30:@1989.6]
  wire [1:0] _GEN_41; // @[iomanager.scala 127:105:@1985.4]
  wire  _GEN_43; // @[iomanager.scala 127:105:@1985.4]
  wire  _GEN_44; // @[iomanager.scala 121:15:@1973.12]
  wire  _GEN_45; // @[iomanager.scala 121:15:@1973.12]
  wire  _GEN_46; // @[iomanager.scala 121:15:@1973.12]
  wire  _GEN_47; // @[iomanager.scala 121:15:@1973.12]
  wire  _GEN_48; // @[iomanager.scala 133:19:@2000.10]
  wire  _GEN_49; // @[iomanager.scala 133:19:@2000.10]
  assign _T_95 = 2'h1 == ifWait; // @[Conditional.scala 37:30:@1908.4]
  assign _T_96 = 2'h2 == ifWait; // @[Conditional.scala 37:30:@1914.6]
  assign _GEN_0 = _T_96 ? io_serial_out_rdata : 64'h0; // @[Conditional.scala 39:67:@1915.6]
  assign _GEN_1 = _T_96 ? io_serial_out_ready : 1'h0; // @[Conditional.scala 39:67:@1915.6]
  assign _GEN_3 = _T_95 ? io_mem_out_ready : _GEN_1; // @[Conditional.scala 40:58:@1909.4]
  assign _T_97 = 2'h1 == memWait; // @[Conditional.scala 37:30:@1919.4]
  assign _T_98 = 2'h2 == memWait; // @[Conditional.scala 37:30:@1925.6]
  assign _GEN_4 = _T_98 ? io_serial_out_rdata : 64'h0; // @[Conditional.scala 39:67:@1926.6]
  assign _GEN_5 = _T_98 ? io_serial_out_ready : 1'h0; // @[Conditional.scala 39:67:@1926.6]
  assign _GEN_7 = _T_97 ? io_mem_out_ready : _GEN_5; // @[Conditional.scala 40:58:@1920.4]
  assign _T_99 = ifWait != 2'h0; // @[iomanager.scala 87:26:@1930.4]
  assign _T_101 = io_mem_if_ready == 1'h0; // @[iomanager.scala 87:42:@1931.4]
  assign _T_102 = _T_99 & _T_101; // @[iomanager.scala 87:39:@1932.4]
  assign _T_103 = _T_102 ? ifWait : 2'h0; // @[iomanager.scala 87:18:@1933.4]
  assign _T_104 = memWait != 2'h0; // @[iomanager.scala 88:28:@1935.4]
  assign _T_106 = io_mem_mem_ready == 1'h0; // @[iomanager.scala 88:44:@1936.4]
  assign _T_107 = _T_104 & _T_106; // @[iomanager.scala 88:41:@1937.4]
  assign _T_108 = _T_107 ? memWait : 2'h0; // @[iomanager.scala 88:19:@1938.4]
  assign _T_110 = memWait == 2'h0; // @[iomanager.scala 100:18:@1942.4]
  assign _T_111 = ifWait == 2'h0; // @[iomanager.scala 100:41:@1943.4]
  assign _T_112 = _T_110 & _T_111; // @[iomanager.scala 100:31:@1944.4]
  assign _T_113 = io_mem_mem_mode != 4'hf; // @[iomanager.scala 100:66:@1945.4]
  assign _T_114 = _T_112 & _T_113; // @[iomanager.scala 100:54:@1946.4]
  assign _T_119 = io_mem_mem_addr >= 64'h80000000; // @[iomanager.scala 15:22:@1948.6]
  assign _T_120 = io_mem_mem_addr < 64'h807ffff8; // @[iomanager.scala 15:43:@1949.6]
  assign _T_121 = _T_119 & _T_120; // @[iomanager.scala 15:35:@1950.6]
  assign _T_123 = io_mem_mem_addr >= 64'h807ffff8; // @[iomanager.scala 16:25:@1959.8]
  assign _T_124 = io_mem_mem_addr < 64'h80800000; // @[iomanager.scala 16:49:@1960.8]
  assign _T_125 = _T_123 & _T_124; // @[iomanager.scala 16:41:@1961.8]
  assign _T_129 = reset == 1'h0; // @[iomanager.scala 121:15:@1971.10]
  assign _GEN_8 = _T_125 ? io_mem_mem_wdata : 64'h0; // @[iomanager.scala 111:37:@1962.8]
  assign _GEN_9 = _T_125 ? io_mem_mem_mode : 4'hf; // @[iomanager.scala 111:37:@1962.8]
  assign _GEN_10 = _T_125 ? io_mem_mem_addr : 64'h0; // @[iomanager.scala 111:37:@1962.8]
  assign _GEN_11 = _T_125 ? 2'h2 : _T_108; // @[iomanager.scala 111:37:@1962.8]
  assign _GEN_12 = _T_125 ? 1'h0 : _GEN_7; // @[iomanager.scala 111:37:@1962.8]
  assign _GEN_13 = _T_125 ? mem_error : 1'h1; // @[iomanager.scala 111:37:@1962.8]
  assign _GEN_14 = _T_121 ? io_mem_mem_wdata : 64'h0; // @[iomanager.scala 101:28:@1951.6]
  assign _GEN_15 = _T_121 ? io_mem_mem_mode : 4'hf; // @[iomanager.scala 101:28:@1951.6]
  assign _GEN_16 = _T_121 ? io_mem_mem_addr : 64'h0; // @[iomanager.scala 101:28:@1951.6]
  assign _GEN_17 = _T_121 ? 2'h1 : _GEN_11; // @[iomanager.scala 101:28:@1951.6]
  assign _GEN_18 = _T_121 ? 1'h0 : _GEN_12; // @[iomanager.scala 101:28:@1951.6]
  assign _GEN_19 = _T_121 ? 64'h0 : _GEN_8; // @[iomanager.scala 101:28:@1951.6]
  assign _GEN_20 = _T_121 ? 4'hf : _GEN_9; // @[iomanager.scala 101:28:@1951.6]
  assign _GEN_21 = _T_121 ? 64'h0 : _GEN_10; // @[iomanager.scala 101:28:@1951.6]
  assign _GEN_22 = _T_121 ? mem_error : _GEN_13; // @[iomanager.scala 101:28:@1951.6]
  assign _GEN_23 = _T_114 ? _GEN_14 : 64'h0; // @[iomanager.scala 100:80:@1947.4]
  assign _GEN_24 = _T_114 ? _GEN_15 : 4'hf; // @[iomanager.scala 100:80:@1947.4]
  assign _GEN_25 = _T_114 ? _GEN_16 : 64'h0; // @[iomanager.scala 100:80:@1947.4]
  assign _GEN_26 = _T_114 ? _GEN_17 : _T_108; // @[iomanager.scala 100:80:@1947.4]
  assign _GEN_31 = _T_114 ? _GEN_22 : mem_error; // @[iomanager.scala 100:80:@1947.4]
  assign _T_133 = _T_111 & _T_110; // @[iomanager.scala 127:30:@1980.4]
  assign _T_134 = io_mem_mem_mode == 4'hf; // @[iomanager.scala 127:66:@1981.4]
  assign _T_135 = _T_133 & _T_134; // @[iomanager.scala 127:54:@1982.4]
  assign _T_136 = io_mem_if_mode != 4'hf; // @[iomanager.scala 127:91:@1983.4]
  assign _T_137 = _T_135 & _T_136; // @[iomanager.scala 127:79:@1984.4]
  assign _T_138 = io_mem_if_addr >= 64'h80000000; // @[iomanager.scala 15:22:@1986.6]
  assign _T_139 = io_mem_if_addr < 64'h807ffff8; // @[iomanager.scala 15:43:@1987.6]
  assign _T_140 = _T_138 & _T_139; // @[iomanager.scala 15:35:@1988.6]
  assign _GEN_32 = _T_140 ? 64'h0 : _GEN_23; // @[iomanager.scala 128:30:@1989.6]
  assign _GEN_33 = _T_140 ? io_mem_if_mode : _GEN_24; // @[iomanager.scala 128:30:@1989.6]
  assign _GEN_34 = _T_140 ? io_mem_if_addr : _GEN_25; // @[iomanager.scala 128:30:@1989.6]
  assign _GEN_35 = _T_140 ? 2'h1 : _T_103; // @[iomanager.scala 128:30:@1989.6]
  assign _GEN_36 = _T_140 ? 1'h0 : _GEN_3; // @[iomanager.scala 128:30:@1989.6]
  assign _GEN_37 = _T_140 ? if_error : 1'h1; // @[iomanager.scala 128:30:@1989.6]
  assign _GEN_41 = _T_137 ? _GEN_35 : _T_103; // @[iomanager.scala 127:105:@1985.4]
  assign _GEN_43 = _T_137 ? _GEN_37 : if_error; // @[iomanager.scala 127:105:@1985.4]
  assign io_mem_if_ready = _T_137 ? _GEN_36 : _GEN_3; // @[iomanager.scala 52:16:@1892.4 iomanager.scala 70:18:@1911.6 iomanager.scala 70:18:@1917.8 iomanager.scala 131:23:@1994.8]
  assign io_mem_if_rdata = _T_95 ? io_mem_out_rdata : _GEN_0; // @[iomanager.scala 52:16:@1890.4 iomanager.scala 69:18:@1910.6 iomanager.scala 69:18:@1916.8]
  assign io_mem_mem_ready = _T_114 ? _GEN_18 : _GEN_7; // @[iomanager.scala 51:16:@1887.4 iomanager.scala 70:18:@1922.6 iomanager.scala 70:18:@1928.8 iomanager.scala 109:23:@1956.8 iomanager.scala 118:23:@1967.10]
  assign io_mem_mem_rdata = _T_97 ? io_mem_out_rdata : _GEN_4; // @[iomanager.scala 51:16:@1885.4 iomanager.scala 69:18:@1921.6 iomanager.scala 69:18:@1927.8]
  assign io_mem_out_mode = _T_137 ? _GEN_33 : _GEN_24; // @[iomanager.scala 53:20:@1898.4 iomanager.scala 75:20:@1953.8 iomanager.scala 75:20:@1991.8]
  assign io_mem_out_addr = _T_137 ? _GEN_34 : _GEN_25; // @[iomanager.scala 53:20:@1896.4 iomanager.scala 76:20:@1954.8 iomanager.scala 76:20:@1992.8]
  assign io_mem_out_wdata = _T_137 ? _GEN_32 : _GEN_23; // @[iomanager.scala 53:20:@1894.4 iomanager.scala 74:20:@1952.8 iomanager.scala 74:20:@1990.8]
  assign io_serial_out_mode = _T_114 ? _GEN_20 : 4'hf; // @[iomanager.scala 54:20:@1903.4 iomanager.scala 75:20:@1964.10]
  assign io_serial_out_addr = _T_114 ? _GEN_21 : 64'h0; // @[iomanager.scala 54:20:@1901.4 iomanager.scala 76:20:@1965.10]
  assign io_serial_out_wdata = _T_114 ? _GEN_19 : 64'h0; // @[iomanager.scala 54:20:@1899.4 iomanager.scala 74:20:@1963.10]
  assign io_debug_if_wait = ifWait; // @[iomanager.scala 139:22:@2005.4]
  assign io_debug_mem_wait = memWait; // @[iomanager.scala 141:23:@2007.4]
  assign io_debug_if_ready = io_mem_if_ready; // @[iomanager.scala 140:23:@2006.4]
  assign io_debug_mem_ready = io_mem_mem_ready; // @[iomanager.scala 142:24:@2008.4]
  assign io_debug_if_mode = io_mem_if_mode; // @[iomanager.scala 143:22:@2009.4]
  assign io_debug_mem_mode = io_mem_mem_mode; // @[iomanager.scala 144:23:@2010.4]
  assign io_debug_if_addr = io_mem_if_addr; // @[iomanager.scala 145:22:@2011.4]
  assign io_debug_mem_addr = io_mem_mem_addr; // @[iomanager.scala 146:23:@2012.4]
  assign io_debug_if_error = if_error; // @[iomanager.scala 147:23:@2013.4]
  assign io_debug_mem_error = mem_error; // @[iomanager.scala 148:24:@2014.4]
  assign _GEN_44 = _T_121 == 1'h0; // @[iomanager.scala 121:15:@1973.12]
  assign _GEN_45 = _T_114 & _GEN_44; // @[iomanager.scala 121:15:@1973.12]
  assign _GEN_46 = _T_125 == 1'h0; // @[iomanager.scala 121:15:@1973.12]
  assign _GEN_47 = _GEN_45 & _GEN_46; // @[iomanager.scala 121:15:@1973.12]
  assign _GEN_48 = _T_140 == 1'h0; // @[iomanager.scala 133:19:@2000.10]
  assign _GEN_49 = _T_137 & _GEN_48; // @[iomanager.scala 133:19:@2000.10]
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
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  if_error = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  mem_error = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      ifWait <= 2'h0;
    end else begin
      if (_T_137) begin
        if (_T_140) begin
          ifWait <= 2'h1;
        end else begin
          if (!(_T_102)) begin
            ifWait <= 2'h0;
          end
        end
      end else begin
        if (!(_T_102)) begin
          ifWait <= 2'h0;
        end
      end
    end
    if (reset) begin
      memWait <= 2'h0;
    end else begin
      if (_T_114) begin
        if (_T_121) begin
          memWait <= 2'h1;
        end else begin
          if (_T_125) begin
            memWait <= 2'h2;
          end else begin
            if (!(_T_107)) begin
              memWait <= 2'h0;
            end
          end
        end
      end else begin
        if (!(_T_107)) begin
          memWait <= 2'h0;
        end
      end
    end
    if (reset) begin
      if_error <= 1'h0;
    end else begin
      if (_T_137) begin
        if (!(_T_140)) begin
          if_error <= 1'h1;
        end
      end
    end
    if (reset) begin
      mem_error <= 1'h0;
    end else begin
      if (_T_114) begin
        if (!(_T_121)) begin
          if (!(_T_125)) begin
            mem_error <= 1'h1;
          end
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_47 & _T_129) begin
          $fwrite(32'h80000002,"[IO] MEM access invalid address: %x\n",io_mem_mem_addr); // @[iomanager.scala 121:15:@1973.12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_49 & _T_129) begin
          $fwrite(32'h80000002,"[IO] IF access invalid address: %x\n",io_mem_if_addr); // @[iomanager.scala 133:19:@2000.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module IF_ID( // @[:@2016.2]
  input         clock, // @[:@2017.4]
  input         reset, // @[:@2018.4]
  input         io_en, // @[:@2019.4]
  input         io_pass, // @[:@2019.4]
  input         io_flush, // @[:@2019.4]
  input  [31:0] io_insi, // @[:@2019.4]
  input  [63:0] io_pci, // @[:@2019.4]
  input  [63:0] io_insci, // @[:@2019.4]
  input  [63:0] io_icdi, // @[:@2019.4]
  input         io_lastloadin_valid, // @[:@2019.4]
  input  [4:0]  io_lastloadin_index, // @[:@2019.4]
  input  [63:0] io_excep_i_pc, // @[:@2019.4]
  input         io_excep_i_inst_valid, // @[:@2019.4]
  output [31:0] io_inso, // @[:@2019.4]
  output [63:0] io_pco, // @[:@2019.4]
  output [63:0] io_insco, // @[:@2019.4]
  output [63:0] io_icdo, // @[:@2019.4]
  output        io_lastloadout_valid, // @[:@2019.4]
  output [4:0]  io_lastloadout_index, // @[:@2019.4]
  output        io_excep_o_valid, // @[:@2019.4]
  output [63:0] io_excep_o_code, // @[:@2019.4]
  output [63:0] io_excep_o_value, // @[:@2019.4]
  output [63:0] io_excep_o_pc, // @[:@2019.4]
  output        io_excep_o_inst_valid // @[:@2019.4]
);
  reg [31:0] ins; // @[if_id.scala 27:23:@2021.4]
  reg [31:0] _RAND_0;
  reg [63:0] pc; // @[if_id.scala 28:23:@2023.4]
  reg [63:0] _RAND_1;
  reg [63:0] insc; // @[if_id.scala 29:23:@2024.4]
  reg [63:0] _RAND_2;
  reg [63:0] icd; // @[if_id.scala 30:23:@2026.4]
  reg [63:0] _RAND_3;
  reg  lastload_valid; // @[if_id.scala 31:35:@2027.4]
  reg [31:0] _RAND_4;
  reg [4:0] lastload_index; // @[if_id.scala 32:35:@2028.4]
  reg [31:0] _RAND_5;
  reg  excep_valid; // @[if_id.scala 33:24:@2042.4]
  reg [31:0] _RAND_6;
  reg [63:0] excep_code; // @[if_id.scala 33:24:@2042.4]
  reg [63:0] _RAND_7;
  reg [63:0] excep_value; // @[if_id.scala 33:24:@2042.4]
  reg [63:0] _RAND_8;
  reg [63:0] excep_pc; // @[if_id.scala 33:24:@2042.4]
  reg [63:0] _RAND_9;
  reg  excep_inst_valid; // @[if_id.scala 33:24:@2042.4]
  reg [31:0] _RAND_10;
  wire  _T_148; // @[if_id.scala 43:17:@2054.4]
  wire [31:0] _T_150; // @[if_id.scala 44:20:@2056.6]
  wire [63:0] _T_152; // @[if_id.scala 46:20:@2059.6]
  wire [63:0] _T_154; // @[if_id.scala 47:20:@2061.6]
  wire  _T_156; // @[if_id.scala 48:32:@2063.6]
  wire [4:0] _T_158; // @[if_id.scala 49:32:@2065.6]
  wire  _GEN_3; // @[if_id.scala 50:25:@2067.6]
  wire [63:0] _GEN_4; // @[if_id.scala 50:25:@2067.6]
  wire [31:0] _GEN_5; // @[if_id.scala 43:29:@2055.4]
  wire [63:0] _GEN_6; // @[if_id.scala 43:29:@2055.4]
  wire [63:0] _GEN_7; // @[if_id.scala 43:29:@2055.4]
  wire [63:0] _GEN_8; // @[if_id.scala 43:29:@2055.4]
  wire  _GEN_9; // @[if_id.scala 43:29:@2055.4]
  wire [4:0] _GEN_10; // @[if_id.scala 43:29:@2055.4]
  wire  _GEN_11; // @[if_id.scala 43:29:@2055.4]
  wire [63:0] _GEN_12; // @[if_id.scala 43:29:@2055.4]
  wire [63:0] _GEN_13; // @[if_id.scala 43:29:@2055.4]
  wire  _GEN_14; // @[if_id.scala 43:29:@2055.4]
  wire [63:0] _GEN_15; // @[if_id.scala 43:29:@2055.4]
  assign _T_148 = io_en & io_pass; // @[if_id.scala 43:17:@2054.4]
  assign _T_150 = io_flush ? 32'h0 : io_insi; // @[if_id.scala 44:20:@2056.6]
  assign _T_152 = io_flush ? 64'h0 : io_insci; // @[if_id.scala 46:20:@2059.6]
  assign _T_154 = io_flush ? 64'h0 : io_icdi; // @[if_id.scala 47:20:@2061.6]
  assign _T_156 = io_flush ? 1'h0 : io_lastloadin_valid; // @[if_id.scala 48:32:@2063.6]
  assign _T_158 = io_flush ? 5'h0 : io_lastloadin_index; // @[if_id.scala 49:32:@2065.6]
  assign _GEN_3 = io_flush ? 1'h0 : io_excep_i_inst_valid; // @[if_id.scala 50:25:@2067.6]
  assign _GEN_4 = io_flush ? excep_pc : io_excep_i_pc; // @[if_id.scala 50:25:@2067.6]
  assign _GEN_5 = _T_148 ? _T_150 : ins; // @[if_id.scala 43:29:@2055.4]
  assign _GEN_6 = _T_148 ? io_pci : pc; // @[if_id.scala 43:29:@2055.4]
  assign _GEN_7 = _T_148 ? _T_152 : insc; // @[if_id.scala 43:29:@2055.4]
  assign _GEN_8 = _T_148 ? _T_154 : icd; // @[if_id.scala 43:29:@2055.4]
  assign _GEN_9 = _T_148 ? _T_156 : lastload_valid; // @[if_id.scala 43:29:@2055.4]
  assign _GEN_10 = _T_148 ? _T_158 : lastload_index; // @[if_id.scala 43:29:@2055.4]
  assign _GEN_11 = _T_148 ? 1'h0 : excep_valid; // @[if_id.scala 43:29:@2055.4]
  assign _GEN_12 = _T_148 ? 64'h0 : excep_code; // @[if_id.scala 43:29:@2055.4]
  assign _GEN_13 = _T_148 ? 64'h0 : excep_value; // @[if_id.scala 43:29:@2055.4]
  assign _GEN_14 = _T_148 ? _GEN_3 : excep_inst_valid; // @[if_id.scala 43:29:@2055.4]
  assign _GEN_15 = _T_148 ? _GEN_4 : excep_pc; // @[if_id.scala 43:29:@2055.4]
  assign io_inso = ins; // @[if_id.scala 35:14:@2043.4]
  assign io_pco = pc; // @[if_id.scala 36:14:@2044.4]
  assign io_insco = insc; // @[if_id.scala 37:14:@2045.4]
  assign io_icdo = icd; // @[if_id.scala 38:14:@2046.4]
  assign io_lastloadout_valid = lastload_valid; // @[if_id.scala 39:28:@2047.4]
  assign io_lastloadout_index = lastload_index; // @[if_id.scala 40:28:@2048.4]
  assign io_excep_o_valid = excep_valid; // @[if_id.scala 41:16:@2053.4]
  assign io_excep_o_code = excep_code; // @[if_id.scala 41:16:@2052.4]
  assign io_excep_o_value = excep_value; // @[if_id.scala 41:16:@2051.4]
  assign io_excep_o_pc = excep_pc; // @[if_id.scala 41:16:@2050.4]
  assign io_excep_o_inst_valid = excep_inst_valid; // @[if_id.scala 41:16:@2049.4]
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
  excep_valid = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {2{`RANDOM}};
  excep_code = _RAND_7[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {2{`RANDOM}};
  excep_value = _RAND_8[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {2{`RANDOM}};
  excep_pc = _RAND_9[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  excep_inst_valid = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      ins <= 32'h0;
    end else begin
      if (_T_148) begin
        if (io_flush) begin
          ins <= 32'h0;
        end else begin
          ins <= io_insi;
        end
      end
    end
    if (reset) begin
      pc <= 64'hffffffffc0000000;
    end else begin
      if (_T_148) begin
        pc <= io_pci;
      end
    end
    if (reset) begin
      insc <= 64'h0;
    end else begin
      if (_T_148) begin
        if (io_flush) begin
          insc <= 64'h0;
        end else begin
          insc <= io_insci;
        end
      end
    end
    if (reset) begin
      icd <= 64'hffffffffffffffff;
    end else begin
      if (_T_148) begin
        if (io_flush) begin
          icd <= 64'h0;
        end else begin
          icd <= io_icdi;
        end
      end
    end
    if (reset) begin
      lastload_valid <= 1'h0;
    end else begin
      if (_T_148) begin
        if (io_flush) begin
          lastload_valid <= 1'h0;
        end else begin
          lastload_valid <= io_lastloadin_valid;
        end
      end
    end
    if (reset) begin
      lastload_index <= 5'h0;
    end else begin
      if (_T_148) begin
        if (io_flush) begin
          lastload_index <= 5'h0;
        end else begin
          lastload_index <= io_lastloadin_index;
        end
      end
    end
    if (reset) begin
      excep_valid <= 1'h0;
    end else begin
      if (_T_148) begin
        excep_valid <= 1'h0;
      end
    end
    if (reset) begin
      excep_code <= 64'h0;
    end else begin
      if (_T_148) begin
        excep_code <= 64'h0;
      end
    end
    if (reset) begin
      excep_value <= 64'h0;
    end else begin
      if (_T_148) begin
        excep_value <= 64'h0;
      end
    end
    if (reset) begin
      excep_pc <= 64'h0;
    end else begin
      if (_T_148) begin
        if (!(io_flush)) begin
          excep_pc <= io_excep_i_pc;
        end
      end
    end
    if (reset) begin
      excep_inst_valid <= 1'h0;
    end else begin
      if (_T_148) begin
        if (io_flush) begin
          excep_inst_valid <= 1'h0;
        end else begin
          excep_inst_valid <= io_excep_i_inst_valid;
        end
      end
    end
  end
endmodule
module ID_EX( // @[:@2084.2]
  input         clock, // @[:@2085.4]
  input         reset, // @[:@2086.4]
  input         io_en, // @[:@2087.4]
  input         io_bid, // @[:@2087.4]
  input         io_bex, // @[:@2087.4]
  input         io_flush, // @[:@2087.4]
  input         io_pass, // @[:@2087.4]
  input  [63:0] io_immi, // @[:@2087.4]
  input  [4:0]  io_ALUOpi, // @[:@2087.4]
  input  [3:0]  io_exeti, // @[:@2087.4]
  input  [63:0] io_pci, // @[:@2087.4]
  input  [3:0]  io_lsmi, // @[:@2087.4]
  input         io_op32i, // @[:@2087.4]
  input         io_csr_wb_i_valid, // @[:@2087.4]
  input  [11:0] io_csr_wb_i_csr_idx, // @[:@2087.4]
  input  [63:0] io_csr_wb_i_csr_data, // @[:@2087.4]
  input         io_dregi_rs2_valid, // @[:@2087.4]
  input  [63:0] io_dregi_rs1_value, // @[:@2087.4]
  input  [63:0] io_dregi_rs2_value, // @[:@2087.4]
  input         io_dregi_rd_valid, // @[:@2087.4]
  input  [4:0]  io_dregi_rd_index, // @[:@2087.4]
  input         io_excep_i_valid, // @[:@2087.4]
  input  [63:0] io_excep_i_code, // @[:@2087.4]
  input  [63:0] io_excep_i_value, // @[:@2087.4]
  input  [63:0] io_excep_i_pc, // @[:@2087.4]
  input         io_excep_i_inst_valid, // @[:@2087.4]
  input         io_mul_div_i, // @[:@2087.4]
  output [63:0] io_immo, // @[:@2087.4]
  output [4:0]  io_ALUOpo, // @[:@2087.4]
  output [3:0]  io_exeto, // @[:@2087.4]
  output [63:0] io_pco, // @[:@2087.4]
  output [3:0]  io_lsmo, // @[:@2087.4]
  output        io_op32o, // @[:@2087.4]
  output        io_csr_wb_o_valid, // @[:@2087.4]
  output [11:0] io_csr_wb_o_csr_idx, // @[:@2087.4]
  output [63:0] io_csr_wb_o_csr_data, // @[:@2087.4]
  output        io_drego_rs2_valid, // @[:@2087.4]
  output [63:0] io_drego_rs1_value, // @[:@2087.4]
  output [63:0] io_drego_rs2_value, // @[:@2087.4]
  output        io_drego_rd_valid, // @[:@2087.4]
  output [4:0]  io_drego_rd_index, // @[:@2087.4]
  output        io_excep_o_valid, // @[:@2087.4]
  output [63:0] io_excep_o_code, // @[:@2087.4]
  output [63:0] io_excep_o_value, // @[:@2087.4]
  output [63:0] io_excep_o_pc, // @[:@2087.4]
  output        io_excep_o_inst_valid, // @[:@2087.4]
  output        io_ready // @[:@2087.4]
);
  reg [63:0] imm; // @[id_ex.scala 38:24:@2089.4]
  reg [63:0] _RAND_0;
  reg [3:0] ALUOp; // @[id_ex.scala 39:24:@2090.4]
  reg [31:0] _RAND_1;
  reg [3:0] exet; // @[id_ex.scala 40:24:@2091.4]
  reg [31:0] _RAND_2;
  reg [63:0] pc; // @[id_ex.scala 41:24:@2092.4]
  reg [63:0] _RAND_3;
  reg  regInfo_rs2_valid; // @[id_ex.scala 42:26:@2108.4]
  reg [31:0] _RAND_4;
  reg [63:0] regInfo_rs1_value; // @[id_ex.scala 42:26:@2108.4]
  reg [63:0] _RAND_5;
  reg [63:0] regInfo_rs2_value; // @[id_ex.scala 42:26:@2108.4]
  reg [63:0] _RAND_6;
  reg  regInfo_rd_valid; // @[id_ex.scala 42:26:@2108.4]
  reg [31:0] _RAND_7;
  reg [4:0] regInfo_rd_index; // @[id_ex.scala 42:26:@2108.4]
  reg [31:0] _RAND_8;
  reg [3:0] lsm; // @[id_ex.scala 43:24:@2109.4]
  reg [31:0] _RAND_9;
  reg  op32; // @[id_ex.scala 44:24:@2110.4]
  reg [31:0] _RAND_10;
  wire  _T_188; // @[id_ex.scala 46:25:@2111.4]
  wire  bubble; // @[id_ex.scala 46:35:@2112.4]
  wire [63:0] bm; // @[id_ex.scala 47:21:@2114.4]
  reg  csr_wb_valid; // @[id_ex.scala 49:26:@2124.4]
  reg [31:0] _RAND_11;
  reg [11:0] csr_wb_csr_idx; // @[id_ex.scala 49:26:@2124.4]
  reg [31:0] _RAND_12;
  reg [63:0] csr_wb_csr_data; // @[id_ex.scala 49:26:@2124.4]
  reg [63:0] _RAND_13;
  reg  excep_valid; // @[id_ex.scala 50:25:@2138.4]
  reg [31:0] _RAND_14;
  reg [63:0] excep_code; // @[id_ex.scala 50:25:@2138.4]
  reg [63:0] _RAND_15;
  reg [63:0] excep_value; // @[id_ex.scala 50:25:@2138.4]
  reg [63:0] _RAND_16;
  reg [63:0] excep_pc; // @[id_ex.scala 50:25:@2138.4]
  reg [63:0] _RAND_17;
  reg  excep_inst_valid; // @[id_ex.scala 50:25:@2138.4]
  reg [31:0] _RAND_18;
  reg [6:0] mul_counter; // @[id_ex.scala 52:30:@2139.4]
  reg [31:0] _RAND_19;
  wire  _T_256; // @[id_ex.scala 64:17:@2160.4]
  wire [63:0] _T_257; // @[id_ex.scala 65:28:@2162.6]
  wire [3:0] _T_258; // @[id_ex.scala 66:32:@2164.6]
  wire [4:0] _GEN_26; // @[id_ex.scala 66:28:@2165.6]
  wire [4:0] _T_259; // @[id_ex.scala 66:28:@2165.6]
  wire [3:0] _T_261; // @[id_ex.scala 67:28:@2168.6]
  wire  _T_262; // @[id_ex.scala 69:26:@2171.6]
  wire  _T_293_rs2_valid; // @[id_ex.scala 69:23:@2187.6]
  wire [63:0] _T_293_rs1_value; // @[id_ex.scala 69:23:@2187.6]
  wire [63:0] _T_293_rs2_value; // @[id_ex.scala 69:23:@2187.6]
  wire  _T_293_rd_valid; // @[id_ex.scala 69:23:@2187.6]
  wire [4:0] _T_293_rd_index; // @[id_ex.scala 69:23:@2187.6]
  wire [3:0] _T_300; // @[id_ex.scala 70:21:@2194.6]
  wire  _T_302; // @[id_ex.scala 71:27:@2197.6]
  wire [63:0] _GEN_0; // @[id_ex.scala 72:22:@2199.6]
  wire [11:0] _GEN_1; // @[id_ex.scala 72:22:@2199.6]
  wire  _GEN_2; // @[id_ex.scala 72:22:@2199.6]
  wire [63:0] _T_323; // @[id_ex.scala 77:26:@2219.6]
  wire [63:0] _T_326; // @[id_ex.scala 78:27:@2222.6]
  wire  _T_329; // @[id_ex.scala 79:27:@2225.6]
  wire  _T_332; // @[id_ex.scala 81:32:@2229.6]
  wire [6:0] _T_335; // @[id_ex.scala 83:27:@2231.6]
  wire [63:0] _GEN_3; // @[id_ex.scala 64:29:@2161.4]
  wire [4:0] _GEN_4; // @[id_ex.scala 64:29:@2161.4]
  wire [3:0] _GEN_5; // @[id_ex.scala 64:29:@2161.4]
  wire [63:0] _GEN_6; // @[id_ex.scala 64:29:@2161.4]
  wire [4:0] _GEN_7; // @[id_ex.scala 64:29:@2161.4]
  wire  _GEN_8; // @[id_ex.scala 64:29:@2161.4]
  wire [63:0] _GEN_9; // @[id_ex.scala 64:29:@2161.4]
  wire [63:0] _GEN_10; // @[id_ex.scala 64:29:@2161.4]
  wire  _GEN_11; // @[id_ex.scala 64:29:@2161.4]
  wire [3:0] _GEN_13; // @[id_ex.scala 64:29:@2161.4]
  wire  _GEN_14; // @[id_ex.scala 64:29:@2161.4]
  wire [63:0] _GEN_15; // @[id_ex.scala 64:29:@2161.4]
  wire [11:0] _GEN_16; // @[id_ex.scala 64:29:@2161.4]
  wire  _GEN_17; // @[id_ex.scala 64:29:@2161.4]
  wire [63:0] _GEN_18; // @[id_ex.scala 64:29:@2161.4]
  wire [63:0] _GEN_19; // @[id_ex.scala 64:29:@2161.4]
  wire  _GEN_20; // @[id_ex.scala 64:29:@2161.4]
  wire [63:0] _GEN_21; // @[id_ex.scala 64:29:@2161.4]
  wire  _GEN_22; // @[id_ex.scala 64:29:@2161.4]
  wire [6:0] _GEN_23; // @[id_ex.scala 64:29:@2161.4]
  wire  _T_337; // @[id_ex.scala 99:23:@2236.4]
  wire [7:0] _T_340; // @[id_ex.scala 101:34:@2239.6]
  wire [7:0] _T_341; // @[id_ex.scala 101:34:@2240.6]
  wire [6:0] _T_342; // @[id_ex.scala 101:34:@2241.6]
  wire [6:0] _GEN_25; // @[id_ex.scala 99:32:@2237.4]
  assign _T_188 = io_bid | io_bex; // @[id_ex.scala 46:25:@2111.4]
  assign bubble = _T_188 | io_flush; // @[id_ex.scala 46:35:@2112.4]
  assign bm = bubble ? 64'h0 : 64'hffffffffffffffff; // @[id_ex.scala 47:21:@2114.4]
  assign _T_256 = io_en & io_pass; // @[id_ex.scala 64:17:@2160.4]
  assign _T_257 = io_immi & bm; // @[id_ex.scala 65:28:@2162.6]
  assign _T_258 = bm[3:0]; // @[id_ex.scala 66:32:@2164.6]
  assign _GEN_26 = {{1'd0}, _T_258}; // @[id_ex.scala 66:28:@2165.6]
  assign _T_259 = io_ALUOpi & _GEN_26; // @[id_ex.scala 66:28:@2165.6]
  assign _T_261 = io_exeti & _T_258; // @[id_ex.scala 67:28:@2168.6]
  assign _T_262 = bm[0]; // @[id_ex.scala 69:26:@2171.6]
  assign _T_293_rs2_valid = _T_262 ? io_dregi_rs2_valid : 1'h0; // @[id_ex.scala 69:23:@2187.6]
  assign _T_293_rs1_value = _T_262 ? io_dregi_rs1_value : 64'h0; // @[id_ex.scala 69:23:@2187.6]
  assign _T_293_rs2_value = _T_262 ? io_dregi_rs2_value : 64'h0; // @[id_ex.scala 69:23:@2187.6]
  assign _T_293_rd_valid = _T_262 ? io_dregi_rd_valid : 1'h0; // @[id_ex.scala 69:23:@2187.6]
  assign _T_293_rd_index = _T_262 ? io_dregi_rd_index : 5'h0; // @[id_ex.scala 69:23:@2187.6]
  assign _T_300 = bubble ? 4'hf : io_lsmi; // @[id_ex.scala 70:21:@2194.6]
  assign _T_302 = io_op32i & _T_262; // @[id_ex.scala 71:27:@2197.6]
  assign _GEN_0 = bubble ? 64'h0 : io_csr_wb_i_csr_data; // @[id_ex.scala 72:22:@2199.6]
  assign _GEN_1 = bubble ? 12'h0 : io_csr_wb_i_csr_idx; // @[id_ex.scala 72:22:@2199.6]
  assign _GEN_2 = bubble ? 1'h0 : io_csr_wb_i_valid; // @[id_ex.scala 72:22:@2199.6]
  assign _T_323 = _T_262 ? io_excep_i_code : 64'h0; // @[id_ex.scala 77:26:@2219.6]
  assign _T_326 = _T_262 ? io_excep_i_value : 64'h0; // @[id_ex.scala 78:27:@2222.6]
  assign _T_329 = _T_262 ? io_excep_i_valid : 1'h0; // @[id_ex.scala 79:27:@2225.6]
  assign _T_332 = _T_262 ? io_excep_i_inst_valid : 1'h0; // @[id_ex.scala 81:32:@2229.6]
  assign _T_335 = io_mul_div_i ? 7'h7f : 7'h0; // @[id_ex.scala 83:27:@2231.6]
  assign _GEN_3 = _T_256 ? _T_257 : imm; // @[id_ex.scala 64:29:@2161.4]
  assign _GEN_4 = _T_256 ? _T_259 : {{1'd0}, ALUOp}; // @[id_ex.scala 64:29:@2161.4]
  assign _GEN_5 = _T_256 ? _T_261 : exet; // @[id_ex.scala 64:29:@2161.4]
  assign _GEN_6 = _T_256 ? io_pci : pc; // @[id_ex.scala 64:29:@2161.4]
  assign _GEN_7 = _T_256 ? _T_293_rd_index : regInfo_rd_index; // @[id_ex.scala 64:29:@2161.4]
  assign _GEN_8 = _T_256 ? _T_293_rd_valid : regInfo_rd_valid; // @[id_ex.scala 64:29:@2161.4]
  assign _GEN_9 = _T_256 ? _T_293_rs2_value : regInfo_rs2_value; // @[id_ex.scala 64:29:@2161.4]
  assign _GEN_10 = _T_256 ? _T_293_rs1_value : regInfo_rs1_value; // @[id_ex.scala 64:29:@2161.4]
  assign _GEN_11 = _T_256 ? _T_293_rs2_valid : regInfo_rs2_valid; // @[id_ex.scala 64:29:@2161.4]
  assign _GEN_13 = _T_256 ? _T_300 : lsm; // @[id_ex.scala 64:29:@2161.4]
  assign _GEN_14 = _T_256 ? _T_302 : op32; // @[id_ex.scala 64:29:@2161.4]
  assign _GEN_15 = _T_256 ? _GEN_0 : csr_wb_csr_data; // @[id_ex.scala 64:29:@2161.4]
  assign _GEN_16 = _T_256 ? _GEN_1 : csr_wb_csr_idx; // @[id_ex.scala 64:29:@2161.4]
  assign _GEN_17 = _T_256 ? _GEN_2 : csr_wb_valid; // @[id_ex.scala 64:29:@2161.4]
  assign _GEN_18 = _T_256 ? _T_323 : excep_code; // @[id_ex.scala 64:29:@2161.4]
  assign _GEN_19 = _T_256 ? _T_326 : excep_value; // @[id_ex.scala 64:29:@2161.4]
  assign _GEN_20 = _T_256 ? _T_329 : excep_valid; // @[id_ex.scala 64:29:@2161.4]
  assign _GEN_21 = _T_256 ? io_excep_i_pc : excep_pc; // @[id_ex.scala 64:29:@2161.4]
  assign _GEN_22 = _T_256 ? _T_332 : excep_inst_valid; // @[id_ex.scala 64:29:@2161.4]
  assign _GEN_23 = _T_256 ? _T_335 : mul_counter; // @[id_ex.scala 64:29:@2161.4]
  assign _T_337 = mul_counter != 7'h0; // @[id_ex.scala 99:23:@2236.4]
  assign _T_340 = mul_counter - 7'h1; // @[id_ex.scala 101:34:@2239.6]
  assign _T_341 = $unsigned(_T_340); // @[id_ex.scala 101:34:@2240.6]
  assign _T_342 = _T_341[6:0]; // @[id_ex.scala 101:34:@2241.6]
  assign _GEN_25 = _T_337 ? _T_342 : _GEN_23; // @[id_ex.scala 99:32:@2237.4]
  assign io_immo = imm; // @[id_ex.scala 54:15:@2140.4]
  assign io_ALUOpo = {{1'd0}, ALUOp}; // @[id_ex.scala 55:15:@2141.4]
  assign io_exeto = exet; // @[id_ex.scala 56:15:@2142.4]
  assign io_pco = pc; // @[id_ex.scala 57:15:@2143.4]
  assign io_lsmo = lsm; // @[id_ex.scala 59:15:@2150.4]
  assign io_op32o = op32; // @[id_ex.scala 60:15:@2151.4]
  assign io_csr_wb_o_valid = csr_wb_valid; // @[id_ex.scala 61:18:@2154.4]
  assign io_csr_wb_o_csr_idx = csr_wb_csr_idx; // @[id_ex.scala 61:18:@2153.4]
  assign io_csr_wb_o_csr_data = csr_wb_csr_data; // @[id_ex.scala 61:18:@2152.4]
  assign io_drego_rs2_valid = regInfo_rs2_valid; // @[id_ex.scala 58:14:@2148.4]
  assign io_drego_rs1_value = regInfo_rs1_value; // @[id_ex.scala 58:14:@2147.4]
  assign io_drego_rs2_value = regInfo_rs2_value; // @[id_ex.scala 58:14:@2146.4]
  assign io_drego_rd_valid = regInfo_rd_valid; // @[id_ex.scala 58:14:@2145.4]
  assign io_drego_rd_index = regInfo_rd_index; // @[id_ex.scala 58:14:@2144.4]
  assign io_excep_o_valid = excep_valid; // @[id_ex.scala 62:16:@2159.4]
  assign io_excep_o_code = excep_code; // @[id_ex.scala 62:16:@2158.4]
  assign io_excep_o_value = excep_value; // @[id_ex.scala 62:16:@2157.4]
  assign io_excep_o_pc = excep_pc; // @[id_ex.scala 62:16:@2156.4]
  assign io_excep_o_inst_valid = excep_inst_valid; // @[id_ex.scala 62:16:@2155.4]
  assign io_ready = _T_337 ? 1'h0 : 1'h1; // @[id_ex.scala 100:16:@2238.6 id_ex.scala 103:16:@2245.6]
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
  _RAND_15 = {2{`RANDOM}};
  excep_code = _RAND_15[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {2{`RANDOM}};
  excep_value = _RAND_16[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {2{`RANDOM}};
  excep_pc = _RAND_17[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  excep_inst_valid = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  mul_counter = _RAND_19[6:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      imm <= 64'h0;
    end else begin
      if (_T_256) begin
        imm <= _T_257;
      end
    end
    if (reset) begin
      ALUOp <= 4'h0;
    end else begin
      ALUOp <= _GEN_4[3:0];
    end
    if (reset) begin
      exet <= 4'h0;
    end else begin
      if (_T_256) begin
        exet <= _T_261;
      end
    end
    if (reset) begin
      pc <= 64'h0;
    end else begin
      if (_T_256) begin
        pc <= io_pci;
      end
    end
    if (reset) begin
      regInfo_rs2_valid <= 1'h0;
    end else begin
      if (_T_256) begin
        if (_T_262) begin
          regInfo_rs2_valid <= io_dregi_rs2_valid;
        end else begin
          regInfo_rs2_valid <= 1'h0;
        end
      end
    end
    if (reset) begin
      regInfo_rs1_value <= 64'h0;
    end else begin
      if (_T_256) begin
        if (_T_262) begin
          regInfo_rs1_value <= io_dregi_rs1_value;
        end else begin
          regInfo_rs1_value <= 64'h0;
        end
      end
    end
    if (reset) begin
      regInfo_rs2_value <= 64'h0;
    end else begin
      if (_T_256) begin
        if (_T_262) begin
          regInfo_rs2_value <= io_dregi_rs2_value;
        end else begin
          regInfo_rs2_value <= 64'h0;
        end
      end
    end
    if (reset) begin
      regInfo_rd_valid <= 1'h0;
    end else begin
      if (_T_256) begin
        if (_T_262) begin
          regInfo_rd_valid <= io_dregi_rd_valid;
        end else begin
          regInfo_rd_valid <= 1'h0;
        end
      end
    end
    if (reset) begin
      regInfo_rd_index <= 5'h0;
    end else begin
      if (_T_256) begin
        if (_T_262) begin
          regInfo_rd_index <= io_dregi_rd_index;
        end else begin
          regInfo_rd_index <= 5'h0;
        end
      end
    end
    if (reset) begin
      lsm <= 4'hf;
    end else begin
      if (_T_256) begin
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
      if (_T_256) begin
        op32 <= _T_302;
      end
    end
    if (reset) begin
      csr_wb_valid <= 1'h0;
    end else begin
      if (_T_256) begin
        if (bubble) begin
          csr_wb_valid <= 1'h0;
        end else begin
          csr_wb_valid <= io_csr_wb_i_valid;
        end
      end
    end
    if (reset) begin
      csr_wb_csr_idx <= 12'h0;
    end else begin
      if (_T_256) begin
        if (bubble) begin
          csr_wb_csr_idx <= 12'h0;
        end else begin
          csr_wb_csr_idx <= io_csr_wb_i_csr_idx;
        end
      end
    end
    if (reset) begin
      csr_wb_csr_data <= 64'h0;
    end else begin
      if (_T_256) begin
        if (bubble) begin
          csr_wb_csr_data <= 64'h0;
        end else begin
          csr_wb_csr_data <= io_csr_wb_i_csr_data;
        end
      end
    end
    if (reset) begin
      excep_valid <= 1'h0;
    end else begin
      if (_T_256) begin
        if (_T_262) begin
          excep_valid <= io_excep_i_valid;
        end else begin
          excep_valid <= 1'h0;
        end
      end
    end
    if (reset) begin
      excep_code <= 64'h0;
    end else begin
      if (_T_256) begin
        if (_T_262) begin
          excep_code <= io_excep_i_code;
        end else begin
          excep_code <= 64'h0;
        end
      end
    end
    if (reset) begin
      excep_value <= 64'h0;
    end else begin
      if (_T_256) begin
        if (_T_262) begin
          excep_value <= io_excep_i_value;
        end else begin
          excep_value <= 64'h0;
        end
      end
    end
    if (reset) begin
      excep_pc <= 64'h0;
    end else begin
      if (_T_256) begin
        excep_pc <= io_excep_i_pc;
      end
    end
    if (reset) begin
      excep_inst_valid <= 1'h0;
    end else begin
      if (_T_256) begin
        if (_T_262) begin
          excep_inst_valid <= io_excep_i_inst_valid;
        end else begin
          excep_inst_valid <= 1'h0;
        end
      end
    end
    if (reset) begin
      mul_counter <= 7'h0;
    end else begin
      if (_T_337) begin
        mul_counter <= _T_342;
      end else begin
        if (_T_256) begin
          if (io_mul_div_i) begin
            mul_counter <= 7'h7f;
          end else begin
            mul_counter <= 7'h0;
          end
        end
      end
    end
  end
endmodule
module EX_MEM( // @[:@2248.2]
  input         clock, // @[:@2249.4]
  input         reset, // @[:@2250.4]
  input         io_en, // @[:@2251.4]
  input         io_pass, // @[:@2251.4]
  input         io_flush, // @[:@2251.4]
  input         io_nlsi, // @[:@2251.4]
  input  [3:0]  io_lsmi, // @[:@2251.4]
  input  [63:0] io_addri, // @[:@2251.4]
  input  [63:0] io_datai, // @[:@2251.4]
  input         io_wregi_wbrv, // @[:@2251.4]
  input  [4:0]  io_wregi_wbri, // @[:@2251.4]
  input  [63:0] io_wregi_wbrd, // @[:@2251.4]
  input         io_csr_wb_i_valid, // @[:@2251.4]
  input  [11:0] io_csr_wb_i_csr_idx, // @[:@2251.4]
  input  [63:0] io_csr_wb_i_csr_data, // @[:@2251.4]
  input         io_excep_i_valid, // @[:@2251.4]
  input  [63:0] io_excep_i_code, // @[:@2251.4]
  input  [63:0] io_excep_i_value, // @[:@2251.4]
  input  [63:0] io_excep_i_pc, // @[:@2251.4]
  input         io_excep_i_inst_valid, // @[:@2251.4]
  input         io_inter_i_valid, // @[:@2251.4]
  input  [63:0] io_inter_i_bits, // @[:@2251.4]
  output        io_nlso, // @[:@2251.4]
  output [3:0]  io_lsmo, // @[:@2251.4]
  output [63:0] io_addro, // @[:@2251.4]
  output [63:0] io_datao, // @[:@2251.4]
  output        io_wrego_wbrv, // @[:@2251.4]
  output [4:0]  io_wrego_wbri, // @[:@2251.4]
  output [63:0] io_wrego_wbrd, // @[:@2251.4]
  output        io_csr_wb_o_valid, // @[:@2251.4]
  output [11:0] io_csr_wb_o_csr_idx, // @[:@2251.4]
  output [63:0] io_csr_wb_o_csr_data, // @[:@2251.4]
  output        io_excep_o_valid, // @[:@2251.4]
  output [63:0] io_excep_o_code, // @[:@2251.4]
  output [63:0] io_excep_o_value, // @[:@2251.4]
  output [63:0] io_excep_o_pc, // @[:@2251.4]
  output        io_excep_o_inst_valid, // @[:@2251.4]
  output        io_inter_o_valid, // @[:@2251.4]
  output [63:0] io_inter_o_bits // @[:@2251.4]
);
  reg  nls; // @[ex_mem.scala 31:23:@2253.4]
  reg [31:0] _RAND_0;
  reg  wbrv; // @[ex_mem.scala 32:23:@2254.4]
  reg [31:0] _RAND_1;
  reg [63:0] wbrd; // @[ex_mem.scala 33:23:@2255.4]
  reg [63:0] _RAND_2;
  reg [4:0] wbri; // @[ex_mem.scala 34:23:@2256.4]
  reg [31:0] _RAND_3;
  reg [3:0] lsm; // @[ex_mem.scala 35:23:@2257.4]
  reg [31:0] _RAND_4;
  reg [63:0] addr; // @[ex_mem.scala 36:23:@2258.4]
  reg [63:0] _RAND_5;
  reg [63:0] data; // @[ex_mem.scala 37:23:@2259.4]
  reg [63:0] _RAND_6;
  reg  csr_wb_valid; // @[ex_mem.scala 38:26:@2269.4]
  reg [31:0] _RAND_7;
  reg [11:0] csr_wb_csr_idx; // @[ex_mem.scala 38:26:@2269.4]
  reg [31:0] _RAND_8;
  reg [63:0] csr_wb_csr_data; // @[ex_mem.scala 38:26:@2269.4]
  reg [63:0] _RAND_9;
  reg  excep_valid; // @[ex_mem.scala 39:26:@2283.4]
  reg [31:0] _RAND_10;
  reg [63:0] excep_code; // @[ex_mem.scala 39:26:@2283.4]
  reg [63:0] _RAND_11;
  reg [63:0] excep_value; // @[ex_mem.scala 39:26:@2283.4]
  reg [63:0] _RAND_12;
  reg [63:0] excep_pc; // @[ex_mem.scala 39:26:@2283.4]
  reg [63:0] _RAND_13;
  reg  excep_inst_valid; // @[ex_mem.scala 39:26:@2283.4]
  reg [31:0] _RAND_14;
  reg  inter_valid; // @[ex_mem.scala 40:26:@2291.4]
  reg [31:0] _RAND_15;
  reg [63:0] inter_bits; // @[ex_mem.scala 40:26:@2291.4]
  reg [63:0] _RAND_16;
  wire  _T_206; // @[ex_mem.scala 53:17:@2309.4]
  wire  _T_207; // @[ex_mem.scala 54:45:@2311.6]
  wire  _T_208; // @[ex_mem.scala 54:67:@2312.6]
  wire  _T_209; // @[ex_mem.scala 55:31:@2313.6]
  wire  _T_211; // @[ex_mem.scala 55:21:@2314.6]
  wire [4:0] _T_213; // @[ex_mem.scala 56:21:@2316.6]
  wire  _T_216; // @[ex_mem.scala 57:44:@2318.6]
  wire  _T_217; // @[ex_mem.scala 57:21:@2319.6]
  wire [63:0] _T_219; // @[ex_mem.scala 58:21:@2321.6]
  wire [3:0] _T_220; // @[ex_mem.scala 59:45:@2323.6]
  wire [3:0] _T_221; // @[ex_mem.scala 59:21:@2324.6]
  wire [63:0] _T_224; // @[ex_mem.scala 60:21:@2327.6]
  wire [63:0] _T_226; // @[ex_mem.scala 61:21:@2329.6]
  wire  _T_229; // @[ex_mem.scala 63:54:@2331.6]
  wire  _T_230; // @[ex_mem.scala 63:31:@2332.6]
  wire  _GEN_0; // @[ex_mem.scala 69:24:@2343.6]
  wire  _GEN_1; // @[ex_mem.scala 69:24:@2343.6]
  wire  _GEN_2; // @[ex_mem.scala 69:24:@2343.6]
  wire  _GEN_3; // @[ex_mem.scala 53:29:@2310.4]
  wire [4:0] _GEN_4; // @[ex_mem.scala 53:29:@2310.4]
  wire  _GEN_5; // @[ex_mem.scala 53:29:@2310.4]
  wire [63:0] _GEN_6; // @[ex_mem.scala 53:29:@2310.4]
  wire [3:0] _GEN_7; // @[ex_mem.scala 53:29:@2310.4]
  wire [63:0] _GEN_8; // @[ex_mem.scala 53:29:@2310.4]
  wire [63:0] _GEN_9; // @[ex_mem.scala 53:29:@2310.4]
  wire  _GEN_10; // @[ex_mem.scala 53:29:@2310.4]
  wire [11:0] _GEN_11; // @[ex_mem.scala 53:29:@2310.4]
  wire [63:0] _GEN_12; // @[ex_mem.scala 53:29:@2310.4]
  wire  _GEN_13; // @[ex_mem.scala 53:29:@2310.4]
  wire [63:0] _GEN_14; // @[ex_mem.scala 53:29:@2310.4]
  wire [63:0] _GEN_15; // @[ex_mem.scala 53:29:@2310.4]
  wire [63:0] _GEN_16; // @[ex_mem.scala 53:29:@2310.4]
  wire  _GEN_17; // @[ex_mem.scala 53:29:@2310.4]
  wire [63:0] _GEN_18; // @[ex_mem.scala 53:29:@2310.4]
  wire  _GEN_19; // @[ex_mem.scala 53:29:@2310.4]
  assign _T_206 = io_en & io_pass; // @[ex_mem.scala 53:17:@2309.4]
  assign _T_207 = io_excep_i_valid | io_inter_i_valid; // @[ex_mem.scala 54:45:@2311.6]
  assign _T_208 = _T_207 & io_excep_i_inst_valid; // @[ex_mem.scala 54:67:@2312.6]
  assign _T_209 = io_flush | _T_208; // @[ex_mem.scala 55:31:@2313.6]
  assign _T_211 = _T_209 ? 1'h0 : io_nlsi; // @[ex_mem.scala 55:21:@2314.6]
  assign _T_213 = io_flush ? 5'h0 : io_wregi_wbri; // @[ex_mem.scala 56:21:@2316.6]
  assign _T_216 = _T_208 ? 1'h0 : io_wregi_wbrv; // @[ex_mem.scala 57:44:@2318.6]
  assign _T_217 = io_flush ? 1'h0 : _T_216; // @[ex_mem.scala 57:21:@2319.6]
  assign _T_219 = io_flush ? 64'h0 : io_wregi_wbrd; // @[ex_mem.scala 58:21:@2321.6]
  assign _T_220 = _T_208 ? 4'hf : io_lsmi; // @[ex_mem.scala 59:45:@2323.6]
  assign _T_221 = io_flush ? 4'hf : _T_220; // @[ex_mem.scala 59:21:@2324.6]
  assign _T_224 = io_flush ? 64'hffffffffffffffff : io_addri; // @[ex_mem.scala 60:21:@2327.6]
  assign _T_226 = io_flush ? 64'h0 : io_datai; // @[ex_mem.scala 61:21:@2329.6]
  assign _T_229 = _T_208 ? 1'h0 : io_csr_wb_i_valid; // @[ex_mem.scala 63:54:@2331.6]
  assign _T_230 = io_flush ? 1'h0 : _T_229; // @[ex_mem.scala 63:31:@2332.6]
  assign _GEN_0 = io_flush ? 1'h0 : io_excep_i_valid; // @[ex_mem.scala 69:24:@2343.6]
  assign _GEN_1 = io_flush ? 1'h0 : io_excep_i_inst_valid; // @[ex_mem.scala 69:24:@2343.6]
  assign _GEN_2 = io_flush ? 1'h0 : io_inter_i_valid; // @[ex_mem.scala 69:24:@2343.6]
  assign _GEN_3 = _T_206 ? _T_211 : nls; // @[ex_mem.scala 53:29:@2310.4]
  assign _GEN_4 = _T_206 ? _T_213 : wbri; // @[ex_mem.scala 53:29:@2310.4]
  assign _GEN_5 = _T_206 ? _T_217 : wbrv; // @[ex_mem.scala 53:29:@2310.4]
  assign _GEN_6 = _T_206 ? _T_219 : wbrd; // @[ex_mem.scala 53:29:@2310.4]
  assign _GEN_7 = _T_206 ? _T_221 : lsm; // @[ex_mem.scala 53:29:@2310.4]
  assign _GEN_8 = _T_206 ? _T_224 : addr; // @[ex_mem.scala 53:29:@2310.4]
  assign _GEN_9 = _T_206 ? _T_226 : data; // @[ex_mem.scala 53:29:@2310.4]
  assign _GEN_10 = _T_206 ? _T_230 : csr_wb_valid; // @[ex_mem.scala 53:29:@2310.4]
  assign _GEN_11 = _T_206 ? io_csr_wb_i_csr_idx : csr_wb_csr_idx; // @[ex_mem.scala 53:29:@2310.4]
  assign _GEN_12 = _T_206 ? io_csr_wb_i_csr_data : csr_wb_csr_data; // @[ex_mem.scala 53:29:@2310.4]
  assign _GEN_13 = _T_206 ? _GEN_1 : excep_inst_valid; // @[ex_mem.scala 53:29:@2310.4]
  assign _GEN_14 = _T_206 ? io_excep_i_pc : excep_pc; // @[ex_mem.scala 53:29:@2310.4]
  assign _GEN_15 = _T_206 ? io_excep_i_value : excep_value; // @[ex_mem.scala 53:29:@2310.4]
  assign _GEN_16 = _T_206 ? io_excep_i_code : excep_code; // @[ex_mem.scala 53:29:@2310.4]
  assign _GEN_17 = _T_206 ? _GEN_0 : excep_valid; // @[ex_mem.scala 53:29:@2310.4]
  assign _GEN_18 = _T_206 ? io_inter_i_bits : inter_bits; // @[ex_mem.scala 53:29:@2310.4]
  assign _GEN_19 = _T_206 ? _GEN_2 : inter_valid; // @[ex_mem.scala 53:29:@2310.4]
  assign io_nlso = nls; // @[ex_mem.scala 42:13:@2292.4]
  assign io_lsmo = lsm; // @[ex_mem.scala 46:13:@2296.4]
  assign io_addro = addr; // @[ex_mem.scala 47:14:@2297.4]
  assign io_datao = data; // @[ex_mem.scala 48:14:@2298.4]
  assign io_wrego_wbrv = wbrv; // @[ex_mem.scala 44:19:@2294.4]
  assign io_wrego_wbri = wbri; // @[ex_mem.scala 45:19:@2295.4]
  assign io_wrego_wbrd = wbrd; // @[ex_mem.scala 43:19:@2293.4]
  assign io_csr_wb_o_valid = csr_wb_valid; // @[ex_mem.scala 49:18:@2301.4]
  assign io_csr_wb_o_csr_idx = csr_wb_csr_idx; // @[ex_mem.scala 49:18:@2300.4]
  assign io_csr_wb_o_csr_data = csr_wb_csr_data; // @[ex_mem.scala 49:18:@2299.4]
  assign io_excep_o_valid = excep_valid; // @[ex_mem.scala 50:18:@2306.4]
  assign io_excep_o_code = excep_code; // @[ex_mem.scala 50:18:@2305.4]
  assign io_excep_o_value = excep_value; // @[ex_mem.scala 50:18:@2304.4]
  assign io_excep_o_pc = excep_pc; // @[ex_mem.scala 50:18:@2303.4]
  assign io_excep_o_inst_valid = excep_inst_valid; // @[ex_mem.scala 50:18:@2302.4]
  assign io_inter_o_valid = inter_valid; // @[ex_mem.scala 51:18:@2308.4]
  assign io_inter_o_bits = inter_bits; // @[ex_mem.scala 51:18:@2307.4]
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
  _RAND_11 = {2{`RANDOM}};
  excep_code = _RAND_11[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {2{`RANDOM}};
  excep_value = _RAND_12[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {2{`RANDOM}};
  excep_pc = _RAND_13[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  excep_inst_valid = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  inter_valid = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {2{`RANDOM}};
  inter_bits = _RAND_16[63:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      nls <= 1'h0;
    end else begin
      if (_T_206) begin
        if (_T_209) begin
          nls <= 1'h0;
        end else begin
          nls <= io_nlsi;
        end
      end
    end
    if (reset) begin
      wbrv <= 1'h0;
    end else begin
      if (_T_206) begin
        if (io_flush) begin
          wbrv <= 1'h0;
        end else begin
          if (_T_208) begin
            wbrv <= 1'h0;
          end else begin
            wbrv <= io_wregi_wbrv;
          end
        end
      end
    end
    if (reset) begin
      wbrd <= 64'h0;
    end else begin
      if (_T_206) begin
        if (io_flush) begin
          wbrd <= 64'h0;
        end else begin
          wbrd <= io_wregi_wbrd;
        end
      end
    end
    if (reset) begin
      wbri <= 5'h0;
    end else begin
      if (_T_206) begin
        if (io_flush) begin
          wbri <= 5'h0;
        end else begin
          wbri <= io_wregi_wbri;
        end
      end
    end
    if (reset) begin
      lsm <= 4'hf;
    end else begin
      if (_T_206) begin
        if (io_flush) begin
          lsm <= 4'hf;
        end else begin
          if (_T_208) begin
            lsm <= 4'hf;
          end else begin
            lsm <= io_lsmi;
          end
        end
      end
    end
    if (reset) begin
      addr <= 64'h0;
    end else begin
      if (_T_206) begin
        if (io_flush) begin
          addr <= 64'hffffffffffffffff;
        end else begin
          addr <= io_addri;
        end
      end
    end
    if (reset) begin
      data <= 64'h0;
    end else begin
      if (_T_206) begin
        if (io_flush) begin
          data <= 64'h0;
        end else begin
          data <= io_datai;
        end
      end
    end
    if (reset) begin
      csr_wb_valid <= 1'h0;
    end else begin
      if (_T_206) begin
        if (io_flush) begin
          csr_wb_valid <= 1'h0;
        end else begin
          if (_T_208) begin
            csr_wb_valid <= 1'h0;
          end else begin
            csr_wb_valid <= io_csr_wb_i_valid;
          end
        end
      end
    end
    if (reset) begin
      csr_wb_csr_idx <= 12'h0;
    end else begin
      if (_T_206) begin
        csr_wb_csr_idx <= io_csr_wb_i_csr_idx;
      end
    end
    if (reset) begin
      csr_wb_csr_data <= 64'h0;
    end else begin
      if (_T_206) begin
        csr_wb_csr_data <= io_csr_wb_i_csr_data;
      end
    end
    if (reset) begin
      excep_valid <= 1'h0;
    end else begin
      if (_T_206) begin
        if (io_flush) begin
          excep_valid <= 1'h0;
        end else begin
          excep_valid <= io_excep_i_valid;
        end
      end
    end
    if (reset) begin
      excep_code <= 64'h0;
    end else begin
      if (_T_206) begin
        excep_code <= io_excep_i_code;
      end
    end
    if (reset) begin
      excep_value <= 64'h0;
    end else begin
      if (_T_206) begin
        excep_value <= io_excep_i_value;
      end
    end
    if (reset) begin
      excep_pc <= 64'h0;
    end else begin
      if (_T_206) begin
        excep_pc <= io_excep_i_pc;
      end
    end
    if (reset) begin
      excep_inst_valid <= 1'h0;
    end else begin
      if (_T_206) begin
        if (io_flush) begin
          excep_inst_valid <= 1'h0;
        end else begin
          excep_inst_valid <= io_excep_i_inst_valid;
        end
      end
    end
    if (reset) begin
      inter_valid <= 1'h0;
    end else begin
      if (_T_206) begin
        if (io_flush) begin
          inter_valid <= 1'h0;
        end else begin
          inter_valid <= io_inter_i_valid;
        end
      end
    end
    if (reset) begin
      inter_bits <= 64'h0;
    end else begin
      if (_T_206) begin
        inter_bits <= io_inter_i_bits;
      end
    end
  end
endmodule
module MEM_WB( // @[:@2350.2]
  input         clock, // @[:@2351.4]
  input         reset, // @[:@2352.4]
  input         io_en, // @[:@2353.4]
  input         io_pass, // @[:@2353.4]
  input         io_wregi_wbrv, // @[:@2353.4]
  input  [4:0]  io_wregi_wbri, // @[:@2353.4]
  input  [63:0] io_wregi_wbrd, // @[:@2353.4]
  output        io_wrego_wbrv, // @[:@2353.4]
  output [4:0]  io_wrego_wbri, // @[:@2353.4]
  output [63:0] io_wrego_wbrd // @[:@2353.4]
);
  reg  wbrv; // @[mem_wb.scala 15:23:@2355.4]
  reg [31:0] _RAND_0;
  reg [63:0] wbrd; // @[mem_wb.scala 16:23:@2356.4]
  reg [63:0] _RAND_1;
  reg [4:0] wbri; // @[mem_wb.scala 17:23:@2357.4]
  reg [31:0] _RAND_2;
  wire  _T_35; // @[mem_wb.scala 23:17:@2361.4]
  wire [4:0] _GEN_0; // @[mem_wb.scala 23:29:@2362.4]
  wire  _GEN_1; // @[mem_wb.scala 23:29:@2362.4]
  wire [63:0] _GEN_2; // @[mem_wb.scala 23:29:@2362.4]
  assign _T_35 = io_en & io_pass; // @[mem_wb.scala 23:17:@2361.4]
  assign _GEN_0 = _T_35 ? io_wregi_wbri : wbri; // @[mem_wb.scala 23:29:@2362.4]
  assign _GEN_1 = _T_35 ? io_wregi_wbrv : wbrv; // @[mem_wb.scala 23:29:@2362.4]
  assign _GEN_2 = _T_35 ? io_wregi_wbrd : wbrd; // @[mem_wb.scala 23:29:@2362.4]
  assign io_wrego_wbrv = wbrv; // @[mem_wb.scala 20:19:@2359.4]
  assign io_wrego_wbri = wbri; // @[mem_wb.scala 21:19:@2360.4]
  assign io_wrego_wbrd = wbrd; // @[mem_wb.scala 19:19:@2358.4]
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
module CSR( // @[:@2368.2]
  input         clock, // @[:@2369.4]
  input         reset, // @[:@2370.4]
  input  [11:0] io_id_addr, // @[:@2371.4]
  output [63:0] io_id_rdata, // @[:@2371.4]
  output [1:0]  io_id_priv, // @[:@2371.4]
  input         io_mem_wrCSROp_valid, // @[:@2371.4]
  input  [11:0] io_mem_wrCSROp_csr_idx, // @[:@2371.4]
  input  [63:0] io_mem_wrCSROp_csr_data, // @[:@2371.4]
  input         io_mem_excep_valid, // @[:@2371.4]
  input  [63:0] io_mem_excep_code, // @[:@2371.4]
  input  [63:0] io_mem_excep_value, // @[:@2371.4]
  input  [63:0] io_mem_excep_pc, // @[:@2371.4]
  input         io_mem_excep_inst_valid, // @[:@2371.4]
  output [63:0] io_mmu_satp, // @[:@2371.4]
  output [1:0]  io_mmu_priv, // @[:@2371.4]
  output        io_mmu_mxr, // @[:@2371.4]
  output        io_mmu_sum, // @[:@2371.4]
  output        io_flush, // @[:@2371.4]
  output [63:0] io_csrNewPc, // @[:@2371.4]
  output        io_inter_valid, // @[:@2371.4]
  output [63:0] io_inter_bits // @[:@2371.4]
);
  reg [63:0] csr [0:1023]; // @[CSR.scala 25:16:@2377.4]
  reg [63:0] _RAND_0;
  wire [63:0] csr__T_156_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_156_addr; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_245_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_245_addr; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_246_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_246_addr; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_269_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_269_addr; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_mtvec_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_mtvec_addr; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_stvec_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_stvec_addr; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_utvec_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_utvec_addr; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_medeleg_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_medeleg_addr; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_mideleg_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_mideleg_addr; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_sedeleg_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_sedeleg_addr; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_sideleg_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_sideleg_addr; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_mie_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_mie_addr; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_mip_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_mip_addr; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_mtimecmp_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_mtimecmp_addr; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_mepc_r_0_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_mepc_r_0_addr; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_sepc_r_0_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_sepc_r_0_addr; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_uepc_r_0_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_uepc_r_0_addr; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_272_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_272_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_272_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_272_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_275_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_275_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_275_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_275_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_278_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_278_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_278_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_278_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_281_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_281_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_281_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_281_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_283_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_283_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_283_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_283_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_285_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_285_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_285_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_285_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_287_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_287_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_287_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_287_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_289_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_289_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_289_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_289_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_291_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_291_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_291_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_291_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_293_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_293_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_293_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_293_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_295_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_295_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_295_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_295_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_297_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_297_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_297_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_297_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_299_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_299_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_299_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_299_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_301_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_301_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_301_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_301_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_303_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_303_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_303_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_303_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_305_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_305_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_305_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_305_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_307_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_307_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_307_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_307_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_309_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_309_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_309_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_309_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_311_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_311_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_311_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_311_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_313_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_313_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_313_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_313_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_315_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_315_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_315_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_315_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_317_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_317_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_317_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_317_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_319_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_319_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_319_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_319_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_321_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_321_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_321_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_321_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_323_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_323_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_323_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_323_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_325_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_325_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_325_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_325_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_327_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_327_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_327_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_327_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_329_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_329_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_329_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_329_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_331_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_331_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_331_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_331_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_333_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_333_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_333_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_333_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_335_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_335_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_335_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_335_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_337_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_337_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_337_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_337_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_339_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_339_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_339_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_339_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_341_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_341_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_341_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_341_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_343_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_343_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_343_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_343_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_346_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_346_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_346_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_346_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_349_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_349_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_349_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_349_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_411_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_411_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_411_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_411_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_413_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_413_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_413_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_413_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_mcause_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_mcause_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr_mcause_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr_mcause_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_scause_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_scause_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr_scause_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr_scause_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_ucause_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_ucause_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr_ucause_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr_ucause_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_mtval_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_mtval_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr_mtval_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr_mtval_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_stval_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_stval_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr_stval_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr_stval_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_utval_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_utval_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr_utval_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr_utval_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr__T_420_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr__T_420_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_420_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr__T_420_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_mepc_w_0_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_mepc_w_0_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr_mepc_w_0_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr_mepc_w_0_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_sepc_w_0_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_sepc_w_0_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr_sepc_w_0_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr_sepc_w_0_en; // @[CSR.scala 25:16:@2377.4]
  wire [63:0] csr_uepc_w_0_data; // @[CSR.scala 25:16:@2377.4]
  wire [9:0] csr_uepc_w_0_addr; // @[CSR.scala 25:16:@2377.4]
  wire  csr_uepc_w_0_mask; // @[CSR.scala 25:16:@2377.4]
  wire  csr_uepc_w_0_en; // @[CSR.scala 25:16:@2377.4]
  reg [1:0] prv; // @[CSR.scala 22:24:@2374.4]
  reg [31:0] _RAND_1;
  reg  mstatus_SD; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_2;
  reg [26:0] mstatus_zero1; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_3;
  reg [1:0] mstatus_SXL; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_4;
  reg [1:0] mstatus_UXL; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_5;
  reg  mstatus_TSR; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_6;
  reg [8:0] mstatus_zero2; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_7;
  reg  mstatus_TW; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_8;
  reg  mstatus_TVM; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_9;
  reg  mstatus_MXR; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_10;
  reg  mstatus_SUM; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_11;
  reg  mstatus_MPriv; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_12;
  reg [1:0] mstatus_XS; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_13;
  reg [1:0] mstatus_FS; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_14;
  reg [1:0] mstatus_MPP; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_15;
  reg [1:0] mstatus_old_HPP; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_16;
  reg  mstatus_SPP; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_17;
  reg  mstatus_MPIE; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_18;
  reg  mstatus_old_HPIE; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_19;
  reg  mstatus_SPIE; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_20;
  reg  mstatus_UPIE; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_21;
  reg  mstatus_MIE; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_22;
  reg  mstatus_old_HIE; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_23;
  reg  mstatus_SIE; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_24;
  reg  mstatus_UIE; // @[CSR.scala 102:24:@2429.4]
  reg [31:0] _RAND_25;
  reg [63:0] mtime; // @[CSR.scala 103:24:@2430.4]
  reg [63:0] _RAND_26;
  wire [64:0] _T_153; // @[CSR.scala 104:18:@2431.4]
  wire [63:0] _T_154; // @[CSR.scala 104:18:@2432.4]
  wire [5:0] _T_203; // @[CSR.scala 112:29:@2440.4]
  wire [14:0] _T_209; // @[CSR.scala 112:29:@2446.4]
  wire [6:0] _T_214; // @[CSR.scala 112:29:@2451.4]
  wire [63:0] _T_221; // @[CSR.scala 112:29:@2458.4]
  wire  _T_247; // @[Mux.scala 46:19:@2484.4]
  wire [63:0] _T_248; // @[Mux.scala 46:16:@2485.4]
  wire  _T_249; // @[Mux.scala 46:19:@2486.4]
  wire [63:0] _T_250; // @[Mux.scala 46:16:@2487.4]
  wire  _T_251; // @[Mux.scala 46:19:@2488.4]
  wire [63:0] _T_252; // @[Mux.scala 46:16:@2489.4]
  wire  _T_253; // @[Mux.scala 46:19:@2490.4]
  wire [63:0] _T_254; // @[Mux.scala 46:16:@2491.4]
  wire  _T_255; // @[Mux.scala 46:19:@2492.4]
  wire [63:0] _T_256; // @[Mux.scala 46:16:@2493.4]
  wire  _T_257; // @[Mux.scala 46:19:@2494.4]
  wire [63:0] _T_258; // @[Mux.scala 46:16:@2495.4]
  wire  _T_259; // @[Mux.scala 46:19:@2496.4]
  wire [63:0] _T_260; // @[Mux.scala 46:16:@2497.4]
  wire  _T_261; // @[Mux.scala 46:19:@2498.4]
  wire [63:0] _T_262; // @[Mux.scala 46:16:@2499.4]
  wire  _T_263; // @[Mux.scala 46:19:@2500.4]
  wire [63:0] _T_264; // @[Mux.scala 46:16:@2501.4]
  wire  _T_265; // @[Mux.scala 46:19:@2502.4]
  wire [63:0] _T_266; // @[Mux.scala 46:16:@2503.4]
  wire  _T_267; // @[Mux.scala 46:19:@2504.4]
  wire  _T_270; // @[CSR.scala 132:14:@2514.6]
  wire  _T_273; // @[CSR.scala 132:14:@2519.6]
  wire  _T_276; // @[CSR.scala 132:14:@2524.6]
  wire  _T_279; // @[CSR.scala 132:14:@2529.6]
  wire  _T_282; // @[CSR.scala 132:14:@2534.6]
  wire  _T_284; // @[CSR.scala 132:14:@2539.6]
  wire  _T_286; // @[CSR.scala 132:14:@2544.6]
  wire  _T_288; // @[CSR.scala 132:14:@2549.6]
  wire  _T_290; // @[CSR.scala 132:14:@2554.6]
  wire  _T_292; // @[CSR.scala 132:14:@2559.6]
  wire  _T_294; // @[CSR.scala 132:14:@2564.6]
  wire  _T_296; // @[CSR.scala 132:14:@2569.6]
  wire  _T_298; // @[CSR.scala 132:14:@2574.6]
  wire  _T_300; // @[CSR.scala 132:14:@2579.6]
  wire  _T_302; // @[CSR.scala 132:14:@2584.6]
  wire  _T_304; // @[CSR.scala 132:14:@2589.6]
  wire  _T_306; // @[CSR.scala 132:14:@2594.6]
  wire  _T_308; // @[CSR.scala 132:14:@2599.6]
  wire  _T_310; // @[CSR.scala 132:14:@2604.6]
  wire  _T_312; // @[CSR.scala 132:14:@2609.6]
  wire  _T_314; // @[CSR.scala 132:14:@2614.6]
  wire  _T_316; // @[CSR.scala 132:14:@2619.6]
  wire  _T_318; // @[CSR.scala 132:14:@2624.6]
  wire  _T_320; // @[CSR.scala 132:14:@2629.6]
  wire  _T_322; // @[CSR.scala 132:14:@2634.6]
  wire  _T_324; // @[CSR.scala 132:14:@2639.6]
  wire  _T_326; // @[CSR.scala 132:14:@2644.6]
  wire  _T_328; // @[CSR.scala 132:14:@2649.6]
  wire  _T_330; // @[CSR.scala 132:14:@2654.6]
  wire  _T_332; // @[CSR.scala 132:14:@2659.6]
  wire  _T_334; // @[CSR.scala 132:14:@2664.6]
  wire  _T_336; // @[CSR.scala 132:14:@2669.6]
  wire  _T_338; // @[CSR.scala 132:14:@2674.6]
  wire  _T_340; // @[CSR.scala 132:14:@2679.6]
  wire  _T_342; // @[CSR.scala 132:14:@2684.6]
  wire  _T_344; // @[CSR.scala 132:14:@2689.6]
  wire  _T_347; // @[CSR.scala 132:14:@2694.6]
  wire  _T_350; // @[CSR.scala 136:33:@2699.6]
  wire  _T_356; // @[CSR.scala 137:50:@2704.8]
  wire  _T_357; // @[CSR.scala 137:50:@2706.8]
  wire  _T_358; // @[CSR.scala 137:50:@2708.8]
  wire  _T_359; // @[CSR.scala 137:50:@2710.8]
  wire  _T_360; // @[CSR.scala 137:50:@2712.8]
  wire  _T_361; // @[CSR.scala 137:50:@2714.8]
  wire  _T_362; // @[CSR.scala 137:50:@2716.8]
  wire  _T_363; // @[CSR.scala 137:50:@2718.8]
  wire  _T_364; // @[CSR.scala 137:50:@2720.8]
  wire [1:0] _T_365; // @[CSR.scala 137:50:@2722.8]
  wire [1:0] _T_366; // @[CSR.scala 137:50:@2724.8]
  wire [1:0] _T_367; // @[CSR.scala 137:50:@2726.8]
  wire [1:0] _T_368; // @[CSR.scala 137:50:@2728.8]
  wire  _T_369; // @[CSR.scala 137:50:@2730.8]
  wire  _T_370; // @[CSR.scala 137:50:@2732.8]
  wire  _T_371; // @[CSR.scala 137:50:@2734.8]
  wire  _T_372; // @[CSR.scala 137:50:@2736.8]
  wire  _T_373; // @[CSR.scala 137:50:@2738.8]
  wire [8:0] _T_374; // @[CSR.scala 137:50:@2740.8]
  wire  _T_375; // @[CSR.scala 137:50:@2742.8]
  wire [1:0] _T_376; // @[CSR.scala 137:50:@2744.8]
  wire [1:0] _T_377; // @[CSR.scala 137:50:@2746.8]
  wire [26:0] _T_378; // @[CSR.scala 137:50:@2748.8]
  wire  _T_379; // @[CSR.scala 137:50:@2750.8]
  wire  _GEN_185; // @[CSR.scala 136:51:@2700.6]
  wire  _GEN_186; // @[CSR.scala 136:51:@2700.6]
  wire  _GEN_187; // @[CSR.scala 136:51:@2700.6]
  wire  _GEN_188; // @[CSR.scala 136:51:@2700.6]
  wire  _GEN_189; // @[CSR.scala 136:51:@2700.6]
  wire  _GEN_190; // @[CSR.scala 136:51:@2700.6]
  wire  _GEN_191; // @[CSR.scala 136:51:@2700.6]
  wire  _GEN_192; // @[CSR.scala 136:51:@2700.6]
  wire  _GEN_193; // @[CSR.scala 136:51:@2700.6]
  wire [1:0] _GEN_194; // @[CSR.scala 136:51:@2700.6]
  wire [1:0] _GEN_195; // @[CSR.scala 136:51:@2700.6]
  wire [1:0] _GEN_196; // @[CSR.scala 136:51:@2700.6]
  wire [1:0] _GEN_197; // @[CSR.scala 136:51:@2700.6]
  wire  _GEN_198; // @[CSR.scala 136:51:@2700.6]
  wire  _GEN_199; // @[CSR.scala 136:51:@2700.6]
  wire  _GEN_200; // @[CSR.scala 136:51:@2700.6]
  wire  _GEN_201; // @[CSR.scala 136:51:@2700.6]
  wire  _GEN_202; // @[CSR.scala 136:51:@2700.6]
  wire [8:0] _GEN_203; // @[CSR.scala 136:51:@2700.6]
  wire  _GEN_204; // @[CSR.scala 136:51:@2700.6]
  wire [1:0] _GEN_205; // @[CSR.scala 136:51:@2700.6]
  wire [1:0] _GEN_206; // @[CSR.scala 136:51:@2700.6]
  wire [26:0] _GEN_207; // @[CSR.scala 136:51:@2700.6]
  wire  _GEN_208; // @[CSR.scala 136:51:@2700.6]
  wire  _T_380; // @[CSR.scala 139:33:@2777.6]
  wire  _GEN_209; // @[CSR.scala 139:51:@2778.6]
  wire  _GEN_210; // @[CSR.scala 139:51:@2778.6]
  wire  _GEN_211; // @[CSR.scala 139:51:@2778.6]
  wire  _GEN_212; // @[CSR.scala 139:51:@2778.6]
  wire  _GEN_213; // @[CSR.scala 139:51:@2778.6]
  wire  _GEN_214; // @[CSR.scala 139:51:@2778.6]
  wire  _GEN_215; // @[CSR.scala 139:51:@2778.6]
  wire  _GEN_216; // @[CSR.scala 139:51:@2778.6]
  wire  _GEN_217; // @[CSR.scala 139:51:@2778.6]
  wire [1:0] _GEN_218; // @[CSR.scala 139:51:@2778.6]
  wire [1:0] _GEN_219; // @[CSR.scala 139:51:@2778.6]
  wire [1:0] _GEN_220; // @[CSR.scala 139:51:@2778.6]
  wire [1:0] _GEN_221; // @[CSR.scala 139:51:@2778.6]
  wire  _GEN_222; // @[CSR.scala 139:51:@2778.6]
  wire  _GEN_223; // @[CSR.scala 139:51:@2778.6]
  wire  _GEN_224; // @[CSR.scala 139:51:@2778.6]
  wire  _GEN_225; // @[CSR.scala 139:51:@2778.6]
  wire  _GEN_226; // @[CSR.scala 139:51:@2778.6]
  wire [8:0] _GEN_227; // @[CSR.scala 139:51:@2778.6]
  wire  _GEN_228; // @[CSR.scala 139:51:@2778.6]
  wire [1:0] _GEN_229; // @[CSR.scala 139:51:@2778.6]
  wire [1:0] _GEN_230; // @[CSR.scala 139:51:@2778.6]
  wire [26:0] _GEN_231; // @[CSR.scala 139:51:@2778.6]
  wire  _GEN_232; // @[CSR.scala 139:51:@2778.6]
  wire  _T_410; // @[CSR.scala 142:32:@2855.6]
  wire  _T_412; // @[CSR.scala 145:33:@2860.6]
  wire  _GEN_428; // @[CSR.scala 130:30:@2513.4]
  wire  _GEN_429; // @[CSR.scala 130:30:@2513.4]
  wire  _GEN_430; // @[CSR.scala 130:30:@2513.4]
  wire  _GEN_431; // @[CSR.scala 130:30:@2513.4]
  wire  _GEN_432; // @[CSR.scala 130:30:@2513.4]
  wire  _GEN_433; // @[CSR.scala 130:30:@2513.4]
  wire  _GEN_434; // @[CSR.scala 130:30:@2513.4]
  wire  _GEN_435; // @[CSR.scala 130:30:@2513.4]
  wire  _GEN_436; // @[CSR.scala 130:30:@2513.4]
  wire [1:0] _GEN_437; // @[CSR.scala 130:30:@2513.4]
  wire [1:0] _GEN_438; // @[CSR.scala 130:30:@2513.4]
  wire [1:0] _GEN_439; // @[CSR.scala 130:30:@2513.4]
  wire [1:0] _GEN_440; // @[CSR.scala 130:30:@2513.4]
  wire  _GEN_441; // @[CSR.scala 130:30:@2513.4]
  wire  _GEN_442; // @[CSR.scala 130:30:@2513.4]
  wire  _GEN_443; // @[CSR.scala 130:30:@2513.4]
  wire  _GEN_444; // @[CSR.scala 130:30:@2513.4]
  wire  _GEN_445; // @[CSR.scala 130:30:@2513.4]
  wire [8:0] _GEN_446; // @[CSR.scala 130:30:@2513.4]
  wire  _GEN_447; // @[CSR.scala 130:30:@2513.4]
  wire [1:0] _GEN_448; // @[CSR.scala 130:30:@2513.4]
  wire [1:0] _GEN_449; // @[CSR.scala 130:30:@2513.4]
  wire [26:0] _GEN_450; // @[CSR.scala 130:30:@2513.4]
  wire  _GEN_451; // @[CSR.scala 130:30:@2513.4]
  wire  _T_415; // @[Mux.scala 46:19:@2885.4]
  wire  _T_416; // @[Mux.scala 46:16:@2886.4]
  wire  _T_417; // @[Mux.scala 46:19:@2887.4]
  wire  _T_418; // @[Mux.scala 46:16:@2888.4]
  wire  _T_419; // @[Mux.scala 46:19:@2889.4]
  wire  ie; // @[Mux.scala 46:16:@2890.4]
  wire  time_inter; // @[CSR.scala 177:27:@2891.4]
  wire  _T_422; // @[CSR.scala 181:10:@2893.4]
  wire  _T_425; // @[CSR.scala 183:10:@2895.4]
  wire  _T_427; // @[CSR.scala 184:10:@2897.4]
  wire  _T_430; // @[CSR.scala 186:22:@2900.4]
  wire  _T_433; // @[CSR.scala 188:22:@2902.4]
  wire  _T_435; // @[CSR.scala 189:22:@2904.4]
  wire [3:0] _T_436; // @[CSR.scala 190:8:@2905.4]
  wire [7:0] _T_440; // @[Cat.scala 30:58:@2909.4]
  wire [63:0] ipie; // @[CSR.scala 193:20:@2916.4]
  wire [63:0] _T_446; // @[CSR.scala 194:25:@2917.4]
  wire [63:0] ipie_m; // @[CSR.scala 194:23:@2918.4]
  wire [63:0] ipie_s; // @[CSR.scala 195:23:@2919.4]
  wire  _T_447; // @[CSR.scala 198:14:@2920.4]
  wire  _T_449; // @[CSR.scala 199:14:@2921.4]
  wire  _T_451; // @[CSR.scala 200:14:@2922.4]
  wire  _T_453; // @[CSR.scala 202:14:@2923.4]
  wire  _T_455; // @[CSR.scala 203:14:@2924.4]
  wire  _T_457; // @[CSR.scala 204:14:@2925.4]
  wire  _T_459; // @[CSR.scala 206:14:@2926.4]
  wire  _T_461; // @[CSR.scala 207:14:@2927.4]
  wire  _T_463; // @[CSR.scala 208:14:@2928.4]
  wire  _T_465; // @[CSR.scala 210:14:@2929.4]
  wire  _T_467; // @[CSR.scala 211:14:@2930.4]
  wire  _T_469; // @[CSR.scala 212:14:@2931.4]
  wire  _T_471; // @[CSR.scala 214:14:@2932.4]
  wire  _T_473; // @[CSR.scala 215:14:@2933.4]
  wire  _T_475; // @[CSR.scala 216:14:@2934.4]
  wire  _T_477; // @[CSR.scala 218:14:@2935.4]
  wire  _T_479; // @[CSR.scala 219:14:@2936.4]
  wire [1:0] _T_487; // @[Mux.scala 31:69:@2940.4]
  wire [2:0] _T_488; // @[Mux.scala 31:69:@2941.4]
  wire [2:0] _T_489; // @[Mux.scala 31:69:@2942.4]
  wire [2:0] _T_490; // @[Mux.scala 31:69:@2943.4]
  wire [3:0] _T_491; // @[Mux.scala 31:69:@2944.4]
  wire [3:0] _T_492; // @[Mux.scala 31:69:@2945.4]
  wire [3:0] _T_493; // @[Mux.scala 31:69:@2946.4]
  wire [3:0] _T_494; // @[Mux.scala 31:69:@2947.4]
  wire [3:0] _T_495; // @[Mux.scala 31:69:@2948.4]
  wire [3:0] _T_496; // @[Mux.scala 31:69:@2949.4]
  wire [3:0] _T_497; // @[Mux.scala 31:69:@2950.4]
  wire [3:0] _T_498; // @[Mux.scala 31:69:@2951.4]
  wire [3:0] _T_499; // @[Mux.scala 31:69:@2952.4]
  wire [3:0] _T_500; // @[Mux.scala 31:69:@2953.4]
  wire [3:0] _T_501; // @[Mux.scala 31:69:@2954.4]
  wire [3:0] ic; // @[Mux.scala 31:69:@2955.4]
  wire [63:0] _T_502; // @[CSR.scala 225:38:@2956.4]
  wire  _T_503; // @[CSR.scala 225:38:@2957.4]
  wire [1:0] inter_new_mode; // @[CSR.scala 225:29:@2958.4]
  wire  _T_504; // @[CSR.scala 226:42:@2959.4]
  wire  _T_505; // @[CSR.scala 226:69:@2960.4]
  wire  _T_506; // @[CSR.scala 226:78:@2961.4]
  wire  inter_enable; // @[CSR.scala 226:49:@2962.4]
  wire  _T_508; // @[CSR.scala 228:44:@2963.4]
  wire [63:0] _GEN_818; // @[CSR.scala 229:47:@2967.4]
  wire  have_excep; // @[CSR.scala 240:41:@2971.4]
  wire [61:0] _T_514; // @[Const.scala 68:33:@2975.6]
  wire  _T_517; // @[Const.scala 68:40:@2976.6]
  wire [1:0] _T_518; // @[Const.scala 69:32:@2978.8]
  wire  _T_519; // @[Conditional.scala 37:30:@2979.8]
  wire  _T_521; // @[Conditional.scala 37:30:@2988.10]
  wire  _T_524; // @[Conditional.scala 37:30:@2997.12]
  wire  _GEN_462; // @[Conditional.scala 39:67:@2998.12]
  wire  _GEN_463; // @[Conditional.scala 39:67:@2998.12]
  wire [1:0] _GEN_464; // @[Conditional.scala 39:67:@2998.12]
  wire [63:0] _GEN_465; // @[Conditional.scala 39:67:@2998.12]
  wire  _GEN_466; // @[Conditional.scala 39:67:@2989.10]
  wire  _GEN_467; // @[Conditional.scala 39:67:@2989.10]
  wire  _GEN_468; // @[Conditional.scala 39:67:@2989.10]
  wire [1:0] _GEN_469; // @[Conditional.scala 39:67:@2989.10]
  wire [63:0] _GEN_470; // @[Conditional.scala 39:67:@2989.10]
  wire  _GEN_471; // @[Conditional.scala 39:67:@2989.10]
  wire  _GEN_472; // @[Conditional.scala 39:67:@2989.10]
  wire  _GEN_473; // @[Conditional.scala 40:58:@2980.8]
  wire  _GEN_474; // @[Conditional.scala 40:58:@2980.8]
  wire [1:0] _GEN_475; // @[Conditional.scala 40:58:@2980.8]
  wire [1:0] _GEN_476; // @[Conditional.scala 40:58:@2980.8]
  wire [63:0] _GEN_477; // @[Conditional.scala 40:58:@2980.8]
  wire  _GEN_478; // @[Conditional.scala 40:58:@2980.8]
  wire  _GEN_479; // @[Conditional.scala 40:58:@2980.8]
  wire  _GEN_480; // @[Conditional.scala 40:58:@2980.8]
  wire  _GEN_481; // @[Conditional.scala 40:58:@2980.8]
  wire  _GEN_482; // @[Conditional.scala 40:58:@2980.8]
  wire  _T_526; // @[CSR.scala 270:31:@3006.8]
  wire  _T_527; // @[CSR.scala 270:67:@3007.8]
  wire  _T_528; // @[CSR.scala 270:51:@3008.8]
  wire [64:0] _T_530; // @[CSR.scala 271:42:@3010.10]
  wire [63:0] _T_531; // @[CSR.scala 271:42:@3011.10]
  wire  _T_532; // @[CSR.scala 276:18:@3015.10]
  wire  _T_534; // @[CSR.scala 276:12:@3016.10]
  wire [4:0] _T_535; // @[CSR.scala 276:40:@3017.10]
  wire [63:0] _T_536; // @[CSR.scala 276:34:@3018.10]
  wire  _T_537; // @[CSR.scala 276:34:@3019.10]
  wire  _T_539; // @[CSR.scala 276:26:@3020.10]
  wire  _T_540; // @[CSR.scala 276:23:@3021.10]
  wire [63:0] _T_543; // @[CSR.scala 277:34:@3024.10]
  wire  _T_544; // @[CSR.scala 277:34:@3025.10]
  wire  _T_546; // @[CSR.scala 277:26:@3026.10]
  wire  _T_547; // @[CSR.scala 277:23:@3027.10]
  wire [63:0] _T_552; // @[CSR.scala 278:34:@3031.10]
  wire  _T_553; // @[CSR.scala 278:34:@3032.10]
  wire  _T_555; // @[CSR.scala 278:26:@3033.10]
  wire  _T_556; // @[CSR.scala 278:23:@3034.10]
  wire [63:0] _T_559; // @[CSR.scala 279:34:@3037.10]
  wire  _T_560; // @[CSR.scala 279:34:@3038.10]
  wire  _T_562; // @[CSR.scala 279:26:@3039.10]
  wire  _T_563; // @[CSR.scala 279:23:@3040.10]
  wire [1:0] _T_565; // @[Mux.scala 31:69:@3041.10]
  wire [1:0] _T_566; // @[Mux.scala 31:69:@3042.10]
  wire [1:0] _T_567; // @[Mux.scala 31:69:@3043.10]
  wire [1:0] _T_568; // @[Mux.scala 31:69:@3044.10]
  wire [1:0] _GEN_523; // @[CSR.scala 270:88:@3009.8]
  wire [1:0] _GEN_547; // @[CSR.scala 247:32:@2977.6]
  wire [1:0] nextPrv; // @[CSR.scala 246:22:@2974.4]
  wire  _T_569; // @[Conditional.scala 37:30:@3046.10]
  wire  _T_571; // @[Conditional.scala 37:30:@3056.12]
  wire  _T_573; // @[Conditional.scala 37:30:@3066.14]
  wire  _GEN_483; // @[Conditional.scala 39:67:@3067.14]
  wire  _GEN_484; // @[Conditional.scala 39:67:@3067.14]
  wire  _GEN_489; // @[Conditional.scala 39:67:@3057.12]
  wire  _GEN_490; // @[Conditional.scala 39:67:@3057.12]
  wire [1:0] _GEN_491; // @[Conditional.scala 39:67:@3057.12]
  wire  _GEN_496; // @[Conditional.scala 39:67:@3057.12]
  wire  _GEN_497; // @[Conditional.scala 39:67:@3057.12]
  wire  _GEN_499; // @[Conditional.scala 39:67:@3057.12]
  wire  _GEN_502; // @[Conditional.scala 40:58:@3047.10]
  wire  _GEN_503; // @[Conditional.scala 40:58:@3047.10]
  wire [1:0] _GEN_504; // @[Conditional.scala 40:58:@3047.10]
  wire  _GEN_509; // @[Conditional.scala 40:58:@3047.10]
  wire  _GEN_510; // @[Conditional.scala 40:58:@3047.10]
  wire [1:0] _GEN_511; // @[Conditional.scala 40:58:@3047.10]
  wire  _GEN_513; // @[Conditional.scala 40:58:@3047.10]
  wire  _GEN_516; // @[Conditional.scala 40:58:@3047.10]
  wire  _GEN_517; // @[Conditional.scala 40:58:@3047.10]
  wire  _GEN_519; // @[Conditional.scala 40:58:@3047.10]
  wire [63:0] _T_577; // @[Mux.scala 46:16:@3075.10]
  wire [63:0] _T_579; // @[Mux.scala 46:16:@3077.10]
  wire [63:0] _T_581; // @[Mux.scala 46:16:@3079.10]
  wire [61:0] _T_582; // @[CSR.scala 313:29:@3080.10]
  wire [63:0] _T_584; // @[Cat.scala 30:58:@3081.10]
  wire [1:0] _T_585; // @[CSR.scala 314:33:@3082.10]
  wire  _T_587; // @[CSR.scala 314:39:@3083.10]
  wire [66:0] _T_589; // @[CSR.scala 316:22:@3084.10]
  wire [66:0] _GEN_819; // @[CSR.scala 316:16:@3085.10]
  wire [67:0] _T_590; // @[CSR.scala 316:16:@3085.10]
  wire [66:0] _T_591; // @[CSR.scala 316:16:@3086.10]
  wire [66:0] _T_592; // @[CSR.scala 314:27:@3087.10]
  wire [66:0] _GEN_522; // @[CSR.scala 270:88:@3009.8]
  wire  _GEN_524; // @[CSR.scala 270:88:@3009.8]
  wire  _GEN_525; // @[CSR.scala 270:88:@3009.8]
  wire [1:0] _GEN_526; // @[CSR.scala 270:88:@3009.8]
  wire  _GEN_528; // @[CSR.scala 270:88:@3009.8]
  wire  _GEN_531; // @[CSR.scala 270:88:@3009.8]
  wire  _GEN_532; // @[CSR.scala 270:88:@3009.8]
  wire [1:0] _GEN_533; // @[CSR.scala 270:88:@3009.8]
  wire  _GEN_535; // @[CSR.scala 270:88:@3009.8]
  wire  _GEN_538; // @[CSR.scala 270:88:@3009.8]
  wire  _GEN_539; // @[CSR.scala 270:88:@3009.8]
  wire  _GEN_541; // @[CSR.scala 270:88:@3009.8]
  wire  _GEN_544; // @[CSR.scala 247:32:@2977.6]
  wire  _GEN_545; // @[CSR.scala 247:32:@2977.6]
  wire [1:0] _GEN_546; // @[CSR.scala 247:32:@2977.6]
  wire [66:0] _GEN_548; // @[CSR.scala 247:32:@2977.6]
  wire  _GEN_549; // @[CSR.scala 247:32:@2977.6]
  wire  _GEN_550; // @[CSR.scala 247:32:@2977.6]
  wire [1:0] _GEN_551; // @[CSR.scala 247:32:@2977.6]
  wire  _GEN_552; // @[CSR.scala 247:32:@2977.6]
  wire  _GEN_553; // @[CSR.scala 247:32:@2977.6]
  wire  _GEN_555; // @[CSR.scala 247:32:@2977.6]
  wire  _GEN_559; // @[CSR.scala 247:32:@2977.6]
  wire  _GEN_563; // @[CSR.scala 247:32:@2977.6]
  wire  _GEN_566; // @[CSR.scala 246:22:@2974.4]
  wire  _GEN_567; // @[CSR.scala 246:22:@2974.4]
  wire [1:0] _GEN_568; // @[CSR.scala 246:22:@2974.4]
  wire [66:0] _GEN_570; // @[CSR.scala 246:22:@2974.4]
  wire  _GEN_571; // @[CSR.scala 246:22:@2974.4]
  wire  _GEN_572; // @[CSR.scala 246:22:@2974.4]
  wire [1:0] _GEN_573; // @[CSR.scala 246:22:@2974.4]
  wire  _GEN_574; // @[CSR.scala 246:22:@2974.4]
  wire  _GEN_575; // @[CSR.scala 246:22:@2974.4]
  assign csr__T_156_addr = io_id_addr[9:0];
  assign csr__T_156_data = csr[csr__T_156_addr]; // @[CSR.scala 25:16:@2377.4]
  assign csr__T_245_addr = 10'h304;
  assign csr__T_245_data = csr[csr__T_245_addr]; // @[CSR.scala 25:16:@2377.4]
  assign csr__T_246_addr = 10'h344;
  assign csr__T_246_data = csr[csr__T_246_addr]; // @[CSR.scala 25:16:@2377.4]
  assign csr__T_269_addr = 10'h180;
  assign csr__T_269_data = csr[csr__T_269_addr]; // @[CSR.scala 25:16:@2377.4]
  assign csr_mtvec_addr = 10'h305;
  assign csr_mtvec_data = csr[csr_mtvec_addr]; // @[CSR.scala 25:16:@2377.4]
  assign csr_stvec_addr = 10'h105;
  assign csr_stvec_data = csr[csr_stvec_addr]; // @[CSR.scala 25:16:@2377.4]
  assign csr_utvec_addr = 10'h5;
  assign csr_utvec_data = csr[csr_utvec_addr]; // @[CSR.scala 25:16:@2377.4]
  assign csr_medeleg_addr = 10'h302;
  assign csr_medeleg_data = csr[csr_medeleg_addr]; // @[CSR.scala 25:16:@2377.4]
  assign csr_mideleg_addr = 10'h303;
  assign csr_mideleg_data = csr[csr_mideleg_addr]; // @[CSR.scala 25:16:@2377.4]
  assign csr_sedeleg_addr = 10'h102;
  assign csr_sedeleg_data = csr[csr_sedeleg_addr]; // @[CSR.scala 25:16:@2377.4]
  assign csr_sideleg_addr = 10'h103;
  assign csr_sideleg_data = csr[csr_sideleg_addr]; // @[CSR.scala 25:16:@2377.4]
  assign csr_mie_addr = 10'h304;
  assign csr_mie_data = csr[csr_mie_addr]; // @[CSR.scala 25:16:@2377.4]
  assign csr_mip_addr = 10'h344;
  assign csr_mip_data = csr[csr_mip_addr]; // @[CSR.scala 25:16:@2377.4]
  assign csr_mtimecmp_addr = 10'h321;
  assign csr_mtimecmp_data = csr[csr_mtimecmp_addr]; // @[CSR.scala 25:16:@2377.4]
  assign csr_mepc_r_0_addr = 10'h341;
  assign csr_mepc_r_0_data = csr[csr_mepc_r_0_addr]; // @[CSR.scala 25:16:@2377.4]
  assign csr_sepc_r_0_addr = 10'h141;
  assign csr_sepc_r_0_data = csr[csr_sepc_r_0_addr]; // @[CSR.scala 25:16:@2377.4]
  assign csr_uepc_r_0_addr = 10'h41;
  assign csr_uepc_r_0_data = csr[csr_uepc_r_0_addr]; // @[CSR.scala 25:16:@2377.4]
  assign csr__T_272_data = io_mem_wrCSROp_csr_data;
  assign csr__T_272_addr = 10'h311;
  assign csr__T_272_mask = 1'h1;
  assign csr__T_272_en = io_mem_wrCSROp_valid ? _T_270 : 1'h0;
  assign csr__T_275_data = io_mem_wrCSROp_csr_data;
  assign csr__T_275_addr = 10'h312;
  assign csr__T_275_mask = 1'h1;
  assign csr__T_275_en = io_mem_wrCSROp_valid ? _T_273 : 1'h0;
  assign csr__T_278_data = io_mem_wrCSROp_csr_data;
  assign csr__T_278_addr = 10'h313;
  assign csr__T_278_mask = 1'h1;
  assign csr__T_278_en = io_mem_wrCSROp_valid ? _T_276 : 1'h0;
  assign csr__T_281_data = io_mem_wrCSROp_csr_data;
  assign csr__T_281_addr = 10'h314;
  assign csr__T_281_mask = 1'h1;
  assign csr__T_281_en = io_mem_wrCSROp_valid ? _T_279 : 1'h0;
  assign csr__T_283_data = io_mem_wrCSROp_csr_data;
  assign csr__T_283_addr = 10'h300;
  assign csr__T_283_mask = 1'h1;
  assign csr__T_283_en = io_mem_wrCSROp_valid ? _T_282 : 1'h0;
  assign csr__T_285_data = io_mem_wrCSROp_csr_data;
  assign csr__T_285_addr = 10'h301;
  assign csr__T_285_mask = 1'h1;
  assign csr__T_285_en = io_mem_wrCSROp_valid ? _T_284 : 1'h0;
  assign csr__T_287_data = io_mem_wrCSROp_csr_data;
  assign csr__T_287_addr = 10'h302;
  assign csr__T_287_mask = 1'h1;
  assign csr__T_287_en = io_mem_wrCSROp_valid ? _T_286 : 1'h0;
  assign csr__T_289_data = io_mem_wrCSROp_csr_data;
  assign csr__T_289_addr = 10'h303;
  assign csr__T_289_mask = 1'h1;
  assign csr__T_289_en = io_mem_wrCSROp_valid ? _T_288 : 1'h0;
  assign csr__T_291_data = io_mem_wrCSROp_csr_data;
  assign csr__T_291_addr = 10'h304;
  assign csr__T_291_mask = 1'h1;
  assign csr__T_291_en = io_mem_wrCSROp_valid ? _T_290 : 1'h0;
  assign csr__T_293_data = io_mem_wrCSROp_csr_data;
  assign csr__T_293_addr = 10'h305;
  assign csr__T_293_mask = 1'h1;
  assign csr__T_293_en = io_mem_wrCSROp_valid ? _T_292 : 1'h0;
  assign csr__T_295_data = io_mem_wrCSROp_csr_data;
  assign csr__T_295_addr = 10'h306;
  assign csr__T_295_mask = 1'h1;
  assign csr__T_295_en = io_mem_wrCSROp_valid ? _T_294 : 1'h0;
  assign csr__T_297_data = io_mem_wrCSROp_csr_data;
  assign csr__T_297_addr = 10'h340;
  assign csr__T_297_mask = 1'h1;
  assign csr__T_297_en = io_mem_wrCSROp_valid ? _T_296 : 1'h0;
  assign csr__T_299_data = io_mem_wrCSROp_csr_data;
  assign csr__T_299_addr = 10'h341;
  assign csr__T_299_mask = 1'h1;
  assign csr__T_299_en = io_mem_wrCSROp_valid ? _T_298 : 1'h0;
  assign csr__T_301_data = io_mem_wrCSROp_csr_data;
  assign csr__T_301_addr = 10'h342;
  assign csr__T_301_mask = 1'h1;
  assign csr__T_301_en = io_mem_wrCSROp_valid ? _T_300 : 1'h0;
  assign csr__T_303_data = io_mem_wrCSROp_csr_data;
  assign csr__T_303_addr = 10'h343;
  assign csr__T_303_mask = 1'h1;
  assign csr__T_303_en = io_mem_wrCSROp_valid ? _T_302 : 1'h0;
  assign csr__T_305_data = io_mem_wrCSROp_csr_data;
  assign csr__T_305_addr = 10'h344;
  assign csr__T_305_mask = 1'h1;
  assign csr__T_305_en = io_mem_wrCSROp_valid ? _T_304 : 1'h0;
  assign csr__T_307_data = io_mem_wrCSROp_csr_data;
  assign csr__T_307_addr = 10'h100;
  assign csr__T_307_mask = 1'h1;
  assign csr__T_307_en = io_mem_wrCSROp_valid ? _T_306 : 1'h0;
  assign csr__T_309_data = io_mem_wrCSROp_csr_data;
  assign csr__T_309_addr = 10'h102;
  assign csr__T_309_mask = 1'h1;
  assign csr__T_309_en = io_mem_wrCSROp_valid ? _T_308 : 1'h0;
  assign csr__T_311_data = io_mem_wrCSROp_csr_data;
  assign csr__T_311_addr = 10'h103;
  assign csr__T_311_mask = 1'h1;
  assign csr__T_311_en = io_mem_wrCSROp_valid ? _T_310 : 1'h0;
  assign csr__T_313_data = io_mem_wrCSROp_csr_data;
  assign csr__T_313_addr = 10'h104;
  assign csr__T_313_mask = 1'h1;
  assign csr__T_313_en = io_mem_wrCSROp_valid ? _T_312 : 1'h0;
  assign csr__T_315_data = io_mem_wrCSROp_csr_data;
  assign csr__T_315_addr = 10'h105;
  assign csr__T_315_mask = 1'h1;
  assign csr__T_315_en = io_mem_wrCSROp_valid ? _T_314 : 1'h0;
  assign csr__T_317_data = io_mem_wrCSROp_csr_data;
  assign csr__T_317_addr = 10'h106;
  assign csr__T_317_mask = 1'h1;
  assign csr__T_317_en = io_mem_wrCSROp_valid ? _T_316 : 1'h0;
  assign csr__T_319_data = io_mem_wrCSROp_csr_data;
  assign csr__T_319_addr = 10'h140;
  assign csr__T_319_mask = 1'h1;
  assign csr__T_319_en = io_mem_wrCSROp_valid ? _T_318 : 1'h0;
  assign csr__T_321_data = io_mem_wrCSROp_csr_data;
  assign csr__T_321_addr = 10'h141;
  assign csr__T_321_mask = 1'h1;
  assign csr__T_321_en = io_mem_wrCSROp_valid ? _T_320 : 1'h0;
  assign csr__T_323_data = io_mem_wrCSROp_csr_data;
  assign csr__T_323_addr = 10'h142;
  assign csr__T_323_mask = 1'h1;
  assign csr__T_323_en = io_mem_wrCSROp_valid ? _T_322 : 1'h0;
  assign csr__T_325_data = io_mem_wrCSROp_csr_data;
  assign csr__T_325_addr = 10'h143;
  assign csr__T_325_mask = 1'h1;
  assign csr__T_325_en = io_mem_wrCSROp_valid ? _T_324 : 1'h0;
  assign csr__T_327_data = io_mem_wrCSROp_csr_data;
  assign csr__T_327_addr = 10'h144;
  assign csr__T_327_mask = 1'h1;
  assign csr__T_327_en = io_mem_wrCSROp_valid ? _T_326 : 1'h0;
  assign csr__T_329_data = io_mem_wrCSROp_csr_data;
  assign csr__T_329_addr = 10'h180;
  assign csr__T_329_mask = 1'h1;
  assign csr__T_329_en = io_mem_wrCSROp_valid ? _T_328 : 1'h0;
  assign csr__T_331_data = io_mem_wrCSROp_csr_data;
  assign csr__T_331_addr = 10'h5;
  assign csr__T_331_mask = 1'h1;
  assign csr__T_331_en = io_mem_wrCSROp_valid ? _T_330 : 1'h0;
  assign csr__T_333_data = io_mem_wrCSROp_csr_data;
  assign csr__T_333_addr = 10'h40;
  assign csr__T_333_mask = 1'h1;
  assign csr__T_333_en = io_mem_wrCSROp_valid ? _T_332 : 1'h0;
  assign csr__T_335_data = io_mem_wrCSROp_csr_data;
  assign csr__T_335_addr = 10'h41;
  assign csr__T_335_mask = 1'h1;
  assign csr__T_335_en = io_mem_wrCSROp_valid ? _T_334 : 1'h0;
  assign csr__T_337_data = io_mem_wrCSROp_csr_data;
  assign csr__T_337_addr = 10'h42;
  assign csr__T_337_mask = 1'h1;
  assign csr__T_337_en = io_mem_wrCSROp_valid ? _T_336 : 1'h0;
  assign csr__T_339_data = io_mem_wrCSROp_csr_data;
  assign csr__T_339_addr = 10'h43;
  assign csr__T_339_mask = 1'h1;
  assign csr__T_339_en = io_mem_wrCSROp_valid ? _T_338 : 1'h0;
  assign csr__T_341_data = io_mem_wrCSROp_csr_data;
  assign csr__T_341_addr = 10'h44;
  assign csr__T_341_mask = 1'h1;
  assign csr__T_341_en = io_mem_wrCSROp_valid ? _T_340 : 1'h0;
  assign csr__T_343_data = io_mem_wrCSROp_csr_data;
  assign csr__T_343_addr = 10'h321;
  assign csr__T_343_mask = 1'h1;
  assign csr__T_343_en = io_mem_wrCSROp_valid ? _T_342 : 1'h0;
  assign csr__T_346_data = io_mem_wrCSROp_csr_data;
  assign csr__T_346_addr = 10'h1;
  assign csr__T_346_mask = 1'h1;
  assign csr__T_346_en = io_mem_wrCSROp_valid ? _T_344 : 1'h0;
  assign csr__T_349_data = io_mem_wrCSROp_csr_data;
  assign csr__T_349_addr = 10'h0;
  assign csr__T_349_mask = 1'h1;
  assign csr__T_349_en = io_mem_wrCSROp_valid ? _T_347 : 1'h0;
  assign csr__T_411_data = io_mem_wrCSROp_csr_data;
  assign csr__T_411_addr = 10'h304;
  assign csr__T_411_mask = 1'h1;
  assign csr__T_411_en = io_mem_wrCSROp_valid ? _T_410 : 1'h0;
  assign csr__T_413_data = io_mem_wrCSROp_csr_data;
  assign csr__T_413_addr = 10'h344;
  assign csr__T_413_mask = 1'h1;
  assign csr__T_413_en = io_mem_wrCSROp_valid ? _T_412 : 1'h0;
  assign csr_mcause_data = io_mem_excep_code;
  assign csr_mcause_addr = 10'h342;
  assign csr_mcause_mask = have_excep ? _GEN_555 : 1'h0;
  assign csr_mcause_en = 1'h1;
  assign csr_scause_data = io_mem_excep_code;
  assign csr_scause_addr = 10'h142;
  assign csr_scause_mask = have_excep ? _GEN_559 : 1'h0;
  assign csr_scause_en = 1'h1;
  assign csr_ucause_data = io_mem_excep_code;
  assign csr_ucause_addr = 10'h42;
  assign csr_ucause_mask = have_excep ? _GEN_563 : 1'h0;
  assign csr_ucause_en = 1'h1;
  assign csr_mtval_data = io_mem_excep_value;
  assign csr_mtval_addr = 10'h343;
  assign csr_mtval_mask = have_excep ? _GEN_555 : 1'h0;
  assign csr_mtval_en = 1'h1;
  assign csr_stval_data = io_mem_excep_value;
  assign csr_stval_addr = 10'h143;
  assign csr_stval_mask = have_excep ? _GEN_559 : 1'h0;
  assign csr_stval_en = 1'h1;
  assign csr_utval_data = io_mem_excep_value;
  assign csr_utval_addr = 10'h43;
  assign csr_utval_mask = have_excep ? _GEN_563 : 1'h0;
  assign csr_utval_en = 1'h1;
  assign csr__T_420_data = {56'h0,_T_440};
  assign csr__T_420_addr = 10'h344;
  assign csr__T_420_mask = 1'h1;
  assign csr__T_420_en = 1'h1;
  assign csr_mepc_w_0_data = io_mem_excep_pc;
  assign csr_mepc_w_0_addr = 10'h341;
  assign csr_mepc_w_0_mask = have_excep ? _GEN_555 : 1'h0;
  assign csr_mepc_w_0_en = have_excep ? _GEN_555 : 1'h0;
  assign csr_sepc_w_0_data = io_mem_excep_pc;
  assign csr_sepc_w_0_addr = 10'h141;
  assign csr_sepc_w_0_mask = have_excep ? _GEN_559 : 1'h0;
  assign csr_sepc_w_0_en = have_excep ? _GEN_559 : 1'h0;
  assign csr_uepc_w_0_data = io_mem_excep_pc;
  assign csr_uepc_w_0_addr = 10'h41;
  assign csr_uepc_w_0_mask = have_excep ? _GEN_563 : 1'h0;
  assign csr_uepc_w_0_en = have_excep ? _GEN_563 : 1'h0;
  assign _T_153 = mtime + 64'h1; // @[CSR.scala 104:18:@2431.4]
  assign _T_154 = mtime + 64'h1; // @[CSR.scala 104:18:@2432.4]
  assign _T_203 = {mstatus_SPIE,mstatus_UPIE,mstatus_MIE,mstatus_old_HIE,mstatus_SIE,mstatus_UIE}; // @[CSR.scala 112:29:@2440.4]
  assign _T_209 = {mstatus_FS,mstatus_MPP,mstatus_old_HPP,mstatus_SPP,mstatus_MPIE,mstatus_old_HPIE,_T_203}; // @[CSR.scala 112:29:@2446.4]
  assign _T_214 = {mstatus_TW,mstatus_TVM,mstatus_MXR,mstatus_SUM,mstatus_MPriv,mstatus_XS}; // @[CSR.scala 112:29:@2451.4]
  assign _T_221 = {mstatus_SD,mstatus_zero1,mstatus_SXL,mstatus_UXL,mstatus_TSR,mstatus_zero2,_T_214,_T_209}; // @[CSR.scala 112:29:@2458.4]
  assign _T_247 = 12'hc00 == io_id_addr; // @[Mux.scala 46:19:@2484.4]
  assign _T_248 = _T_247 ? mtime : csr__T_156_data; // @[Mux.scala 46:16:@2485.4]
  assign _T_249 = 12'hc01 == io_id_addr; // @[Mux.scala 46:19:@2486.4]
  assign _T_250 = _T_249 ? mtime : _T_248; // @[Mux.scala 46:16:@2487.4]
  assign _T_251 = 12'h144 == io_id_addr; // @[Mux.scala 46:19:@2488.4]
  assign _T_252 = _T_251 ? csr__T_246_data : _T_250; // @[Mux.scala 46:16:@2489.4]
  assign _T_253 = 12'h104 == io_id_addr; // @[Mux.scala 46:19:@2490.4]
  assign _T_254 = _T_253 ? csr__T_245_data : _T_252; // @[Mux.scala 46:16:@2491.4]
  assign _T_255 = 12'h100 == io_id_addr; // @[Mux.scala 46:19:@2492.4]
  assign _T_256 = _T_255 ? _T_221 : _T_254; // @[Mux.scala 46:16:@2493.4]
  assign _T_257 = 12'h300 == io_id_addr; // @[Mux.scala 46:19:@2494.4]
  assign _T_258 = _T_257 ? _T_221 : _T_256; // @[Mux.scala 46:16:@2495.4]
  assign _T_259 = 12'h301 == io_id_addr; // @[Mux.scala 46:19:@2496.4]
  assign _T_260 = _T_259 ? 64'h0 : _T_258; // @[Mux.scala 46:16:@2497.4]
  assign _T_261 = 12'hf14 == io_id_addr; // @[Mux.scala 46:19:@2498.4]
  assign _T_262 = _T_261 ? 64'h0 : _T_260; // @[Mux.scala 46:16:@2499.4]
  assign _T_263 = 12'hf13 == io_id_addr; // @[Mux.scala 46:19:@2500.4]
  assign _T_264 = _T_263 ? 64'h91d : _T_262; // @[Mux.scala 46:16:@2501.4]
  assign _T_265 = 12'hf12 == io_id_addr; // @[Mux.scala 46:19:@2502.4]
  assign _T_266 = _T_265 ? 64'h8fffffff : _T_264; // @[Mux.scala 46:16:@2503.4]
  assign _T_267 = 12'hf11 == io_id_addr; // @[Mux.scala 46:19:@2504.4]
  assign _T_270 = 12'hf11 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2514.6]
  assign _T_273 = 12'hf12 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2519.6]
  assign _T_276 = 12'hf13 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2524.6]
  assign _T_279 = 12'hf14 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2529.6]
  assign _T_282 = 12'h300 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2534.6]
  assign _T_284 = 12'h301 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2539.6]
  assign _T_286 = 12'h302 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2544.6]
  assign _T_288 = 12'h303 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2549.6]
  assign _T_290 = 12'h304 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2554.6]
  assign _T_292 = 12'h305 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2559.6]
  assign _T_294 = 12'h306 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2564.6]
  assign _T_296 = 12'h340 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2569.6]
  assign _T_298 = 12'h341 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2574.6]
  assign _T_300 = 12'h342 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2579.6]
  assign _T_302 = 12'h343 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2584.6]
  assign _T_304 = 12'h344 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2589.6]
  assign _T_306 = 12'h100 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2594.6]
  assign _T_308 = 12'h102 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2599.6]
  assign _T_310 = 12'h103 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2604.6]
  assign _T_312 = 12'h104 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2609.6]
  assign _T_314 = 12'h105 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2614.6]
  assign _T_316 = 12'h106 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2619.6]
  assign _T_318 = 12'h140 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2624.6]
  assign _T_320 = 12'h141 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2629.6]
  assign _T_322 = 12'h142 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2634.6]
  assign _T_324 = 12'h143 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2639.6]
  assign _T_326 = 12'h144 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2644.6]
  assign _T_328 = 12'h180 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2649.6]
  assign _T_330 = 12'h5 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2654.6]
  assign _T_332 = 12'h40 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2659.6]
  assign _T_334 = 12'h41 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2664.6]
  assign _T_336 = 12'h42 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2669.6]
  assign _T_338 = 12'h43 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2674.6]
  assign _T_340 = 12'h44 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2679.6]
  assign _T_342 = 12'h321 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2684.6]
  assign _T_344 = 12'hc01 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2689.6]
  assign _T_347 = 12'hc00 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2694.6]
  assign _T_350 = io_mem_wrCSROp_csr_idx == 12'h300; // @[CSR.scala 136:33:@2699.6]
  assign _T_356 = io_mem_wrCSROp_csr_data[0]; // @[CSR.scala 137:50:@2704.8]
  assign _T_357 = io_mem_wrCSROp_csr_data[1]; // @[CSR.scala 137:50:@2706.8]
  assign _T_358 = io_mem_wrCSROp_csr_data[2]; // @[CSR.scala 137:50:@2708.8]
  assign _T_359 = io_mem_wrCSROp_csr_data[3]; // @[CSR.scala 137:50:@2710.8]
  assign _T_360 = io_mem_wrCSROp_csr_data[4]; // @[CSR.scala 137:50:@2712.8]
  assign _T_361 = io_mem_wrCSROp_csr_data[5]; // @[CSR.scala 137:50:@2714.8]
  assign _T_362 = io_mem_wrCSROp_csr_data[6]; // @[CSR.scala 137:50:@2716.8]
  assign _T_363 = io_mem_wrCSROp_csr_data[7]; // @[CSR.scala 137:50:@2718.8]
  assign _T_364 = io_mem_wrCSROp_csr_data[8]; // @[CSR.scala 137:50:@2720.8]
  assign _T_365 = io_mem_wrCSROp_csr_data[10:9]; // @[CSR.scala 137:50:@2722.8]
  assign _T_366 = io_mem_wrCSROp_csr_data[12:11]; // @[CSR.scala 137:50:@2724.8]
  assign _T_367 = io_mem_wrCSROp_csr_data[14:13]; // @[CSR.scala 137:50:@2726.8]
  assign _T_368 = io_mem_wrCSROp_csr_data[16:15]; // @[CSR.scala 137:50:@2728.8]
  assign _T_369 = io_mem_wrCSROp_csr_data[17]; // @[CSR.scala 137:50:@2730.8]
  assign _T_370 = io_mem_wrCSROp_csr_data[18]; // @[CSR.scala 137:50:@2732.8]
  assign _T_371 = io_mem_wrCSROp_csr_data[19]; // @[CSR.scala 137:50:@2734.8]
  assign _T_372 = io_mem_wrCSROp_csr_data[20]; // @[CSR.scala 137:50:@2736.8]
  assign _T_373 = io_mem_wrCSROp_csr_data[21]; // @[CSR.scala 137:50:@2738.8]
  assign _T_374 = io_mem_wrCSROp_csr_data[30:22]; // @[CSR.scala 137:50:@2740.8]
  assign _T_375 = io_mem_wrCSROp_csr_data[31]; // @[CSR.scala 137:50:@2742.8]
  assign _T_376 = io_mem_wrCSROp_csr_data[33:32]; // @[CSR.scala 137:50:@2744.8]
  assign _T_377 = io_mem_wrCSROp_csr_data[35:34]; // @[CSR.scala 137:50:@2746.8]
  assign _T_378 = io_mem_wrCSROp_csr_data[62:36]; // @[CSR.scala 137:50:@2748.8]
  assign _T_379 = io_mem_wrCSROp_csr_data[63]; // @[CSR.scala 137:50:@2750.8]
  assign _GEN_185 = _T_350 ? _T_356 : mstatus_UIE; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_186 = _T_350 ? _T_357 : mstatus_SIE; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_187 = _T_350 ? _T_358 : mstatus_old_HIE; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_188 = _T_350 ? _T_359 : mstatus_MIE; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_189 = _T_350 ? _T_360 : mstatus_UPIE; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_190 = _T_350 ? _T_361 : mstatus_SPIE; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_191 = _T_350 ? _T_362 : mstatus_old_HPIE; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_192 = _T_350 ? _T_363 : mstatus_MPIE; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_193 = _T_350 ? _T_364 : mstatus_SPP; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_194 = _T_350 ? _T_365 : mstatus_old_HPP; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_195 = _T_350 ? _T_366 : mstatus_MPP; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_196 = _T_350 ? _T_367 : mstatus_FS; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_197 = _T_350 ? _T_368 : mstatus_XS; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_198 = _T_350 ? _T_369 : mstatus_MPriv; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_199 = _T_350 ? _T_370 : mstatus_SUM; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_200 = _T_350 ? _T_371 : mstatus_MXR; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_201 = _T_350 ? _T_372 : mstatus_TVM; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_202 = _T_350 ? _T_373 : mstatus_TW; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_203 = _T_350 ? _T_374 : mstatus_zero2; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_204 = _T_350 ? _T_375 : mstatus_TSR; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_205 = _T_350 ? _T_376 : mstatus_UXL; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_206 = _T_350 ? _T_377 : mstatus_SXL; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_207 = _T_350 ? _T_378 : mstatus_zero1; // @[CSR.scala 136:51:@2700.6]
  assign _GEN_208 = _T_350 ? _T_379 : mstatus_SD; // @[CSR.scala 136:51:@2700.6]
  assign _T_380 = io_mem_wrCSROp_csr_idx == 12'h100; // @[CSR.scala 139:33:@2777.6]
  assign _GEN_209 = _T_380 ? _T_356 : _GEN_185; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_210 = _T_380 ? _T_357 : _GEN_186; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_211 = _T_380 ? _T_358 : _GEN_187; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_212 = _T_380 ? _T_359 : _GEN_188; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_213 = _T_380 ? _T_360 : _GEN_189; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_214 = _T_380 ? _T_361 : _GEN_190; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_215 = _T_380 ? _T_362 : _GEN_191; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_216 = _T_380 ? _T_363 : _GEN_192; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_217 = _T_380 ? _T_364 : _GEN_193; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_218 = _T_380 ? _T_365 : _GEN_194; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_219 = _T_380 ? _T_366 : _GEN_195; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_220 = _T_380 ? _T_367 : _GEN_196; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_221 = _T_380 ? _T_368 : _GEN_197; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_222 = _T_380 ? _T_369 : _GEN_198; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_223 = _T_380 ? _T_370 : _GEN_199; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_224 = _T_380 ? _T_371 : _GEN_200; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_225 = _T_380 ? _T_372 : _GEN_201; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_226 = _T_380 ? _T_373 : _GEN_202; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_227 = _T_380 ? _T_374 : _GEN_203; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_228 = _T_380 ? _T_375 : _GEN_204; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_229 = _T_380 ? _T_376 : _GEN_205; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_230 = _T_380 ? _T_377 : _GEN_206; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_231 = _T_380 ? _T_378 : _GEN_207; // @[CSR.scala 139:51:@2778.6]
  assign _GEN_232 = _T_380 ? _T_379 : _GEN_208; // @[CSR.scala 139:51:@2778.6]
  assign _T_410 = io_mem_wrCSROp_csr_idx == 12'h104; // @[CSR.scala 142:32:@2855.6]
  assign _T_412 = io_mem_wrCSROp_csr_idx == 12'h144; // @[CSR.scala 145:33:@2860.6]
  assign _GEN_428 = io_mem_wrCSROp_valid ? _GEN_209 : mstatus_UIE; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_429 = io_mem_wrCSROp_valid ? _GEN_210 : mstatus_SIE; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_430 = io_mem_wrCSROp_valid ? _GEN_211 : mstatus_old_HIE; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_431 = io_mem_wrCSROp_valid ? _GEN_212 : mstatus_MIE; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_432 = io_mem_wrCSROp_valid ? _GEN_213 : mstatus_UPIE; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_433 = io_mem_wrCSROp_valid ? _GEN_214 : mstatus_SPIE; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_434 = io_mem_wrCSROp_valid ? _GEN_215 : mstatus_old_HPIE; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_435 = io_mem_wrCSROp_valid ? _GEN_216 : mstatus_MPIE; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_436 = io_mem_wrCSROp_valid ? _GEN_217 : mstatus_SPP; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_437 = io_mem_wrCSROp_valid ? _GEN_218 : mstatus_old_HPP; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_438 = io_mem_wrCSROp_valid ? _GEN_219 : mstatus_MPP; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_439 = io_mem_wrCSROp_valid ? _GEN_220 : mstatus_FS; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_440 = io_mem_wrCSROp_valid ? _GEN_221 : mstatus_XS; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_441 = io_mem_wrCSROp_valid ? _GEN_222 : mstatus_MPriv; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_442 = io_mem_wrCSROp_valid ? _GEN_223 : mstatus_SUM; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_443 = io_mem_wrCSROp_valid ? _GEN_224 : mstatus_MXR; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_444 = io_mem_wrCSROp_valid ? _GEN_225 : mstatus_TVM; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_445 = io_mem_wrCSROp_valid ? _GEN_226 : mstatus_TW; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_446 = io_mem_wrCSROp_valid ? _GEN_227 : mstatus_zero2; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_447 = io_mem_wrCSROp_valid ? _GEN_228 : mstatus_TSR; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_448 = io_mem_wrCSROp_valid ? _GEN_229 : mstatus_UXL; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_449 = io_mem_wrCSROp_valid ? _GEN_230 : mstatus_SXL; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_450 = io_mem_wrCSROp_valid ? _GEN_231 : mstatus_zero1; // @[CSR.scala 130:30:@2513.4]
  assign _GEN_451 = io_mem_wrCSROp_valid ? _GEN_232 : mstatus_SD; // @[CSR.scala 130:30:@2513.4]
  assign _T_415 = 2'h0 == prv; // @[Mux.scala 46:19:@2885.4]
  assign _T_416 = _T_415 ? mstatus_UIE : 1'h0; // @[Mux.scala 46:16:@2886.4]
  assign _T_417 = 2'h1 == prv; // @[Mux.scala 46:19:@2887.4]
  assign _T_418 = _T_417 ? mstatus_SIE : _T_416; // @[Mux.scala 46:16:@2888.4]
  assign _T_419 = 2'h3 == prv; // @[Mux.scala 46:19:@2889.4]
  assign ie = _T_419 ? mstatus_MIE : _T_418; // @[Mux.scala 46:16:@2890.4]
  assign time_inter = mtime >= csr_mtimecmp_data; // @[CSR.scala 177:27:@2891.4]
  assign _T_422 = prv == 2'h3; // @[CSR.scala 181:10:@2893.4]
  assign _T_425 = prv == 2'h1; // @[CSR.scala 183:10:@2895.4]
  assign _T_427 = prv == 2'h0; // @[CSR.scala 184:10:@2897.4]
  assign _T_430 = _T_422 & time_inter; // @[CSR.scala 186:22:@2900.4]
  assign _T_433 = _T_425 & time_inter; // @[CSR.scala 188:22:@2902.4]
  assign _T_435 = _T_427 & time_inter; // @[CSR.scala 189:22:@2904.4]
  assign _T_436 = csr_mip_data[3:0]; // @[CSR.scala 190:8:@2905.4]
  assign _T_440 = {_T_430,1'h0,_T_433,_T_435,_T_436}; // @[Cat.scala 30:58:@2909.4]
  assign ipie = csr_mip_data & csr_mie_data; // @[CSR.scala 193:20:@2916.4]
  assign _T_446 = ~ csr_mideleg_data; // @[CSR.scala 194:25:@2917.4]
  assign ipie_m = ipie & _T_446; // @[CSR.scala 194:23:@2918.4]
  assign ipie_s = ipie & csr_mideleg_data; // @[CSR.scala 195:23:@2919.4]
  assign _T_447 = ipie_m[11]; // @[CSR.scala 198:14:@2920.4]
  assign _T_449 = ipie_m[9]; // @[CSR.scala 199:14:@2921.4]
  assign _T_451 = ipie_m[8]; // @[CSR.scala 200:14:@2922.4]
  assign _T_453 = ipie_m[7]; // @[CSR.scala 202:14:@2923.4]
  assign _T_455 = ipie_m[5]; // @[CSR.scala 203:14:@2924.4]
  assign _T_457 = ipie_m[4]; // @[CSR.scala 204:14:@2925.4]
  assign _T_459 = ipie_m[3]; // @[CSR.scala 206:14:@2926.4]
  assign _T_461 = ipie_m[1]; // @[CSR.scala 207:14:@2927.4]
  assign _T_463 = ipie_m[0]; // @[CSR.scala 208:14:@2928.4]
  assign _T_465 = ipie_s[11]; // @[CSR.scala 210:14:@2929.4]
  assign _T_467 = ipie_s[9]; // @[CSR.scala 211:14:@2930.4]
  assign _T_469 = ipie_s[8]; // @[CSR.scala 212:14:@2931.4]
  assign _T_471 = ipie_s[7]; // @[CSR.scala 214:14:@2932.4]
  assign _T_473 = ipie_s[5]; // @[CSR.scala 215:14:@2933.4]
  assign _T_475 = ipie_s[4]; // @[CSR.scala 216:14:@2934.4]
  assign _T_477 = ipie_s[3]; // @[CSR.scala 218:14:@2935.4]
  assign _T_479 = ipie_s[1]; // @[CSR.scala 219:14:@2936.4]
  assign _T_487 = _T_477 ? 2'h3 : {{1'd0}, _T_479}; // @[Mux.scala 31:69:@2940.4]
  assign _T_488 = _T_475 ? 3'h4 : {{1'd0}, _T_487}; // @[Mux.scala 31:69:@2941.4]
  assign _T_489 = _T_473 ? 3'h5 : _T_488; // @[Mux.scala 31:69:@2942.4]
  assign _T_490 = _T_471 ? 3'h7 : _T_489; // @[Mux.scala 31:69:@2943.4]
  assign _T_491 = _T_469 ? 4'h8 : {{1'd0}, _T_490}; // @[Mux.scala 31:69:@2944.4]
  assign _T_492 = _T_467 ? 4'h9 : _T_491; // @[Mux.scala 31:69:@2945.4]
  assign _T_493 = _T_465 ? 4'hb : _T_492; // @[Mux.scala 31:69:@2946.4]
  assign _T_494 = _T_463 ? 4'h0 : _T_493; // @[Mux.scala 31:69:@2947.4]
  assign _T_495 = _T_461 ? 4'h1 : _T_494; // @[Mux.scala 31:69:@2948.4]
  assign _T_496 = _T_459 ? 4'h3 : _T_495; // @[Mux.scala 31:69:@2949.4]
  assign _T_497 = _T_457 ? 4'h4 : _T_496; // @[Mux.scala 31:69:@2950.4]
  assign _T_498 = _T_455 ? 4'h5 : _T_497; // @[Mux.scala 31:69:@2951.4]
  assign _T_499 = _T_453 ? 4'h7 : _T_498; // @[Mux.scala 31:69:@2952.4]
  assign _T_500 = _T_451 ? 4'h8 : _T_499; // @[Mux.scala 31:69:@2953.4]
  assign _T_501 = _T_449 ? 4'h9 : _T_500; // @[Mux.scala 31:69:@2954.4]
  assign ic = _T_447 ? 4'hb : _T_501; // @[Mux.scala 31:69:@2955.4]
  assign _T_502 = csr_mideleg_data >> ic; // @[CSR.scala 225:38:@2956.4]
  assign _T_503 = _T_502[0]; // @[CSR.scala 225:38:@2957.4]
  assign inter_new_mode = _T_503 ? 2'h1 : 2'h3; // @[CSR.scala 225:29:@2958.4]
  assign _T_504 = inter_new_mode > prv; // @[CSR.scala 226:42:@2959.4]
  assign _T_505 = inter_new_mode == prv; // @[CSR.scala 226:69:@2960.4]
  assign _T_506 = _T_505 & ie; // @[CSR.scala 226:78:@2961.4]
  assign inter_enable = _T_504 | _T_506; // @[CSR.scala 226:49:@2962.4]
  assign _T_508 = ipie != 64'h0; // @[CSR.scala 228:44:@2963.4]
  assign _GEN_818 = {{60'd0}, ic}; // @[CSR.scala 229:47:@2967.4]
  assign have_excep = io_mem_excep_valid & io_mem_excep_inst_valid; // @[CSR.scala 240:41:@2971.4]
  assign _T_514 = io_mem_excep_code[63:2]; // @[Const.scala 68:33:@2975.6]
  assign _T_517 = _T_514 == 62'h4; // @[Const.scala 68:40:@2976.6]
  assign _T_518 = io_mem_excep_code[1:0]; // @[Const.scala 69:32:@2978.8]
  assign _T_519 = 2'h3 == _T_518; // @[Conditional.scala 37:30:@2979.8]
  assign _T_521 = 2'h1 == _T_518; // @[Conditional.scala 37:30:@2988.10]
  assign _T_524 = 2'h0 == _T_518; // @[Conditional.scala 37:30:@2997.12]
  assign _GEN_462 = _T_524 ? mstatus_UPIE : _GEN_428; // @[Conditional.scala 39:67:@2998.12]
  assign _GEN_463 = _T_524 ? 1'h1 : _GEN_432; // @[Conditional.scala 39:67:@2998.12]
  assign _GEN_464 = _T_524 ? 2'h0 : prv; // @[Conditional.scala 39:67:@2998.12]
  assign _GEN_465 = _T_524 ? csr_uepc_r_0_data : 64'h0; // @[Conditional.scala 39:67:@2998.12]
  assign _GEN_466 = _T_521 ? mstatus_SPIE : _GEN_429; // @[Conditional.scala 39:67:@2989.10]
  assign _GEN_467 = _T_521 ? 1'h1 : _GEN_433; // @[Conditional.scala 39:67:@2989.10]
  assign _GEN_468 = _T_521 ? 1'h0 : _GEN_436; // @[Conditional.scala 39:67:@2989.10]
  assign _GEN_469 = _T_521 ? {{1'd0}, mstatus_SPP} : _GEN_464; // @[Conditional.scala 39:67:@2989.10]
  assign _GEN_470 = _T_521 ? csr_sepc_r_0_data : _GEN_465; // @[Conditional.scala 39:67:@2989.10]
  assign _GEN_471 = _T_521 ? _GEN_428 : _GEN_462; // @[Conditional.scala 39:67:@2989.10]
  assign _GEN_472 = _T_521 ? _GEN_432 : _GEN_463; // @[Conditional.scala 39:67:@2989.10]
  assign _GEN_473 = _T_519 ? mstatus_MPIE : _GEN_431; // @[Conditional.scala 40:58:@2980.8]
  assign _GEN_474 = _T_519 ? 1'h1 : _GEN_435; // @[Conditional.scala 40:58:@2980.8]
  assign _GEN_475 = _T_519 ? 2'h0 : _GEN_438; // @[Conditional.scala 40:58:@2980.8]
  assign _GEN_476 = _T_519 ? mstatus_MPP : _GEN_469; // @[Conditional.scala 40:58:@2980.8]
  assign _GEN_477 = _T_519 ? csr_mepc_r_0_data : _GEN_470; // @[Conditional.scala 40:58:@2980.8]
  assign _GEN_478 = _T_519 ? _GEN_429 : _GEN_466; // @[Conditional.scala 40:58:@2980.8]
  assign _GEN_479 = _T_519 ? _GEN_433 : _GEN_467; // @[Conditional.scala 40:58:@2980.8]
  assign _GEN_480 = _T_519 ? _GEN_436 : _GEN_468; // @[Conditional.scala 40:58:@2980.8]
  assign _GEN_481 = _T_519 ? _GEN_428 : _GEN_471; // @[Conditional.scala 40:58:@2980.8]
  assign _GEN_482 = _T_519 ? _GEN_432 : _GEN_472; // @[Conditional.scala 40:58:@2980.8]
  assign _T_526 = io_mem_excep_code == 64'h14; // @[CSR.scala 270:31:@3006.8]
  assign _T_527 = io_mem_excep_code == 64'h15; // @[CSR.scala 270:67:@3007.8]
  assign _T_528 = _T_526 | _T_527; // @[CSR.scala 270:51:@3008.8]
  assign _T_530 = io_mem_excep_pc + 64'h4; // @[CSR.scala 271:42:@3010.10]
  assign _T_531 = io_mem_excep_pc + 64'h4; // @[CSR.scala 271:42:@3011.10]
  assign _T_532 = io_mem_excep_code[63]; // @[CSR.scala 276:18:@3015.10]
  assign _T_534 = _T_532 == 1'h0; // @[CSR.scala 276:12:@3016.10]
  assign _T_535 = io_mem_excep_code[4:0]; // @[CSR.scala 276:40:@3017.10]
  assign _T_536 = csr_medeleg_data >> _T_535; // @[CSR.scala 276:34:@3018.10]
  assign _T_537 = _T_536[0]; // @[CSR.scala 276:34:@3019.10]
  assign _T_539 = _T_537 == 1'h0; // @[CSR.scala 276:26:@3020.10]
  assign _T_540 = _T_534 & _T_539; // @[CSR.scala 276:23:@3021.10]
  assign _T_543 = csr_mideleg_data >> _T_535; // @[CSR.scala 277:34:@3024.10]
  assign _T_544 = _T_543[0]; // @[CSR.scala 277:34:@3025.10]
  assign _T_546 = _T_544 == 1'h0; // @[CSR.scala 277:26:@3026.10]
  assign _T_547 = _T_532 & _T_546; // @[CSR.scala 277:23:@3027.10]
  assign _T_552 = csr_sedeleg_data >> _T_535; // @[CSR.scala 278:34:@3031.10]
  assign _T_553 = _T_552[0]; // @[CSR.scala 278:34:@3032.10]
  assign _T_555 = _T_553 == 1'h0; // @[CSR.scala 278:26:@3033.10]
  assign _T_556 = _T_534 & _T_555; // @[CSR.scala 278:23:@3034.10]
  assign _T_559 = csr_sideleg_data >> _T_535; // @[CSR.scala 279:34:@3037.10]
  assign _T_560 = _T_559[0]; // @[CSR.scala 279:34:@3038.10]
  assign _T_562 = _T_560 == 1'h0; // @[CSR.scala 279:26:@3039.10]
  assign _T_563 = _T_532 & _T_562; // @[CSR.scala 279:23:@3040.10]
  assign _T_565 = _T_563 ? 2'h1 : 2'h0; // @[Mux.scala 31:69:@3041.10]
  assign _T_566 = _T_556 ? 2'h1 : _T_565; // @[Mux.scala 31:69:@3042.10]
  assign _T_567 = _T_547 ? 2'h3 : _T_566; // @[Mux.scala 31:69:@3043.10]
  assign _T_568 = _T_540 ? 2'h3 : _T_567; // @[Mux.scala 31:69:@3044.10]
  assign _GEN_523 = _T_528 ? prv : _T_568; // @[CSR.scala 270:88:@3009.8]
  assign _GEN_547 = _T_517 ? _GEN_476 : _GEN_523; // @[CSR.scala 247:32:@2977.6]
  assign nextPrv = have_excep ? _GEN_547 : prv; // @[CSR.scala 246:22:@2974.4]
  assign _T_569 = 2'h3 == nextPrv; // @[Conditional.scala 37:30:@3046.10]
  assign _T_571 = 2'h1 == nextPrv; // @[Conditional.scala 37:30:@3056.12]
  assign _T_573 = 2'h0 == nextPrv; // @[Conditional.scala 37:30:@3066.14]
  assign _GEN_483 = _T_573 ? mstatus_UIE : _GEN_432; // @[Conditional.scala 39:67:@3067.14]
  assign _GEN_484 = _T_573 ? 1'h0 : _GEN_428; // @[Conditional.scala 39:67:@3067.14]
  assign _GEN_489 = _T_571 ? mstatus_SIE : _GEN_433; // @[Conditional.scala 39:67:@3057.12]
  assign _GEN_490 = _T_571 ? 1'h0 : _GEN_429; // @[Conditional.scala 39:67:@3057.12]
  assign _GEN_491 = _T_571 ? prv : {{1'd0}, _GEN_436}; // @[Conditional.scala 39:67:@3057.12]
  assign _GEN_496 = _T_571 ? _GEN_432 : _GEN_483; // @[Conditional.scala 39:67:@3057.12]
  assign _GEN_497 = _T_571 ? _GEN_428 : _GEN_484; // @[Conditional.scala 39:67:@3057.12]
  assign _GEN_499 = _T_571 ? 1'h0 : _T_573; // @[Conditional.scala 39:67:@3057.12]
  assign _GEN_502 = _T_569 ? mstatus_MIE : _GEN_435; // @[Conditional.scala 40:58:@3047.10]
  assign _GEN_503 = _T_569 ? 1'h0 : _GEN_431; // @[Conditional.scala 40:58:@3047.10]
  assign _GEN_504 = _T_569 ? prv : _GEN_438; // @[Conditional.scala 40:58:@3047.10]
  assign _GEN_509 = _T_569 ? _GEN_433 : _GEN_489; // @[Conditional.scala 40:58:@3047.10]
  assign _GEN_510 = _T_569 ? _GEN_429 : _GEN_490; // @[Conditional.scala 40:58:@3047.10]
  assign _GEN_511 = _T_569 ? {{1'd0}, _GEN_436} : _GEN_491; // @[Conditional.scala 40:58:@3047.10]
  assign _GEN_513 = _T_569 ? 1'h0 : _T_571; // @[Conditional.scala 40:58:@3047.10]
  assign _GEN_516 = _T_569 ? _GEN_432 : _GEN_496; // @[Conditional.scala 40:58:@3047.10]
  assign _GEN_517 = _T_569 ? _GEN_428 : _GEN_497; // @[Conditional.scala 40:58:@3047.10]
  assign _GEN_519 = _T_569 ? 1'h0 : _GEN_499; // @[Conditional.scala 40:58:@3047.10]
  assign _T_577 = _T_573 ? csr_utvec_data : 64'h0; // @[Mux.scala 46:16:@3075.10]
  assign _T_579 = _T_571 ? csr_stvec_data : _T_577; // @[Mux.scala 46:16:@3077.10]
  assign _T_581 = _T_569 ? csr_mtvec_data : _T_579; // @[Mux.scala 46:16:@3079.10]
  assign _T_582 = _T_581[63:2]; // @[CSR.scala 313:29:@3080.10]
  assign _T_584 = {_T_582,2'h0}; // @[Cat.scala 30:58:@3081.10]
  assign _T_585 = _T_581[1:0]; // @[CSR.scala 314:33:@3082.10]
  assign _T_587 = _T_585 == 2'h0; // @[CSR.scala 314:39:@3083.10]
  assign _T_589 = 64'h4 * io_mem_excep_code; // @[CSR.scala 316:22:@3084.10]
  assign _GEN_819 = {{3'd0}, _T_584}; // @[CSR.scala 316:16:@3085.10]
  assign _T_590 = _GEN_819 + _T_589; // @[CSR.scala 316:16:@3085.10]
  assign _T_591 = _GEN_819 + _T_589; // @[CSR.scala 316:16:@3086.10]
  assign _T_592 = _T_587 ? {{3'd0}, _T_584} : _T_591; // @[CSR.scala 314:27:@3087.10]
  assign _GEN_522 = _T_528 ? {{3'd0}, _T_531} : _T_592; // @[CSR.scala 270:88:@3009.8]
  assign _GEN_524 = _T_528 ? _GEN_435 : _GEN_502; // @[CSR.scala 270:88:@3009.8]
  assign _GEN_525 = _T_528 ? _GEN_431 : _GEN_503; // @[CSR.scala 270:88:@3009.8]
  assign _GEN_526 = _T_528 ? _GEN_438 : _GEN_504; // @[CSR.scala 270:88:@3009.8]
  assign _GEN_528 = _T_528 ? 1'h0 : _T_569; // @[CSR.scala 270:88:@3009.8]
  assign _GEN_531 = _T_528 ? _GEN_433 : _GEN_509; // @[CSR.scala 270:88:@3009.8]
  assign _GEN_532 = _T_528 ? _GEN_429 : _GEN_510; // @[CSR.scala 270:88:@3009.8]
  assign _GEN_533 = _T_528 ? {{1'd0}, _GEN_436} : _GEN_511; // @[CSR.scala 270:88:@3009.8]
  assign _GEN_535 = _T_528 ? 1'h0 : _GEN_513; // @[CSR.scala 270:88:@3009.8]
  assign _GEN_538 = _T_528 ? _GEN_432 : _GEN_516; // @[CSR.scala 270:88:@3009.8]
  assign _GEN_539 = _T_528 ? _GEN_428 : _GEN_517; // @[CSR.scala 270:88:@3009.8]
  assign _GEN_541 = _T_528 ? 1'h0 : _GEN_519; // @[CSR.scala 270:88:@3009.8]
  assign _GEN_544 = _T_517 ? _GEN_473 : _GEN_525; // @[CSR.scala 247:32:@2977.6]
  assign _GEN_545 = _T_517 ? _GEN_474 : _GEN_524; // @[CSR.scala 247:32:@2977.6]
  assign _GEN_546 = _T_517 ? _GEN_475 : _GEN_526; // @[CSR.scala 247:32:@2977.6]
  assign _GEN_548 = _T_517 ? {{3'd0}, _GEN_477} : _GEN_522; // @[CSR.scala 247:32:@2977.6]
  assign _GEN_549 = _T_517 ? _GEN_478 : _GEN_532; // @[CSR.scala 247:32:@2977.6]
  assign _GEN_550 = _T_517 ? _GEN_479 : _GEN_531; // @[CSR.scala 247:32:@2977.6]
  assign _GEN_551 = _T_517 ? {{1'd0}, _GEN_480} : _GEN_533; // @[CSR.scala 247:32:@2977.6]
  assign _GEN_552 = _T_517 ? _GEN_481 : _GEN_539; // @[CSR.scala 247:32:@2977.6]
  assign _GEN_553 = _T_517 ? _GEN_482 : _GEN_538; // @[CSR.scala 247:32:@2977.6]
  assign _GEN_555 = _T_517 ? 1'h0 : _GEN_528; // @[CSR.scala 247:32:@2977.6]
  assign _GEN_559 = _T_517 ? 1'h0 : _GEN_535; // @[CSR.scala 247:32:@2977.6]
  assign _GEN_563 = _T_517 ? 1'h0 : _GEN_541; // @[CSR.scala 247:32:@2977.6]
  assign _GEN_566 = have_excep ? _GEN_544 : _GEN_431; // @[CSR.scala 246:22:@2974.4]
  assign _GEN_567 = have_excep ? _GEN_545 : _GEN_435; // @[CSR.scala 246:22:@2974.4]
  assign _GEN_568 = have_excep ? _GEN_546 : _GEN_438; // @[CSR.scala 246:22:@2974.4]
  assign _GEN_570 = have_excep ? _GEN_548 : 67'h0; // @[CSR.scala 246:22:@2974.4]
  assign _GEN_571 = have_excep ? _GEN_549 : _GEN_429; // @[CSR.scala 246:22:@2974.4]
  assign _GEN_572 = have_excep ? _GEN_550 : _GEN_433; // @[CSR.scala 246:22:@2974.4]
  assign _GEN_573 = have_excep ? _GEN_551 : {{1'd0}, _GEN_436}; // @[CSR.scala 246:22:@2974.4]
  assign _GEN_574 = have_excep ? _GEN_552 : _GEN_428; // @[CSR.scala 246:22:@2974.4]
  assign _GEN_575 = have_excep ? _GEN_553 : _GEN_432; // @[CSR.scala 246:22:@2974.4]
  assign io_id_rdata = _T_267 ? 64'h91d : _T_266; // @[CSR.scala 106:15:@2506.4]
  assign io_id_priv = prv; // @[CSR.scala 119:14:@2507.4]
  assign io_mmu_satp = csr__T_269_data; // @[CSR.scala 121:15:@2509.4]
  assign io_mmu_priv = prv; // @[CSR.scala 122:15:@2510.4]
  assign io_mmu_mxr = mstatus_MXR; // @[CSR.scala 124:15:@2512.4]
  assign io_mmu_sum = mstatus_SUM; // @[CSR.scala 123:15:@2511.4]
  assign io_flush = io_mem_excep_valid & io_mem_excep_inst_valid; // @[CSR.scala 243:14:@2972.4]
  assign io_csrNewPc = _GEN_570[63:0]; // @[CSR.scala 244:17:@2973.4 CSR.scala 254:25:@2985.10 CSR.scala 261:25:@2994.12 CSR.scala 267:25:@3002.14 CSR.scala 271:23:@3012.10 CSR.scala 314:21:@3088.10]
  assign io_inter_valid = inter_enable & _T_508; // @[CSR.scala 228:20:@2965.4]
  assign io_inter_bits = 64'h8000000000000000 | _GEN_818; // @[CSR.scala 229:20:@2968.4]
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
    if(csr__T_272_en & csr__T_272_mask) begin
      csr[csr__T_272_addr] <= csr__T_272_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_275_en & csr__T_275_mask) begin
      csr[csr__T_275_addr] <= csr__T_275_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_278_en & csr__T_278_mask) begin
      csr[csr__T_278_addr] <= csr__T_278_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_281_en & csr__T_281_mask) begin
      csr[csr__T_281_addr] <= csr__T_281_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_283_en & csr__T_283_mask) begin
      csr[csr__T_283_addr] <= csr__T_283_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_285_en & csr__T_285_mask) begin
      csr[csr__T_285_addr] <= csr__T_285_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_287_en & csr__T_287_mask) begin
      csr[csr__T_287_addr] <= csr__T_287_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_289_en & csr__T_289_mask) begin
      csr[csr__T_289_addr] <= csr__T_289_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_291_en & csr__T_291_mask) begin
      csr[csr__T_291_addr] <= csr__T_291_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_293_en & csr__T_293_mask) begin
      csr[csr__T_293_addr] <= csr__T_293_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_295_en & csr__T_295_mask) begin
      csr[csr__T_295_addr] <= csr__T_295_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_297_en & csr__T_297_mask) begin
      csr[csr__T_297_addr] <= csr__T_297_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_299_en & csr__T_299_mask) begin
      csr[csr__T_299_addr] <= csr__T_299_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_301_en & csr__T_301_mask) begin
      csr[csr__T_301_addr] <= csr__T_301_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_303_en & csr__T_303_mask) begin
      csr[csr__T_303_addr] <= csr__T_303_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_305_en & csr__T_305_mask) begin
      csr[csr__T_305_addr] <= csr__T_305_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_307_en & csr__T_307_mask) begin
      csr[csr__T_307_addr] <= csr__T_307_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_309_en & csr__T_309_mask) begin
      csr[csr__T_309_addr] <= csr__T_309_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_311_en & csr__T_311_mask) begin
      csr[csr__T_311_addr] <= csr__T_311_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_313_en & csr__T_313_mask) begin
      csr[csr__T_313_addr] <= csr__T_313_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_315_en & csr__T_315_mask) begin
      csr[csr__T_315_addr] <= csr__T_315_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_317_en & csr__T_317_mask) begin
      csr[csr__T_317_addr] <= csr__T_317_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_319_en & csr__T_319_mask) begin
      csr[csr__T_319_addr] <= csr__T_319_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_321_en & csr__T_321_mask) begin
      csr[csr__T_321_addr] <= csr__T_321_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_323_en & csr__T_323_mask) begin
      csr[csr__T_323_addr] <= csr__T_323_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_325_en & csr__T_325_mask) begin
      csr[csr__T_325_addr] <= csr__T_325_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_327_en & csr__T_327_mask) begin
      csr[csr__T_327_addr] <= csr__T_327_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_329_en & csr__T_329_mask) begin
      csr[csr__T_329_addr] <= csr__T_329_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_331_en & csr__T_331_mask) begin
      csr[csr__T_331_addr] <= csr__T_331_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_333_en & csr__T_333_mask) begin
      csr[csr__T_333_addr] <= csr__T_333_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_335_en & csr__T_335_mask) begin
      csr[csr__T_335_addr] <= csr__T_335_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_337_en & csr__T_337_mask) begin
      csr[csr__T_337_addr] <= csr__T_337_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_339_en & csr__T_339_mask) begin
      csr[csr__T_339_addr] <= csr__T_339_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_341_en & csr__T_341_mask) begin
      csr[csr__T_341_addr] <= csr__T_341_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_343_en & csr__T_343_mask) begin
      csr[csr__T_343_addr] <= csr__T_343_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_346_en & csr__T_346_mask) begin
      csr[csr__T_346_addr] <= csr__T_346_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_349_en & csr__T_349_mask) begin
      csr[csr__T_349_addr] <= csr__T_349_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_411_en & csr__T_411_mask) begin
      csr[csr__T_411_addr] <= csr__T_411_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_413_en & csr__T_413_mask) begin
      csr[csr__T_413_addr] <= csr__T_413_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr_mcause_en & csr_mcause_mask) begin
      csr[csr_mcause_addr] <= csr_mcause_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr_scause_en & csr_scause_mask) begin
      csr[csr_scause_addr] <= csr_scause_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr_ucause_en & csr_ucause_mask) begin
      csr[csr_ucause_addr] <= csr_ucause_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr_mtval_en & csr_mtval_mask) begin
      csr[csr_mtval_addr] <= csr_mtval_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr_stval_en & csr_stval_mask) begin
      csr[csr_stval_addr] <= csr_stval_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr_utval_en & csr_utval_mask) begin
      csr[csr_utval_addr] <= csr_utval_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr__T_420_en & csr__T_420_mask) begin
      csr[csr__T_420_addr] <= csr__T_420_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr_mepc_w_0_en & csr_mepc_w_0_mask) begin
      csr[csr_mepc_w_0_addr] <= csr_mepc_w_0_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr_sepc_w_0_en & csr_sepc_w_0_mask) begin
      csr[csr_sepc_w_0_addr] <= csr_sepc_w_0_data; // @[CSR.scala 25:16:@2377.4]
    end
    if(csr_uepc_w_0_en & csr_uepc_w_0_mask) begin
      csr[csr_uepc_w_0_addr] <= csr_uepc_w_0_data; // @[CSR.scala 25:16:@2377.4]
    end
    if (reset) begin
      prv <= 2'h3;
    end else begin
      if (have_excep) begin
        if (_T_517) begin
          if (_T_519) begin
            prv <= mstatus_MPP;
          end else begin
            if (_T_521) begin
              prv <= {{1'd0}, mstatus_SPP};
            end else begin
              if (_T_524) begin
                prv <= 2'h0;
              end
            end
          end
        end else begin
          if (!(_T_528)) begin
            if (_T_540) begin
              prv <= 2'h3;
            end else begin
              if (_T_547) begin
                prv <= 2'h3;
              end else begin
                if (_T_556) begin
                  prv <= 2'h1;
                end else begin
                  if (_T_563) begin
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
        if (_T_380) begin
          mstatus_SD <= _T_379;
        end else begin
          if (_T_350) begin
            mstatus_SD <= _T_379;
          end
        end
      end
    end
    if (reset) begin
      mstatus_zero1 <= 27'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_380) begin
          mstatus_zero1 <= _T_378;
        end else begin
          if (_T_350) begin
            mstatus_zero1 <= _T_378;
          end
        end
      end
    end
    if (reset) begin
      mstatus_SXL <= 2'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_380) begin
          mstatus_SXL <= _T_377;
        end else begin
          if (_T_350) begin
            mstatus_SXL <= _T_377;
          end
        end
      end
    end
    if (reset) begin
      mstatus_UXL <= 2'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_380) begin
          mstatus_UXL <= _T_376;
        end else begin
          if (_T_350) begin
            mstatus_UXL <= _T_376;
          end
        end
      end
    end
    if (reset) begin
      mstatus_TSR <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_380) begin
          mstatus_TSR <= _T_375;
        end else begin
          if (_T_350) begin
            mstatus_TSR <= _T_375;
          end
        end
      end
    end
    if (reset) begin
      mstatus_zero2 <= 9'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_380) begin
          mstatus_zero2 <= _T_374;
        end else begin
          if (_T_350) begin
            mstatus_zero2 <= _T_374;
          end
        end
      end
    end
    if (reset) begin
      mstatus_TW <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_380) begin
          mstatus_TW <= _T_373;
        end else begin
          if (_T_350) begin
            mstatus_TW <= _T_373;
          end
        end
      end
    end
    if (reset) begin
      mstatus_TVM <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_380) begin
          mstatus_TVM <= _T_372;
        end else begin
          if (_T_350) begin
            mstatus_TVM <= _T_372;
          end
        end
      end
    end
    if (reset) begin
      mstatus_MXR <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_380) begin
          mstatus_MXR <= _T_371;
        end else begin
          if (_T_350) begin
            mstatus_MXR <= _T_371;
          end
        end
      end
    end
    if (reset) begin
      mstatus_SUM <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_380) begin
          mstatus_SUM <= _T_370;
        end else begin
          if (_T_350) begin
            mstatus_SUM <= _T_370;
          end
        end
      end
    end
    if (reset) begin
      mstatus_MPriv <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_380) begin
          mstatus_MPriv <= _T_369;
        end else begin
          if (_T_350) begin
            mstatus_MPriv <= _T_369;
          end
        end
      end
    end
    if (reset) begin
      mstatus_XS <= 2'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_380) begin
          mstatus_XS <= _T_368;
        end else begin
          if (_T_350) begin
            mstatus_XS <= _T_368;
          end
        end
      end
    end
    if (reset) begin
      mstatus_FS <= 2'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_380) begin
          mstatus_FS <= _T_367;
        end else begin
          if (_T_350) begin
            mstatus_FS <= _T_367;
          end
        end
      end
    end
    if (reset) begin
      mstatus_MPP <= 2'h0;
    end else begin
      if (have_excep) begin
        if (_T_517) begin
          if (_T_519) begin
            mstatus_MPP <= 2'h0;
          end else begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_380) begin
                mstatus_MPP <= _T_366;
              end else begin
                if (_T_350) begin
                  mstatus_MPP <= _T_366;
                end
              end
            end
          end
        end else begin
          if (_T_528) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_380) begin
                mstatus_MPP <= _T_366;
              end else begin
                if (_T_350) begin
                  mstatus_MPP <= _T_366;
                end
              end
            end
          end else begin
            if (_T_569) begin
              mstatus_MPP <= prv;
            end else begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_380) begin
                  mstatus_MPP <= _T_366;
                end else begin
                  if (_T_350) begin
                    mstatus_MPP <= _T_366;
                  end
                end
              end
            end
          end
        end
      end else begin
        if (io_mem_wrCSROp_valid) begin
          if (_T_380) begin
            mstatus_MPP <= _T_366;
          end else begin
            if (_T_350) begin
              mstatus_MPP <= _T_366;
            end
          end
        end
      end
    end
    if (reset) begin
      mstatus_old_HPP <= 2'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_380) begin
          mstatus_old_HPP <= _T_365;
        end else begin
          if (_T_350) begin
            mstatus_old_HPP <= _T_365;
          end
        end
      end
    end
    if (reset) begin
      mstatus_SPP <= 1'h0;
    end else begin
      mstatus_SPP <= _GEN_573[0];
    end
    if (reset) begin
      mstatus_MPIE <= 1'h0;
    end else begin
      if (have_excep) begin
        if (_T_517) begin
          if (_T_519) begin
            mstatus_MPIE <= 1'h1;
          end else begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_380) begin
                mstatus_MPIE <= _T_363;
              end else begin
                if (_T_350) begin
                  mstatus_MPIE <= _T_363;
                end
              end
            end
          end
        end else begin
          if (_T_528) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_380) begin
                mstatus_MPIE <= _T_363;
              end else begin
                if (_T_350) begin
                  mstatus_MPIE <= _T_363;
                end
              end
            end
          end else begin
            if (_T_569) begin
              mstatus_MPIE <= mstatus_MIE;
            end else begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_380) begin
                  mstatus_MPIE <= _T_363;
                end else begin
                  if (_T_350) begin
                    mstatus_MPIE <= _T_363;
                  end
                end
              end
            end
          end
        end
      end else begin
        if (io_mem_wrCSROp_valid) begin
          if (_T_380) begin
            mstatus_MPIE <= _T_363;
          end else begin
            if (_T_350) begin
              mstatus_MPIE <= _T_363;
            end
          end
        end
      end
    end
    if (reset) begin
      mstatus_old_HPIE <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_380) begin
          mstatus_old_HPIE <= _T_362;
        end else begin
          if (_T_350) begin
            mstatus_old_HPIE <= _T_362;
          end
        end
      end
    end
    if (reset) begin
      mstatus_SPIE <= 1'h0;
    end else begin
      if (have_excep) begin
        if (_T_517) begin
          if (_T_519) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_380) begin
                mstatus_SPIE <= _T_361;
              end else begin
                if (_T_350) begin
                  mstatus_SPIE <= _T_361;
                end
              end
            end
          end else begin
            if (_T_521) begin
              mstatus_SPIE <= 1'h1;
            end else begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_380) begin
                  mstatus_SPIE <= _T_361;
                end else begin
                  if (_T_350) begin
                    mstatus_SPIE <= _T_361;
                  end
                end
              end
            end
          end
        end else begin
          if (_T_528) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_380) begin
                mstatus_SPIE <= _T_361;
              end else begin
                if (_T_350) begin
                  mstatus_SPIE <= _T_361;
                end
              end
            end
          end else begin
            if (_T_569) begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_380) begin
                  mstatus_SPIE <= _T_361;
                end else begin
                  if (_T_350) begin
                    mstatus_SPIE <= _T_361;
                  end
                end
              end
            end else begin
              if (_T_571) begin
                mstatus_SPIE <= mstatus_SIE;
              end else begin
                mstatus_SPIE <= _GEN_433;
              end
            end
          end
        end
      end else begin
        mstatus_SPIE <= _GEN_433;
      end
    end
    if (reset) begin
      mstatus_UPIE <= 1'h0;
    end else begin
      if (have_excep) begin
        if (_T_517) begin
          if (_T_519) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_380) begin
                mstatus_UPIE <= _T_360;
              end else begin
                if (_T_350) begin
                  mstatus_UPIE <= _T_360;
                end
              end
            end
          end else begin
            if (_T_521) begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_380) begin
                  mstatus_UPIE <= _T_360;
                end else begin
                  if (_T_350) begin
                    mstatus_UPIE <= _T_360;
                  end
                end
              end
            end else begin
              if (_T_524) begin
                mstatus_UPIE <= 1'h1;
              end else begin
                if (io_mem_wrCSROp_valid) begin
                  if (_T_380) begin
                    mstatus_UPIE <= _T_360;
                  end else begin
                    if (_T_350) begin
                      mstatus_UPIE <= _T_360;
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (_T_528) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_380) begin
                mstatus_UPIE <= _T_360;
              end else begin
                if (_T_350) begin
                  mstatus_UPIE <= _T_360;
                end
              end
            end
          end else begin
            if (_T_569) begin
              mstatus_UPIE <= _GEN_432;
            end else begin
              if (_T_571) begin
                mstatus_UPIE <= _GEN_432;
              end else begin
                if (_T_573) begin
                  mstatus_UPIE <= mstatus_UIE;
                end else begin
                  mstatus_UPIE <= _GEN_432;
                end
              end
            end
          end
        end
      end else begin
        mstatus_UPIE <= _GEN_432;
      end
    end
    if (reset) begin
      mstatus_MIE <= 1'h0;
    end else begin
      if (have_excep) begin
        if (_T_517) begin
          if (_T_519) begin
            mstatus_MIE <= mstatus_MPIE;
          end else begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_380) begin
                mstatus_MIE <= _T_359;
              end else begin
                if (_T_350) begin
                  mstatus_MIE <= _T_359;
                end
              end
            end
          end
        end else begin
          if (_T_528) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_380) begin
                mstatus_MIE <= _T_359;
              end else begin
                if (_T_350) begin
                  mstatus_MIE <= _T_359;
                end
              end
            end
          end else begin
            if (_T_569) begin
              mstatus_MIE <= 1'h0;
            end else begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_380) begin
                  mstatus_MIE <= _T_359;
                end else begin
                  if (_T_350) begin
                    mstatus_MIE <= _T_359;
                  end
                end
              end
            end
          end
        end
      end else begin
        if (io_mem_wrCSROp_valid) begin
          if (_T_380) begin
            mstatus_MIE <= _T_359;
          end else begin
            if (_T_350) begin
              mstatus_MIE <= _T_359;
            end
          end
        end
      end
    end
    if (reset) begin
      mstatus_old_HIE <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_380) begin
          mstatus_old_HIE <= _T_358;
        end else begin
          if (_T_350) begin
            mstatus_old_HIE <= _T_358;
          end
        end
      end
    end
    if (reset) begin
      mstatus_SIE <= 1'h0;
    end else begin
      if (have_excep) begin
        if (_T_517) begin
          if (_T_519) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_380) begin
                mstatus_SIE <= _T_357;
              end else begin
                if (_T_350) begin
                  mstatus_SIE <= _T_357;
                end
              end
            end
          end else begin
            if (_T_521) begin
              mstatus_SIE <= mstatus_SPIE;
            end else begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_380) begin
                  mstatus_SIE <= _T_357;
                end else begin
                  if (_T_350) begin
                    mstatus_SIE <= _T_357;
                  end
                end
              end
            end
          end
        end else begin
          if (_T_528) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_380) begin
                mstatus_SIE <= _T_357;
              end else begin
                if (_T_350) begin
                  mstatus_SIE <= _T_357;
                end
              end
            end
          end else begin
            if (_T_569) begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_380) begin
                  mstatus_SIE <= _T_357;
                end else begin
                  if (_T_350) begin
                    mstatus_SIE <= _T_357;
                  end
                end
              end
            end else begin
              if (_T_571) begin
                mstatus_SIE <= 1'h0;
              end else begin
                mstatus_SIE <= _GEN_429;
              end
            end
          end
        end
      end else begin
        mstatus_SIE <= _GEN_429;
      end
    end
    if (reset) begin
      mstatus_UIE <= 1'h0;
    end else begin
      if (have_excep) begin
        if (_T_517) begin
          if (_T_519) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_380) begin
                mstatus_UIE <= _T_356;
              end else begin
                if (_T_350) begin
                  mstatus_UIE <= _T_356;
                end
              end
            end
          end else begin
            if (_T_521) begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_380) begin
                  mstatus_UIE <= _T_356;
                end else begin
                  if (_T_350) begin
                    mstatus_UIE <= _T_356;
                  end
                end
              end
            end else begin
              if (_T_524) begin
                mstatus_UIE <= mstatus_UPIE;
              end else begin
                if (io_mem_wrCSROp_valid) begin
                  if (_T_380) begin
                    mstatus_UIE <= _T_356;
                  end else begin
                    if (_T_350) begin
                      mstatus_UIE <= _T_356;
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (_T_528) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_380) begin
                mstatus_UIE <= _T_356;
              end else begin
                if (_T_350) begin
                  mstatus_UIE <= _T_356;
                end
              end
            end
          end else begin
            if (_T_569) begin
              mstatus_UIE <= _GEN_428;
            end else begin
              if (_T_571) begin
                mstatus_UIE <= _GEN_428;
              end else begin
                if (_T_573) begin
                  mstatus_UIE <= 1'h0;
                end else begin
                  mstatus_UIE <= _GEN_428;
                end
              end
            end
          end
        end
      end else begin
        mstatus_UIE <= _GEN_428;
      end
    end
    if (reset) begin
      mtime <= 64'h0;
    end else begin
      mtime <= _T_154;
    end
  end
endmodule
module CPU( // @[:@3092.2]
  input         clock, // @[:@3093.4]
  input         reset, // @[:@3094.4]
  input         io_en, // @[:@3095.4]
  output [63:0] io_debug_pc, // @[:@3095.4]
  output [31:0] io_debug_ins, // @[:@3095.4]
  output [1:0]  io_debug_if_wait, // @[:@3095.4]
  output [1:0]  io_debug_mem_wait, // @[:@3095.4]
  output        io_debug_if_ready, // @[:@3095.4]
  output        io_debug_mem_ready, // @[:@3095.4]
  output [3:0]  io_debug_if_mode, // @[:@3095.4]
  output [3:0]  io_debug_mem_mode, // @[:@3095.4]
  output [63:0] io_debug_if_addr, // @[:@3095.4]
  output [63:0] io_debug_mem_addr, // @[:@3095.4]
  output        io_debug_if_error, // @[:@3095.4]
  output        io_debug_mem_error, // @[:@3095.4]
  output [3:0]  io_mem_mode, // @[:@3095.4]
  input         io_mem_ready, // @[:@3095.4]
  output [63:0] io_mem_addr, // @[:@3095.4]
  input  [63:0] io_mem_rdata, // @[:@3095.4]
  output [63:0] io_mem_wdata, // @[:@3095.4]
  output [3:0]  io_serial_mode, // @[:@3095.4]
  input         io_serial_ready, // @[:@3095.4]
  output [63:0] io_serial_addr, // @[:@3095.4]
  input  [63:0] io_serial_rdata, // @[:@3095.4]
  output [63:0] io_serial_wdata // @[:@3095.4]
);
  wire  insr_io_jump; // @[cpu.scala 27:22:@3097.4]
  wire [63:0] insr_io_jdest; // @[cpu.scala 27:22:@3097.4]
  wire  insr_io_nls; // @[cpu.scala 27:22:@3097.4]
  wire [63:0] insr_io_lpc; // @[cpu.scala 27:22:@3097.4]
  wire [63:0] insr_io_insp; // @[cpu.scala 27:22:@3097.4]
  wire [63:0] insr_io_inspd; // @[cpu.scala 27:22:@3097.4]
  wire  insr_io_bubble; // @[cpu.scala 27:22:@3097.4]
  wire [31:0] insr_io_ins; // @[cpu.scala 27:22:@3097.4]
  wire [63:0] insr_io_pc; // @[cpu.scala 27:22:@3097.4]
  wire [63:0] insr_io_insn; // @[cpu.scala 27:22:@3097.4]
  wire [63:0] insr_io_insnd; // @[cpu.scala 27:22:@3097.4]
  wire [3:0] insr_io_mmu_mode; // @[cpu.scala 27:22:@3097.4]
  wire  insr_io_mmu_ready; // @[cpu.scala 27:22:@3097.4]
  wire [63:0] insr_io_mmu_addr; // @[cpu.scala 27:22:@3097.4]
  wire [63:0] insr_io_mmu_rdata; // @[cpu.scala 27:22:@3097.4]
  wire  insr_io_mmu_if_rst; // @[cpu.scala 27:22:@3097.4]
  wire [63:0] insr_io_excep_pc; // @[cpu.scala 27:22:@3097.4]
  wire  insr_io_excep_inst_valid; // @[cpu.scala 27:22:@3097.4]
  wire [31:0] insd_io_ins; // @[cpu.scala 28:22:@3100.4]
  wire  insd_io_lastload_valid; // @[cpu.scala 28:22:@3100.4]
  wire [4:0] insd_io_lastload_index; // @[cpu.scala 28:22:@3100.4]
  wire  insd_io_loadinfo_valid; // @[cpu.scala 28:22:@3100.4]
  wire [4:0] insd_io_loadinfo_index; // @[cpu.scala 28:22:@3100.4]
  wire [63:0] insd_io_imm; // @[cpu.scala 28:22:@3100.4]
  wire [4:0] insd_io_ALUOp; // @[cpu.scala 28:22:@3100.4]
  wire [3:0] insd_io_exe_type; // @[cpu.scala 28:22:@3100.4]
  wire [3:0] insd_io_ls_mode; // @[cpu.scala 28:22:@3100.4]
  wire  insd_io_op32; // @[cpu.scala 28:22:@3100.4]
  wire  insd_io_bubble; // @[cpu.scala 28:22:@3100.4]
  wire [4:0] insd_io_regr_r1; // @[cpu.scala 28:22:@3100.4]
  wire [4:0] insd_io_regr_r2; // @[cpu.scala 28:22:@3100.4]
  wire [63:0] insd_io_regr_r1d; // @[cpu.scala 28:22:@3100.4]
  wire [63:0] insd_io_regr_r2d; // @[cpu.scala 28:22:@3100.4]
  wire  insd_io_dreg_rs2_valid; // @[cpu.scala 28:22:@3100.4]
  wire [63:0] insd_io_dreg_rs1_value; // @[cpu.scala 28:22:@3100.4]
  wire [63:0] insd_io_dreg_rs2_value; // @[cpu.scala 28:22:@3100.4]
  wire  insd_io_dreg_rd_valid; // @[cpu.scala 28:22:@3100.4]
  wire [4:0] insd_io_dreg_rd_index; // @[cpu.scala 28:22:@3100.4]
  wire [11:0] insd_io_csr_addr; // @[cpu.scala 28:22:@3100.4]
  wire [63:0] insd_io_csr_rdata; // @[cpu.scala 28:22:@3100.4]
  wire [1:0] insd_io_csr_priv; // @[cpu.scala 28:22:@3100.4]
  wire  insd_io_csr_content_valid; // @[cpu.scala 28:22:@3100.4]
  wire [11:0] insd_io_csr_content_csr_idx; // @[cpu.scala 28:22:@3100.4]
  wire [63:0] insd_io_csr_content_csr_data; // @[cpu.scala 28:22:@3100.4]
  wire  insd_io_csr_from_ex_valid; // @[cpu.scala 28:22:@3100.4]
  wire [11:0] insd_io_csr_from_ex_csr_idx; // @[cpu.scala 28:22:@3100.4]
  wire [63:0] insd_io_csr_from_ex_csr_data; // @[cpu.scala 28:22:@3100.4]
  wire  insd_io_csr_from_mem_valid; // @[cpu.scala 28:22:@3100.4]
  wire [11:0] insd_io_csr_from_mem_csr_idx; // @[cpu.scala 28:22:@3100.4]
  wire [63:0] insd_io_csr_from_mem_csr_data; // @[cpu.scala 28:22:@3100.4]
  wire  insd_io_exWrReg_wbrv; // @[cpu.scala 28:22:@3100.4]
  wire [4:0] insd_io_exWrReg_wbri; // @[cpu.scala 28:22:@3100.4]
  wire [63:0] insd_io_exWrReg_wbrd; // @[cpu.scala 28:22:@3100.4]
  wire  insd_io_memWrReg_wbrv; // @[cpu.scala 28:22:@3100.4]
  wire [4:0] insd_io_memWrReg_wbri; // @[cpu.scala 28:22:@3100.4]
  wire [63:0] insd_io_memWrReg_wbrd; // @[cpu.scala 28:22:@3100.4]
  wire  insd_io_if_excep_valid; // @[cpu.scala 28:22:@3100.4]
  wire [63:0] insd_io_if_excep_code; // @[cpu.scala 28:22:@3100.4]
  wire [63:0] insd_io_if_excep_value; // @[cpu.scala 28:22:@3100.4]
  wire [63:0] insd_io_if_excep_pc; // @[cpu.scala 28:22:@3100.4]
  wire  insd_io_if_excep_inst_valid; // @[cpu.scala 28:22:@3100.4]
  wire  insd_io_ex_excep_valid; // @[cpu.scala 28:22:@3100.4]
  wire [63:0] insd_io_ex_excep_code; // @[cpu.scala 28:22:@3100.4]
  wire [63:0] insd_io_ex_excep_value; // @[cpu.scala 28:22:@3100.4]
  wire [63:0] insd_io_ex_excep_pc; // @[cpu.scala 28:22:@3100.4]
  wire  insd_io_ex_excep_inst_valid; // @[cpu.scala 28:22:@3100.4]
  wire  insd_io_mul_div_ins; // @[cpu.scala 28:22:@3100.4]
  wire [63:0] exec_io_imm; // @[cpu.scala 29:22:@3103.4]
  wire [3:0] exec_io_ALUOp; // @[cpu.scala 29:22:@3103.4]
  wire [63:0] exec_io_pc; // @[cpu.scala 29:22:@3103.4]
  wire [3:0] exec_io_exe_type; // @[cpu.scala 29:22:@3103.4]
  wire  exec_io_op32; // @[cpu.scala 29:22:@3103.4]
  wire  exec_io_dreg_rs2_valid; // @[cpu.scala 29:22:@3103.4]
  wire [63:0] exec_io_dreg_rs1_value; // @[cpu.scala 29:22:@3103.4]
  wire [63:0] exec_io_dreg_rs2_value; // @[cpu.scala 29:22:@3103.4]
  wire  exec_io_dreg_rd_valid; // @[cpu.scala 29:22:@3103.4]
  wire [4:0] exec_io_dreg_rd_index; // @[cpu.scala 29:22:@3103.4]
  wire  exec_io_nls; // @[cpu.scala 29:22:@3103.4]
  wire [63:0] exec_io_addr; // @[cpu.scala 29:22:@3103.4]
  wire [63:0] exec_io_data; // @[cpu.scala 29:22:@3103.4]
  wire  exec_io_jump; // @[cpu.scala 29:22:@3103.4]
  wire [63:0] exec_io_jdest; // @[cpu.scala 29:22:@3103.4]
  wire  exec_io_wreg_wbrv; // @[cpu.scala 29:22:@3103.4]
  wire [4:0] exec_io_wreg_wbri; // @[cpu.scala 29:22:@3103.4]
  wire [63:0] exec_io_wreg_wbrd; // @[cpu.scala 29:22:@3103.4]
  wire  exec_io_wcsr_valid; // @[cpu.scala 29:22:@3103.4]
  wire [11:0] exec_io_wcsr_csr_idx; // @[cpu.scala 29:22:@3103.4]
  wire [63:0] exec_io_wcsr_csr_data; // @[cpu.scala 29:22:@3103.4]
  wire  exec_io_csr_op_valid; // @[cpu.scala 29:22:@3103.4]
  wire [11:0] exec_io_csr_op_csr_idx; // @[cpu.scala 29:22:@3103.4]
  wire [63:0] exec_io_csr_op_csr_data; // @[cpu.scala 29:22:@3103.4]
  wire  exec_io_id_excep_valid; // @[cpu.scala 29:22:@3103.4]
  wire [63:0] exec_io_id_excep_code; // @[cpu.scala 29:22:@3103.4]
  wire [63:0] exec_io_id_excep_value; // @[cpu.scala 29:22:@3103.4]
  wire [63:0] exec_io_id_excep_pc; // @[cpu.scala 29:22:@3103.4]
  wire  exec_io_id_excep_inst_valid; // @[cpu.scala 29:22:@3103.4]
  wire  exec_io_mem_excep_valid; // @[cpu.scala 29:22:@3103.4]
  wire [63:0] exec_io_mem_excep_code; // @[cpu.scala 29:22:@3103.4]
  wire [63:0] exec_io_mem_excep_value; // @[cpu.scala 29:22:@3103.4]
  wire [63:0] exec_io_mem_excep_pc; // @[cpu.scala 29:22:@3103.4]
  wire  exec_io_mem_excep_inst_valid; // @[cpu.scala 29:22:@3103.4]
  wire  memc_io_nls; // @[cpu.scala 30:22:@3106.4]
  wire [3:0] memc_io_lsm; // @[cpu.scala 30:22:@3106.4]
  wire [63:0] memc_io_addr; // @[cpu.scala 30:22:@3106.4]
  wire [63:0] memc_io_data; // @[cpu.scala 30:22:@3106.4]
  wire  memc_io_ready; // @[cpu.scala 30:22:@3106.4]
  wire  memc_io_ereg_wbrv; // @[cpu.scala 30:22:@3106.4]
  wire [4:0] memc_io_ereg_wbri; // @[cpu.scala 30:22:@3106.4]
  wire [63:0] memc_io_ereg_wbrd; // @[cpu.scala 30:22:@3106.4]
  wire  memc_io_wreg_wbrv; // @[cpu.scala 30:22:@3106.4]
  wire [4:0] memc_io_wreg_wbri; // @[cpu.scala 30:22:@3106.4]
  wire [63:0] memc_io_wreg_wbrd; // @[cpu.scala 30:22:@3106.4]
  wire [3:0] memc_io_mem_mode; // @[cpu.scala 30:22:@3106.4]
  wire  memc_io_mem_ready; // @[cpu.scala 30:22:@3106.4]
  wire [63:0] memc_io_mem_addr; // @[cpu.scala 30:22:@3106.4]
  wire [63:0] memc_io_mem_rdata; // @[cpu.scala 30:22:@3106.4]
  wire [63:0] memc_io_mem_wdata; // @[cpu.scala 30:22:@3106.4]
  wire  memc_io_excep_valid; // @[cpu.scala 30:22:@3106.4]
  wire [63:0] memc_io_excep_code; // @[cpu.scala 30:22:@3106.4]
  wire [63:0] memc_io_excep_value; // @[cpu.scala 30:22:@3106.4]
  wire [63:0] memc_io_excep_pc; // @[cpu.scala 30:22:@3106.4]
  wire  memc_io_excep_inst_valid; // @[cpu.scala 30:22:@3106.4]
  wire  memc_io_csr_wb_valid; // @[cpu.scala 30:22:@3106.4]
  wire [11:0] memc_io_csr_wb_csr_idx; // @[cpu.scala 30:22:@3106.4]
  wire [63:0] memc_io_csr_wb_csr_data; // @[cpu.scala 30:22:@3106.4]
  wire  memc_io_csr_wrCSROp_valid; // @[cpu.scala 30:22:@3106.4]
  wire [11:0] memc_io_csr_wrCSROp_csr_idx; // @[cpu.scala 30:22:@3106.4]
  wire [63:0] memc_io_csr_wrCSROp_csr_data; // @[cpu.scala 30:22:@3106.4]
  wire  memc_io_csr_excep_valid; // @[cpu.scala 30:22:@3106.4]
  wire [63:0] memc_io_csr_excep_code; // @[cpu.scala 30:22:@3106.4]
  wire [63:0] memc_io_csr_excep_value; // @[cpu.scala 30:22:@3106.4]
  wire [63:0] memc_io_csr_excep_pc; // @[cpu.scala 30:22:@3106.4]
  wire  memc_io_csr_excep_inst_valid; // @[cpu.scala 30:22:@3106.4]
  wire  memc_io_inter_valid; // @[cpu.scala 30:22:@3106.4]
  wire [63:0] memc_io_inter_bits; // @[cpu.scala 30:22:@3106.4]
  wire  wrbk_io_wreg_wbrv; // @[cpu.scala 31:22:@3109.4]
  wire [4:0] wrbk_io_wreg_wbri; // @[cpu.scala 31:22:@3109.4]
  wire [63:0] wrbk_io_wreg_wbrd; // @[cpu.scala 31:22:@3109.4]
  wire  wrbk_io_reg_wen; // @[cpu.scala 31:22:@3109.4]
  wire [4:0] wrbk_io_reg_w; // @[cpu.scala 31:22:@3109.4]
  wire [63:0] wrbk_io_reg_wd; // @[cpu.scala 31:22:@3109.4]
  wire  regc_clock; // @[cpu.scala 32:22:@3112.4]
  wire [4:0] regc_io_r_r1; // @[cpu.scala 32:22:@3112.4]
  wire [4:0] regc_io_r_r2; // @[cpu.scala 32:22:@3112.4]
  wire [63:0] regc_io_r_r1d; // @[cpu.scala 32:22:@3112.4]
  wire [63:0] regc_io_r_r2d; // @[cpu.scala 32:22:@3112.4]
  wire  regc_io_w_wen; // @[cpu.scala 32:22:@3112.4]
  wire [4:0] regc_io_w_w; // @[cpu.scala 32:22:@3112.4]
  wire [63:0] regc_io_w_wd; // @[cpu.scala 32:22:@3112.4]
  wire  regc_io_pass; // @[cpu.scala 32:22:@3112.4]
  wire  mmu_clock; // @[cpu.scala 33:22:@3115.4]
  wire  mmu_reset; // @[cpu.scala 33:22:@3115.4]
  wire [3:0] mmu_io_mem_mode; // @[cpu.scala 33:22:@3115.4]
  wire  mmu_io_mem_ready; // @[cpu.scala 33:22:@3115.4]
  wire [63:0] mmu_io_mem_addr; // @[cpu.scala 33:22:@3115.4]
  wire [63:0] mmu_io_mem_rdata; // @[cpu.scala 33:22:@3115.4]
  wire [63:0] mmu_io_mem_wdata; // @[cpu.scala 33:22:@3115.4]
  wire [3:0] mmu_io_insr_mode; // @[cpu.scala 33:22:@3115.4]
  wire  mmu_io_insr_ready; // @[cpu.scala 33:22:@3115.4]
  wire [63:0] mmu_io_insr_addr; // @[cpu.scala 33:22:@3115.4]
  wire [63:0] mmu_io_insr_rdata; // @[cpu.scala 33:22:@3115.4]
  wire  mmu_io_insr_rst; // @[cpu.scala 33:22:@3115.4]
  wire [63:0] mmu_io_csr_satp; // @[cpu.scala 33:22:@3115.4]
  wire [1:0] mmu_io_csr_priv; // @[cpu.scala 33:22:@3115.4]
  wire  mmu_io_csr_mxr; // @[cpu.scala 33:22:@3115.4]
  wire  mmu_io_csr_sum; // @[cpu.scala 33:22:@3115.4]
  wire [3:0] mmu_io_if_iom_mode; // @[cpu.scala 33:22:@3115.4]
  wire  mmu_io_if_iom_ready; // @[cpu.scala 33:22:@3115.4]
  wire [63:0] mmu_io_if_iom_addr; // @[cpu.scala 33:22:@3115.4]
  wire [63:0] mmu_io_if_iom_rdata; // @[cpu.scala 33:22:@3115.4]
  wire [3:0] mmu_io_mem_iom_mode; // @[cpu.scala 33:22:@3115.4]
  wire  mmu_io_mem_iom_ready; // @[cpu.scala 33:22:@3115.4]
  wire [63:0] mmu_io_mem_iom_addr; // @[cpu.scala 33:22:@3115.4]
  wire [63:0] mmu_io_mem_iom_rdata; // @[cpu.scala 33:22:@3115.4]
  wire [63:0] mmu_io_mem_iom_wdata; // @[cpu.scala 33:22:@3115.4]
  wire  iomn_clock; // @[cpu.scala 34:22:@3118.4]
  wire  iomn_reset; // @[cpu.scala 34:22:@3118.4]
  wire [3:0] iomn_io_mem_if_mode; // @[cpu.scala 34:22:@3118.4]
  wire  iomn_io_mem_if_ready; // @[cpu.scala 34:22:@3118.4]
  wire [63:0] iomn_io_mem_if_addr; // @[cpu.scala 34:22:@3118.4]
  wire [63:0] iomn_io_mem_if_rdata; // @[cpu.scala 34:22:@3118.4]
  wire [3:0] iomn_io_mem_mem_mode; // @[cpu.scala 34:22:@3118.4]
  wire  iomn_io_mem_mem_ready; // @[cpu.scala 34:22:@3118.4]
  wire [63:0] iomn_io_mem_mem_addr; // @[cpu.scala 34:22:@3118.4]
  wire [63:0] iomn_io_mem_mem_rdata; // @[cpu.scala 34:22:@3118.4]
  wire [63:0] iomn_io_mem_mem_wdata; // @[cpu.scala 34:22:@3118.4]
  wire [3:0] iomn_io_mem_out_mode; // @[cpu.scala 34:22:@3118.4]
  wire  iomn_io_mem_out_ready; // @[cpu.scala 34:22:@3118.4]
  wire [63:0] iomn_io_mem_out_addr; // @[cpu.scala 34:22:@3118.4]
  wire [63:0] iomn_io_mem_out_rdata; // @[cpu.scala 34:22:@3118.4]
  wire [63:0] iomn_io_mem_out_wdata; // @[cpu.scala 34:22:@3118.4]
  wire [3:0] iomn_io_serial_out_mode; // @[cpu.scala 34:22:@3118.4]
  wire  iomn_io_serial_out_ready; // @[cpu.scala 34:22:@3118.4]
  wire [63:0] iomn_io_serial_out_addr; // @[cpu.scala 34:22:@3118.4]
  wire [63:0] iomn_io_serial_out_rdata; // @[cpu.scala 34:22:@3118.4]
  wire [63:0] iomn_io_serial_out_wdata; // @[cpu.scala 34:22:@3118.4]
  wire [1:0] iomn_io_debug_if_wait; // @[cpu.scala 34:22:@3118.4]
  wire [1:0] iomn_io_debug_mem_wait; // @[cpu.scala 34:22:@3118.4]
  wire  iomn_io_debug_if_ready; // @[cpu.scala 34:22:@3118.4]
  wire  iomn_io_debug_mem_ready; // @[cpu.scala 34:22:@3118.4]
  wire [3:0] iomn_io_debug_if_mode; // @[cpu.scala 34:22:@3118.4]
  wire [3:0] iomn_io_debug_mem_mode; // @[cpu.scala 34:22:@3118.4]
  wire [63:0] iomn_io_debug_if_addr; // @[cpu.scala 34:22:@3118.4]
  wire [63:0] iomn_io_debug_mem_addr; // @[cpu.scala 34:22:@3118.4]
  wire  iomn_io_debug_if_error; // @[cpu.scala 34:22:@3118.4]
  wire  iomn_io_debug_mem_error; // @[cpu.scala 34:22:@3118.4]
  wire  if_id_clock; // @[cpu.scala 35:24:@3121.4]
  wire  if_id_reset; // @[cpu.scala 35:24:@3121.4]
  wire  if_id_io_en; // @[cpu.scala 35:24:@3121.4]
  wire  if_id_io_pass; // @[cpu.scala 35:24:@3121.4]
  wire  if_id_io_flush; // @[cpu.scala 35:24:@3121.4]
  wire [31:0] if_id_io_insi; // @[cpu.scala 35:24:@3121.4]
  wire [63:0] if_id_io_pci; // @[cpu.scala 35:24:@3121.4]
  wire [63:0] if_id_io_insci; // @[cpu.scala 35:24:@3121.4]
  wire [63:0] if_id_io_icdi; // @[cpu.scala 35:24:@3121.4]
  wire  if_id_io_lastloadin_valid; // @[cpu.scala 35:24:@3121.4]
  wire [4:0] if_id_io_lastloadin_index; // @[cpu.scala 35:24:@3121.4]
  wire [63:0] if_id_io_excep_i_pc; // @[cpu.scala 35:24:@3121.4]
  wire  if_id_io_excep_i_inst_valid; // @[cpu.scala 35:24:@3121.4]
  wire [31:0] if_id_io_inso; // @[cpu.scala 35:24:@3121.4]
  wire [63:0] if_id_io_pco; // @[cpu.scala 35:24:@3121.4]
  wire [63:0] if_id_io_insco; // @[cpu.scala 35:24:@3121.4]
  wire [63:0] if_id_io_icdo; // @[cpu.scala 35:24:@3121.4]
  wire  if_id_io_lastloadout_valid; // @[cpu.scala 35:24:@3121.4]
  wire [4:0] if_id_io_lastloadout_index; // @[cpu.scala 35:24:@3121.4]
  wire  if_id_io_excep_o_valid; // @[cpu.scala 35:24:@3121.4]
  wire [63:0] if_id_io_excep_o_code; // @[cpu.scala 35:24:@3121.4]
  wire [63:0] if_id_io_excep_o_value; // @[cpu.scala 35:24:@3121.4]
  wire [63:0] if_id_io_excep_o_pc; // @[cpu.scala 35:24:@3121.4]
  wire  if_id_io_excep_o_inst_valid; // @[cpu.scala 35:24:@3121.4]
  wire  id_ex_clock; // @[cpu.scala 36:24:@3124.4]
  wire  id_ex_reset; // @[cpu.scala 36:24:@3124.4]
  wire  id_ex_io_en; // @[cpu.scala 36:24:@3124.4]
  wire  id_ex_io_bid; // @[cpu.scala 36:24:@3124.4]
  wire  id_ex_io_bex; // @[cpu.scala 36:24:@3124.4]
  wire  id_ex_io_flush; // @[cpu.scala 36:24:@3124.4]
  wire  id_ex_io_pass; // @[cpu.scala 36:24:@3124.4]
  wire [63:0] id_ex_io_immi; // @[cpu.scala 36:24:@3124.4]
  wire [4:0] id_ex_io_ALUOpi; // @[cpu.scala 36:24:@3124.4]
  wire [3:0] id_ex_io_exeti; // @[cpu.scala 36:24:@3124.4]
  wire [63:0] id_ex_io_pci; // @[cpu.scala 36:24:@3124.4]
  wire [3:0] id_ex_io_lsmi; // @[cpu.scala 36:24:@3124.4]
  wire  id_ex_io_op32i; // @[cpu.scala 36:24:@3124.4]
  wire  id_ex_io_csr_wb_i_valid; // @[cpu.scala 36:24:@3124.4]
  wire [11:0] id_ex_io_csr_wb_i_csr_idx; // @[cpu.scala 36:24:@3124.4]
  wire [63:0] id_ex_io_csr_wb_i_csr_data; // @[cpu.scala 36:24:@3124.4]
  wire  id_ex_io_dregi_rs2_valid; // @[cpu.scala 36:24:@3124.4]
  wire [63:0] id_ex_io_dregi_rs1_value; // @[cpu.scala 36:24:@3124.4]
  wire [63:0] id_ex_io_dregi_rs2_value; // @[cpu.scala 36:24:@3124.4]
  wire  id_ex_io_dregi_rd_valid; // @[cpu.scala 36:24:@3124.4]
  wire [4:0] id_ex_io_dregi_rd_index; // @[cpu.scala 36:24:@3124.4]
  wire  id_ex_io_excep_i_valid; // @[cpu.scala 36:24:@3124.4]
  wire [63:0] id_ex_io_excep_i_code; // @[cpu.scala 36:24:@3124.4]
  wire [63:0] id_ex_io_excep_i_value; // @[cpu.scala 36:24:@3124.4]
  wire [63:0] id_ex_io_excep_i_pc; // @[cpu.scala 36:24:@3124.4]
  wire  id_ex_io_excep_i_inst_valid; // @[cpu.scala 36:24:@3124.4]
  wire  id_ex_io_mul_div_i; // @[cpu.scala 36:24:@3124.4]
  wire [63:0] id_ex_io_immo; // @[cpu.scala 36:24:@3124.4]
  wire [4:0] id_ex_io_ALUOpo; // @[cpu.scala 36:24:@3124.4]
  wire [3:0] id_ex_io_exeto; // @[cpu.scala 36:24:@3124.4]
  wire [63:0] id_ex_io_pco; // @[cpu.scala 36:24:@3124.4]
  wire [3:0] id_ex_io_lsmo; // @[cpu.scala 36:24:@3124.4]
  wire  id_ex_io_op32o; // @[cpu.scala 36:24:@3124.4]
  wire  id_ex_io_csr_wb_o_valid; // @[cpu.scala 36:24:@3124.4]
  wire [11:0] id_ex_io_csr_wb_o_csr_idx; // @[cpu.scala 36:24:@3124.4]
  wire [63:0] id_ex_io_csr_wb_o_csr_data; // @[cpu.scala 36:24:@3124.4]
  wire  id_ex_io_drego_rs2_valid; // @[cpu.scala 36:24:@3124.4]
  wire [63:0] id_ex_io_drego_rs1_value; // @[cpu.scala 36:24:@3124.4]
  wire [63:0] id_ex_io_drego_rs2_value; // @[cpu.scala 36:24:@3124.4]
  wire  id_ex_io_drego_rd_valid; // @[cpu.scala 36:24:@3124.4]
  wire [4:0] id_ex_io_drego_rd_index; // @[cpu.scala 36:24:@3124.4]
  wire  id_ex_io_excep_o_valid; // @[cpu.scala 36:24:@3124.4]
  wire [63:0] id_ex_io_excep_o_code; // @[cpu.scala 36:24:@3124.4]
  wire [63:0] id_ex_io_excep_o_value; // @[cpu.scala 36:24:@3124.4]
  wire [63:0] id_ex_io_excep_o_pc; // @[cpu.scala 36:24:@3124.4]
  wire  id_ex_io_excep_o_inst_valid; // @[cpu.scala 36:24:@3124.4]
  wire  id_ex_io_ready; // @[cpu.scala 36:24:@3124.4]
  wire  ex_mem_clock; // @[cpu.scala 37:24:@3127.4]
  wire  ex_mem_reset; // @[cpu.scala 37:24:@3127.4]
  wire  ex_mem_io_en; // @[cpu.scala 37:24:@3127.4]
  wire  ex_mem_io_pass; // @[cpu.scala 37:24:@3127.4]
  wire  ex_mem_io_flush; // @[cpu.scala 37:24:@3127.4]
  wire  ex_mem_io_nlsi; // @[cpu.scala 37:24:@3127.4]
  wire [3:0] ex_mem_io_lsmi; // @[cpu.scala 37:24:@3127.4]
  wire [63:0] ex_mem_io_addri; // @[cpu.scala 37:24:@3127.4]
  wire [63:0] ex_mem_io_datai; // @[cpu.scala 37:24:@3127.4]
  wire  ex_mem_io_wregi_wbrv; // @[cpu.scala 37:24:@3127.4]
  wire [4:0] ex_mem_io_wregi_wbri; // @[cpu.scala 37:24:@3127.4]
  wire [63:0] ex_mem_io_wregi_wbrd; // @[cpu.scala 37:24:@3127.4]
  wire  ex_mem_io_csr_wb_i_valid; // @[cpu.scala 37:24:@3127.4]
  wire [11:0] ex_mem_io_csr_wb_i_csr_idx; // @[cpu.scala 37:24:@3127.4]
  wire [63:0] ex_mem_io_csr_wb_i_csr_data; // @[cpu.scala 37:24:@3127.4]
  wire  ex_mem_io_excep_i_valid; // @[cpu.scala 37:24:@3127.4]
  wire [63:0] ex_mem_io_excep_i_code; // @[cpu.scala 37:24:@3127.4]
  wire [63:0] ex_mem_io_excep_i_value; // @[cpu.scala 37:24:@3127.4]
  wire [63:0] ex_mem_io_excep_i_pc; // @[cpu.scala 37:24:@3127.4]
  wire  ex_mem_io_excep_i_inst_valid; // @[cpu.scala 37:24:@3127.4]
  wire  ex_mem_io_inter_i_valid; // @[cpu.scala 37:24:@3127.4]
  wire [63:0] ex_mem_io_inter_i_bits; // @[cpu.scala 37:24:@3127.4]
  wire  ex_mem_io_nlso; // @[cpu.scala 37:24:@3127.4]
  wire [3:0] ex_mem_io_lsmo; // @[cpu.scala 37:24:@3127.4]
  wire [63:0] ex_mem_io_addro; // @[cpu.scala 37:24:@3127.4]
  wire [63:0] ex_mem_io_datao; // @[cpu.scala 37:24:@3127.4]
  wire  ex_mem_io_wrego_wbrv; // @[cpu.scala 37:24:@3127.4]
  wire [4:0] ex_mem_io_wrego_wbri; // @[cpu.scala 37:24:@3127.4]
  wire [63:0] ex_mem_io_wrego_wbrd; // @[cpu.scala 37:24:@3127.4]
  wire  ex_mem_io_csr_wb_o_valid; // @[cpu.scala 37:24:@3127.4]
  wire [11:0] ex_mem_io_csr_wb_o_csr_idx; // @[cpu.scala 37:24:@3127.4]
  wire [63:0] ex_mem_io_csr_wb_o_csr_data; // @[cpu.scala 37:24:@3127.4]
  wire  ex_mem_io_excep_o_valid; // @[cpu.scala 37:24:@3127.4]
  wire [63:0] ex_mem_io_excep_o_code; // @[cpu.scala 37:24:@3127.4]
  wire [63:0] ex_mem_io_excep_o_value; // @[cpu.scala 37:24:@3127.4]
  wire [63:0] ex_mem_io_excep_o_pc; // @[cpu.scala 37:24:@3127.4]
  wire  ex_mem_io_excep_o_inst_valid; // @[cpu.scala 37:24:@3127.4]
  wire  ex_mem_io_inter_o_valid; // @[cpu.scala 37:24:@3127.4]
  wire [63:0] ex_mem_io_inter_o_bits; // @[cpu.scala 37:24:@3127.4]
  wire  mem_wb_clock; // @[cpu.scala 38:24:@3130.4]
  wire  mem_wb_reset; // @[cpu.scala 38:24:@3130.4]
  wire  mem_wb_io_en; // @[cpu.scala 38:24:@3130.4]
  wire  mem_wb_io_pass; // @[cpu.scala 38:24:@3130.4]
  wire  mem_wb_io_wregi_wbrv; // @[cpu.scala 38:24:@3130.4]
  wire [4:0] mem_wb_io_wregi_wbri; // @[cpu.scala 38:24:@3130.4]
  wire [63:0] mem_wb_io_wregi_wbrd; // @[cpu.scala 38:24:@3130.4]
  wire  mem_wb_io_wrego_wbrv; // @[cpu.scala 38:24:@3130.4]
  wire [4:0] mem_wb_io_wrego_wbri; // @[cpu.scala 38:24:@3130.4]
  wire [63:0] mem_wb_io_wrego_wbrd; // @[cpu.scala 38:24:@3130.4]
  wire  csr_clock; // @[cpu.scala 39:24:@3133.4]
  wire  csr_reset; // @[cpu.scala 39:24:@3133.4]
  wire [11:0] csr_io_id_addr; // @[cpu.scala 39:24:@3133.4]
  wire [63:0] csr_io_id_rdata; // @[cpu.scala 39:24:@3133.4]
  wire [1:0] csr_io_id_priv; // @[cpu.scala 39:24:@3133.4]
  wire  csr_io_mem_wrCSROp_valid; // @[cpu.scala 39:24:@3133.4]
  wire [11:0] csr_io_mem_wrCSROp_csr_idx; // @[cpu.scala 39:24:@3133.4]
  wire [63:0] csr_io_mem_wrCSROp_csr_data; // @[cpu.scala 39:24:@3133.4]
  wire  csr_io_mem_excep_valid; // @[cpu.scala 39:24:@3133.4]
  wire [63:0] csr_io_mem_excep_code; // @[cpu.scala 39:24:@3133.4]
  wire [63:0] csr_io_mem_excep_value; // @[cpu.scala 39:24:@3133.4]
  wire [63:0] csr_io_mem_excep_pc; // @[cpu.scala 39:24:@3133.4]
  wire  csr_io_mem_excep_inst_valid; // @[cpu.scala 39:24:@3133.4]
  wire [63:0] csr_io_mmu_satp; // @[cpu.scala 39:24:@3133.4]
  wire [1:0] csr_io_mmu_priv; // @[cpu.scala 39:24:@3133.4]
  wire  csr_io_mmu_mxr; // @[cpu.scala 39:24:@3133.4]
  wire  csr_io_mmu_sum; // @[cpu.scala 39:24:@3133.4]
  wire  csr_io_flush; // @[cpu.scala 39:24:@3133.4]
  wire [63:0] csr_io_csrNewPc; // @[cpu.scala 39:24:@3133.4]
  wire  csr_io_inter_valid; // @[cpu.scala 39:24:@3133.4]
  wire [63:0] csr_io_inter_bits; // @[cpu.scala 39:24:@3133.4]
  InsReader insr ( // @[cpu.scala 27:22:@3097.4]
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
    .io_mmu_if_rst(insr_io_mmu_if_rst),
    .io_excep_pc(insr_io_excep_pc),
    .io_excep_inst_valid(insr_io_excep_inst_valid)
  );
  Decoder insd ( // @[cpu.scala 28:22:@3100.4]
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
    .io_if_excep_valid(insd_io_if_excep_valid),
    .io_if_excep_code(insd_io_if_excep_code),
    .io_if_excep_value(insd_io_if_excep_value),
    .io_if_excep_pc(insd_io_if_excep_pc),
    .io_if_excep_inst_valid(insd_io_if_excep_inst_valid),
    .io_ex_excep_valid(insd_io_ex_excep_valid),
    .io_ex_excep_code(insd_io_ex_excep_code),
    .io_ex_excep_value(insd_io_ex_excep_value),
    .io_ex_excep_pc(insd_io_ex_excep_pc),
    .io_ex_excep_inst_valid(insd_io_ex_excep_inst_valid),
    .io_mul_div_ins(insd_io_mul_div_ins)
  );
  Execute exec ( // @[cpu.scala 29:22:@3103.4]
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
    .io_id_excep_inst_valid(exec_io_id_excep_inst_valid),
    .io_mem_excep_valid(exec_io_mem_excep_valid),
    .io_mem_excep_code(exec_io_mem_excep_code),
    .io_mem_excep_value(exec_io_mem_excep_value),
    .io_mem_excep_pc(exec_io_mem_excep_pc),
    .io_mem_excep_inst_valid(exec_io_mem_excep_inst_valid)
  );
  MemoryCtrl memc ( // @[cpu.scala 30:22:@3106.4]
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
    .io_excep_inst_valid(memc_io_excep_inst_valid),
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
    .io_csr_excep_inst_valid(memc_io_csr_excep_inst_valid),
    .io_inter_valid(memc_io_inter_valid),
    .io_inter_bits(memc_io_inter_bits)
  );
  WriteBack wrbk ( // @[cpu.scala 31:22:@3109.4]
    .io_wreg_wbrv(wrbk_io_wreg_wbrv),
    .io_wreg_wbri(wrbk_io_wreg_wbri),
    .io_wreg_wbrd(wrbk_io_wreg_wbrd),
    .io_reg_wen(wrbk_io_reg_wen),
    .io_reg_w(wrbk_io_reg_w),
    .io_reg_wd(wrbk_io_reg_wd)
  );
  RegCtrl regc ( // @[cpu.scala 32:22:@3112.4]
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
  MMU mmu ( // @[cpu.scala 33:22:@3115.4]
    .clock(mmu_clock),
    .reset(mmu_reset),
    .io_mem_mode(mmu_io_mem_mode),
    .io_mem_ready(mmu_io_mem_ready),
    .io_mem_addr(mmu_io_mem_addr),
    .io_mem_rdata(mmu_io_mem_rdata),
    .io_mem_wdata(mmu_io_mem_wdata),
    .io_insr_mode(mmu_io_insr_mode),
    .io_insr_ready(mmu_io_insr_ready),
    .io_insr_addr(mmu_io_insr_addr),
    .io_insr_rdata(mmu_io_insr_rdata),
    .io_insr_rst(mmu_io_insr_rst),
    .io_csr_satp(mmu_io_csr_satp),
    .io_csr_priv(mmu_io_csr_priv),
    .io_csr_mxr(mmu_io_csr_mxr),
    .io_csr_sum(mmu_io_csr_sum),
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
  IOManager iomn ( // @[cpu.scala 34:22:@3118.4]
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
    .io_serial_out_wdata(iomn_io_serial_out_wdata),
    .io_debug_if_wait(iomn_io_debug_if_wait),
    .io_debug_mem_wait(iomn_io_debug_mem_wait),
    .io_debug_if_ready(iomn_io_debug_if_ready),
    .io_debug_mem_ready(iomn_io_debug_mem_ready),
    .io_debug_if_mode(iomn_io_debug_if_mode),
    .io_debug_mem_mode(iomn_io_debug_mem_mode),
    .io_debug_if_addr(iomn_io_debug_if_addr),
    .io_debug_mem_addr(iomn_io_debug_mem_addr),
    .io_debug_if_error(iomn_io_debug_if_error),
    .io_debug_mem_error(iomn_io_debug_mem_error)
  );
  IF_ID if_id ( // @[cpu.scala 35:24:@3121.4]
    .clock(if_id_clock),
    .reset(if_id_reset),
    .io_en(if_id_io_en),
    .io_pass(if_id_io_pass),
    .io_flush(if_id_io_flush),
    .io_insi(if_id_io_insi),
    .io_pci(if_id_io_pci),
    .io_insci(if_id_io_insci),
    .io_icdi(if_id_io_icdi),
    .io_lastloadin_valid(if_id_io_lastloadin_valid),
    .io_lastloadin_index(if_id_io_lastloadin_index),
    .io_excep_i_pc(if_id_io_excep_i_pc),
    .io_excep_i_inst_valid(if_id_io_excep_i_inst_valid),
    .io_inso(if_id_io_inso),
    .io_pco(if_id_io_pco),
    .io_insco(if_id_io_insco),
    .io_icdo(if_id_io_icdo),
    .io_lastloadout_valid(if_id_io_lastloadout_valid),
    .io_lastloadout_index(if_id_io_lastloadout_index),
    .io_excep_o_valid(if_id_io_excep_o_valid),
    .io_excep_o_code(if_id_io_excep_o_code),
    .io_excep_o_value(if_id_io_excep_o_value),
    .io_excep_o_pc(if_id_io_excep_o_pc),
    .io_excep_o_inst_valid(if_id_io_excep_o_inst_valid)
  );
  ID_EX id_ex ( // @[cpu.scala 36:24:@3124.4]
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
    .io_excep_i_inst_valid(id_ex_io_excep_i_inst_valid),
    .io_mul_div_i(id_ex_io_mul_div_i),
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
    .io_excep_o_pc(id_ex_io_excep_o_pc),
    .io_excep_o_inst_valid(id_ex_io_excep_o_inst_valid),
    .io_ready(id_ex_io_ready)
  );
  EX_MEM ex_mem ( // @[cpu.scala 37:24:@3127.4]
    .clock(ex_mem_clock),
    .reset(ex_mem_reset),
    .io_en(ex_mem_io_en),
    .io_pass(ex_mem_io_pass),
    .io_flush(ex_mem_io_flush),
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
    .io_excep_i_inst_valid(ex_mem_io_excep_i_inst_valid),
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
    .io_excep_o_inst_valid(ex_mem_io_excep_o_inst_valid),
    .io_inter_o_valid(ex_mem_io_inter_o_valid),
    .io_inter_o_bits(ex_mem_io_inter_o_bits)
  );
  MEM_WB mem_wb ( // @[cpu.scala 38:24:@3130.4]
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
  CSR csr ( // @[cpu.scala 39:24:@3133.4]
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
    .io_mem_excep_inst_valid(csr_io_mem_excep_inst_valid),
    .io_mmu_satp(csr_io_mmu_satp),
    .io_mmu_priv(csr_io_mmu_priv),
    .io_mmu_mxr(csr_io_mmu_mxr),
    .io_mmu_sum(csr_io_mmu_sum),
    .io_flush(csr_io_flush),
    .io_csrNewPc(csr_io_csrNewPc),
    .io_inter_valid(csr_io_inter_valid),
    .io_inter_bits(csr_io_inter_bits)
  );
  assign io_debug_pc = if_id_io_pco; // @[cpu.scala 42:20:@3136.4]
  assign io_debug_ins = if_id_io_inso; // @[cpu.scala 43:20:@3137.4]
  assign io_debug_if_wait = iomn_io_debug_if_wait; // @[cpu.scala 44:22:@3138.4]
  assign io_debug_mem_wait = iomn_io_debug_mem_wait; // @[cpu.scala 48:33:@3142.4]
  assign io_debug_if_ready = iomn_io_debug_if_ready; // @[cpu.scala 45:33:@3139.4]
  assign io_debug_mem_ready = iomn_io_debug_mem_ready; // @[cpu.scala 49:34:@3143.4]
  assign io_debug_if_mode = iomn_io_debug_if_mode; // @[cpu.scala 46:31:@3140.4]
  assign io_debug_mem_mode = iomn_io_debug_mem_mode; // @[cpu.scala 50:32:@3144.4]
  assign io_debug_if_addr = iomn_io_debug_if_addr; // @[cpu.scala 47:31:@3141.4]
  assign io_debug_mem_addr = iomn_io_debug_mem_addr; // @[cpu.scala 51:32:@3145.4]
  assign io_debug_if_error = iomn_io_debug_if_error; // @[cpu.scala 52:32:@3146.4]
  assign io_debug_mem_error = iomn_io_debug_mem_error; // @[cpu.scala 53:33:@3147.4]
  assign io_mem_mode = iomn_io_mem_out_mode; // @[cpu.scala 61:20:@3175.4]
  assign io_mem_addr = iomn_io_mem_out_addr; // @[cpu.scala 61:20:@3173.4]
  assign io_mem_wdata = iomn_io_mem_out_wdata; // @[cpu.scala 61:20:@3171.4]
  assign io_serial_mode = iomn_io_serial_out_mode; // @[cpu.scala 62:20:@3180.4]
  assign io_serial_addr = iomn_io_serial_out_addr; // @[cpu.scala 62:20:@3178.4]
  assign io_serial_wdata = iomn_io_serial_out_wdata; // @[cpu.scala 62:20:@3176.4]
  assign insr_io_jump = csr_io_flush | exec_io_jump; // @[cpu.scala 75:20:@3200.4]
  assign insr_io_jdest = csr_io_flush ? csr_io_csrNewPc : exec_io_jdest; // @[cpu.scala 76:20:@3202.4]
  assign insr_io_nls = ex_mem_io_nlso; // @[cpu.scala 77:20:@3203.4]
  assign insr_io_lpc = if_id_io_pco; // @[cpu.scala 96:20:@3224.4]
  assign insr_io_insp = if_id_io_insco; // @[cpu.scala 98:20:@3226.4]
  assign insr_io_inspd = if_id_io_icdo; // @[cpu.scala 99:20:@3227.4]
  assign insr_io_bubble = insd_io_bubble; // @[cpu.scala 78:20:@3204.4]
  assign insr_io_mmu_ready = mmu_io_insr_ready; // @[cpu.scala 56:20:@3152.4]
  assign insr_io_mmu_rdata = mmu_io_insr_rdata; // @[cpu.scala 56:20:@3150.4]
  assign insd_io_ins = if_id_io_inso; // @[cpu.scala 97:20:@3225.4]
  assign insd_io_lastload_valid = if_id_io_lastloadout_valid; // @[cpu.scala 100:26:@3229.4]
  assign insd_io_lastload_index = if_id_io_lastloadout_index; // @[cpu.scala 100:26:@3228.4]
  assign insd_io_regr_r1d = regc_io_r_r1d; // @[cpu.scala 67:19:@3187.4]
  assign insd_io_regr_r2d = regc_io_r_r2d; // @[cpu.scala 67:19:@3186.4]
  assign insd_io_csr_rdata = csr_io_id_rdata; // @[cpu.scala 158:21:@3327.4]
  assign insd_io_csr_priv = csr_io_id_priv; // @[cpu.scala 158:21:@3326.4]
  assign insd_io_csr_from_ex_valid = exec_io_wcsr_valid; // @[cpu.scala 154:25:@3322.4]
  assign insd_io_csr_from_ex_csr_idx = exec_io_wcsr_csr_idx; // @[cpu.scala 154:25:@3321.4]
  assign insd_io_csr_from_ex_csr_data = exec_io_wcsr_csr_data; // @[cpu.scala 154:25:@3320.4]
  assign insd_io_csr_from_mem_valid = ex_mem_io_csr_wb_o_valid; // @[cpu.scala 155:26:@3325.4]
  assign insd_io_csr_from_mem_csr_idx = ex_mem_io_csr_wb_o_csr_idx; // @[cpu.scala 155:26:@3324.4]
  assign insd_io_csr_from_mem_csr_data = ex_mem_io_csr_wb_o_csr_data; // @[cpu.scala 155:26:@3323.4]
  assign insd_io_exWrReg_wbrv = exec_io_wreg_wbrv; // @[cpu.scala 71:22:@3195.4]
  assign insd_io_exWrReg_wbri = exec_io_wreg_wbri; // @[cpu.scala 71:22:@3194.4]
  assign insd_io_exWrReg_wbrd = exec_io_wreg_wbrd; // @[cpu.scala 71:22:@3193.4]
  assign insd_io_memWrReg_wbrv = memc_io_wreg_wbrv; // @[cpu.scala 72:22:@3198.4]
  assign insd_io_memWrReg_wbri = memc_io_wreg_wbri; // @[cpu.scala 72:22:@3197.4]
  assign insd_io_memWrReg_wbrd = memc_io_wreg_wbrd; // @[cpu.scala 72:22:@3196.4]
  assign insd_io_if_excep_valid = if_id_io_excep_o_valid; // @[cpu.scala 101:26:@3234.4]
  assign insd_io_if_excep_code = if_id_io_excep_o_code; // @[cpu.scala 101:26:@3233.4]
  assign insd_io_if_excep_value = if_id_io_excep_o_value; // @[cpu.scala 101:26:@3232.4]
  assign insd_io_if_excep_pc = if_id_io_excep_o_pc; // @[cpu.scala 101:26:@3231.4]
  assign insd_io_if_excep_inst_valid = if_id_io_excep_o_inst_valid; // @[cpu.scala 101:26:@3230.4]
  assign exec_io_imm = id_ex_io_immo; // @[cpu.scala 119:21:@3259.4]
  assign exec_io_ALUOp = id_ex_io_ALUOpo[3:0]; // @[cpu.scala 120:21:@3260.4]
  assign exec_io_pc = id_ex_io_pco; // @[cpu.scala 122:21:@3262.4]
  assign exec_io_exe_type = id_ex_io_exeto; // @[cpu.scala 121:21:@3261.4]
  assign exec_io_op32 = id_ex_io_op32o; // @[cpu.scala 124:21:@3269.4]
  assign exec_io_dreg_rs2_valid = id_ex_io_drego_rs2_valid; // @[cpu.scala 123:21:@3267.4]
  assign exec_io_dreg_rs1_value = id_ex_io_drego_rs1_value; // @[cpu.scala 123:21:@3266.4]
  assign exec_io_dreg_rs2_value = id_ex_io_drego_rs2_value; // @[cpu.scala 123:21:@3265.4]
  assign exec_io_dreg_rd_valid = id_ex_io_drego_rd_valid; // @[cpu.scala 123:21:@3264.4]
  assign exec_io_dreg_rd_index = id_ex_io_drego_rd_index; // @[cpu.scala 123:21:@3263.4]
  assign exec_io_csr_op_valid = id_ex_io_csr_wb_o_valid; // @[cpu.scala 125:24:@3272.4]
  assign exec_io_csr_op_csr_idx = id_ex_io_csr_wb_o_csr_idx; // @[cpu.scala 125:24:@3271.4]
  assign exec_io_csr_op_csr_data = id_ex_io_csr_wb_o_csr_data; // @[cpu.scala 125:24:@3270.4]
  assign exec_io_id_excep_valid = id_ex_io_excep_o_valid; // @[cpu.scala 126:24:@3277.4]
  assign exec_io_id_excep_code = id_ex_io_excep_o_code; // @[cpu.scala 126:24:@3276.4]
  assign exec_io_id_excep_value = id_ex_io_excep_o_value; // @[cpu.scala 126:24:@3275.4]
  assign exec_io_id_excep_pc = id_ex_io_excep_o_pc; // @[cpu.scala 126:24:@3274.4]
  assign exec_io_id_excep_inst_valid = id_ex_io_excep_o_inst_valid; // @[cpu.scala 126:24:@3273.4]
  assign memc_io_nls = ex_mem_io_nlso; // @[cpu.scala 139:21:@3296.4]
  assign memc_io_lsm = ex_mem_io_lsmo; // @[cpu.scala 141:21:@3300.4]
  assign memc_io_addr = ex_mem_io_addro; // @[cpu.scala 142:21:@3301.4]
  assign memc_io_data = ex_mem_io_datao; // @[cpu.scala 143:21:@3302.4]
  assign memc_io_ereg_wbrv = ex_mem_io_wrego_wbrv; // @[cpu.scala 140:21:@3299.4]
  assign memc_io_ereg_wbri = ex_mem_io_wrego_wbri; // @[cpu.scala 140:21:@3298.4]
  assign memc_io_ereg_wbrd = ex_mem_io_wrego_wbrd; // @[cpu.scala 140:21:@3297.4]
  assign memc_io_mem_ready = mmu_io_mem_ready; // @[cpu.scala 59:20:@3164.4]
  assign memc_io_mem_rdata = mmu_io_mem_rdata; // @[cpu.scala 59:20:@3162.4]
  assign memc_io_excep_valid = ex_mem_io_excep_o_valid; // @[cpu.scala 145:24:@3310.4]
  assign memc_io_excep_code = ex_mem_io_excep_o_code; // @[cpu.scala 145:24:@3309.4]
  assign memc_io_excep_value = ex_mem_io_excep_o_value; // @[cpu.scala 145:24:@3308.4]
  assign memc_io_excep_pc = ex_mem_io_excep_o_pc; // @[cpu.scala 145:24:@3307.4]
  assign memc_io_excep_inst_valid = ex_mem_io_excep_o_inst_valid; // @[cpu.scala 145:24:@3306.4]
  assign memc_io_csr_wb_valid = ex_mem_io_csr_wb_o_valid; // @[cpu.scala 144:24:@3305.4]
  assign memc_io_csr_wb_csr_idx = ex_mem_io_csr_wb_o_csr_idx; // @[cpu.scala 144:24:@3304.4]
  assign memc_io_csr_wb_csr_data = ex_mem_io_csr_wb_o_csr_data; // @[cpu.scala 144:24:@3303.4]
  assign memc_io_inter_valid = ex_mem_io_inter_o_valid; // @[cpu.scala 146:24:@3312.4]
  assign memc_io_inter_bits = ex_mem_io_inter_o_bits; // @[cpu.scala 146:24:@3311.4]
  assign wrbk_io_wreg_wbrv = mem_wb_io_wrego_wbrv; // @[cpu.scala 151:21:@3319.4]
  assign wrbk_io_wreg_wbri = mem_wb_io_wrego_wbri; // @[cpu.scala 151:21:@3318.4]
  assign wrbk_io_wreg_wbrd = mem_wb_io_wrego_wbrd; // @[cpu.scala 151:21:@3317.4]
  assign regc_clock = clock; // @[:@3113.4]
  assign regc_io_r_r1 = insd_io_regr_r1; // @[cpu.scala 67:19:@3189.4]
  assign regc_io_r_r2 = insd_io_regr_r2; // @[cpu.scala 67:19:@3188.4]
  assign regc_io_w_wen = wrbk_io_reg_wen; // @[cpu.scala 68:19:@3192.4]
  assign regc_io_w_w = wrbk_io_reg_w; // @[cpu.scala 68:19:@3191.4]
  assign regc_io_w_wd = wrbk_io_reg_wd; // @[cpu.scala 68:19:@3190.4]
  assign regc_io_pass = memc_io_ready; // @[cpu.scala 85:20:@3211.4]
  assign mmu_clock = clock; // @[:@3116.4]
  assign mmu_reset = reset; // @[:@3117.4]
  assign mmu_io_mem_mode = memc_io_mem_mode; // @[cpu.scala 59:20:@3165.4]
  assign mmu_io_mem_addr = memc_io_mem_addr; // @[cpu.scala 59:20:@3163.4]
  assign mmu_io_mem_wdata = memc_io_mem_wdata; // @[cpu.scala 59:20:@3161.4]
  assign mmu_io_insr_mode = insr_io_mmu_mode; // @[cpu.scala 56:20:@3153.4]
  assign mmu_io_insr_addr = insr_io_mmu_addr; // @[cpu.scala 56:20:@3151.4]
  assign mmu_io_insr_rst = insr_io_mmu_if_rst; // @[cpu.scala 57:25:@3154.4]
  assign mmu_io_csr_satp = csr_io_mmu_satp; // @[cpu.scala 63:20:@3184.4]
  assign mmu_io_csr_priv = csr_io_mmu_priv; // @[cpu.scala 63:20:@3183.4]
  assign mmu_io_csr_mxr = csr_io_mmu_mxr; // @[cpu.scala 63:20:@3182.4]
  assign mmu_io_csr_sum = csr_io_mmu_sum; // @[cpu.scala 63:20:@3181.4]
  assign mmu_io_if_iom_ready = iomn_io_mem_if_ready; // @[cpu.scala 58:20:@3158.4]
  assign mmu_io_if_iom_rdata = iomn_io_mem_if_rdata; // @[cpu.scala 58:20:@3156.4]
  assign mmu_io_mem_iom_ready = iomn_io_mem_mem_ready; // @[cpu.scala 60:20:@3169.4]
  assign mmu_io_mem_iom_rdata = iomn_io_mem_mem_rdata; // @[cpu.scala 60:20:@3167.4]
  assign iomn_clock = clock; // @[:@3119.4]
  assign iomn_reset = reset; // @[:@3120.4]
  assign iomn_io_mem_if_mode = mmu_io_if_iom_mode; // @[cpu.scala 58:20:@3159.4]
  assign iomn_io_mem_if_addr = mmu_io_if_iom_addr; // @[cpu.scala 58:20:@3157.4]
  assign iomn_io_mem_mem_mode = mmu_io_mem_iom_mode; // @[cpu.scala 60:20:@3170.4]
  assign iomn_io_mem_mem_addr = mmu_io_mem_iom_addr; // @[cpu.scala 60:20:@3168.4]
  assign iomn_io_mem_mem_wdata = mmu_io_mem_iom_wdata; // @[cpu.scala 60:20:@3166.4]
  assign iomn_io_mem_out_ready = io_mem_ready; // @[cpu.scala 61:20:@3174.4]
  assign iomn_io_mem_out_rdata = io_mem_rdata; // @[cpu.scala 61:20:@3172.4]
  assign iomn_io_serial_out_ready = io_serial_ready; // @[cpu.scala 62:20:@3179.4]
  assign iomn_io_serial_out_rdata = io_serial_rdata; // @[cpu.scala 62:20:@3177.4]
  assign if_id_clock = clock; // @[:@3122.4]
  assign if_id_reset = reset; // @[:@3123.4]
  assign if_id_io_en = io_en; // @[cpu.scala 88:20:@3212.4]
  assign if_id_io_pass = memc_io_ready & id_ex_io_ready; // @[cpu.scala 81:20:@3206.4]
  assign if_id_io_flush = csr_io_flush; // @[cpu.scala 164:21:@3339.4]
  assign if_id_io_insi = insr_io_ins; // @[cpu.scala 91:20:@3215.4]
  assign if_id_io_pci = insr_io_pc; // @[cpu.scala 92:20:@3216.4]
  assign if_id_io_insci = insr_io_insn; // @[cpu.scala 89:20:@3213.4]
  assign if_id_io_icdi = insr_io_insnd; // @[cpu.scala 90:20:@3214.4]
  assign if_id_io_lastloadin_valid = insd_io_loadinfo_valid; // @[cpu.scala 93:25:@3218.4]
  assign if_id_io_lastloadin_index = insd_io_loadinfo_index; // @[cpu.scala 93:25:@3217.4]
  assign if_id_io_excep_i_pc = insr_io_excep_pc; // @[cpu.scala 94:25:@3220.4]
  assign if_id_io_excep_i_inst_valid = insr_io_excep_inst_valid; // @[cpu.scala 94:25:@3219.4]
  assign id_ex_clock = clock; // @[:@3125.4]
  assign id_ex_reset = reset; // @[:@3126.4]
  assign id_ex_io_en = io_en; // @[cpu.scala 104:21:@3235.4]
  assign id_ex_io_bid = insd_io_bubble; // @[cpu.scala 105:21:@3236.4]
  assign id_ex_io_bex = exec_io_jump; // @[cpu.scala 106:21:@3237.4]
  assign id_ex_io_flush = csr_io_flush; // @[cpu.scala 165:21:@3340.4]
  assign id_ex_io_pass = memc_io_ready & id_ex_io_ready; // @[cpu.scala 82:20:@3208.4]
  assign id_ex_io_immi = insd_io_imm; // @[cpu.scala 108:21:@3238.4]
  assign id_ex_io_ALUOpi = insd_io_ALUOp; // @[cpu.scala 109:21:@3239.4]
  assign id_ex_io_exeti = insd_io_exe_type; // @[cpu.scala 110:21:@3240.4]
  assign id_ex_io_pci = if_id_io_pco; // @[cpu.scala 111:21:@3241.4]
  assign id_ex_io_lsmi = insd_io_ls_mode; // @[cpu.scala 113:21:@3248.4]
  assign id_ex_io_op32i = insd_io_op32; // @[cpu.scala 114:21:@3249.4]
  assign id_ex_io_csr_wb_i_valid = insd_io_csr_content_valid; // @[cpu.scala 115:24:@3252.4]
  assign id_ex_io_csr_wb_i_csr_idx = insd_io_csr_content_csr_idx; // @[cpu.scala 115:24:@3251.4]
  assign id_ex_io_csr_wb_i_csr_data = insd_io_csr_content_csr_data; // @[cpu.scala 115:24:@3250.4]
  assign id_ex_io_dregi_rs2_valid = insd_io_dreg_rs2_valid; // @[cpu.scala 112:21:@3246.4]
  assign id_ex_io_dregi_rs1_value = insd_io_dreg_rs1_value; // @[cpu.scala 112:21:@3245.4]
  assign id_ex_io_dregi_rs2_value = insd_io_dreg_rs2_value; // @[cpu.scala 112:21:@3244.4]
  assign id_ex_io_dregi_rd_valid = insd_io_dreg_rd_valid; // @[cpu.scala 112:21:@3243.4]
  assign id_ex_io_dregi_rd_index = insd_io_dreg_rd_index; // @[cpu.scala 112:21:@3242.4]
  assign id_ex_io_excep_i_valid = insd_io_ex_excep_valid; // @[cpu.scala 116:24:@3257.4]
  assign id_ex_io_excep_i_code = insd_io_ex_excep_code; // @[cpu.scala 116:24:@3256.4]
  assign id_ex_io_excep_i_value = insd_io_ex_excep_value; // @[cpu.scala 116:24:@3255.4]
  assign id_ex_io_excep_i_pc = insd_io_ex_excep_pc; // @[cpu.scala 116:24:@3254.4]
  assign id_ex_io_excep_i_inst_valid = insd_io_ex_excep_inst_valid; // @[cpu.scala 116:24:@3253.4]
  assign id_ex_io_mul_div_i = insd_io_mul_div_ins; // @[cpu.scala 117:24:@3258.4]
  assign ex_mem_clock = clock; // @[:@3128.4]
  assign ex_mem_reset = reset; // @[:@3129.4]
  assign ex_mem_io_en = io_en; // @[cpu.scala 129:21:@3278.4]
  assign ex_mem_io_pass = memc_io_ready; // @[cpu.scala 83:20:@3209.4]
  assign ex_mem_io_flush = csr_io_flush; // @[cpu.scala 166:21:@3341.4]
  assign ex_mem_io_nlsi = exec_io_nls; // @[cpu.scala 131:21:@3280.4]
  assign ex_mem_io_lsmi = id_ex_io_lsmo; // @[cpu.scala 130:21:@3279.4]
  assign ex_mem_io_addri = exec_io_addr; // @[cpu.scala 133:21:@3284.4]
  assign ex_mem_io_datai = exec_io_data; // @[cpu.scala 134:21:@3285.4]
  assign ex_mem_io_wregi_wbrv = exec_io_wreg_wbrv; // @[cpu.scala 132:21:@3283.4]
  assign ex_mem_io_wregi_wbri = exec_io_wreg_wbri; // @[cpu.scala 132:21:@3282.4]
  assign ex_mem_io_wregi_wbrd = exec_io_wreg_wbrd; // @[cpu.scala 132:21:@3281.4]
  assign ex_mem_io_csr_wb_i_valid = exec_io_wcsr_valid; // @[cpu.scala 135:24:@3288.4]
  assign ex_mem_io_csr_wb_i_csr_idx = exec_io_wcsr_csr_idx; // @[cpu.scala 135:24:@3287.4]
  assign ex_mem_io_csr_wb_i_csr_data = exec_io_wcsr_csr_data; // @[cpu.scala 135:24:@3286.4]
  assign ex_mem_io_excep_i_valid = exec_io_mem_excep_valid; // @[cpu.scala 136:24:@3293.4]
  assign ex_mem_io_excep_i_code = exec_io_mem_excep_code; // @[cpu.scala 136:24:@3292.4]
  assign ex_mem_io_excep_i_value = exec_io_mem_excep_value; // @[cpu.scala 136:24:@3291.4]
  assign ex_mem_io_excep_i_pc = exec_io_mem_excep_pc; // @[cpu.scala 136:24:@3290.4]
  assign ex_mem_io_excep_i_inst_valid = exec_io_mem_excep_inst_valid; // @[cpu.scala 136:24:@3289.4]
  assign ex_mem_io_inter_i_valid = csr_io_inter_valid; // @[cpu.scala 137:24:@3295.4]
  assign ex_mem_io_inter_i_bits = csr_io_inter_bits; // @[cpu.scala 137:24:@3294.4]
  assign mem_wb_clock = clock; // @[:@3131.4]
  assign mem_wb_reset = reset; // @[:@3132.4]
  assign mem_wb_io_en = io_en; // @[cpu.scala 149:21:@3313.4]
  assign mem_wb_io_pass = memc_io_ready; // @[cpu.scala 84:20:@3210.4]
  assign mem_wb_io_wregi_wbrv = memc_io_wreg_wbrv; // @[cpu.scala 150:21:@3316.4]
  assign mem_wb_io_wregi_wbri = memc_io_wreg_wbri; // @[cpu.scala 150:21:@3315.4]
  assign mem_wb_io_wregi_wbrd = memc_io_wreg_wbrd; // @[cpu.scala 150:21:@3314.4]
  assign csr_clock = clock; // @[:@3134.4]
  assign csr_reset = reset; // @[:@3135.4]
  assign csr_io_id_addr = insd_io_csr_addr; // @[cpu.scala 158:21:@3328.4]
  assign csr_io_mem_wrCSROp_valid = memc_io_csr_wrCSROp_valid; // @[cpu.scala 159:21:@3336.4]
  assign csr_io_mem_wrCSROp_csr_idx = memc_io_csr_wrCSROp_csr_idx; // @[cpu.scala 159:21:@3335.4]
  assign csr_io_mem_wrCSROp_csr_data = memc_io_csr_wrCSROp_csr_data; // @[cpu.scala 159:21:@3334.4]
  assign csr_io_mem_excep_valid = memc_io_csr_excep_valid; // @[cpu.scala 159:21:@3333.4]
  assign csr_io_mem_excep_code = memc_io_csr_excep_code; // @[cpu.scala 159:21:@3332.4]
  assign csr_io_mem_excep_value = memc_io_csr_excep_value; // @[cpu.scala 159:21:@3331.4]
  assign csr_io_mem_excep_pc = memc_io_csr_excep_pc; // @[cpu.scala 159:21:@3330.4]
  assign csr_io_mem_excep_inst_valid = memc_io_csr_excep_inst_valid; // @[cpu.scala 159:21:@3329.4]
endmodule
