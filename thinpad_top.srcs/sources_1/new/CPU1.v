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
  output [3:0]  io_ALUOp // @[:@221.4]
);
  wire  _T_26; // @[aluGen.scala 19:27:@223.4]
  wire [2:0] _T_27; // @[aluGen.scala 19:39:@224.4]
  wire [3:0] _T_28; // @[Cat.scala 30:58:@225.4]
  wire  _T_40; // @[Mux.scala 46:19:@226.4]
  wire [3:0] _T_41; // @[Mux.scala 46:16:@227.4]
  wire  _T_42; // @[Mux.scala 46:19:@228.4]
  wire [3:0] _T_43; // @[Mux.scala 46:16:@229.4]
  wire  _T_44; // @[Mux.scala 46:19:@230.4]
  wire [3:0] _T_45; // @[Mux.scala 46:16:@231.4]
  wire  _T_46; // @[Mux.scala 46:19:@232.4]
  wire [3:0] _T_47; // @[Mux.scala 46:16:@233.4]
  wire  _T_48; // @[Mux.scala 46:19:@234.4]
  wire [3:0] _T_49; // @[Mux.scala 46:16:@235.4]
  wire  _T_50; // @[Mux.scala 46:19:@236.4]
  wire [3:0] _T_51; // @[Mux.scala 46:16:@237.4]
  wire  _T_52; // @[Mux.scala 46:19:@238.4]
  wire [3:0] _T_53; // @[Mux.scala 46:16:@239.4]
  wire  _T_54; // @[Mux.scala 46:19:@240.4]
  wire [3:0] _T_55; // @[Mux.scala 46:16:@241.4]
  wire  _T_56; // @[Mux.scala 46:19:@242.4]
  wire [3:0] _T_57; // @[Mux.scala 46:16:@243.4]
  wire  _T_58; // @[Mux.scala 46:19:@244.4]
  wire [3:0] _T_59; // @[Mux.scala 46:16:@245.4]
  wire  _T_60; // @[aluGen.scala 35:27:@246.4]
  wire  _T_61; // @[aluGen.scala 35:42:@247.4]
  wire [4:0] _T_64; // @[Cat.scala 30:58:@250.4]
  wire [3:0] _T_74; // @[aluGen.scala 45:38:@252.4]
  wire  _T_81; // @[Mux.scala 46:19:@253.4]
  wire [3:0] _T_82; // @[Mux.scala 46:16:@254.4]
  wire  _T_83; // @[Mux.scala 46:19:@255.4]
  wire [3:0] _T_84; // @[Mux.scala 46:16:@256.4]
  wire  _T_85; // @[Mux.scala 46:19:@257.4]
  wire [3:0] _T_86; // @[Mux.scala 46:16:@258.4]
  wire  _T_87; // @[Mux.scala 46:19:@259.4]
  wire [3:0] _T_88; // @[Mux.scala 46:16:@260.4]
  wire  _T_89; // @[Mux.scala 46:19:@261.4]
  wire [3:0] _T_90; // @[Mux.scala 46:16:@262.4]
  wire  _T_91; // @[Mux.scala 46:19:@263.4]
  wire [3:0] _T_92; // @[Mux.scala 46:16:@264.4]
  wire  _T_93; // @[Mux.scala 46:19:@265.4]
  wire [3:0] _T_94; // @[Mux.scala 46:16:@266.4]
  wire  _T_95; // @[Mux.scala 46:19:@267.4]
  wire [3:0] _T_96; // @[Mux.scala 46:16:@268.4]
  wire  _T_97; // @[Mux.scala 46:19:@269.4]
  wire [3:0] _T_98; // @[Mux.scala 46:16:@270.4]
  wire  _T_99; // @[Mux.scala 46:19:@271.4]
  wire [3:0] _T_100; // @[Mux.scala 46:16:@272.4]
  wire  _T_101; // @[Mux.scala 46:19:@273.4]
  wire [3:0] _T_102; // @[Mux.scala 46:16:@274.4]
  wire  _T_103; // @[Mux.scala 46:19:@275.4]
  wire [3:0] _T_104; // @[Mux.scala 46:16:@276.4]
  wire  _T_105; // @[Mux.scala 46:19:@277.4]
  wire [3:0] _T_106; // @[Mux.scala 46:16:@278.4]
  wire  _T_107; // @[Mux.scala 46:19:@279.4]
  wire [3:0] _T_108; // @[Mux.scala 46:16:@280.4]
  wire  _T_109; // @[Mux.scala 46:19:@281.4]
  wire [3:0] _T_110; // @[Mux.scala 46:16:@282.4]
  wire  _T_111; // @[Mux.scala 46:19:@283.4]
  wire [3:0] _T_112; // @[Mux.scala 46:16:@284.4]
  wire  _T_113; // @[Mux.scala 46:19:@285.4]
  assign _T_26 = io_ins[30]; // @[aluGen.scala 19:27:@223.4]
  assign _T_27 = io_ins[14:12]; // @[aluGen.scala 19:39:@224.4]
  assign _T_28 = {_T_26,_T_27}; // @[Cat.scala 30:58:@225.4]
  assign _T_40 = 4'h7 == _T_28; // @[Mux.scala 46:19:@226.4]
  assign _T_41 = _T_40 ? 4'h4 : 4'h0; // @[Mux.scala 46:16:@227.4]
  assign _T_42 = 4'h6 == _T_28; // @[Mux.scala 46:19:@228.4]
  assign _T_43 = _T_42 ? 4'h5 : _T_41; // @[Mux.scala 46:16:@229.4]
  assign _T_44 = 4'hd == _T_28; // @[Mux.scala 46:19:@230.4]
  assign _T_45 = _T_44 ? 4'ha : _T_43; // @[Mux.scala 46:16:@231.4]
  assign _T_46 = 4'h5 == _T_28; // @[Mux.scala 46:19:@232.4]
  assign _T_47 = _T_46 ? 4'h9 : _T_45; // @[Mux.scala 46:16:@233.4]
  assign _T_48 = 4'h4 == _T_28; // @[Mux.scala 46:19:@234.4]
  assign _T_49 = _T_48 ? 4'h6 : _T_47; // @[Mux.scala 46:16:@235.4]
  assign _T_50 = 4'h3 == _T_28; // @[Mux.scala 46:19:@236.4]
  assign _T_51 = _T_50 ? 4'hc : _T_49; // @[Mux.scala 46:16:@237.4]
  assign _T_52 = 4'h2 == _T_28; // @[Mux.scala 46:19:@238.4]
  assign _T_53 = _T_52 ? 4'h7 : _T_51; // @[Mux.scala 46:16:@239.4]
  assign _T_54 = 4'h1 == _T_28; // @[Mux.scala 46:19:@240.4]
  assign _T_55 = _T_54 ? 4'h8 : _T_53; // @[Mux.scala 46:16:@241.4]
  assign _T_56 = 4'h8 == _T_28; // @[Mux.scala 46:19:@242.4]
  assign _T_57 = _T_56 ? 4'hb : _T_55; // @[Mux.scala 46:16:@243.4]
  assign _T_58 = 4'h0 == _T_28; // @[Mux.scala 46:19:@244.4]
  assign _T_59 = _T_58 ? 4'h3 : _T_57; // @[Mux.scala 46:16:@245.4]
  assign _T_60 = io_ins[6]; // @[aluGen.scala 35:27:@246.4]
  assign _T_61 = io_ins[4]; // @[aluGen.scala 35:42:@247.4]
  assign _T_64 = {_T_60,_T_61,_T_27}; // @[Cat.scala 30:58:@250.4]
  assign _T_74 = _T_26 ? 4'ha : 4'h9; // @[aluGen.scala 45:38:@252.4]
  assign _T_81 = 5'h1d == _T_64; // @[Mux.scala 46:19:@253.4]
  assign _T_82 = _T_81 ? 4'h1 : 4'h3; // @[Mux.scala 46:16:@254.4]
  assign _T_83 = 5'h19 == _T_64; // @[Mux.scala 46:19:@255.4]
  assign _T_84 = _T_83 ? 4'h1 : _T_82; // @[Mux.scala 46:16:@256.4]
  assign _T_85 = 5'h1f == _T_64; // @[Mux.scala 46:19:@257.4]
  assign _T_86 = _T_85 ? 4'hd : _T_84; // @[Mux.scala 46:16:@258.4]
  assign _T_87 = 5'h1b == _T_64; // @[Mux.scala 46:19:@259.4]
  assign _T_88 = _T_87 ? 4'hd : _T_86; // @[Mux.scala 46:16:@260.4]
  assign _T_89 = 5'h1e == _T_64; // @[Mux.scala 46:19:@261.4]
  assign _T_90 = _T_89 ? 4'h5 : _T_88; // @[Mux.scala 46:16:@262.4]
  assign _T_91 = 5'h1a == _T_64; // @[Mux.scala 46:19:@263.4]
  assign _T_92 = _T_91 ? 4'h5 : _T_90; // @[Mux.scala 46:16:@264.4]
  assign _T_93 = 5'hd == _T_64; // @[Mux.scala 46:19:@265.4]
  assign _T_94 = _T_93 ? _T_74 : _T_92; // @[Mux.scala 46:16:@266.4]
  assign _T_95 = 5'h9 == _T_64; // @[Mux.scala 46:19:@267.4]
  assign _T_96 = _T_95 ? 4'h8 : _T_94; // @[Mux.scala 46:16:@268.4]
  assign _T_97 = 5'hf == _T_64; // @[Mux.scala 46:19:@269.4]
  assign _T_98 = _T_97 ? 4'h4 : _T_96; // @[Mux.scala 46:16:@270.4]
  assign _T_99 = 5'he == _T_64; // @[Mux.scala 46:19:@271.4]
  assign _T_100 = _T_99 ? 4'h5 : _T_98; // @[Mux.scala 46:16:@272.4]
  assign _T_101 = 5'hc == _T_64; // @[Mux.scala 46:19:@273.4]
  assign _T_102 = _T_101 ? 4'h6 : _T_100; // @[Mux.scala 46:16:@274.4]
  assign _T_103 = 5'hb == _T_64; // @[Mux.scala 46:19:@275.4]
  assign _T_104 = _T_103 ? 4'hc : _T_102; // @[Mux.scala 46:16:@276.4]
  assign _T_105 = 5'ha == _T_64; // @[Mux.scala 46:19:@277.4]
  assign _T_106 = _T_105 ? 4'h7 : _T_104; // @[Mux.scala 46:16:@278.4]
  assign _T_107 = 5'h8 == _T_64; // @[Mux.scala 46:19:@279.4]
  assign _T_108 = _T_107 ? 4'h3 : _T_106; // @[Mux.scala 46:16:@280.4]
  assign _T_109 = 3'h2 == io_ins_type; // @[Mux.scala 46:19:@281.4]
  assign _T_110 = _T_109 ? _T_108 : 4'h0; // @[Mux.scala 46:16:@282.4]
  assign _T_111 = 3'h1 == io_ins_type; // @[Mux.scala 46:19:@283.4]
  assign _T_112 = _T_111 ? _T_59 : _T_110; // @[Mux.scala 46:16:@284.4]
  assign _T_113 = 3'h3 == io_ins_type; // @[Mux.scala 46:19:@285.4]
  assign io_ALUOp = _T_113 ? 4'h3 : _T_112; // @[aluGen.scala 13:14:@287.4]
endmodule
module Decoder( // @[:@289.2]
  input         clock, // @[:@290.4]
  input         reset, // @[:@291.4]
  input  [31:0] io_ins, // @[:@292.4]
  input         io_lastload_valid, // @[:@292.4]
  input  [4:0]  io_lastload_index, // @[:@292.4]
  output        io_loadinfo_valid, // @[:@292.4]
  output [4:0]  io_loadinfo_index, // @[:@292.4]
  output [63:0] io_imm, // @[:@292.4]
  output [3:0]  io_ALUOp, // @[:@292.4]
  output [3:0]  io_exe_type, // @[:@292.4]
  output [3:0]  io_ls_mode, // @[:@292.4]
  output        io_op32, // @[:@292.4]
  output        io_bubble, // @[:@292.4]
  output [4:0]  io_regr_r1, // @[:@292.4]
  output [4:0]  io_regr_r2, // @[:@292.4]
  input  [63:0] io_regr_r1d, // @[:@292.4]
  input  [63:0] io_regr_r2d, // @[:@292.4]
  output        io_dreg_rs2_valid, // @[:@292.4]
  output [63:0] io_dreg_rs1_value, // @[:@292.4]
  output [63:0] io_dreg_rs2_value, // @[:@292.4]
  output        io_dreg_rd_valid, // @[:@292.4]
  output [4:0]  io_dreg_rd_index, // @[:@292.4]
  output [11:0] io_csr_addr, // @[:@292.4]
  input  [63:0] io_csr_rdata, // @[:@292.4]
  input  [1:0]  io_csr_priv, // @[:@292.4]
  output        io_csr_content_valid, // @[:@292.4]
  output [11:0] io_csr_content_csr_idx, // @[:@292.4]
  output [63:0] io_csr_content_csr_data, // @[:@292.4]
  input         io_csr_from_ex_valid, // @[:@292.4]
  input  [11:0] io_csr_from_ex_csr_idx, // @[:@292.4]
  input  [63:0] io_csr_from_ex_csr_data, // @[:@292.4]
  input         io_csr_from_mem_valid, // @[:@292.4]
  input  [11:0] io_csr_from_mem_csr_idx, // @[:@292.4]
  input  [63:0] io_csr_from_mem_csr_data, // @[:@292.4]
  input         io_exWrReg_wbrv, // @[:@292.4]
  input  [4:0]  io_exWrReg_wbri, // @[:@292.4]
  input  [63:0] io_exWrReg_wbrd, // @[:@292.4]
  input         io_memWrReg_wbrv, // @[:@292.4]
  input  [4:0]  io_memWrReg_wbri, // @[:@292.4]
  input  [63:0] io_memWrReg_wbrd, // @[:@292.4]
  input         io_if_excep_valid, // @[:@292.4]
  input  [31:0] io_if_excep_code, // @[:@292.4]
  input  [31:0] io_if_excep_value, // @[:@292.4]
  input  [63:0] io_if_excep_pc, // @[:@292.4]
  input         io_if_excep_inst_valid, // @[:@292.4]
  output        io_ex_excep_valid, // @[:@292.4]
  output [31:0] io_ex_excep_code, // @[:@292.4]
  output [31:0] io_ex_excep_value, // @[:@292.4]
  output [63:0] io_ex_excep_pc, // @[:@292.4]
  output        io_ex_excep_inst_valid // @[:@292.4]
);
  wire [31:0] itype_io_ins; // @[decoder.scala 36:23:@294.4]
  wire [2:0] itype_io_ins_type; // @[decoder.scala 36:23:@294.4]
  wire [3:0] itype_io_exe_type; // @[decoder.scala 36:23:@294.4]
  wire  itype_io_op32; // @[decoder.scala 36:23:@294.4]
  wire [31:0] immg_io_ins; // @[decoder.scala 37:22:@297.4]
  wire [2:0] immg_io_ins_type; // @[decoder.scala 37:22:@297.4]
  wire [63:0] immg_io_imm; // @[decoder.scala 37:22:@297.4]
  wire [31:0] alug_io_ins; // @[decoder.scala 38:22:@300.4]
  wire [2:0] alug_io_ins_type; // @[decoder.scala 38:22:@300.4]
  wire [3:0] alug_io_ALUOp; // @[decoder.scala 38:22:@300.4]
  wire [4:0] rs1_index; // @[decoder.scala 50:27:@312.4]
  wire [4:0] rs2_index; // @[decoder.scala 51:27:@313.4]
  wire  _T_179; // @[decoder.scala 53:43:@314.4]
  wire  _T_180; // @[decoder.scala 53:24:@315.4]
  wire  _T_181; // @[decoder.scala 54:45:@316.4]
  wire  _T_182; // @[decoder.scala 54:25:@317.4]
  wire [63:0] _T_184; // @[Mux.scala 31:69:@318.4]
  wire [63:0] rs1_value; // @[Mux.scala 31:69:@319.4]
  wire  _T_185; // @[decoder.scala 58:43:@320.4]
  wire  _T_186; // @[decoder.scala 58:24:@321.4]
  wire  _T_187; // @[decoder.scala 59:45:@322.4]
  wire  _T_188; // @[decoder.scala 59:25:@323.4]
  wire [63:0] _T_190; // @[Mux.scala 31:69:@324.4]
  wire [4:0] rd_index; // @[decoder.scala 62:27:@326.4]
  wire  _T_191; // @[decoder.scala 63:40:@327.4]
  wire  _T_192; // @[decoder.scala 63:77:@328.4]
  wire  _T_193; // @[decoder.scala 63:56:@329.4]
  wire  _T_194; // @[decoder.scala 63:114:@330.4]
  wire  rs2_valid; // @[decoder.scala 63:93:@331.4]
  wire  _T_195; // @[decoder.scala 64:52:@332.4]
  wire  rs1_valid; // @[decoder.scala 64:31:@333.4]
  wire  _T_198; // @[decoder.scala 66:42:@336.4]
  wire  _T_199; // @[decoder.scala 66:100:@337.4]
  wire  _T_200; // @[decoder.scala 66:79:@338.4]
  wire  _T_201; // @[decoder.scala 66:137:@339.4]
  wire  _T_202; // @[decoder.scala 66:116:@340.4]
  wire  _T_204; // @[decoder.scala 67:17:@341.4]
  wire  _T_205; // @[decoder.scala 66:154:@342.4]
  wire  _T_206; // @[decoder.scala 67:47:@343.4]
  wire  _T_207; // @[decoder.scala 69:27:@345.4]
  wire  _T_208; // @[decoder.scala 70:20:@346.4]
  wire  _T_210; // @[decoder.scala 70:13:@347.4]
  wire [2:0] _T_211; // @[decoder.scala 70:31:@348.4]
  wire [3:0] _T_212; // @[Cat.scala 30:58:@349.4]
  wire [3:0] ls_mode; // @[decoder.scala 68:24:@350.4]
  wire  _T_213; // @[decoder.scala 73:75:@351.4]
  wire  _T_214; // @[decoder.scala 73:54:@352.4]
  wire  _T_215; // @[decoder.scala 73:125:@353.4]
  wire  _T_216; // @[decoder.scala 73:104:@354.4]
  wire  _T_217; // @[decoder.scala 73:90:@355.4]
  wire  _T_218; // @[decoder.scala 76:28:@357.4]
  wire  _T_220; // @[decoder.scala 76:53:@358.4]
  wire  _T_221; // @[decoder.scala 76:40:@359.4]
  wire  _T_223; // @[decoder.scala 77:28:@360.4]
  wire  _T_228; // @[decoder.scala 92:38:@372.4]
  wire  _T_229; // @[decoder.scala 92:61:@373.4]
  wire  _T_233; // @[decoder.scala 101:22:@383.4]
  wire  _T_234; // @[decoder.scala 101:49:@384.4]
  wire  _T_235; // @[decoder.scala 102:22:@385.4]
  wire  _T_236; // @[decoder.scala 102:50:@386.4]
  wire [63:0] _T_238; // @[Mux.scala 31:69:@387.4]
  wire  _T_240; // @[decoder.scala 107:28:@395.4]
  wire  _T_241; // @[decoder.scala 107:41:@396.4]
  wire [6:0] _T_242; // @[decoder.scala 108:29:@398.6]
  wire  _T_245; // @[decoder.scala 110:22:@400.6]
  wire  _T_247; // @[decoder.scala 111:16:@402.8]
  wire  _T_252; // @[decoder.scala 114:49:@406.10]
  wire  _T_254; // @[decoder.scala 115:29:@407.10]
  wire [4:0] _T_288; // @[decoder.scala 115:18:@408.10]
  wire [4:0] _T_289; // @[decoder.scala 114:36:@409.10]
  wire  _GEN_0; // @[decoder.scala 111:35:@403.8]
  wire [63:0] _GEN_1; // @[decoder.scala 111:35:@403.8]
  wire [31:0] _GEN_2; // @[decoder.scala 111:35:@403.8]
  wire  _T_293; // @[Conditional.scala 37:30:@416.10]
  wire [3:0] _GEN_17; // @[Const.scala 66:31:@420.12]
  wire [3:0] _T_297; // @[Const.scala 66:31:@420.12]
  wire  _T_299; // @[Conditional.scala 37:30:@424.12]
  wire  _T_302; // @[Conditional.scala 37:30:@430.14]
  wire [1:0] _T_303; // @[decoder.scala 130:33:@432.16]
  wire  _T_305; // @[decoder.scala 132:53:@434.16]
  wire [4:0] _GEN_18; // @[Const.scala 67:30:@436.16]
  wire [4:0] _T_308; // @[Const.scala 67:30:@436.16]
  wire [4:0] _T_309; // @[decoder.scala 132:40:@437.16]
  wire  _T_312; // @[decoder.scala 135:23:@440.16]
  wire  _GEN_3; // @[Conditional.scala 39:67:@431.14]
  wire [31:0] _GEN_4; // @[Conditional.scala 39:67:@431.14]
  wire  _GEN_5; // @[Conditional.scala 39:67:@425.12]
  wire [31:0] _GEN_6; // @[Conditional.scala 39:67:@425.12]
  wire  _GEN_7; // @[Conditional.scala 40:58:@417.10]
  wire [31:0] _GEN_8; // @[Conditional.scala 40:58:@417.10]
  wire  _GEN_9; // @[decoder.scala 119:35:@415.8]
  wire [31:0] _GEN_10; // @[decoder.scala 119:35:@415.8]
  wire  _GEN_11; // @[decoder.scala 110:49:@401.6]
  wire [63:0] _GEN_12; // @[decoder.scala 110:49:@401.6]
  wire [31:0] _GEN_13; // @[decoder.scala 110:49:@401.6]
  wire [63:0] _GEN_15; // @[decoder.scala 107:68:@397.4]
  wire  _GEN_19; // @[decoder.scala 135:23:@442.18]
  wire  _GEN_20; // @[decoder.scala 135:23:@442.18]
  wire  _GEN_21; // @[decoder.scala 135:23:@442.18]
  wire  _GEN_22; // @[decoder.scala 135:23:@442.18]
  wire  _GEN_23; // @[decoder.scala 135:23:@442.18]
  wire  _GEN_24; // @[decoder.scala 135:23:@442.18]
  wire  _GEN_25; // @[decoder.scala 135:23:@442.18]
  wire  _GEN_26; // @[decoder.scala 135:23:@442.18]
  InsType itype ( // @[decoder.scala 36:23:@294.4]
    .io_ins(itype_io_ins),
    .io_ins_type(itype_io_ins_type),
    .io_exe_type(itype_io_exe_type),
    .io_op32(itype_io_op32)
  );
  ImmGen immg ( // @[decoder.scala 37:22:@297.4]
    .io_ins(immg_io_ins),
    .io_ins_type(immg_io_ins_type),
    .io_imm(immg_io_imm)
  );
  ALUGen alug ( // @[decoder.scala 38:22:@300.4]
    .io_ins(alug_io_ins),
    .io_ins_type(alug_io_ins_type),
    .io_ALUOp(alug_io_ALUOp)
  );
  assign rs1_index = io_ins[19:15]; // @[decoder.scala 50:27:@312.4]
  assign rs2_index = io_ins[24:20]; // @[decoder.scala 51:27:@313.4]
  assign _T_179 = io_exWrReg_wbri == rs1_index; // @[decoder.scala 53:43:@314.4]
  assign _T_180 = io_exWrReg_wbrv & _T_179; // @[decoder.scala 53:24:@315.4]
  assign _T_181 = io_memWrReg_wbri == rs1_index; // @[decoder.scala 54:45:@316.4]
  assign _T_182 = io_memWrReg_wbrv & _T_181; // @[decoder.scala 54:25:@317.4]
  assign _T_184 = _T_182 ? io_memWrReg_wbrd : io_regr_r1d; // @[Mux.scala 31:69:@318.4]
  assign rs1_value = _T_180 ? io_exWrReg_wbrd : _T_184; // @[Mux.scala 31:69:@319.4]
  assign _T_185 = io_exWrReg_wbri == rs2_index; // @[decoder.scala 58:43:@320.4]
  assign _T_186 = io_exWrReg_wbrv & _T_185; // @[decoder.scala 58:24:@321.4]
  assign _T_187 = io_memWrReg_wbri == rs2_index; // @[decoder.scala 59:45:@322.4]
  assign _T_188 = io_memWrReg_wbrv & _T_187; // @[decoder.scala 59:25:@323.4]
  assign _T_190 = _T_188 ? io_memWrReg_wbrd : io_regr_r2d; // @[Mux.scala 31:69:@324.4]
  assign rd_index = io_ins[11:7]; // @[decoder.scala 62:27:@326.4]
  assign _T_191 = itype_io_ins_type == 3'h1; // @[decoder.scala 63:40:@327.4]
  assign _T_192 = itype_io_ins_type == 3'h3; // @[decoder.scala 63:77:@328.4]
  assign _T_193 = _T_191 | _T_192; // @[decoder.scala 63:56:@329.4]
  assign _T_194 = itype_io_ins_type == 3'h4; // @[decoder.scala 63:114:@330.4]
  assign rs2_valid = _T_193 | _T_194; // @[decoder.scala 63:93:@331.4]
  assign _T_195 = itype_io_ins_type == 3'h2; // @[decoder.scala 64:52:@332.4]
  assign rs1_valid = rs2_valid | _T_195; // @[decoder.scala 64:31:@333.4]
  assign _T_198 = _T_191 | _T_195; // @[decoder.scala 66:42:@336.4]
  assign _T_199 = itype_io_ins_type == 3'h5; // @[decoder.scala 66:100:@337.4]
  assign _T_200 = _T_198 | _T_199; // @[decoder.scala 66:79:@338.4]
  assign _T_201 = itype_io_ins_type == 3'h6; // @[decoder.scala 66:137:@339.4]
  assign _T_202 = _T_200 | _T_201; // @[decoder.scala 66:116:@340.4]
  assign _T_204 = rd_index != 5'h0; // @[decoder.scala 67:17:@341.4]
  assign _T_205 = _T_202 & _T_204; // @[decoder.scala 66:154:@342.4]
  assign _T_206 = itype_io_exe_type != 4'h1; // @[decoder.scala 67:47:@343.4]
  assign _T_207 = itype_io_exe_type == 4'h2; // @[decoder.scala 69:27:@345.4]
  assign _T_208 = io_ins[5]; // @[decoder.scala 70:20:@346.4]
  assign _T_210 = _T_208 == 1'h0; // @[decoder.scala 70:13:@347.4]
  assign _T_211 = io_ins[14:12]; // @[decoder.scala 70:31:@348.4]
  assign _T_212 = {_T_210,_T_211}; // @[Cat.scala 30:58:@349.4]
  assign ls_mode = _T_207 ? _T_212 : 4'hf; // @[decoder.scala 68:24:@350.4]
  assign _T_213 = io_lastload_index == rs1_index; // @[decoder.scala 73:75:@351.4]
  assign _T_214 = rs1_valid & _T_213; // @[decoder.scala 73:54:@352.4]
  assign _T_215 = io_lastload_index == rs2_index; // @[decoder.scala 73:125:@353.4]
  assign _T_216 = rs2_valid & _T_215; // @[decoder.scala 73:104:@354.4]
  assign _T_217 = _T_214 | _T_216; // @[decoder.scala 73:90:@355.4]
  assign _T_218 = itype_io_exe_type == 4'h6; // @[decoder.scala 76:28:@357.4]
  assign _T_220 = rs1_index != 5'h0; // @[decoder.scala 76:53:@358.4]
  assign _T_221 = _T_218 & _T_220; // @[decoder.scala 76:40:@359.4]
  assign _T_223 = itype_io_exe_type == 4'h7; // @[decoder.scala 77:28:@360.4]
  assign _T_228 = ls_mode != 4'hf; // @[decoder.scala 92:38:@372.4]
  assign _T_229 = ls_mode[3]; // @[decoder.scala 92:61:@373.4]
  assign _T_233 = io_csr_addr == io_csr_from_ex_csr_idx; // @[decoder.scala 101:22:@383.4]
  assign _T_234 = _T_233 & io_csr_from_ex_valid; // @[decoder.scala 101:49:@384.4]
  assign _T_235 = io_csr_addr == io_csr_from_mem_csr_idx; // @[decoder.scala 102:22:@385.4]
  assign _T_236 = _T_235 & io_csr_from_mem_valid; // @[decoder.scala 102:50:@386.4]
  assign _T_238 = _T_236 ? io_csr_from_mem_csr_data : io_csr_rdata; // @[Mux.scala 31:69:@387.4]
  assign _T_240 = itype_io_exe_type == 4'h1; // @[decoder.scala 107:28:@395.4]
  assign _T_241 = _T_240 & io_if_excep_inst_valid; // @[decoder.scala 107:41:@396.4]
  assign _T_242 = io_ins[31:25]; // @[decoder.scala 108:29:@398.6]
  assign _T_245 = _T_242 == 7'h9; // @[decoder.scala 110:22:@400.6]
  assign _T_247 = io_if_excep_valid == 1'h0; // @[decoder.scala 111:16:@402.8]
  assign _T_252 = io_csr_priv >= 2'h1; // @[decoder.scala 114:49:@406.10]
  assign _T_254 = rs1_index == 5'h0; // @[decoder.scala 115:29:@407.10]
  assign _T_288 = _T_254 ? 5'h15 : 5'h14; // @[decoder.scala 115:18:@408.10]
  assign _T_289 = _T_252 ? _T_288 : 5'h2; // @[decoder.scala 114:36:@409.10]
  assign _GEN_0 = _T_247 ? 1'h1 : io_if_excep_valid; // @[decoder.scala 111:35:@403.8]
  assign _GEN_1 = _T_247 ? rs1_value : {{32'd0}, io_if_excep_value}; // @[decoder.scala 111:35:@403.8]
  assign _GEN_2 = _T_247 ? {{27'd0}, _T_289} : io_if_excep_code; // @[decoder.scala 111:35:@403.8]
  assign _T_293 = 5'h0 == rs2_index; // @[Conditional.scala 37:30:@416.10]
  assign _GEN_17 = {{2'd0}, io_csr_priv}; // @[Const.scala 66:31:@420.12]
  assign _T_297 = 4'h8 | _GEN_17; // @[Const.scala 66:31:@420.12]
  assign _T_299 = 5'h1 == rs2_index; // @[Conditional.scala 37:30:@424.12]
  assign _T_302 = 5'h2 == rs2_index; // @[Conditional.scala 37:30:@430.14]
  assign _T_303 = io_ins[29:28]; // @[decoder.scala 130:33:@432.16]
  assign _T_305 = io_csr_priv >= _T_303; // @[decoder.scala 132:53:@434.16]
  assign _GEN_18 = {{3'd0}, _T_303}; // @[Const.scala 67:30:@436.16]
  assign _T_308 = 5'h10 | _GEN_18; // @[Const.scala 67:30:@436.16]
  assign _T_309 = _T_305 ? _T_308 : 5'h2; // @[decoder.scala 132:40:@437.16]
  assign _T_312 = reset == 1'h0; // @[decoder.scala 135:23:@440.16]
  assign _GEN_3 = _T_302 ? 1'h1 : io_if_excep_valid; // @[Conditional.scala 39:67:@431.14]
  assign _GEN_4 = _T_302 ? {{27'd0}, _T_309} : io_if_excep_code; // @[Conditional.scala 39:67:@431.14]
  assign _GEN_5 = _T_299 ? 1'h1 : _GEN_3; // @[Conditional.scala 39:67:@425.12]
  assign _GEN_6 = _T_299 ? 32'h3 : _GEN_4; // @[Conditional.scala 39:67:@425.12]
  assign _GEN_7 = _T_293 ? 1'h1 : _GEN_5; // @[Conditional.scala 40:58:@417.10]
  assign _GEN_8 = _T_293 ? {{28'd0}, _T_297} : _GEN_6; // @[Conditional.scala 40:58:@417.10]
  assign _GEN_9 = _T_247 ? _GEN_7 : io_if_excep_valid; // @[decoder.scala 119:35:@415.8]
  assign _GEN_10 = _T_247 ? _GEN_8 : io_if_excep_code; // @[decoder.scala 119:35:@415.8]
  assign _GEN_11 = _T_245 ? _GEN_0 : _GEN_9; // @[decoder.scala 110:49:@401.6]
  assign _GEN_12 = _T_245 ? _GEN_1 : {{32'd0}, io_if_excep_value}; // @[decoder.scala 110:49:@401.6]
  assign _GEN_13 = _T_245 ? _GEN_2 : _GEN_10; // @[decoder.scala 110:49:@401.6]
  assign _GEN_15 = _T_241 ? _GEN_12 : {{32'd0}, io_if_excep_value}; // @[decoder.scala 107:68:@397.4]
  assign io_loadinfo_valid = _T_228 & _T_229; // @[decoder.scala 92:27:@375.4]
  assign io_loadinfo_index = io_ins[11:7]; // @[decoder.scala 93:27:@376.4]
  assign io_imm = immg_io_imm; // @[decoder.scala 45:23:@308.4]
  assign io_ALUOp = alug_io_ALUOp; // @[decoder.scala 46:23:@309.4]
  assign io_exe_type = itype_io_exe_type; // @[decoder.scala 47:23:@310.4]
  assign io_ls_mode = _T_207 ? _T_212 : 4'hf; // @[decoder.scala 91:23:@371.4]
  assign io_op32 = itype_io_op32; // @[decoder.scala 48:23:@311.4]
  assign io_bubble = io_lastload_valid & _T_217; // @[decoder.scala 94:23:@377.4]
  assign io_regr_r1 = io_ins[19:15]; // @[decoder.scala 86:23:@367.4]
  assign io_regr_r2 = io_ins[24:20]; // @[decoder.scala 87:23:@368.4]
  assign io_dreg_rs2_valid = _T_193 | _T_194; // @[decoder.scala 82:23:@363.4]
  assign io_dreg_rs1_value = _T_180 ? io_exWrReg_wbrd : _T_184; // @[decoder.scala 88:23:@369.4]
  assign io_dreg_rs2_value = _T_186 ? io_exWrReg_wbrd : _T_190; // @[decoder.scala 89:23:@370.4]
  assign io_dreg_rd_valid = _T_205 & _T_206; // @[decoder.scala 84:23:@365.4]
  assign io_dreg_rd_index = io_ins[11:7]; // @[decoder.scala 85:23:@366.4]
  assign io_csr_addr = io_ins[31:20]; // @[decoder.scala 96:23:@379.4]
  assign io_csr_content_valid = _T_221 ? 1'h1 : _T_223; // @[decoder.scala 97:29:@380.4]
  assign io_csr_content_csr_idx = io_ins[31:20]; // @[decoder.scala 98:32:@382.4]
  assign io_csr_content_csr_data = _T_234 ? io_csr_from_ex_csr_data : _T_238; // @[decoder.scala 100:29:@389.4]
  assign io_ex_excep_valid = _T_241 ? _GEN_11 : io_if_excep_valid; // @[decoder.scala 106:17:@394.4 decoder.scala 112:31:@404.10 decoder.scala 122:35:@418.12 decoder.scala 126:35:@426.14 decoder.scala 131:35:@433.16]
  assign io_ex_excep_code = _T_241 ? _GEN_13 : io_if_excep_code; // @[decoder.scala 106:17:@393.4 decoder.scala 114:30:@410.10 decoder.scala 123:34:@421.12 decoder.scala 127:34:@427.14 decoder.scala 132:34:@438.16]
  assign io_ex_excep_value = _GEN_15[31:0]; // @[decoder.scala 106:17:@392.4 decoder.scala 113:31:@405.10]
  assign io_ex_excep_pc = io_if_excep_pc; // @[decoder.scala 106:17:@391.4]
  assign io_ex_excep_inst_valid = io_if_excep_inst_valid; // @[decoder.scala 106:17:@390.4]
  assign itype_io_ins = io_ins; // @[decoder.scala 40:23:@303.4]
  assign immg_io_ins = io_ins; // @[decoder.scala 41:23:@304.4]
  assign immg_io_ins_type = itype_io_ins_type; // @[decoder.scala 43:23:@306.4]
  assign alug_io_ins = io_ins; // @[decoder.scala 42:23:@305.4]
  assign alug_io_ins_type = itype_io_ins_type; // @[decoder.scala 44:23:@307.4]
  assign _GEN_19 = _T_245 == 1'h0; // @[decoder.scala 135:23:@442.18]
  assign _GEN_20 = _T_241 & _GEN_19; // @[decoder.scala 135:23:@442.18]
  assign _GEN_21 = _GEN_20 & _T_247; // @[decoder.scala 135:23:@442.18]
  assign _GEN_22 = _T_293 == 1'h0; // @[decoder.scala 135:23:@442.18]
  assign _GEN_23 = _GEN_21 & _GEN_22; // @[decoder.scala 135:23:@442.18]
  assign _GEN_24 = _T_299 == 1'h0; // @[decoder.scala 135:23:@442.18]
  assign _GEN_25 = _GEN_23 & _GEN_24; // @[decoder.scala 135:23:@442.18]
  assign _GEN_26 = _GEN_25 & _T_302; // @[decoder.scala 135:23:@442.18]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26 & _T_312) begin
          $fwrite(32'h80000002,"really a xRET, code %x \n",io_ex_excep_code); // @[decoder.scala 135:23:@442.18]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module ALU( // @[:@449.2]
  input  [3:0]  io_ALUOp, // @[:@452.4]
  input         io_op32, // @[:@452.4]
  input  [63:0] io_inputA, // @[:@452.4]
  input  [63:0] io_inputB, // @[:@452.4]
  output [63:0] io_output // @[:@452.4]
);
  wire [5:0] shamt; // @[alu.scala 32:26:@454.4]
  wire [4:0] shamt32; // @[alu.scala 33:28:@455.4]
  wire [31:0] inputA32; // @[alu.scala 34:29:@456.4]
  wire [31:0] inputB32; // @[alu.scala 35:29:@457.4]
  wire [32:0] _T_16; // @[alu.scala 40:39:@458.4]
  wire [31:0] _T_17; // @[alu.scala 40:39:@459.4]
  wire [62:0] _GEN_0; // @[alu.scala 41:39:@460.4]
  wire [62:0] _T_18; // @[alu.scala 41:39:@460.4]
  wire [31:0] _T_19; // @[alu.scala 42:38:@461.4]
  wire [31:0] _T_20; // @[alu.scala 43:40:@462.4]
  wire [31:0] _T_21; // @[alu.scala 43:47:@463.4]
  wire [31:0] _T_22; // @[alu.scala 43:59:@464.4]
  wire [32:0] _T_23; // @[alu.scala 44:39:@465.4]
  wire [32:0] _T_24; // @[alu.scala 44:39:@466.4]
  wire [31:0] _T_25; // @[alu.scala 44:39:@467.4]
  wire  _T_26; // @[Mux.scala 46:19:@468.4]
  wire [31:0] _T_27; // @[Mux.scala 46:16:@469.4]
  wire  _T_28; // @[Mux.scala 46:19:@470.4]
  wire [31:0] _T_29; // @[Mux.scala 46:16:@471.4]
  wire  _T_30; // @[Mux.scala 46:19:@472.4]
  wire [31:0] _T_31; // @[Mux.scala 46:16:@473.4]
  wire  _T_32; // @[Mux.scala 46:19:@474.4]
  wire [62:0] _T_33; // @[Mux.scala 46:16:@475.4]
  wire  _T_34; // @[Mux.scala 46:19:@476.4]
  wire [62:0] op32res; // @[Mux.scala 46:16:@477.4]
  wire  _T_35; // @[alu.scala 48:29:@478.4]
  wire [31:0] _T_39; // @[Bitwise.scala 72:12:@480.4]
  wire [31:0] _T_40; // @[alu.scala 48:43:@481.4]
  wire [63:0] _T_41; // @[Cat.scala 30:58:@482.4]
  wire [64:0] _T_44; // @[alu.scala 56:44:@483.4]
  wire [63:0] _T_45; // @[alu.scala 56:44:@484.4]
  wire [63:0] _T_46; // @[alu.scala 57:44:@485.4]
  wire [63:0] _T_47; // @[alu.scala 58:43:@486.4]
  wire [63:0] _T_48; // @[alu.scala 59:44:@487.4]
  wire  _T_49; // @[alu.scala 60:46:@488.4]
  wire [63:0] _T_50; // @[alu.scala 61:45:@489.4]
  wire [63:0] _T_51; // @[alu.scala 61:64:@490.4]
  wire  _T_52; // @[alu.scala 61:52:@491.4]
  wire [126:0] _GEN_1; // @[alu.scala 62:44:@492.4]
  wire [126:0] _T_53; // @[alu.scala 62:44:@492.4]
  wire [63:0] _T_54; // @[alu.scala 63:43:@493.4]
  wire [63:0] _T_56; // @[alu.scala 64:52:@495.4]
  wire [63:0] _T_57; // @[alu.scala 64:62:@496.4]
  wire [64:0] _T_58; // @[alu.scala 65:44:@497.4]
  wire [64:0] _T_59; // @[alu.scala 65:44:@498.4]
  wire [63:0] _T_60; // @[alu.scala 65:44:@499.4]
  wire [63:0] _T_61; // @[alu.scala 66:34:@500.4]
  wire [63:0] _T_62; // @[alu.scala 66:45:@501.4]
  wire  _T_63; // @[Mux.scala 46:19:@502.4]
  wire [63:0] _T_64; // @[Mux.scala 46:16:@503.4]
  wire [63:0] _T_66; // @[Mux.scala 46:16:@505.4]
  wire [63:0] _T_68; // @[Mux.scala 46:16:@507.4]
  wire [63:0] _T_70; // @[Mux.scala 46:16:@509.4]
  wire [126:0] _T_72; // @[Mux.scala 46:16:@511.4]
  wire  _T_73; // @[Mux.scala 46:19:@512.4]
  wire [126:0] _T_74; // @[Mux.scala 46:16:@513.4]
  wire  _T_75; // @[Mux.scala 46:19:@514.4]
  wire [126:0] _T_76; // @[Mux.scala 46:16:@515.4]
  wire  _T_77; // @[Mux.scala 46:19:@516.4]
  wire [126:0] _T_78; // @[Mux.scala 46:16:@517.4]
  wire  _T_79; // @[Mux.scala 46:19:@518.4]
  wire [126:0] _T_80; // @[Mux.scala 46:16:@519.4]
  wire  _T_81; // @[Mux.scala 46:19:@520.4]
  wire [126:0] _T_82; // @[Mux.scala 46:16:@521.4]
  wire [126:0] _T_84; // @[Mux.scala 46:16:@523.4]
  wire  _T_85; // @[Mux.scala 46:19:@524.4]
  wire [126:0] _T_86; // @[Mux.scala 46:16:@525.4]
  wire  _T_87; // @[Mux.scala 46:19:@526.4]
  wire [126:0] _T_88; // @[Mux.scala 46:16:@527.4]
  wire  _T_89; // @[Mux.scala 46:19:@528.4]
  wire [126:0] _T_90; // @[Mux.scala 46:16:@529.4]
  wire [126:0] _T_91; // @[alu.scala 47:21:@530.4]
  assign shamt = io_inputB[5:0]; // @[alu.scala 32:26:@454.4]
  assign shamt32 = io_inputB[4:0]; // @[alu.scala 33:28:@455.4]
  assign inputA32 = io_inputA[31:0]; // @[alu.scala 34:29:@456.4]
  assign inputB32 = io_inputB[31:0]; // @[alu.scala 35:29:@457.4]
  assign _T_16 = inputA32 + inputB32; // @[alu.scala 40:39:@458.4]
  assign _T_17 = inputA32 + inputB32; // @[alu.scala 40:39:@459.4]
  assign _GEN_0 = {{31'd0}, inputA32}; // @[alu.scala 41:39:@460.4]
  assign _T_18 = _GEN_0 << shamt32; // @[alu.scala 41:39:@460.4]
  assign _T_19 = inputA32 >> shamt32; // @[alu.scala 42:38:@461.4]
  assign _T_20 = $signed(inputA32); // @[alu.scala 43:40:@462.4]
  assign _T_21 = $signed(_T_20) >>> shamt32; // @[alu.scala 43:47:@463.4]
  assign _T_22 = $unsigned(_T_21); // @[alu.scala 43:59:@464.4]
  assign _T_23 = inputA32 - inputB32; // @[alu.scala 44:39:@465.4]
  assign _T_24 = $unsigned(_T_23); // @[alu.scala 44:39:@466.4]
  assign _T_25 = _T_24[31:0]; // @[alu.scala 44:39:@467.4]
  assign _T_26 = 4'hb == io_ALUOp; // @[Mux.scala 46:19:@468.4]
  assign _T_27 = _T_26 ? _T_25 : 32'h0; // @[Mux.scala 46:16:@469.4]
  assign _T_28 = 4'ha == io_ALUOp; // @[Mux.scala 46:19:@470.4]
  assign _T_29 = _T_28 ? _T_22 : _T_27; // @[Mux.scala 46:16:@471.4]
  assign _T_30 = 4'h9 == io_ALUOp; // @[Mux.scala 46:19:@472.4]
  assign _T_31 = _T_30 ? _T_19 : _T_29; // @[Mux.scala 46:16:@473.4]
  assign _T_32 = 4'h8 == io_ALUOp; // @[Mux.scala 46:19:@474.4]
  assign _T_33 = _T_32 ? _T_18 : {{31'd0}, _T_31}; // @[Mux.scala 46:16:@475.4]
  assign _T_34 = 4'h3 == io_ALUOp; // @[Mux.scala 46:19:@476.4]
  assign op32res = _T_34 ? {{31'd0}, _T_17} : _T_33; // @[Mux.scala 46:16:@477.4]
  assign _T_35 = op32res[31]; // @[alu.scala 48:29:@478.4]
  assign _T_39 = _T_35 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12:@480.4]
  assign _T_40 = op32res[31:0]; // @[alu.scala 48:43:@481.4]
  assign _T_41 = {_T_39,_T_40}; // @[Cat.scala 30:58:@482.4]
  assign _T_44 = io_inputA + io_inputB; // @[alu.scala 56:44:@483.4]
  assign _T_45 = io_inputA + io_inputB; // @[alu.scala 56:44:@484.4]
  assign _T_46 = io_inputA & io_inputB; // @[alu.scala 57:44:@485.4]
  assign _T_47 = io_inputA | io_inputB; // @[alu.scala 58:43:@486.4]
  assign _T_48 = io_inputA ^ io_inputB; // @[alu.scala 59:44:@487.4]
  assign _T_49 = io_inputA < io_inputB; // @[alu.scala 60:46:@488.4]
  assign _T_50 = $signed(io_inputA); // @[alu.scala 61:45:@489.4]
  assign _T_51 = $signed(io_inputB); // @[alu.scala 61:64:@490.4]
  assign _T_52 = $signed(_T_50) < $signed(_T_51); // @[alu.scala 61:52:@491.4]
  assign _GEN_1 = {{63'd0}, io_inputA}; // @[alu.scala 62:44:@492.4]
  assign _T_53 = _GEN_1 << shamt; // @[alu.scala 62:44:@492.4]
  assign _T_54 = io_inputA >> shamt; // @[alu.scala 63:43:@493.4]
  assign _T_56 = $signed(_T_50) >>> shamt; // @[alu.scala 64:52:@495.4]
  assign _T_57 = $unsigned(_T_56); // @[alu.scala 64:62:@496.4]
  assign _T_58 = io_inputA - io_inputB; // @[alu.scala 65:44:@497.4]
  assign _T_59 = $unsigned(_T_58); // @[alu.scala 65:44:@498.4]
  assign _T_60 = _T_59[63:0]; // @[alu.scala 65:44:@499.4]
  assign _T_61 = ~ io_inputA; // @[alu.scala 66:34:@500.4]
  assign _T_62 = _T_61 & io_inputB; // @[alu.scala 66:45:@501.4]
  assign _T_63 = 4'hd == io_ALUOp; // @[Mux.scala 46:19:@502.4]
  assign _T_64 = _T_63 ? _T_62 : 64'h0; // @[Mux.scala 46:16:@503.4]
  assign _T_66 = _T_26 ? _T_60 : _T_64; // @[Mux.scala 46:16:@505.4]
  assign _T_68 = _T_28 ? _T_57 : _T_66; // @[Mux.scala 46:16:@507.4]
  assign _T_70 = _T_30 ? _T_54 : _T_68; // @[Mux.scala 46:16:@509.4]
  assign _T_72 = _T_32 ? _T_53 : {{63'd0}, _T_70}; // @[Mux.scala 46:16:@511.4]
  assign _T_73 = 4'h7 == io_ALUOp; // @[Mux.scala 46:19:@512.4]
  assign _T_74 = _T_73 ? {{126'd0}, _T_52} : _T_72; // @[Mux.scala 46:16:@513.4]
  assign _T_75 = 4'hc == io_ALUOp; // @[Mux.scala 46:19:@514.4]
  assign _T_76 = _T_75 ? {{126'd0}, _T_49} : _T_74; // @[Mux.scala 46:16:@515.4]
  assign _T_77 = 4'h6 == io_ALUOp; // @[Mux.scala 46:19:@516.4]
  assign _T_78 = _T_77 ? {{63'd0}, _T_48} : _T_76; // @[Mux.scala 46:16:@517.4]
  assign _T_79 = 4'h5 == io_ALUOp; // @[Mux.scala 46:19:@518.4]
  assign _T_80 = _T_79 ? {{63'd0}, _T_47} : _T_78; // @[Mux.scala 46:16:@519.4]
  assign _T_81 = 4'h4 == io_ALUOp; // @[Mux.scala 46:19:@520.4]
  assign _T_82 = _T_81 ? {{63'd0}, _T_46} : _T_80; // @[Mux.scala 46:16:@521.4]
  assign _T_84 = _T_34 ? {{63'd0}, _T_45} : _T_82; // @[Mux.scala 46:16:@523.4]
  assign _T_85 = 4'h2 == io_ALUOp; // @[Mux.scala 46:19:@524.4]
  assign _T_86 = _T_85 ? {{63'd0}, io_inputB} : _T_84; // @[Mux.scala 46:16:@525.4]
  assign _T_87 = 4'h1 == io_ALUOp; // @[Mux.scala 46:19:@526.4]
  assign _T_88 = _T_87 ? {{63'd0}, io_inputA} : _T_86; // @[Mux.scala 46:16:@527.4]
  assign _T_89 = 4'h0 == io_ALUOp; // @[Mux.scala 46:19:@528.4]
  assign _T_90 = _T_89 ? 127'h0 : _T_88; // @[Mux.scala 46:16:@529.4]
  assign _T_91 = io_op32 ? {{63'd0}, _T_41} : _T_90; // @[alu.scala 47:21:@530.4]
  assign io_output = _T_91[63:0]; // @[alu.scala 47:15:@531.4]
endmodule
module BranchCtrl( // @[:@535.2]
  input  [3:0]  io_exeType, // @[:@538.4]
  input  [63:0] io_input1, // @[:@538.4]
  input  [63:0] io_input2, // @[:@538.4]
  output        io_jump // @[:@538.4]
);
  wire [64:0] _T_13; // @[branch.scala 27:25:@540.4]
  wire [64:0] _T_14; // @[branch.scala 27:25:@541.4]
  wire [63:0] x; // @[branch.scala 27:25:@542.4]
  wire  ne; // @[branch.scala 28:17:@543.4]
  wire  eq; // @[branch.scala 29:15:@544.4]
  wire  _T_17; // @[branch.scala 30:24:@545.4]
  wire  _T_18; // @[branch.scala 30:42:@546.4]
  wire  st; // @[branch.scala 30:29:@547.4]
  wire  _T_19; // @[branch.scala 31:24:@548.4]
  wire  lt; // @[branch.scala 31:18:@550.4]
  wire  ge; // @[branch.scala 32:15:@551.4]
  wire  _T_23; // @[branch.scala 33:39:@553.4]
  wire  ltu; // @[branch.scala 33:18:@554.4]
  wire  geu; // @[branch.scala 34:15:@555.4]
  wire  _T_36; // @[Mux.scala 46:19:@556.4]
  wire  _T_38; // @[Mux.scala 46:19:@558.4]
  wire  _T_39; // @[Mux.scala 46:16:@559.4]
  wire  _T_40; // @[Mux.scala 46:19:@560.4]
  wire  _T_41; // @[Mux.scala 46:16:@561.4]
  wire  _T_42; // @[Mux.scala 46:19:@562.4]
  wire  _T_43; // @[Mux.scala 46:16:@563.4]
  wire  _T_44; // @[Mux.scala 46:19:@564.4]
  wire  _T_45; // @[Mux.scala 46:16:@565.4]
  wire  _T_46; // @[Mux.scala 46:19:@566.4]
  wire  _T_47; // @[Mux.scala 46:16:@567.4]
  wire  _T_48; // @[Mux.scala 46:19:@568.4]
  wire  _T_49; // @[Mux.scala 46:16:@569.4]
  wire  _T_50; // @[Mux.scala 46:19:@570.4]
  assign _T_13 = io_input1 - io_input2; // @[branch.scala 27:25:@540.4]
  assign _T_14 = $unsigned(_T_13); // @[branch.scala 27:25:@541.4]
  assign x = _T_14[63:0]; // @[branch.scala 27:25:@542.4]
  assign ne = x != 64'h0; // @[branch.scala 28:17:@543.4]
  assign eq = ne == 1'h0; // @[branch.scala 29:15:@544.4]
  assign _T_17 = io_input1[63]; // @[branch.scala 30:24:@545.4]
  assign _T_18 = io_input2[62]; // @[branch.scala 30:42:@546.4]
  assign st = _T_17 == _T_18; // @[branch.scala 30:29:@547.4]
  assign _T_19 = x[63]; // @[branch.scala 31:24:@548.4]
  assign lt = st ? _T_19 : _T_17; // @[branch.scala 31:18:@550.4]
  assign ge = lt == 1'h0; // @[branch.scala 32:15:@551.4]
  assign _T_23 = io_input2[63]; // @[branch.scala 33:39:@553.4]
  assign ltu = st ? _T_19 : _T_23; // @[branch.scala 33:18:@554.4]
  assign geu = ltu == 1'h0; // @[branch.scala 34:15:@555.4]
  assign _T_36 = 4'hf == io_exeType; // @[Mux.scala 46:19:@556.4]
  assign _T_38 = 4'he == io_exeType; // @[Mux.scala 46:19:@558.4]
  assign _T_39 = _T_38 ? geu : _T_36; // @[Mux.scala 46:16:@559.4]
  assign _T_40 = 4'hd == io_exeType; // @[Mux.scala 46:19:@560.4]
  assign _T_41 = _T_40 ? ltu : _T_39; // @[Mux.scala 46:16:@561.4]
  assign _T_42 = 4'hc == io_exeType; // @[Mux.scala 46:19:@562.4]
  assign _T_43 = _T_42 ? ge : _T_41; // @[Mux.scala 46:16:@563.4]
  assign _T_44 = 4'hb == io_exeType; // @[Mux.scala 46:19:@564.4]
  assign _T_45 = _T_44 ? lt : _T_43; // @[Mux.scala 46:16:@565.4]
  assign _T_46 = 4'ha == io_exeType; // @[Mux.scala 46:19:@566.4]
  assign _T_47 = _T_46 ? ne : _T_45; // @[Mux.scala 46:16:@567.4]
  assign _T_48 = 4'h9 == io_exeType; // @[Mux.scala 46:19:@568.4]
  assign _T_49 = _T_48 ? eq : _T_47; // @[Mux.scala 46:16:@569.4]
  assign _T_50 = 4'h8 == io_exeType; // @[Mux.scala 46:19:@570.4]
  assign io_jump = _T_50 ? 1'h1 : _T_49; // @[branch.scala 36:13:@572.4]
endmodule
module Branch( // @[:@574.2]
  input  [3:0]  io_exeType, // @[:@577.4]
  input  [63:0] io_input1, // @[:@577.4]
  input  [63:0] io_input2, // @[:@577.4]
  input  [63:0] io_pc, // @[:@577.4]
  input  [63:0] io_imm, // @[:@577.4]
  output        io_jump, // @[:@577.4]
  output [63:0] io_jdest // @[:@577.4]
);
  wire [3:0] bctrl_io_exeType; // @[branch.scala 64:23:@579.4]
  wire [63:0] bctrl_io_input1; // @[branch.scala 64:23:@579.4]
  wire [63:0] bctrl_io_input2; // @[branch.scala 64:23:@579.4]
  wire  bctrl_io_jump; // @[branch.scala 64:23:@579.4]
  wire  _T_19; // @[branch.scala 71:33:@586.4]
  wire [64:0] _T_20; // @[branch.scala 71:57:@587.4]
  wire [63:0] _T_21; // @[branch.scala 71:57:@588.4]
  wire [64:0] _T_22; // @[branch.scala 71:73:@589.4]
  wire [63:0] _T_23; // @[branch.scala 71:73:@590.4]
  BranchCtrl bctrl ( // @[branch.scala 64:23:@579.4]
    .io_exeType(bctrl_io_exeType),
    .io_input1(bctrl_io_input1),
    .io_input2(bctrl_io_input2),
    .io_jump(bctrl_io_jump)
  );
  assign _T_19 = io_exeType == 4'hf; // @[branch.scala 71:33:@586.4]
  assign _T_20 = io_input1 + io_imm; // @[branch.scala 71:57:@587.4]
  assign _T_21 = io_input1 + io_imm; // @[branch.scala 71:57:@588.4]
  assign _T_22 = io_pc + io_imm; // @[branch.scala 71:73:@589.4]
  assign _T_23 = io_pc + io_imm; // @[branch.scala 71:73:@590.4]
  assign io_jump = bctrl_io_jump; // @[branch.scala 69:26:@585.4]
  assign io_jdest = _T_19 ? _T_21 : _T_23; // @[branch.scala 71:14:@592.4]
  assign bctrl_io_exeType = io_exeType; // @[branch.scala 66:26:@582.4]
  assign bctrl_io_input1 = io_input1; // @[branch.scala 67:26:@583.4]
  assign bctrl_io_input2 = io_input2; // @[branch.scala 68:26:@584.4]
endmodule
module Execute( // @[:@594.2]
  input  [63:0] io_imm, // @[:@597.4]
  input  [3:0]  io_ALUOp, // @[:@597.4]
  input  [63:0] io_pc, // @[:@597.4]
  input  [3:0]  io_exe_type, // @[:@597.4]
  input         io_op32, // @[:@597.4]
  input         io_dreg_rs2_valid, // @[:@597.4]
  input  [63:0] io_dreg_rs1_value, // @[:@597.4]
  input  [63:0] io_dreg_rs2_value, // @[:@597.4]
  input         io_dreg_rd_valid, // @[:@597.4]
  input  [4:0]  io_dreg_rd_index, // @[:@597.4]
  output        io_nls, // @[:@597.4]
  output [63:0] io_addr, // @[:@597.4]
  output [63:0] io_data, // @[:@597.4]
  output        io_jump, // @[:@597.4]
  output [63:0] io_jdest, // @[:@597.4]
  output        io_wreg_wbrv, // @[:@597.4]
  output [4:0]  io_wreg_wbri, // @[:@597.4]
  output [63:0] io_wreg_wbrd, // @[:@597.4]
  output        io_wcsr_valid, // @[:@597.4]
  output [11:0] io_wcsr_csr_idx, // @[:@597.4]
  output [63:0] io_wcsr_csr_data, // @[:@597.4]
  input         io_csr_op_valid, // @[:@597.4]
  input  [11:0] io_csr_op_csr_idx, // @[:@597.4]
  input  [63:0] io_csr_op_csr_data, // @[:@597.4]
  input         io_id_excep_valid, // @[:@597.4]
  input  [31:0] io_id_excep_code, // @[:@597.4]
  input  [31:0] io_id_excep_value, // @[:@597.4]
  input  [63:0] io_id_excep_pc, // @[:@597.4]
  input         io_id_excep_inst_valid, // @[:@597.4]
  output        io_mem_excep_valid, // @[:@597.4]
  output [31:0] io_mem_excep_code, // @[:@597.4]
  output [31:0] io_mem_excep_value, // @[:@597.4]
  output [63:0] io_mem_excep_pc, // @[:@597.4]
  output        io_mem_excep_inst_valid // @[:@597.4]
);
  wire [3:0] alu_io_ALUOp; // @[execute.scala 30:21:@599.4]
  wire  alu_io_op32; // @[execute.scala 30:21:@599.4]
  wire [63:0] alu_io_inputA; // @[execute.scala 30:21:@599.4]
  wire [63:0] alu_io_inputB; // @[execute.scala 30:21:@599.4]
  wire [63:0] alu_io_output; // @[execute.scala 30:21:@599.4]
  wire [3:0] bra_io_exeType; // @[execute.scala 31:21:@602.4]
  wire [63:0] bra_io_input1; // @[execute.scala 31:21:@602.4]
  wire [63:0] bra_io_input2; // @[execute.scala 31:21:@602.4]
  wire [63:0] bra_io_pc; // @[execute.scala 31:21:@602.4]
  wire [63:0] bra_io_imm; // @[execute.scala 31:21:@602.4]
  wire  bra_io_jump; // @[execute.scala 31:21:@602.4]
  wire [63:0] bra_io_jdest; // @[execute.scala 31:21:@602.4]
  wire  _T_109; // @[execute.scala 33:38:@605.4]
  wire  _T_110; // @[execute.scala 37:38:@607.4]
  wire  _T_112; // @[execute.scala 37:50:@609.4]
  wire [63:0] _T_113; // @[execute.scala 39:14:@610.4]
  wire  nls; // @[execute.scala 41:28:@612.4]
  wire  _T_115; // @[execute.scala 42:36:@613.4]
  wire  _T_117; // @[execute.scala 44:43:@615.4]
  wire [64:0] _T_120; // @[execute.scala 44:69:@616.4]
  wire [63:0] _T_121; // @[execute.scala 44:69:@617.4]
  wire [63:0] _T_122; // @[execute.scala 44:25:@618.4]
  wire [64:0] _T_130; // @[execute.scala 47:30:@623.4]
  wire [63:0] _T_131; // @[execute.scala 47:30:@624.4]
  wire  _T_132; // @[Mux.scala 46:19:@625.4]
  wire [63:0] _T_133; // @[Mux.scala 46:16:@626.4]
  wire  _T_134; // @[Mux.scala 46:19:@627.4]
  wire [63:0] _T_135; // @[Mux.scala 46:16:@628.4]
  wire  _T_136; // @[Mux.scala 46:19:@629.4]
  wire [63:0] _T_137; // @[Mux.scala 46:16:@630.4]
  wire  _T_138; // @[Mux.scala 46:19:@631.4]
  wire [63:0] _T_139; // @[Mux.scala 46:16:@632.4]
  wire  _T_140; // @[Mux.scala 46:19:@633.4]
  wire [63:0] _T_141; // @[Mux.scala 46:16:@634.4]
  wire  _T_142; // @[Mux.scala 46:19:@635.4]
  wire [64:0] _T_143; // @[execute.scala 61:34:@644.4]
  ALU alu ( // @[execute.scala 30:21:@599.4]
    .io_ALUOp(alu_io_ALUOp),
    .io_op32(alu_io_op32),
    .io_inputA(alu_io_inputA),
    .io_inputB(alu_io_inputB),
    .io_output(alu_io_output)
  );
  Branch bra ( // @[execute.scala 31:21:@602.4]
    .io_exeType(bra_io_exeType),
    .io_input1(bra_io_input1),
    .io_input2(bra_io_input2),
    .io_pc(bra_io_pc),
    .io_imm(bra_io_imm),
    .io_jump(bra_io_jump),
    .io_jdest(bra_io_jdest)
  );
  assign _T_109 = io_exe_type == 4'h7; // @[execute.scala 33:38:@605.4]
  assign _T_110 = io_exe_type == 4'h6; // @[execute.scala 37:38:@607.4]
  assign _T_112 = _T_110 | _T_109; // @[execute.scala 37:50:@609.4]
  assign _T_113 = io_dreg_rs2_valid ? io_dreg_rs2_value : io_imm; // @[execute.scala 39:14:@610.4]
  assign nls = io_exe_type == 4'h2; // @[execute.scala 41:28:@612.4]
  assign _T_115 = nls == 1'h0; // @[execute.scala 42:36:@613.4]
  assign _T_117 = io_dreg_rd_index == 5'h0; // @[execute.scala 44:43:@615.4]
  assign _T_120 = io_pc + 64'h4; // @[execute.scala 44:69:@616.4]
  assign _T_121 = io_pc + 64'h4; // @[execute.scala 44:69:@617.4]
  assign _T_122 = _T_117 ? 64'h0 : _T_121; // @[execute.scala 44:25:@618.4]
  assign _T_130 = io_imm + io_pc; // @[execute.scala 47:30:@623.4]
  assign _T_131 = io_imm + io_pc; // @[execute.scala 47:30:@624.4]
  assign _T_132 = 4'h7 == io_exe_type; // @[Mux.scala 46:19:@625.4]
  assign _T_133 = _T_132 ? io_csr_op_csr_data : alu_io_output; // @[Mux.scala 46:16:@626.4]
  assign _T_134 = 4'h6 == io_exe_type; // @[Mux.scala 46:19:@627.4]
  assign _T_135 = _T_134 ? io_csr_op_csr_data : _T_133; // @[Mux.scala 46:16:@628.4]
  assign _T_136 = 4'h3 == io_exe_type; // @[Mux.scala 46:19:@629.4]
  assign _T_137 = _T_136 ? _T_131 : _T_135; // @[Mux.scala 46:16:@630.4]
  assign _T_138 = 4'h4 == io_exe_type; // @[Mux.scala 46:19:@631.4]
  assign _T_139 = _T_138 ? io_imm : _T_137; // @[Mux.scala 46:16:@632.4]
  assign _T_140 = 4'hf == io_exe_type; // @[Mux.scala 46:19:@633.4]
  assign _T_141 = _T_140 ? _T_122 : _T_139; // @[Mux.scala 46:16:@634.4]
  assign _T_142 = 4'h8 == io_exe_type; // @[Mux.scala 46:19:@635.4]
  assign _T_143 = io_dreg_rs1_value + io_imm; // @[execute.scala 61:34:@644.4]
  assign io_nls = io_exe_type == 4'h2; // @[execute.scala 72:12:@655.4]
  assign io_addr = io_dreg_rs1_value + io_imm; // @[execute.scala 61:13:@646.4]
  assign io_data = io_dreg_rs2_value; // @[execute.scala 62:13:@647.4]
  assign io_jump = bra_io_jump; // @[execute.scala 69:19:@653.4]
  assign io_jdest = bra_io_jdest; // @[execute.scala 70:19:@654.4]
  assign io_wreg_wbrv = io_dreg_rd_valid & _T_115; // @[execute.scala 57:19:@641.4]
  assign io_wreg_wbri = io_dreg_rd_index; // @[execute.scala 58:19:@642.4]
  assign io_wreg_wbrd = _T_142 ? _T_122 : _T_141; // @[execute.scala 59:19:@643.4]
  assign io_wcsr_valid = io_csr_op_valid; // @[execute.scala 74:19:@656.4]
  assign io_wcsr_csr_idx = io_csr_op_csr_idx; // @[execute.scala 75:21:@657.4]
  assign io_wcsr_csr_data = alu_io_output; // @[execute.scala 76:22:@658.4]
  assign io_mem_excep_valid = io_id_excep_valid; // @[execute.scala 78:18:@663.4]
  assign io_mem_excep_code = io_id_excep_code; // @[execute.scala 78:18:@662.4]
  assign io_mem_excep_value = io_id_excep_value; // @[execute.scala 78:18:@661.4]
  assign io_mem_excep_pc = io_id_excep_pc; // @[execute.scala 78:18:@660.4]
  assign io_mem_excep_inst_valid = io_id_excep_inst_valid; // @[execute.scala 78:18:@659.4]
  assign alu_io_ALUOp = io_ALUOp; // @[execute.scala 52:19:@637.4]
  assign alu_io_op32 = io_op32; // @[execute.scala 55:19:@640.4]
  assign alu_io_inputA = _T_109 ? io_imm : io_dreg_rs1_value; // @[execute.scala 53:19:@638.4]
  assign alu_io_inputB = _T_112 ? io_csr_op_csr_data : _T_113; // @[execute.scala 54:19:@639.4]
  assign bra_io_exeType = io_exe_type; // @[execute.scala 64:20:@648.4]
  assign bra_io_input1 = io_dreg_rs1_value; // @[execute.scala 65:20:@649.4]
  assign bra_io_input2 = io_dreg_rs2_value; // @[execute.scala 66:20:@650.4]
  assign bra_io_pc = io_pc; // @[execute.scala 67:20:@651.4]
  assign bra_io_imm = io_imm; // @[execute.scala 68:20:@652.4]
endmodule
module MemoryCtrl( // @[:@665.2]
  input         io_nls, // @[:@668.4]
  input  [3:0]  io_lsm, // @[:@668.4]
  input  [63:0] io_addr, // @[:@668.4]
  input  [63:0] io_data, // @[:@668.4]
  output        io_ready, // @[:@668.4]
  input         io_ereg_wbrv, // @[:@668.4]
  input  [4:0]  io_ereg_wbri, // @[:@668.4]
  input  [63:0] io_ereg_wbrd, // @[:@668.4]
  output        io_wreg_wbrv, // @[:@668.4]
  output [4:0]  io_wreg_wbri, // @[:@668.4]
  output [63:0] io_wreg_wbrd, // @[:@668.4]
  output [3:0]  io_mem_mode, // @[:@668.4]
  input         io_mem_ready, // @[:@668.4]
  output [63:0] io_mem_addr, // @[:@668.4]
  input  [63:0] io_mem_rdata, // @[:@668.4]
  output [63:0] io_mem_wdata, // @[:@668.4]
  input         io_excep_valid, // @[:@668.4]
  input  [31:0] io_excep_code, // @[:@668.4]
  input  [31:0] io_excep_value, // @[:@668.4]
  input  [63:0] io_excep_pc, // @[:@668.4]
  input         io_excep_inst_valid, // @[:@668.4]
  input         io_csr_wb_valid, // @[:@668.4]
  input  [11:0] io_csr_wb_csr_idx, // @[:@668.4]
  input  [63:0] io_csr_wb_csr_data, // @[:@668.4]
  output        io_csr_wrCSROp_valid, // @[:@668.4]
  output [11:0] io_csr_wrCSROp_csr_idx, // @[:@668.4]
  output [63:0] io_csr_wrCSROp_csr_data, // @[:@668.4]
  output        io_csr_excep_valid, // @[:@668.4]
  output [31:0] io_csr_excep_code, // @[:@668.4]
  output [31:0] io_csr_excep_value, // @[:@668.4]
  output [63:0] io_csr_excep_pc, // @[:@668.4]
  output        io_csr_excep_inst_valid, // @[:@668.4]
  input         io_inter_valid, // @[:@668.4]
  input  [31:0] io_inter_bits // @[:@668.4]
);
  wire  _T_135; // @[memoryCtrl.scala 53:21:@674.4]
  wire  _T_137; // @[memoryCtrl.scala 55:45:@677.4]
  wire  _T_138; // @[memoryCtrl.scala 55:67:@678.4]
  wire  _T_139; // @[memoryCtrl.scala 55:58:@679.4]
  assign _T_135 = io_nls == 1'h0; // @[memoryCtrl.scala 53:21:@674.4]
  assign _T_137 = io_lsm != 4'hf; // @[memoryCtrl.scala 55:45:@677.4]
  assign _T_138 = io_lsm[3]; // @[memoryCtrl.scala 55:67:@678.4]
  assign _T_139 = _T_137 & _T_138; // @[memoryCtrl.scala 55:58:@679.4]
  assign io_ready = _T_135 | io_mem_ready; // @[memoryCtrl.scala 53:18:@676.4]
  assign io_wreg_wbrv = io_ereg_wbrv | _T_139; // @[memoryCtrl.scala 55:18:@681.4]
  assign io_wreg_wbri = io_ereg_wbri; // @[memoryCtrl.scala 56:18:@682.4]
  assign io_wreg_wbrd = io_nls ? io_mem_rdata : io_ereg_wbrd; // @[memoryCtrl.scala 57:18:@684.4]
  assign io_mem_mode = io_nls ? io_lsm : 4'hf; // @[memoryCtrl.scala 49:18:@671.4]
  assign io_mem_addr = io_addr; // @[memoryCtrl.scala 50:17:@672.4]
  assign io_mem_wdata = io_data; // @[memoryCtrl.scala 51:18:@673.4]
  assign io_csr_wrCSROp_valid = io_csr_wb_valid; // @[memoryCtrl.scala 63:20:@689.4]
  assign io_csr_wrCSROp_csr_idx = io_csr_wb_csr_idx; // @[memoryCtrl.scala 63:20:@688.4]
  assign io_csr_wrCSROp_csr_data = io_csr_wb_csr_data; // @[memoryCtrl.scala 63:20:@687.4]
  assign io_csr_excep_valid = io_inter_valid ? 1'h1 : io_excep_valid; // @[memoryCtrl.scala 64:20:@694.4 memoryCtrl.scala 66:26:@696.6]
  assign io_csr_excep_code = io_inter_valid ? io_inter_bits : io_excep_code; // @[memoryCtrl.scala 64:20:@693.4 memoryCtrl.scala 67:26:@697.6]
  assign io_csr_excep_value = io_excep_value; // @[memoryCtrl.scala 64:20:@692.4]
  assign io_csr_excep_pc = io_excep_pc; // @[memoryCtrl.scala 64:20:@691.4]
  assign io_csr_excep_inst_valid = io_excep_inst_valid; // @[memoryCtrl.scala 64:20:@690.4]
endmodule
module WriteBack( // @[:@700.2]
  input         io_wreg_wbrv, // @[:@703.4]
  input  [4:0]  io_wreg_wbri, // @[:@703.4]
  input  [63:0] io_wreg_wbrd, // @[:@703.4]
  output        io_reg_wen, // @[:@703.4]
  output [4:0]  io_reg_w, // @[:@703.4]
  output [63:0] io_reg_wd // @[:@703.4]
);
  assign io_reg_wen = io_wreg_wbrv; // @[writeback.scala 12:16:@705.4]
  assign io_reg_w = io_wreg_wbri; // @[writeback.scala 13:16:@706.4]
  assign io_reg_wd = io_wreg_wbrd; // @[writeback.scala 14:16:@707.4]
endmodule
module RegCtrl( // @[:@709.2]
  input         clock, // @[:@710.4]
  input  [4:0]  io_r_r1, // @[:@712.4]
  input  [4:0]  io_r_r2, // @[:@712.4]
  output [63:0] io_r_r1d, // @[:@712.4]
  output [63:0] io_r_r2d, // @[:@712.4]
  input         io_w_wen, // @[:@712.4]
  input  [4:0]  io_w_w, // @[:@712.4]
  input  [63:0] io_w_wd, // @[:@712.4]
  input         io_pass // @[:@712.4]
);
  reg [63:0] regs [0:31]; // @[reg.scala 9:19:@714.4]
  reg [63:0] _RAND_0;
  wire [63:0] regs__T_25_data; // @[reg.scala 9:19:@714.4]
  wire [4:0] regs__T_25_addr; // @[reg.scala 9:19:@714.4]
  wire [63:0] regs__T_29_data; // @[reg.scala 9:19:@714.4]
  wire [4:0] regs__T_29_addr; // @[reg.scala 9:19:@714.4]
  wire [63:0] regs__T_35_data; // @[reg.scala 9:19:@714.4]
  wire [4:0] regs__T_35_addr; // @[reg.scala 9:19:@714.4]
  wire  regs__T_35_mask; // @[reg.scala 9:19:@714.4]
  wire  regs__T_35_en; // @[reg.scala 9:19:@714.4]
  wire  _T_23; // @[reg.scala 11:29:@715.4]
  wire  _T_24; // @[reg.scala 11:18:@716.4]
  wire  _T_27; // @[reg.scala 16:29:@720.4]
  wire  _T_28; // @[reg.scala 16:18:@721.4]
  wire  _T_32; // @[reg.scala 20:30:@725.4]
  wire  _T_33; // @[reg.scala 20:20:@726.4]
  assign regs__T_25_addr = io_r_r1;
  assign regs__T_25_data = regs[regs__T_25_addr]; // @[reg.scala 9:19:@714.4]
  assign regs__T_29_addr = io_r_r2;
  assign regs__T_29_data = regs[regs__T_29_addr]; // @[reg.scala 9:19:@714.4]
  assign regs__T_35_data = io_w_wd;
  assign regs__T_35_addr = io_w_w;
  assign regs__T_35_mask = 1'h1;
  assign regs__T_35_en = _T_33 & io_pass;
  assign _T_23 = io_r_r1 == io_w_w; // @[reg.scala 11:29:@715.4]
  assign _T_24 = io_w_wen & _T_23; // @[reg.scala 11:18:@716.4]
  assign _T_27 = io_r_r2 == io_w_w; // @[reg.scala 16:29:@720.4]
  assign _T_28 = io_w_wen & _T_27; // @[reg.scala 16:18:@721.4]
  assign _T_32 = io_w_w != 5'h0; // @[reg.scala 20:30:@725.4]
  assign _T_33 = io_w_wen & _T_32; // @[reg.scala 20:20:@726.4]
  assign io_r_r1d = _T_24 ? io_w_wd : regs__T_25_data; // @[reg.scala 10:14:@719.4]
  assign io_r_r2d = _T_28 ? io_w_wd : regs__T_29_data; // @[reg.scala 15:14:@724.4]
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
      regs[regs__T_35_addr] <= regs__T_35_data; // @[reg.scala 9:19:@714.4]
    end
  end
endmodule
module PTW( // @[:@733.2]
  input         clock, // @[:@734.4]
  input         reset, // @[:@735.4]
  output [8:0]  io_rsp_ppn_p2, // @[:@736.4]
  output [8:0]  io_rsp_ppn_p1, // @[:@736.4]
  output [8:0]  io_rsp_ppn_p0, // @[:@736.4]
  output        io_rsp_U, // @[:@736.4]
  output        io_rsp_X, // @[:@736.4]
  output        io_rsp_W, // @[:@736.4]
  output        io_rsp_R, // @[:@736.4]
  output        io_ready, // @[:@736.4]
  output        io_pf, // @[:@736.4]
  output [3:0]  io_mem_mode, // @[:@736.4]
  input         io_mem_ready, // @[:@736.4]
  output [63:0] io_mem_addr, // @[:@736.4]
  input  [63:0] io_mem_rdata // @[:@736.4]
);
  reg [1:0] wait_status; // @[PTW.scala 45:30:@738.4]
  reg [31:0] _RAND_0;
  reg  read; // @[PTW.scala 49:23:@749.4]
  reg [31:0] _RAND_1;
  reg [31:0] addr; // @[PTW.scala 50:23:@750.4]
  reg [31:0] _RAND_2;
  wire  pte_V; // @[PTW.scala 52:36:@754.4]
  wire  pte_R; // @[PTW.scala 52:36:@756.4]
  wire  pte_W; // @[PTW.scala 52:36:@758.4]
  wire  pte_X; // @[PTW.scala 52:36:@760.4]
  wire  pte_U; // @[PTW.scala 52:36:@762.4]
  wire [8:0] pte_ppn_p0; // @[PTW.scala 52:36:@772.4]
  wire [8:0] pte_ppn_p1; // @[PTW.scala 52:36:@774.4]
  wire [8:0] pte_ppn_p2; // @[PTW.scala 52:36:@776.4]
  wire  _T_71; // @[PTW.scala 53:23:@782.4]
  wire  _T_73; // @[PTW.scala 53:34:@783.4]
  wire  _T_74; // @[PTW.scala 53:41:@784.4]
  wire  pte_invalid; // @[PTW.scala 53:30:@785.4]
  wire  pte_leaf; // @[PTW.scala 54:30:@786.4]
  wire [38:0] addr1; // @[Cat.scala 30:58:@794.4]
  wire  _T_111; // @[Conditional.scala 37:30:@850.4]
  wire [38:0] _GEN_2; // @[PTW.scala 70:33:@852.6]
  wire  _T_113; // @[Conditional.scala 37:30:@864.6]
  wire  _T_118; // @[PTW.scala 96:49:@890.14]
  wire  _T_120; // @[PTW.scala 96:67:@891.14]
  wire  _T_121; // @[PTW.scala 96:53:@892.14]
  wire  _T_123; // @[PTW.scala 96:36:@893.14]
  wire [1:0] _GEN_8; // @[PTW.scala 92:40:@874.12]
  wire  _GEN_10; // @[PTW.scala 92:40:@874.12]
  wire  _GEN_11; // @[PTW.scala 92:40:@874.12]
  wire  _GEN_12; // @[PTW.scala 92:40:@874.12]
  wire  _GEN_13; // @[PTW.scala 92:40:@874.12]
  wire [8:0] _GEN_18; // @[PTW.scala 92:40:@874.12]
  wire [8:0] _GEN_19; // @[PTW.scala 92:40:@874.12]
  wire [8:0] _GEN_20; // @[PTW.scala 92:40:@874.12]
  wire  _GEN_23; // @[PTW.scala 92:40:@874.12]
  wire  _GEN_25; // @[PTW.scala 92:40:@874.12]
  wire [38:0] _GEN_26; // @[PTW.scala 92:40:@874.12]
  wire [1:0] _GEN_27; // @[PTW.scala 86:36:@867.10]
  wire  _GEN_28; // @[PTW.scala 86:36:@867.10]
  wire  _GEN_29; // @[PTW.scala 86:36:@867.10]
  wire  _GEN_30; // @[PTW.scala 86:36:@867.10]
  wire  _GEN_32; // @[PTW.scala 86:36:@867.10]
  wire  _GEN_33; // @[PTW.scala 86:36:@867.10]
  wire  _GEN_34; // @[PTW.scala 86:36:@867.10]
  wire  _GEN_35; // @[PTW.scala 86:36:@867.10]
  wire [8:0] _GEN_40; // @[PTW.scala 86:36:@867.10]
  wire [8:0] _GEN_41; // @[PTW.scala 86:36:@867.10]
  wire [8:0] _GEN_42; // @[PTW.scala 86:36:@867.10]
  wire [38:0] _GEN_45; // @[PTW.scala 86:36:@867.10]
  wire [1:0] _GEN_46; // @[PTW.scala 85:33:@866.8]
  wire  _GEN_47; // @[PTW.scala 85:33:@866.8]
  wire  _GEN_48; // @[PTW.scala 85:33:@866.8]
  wire  _GEN_49; // @[PTW.scala 85:33:@866.8]
  wire  _GEN_51; // @[PTW.scala 85:33:@866.8]
  wire  _GEN_52; // @[PTW.scala 85:33:@866.8]
  wire  _GEN_53; // @[PTW.scala 85:33:@866.8]
  wire  _GEN_54; // @[PTW.scala 85:33:@866.8]
  wire [8:0] _GEN_59; // @[PTW.scala 85:33:@866.8]
  wire [8:0] _GEN_60; // @[PTW.scala 85:33:@866.8]
  wire [8:0] _GEN_61; // @[PTW.scala 85:33:@866.8]
  wire [38:0] _GEN_64; // @[PTW.scala 85:33:@866.8]
  wire  _T_126; // @[Conditional.scala 37:30:@905.8]
  wire  _T_133; // @[PTW.scala 119:36:@932.16]
  wire [1:0] _GEN_65; // @[PTW.scala 115:40:@915.14]
  wire  _GEN_66; // @[PTW.scala 115:40:@915.14]
  wire [1:0] _GEN_68; // @[PTW.scala 109:36:@908.12]
  wire  _GEN_69; // @[PTW.scala 109:36:@908.12]
  wire [1:0] _GEN_71; // @[PTW.scala 108:33:@907.10]
  wire  _GEN_72; // @[PTW.scala 108:33:@907.10]
  wire  _T_136; // @[Conditional.scala 37:30:@944.10]
  wire  _T_140; // @[PTW.scala 135:38:@950.14]
  wire  _T_141; // @[PTW.scala 135:35:@951.14]
  wire  _GEN_76; // @[PTW.scala 135:49:@952.14]
  wire  _GEN_77; // @[PTW.scala 135:49:@952.14]
  wire  _GEN_78; // @[PTW.scala 135:49:@952.14]
  wire  _GEN_79; // @[PTW.scala 135:49:@952.14]
  wire [8:0] _GEN_84; // @[PTW.scala 135:49:@952.14]
  wire [8:0] _GEN_85; // @[PTW.scala 135:49:@952.14]
  wire [8:0] _GEN_86; // @[PTW.scala 135:49:@952.14]
  wire [1:0] _GEN_89; // @[PTW.scala 131:33:@946.12]
  wire  _GEN_90; // @[PTW.scala 131:33:@946.12]
  wire  _GEN_92; // @[PTW.scala 131:33:@946.12]
  wire  _GEN_94; // @[PTW.scala 131:33:@946.12]
  wire  _GEN_95; // @[PTW.scala 131:33:@946.12]
  wire  _GEN_96; // @[PTW.scala 131:33:@946.12]
  wire  _GEN_97; // @[PTW.scala 131:33:@946.12]
  wire [8:0] _GEN_102; // @[PTW.scala 131:33:@946.12]
  wire [8:0] _GEN_103; // @[PTW.scala 131:33:@946.12]
  wire [8:0] _GEN_104; // @[PTW.scala 131:33:@946.12]
  wire [1:0] _GEN_107; // @[Conditional.scala 39:67:@945.10]
  wire  _GEN_108; // @[Conditional.scala 39:67:@945.10]
  wire  _GEN_109; // @[Conditional.scala 39:67:@945.10]
  wire  _GEN_110; // @[Conditional.scala 39:67:@945.10]
  wire  _GEN_112; // @[Conditional.scala 39:67:@945.10]
  wire  _GEN_113; // @[Conditional.scala 39:67:@945.10]
  wire  _GEN_114; // @[Conditional.scala 39:67:@945.10]
  wire  _GEN_115; // @[Conditional.scala 39:67:@945.10]
  wire [8:0] _GEN_120; // @[Conditional.scala 39:67:@945.10]
  wire [8:0] _GEN_121; // @[Conditional.scala 39:67:@945.10]
  wire [8:0] _GEN_122; // @[Conditional.scala 39:67:@945.10]
  wire [1:0] _GEN_125; // @[Conditional.scala 39:67:@906.8]
  wire  _GEN_126; // @[Conditional.scala 39:67:@906.8]
  wire  _GEN_127; // @[Conditional.scala 39:67:@906.8]
  wire  _GEN_128; // @[Conditional.scala 39:67:@906.8]
  wire  _GEN_130; // @[Conditional.scala 39:67:@906.8]
  wire  _GEN_131; // @[Conditional.scala 39:67:@906.8]
  wire  _GEN_132; // @[Conditional.scala 39:67:@906.8]
  wire  _GEN_133; // @[Conditional.scala 39:67:@906.8]
  wire [8:0] _GEN_138; // @[Conditional.scala 39:67:@906.8]
  wire [8:0] _GEN_139; // @[Conditional.scala 39:67:@906.8]
  wire [8:0] _GEN_140; // @[Conditional.scala 39:67:@906.8]
  wire [38:0] _GEN_143; // @[Conditional.scala 39:67:@906.8]
  wire [1:0] _GEN_144; // @[Conditional.scala 39:67:@865.6]
  wire  _GEN_145; // @[Conditional.scala 39:67:@865.6]
  wire  _GEN_146; // @[Conditional.scala 39:67:@865.6]
  wire  _GEN_147; // @[Conditional.scala 39:67:@865.6]
  wire  _GEN_149; // @[Conditional.scala 39:67:@865.6]
  wire  _GEN_150; // @[Conditional.scala 39:67:@865.6]
  wire  _GEN_151; // @[Conditional.scala 39:67:@865.6]
  wire  _GEN_152; // @[Conditional.scala 39:67:@865.6]
  wire [8:0] _GEN_157; // @[Conditional.scala 39:67:@865.6]
  wire [8:0] _GEN_158; // @[Conditional.scala 39:67:@865.6]
  wire [8:0] _GEN_159; // @[Conditional.scala 39:67:@865.6]
  wire [38:0] _GEN_162; // @[Conditional.scala 39:67:@865.6]
  wire [1:0] _GEN_163; // @[Conditional.scala 40:58:@851.4]
  wire [38:0] _GEN_165; // @[Conditional.scala 40:58:@851.4]
  wire [38:0] _GEN_169; // @[Conditional.scala 40:58:@851.4]
  wire  _GEN_170; // @[Conditional.scala 40:58:@851.4]
  assign pte_V = io_mem_rdata[0]; // @[PTW.scala 52:36:@754.4]
  assign pte_R = io_mem_rdata[1]; // @[PTW.scala 52:36:@756.4]
  assign pte_W = io_mem_rdata[2]; // @[PTW.scala 52:36:@758.4]
  assign pte_X = io_mem_rdata[3]; // @[PTW.scala 52:36:@760.4]
  assign pte_U = io_mem_rdata[4]; // @[PTW.scala 52:36:@762.4]
  assign pte_ppn_p0 = io_mem_rdata[18:10]; // @[PTW.scala 52:36:@772.4]
  assign pte_ppn_p1 = io_mem_rdata[27:19]; // @[PTW.scala 52:36:@774.4]
  assign pte_ppn_p2 = io_mem_rdata[36:28]; // @[PTW.scala 52:36:@776.4]
  assign _T_71 = pte_V == 1'h0; // @[PTW.scala 53:23:@782.4]
  assign _T_73 = pte_R == 1'h0; // @[PTW.scala 53:34:@783.4]
  assign _T_74 = _T_73 & pte_W; // @[PTW.scala 53:41:@784.4]
  assign pte_invalid = _T_71 | _T_74; // @[PTW.scala 53:30:@785.4]
  assign pte_leaf = pte_R | pte_X; // @[PTW.scala 54:30:@786.4]
  assign addr1 = {pte_ppn_p2,pte_ppn_p1,pte_ppn_p0,9'h0,3'h0}; // @[Cat.scala 30:58:@794.4]
  assign _T_111 = 2'h0 == wait_status; // @[Conditional.scala 37:30:@850.4]
  assign _GEN_2 = {{7'd0}, addr}; // @[PTW.scala 70:33:@852.6]
  assign _T_113 = 2'h1 == wait_status; // @[Conditional.scala 37:30:@864.6]
  assign _T_118 = pte_ppn_p1 != 9'h0; // @[PTW.scala 96:49:@890.14]
  assign _T_120 = pte_ppn_p0 != 9'h0; // @[PTW.scala 96:67:@891.14]
  assign _T_121 = _T_118 | _T_120; // @[PTW.scala 96:53:@892.14]
  assign _T_123 = _T_121 == 1'h0; // @[PTW.scala 96:36:@893.14]
  assign _GEN_8 = pte_leaf ? 2'h0 : 2'h2; // @[PTW.scala 92:40:@874.12]
  assign _GEN_10 = pte_leaf ? pte_R : 1'h0; // @[PTW.scala 92:40:@874.12]
  assign _GEN_11 = pte_leaf ? pte_W : 1'h0; // @[PTW.scala 92:40:@874.12]
  assign _GEN_12 = pte_leaf ? pte_X : 1'h0; // @[PTW.scala 92:40:@874.12]
  assign _GEN_13 = pte_leaf ? pte_U : 1'h0; // @[PTW.scala 92:40:@874.12]
  assign _GEN_18 = pte_leaf ? pte_ppn_p0 : 9'h0; // @[PTW.scala 92:40:@874.12]
  assign _GEN_19 = pte_leaf ? pte_ppn_p1 : 9'h0; // @[PTW.scala 92:40:@874.12]
  assign _GEN_20 = pte_leaf ? pte_ppn_p2 : 9'h0; // @[PTW.scala 92:40:@874.12]
  assign _GEN_23 = pte_leaf ? _T_123 : 1'h0; // @[PTW.scala 92:40:@874.12]
  assign _GEN_25 = pte_leaf ? 1'h0 : read; // @[PTW.scala 92:40:@874.12]
  assign _GEN_26 = pte_leaf ? {{7'd0}, addr} : addr1; // @[PTW.scala 92:40:@874.12]
  assign _GEN_27 = pte_invalid ? 2'h0 : _GEN_8; // @[PTW.scala 86:36:@867.10]
  assign _GEN_28 = pte_invalid ? 1'h1 : _GEN_23; // @[PTW.scala 86:36:@867.10]
  assign _GEN_29 = pte_invalid ? 1'h1 : pte_leaf; // @[PTW.scala 86:36:@867.10]
  assign _GEN_30 = pte_invalid ? 1'h0 : _GEN_25; // @[PTW.scala 86:36:@867.10]
  assign _GEN_32 = pte_invalid ? 1'h0 : _GEN_10; // @[PTW.scala 86:36:@867.10]
  assign _GEN_33 = pte_invalid ? 1'h0 : _GEN_11; // @[PTW.scala 86:36:@867.10]
  assign _GEN_34 = pte_invalid ? 1'h0 : _GEN_12; // @[PTW.scala 86:36:@867.10]
  assign _GEN_35 = pte_invalid ? 1'h0 : _GEN_13; // @[PTW.scala 86:36:@867.10]
  assign _GEN_40 = pte_invalid ? 9'h0 : _GEN_18; // @[PTW.scala 86:36:@867.10]
  assign _GEN_41 = pte_invalid ? 9'h0 : _GEN_19; // @[PTW.scala 86:36:@867.10]
  assign _GEN_42 = pte_invalid ? 9'h0 : _GEN_20; // @[PTW.scala 86:36:@867.10]
  assign _GEN_45 = pte_invalid ? {{7'd0}, addr} : _GEN_26; // @[PTW.scala 86:36:@867.10]
  assign _GEN_46 = io_mem_ready ? _GEN_27 : wait_status; // @[PTW.scala 85:33:@866.8]
  assign _GEN_47 = io_mem_ready ? _GEN_28 : 1'h0; // @[PTW.scala 85:33:@866.8]
  assign _GEN_48 = io_mem_ready ? _GEN_29 : 1'h0; // @[PTW.scala 85:33:@866.8]
  assign _GEN_49 = io_mem_ready ? _GEN_30 : read; // @[PTW.scala 85:33:@866.8]
  assign _GEN_51 = io_mem_ready ? _GEN_32 : 1'h0; // @[PTW.scala 85:33:@866.8]
  assign _GEN_52 = io_mem_ready ? _GEN_33 : 1'h0; // @[PTW.scala 85:33:@866.8]
  assign _GEN_53 = io_mem_ready ? _GEN_34 : 1'h0; // @[PTW.scala 85:33:@866.8]
  assign _GEN_54 = io_mem_ready ? _GEN_35 : 1'h0; // @[PTW.scala 85:33:@866.8]
  assign _GEN_59 = io_mem_ready ? _GEN_40 : 9'h0; // @[PTW.scala 85:33:@866.8]
  assign _GEN_60 = io_mem_ready ? _GEN_41 : 9'h0; // @[PTW.scala 85:33:@866.8]
  assign _GEN_61 = io_mem_ready ? _GEN_42 : 9'h0; // @[PTW.scala 85:33:@866.8]
  assign _GEN_64 = io_mem_ready ? _GEN_45 : {{7'd0}, addr}; // @[PTW.scala 85:33:@866.8]
  assign _T_126 = 2'h2 == wait_status; // @[Conditional.scala 37:30:@905.8]
  assign _T_133 = _T_120 == 1'h0; // @[PTW.scala 119:36:@932.16]
  assign _GEN_65 = pte_leaf ? 2'h0 : 2'h3; // @[PTW.scala 115:40:@915.14]
  assign _GEN_66 = pte_leaf ? _T_133 : 1'h0; // @[PTW.scala 115:40:@915.14]
  assign _GEN_68 = pte_invalid ? 2'h0 : _GEN_65; // @[PTW.scala 109:36:@908.12]
  assign _GEN_69 = pte_invalid ? 1'h1 : _GEN_66; // @[PTW.scala 109:36:@908.12]
  assign _GEN_71 = io_mem_ready ? _GEN_68 : wait_status; // @[PTW.scala 108:33:@907.10]
  assign _GEN_72 = io_mem_ready ? _GEN_69 : 1'h0; // @[PTW.scala 108:33:@907.10]
  assign _T_136 = 2'h3 == wait_status; // @[Conditional.scala 37:30:@944.10]
  assign _T_140 = pte_leaf == 1'h0; // @[PTW.scala 135:38:@950.14]
  assign _T_141 = pte_invalid | _T_140; // @[PTW.scala 135:35:@951.14]
  assign _GEN_76 = _T_141 ? 1'h0 : pte_R; // @[PTW.scala 135:49:@952.14]
  assign _GEN_77 = _T_141 ? 1'h0 : pte_W; // @[PTW.scala 135:49:@952.14]
  assign _GEN_78 = _T_141 ? 1'h0 : pte_X; // @[PTW.scala 135:49:@952.14]
  assign _GEN_79 = _T_141 ? 1'h0 : pte_U; // @[PTW.scala 135:49:@952.14]
  assign _GEN_84 = _T_141 ? 9'h0 : pte_ppn_p0; // @[PTW.scala 135:49:@952.14]
  assign _GEN_85 = _T_141 ? 9'h0 : pte_ppn_p1; // @[PTW.scala 135:49:@952.14]
  assign _GEN_86 = _T_141 ? 9'h0 : pte_ppn_p2; // @[PTW.scala 135:49:@952.14]
  assign _GEN_89 = io_mem_ready ? 2'h0 : wait_status; // @[PTW.scala 131:33:@946.12]
  assign _GEN_90 = io_mem_ready ? 1'h0 : read; // @[PTW.scala 131:33:@946.12]
  assign _GEN_92 = io_mem_ready ? _T_141 : 1'h0; // @[PTW.scala 131:33:@946.12]
  assign _GEN_94 = io_mem_ready ? _GEN_76 : 1'h0; // @[PTW.scala 131:33:@946.12]
  assign _GEN_95 = io_mem_ready ? _GEN_77 : 1'h0; // @[PTW.scala 131:33:@946.12]
  assign _GEN_96 = io_mem_ready ? _GEN_78 : 1'h0; // @[PTW.scala 131:33:@946.12]
  assign _GEN_97 = io_mem_ready ? _GEN_79 : 1'h0; // @[PTW.scala 131:33:@946.12]
  assign _GEN_102 = io_mem_ready ? _GEN_84 : 9'h0; // @[PTW.scala 131:33:@946.12]
  assign _GEN_103 = io_mem_ready ? _GEN_85 : 9'h0; // @[PTW.scala 131:33:@946.12]
  assign _GEN_104 = io_mem_ready ? _GEN_86 : 9'h0; // @[PTW.scala 131:33:@946.12]
  assign _GEN_107 = _T_136 ? _GEN_89 : wait_status; // @[Conditional.scala 39:67:@945.10]
  assign _GEN_108 = _T_136 ? _GEN_90 : read; // @[Conditional.scala 39:67:@945.10]
  assign _GEN_109 = _T_136 ? io_mem_ready : 1'h0; // @[Conditional.scala 39:67:@945.10]
  assign _GEN_110 = _T_136 ? _GEN_92 : 1'h0; // @[Conditional.scala 39:67:@945.10]
  assign _GEN_112 = _T_136 ? _GEN_94 : 1'h0; // @[Conditional.scala 39:67:@945.10]
  assign _GEN_113 = _T_136 ? _GEN_95 : 1'h0; // @[Conditional.scala 39:67:@945.10]
  assign _GEN_114 = _T_136 ? _GEN_96 : 1'h0; // @[Conditional.scala 39:67:@945.10]
  assign _GEN_115 = _T_136 ? _GEN_97 : 1'h0; // @[Conditional.scala 39:67:@945.10]
  assign _GEN_120 = _T_136 ? _GEN_102 : 9'h0; // @[Conditional.scala 39:67:@945.10]
  assign _GEN_121 = _T_136 ? _GEN_103 : 9'h0; // @[Conditional.scala 39:67:@945.10]
  assign _GEN_122 = _T_136 ? _GEN_104 : 9'h0; // @[Conditional.scala 39:67:@945.10]
  assign _GEN_125 = _T_126 ? _GEN_71 : _GEN_107; // @[Conditional.scala 39:67:@906.8]
  assign _GEN_126 = _T_126 ? _GEN_72 : _GEN_110; // @[Conditional.scala 39:67:@906.8]
  assign _GEN_127 = _T_126 ? _GEN_48 : _GEN_109; // @[Conditional.scala 39:67:@906.8]
  assign _GEN_128 = _T_126 ? _GEN_49 : _GEN_108; // @[Conditional.scala 39:67:@906.8]
  assign _GEN_130 = _T_126 ? _GEN_51 : _GEN_112; // @[Conditional.scala 39:67:@906.8]
  assign _GEN_131 = _T_126 ? _GEN_52 : _GEN_113; // @[Conditional.scala 39:67:@906.8]
  assign _GEN_132 = _T_126 ? _GEN_53 : _GEN_114; // @[Conditional.scala 39:67:@906.8]
  assign _GEN_133 = _T_126 ? _GEN_54 : _GEN_115; // @[Conditional.scala 39:67:@906.8]
  assign _GEN_138 = _T_126 ? _GEN_59 : _GEN_120; // @[Conditional.scala 39:67:@906.8]
  assign _GEN_139 = _T_126 ? _GEN_60 : _GEN_121; // @[Conditional.scala 39:67:@906.8]
  assign _GEN_140 = _T_126 ? _GEN_61 : _GEN_122; // @[Conditional.scala 39:67:@906.8]
  assign _GEN_143 = _T_126 ? _GEN_64 : {{7'd0}, addr}; // @[Conditional.scala 39:67:@906.8]
  assign _GEN_144 = _T_113 ? _GEN_46 : _GEN_125; // @[Conditional.scala 39:67:@865.6]
  assign _GEN_145 = _T_113 ? _GEN_47 : _GEN_126; // @[Conditional.scala 39:67:@865.6]
  assign _GEN_146 = _T_113 ? _GEN_48 : _GEN_127; // @[Conditional.scala 39:67:@865.6]
  assign _GEN_147 = _T_113 ? _GEN_49 : _GEN_128; // @[Conditional.scala 39:67:@865.6]
  assign _GEN_149 = _T_113 ? _GEN_51 : _GEN_130; // @[Conditional.scala 39:67:@865.6]
  assign _GEN_150 = _T_113 ? _GEN_52 : _GEN_131; // @[Conditional.scala 39:67:@865.6]
  assign _GEN_151 = _T_113 ? _GEN_53 : _GEN_132; // @[Conditional.scala 39:67:@865.6]
  assign _GEN_152 = _T_113 ? _GEN_54 : _GEN_133; // @[Conditional.scala 39:67:@865.6]
  assign _GEN_157 = _T_113 ? _GEN_59 : _GEN_138; // @[Conditional.scala 39:67:@865.6]
  assign _GEN_158 = _T_113 ? _GEN_60 : _GEN_139; // @[Conditional.scala 39:67:@865.6]
  assign _GEN_159 = _T_113 ? _GEN_61 : _GEN_140; // @[Conditional.scala 39:67:@865.6]
  assign _GEN_162 = _T_113 ? _GEN_64 : _GEN_143; // @[Conditional.scala 39:67:@865.6]
  assign _GEN_163 = _T_111 ? wait_status : _GEN_144; // @[Conditional.scala 40:58:@851.4]
  assign _GEN_165 = _T_111 ? _GEN_2 : {{7'd0}, addr}; // @[Conditional.scala 40:58:@851.4]
  assign _GEN_169 = _T_111 ? _GEN_2 : _GEN_162; // @[Conditional.scala 40:58:@851.4]
  assign _GEN_170 = _T_111 ? read : _GEN_147; // @[Conditional.scala 40:58:@851.4]
  assign io_rsp_ppn_p2 = _T_111 ? 9'h0 : _GEN_159; // @[PTW.scala 63:18:@845.4 PTW.scala 94:33:@887.14 PTW.scala 117:33:@928.16 PTW.scala 138:33:@967.16]
  assign io_rsp_ppn_p1 = _T_111 ? 9'h0 : _GEN_158; // @[PTW.scala 63:18:@844.4 PTW.scala 94:33:@886.14 PTW.scala 117:33:@927.16 PTW.scala 138:33:@966.16]
  assign io_rsp_ppn_p0 = _T_111 ? 9'h0 : _GEN_157; // @[PTW.scala 63:18:@843.4 PTW.scala 94:33:@885.14 PTW.scala 117:33:@926.16 PTW.scala 138:33:@965.16]
  assign io_rsp_U = _T_111 ? 1'h0 : _GEN_152; // @[PTW.scala 63:18:@838.4 PTW.scala 94:33:@880.14 PTW.scala 117:33:@921.16 PTW.scala 138:33:@960.16]
  assign io_rsp_X = _T_111 ? 1'h0 : _GEN_151; // @[PTW.scala 63:18:@837.4 PTW.scala 94:33:@879.14 PTW.scala 117:33:@920.16 PTW.scala 138:33:@959.16]
  assign io_rsp_W = _T_111 ? 1'h0 : _GEN_150; // @[PTW.scala 63:18:@836.4 PTW.scala 94:33:@878.14 PTW.scala 117:33:@919.16 PTW.scala 138:33:@958.16]
  assign io_rsp_R = _T_111 ? 1'h0 : _GEN_149; // @[PTW.scala 63:18:@835.4 PTW.scala 94:33:@877.14 PTW.scala 117:33:@918.16 PTW.scala 138:33:@957.16]
  assign io_ready = _T_111 ? 1'h0 : _GEN_146; // @[PTW.scala 65:18:@849.4 PTW.scala 90:33:@870.12 PTW.scala 97:33:@895.14 PTW.scala 113:33:@911.14 PTW.scala 120:33:@934.16 PTW.scala 134:29:@949.14]
  assign io_pf = _T_111 ? 1'h0 : _GEN_145; // @[PTW.scala 64:18:@848.4 PTW.scala 89:33:@869.12 PTW.scala 96:33:@894.14 PTW.scala 112:33:@910.14 PTW.scala 119:33:@933.16 PTW.scala 136:33:@953.16]
  assign io_mem_mode = read ? 4'hb : 4'hf; // @[PTW.scala 60:18:@800.4 PTW.scala 72:29:@854.8]
  assign io_mem_addr = {{25'd0}, _GEN_165}; // @[PTW.scala 61:18:@801.4 PTW.scala 73:29:@855.8]
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
  read = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  addr = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      wait_status <= 2'h0;
    end else begin
      if (!(_T_111)) begin
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
          if (_T_126) begin
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
            if (_T_136) begin
              if (io_mem_ready) begin
                wait_status <= 2'h0;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      read <= 1'h0;
    end else begin
      if (!(_T_111)) begin
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
          if (_T_126) begin
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
            if (_T_136) begin
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
      addr <= _GEN_169[31:0];
    end
  end
endmodule
module MMU( // @[:@1215.2]
  input         clock, // @[:@1216.4]
  input         reset, // @[:@1217.4]
  input  [3:0]  io_mem_mode, // @[:@1218.4]
  output        io_mem_ready, // @[:@1218.4]
  input  [63:0] io_mem_addr, // @[:@1218.4]
  output [63:0] io_mem_rdata, // @[:@1218.4]
  input  [63:0] io_mem_wdata, // @[:@1218.4]
  input  [3:0]  io_insr_mode, // @[:@1218.4]
  output        io_insr_ready, // @[:@1218.4]
  input  [63:0] io_insr_addr, // @[:@1218.4]
  output [63:0] io_insr_rdata, // @[:@1218.4]
  input         io_insr_rst, // @[:@1218.4]
  input  [1:0]  io_csr_priv, // @[:@1218.4]
  input         io_csr_mxr, // @[:@1218.4]
  input         io_csr_sum, // @[:@1218.4]
  output [3:0]  io_if_iom_mode, // @[:@1218.4]
  input         io_if_iom_ready, // @[:@1218.4]
  output [63:0] io_if_iom_addr, // @[:@1218.4]
  input  [63:0] io_if_iom_rdata, // @[:@1218.4]
  output [3:0]  io_mem_iom_mode, // @[:@1218.4]
  input         io_mem_iom_ready, // @[:@1218.4]
  output [63:0] io_mem_iom_addr, // @[:@1218.4]
  input  [63:0] io_mem_iom_rdata, // @[:@1218.4]
  output [63:0] io_mem_iom_wdata // @[:@1218.4]
);
  wire  ptw_if_clock; // @[MMU.scala 21:23:@1220.4]
  wire  ptw_if_reset; // @[MMU.scala 21:23:@1220.4]
  wire [8:0] ptw_if_io_rsp_ppn_p2; // @[MMU.scala 21:23:@1220.4]
  wire [8:0] ptw_if_io_rsp_ppn_p1; // @[MMU.scala 21:23:@1220.4]
  wire [8:0] ptw_if_io_rsp_ppn_p0; // @[MMU.scala 21:23:@1220.4]
  wire  ptw_if_io_rsp_U; // @[MMU.scala 21:23:@1220.4]
  wire  ptw_if_io_rsp_X; // @[MMU.scala 21:23:@1220.4]
  wire  ptw_if_io_rsp_W; // @[MMU.scala 21:23:@1220.4]
  wire  ptw_if_io_rsp_R; // @[MMU.scala 21:23:@1220.4]
  wire  ptw_if_io_ready; // @[MMU.scala 21:23:@1220.4]
  wire  ptw_if_io_pf; // @[MMU.scala 21:23:@1220.4]
  wire [3:0] ptw_if_io_mem_mode; // @[MMU.scala 21:23:@1220.4]
  wire  ptw_if_io_mem_ready; // @[MMU.scala 21:23:@1220.4]
  wire [63:0] ptw_if_io_mem_addr; // @[MMU.scala 21:23:@1220.4]
  wire [63:0] ptw_if_io_mem_rdata; // @[MMU.scala 21:23:@1220.4]
  wire  ptw_mem_clock; // @[MMU.scala 22:23:@1223.4]
  wire  ptw_mem_reset; // @[MMU.scala 22:23:@1223.4]
  wire [8:0] ptw_mem_io_rsp_ppn_p2; // @[MMU.scala 22:23:@1223.4]
  wire [8:0] ptw_mem_io_rsp_ppn_p1; // @[MMU.scala 22:23:@1223.4]
  wire [8:0] ptw_mem_io_rsp_ppn_p0; // @[MMU.scala 22:23:@1223.4]
  wire  ptw_mem_io_rsp_U; // @[MMU.scala 22:23:@1223.4]
  wire  ptw_mem_io_rsp_X; // @[MMU.scala 22:23:@1223.4]
  wire  ptw_mem_io_rsp_W; // @[MMU.scala 22:23:@1223.4]
  wire  ptw_mem_io_rsp_R; // @[MMU.scala 22:23:@1223.4]
  wire  ptw_mem_io_ready; // @[MMU.scala 22:23:@1223.4]
  wire  ptw_mem_io_pf; // @[MMU.scala 22:23:@1223.4]
  wire [3:0] ptw_mem_io_mem_mode; // @[MMU.scala 22:23:@1223.4]
  wire  ptw_mem_io_mem_ready; // @[MMU.scala 22:23:@1223.4]
  wire [63:0] ptw_mem_io_mem_addr; // @[MMU.scala 22:23:@1223.4]
  wire [63:0] ptw_mem_io_mem_rdata; // @[MMU.scala 22:23:@1223.4]
  wire  _T_95; // @[MMU.scala 27:33:@1226.4]
  wire  _T_97; // @[MMU.scala 27:47:@1227.4]
  wire  e_if_user; // @[MMU.scala 27:44:@1228.4]
  wire  e_if_exec; // @[MMU.scala 28:21:@1229.4]
  wire  _T_99; // @[MMU.scala 29:34:@1230.4]
  wire  e_if; // @[MMU.scala 29:47:@1231.4]
  wire  _T_102; // @[MMU.scala 31:47:@1233.4]
  wire  e_mem_user; // @[MMU.scala 31:44:@1234.4]
  wire  _T_103; // @[memoryCtrl.scala 20:35:@1235.4]
  wire [3:0] _T_104; // @[memoryCtrl.scala 20:46:@1236.4]
  wire  _T_106; // @[memoryCtrl.scala 20:46:@1237.4]
  wire  _T_108; // @[memoryCtrl.scala 20:42:@1238.4]
  wire  _T_109; // @[memoryCtrl.scala 20:39:@1239.4]
  wire  _T_110; // @[MMU.scala 32:83:@1240.4]
  wire  _T_111; // @[MMU.scala 32:65:@1241.4]
  wire  _T_113; // @[MMU.scala 32:49:@1242.4]
  wire  e_mem_read; // @[MMU.scala 32:46:@1243.4]
  wire  _T_116; // @[memoryCtrl.scala 21:34:@1245.4]
  wire  _T_118; // @[MMU.scala 33:50:@1246.4]
  wire  e_mem_write; // @[MMU.scala 33:47:@1247.4]
  wire  _T_119; // @[MMU.scala 34:33:@1248.4]
  wire  _T_121; // @[MMU.scala 34:47:@1249.4]
  wire  _T_122; // @[MMU.scala 34:44:@1250.4]
  wire  e_mem_sum; // @[MMU.scala 34:59:@1251.4]
  wire  _T_123; // @[MMU.scala 35:35:@1252.4]
  wire  _T_124; // @[MMU.scala 35:49:@1253.4]
  wire  _T_125; // @[MMU.scala 35:63:@1254.4]
  wire  e_mem; // @[MMU.scala 35:78:@1255.4]
  wire  is_mem; // @[MMU.scala 38:29:@1256.4]
  wire  _T_126; // @[MMU.scala 39:30:@1257.4]
  wire  _T_128; // @[MMU.scala 39:46:@1258.4]
  wire  is_if; // @[MMU.scala 39:43:@1259.4]
  reg [1:0] if_status; // @[MMU.scala 42:27:@1260.4]
  reg [31:0] _RAND_0;
  reg [63:0] if_addr; // @[MMU.scala 43:27:@1261.4]
  reg [63:0] _RAND_1;
  reg [63:0] if_pha; // @[MMU.scala 44:27:@1262.4]
  reg [63:0] _RAND_2;
  reg [1:0] mem_status; // @[MMU.scala 45:27:@1263.4]
  reg [31:0] _RAND_3;
  reg [63:0] mem_addr; // @[MMU.scala 46:27:@1264.4]
  reg [63:0] _RAND_4;
  reg [63:0] mem_pha; // @[MMU.scala 47:27:@1265.4]
  reg [63:0] _RAND_5;
  wire  if_free; // @[MMU.scala 49:30:@1266.4]
  wire  mem_free; // @[MMU.scala 50:31:@1267.4]
  wire [64:0] _T_139; // @[MMU.scala 56:62:@1268.4]
  wire [64:0] _T_140; // @[MMU.scala 56:62:@1269.4]
  wire [63:0] real_if_addr; // @[MMU.scala 56:62:@1270.4]
  wire [64:0] _T_142; // @[MMU.scala 57:62:@1272.4]
  wire [64:0] _T_143; // @[MMU.scala 57:62:@1273.4]
  wire [63:0] real_mem_addr; // @[MMU.scala 57:62:@1274.4]
  wire [11:0] _T_148; // @[MMU.scala 58:66:@1278.4]
  wire [63:0] ptw_if_addr; // @[Cat.scala 30:58:@1280.4]
  wire [11:0] _T_153; // @[MMU.scala 59:67:@1283.4]
  wire [63:0] ptw_mem_addr; // @[Cat.scala 30:58:@1285.4]
  wire  _T_176; // @[Conditional.scala 37:30:@1332.4]
  wire  _T_177; // @[MMU.scala 97:19:@1334.6]
  wire [63:0] _GEN_5; // @[MMU.scala 97:32:@1335.6]
  wire [1:0] _GEN_6; // @[MMU.scala 97:32:@1335.6]
  wire [63:0] _GEN_10; // @[MMU.scala 97:32:@1335.6]
  wire  _T_179; // @[Conditional.scala 37:30:@1350.6]
  wire [1:0] _GEN_12; // @[MMU.scala 116:21:@1355.10]
  wire [63:0] _GEN_13; // @[MMU.scala 116:21:@1355.10]
  wire  _GEN_14; // @[MMU.scala 115:30:@1354.8]
  wire [1:0] _GEN_15; // @[MMU.scala 115:30:@1354.8]
  wire [63:0] _GEN_16; // @[MMU.scala 115:30:@1354.8]
  wire  _T_182; // @[Conditional.scala 37:30:@1367.8]
  wire  _T_183; // @[MMU.scala 131:23:@1372.12]
  wire  _T_185; // @[MMU.scala 131:43:@1373.12]
  wire  _T_186; // @[MMU.scala 131:40:@1374.12]
  wire [63:0] _GEN_18; // @[MMU.scala 131:57:@1375.12]
  wire [63:0] _GEN_19; // @[MMU.scala 131:57:@1375.12]
  wire [1:0] _GEN_20; // @[MMU.scala 129:30:@1370.10]
  wire  _GEN_21; // @[MMU.scala 129:30:@1370.10]
  wire [63:0] _GEN_22; // @[MMU.scala 129:30:@1370.10]
  wire [63:0] _GEN_23; // @[MMU.scala 129:30:@1370.10]
  wire [63:0] _GEN_24; // @[Conditional.scala 39:67:@1368.8]
  wire [1:0] _GEN_25; // @[Conditional.scala 39:67:@1368.8]
  wire  _GEN_26; // @[Conditional.scala 39:67:@1368.8]
  wire [63:0] _GEN_27; // @[Conditional.scala 39:67:@1368.8]
  wire [63:0] _GEN_28; // @[Conditional.scala 39:67:@1368.8]
  wire [3:0] _GEN_29; // @[Conditional.scala 39:67:@1351.6]
  wire [63:0] _GEN_30; // @[Conditional.scala 39:67:@1351.6]
  wire  _GEN_32; // @[Conditional.scala 39:67:@1351.6]
  wire [1:0] _GEN_33; // @[Conditional.scala 39:67:@1351.6]
  wire [63:0] _GEN_34; // @[Conditional.scala 39:67:@1351.6]
  wire [63:0] _GEN_35; // @[Conditional.scala 39:67:@1351.6]
  wire [63:0] _GEN_36; // @[Conditional.scala 40:58:@1333.4]
  wire [1:0] _GEN_37; // @[Conditional.scala 40:58:@1333.4]
  wire [63:0] _GEN_41; // @[Conditional.scala 40:58:@1333.4]
  wire  _T_188; // @[Conditional.scala 37:30:@1384.4]
  wire  _T_189; // @[MMU.scala 144:20:@1386.6]
  wire [1:0] _GEN_44; // @[MMU.scala 154:35:@1398.10]
  wire [63:0] _GEN_51; // @[MMU.scala 144:32:@1387.6]
  wire [1:0] _GEN_52; // @[MMU.scala 144:32:@1387.6]
  wire [63:0] _GEN_56; // @[MMU.scala 144:32:@1387.6]
  wire  _GEN_57; // @[MMU.scala 144:32:@1387.6]
  wire  _T_192; // @[Conditional.scala 37:30:@1406.6]
  wire [1:0] _GEN_59; // @[MMU.scala 165:22:@1411.10]
  wire [63:0] _GEN_60; // @[MMU.scala 165:22:@1411.10]
  wire  _GEN_61; // @[MMU.scala 164:31:@1410.8]
  wire [1:0] _GEN_62; // @[MMU.scala 164:31:@1410.8]
  wire [63:0] _GEN_63; // @[MMU.scala 164:31:@1410.8]
  wire  _T_195; // @[Conditional.scala 37:30:@1423.8]
  wire [1:0] _GEN_64; // @[MMU.scala 177:31:@1426.10]
  wire [63:0] _GEN_65; // @[Conditional.scala 39:67:@1424.8]
  wire [1:0] _GEN_66; // @[Conditional.scala 39:67:@1424.8]
  wire  _GEN_67; // @[Conditional.scala 39:67:@1424.8]
  wire [3:0] _GEN_68; // @[Conditional.scala 39:67:@1407.6]
  wire [63:0] _GEN_69; // @[Conditional.scala 39:67:@1407.6]
  wire  _GEN_71; // @[Conditional.scala 39:67:@1407.6]
  wire [1:0] _GEN_72; // @[Conditional.scala 39:67:@1407.6]
  wire [63:0] _GEN_73; // @[Conditional.scala 39:67:@1407.6]
  wire [63:0] _GEN_74; // @[Conditional.scala 40:58:@1385.4]
  wire [1:0] _GEN_75; // @[Conditional.scala 40:58:@1385.4]
  wire [63:0] _GEN_79; // @[Conditional.scala 40:58:@1385.4]
  PTW ptw_if ( // @[MMU.scala 21:23:@1220.4]
    .clock(ptw_if_clock),
    .reset(ptw_if_reset),
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
  PTW ptw_mem ( // @[MMU.scala 22:23:@1223.4]
    .clock(ptw_mem_clock),
    .reset(ptw_mem_reset),
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
  assign _T_95 = io_csr_priv == 2'h0; // @[MMU.scala 27:33:@1226.4]
  assign _T_97 = ptw_if_io_rsp_U == 1'h0; // @[MMU.scala 27:47:@1227.4]
  assign e_if_user = _T_95 & _T_97; // @[MMU.scala 27:44:@1228.4]
  assign e_if_exec = ptw_if_io_rsp_X == 1'h0; // @[MMU.scala 28:21:@1229.4]
  assign _T_99 = ptw_if_io_pf | e_if_user; // @[MMU.scala 29:34:@1230.4]
  assign e_if = _T_99 | e_if_exec; // @[MMU.scala 29:47:@1231.4]
  assign _T_102 = ptw_mem_io_rsp_U == 1'h0; // @[MMU.scala 31:47:@1233.4]
  assign e_mem_user = _T_95 & _T_102; // @[MMU.scala 31:44:@1234.4]
  assign _T_103 = io_mem_mode[3]; // @[memoryCtrl.scala 20:35:@1235.4]
  assign _T_104 = ~ io_mem_mode; // @[memoryCtrl.scala 20:46:@1236.4]
  assign _T_106 = _T_104 == 4'h0; // @[memoryCtrl.scala 20:46:@1237.4]
  assign _T_108 = _T_106 == 1'h0; // @[memoryCtrl.scala 20:42:@1238.4]
  assign _T_109 = _T_103 & _T_108; // @[memoryCtrl.scala 20:39:@1239.4]
  assign _T_110 = ptw_mem_io_rsp_X & io_csr_mxr; // @[MMU.scala 32:83:@1240.4]
  assign _T_111 = ptw_mem_io_rsp_R | _T_110; // @[MMU.scala 32:65:@1241.4]
  assign _T_113 = _T_111 == 1'h0; // @[MMU.scala 32:49:@1242.4]
  assign e_mem_read = _T_109 & _T_113; // @[MMU.scala 32:46:@1243.4]
  assign _T_116 = _T_103 == 1'h0; // @[memoryCtrl.scala 21:34:@1245.4]
  assign _T_118 = ptw_mem_io_rsp_W == 1'h0; // @[MMU.scala 33:50:@1246.4]
  assign e_mem_write = _T_116 & _T_118; // @[MMU.scala 33:47:@1247.4]
  assign _T_119 = io_csr_priv == 2'h1; // @[MMU.scala 34:33:@1248.4]
  assign _T_121 = io_csr_sum == 1'h0; // @[MMU.scala 34:47:@1249.4]
  assign _T_122 = _T_119 & _T_121; // @[MMU.scala 34:44:@1250.4]
  assign e_mem_sum = _T_122 & ptw_mem_io_rsp_U; // @[MMU.scala 34:59:@1251.4]
  assign _T_123 = ptw_mem_io_pf | e_mem_user; // @[MMU.scala 35:35:@1252.4]
  assign _T_124 = _T_123 | e_mem_read; // @[MMU.scala 35:49:@1253.4]
  assign _T_125 = _T_124 | e_mem_write; // @[MMU.scala 35:63:@1254.4]
  assign e_mem = _T_125 | e_mem_sum; // @[MMU.scala 35:78:@1255.4]
  assign is_mem = io_mem_mode != 4'hf; // @[MMU.scala 38:29:@1256.4]
  assign _T_126 = io_insr_mode != 4'hf; // @[MMU.scala 39:30:@1257.4]
  assign _T_128 = is_mem == 1'h0; // @[MMU.scala 39:46:@1258.4]
  assign is_if = _T_126 & _T_128; // @[MMU.scala 39:43:@1259.4]
  assign if_free = if_status == 2'h0; // @[MMU.scala 49:30:@1266.4]
  assign mem_free = mem_status == 2'h0; // @[MMU.scala 50:31:@1267.4]
  assign _T_139 = io_insr_addr - 64'hc0020000; // @[MMU.scala 56:62:@1268.4]
  assign _T_140 = $unsigned(_T_139); // @[MMU.scala 56:62:@1269.4]
  assign real_if_addr = _T_140[63:0]; // @[MMU.scala 56:62:@1270.4]
  assign _T_142 = io_mem_addr - 64'hc0020000; // @[MMU.scala 57:62:@1272.4]
  assign _T_143 = $unsigned(_T_142); // @[MMU.scala 57:62:@1273.4]
  assign real_mem_addr = _T_143[63:0]; // @[MMU.scala 57:62:@1274.4]
  assign _T_148 = if_addr[11:0]; // @[MMU.scala 58:66:@1278.4]
  assign ptw_if_addr = {25'h0,ptw_if_io_rsp_ppn_p2,ptw_if_io_rsp_ppn_p1,ptw_if_io_rsp_ppn_p0,_T_148}; // @[Cat.scala 30:58:@1280.4]
  assign _T_153 = mem_addr[11:0]; // @[MMU.scala 59:67:@1283.4]
  assign ptw_mem_addr = {25'h0,ptw_mem_io_rsp_ppn_p2,ptw_mem_io_rsp_ppn_p1,ptw_mem_io_rsp_ppn_p0,_T_153}; // @[Cat.scala 30:58:@1285.4]
  assign _T_176 = 2'h0 == if_status; // @[Conditional.scala 37:30:@1332.4]
  assign _T_177 = is_if & mem_free; // @[MMU.scala 97:19:@1334.6]
  assign _GEN_5 = _T_177 ? real_if_addr : if_addr; // @[MMU.scala 97:32:@1335.6]
  assign _GEN_6 = _T_177 ? 2'h2 : if_status; // @[MMU.scala 97:32:@1335.6]
  assign _GEN_10 = _T_177 ? real_if_addr : if_pha; // @[MMU.scala 97:32:@1335.6]
  assign _T_179 = 2'h1 == if_status; // @[Conditional.scala 37:30:@1350.6]
  assign _GEN_12 = e_if ? 2'h0 : 2'h2; // @[MMU.scala 116:21:@1355.10]
  assign _GEN_13 = e_if ? if_pha : ptw_if_addr; // @[MMU.scala 116:21:@1355.10]
  assign _GEN_14 = ptw_if_io_ready ? e_if : 1'h0; // @[MMU.scala 115:30:@1354.8]
  assign _GEN_15 = ptw_if_io_ready ? _GEN_12 : if_status; // @[MMU.scala 115:30:@1354.8]
  assign _GEN_16 = ptw_if_io_ready ? _GEN_13 : if_pha; // @[MMU.scala 115:30:@1354.8]
  assign _T_182 = 2'h2 == if_status; // @[Conditional.scala 37:30:@1367.8]
  assign _T_183 = if_addr == real_if_addr; // @[MMU.scala 131:23:@1372.12]
  assign _T_185 = io_insr_rst == 1'h0; // @[MMU.scala 131:43:@1373.12]
  assign _T_186 = _T_183 & _T_185; // @[MMU.scala 131:40:@1374.12]
  assign _GEN_18 = _T_186 ? if_addr : real_if_addr; // @[MMU.scala 131:57:@1375.12]
  assign _GEN_19 = _T_186 ? if_pha : real_if_addr; // @[MMU.scala 131:57:@1375.12]
  assign _GEN_20 = io_if_iom_ready ? 2'h0 : if_status; // @[MMU.scala 129:30:@1370.10]
  assign _GEN_21 = io_if_iom_ready ? _T_186 : 1'h0; // @[MMU.scala 129:30:@1370.10]
  assign _GEN_22 = io_if_iom_ready ? _GEN_18 : if_addr; // @[MMU.scala 129:30:@1370.10]
  assign _GEN_23 = io_if_iom_ready ? _GEN_19 : if_pha; // @[MMU.scala 129:30:@1370.10]
  assign _GEN_24 = _T_182 ? if_pha : real_if_addr; // @[Conditional.scala 39:67:@1368.8]
  assign _GEN_25 = _T_182 ? _GEN_20 : if_status; // @[Conditional.scala 39:67:@1368.8]
  assign _GEN_26 = _T_182 ? _GEN_21 : 1'h0; // @[Conditional.scala 39:67:@1368.8]
  assign _GEN_27 = _T_182 ? _GEN_22 : if_addr; // @[Conditional.scala 39:67:@1368.8]
  assign _GEN_28 = _T_182 ? _GEN_23 : if_pha; // @[Conditional.scala 39:67:@1368.8]
  assign _GEN_29 = _T_179 ? ptw_if_io_mem_mode : io_insr_mode; // @[Conditional.scala 39:67:@1351.6]
  assign _GEN_30 = _T_179 ? ptw_if_io_mem_addr : _GEN_24; // @[Conditional.scala 39:67:@1351.6]
  assign _GEN_32 = _T_179 ? _GEN_14 : _GEN_26; // @[Conditional.scala 39:67:@1351.6]
  assign _GEN_33 = _T_179 ? _GEN_15 : _GEN_25; // @[Conditional.scala 39:67:@1351.6]
  assign _GEN_34 = _T_179 ? _GEN_16 : _GEN_28; // @[Conditional.scala 39:67:@1351.6]
  assign _GEN_35 = _T_179 ? if_addr : _GEN_27; // @[Conditional.scala 39:67:@1351.6]
  assign _GEN_36 = _T_176 ? _GEN_5 : _GEN_35; // @[Conditional.scala 40:58:@1333.4]
  assign _GEN_37 = _T_176 ? _GEN_6 : _GEN_33; // @[Conditional.scala 40:58:@1333.4]
  assign _GEN_41 = _T_176 ? _GEN_10 : _GEN_34; // @[Conditional.scala 40:58:@1333.4]
  assign _T_188 = 2'h0 == mem_status; // @[Conditional.scala 37:30:@1384.4]
  assign _T_189 = is_mem & if_free; // @[MMU.scala 144:20:@1386.6]
  assign _GEN_44 = io_mem_iom_ready ? 2'h0 : 2'h2; // @[MMU.scala 154:35:@1398.10]
  assign _GEN_51 = _T_189 ? real_mem_addr : mem_addr; // @[MMU.scala 144:32:@1387.6]
  assign _GEN_52 = _T_189 ? _GEN_44 : mem_status; // @[MMU.scala 144:32:@1387.6]
  assign _GEN_56 = _T_189 ? real_mem_addr : mem_pha; // @[MMU.scala 144:32:@1387.6]
  assign _GEN_57 = _T_189 ? io_mem_iom_ready : 1'h0; // @[MMU.scala 144:32:@1387.6]
  assign _T_192 = 2'h1 == mem_status; // @[Conditional.scala 37:30:@1406.6]
  assign _GEN_59 = e_mem ? 2'h0 : 2'h2; // @[MMU.scala 165:22:@1411.10]
  assign _GEN_60 = e_mem ? mem_pha : ptw_mem_addr; // @[MMU.scala 165:22:@1411.10]
  assign _GEN_61 = ptw_mem_io_ready ? e_mem : 1'h0; // @[MMU.scala 164:31:@1410.8]
  assign _GEN_62 = ptw_mem_io_ready ? _GEN_59 : mem_status; // @[MMU.scala 164:31:@1410.8]
  assign _GEN_63 = ptw_mem_io_ready ? _GEN_60 : mem_pha; // @[MMU.scala 164:31:@1410.8]
  assign _T_195 = 2'h2 == mem_status; // @[Conditional.scala 37:30:@1423.8]
  assign _GEN_64 = io_mem_iom_ready ? 2'h0 : mem_status; // @[MMU.scala 177:31:@1426.10]
  assign _GEN_65 = _T_195 ? mem_pha : real_mem_addr; // @[Conditional.scala 39:67:@1424.8]
  assign _GEN_66 = _T_195 ? _GEN_64 : mem_status; // @[Conditional.scala 39:67:@1424.8]
  assign _GEN_67 = _T_195 ? io_mem_iom_ready : 1'h0; // @[Conditional.scala 39:67:@1424.8]
  assign _GEN_68 = _T_192 ? ptw_mem_io_mem_mode : io_mem_mode; // @[Conditional.scala 39:67:@1407.6]
  assign _GEN_69 = _T_192 ? ptw_mem_io_mem_addr : _GEN_65; // @[Conditional.scala 39:67:@1407.6]
  assign _GEN_71 = _T_192 ? _GEN_61 : _GEN_67; // @[Conditional.scala 39:67:@1407.6]
  assign _GEN_72 = _T_192 ? _GEN_62 : _GEN_66; // @[Conditional.scala 39:67:@1407.6]
  assign _GEN_73 = _T_192 ? _GEN_63 : mem_pha; // @[Conditional.scala 39:67:@1407.6]
  assign _GEN_74 = _T_188 ? _GEN_51 : mem_addr; // @[Conditional.scala 40:58:@1385.4]
  assign _GEN_75 = _T_188 ? _GEN_52 : _GEN_72; // @[Conditional.scala 40:58:@1385.4]
  assign _GEN_79 = _T_188 ? _GEN_56 : _GEN_73; // @[Conditional.scala 40:58:@1385.4]
  assign io_mem_ready = _T_188 ? _GEN_57 : _GEN_71; // @[MMU.scala 73:21:@1305.4 MMU.scala 156:27:@1400.12 MMU.scala 167:29:@1413.12 MMU.scala 179:23:@1428.12]
  assign io_mem_rdata = io_mem_iom_rdata; // @[MMU.scala 69:21:@1302.4]
  assign io_insr_ready = _T_176 ? 1'h0 : _GEN_32; // @[MMU.scala 72:21:@1304.4 MMU.scala 118:30:@1357.12 MMU.scala 133:25:@1376.14]
  assign io_insr_rdata = io_if_iom_rdata; // @[MMU.scala 66:21:@1299.4]
  assign io_if_iom_mode = _T_176 ? io_insr_mode : _GEN_29; // @[MMU.scala 63:21:@1296.4 MMU.scala 104:31:@1340.10 MMU.scala 113:27:@1352.8]
  assign io_if_iom_addr = _T_176 ? real_if_addr : _GEN_30; // @[MMU.scala 64:21:@1297.4 MMU.scala 105:31:@1341.10 MMU.scala 114:27:@1353.8 MMU.scala 128:22:@1369.10]
  assign io_mem_iom_mode = _T_188 ? io_mem_mode : _GEN_68; // @[MMU.scala 67:21:@1300.4 MMU.scala 149:32:@1392.10 MMU.scala 162:28:@1408.8]
  assign io_mem_iom_addr = _T_188 ? real_mem_addr : _GEN_69; // @[MMU.scala 68:21:@1301.4 MMU.scala 150:32:@1393.10 MMU.scala 163:28:@1409.8 MMU.scala 176:23:@1425.10]
  assign io_mem_iom_wdata = io_mem_wdata; // @[MMU.scala 70:21:@1303.4]
  assign ptw_if_clock = clock; // @[:@1221.4]
  assign ptw_if_reset = reset; // @[:@1222.4]
  assign ptw_if_io_mem_ready = io_if_iom_ready; // @[MMU.scala 80:24:@1314.4]
  assign ptw_if_io_mem_rdata = io_if_iom_rdata; // @[MMU.scala 81:24:@1315.4]
  assign ptw_mem_clock = clock; // @[:@1224.4]
  assign ptw_mem_reset = reset; // @[:@1225.4]
  assign ptw_mem_io_mem_ready = io_mem_iom_ready; // @[MMU.scala 82:24:@1316.4]
  assign ptw_mem_io_mem_rdata = io_mem_iom_rdata; // @[MMU.scala 83:24:@1317.4]
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
  if_status = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{`RANDOM}};
  if_addr = _RAND_1[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {2{`RANDOM}};
  if_pha = _RAND_2[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  mem_status = _RAND_3[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {2{`RANDOM}};
  mem_addr = _RAND_4[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {2{`RANDOM}};
  mem_pha = _RAND_5[63:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      if_status <= 2'h0;
    end else begin
      if (_T_176) begin
        if (_T_177) begin
          if_status <= 2'h2;
        end
      end else begin
        if (_T_179) begin
          if (ptw_if_io_ready) begin
            if (e_if) begin
              if_status <= 2'h0;
            end else begin
              if_status <= 2'h2;
            end
          end
        end else begin
          if (_T_182) begin
            if (io_if_iom_ready) begin
              if_status <= 2'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      if_addr <= 64'h0;
    end else begin
      if (_T_176) begin
        if (_T_177) begin
          if_addr <= real_if_addr;
        end
      end else begin
        if (!(_T_179)) begin
          if (_T_182) begin
            if (io_if_iom_ready) begin
              if (!(_T_186)) begin
                if_addr <= real_if_addr;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      if_pha <= 64'h0;
    end else begin
      if (_T_176) begin
        if (_T_177) begin
          if_pha <= real_if_addr;
        end
      end else begin
        if (_T_179) begin
          if (ptw_if_io_ready) begin
            if (!(e_if)) begin
              if_pha <= ptw_if_addr;
            end
          end
        end else begin
          if (_T_182) begin
            if (io_if_iom_ready) begin
              if (!(_T_186)) begin
                if_pha <= real_if_addr;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      mem_status <= 2'h0;
    end else begin
      if (_T_188) begin
        if (_T_189) begin
          if (io_mem_iom_ready) begin
            mem_status <= 2'h0;
          end else begin
            mem_status <= 2'h2;
          end
        end
      end else begin
        if (_T_192) begin
          if (ptw_mem_io_ready) begin
            if (e_mem) begin
              mem_status <= 2'h0;
            end else begin
              mem_status <= 2'h2;
            end
          end
        end else begin
          if (_T_195) begin
            if (io_mem_iom_ready) begin
              mem_status <= 2'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      mem_addr <= 64'h0;
    end else begin
      if (_T_188) begin
        if (_T_189) begin
          mem_addr <= real_mem_addr;
        end
      end
    end
    if (reset) begin
      mem_pha <= 64'h0;
    end else begin
      if (_T_188) begin
        if (_T_189) begin
          mem_pha <= real_mem_addr;
        end
      end else begin
        if (_T_192) begin
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
module IOManager( // @[:@1449.2]
  input         clock, // @[:@1450.4]
  input         reset, // @[:@1451.4]
  input  [3:0]  io_mem_if_mode, // @[:@1452.4]
  output        io_mem_if_ready, // @[:@1452.4]
  input  [63:0] io_mem_if_addr, // @[:@1452.4]
  output [63:0] io_mem_if_rdata, // @[:@1452.4]
  input  [3:0]  io_mem_mem_mode, // @[:@1452.4]
  output        io_mem_mem_ready, // @[:@1452.4]
  input  [63:0] io_mem_mem_addr, // @[:@1452.4]
  output [63:0] io_mem_mem_rdata, // @[:@1452.4]
  input  [63:0] io_mem_mem_wdata, // @[:@1452.4]
  output [3:0]  io_mem_out_mode, // @[:@1452.4]
  input         io_mem_out_ready, // @[:@1452.4]
  output [63:0] io_mem_out_addr, // @[:@1452.4]
  input  [63:0] io_mem_out_rdata, // @[:@1452.4]
  output [63:0] io_mem_out_wdata, // @[:@1452.4]
  output [3:0]  io_serial_out_mode, // @[:@1452.4]
  input         io_serial_out_ready, // @[:@1452.4]
  output [63:0] io_serial_out_addr, // @[:@1452.4]
  input  [63:0] io_serial_out_rdata, // @[:@1452.4]
  output [63:0] io_serial_out_wdata, // @[:@1452.4]
  output [1:0]  io_debug_if_wait, // @[:@1452.4]
  output [1:0]  io_debug_mem_wait, // @[:@1452.4]
  output        io_debug_if_ready, // @[:@1452.4]
  output        io_debug_mem_ready, // @[:@1452.4]
  output [3:0]  io_debug_if_mode, // @[:@1452.4]
  output [3:0]  io_debug_mem_mode, // @[:@1452.4]
  output [63:0] io_debug_if_addr, // @[:@1452.4]
  output [63:0] io_debug_mem_addr, // @[:@1452.4]
  output        io_debug_error // @[:@1452.4]
);
  reg [1:0] ifWait; // @[iomanager.scala 60:25:@1480.4]
  reg [31:0] _RAND_0;
  reg [1:0] memWait; // @[iomanager.scala 61:26:@1481.4]
  reg [31:0] _RAND_1;
  reg  error; // @[iomanager.scala 62:24:@1482.4]
  reg [31:0] _RAND_2;
  wire  _T_91; // @[Conditional.scala 37:30:@1483.4]
  wire  _T_92; // @[Conditional.scala 37:30:@1489.6]
  wire [63:0] _GEN_0; // @[Conditional.scala 39:67:@1490.6]
  wire  _GEN_1; // @[Conditional.scala 39:67:@1490.6]
  wire  _GEN_3; // @[Conditional.scala 40:58:@1484.4]
  wire  _T_93; // @[Conditional.scala 37:30:@1494.4]
  wire  _T_94; // @[Conditional.scala 37:30:@1500.6]
  wire [63:0] _GEN_4; // @[Conditional.scala 39:67:@1501.6]
  wire  _GEN_5; // @[Conditional.scala 39:67:@1501.6]
  wire  _GEN_7; // @[Conditional.scala 40:58:@1495.4]
  wire  _T_95; // @[iomanager.scala 86:26:@1505.4]
  wire  _T_97; // @[iomanager.scala 86:42:@1506.4]
  wire  _T_98; // @[iomanager.scala 86:39:@1507.4]
  wire [1:0] _T_99; // @[iomanager.scala 86:18:@1508.4]
  wire  _T_100; // @[iomanager.scala 87:28:@1510.4]
  wire  _T_102; // @[iomanager.scala 87:44:@1511.4]
  wire  _T_103; // @[iomanager.scala 87:41:@1512.4]
  wire [1:0] _T_104; // @[iomanager.scala 87:19:@1513.4]
  wire  _T_106; // @[iomanager.scala 99:18:@1517.4]
  wire  _T_107; // @[iomanager.scala 99:41:@1518.4]
  wire  _T_108; // @[iomanager.scala 99:31:@1519.4]
  wire  _T_109; // @[iomanager.scala 99:66:@1520.4]
  wire  _T_110; // @[iomanager.scala 99:54:@1521.4]
  wire  _T_116; // @[iomanager.scala 16:43:@1524.6]
  wire  _T_119; // @[iomanager.scala 17:25:@1534.8]
  wire  _T_120; // @[iomanager.scala 17:49:@1535.8]
  wire  _T_121; // @[iomanager.scala 17:41:@1536.8]
  wire  _T_125; // @[iomanager.scala 119:15:@1546.10]
  wire [63:0] _GEN_8; // @[iomanager.scala 109:37:@1537.8]
  wire [3:0] _GEN_9; // @[iomanager.scala 109:37:@1537.8]
  wire [63:0] _GEN_10; // @[iomanager.scala 109:37:@1537.8]
  wire [1:0] _GEN_11; // @[iomanager.scala 109:37:@1537.8]
  wire  _GEN_12; // @[iomanager.scala 109:37:@1537.8]
  wire  _GEN_13; // @[iomanager.scala 109:37:@1537.8]
  wire [63:0] _GEN_14; // @[iomanager.scala 100:28:@1526.6]
  wire [3:0] _GEN_15; // @[iomanager.scala 100:28:@1526.6]
  wire [63:0] _GEN_16; // @[iomanager.scala 100:28:@1526.6]
  wire [1:0] _GEN_17; // @[iomanager.scala 100:28:@1526.6]
  wire  _GEN_18; // @[iomanager.scala 100:28:@1526.6]
  wire [63:0] _GEN_19; // @[iomanager.scala 100:28:@1526.6]
  wire [3:0] _GEN_20; // @[iomanager.scala 100:28:@1526.6]
  wire [63:0] _GEN_21; // @[iomanager.scala 100:28:@1526.6]
  wire  _GEN_22; // @[iomanager.scala 100:28:@1526.6]
  wire [63:0] _GEN_23; // @[iomanager.scala 99:80:@1522.4]
  wire [3:0] _GEN_24; // @[iomanager.scala 99:80:@1522.4]
  wire [63:0] _GEN_25; // @[iomanager.scala 99:80:@1522.4]
  wire [1:0] _GEN_26; // @[iomanager.scala 99:80:@1522.4]
  wire  _GEN_31; // @[iomanager.scala 99:80:@1522.4]
  wire  _T_129; // @[iomanager.scala 125:30:@1555.4]
  wire  _T_130; // @[iomanager.scala 125:66:@1556.4]
  wire  _T_131; // @[iomanager.scala 125:54:@1557.4]
  wire  _T_132; // @[iomanager.scala 125:91:@1558.4]
  wire  _T_133; // @[iomanager.scala 125:79:@1559.4]
  wire  _T_135; // @[iomanager.scala 16:43:@1562.6]
  wire [63:0] _GEN_32; // @[iomanager.scala 126:30:@1564.6]
  wire [3:0] _GEN_33; // @[iomanager.scala 126:30:@1564.6]
  wire [63:0] _GEN_34; // @[iomanager.scala 126:30:@1564.6]
  wire [1:0] _GEN_35; // @[iomanager.scala 126:30:@1564.6]
  wire  _GEN_36; // @[iomanager.scala 126:30:@1564.6]
  wire  _GEN_37; // @[iomanager.scala 126:30:@1564.6]
  wire [1:0] _GEN_41; // @[iomanager.scala 125:105:@1560.4]
  wire  _GEN_43; // @[iomanager.scala 125:105:@1560.4]
  wire  _GEN_44; // @[iomanager.scala 119:15:@1548.12]
  wire  _GEN_45; // @[iomanager.scala 119:15:@1548.12]
  wire  _GEN_46; // @[iomanager.scala 119:15:@1548.12]
  wire  _GEN_47; // @[iomanager.scala 119:15:@1548.12]
  wire  _GEN_48; // @[iomanager.scala 131:19:@1575.10]
  wire  _GEN_49; // @[iomanager.scala 131:19:@1575.10]
  assign _T_91 = 2'h1 == ifWait; // @[Conditional.scala 37:30:@1483.4]
  assign _T_92 = 2'h2 == ifWait; // @[Conditional.scala 37:30:@1489.6]
  assign _GEN_0 = _T_92 ? io_serial_out_rdata : 64'h0; // @[Conditional.scala 39:67:@1490.6]
  assign _GEN_1 = _T_92 ? io_serial_out_ready : 1'h0; // @[Conditional.scala 39:67:@1490.6]
  assign _GEN_3 = _T_91 ? io_mem_out_ready : _GEN_1; // @[Conditional.scala 40:58:@1484.4]
  assign _T_93 = 2'h1 == memWait; // @[Conditional.scala 37:30:@1494.4]
  assign _T_94 = 2'h2 == memWait; // @[Conditional.scala 37:30:@1500.6]
  assign _GEN_4 = _T_94 ? io_serial_out_rdata : 64'h0; // @[Conditional.scala 39:67:@1501.6]
  assign _GEN_5 = _T_94 ? io_serial_out_ready : 1'h0; // @[Conditional.scala 39:67:@1501.6]
  assign _GEN_7 = _T_93 ? io_mem_out_ready : _GEN_5; // @[Conditional.scala 40:58:@1495.4]
  assign _T_95 = ifWait != 2'h0; // @[iomanager.scala 86:26:@1505.4]
  assign _T_97 = io_mem_if_ready == 1'h0; // @[iomanager.scala 86:42:@1506.4]
  assign _T_98 = _T_95 & _T_97; // @[iomanager.scala 86:39:@1507.4]
  assign _T_99 = _T_98 ? ifWait : 2'h0; // @[iomanager.scala 86:18:@1508.4]
  assign _T_100 = memWait != 2'h0; // @[iomanager.scala 87:28:@1510.4]
  assign _T_102 = io_mem_mem_ready == 1'h0; // @[iomanager.scala 87:44:@1511.4]
  assign _T_103 = _T_100 & _T_102; // @[iomanager.scala 87:41:@1512.4]
  assign _T_104 = _T_103 ? memWait : 2'h0; // @[iomanager.scala 87:19:@1513.4]
  assign _T_106 = memWait == 2'h0; // @[iomanager.scala 99:18:@1517.4]
  assign _T_107 = ifWait == 2'h0; // @[iomanager.scala 99:41:@1518.4]
  assign _T_108 = _T_106 & _T_107; // @[iomanager.scala 99:31:@1519.4]
  assign _T_109 = io_mem_mem_mode != 4'hf; // @[iomanager.scala 99:66:@1520.4]
  assign _T_110 = _T_108 & _T_109; // @[iomanager.scala 99:54:@1521.4]
  assign _T_116 = io_mem_mem_addr < 64'h7ffff8; // @[iomanager.scala 16:43:@1524.6]
  assign _T_119 = io_mem_mem_addr >= 64'h7ffff8; // @[iomanager.scala 17:25:@1534.8]
  assign _T_120 = io_mem_mem_addr < 64'h800000; // @[iomanager.scala 17:49:@1535.8]
  assign _T_121 = _T_119 & _T_120; // @[iomanager.scala 17:41:@1536.8]
  assign _T_125 = reset == 1'h0; // @[iomanager.scala 119:15:@1546.10]
  assign _GEN_8 = _T_121 ? io_mem_mem_wdata : 64'h0; // @[iomanager.scala 109:37:@1537.8]
  assign _GEN_9 = _T_121 ? io_mem_mem_mode : 4'hf; // @[iomanager.scala 109:37:@1537.8]
  assign _GEN_10 = _T_121 ? io_mem_mem_addr : 64'h0; // @[iomanager.scala 109:37:@1537.8]
  assign _GEN_11 = _T_121 ? 2'h2 : _T_104; // @[iomanager.scala 109:37:@1537.8]
  assign _GEN_12 = _T_121 ? 1'h0 : _GEN_7; // @[iomanager.scala 109:37:@1537.8]
  assign _GEN_13 = _T_121 ? error : 1'h1; // @[iomanager.scala 109:37:@1537.8]
  assign _GEN_14 = _T_116 ? io_mem_mem_wdata : 64'h0; // @[iomanager.scala 100:28:@1526.6]
  assign _GEN_15 = _T_116 ? io_mem_mem_mode : 4'hf; // @[iomanager.scala 100:28:@1526.6]
  assign _GEN_16 = _T_116 ? io_mem_mem_addr : 64'h0; // @[iomanager.scala 100:28:@1526.6]
  assign _GEN_17 = _T_116 ? 2'h1 : _GEN_11; // @[iomanager.scala 100:28:@1526.6]
  assign _GEN_18 = _T_116 ? 1'h0 : _GEN_12; // @[iomanager.scala 100:28:@1526.6]
  assign _GEN_19 = _T_116 ? 64'h0 : _GEN_8; // @[iomanager.scala 100:28:@1526.6]
  assign _GEN_20 = _T_116 ? 4'hf : _GEN_9; // @[iomanager.scala 100:28:@1526.6]
  assign _GEN_21 = _T_116 ? 64'h0 : _GEN_10; // @[iomanager.scala 100:28:@1526.6]
  assign _GEN_22 = _T_116 ? error : _GEN_13; // @[iomanager.scala 100:28:@1526.6]
  assign _GEN_23 = _T_110 ? _GEN_14 : 64'h0; // @[iomanager.scala 99:80:@1522.4]
  assign _GEN_24 = _T_110 ? _GEN_15 : 4'hf; // @[iomanager.scala 99:80:@1522.4]
  assign _GEN_25 = _T_110 ? _GEN_16 : 64'h0; // @[iomanager.scala 99:80:@1522.4]
  assign _GEN_26 = _T_110 ? _GEN_17 : _T_104; // @[iomanager.scala 99:80:@1522.4]
  assign _GEN_31 = _T_110 ? _GEN_22 : error; // @[iomanager.scala 99:80:@1522.4]
  assign _T_129 = _T_107 & _T_106; // @[iomanager.scala 125:30:@1555.4]
  assign _T_130 = io_mem_mem_mode == 4'hf; // @[iomanager.scala 125:66:@1556.4]
  assign _T_131 = _T_129 & _T_130; // @[iomanager.scala 125:54:@1557.4]
  assign _T_132 = io_mem_if_mode != 4'hf; // @[iomanager.scala 125:91:@1558.4]
  assign _T_133 = _T_131 & _T_132; // @[iomanager.scala 125:79:@1559.4]
  assign _T_135 = io_mem_if_addr < 64'h7ffff8; // @[iomanager.scala 16:43:@1562.6]
  assign _GEN_32 = _T_135 ? 64'h0 : _GEN_23; // @[iomanager.scala 126:30:@1564.6]
  assign _GEN_33 = _T_135 ? io_mem_if_mode : _GEN_24; // @[iomanager.scala 126:30:@1564.6]
  assign _GEN_34 = _T_135 ? io_mem_if_addr : _GEN_25; // @[iomanager.scala 126:30:@1564.6]
  assign _GEN_35 = _T_135 ? 2'h1 : _T_99; // @[iomanager.scala 126:30:@1564.6]
  assign _GEN_36 = _T_135 ? 1'h0 : _GEN_3; // @[iomanager.scala 126:30:@1564.6]
  assign _GEN_37 = _T_135 ? _GEN_31 : 1'h1; // @[iomanager.scala 126:30:@1564.6]
  assign _GEN_41 = _T_133 ? _GEN_35 : _T_99; // @[iomanager.scala 125:105:@1560.4]
  assign _GEN_43 = _T_133 ? _GEN_37 : _GEN_31; // @[iomanager.scala 125:105:@1560.4]
  assign io_mem_if_ready = _T_133 ? _GEN_36 : _GEN_3; // @[iomanager.scala 52:16:@1468.4 iomanager.scala 69:18:@1486.6 iomanager.scala 69:18:@1492.8 iomanager.scala 129:23:@1569.8]
  assign io_mem_if_rdata = _T_91 ? io_mem_out_rdata : _GEN_0; // @[iomanager.scala 52:16:@1466.4 iomanager.scala 68:18:@1485.6 iomanager.scala 68:18:@1491.8]
  assign io_mem_mem_ready = _T_110 ? _GEN_18 : _GEN_7; // @[iomanager.scala 51:16:@1463.4 iomanager.scala 69:18:@1497.6 iomanager.scala 69:18:@1503.8 iomanager.scala 107:23:@1531.8 iomanager.scala 116:23:@1542.10]
  assign io_mem_mem_rdata = _T_93 ? io_mem_out_rdata : _GEN_4; // @[iomanager.scala 51:16:@1461.4 iomanager.scala 68:18:@1496.6 iomanager.scala 68:18:@1502.8]
  assign io_mem_out_mode = _T_133 ? _GEN_33 : _GEN_24; // @[iomanager.scala 53:20:@1474.4 iomanager.scala 74:20:@1528.8 iomanager.scala 74:20:@1566.8]
  assign io_mem_out_addr = _T_133 ? _GEN_34 : _GEN_25; // @[iomanager.scala 53:20:@1472.4 iomanager.scala 75:20:@1529.8 iomanager.scala 75:20:@1567.8]
  assign io_mem_out_wdata = _T_133 ? _GEN_32 : _GEN_23; // @[iomanager.scala 53:20:@1470.4 iomanager.scala 73:20:@1527.8 iomanager.scala 73:20:@1565.8]
  assign io_serial_out_mode = _T_110 ? _GEN_20 : 4'hf; // @[iomanager.scala 54:20:@1479.4 iomanager.scala 74:20:@1539.10]
  assign io_serial_out_addr = _T_110 ? _GEN_21 : 64'h0; // @[iomanager.scala 54:20:@1477.4 iomanager.scala 75:20:@1540.10]
  assign io_serial_out_wdata = _T_110 ? _GEN_19 : 64'h0; // @[iomanager.scala 54:20:@1475.4 iomanager.scala 73:20:@1538.10]
  assign io_debug_if_wait = ifWait; // @[iomanager.scala 137:22:@1580.4]
  assign io_debug_mem_wait = memWait; // @[iomanager.scala 139:23:@1582.4]
  assign io_debug_if_ready = io_mem_if_ready; // @[iomanager.scala 138:23:@1581.4]
  assign io_debug_mem_ready = io_mem_mem_ready; // @[iomanager.scala 140:24:@1583.4]
  assign io_debug_if_mode = io_mem_if_mode; // @[iomanager.scala 141:22:@1584.4]
  assign io_debug_mem_mode = io_mem_mem_mode; // @[iomanager.scala 142:23:@1585.4]
  assign io_debug_if_addr = io_mem_if_addr; // @[iomanager.scala 143:22:@1586.4]
  assign io_debug_mem_addr = io_mem_mem_addr; // @[iomanager.scala 144:23:@1587.4]
  assign io_debug_error = error; // @[iomanager.scala 145:20:@1588.4]
  assign _GEN_44 = _T_116 == 1'h0; // @[iomanager.scala 119:15:@1548.12]
  assign _GEN_45 = _T_110 & _GEN_44; // @[iomanager.scala 119:15:@1548.12]
  assign _GEN_46 = _T_121 == 1'h0; // @[iomanager.scala 119:15:@1548.12]
  assign _GEN_47 = _GEN_45 & _GEN_46; // @[iomanager.scala 119:15:@1548.12]
  assign _GEN_48 = _T_135 == 1'h0; // @[iomanager.scala 131:19:@1575.10]
  assign _GEN_49 = _T_133 & _GEN_48; // @[iomanager.scala 131:19:@1575.10]
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
  error = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      ifWait <= 2'h0;
    end else begin
      if (_T_133) begin
        if (_T_135) begin
          ifWait <= 2'h1;
        end else begin
          if (!(_T_98)) begin
            ifWait <= 2'h0;
          end
        end
      end else begin
        if (!(_T_98)) begin
          ifWait <= 2'h0;
        end
      end
    end
    if (reset) begin
      memWait <= 2'h0;
    end else begin
      if (_T_110) begin
        if (_T_116) begin
          memWait <= 2'h1;
        end else begin
          if (_T_121) begin
            memWait <= 2'h2;
          end else begin
            if (!(_T_103)) begin
              memWait <= 2'h0;
            end
          end
        end
      end else begin
        if (!(_T_103)) begin
          memWait <= 2'h0;
        end
      end
    end
    if (reset) begin
      error <= 1'h0;
    end else begin
      if (_T_133) begin
        if (_T_135) begin
          if (_T_110) begin
            if (!(_T_116)) begin
              if (!(_T_121)) begin
                error <= 1'h1;
              end
            end
          end
        end else begin
          error <= 1'h1;
        end
      end else begin
        if (_T_110) begin
          if (!(_T_116)) begin
            if (!(_T_121)) begin
              error <= 1'h1;
            end
          end
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_47 & _T_125) begin
          $fwrite(32'h80000002,"[IO] MEM access invalid address: %x\n",io_mem_mem_addr); // @[iomanager.scala 119:15:@1548.12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_49 & _T_125) begin
          $fwrite(32'h80000002,"[IO] IF access invalid address: %x\n",io_mem_if_addr); // @[iomanager.scala 131:19:@1575.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module IF_ID( // @[:@1590.2]
  input         clock, // @[:@1591.4]
  input         reset, // @[:@1592.4]
  input         io_en, // @[:@1593.4]
  input         io_pass, // @[:@1593.4]
  input         io_flush, // @[:@1593.4]
  input  [31:0] io_insi, // @[:@1593.4]
  input  [63:0] io_pci, // @[:@1593.4]
  input  [63:0] io_insci, // @[:@1593.4]
  input  [63:0] io_icdi, // @[:@1593.4]
  input         io_lastloadin_valid, // @[:@1593.4]
  input  [4:0]  io_lastloadin_index, // @[:@1593.4]
  input  [63:0] io_excep_i_pc, // @[:@1593.4]
  input         io_excep_i_inst_valid, // @[:@1593.4]
  output [31:0] io_inso, // @[:@1593.4]
  output [63:0] io_pco, // @[:@1593.4]
  output [63:0] io_insco, // @[:@1593.4]
  output [63:0] io_icdo, // @[:@1593.4]
  output        io_lastloadout_valid, // @[:@1593.4]
  output [4:0]  io_lastloadout_index, // @[:@1593.4]
  output        io_excep_o_valid, // @[:@1593.4]
  output [31:0] io_excep_o_code, // @[:@1593.4]
  output [31:0] io_excep_o_value, // @[:@1593.4]
  output [63:0] io_excep_o_pc, // @[:@1593.4]
  output        io_excep_o_inst_valid // @[:@1593.4]
);
  reg [31:0] ins; // @[if_id.scala 27:23:@1595.4]
  reg [31:0] _RAND_0;
  reg [63:0] pc; // @[if_id.scala 28:23:@1597.4]
  reg [63:0] _RAND_1;
  reg [63:0] insc; // @[if_id.scala 30:23:@1598.4]
  reg [63:0] _RAND_2;
  reg [63:0] icd; // @[if_id.scala 31:23:@1600.4]
  reg [63:0] _RAND_3;
  reg  lastload_valid; // @[if_id.scala 32:35:@1601.4]
  reg [31:0] _RAND_4;
  reg [4:0] lastload_index; // @[if_id.scala 33:35:@1602.4]
  reg [31:0] _RAND_5;
  reg  excep_valid; // @[if_id.scala 34:24:@1616.4]
  reg [31:0] _RAND_6;
  reg [31:0] excep_code; // @[if_id.scala 34:24:@1616.4]
  reg [31:0] _RAND_7;
  reg [31:0] excep_value; // @[if_id.scala 34:24:@1616.4]
  reg [31:0] _RAND_8;
  reg [63:0] excep_pc; // @[if_id.scala 34:24:@1616.4]
  reg [63:0] _RAND_9;
  reg  excep_inst_valid; // @[if_id.scala 34:24:@1616.4]
  reg [31:0] _RAND_10;
  wire  _T_148; // @[if_id.scala 44:17:@1628.4]
  wire [31:0] _T_150; // @[if_id.scala 45:20:@1630.6]
  wire [63:0] _T_152; // @[if_id.scala 47:20:@1633.6]
  wire [63:0] _T_154; // @[if_id.scala 48:20:@1635.6]
  wire  _T_156; // @[if_id.scala 49:32:@1637.6]
  wire [4:0] _T_158; // @[if_id.scala 50:32:@1639.6]
  wire  _GEN_3; // @[if_id.scala 51:25:@1641.6]
  wire [63:0] _GEN_4; // @[if_id.scala 51:25:@1641.6]
  wire [31:0] _GEN_5; // @[if_id.scala 44:29:@1629.4]
  wire [63:0] _GEN_6; // @[if_id.scala 44:29:@1629.4]
  wire [63:0] _GEN_7; // @[if_id.scala 44:29:@1629.4]
  wire [63:0] _GEN_8; // @[if_id.scala 44:29:@1629.4]
  wire  _GEN_9; // @[if_id.scala 44:29:@1629.4]
  wire [4:0] _GEN_10; // @[if_id.scala 44:29:@1629.4]
  wire  _GEN_11; // @[if_id.scala 44:29:@1629.4]
  wire [31:0] _GEN_12; // @[if_id.scala 44:29:@1629.4]
  wire [31:0] _GEN_13; // @[if_id.scala 44:29:@1629.4]
  wire  _GEN_14; // @[if_id.scala 44:29:@1629.4]
  wire [63:0] _GEN_15; // @[if_id.scala 44:29:@1629.4]
  assign _T_148 = io_en & io_pass; // @[if_id.scala 44:17:@1628.4]
  assign _T_150 = io_flush ? 32'h0 : io_insi; // @[if_id.scala 45:20:@1630.6]
  assign _T_152 = io_flush ? 64'h0 : io_insci; // @[if_id.scala 47:20:@1633.6]
  assign _T_154 = io_flush ? 64'h0 : io_icdi; // @[if_id.scala 48:20:@1635.6]
  assign _T_156 = io_flush ? 1'h0 : io_lastloadin_valid; // @[if_id.scala 49:32:@1637.6]
  assign _T_158 = io_flush ? 5'h0 : io_lastloadin_index; // @[if_id.scala 50:32:@1639.6]
  assign _GEN_3 = io_flush ? 1'h0 : io_excep_i_inst_valid; // @[if_id.scala 51:25:@1641.6]
  assign _GEN_4 = io_flush ? excep_pc : io_excep_i_pc; // @[if_id.scala 51:25:@1641.6]
  assign _GEN_5 = _T_148 ? _T_150 : ins; // @[if_id.scala 44:29:@1629.4]
  assign _GEN_6 = _T_148 ? io_pci : pc; // @[if_id.scala 44:29:@1629.4]
  assign _GEN_7 = _T_148 ? _T_152 : insc; // @[if_id.scala 44:29:@1629.4]
  assign _GEN_8 = _T_148 ? _T_154 : icd; // @[if_id.scala 44:29:@1629.4]
  assign _GEN_9 = _T_148 ? _T_156 : lastload_valid; // @[if_id.scala 44:29:@1629.4]
  assign _GEN_10 = _T_148 ? _T_158 : lastload_index; // @[if_id.scala 44:29:@1629.4]
  assign _GEN_11 = _T_148 ? 1'h0 : excep_valid; // @[if_id.scala 44:29:@1629.4]
  assign _GEN_12 = _T_148 ? 32'h0 : excep_code; // @[if_id.scala 44:29:@1629.4]
  assign _GEN_13 = _T_148 ? 32'h0 : excep_value; // @[if_id.scala 44:29:@1629.4]
  assign _GEN_14 = _T_148 ? _GEN_3 : excep_inst_valid; // @[if_id.scala 44:29:@1629.4]
  assign _GEN_15 = _T_148 ? _GEN_4 : excep_pc; // @[if_id.scala 44:29:@1629.4]
  assign io_inso = ins; // @[if_id.scala 36:14:@1617.4]
  assign io_pco = pc; // @[if_id.scala 37:14:@1618.4]
  assign io_insco = insc; // @[if_id.scala 38:14:@1619.4]
  assign io_icdo = icd; // @[if_id.scala 39:14:@1620.4]
  assign io_lastloadout_valid = lastload_valid; // @[if_id.scala 40:28:@1621.4]
  assign io_lastloadout_index = lastload_index; // @[if_id.scala 41:28:@1622.4]
  assign io_excep_o_valid = excep_valid; // @[if_id.scala 42:16:@1627.4]
  assign io_excep_o_code = excep_code; // @[if_id.scala 42:16:@1626.4]
  assign io_excep_o_value = excep_value; // @[if_id.scala 42:16:@1625.4]
  assign io_excep_o_pc = excep_pc; // @[if_id.scala 42:16:@1624.4]
  assign io_excep_o_inst_valid = excep_inst_valid; // @[if_id.scala 42:16:@1623.4]
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
  _RAND_7 = {1{`RANDOM}};
  excep_code = _RAND_7[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  excep_value = _RAND_8[31:0];
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
      pc <= 64'hc0020000;
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
      excep_code <= 32'h0;
    end else begin
      if (_T_148) begin
        excep_code <= 32'h0;
      end
    end
    if (reset) begin
      excep_value <= 32'h0;
    end else begin
      if (_T_148) begin
        excep_value <= 32'h0;
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
module ID_EX( // @[:@1658.2]
  input         clock, // @[:@1659.4]
  input         reset, // @[:@1660.4]
  input         io_en, // @[:@1661.4]
  input         io_bid, // @[:@1661.4]
  input         io_bex, // @[:@1661.4]
  input         io_flush, // @[:@1661.4]
  input         io_pass, // @[:@1661.4]
  input  [63:0] io_immi, // @[:@1661.4]
  input  [3:0]  io_ALUOpi, // @[:@1661.4]
  input  [3:0]  io_exeti, // @[:@1661.4]
  input  [63:0] io_pci, // @[:@1661.4]
  input  [3:0]  io_lsmi, // @[:@1661.4]
  input         io_op32i, // @[:@1661.4]
  input         io_csr_wb_i_valid, // @[:@1661.4]
  input  [11:0] io_csr_wb_i_csr_idx, // @[:@1661.4]
  input  [63:0] io_csr_wb_i_csr_data, // @[:@1661.4]
  input         io_dregi_rs2_valid, // @[:@1661.4]
  input  [63:0] io_dregi_rs1_value, // @[:@1661.4]
  input  [63:0] io_dregi_rs2_value, // @[:@1661.4]
  input         io_dregi_rd_valid, // @[:@1661.4]
  input  [4:0]  io_dregi_rd_index, // @[:@1661.4]
  input         io_excep_i_valid, // @[:@1661.4]
  input  [31:0] io_excep_i_code, // @[:@1661.4]
  input  [31:0] io_excep_i_value, // @[:@1661.4]
  input  [63:0] io_excep_i_pc, // @[:@1661.4]
  input         io_excep_i_inst_valid, // @[:@1661.4]
  output [63:0] io_immo, // @[:@1661.4]
  output [3:0]  io_ALUOpo, // @[:@1661.4]
  output [3:0]  io_exeto, // @[:@1661.4]
  output [63:0] io_pco, // @[:@1661.4]
  output [3:0]  io_lsmo, // @[:@1661.4]
  output        io_op32o, // @[:@1661.4]
  output        io_csr_wb_o_valid, // @[:@1661.4]
  output [11:0] io_csr_wb_o_csr_idx, // @[:@1661.4]
  output [63:0] io_csr_wb_o_csr_data, // @[:@1661.4]
  output        io_drego_rs2_valid, // @[:@1661.4]
  output [63:0] io_drego_rs1_value, // @[:@1661.4]
  output [63:0] io_drego_rs2_value, // @[:@1661.4]
  output        io_drego_rd_valid, // @[:@1661.4]
  output [4:0]  io_drego_rd_index, // @[:@1661.4]
  output        io_excep_o_valid, // @[:@1661.4]
  output [31:0] io_excep_o_code, // @[:@1661.4]
  output [31:0] io_excep_o_value, // @[:@1661.4]
  output [63:0] io_excep_o_pc, // @[:@1661.4]
  output        io_excep_o_inst_valid // @[:@1661.4]
);
  reg [63:0] imm; // @[id_ex.scala 36:24:@1663.4]
  reg [63:0] _RAND_0;
  reg [3:0] ALUOp; // @[id_ex.scala 37:24:@1664.4]
  reg [31:0] _RAND_1;
  reg [3:0] exet; // @[id_ex.scala 38:24:@1665.4]
  reg [31:0] _RAND_2;
  reg [63:0] pc; // @[id_ex.scala 39:24:@1666.4]
  reg [63:0] _RAND_3;
  reg  regInfo_rs2_valid; // @[id_ex.scala 40:26:@1682.4]
  reg [31:0] _RAND_4;
  reg [63:0] regInfo_rs1_value; // @[id_ex.scala 40:26:@1682.4]
  reg [63:0] _RAND_5;
  reg [63:0] regInfo_rs2_value; // @[id_ex.scala 40:26:@1682.4]
  reg [63:0] _RAND_6;
  reg  regInfo_rd_valid; // @[id_ex.scala 40:26:@1682.4]
  reg [31:0] _RAND_7;
  reg [4:0] regInfo_rd_index; // @[id_ex.scala 40:26:@1682.4]
  reg [31:0] _RAND_8;
  reg [3:0] lsm; // @[id_ex.scala 41:24:@1683.4]
  reg [31:0] _RAND_9;
  reg  op32; // @[id_ex.scala 42:24:@1684.4]
  reg [31:0] _RAND_10;
  wire  _T_184; // @[id_ex.scala 44:25:@1685.4]
  wire  bubble; // @[id_ex.scala 44:35:@1686.4]
  wire [63:0] bm; // @[id_ex.scala 45:21:@1688.4]
  reg  csr_wb_valid; // @[id_ex.scala 47:26:@1698.4]
  reg [31:0] _RAND_11;
  reg [11:0] csr_wb_csr_idx; // @[id_ex.scala 47:26:@1698.4]
  reg [31:0] _RAND_12;
  reg [63:0] csr_wb_csr_data; // @[id_ex.scala 47:26:@1698.4]
  reg [63:0] _RAND_13;
  reg  excep_valid; // @[id_ex.scala 48:25:@1712.4]
  reg [31:0] _RAND_14;
  reg [31:0] excep_code; // @[id_ex.scala 48:25:@1712.4]
  reg [31:0] _RAND_15;
  reg [31:0] excep_value; // @[id_ex.scala 48:25:@1712.4]
  reg [31:0] _RAND_16;
  reg [63:0] excep_pc; // @[id_ex.scala 48:25:@1712.4]
  reg [63:0] _RAND_17;
  reg  excep_inst_valid; // @[id_ex.scala 48:25:@1712.4]
  reg [31:0] _RAND_18;
  wire  _T_250; // @[id_ex.scala 60:17:@1733.4]
  wire [63:0] _T_251; // @[id_ex.scala 61:28:@1735.6]
  wire [3:0] _T_252; // @[id_ex.scala 62:32:@1737.6]
  wire [3:0] _T_253; // @[id_ex.scala 62:28:@1738.6]
  wire [3:0] _T_255; // @[id_ex.scala 63:28:@1741.6]
  wire  _T_256; // @[id_ex.scala 65:26:@1744.6]
  wire  _T_287_rs2_valid; // @[id_ex.scala 65:23:@1760.6]
  wire [63:0] _T_287_rs1_value; // @[id_ex.scala 65:23:@1760.6]
  wire [63:0] _T_287_rs2_value; // @[id_ex.scala 65:23:@1760.6]
  wire  _T_287_rd_valid; // @[id_ex.scala 65:23:@1760.6]
  wire [4:0] _T_287_rd_index; // @[id_ex.scala 65:23:@1760.6]
  wire [3:0] _T_294; // @[id_ex.scala 66:21:@1767.6]
  wire  _T_296; // @[id_ex.scala 67:27:@1770.6]
  wire [63:0] _GEN_0; // @[id_ex.scala 68:22:@1772.6]
  wire [11:0] _GEN_1; // @[id_ex.scala 68:22:@1772.6]
  wire  _GEN_2; // @[id_ex.scala 68:22:@1772.6]
  wire [31:0] _T_317; // @[id_ex.scala 73:26:@1792.6]
  wire [31:0] _T_320; // @[id_ex.scala 74:27:@1795.6]
  wire  _T_323; // @[id_ex.scala 75:27:@1798.6]
  wire  _T_326; // @[id_ex.scala 77:32:@1802.6]
  wire [63:0] _GEN_3; // @[id_ex.scala 60:29:@1734.4]
  wire [3:0] _GEN_4; // @[id_ex.scala 60:29:@1734.4]
  wire [3:0] _GEN_5; // @[id_ex.scala 60:29:@1734.4]
  wire [63:0] _GEN_6; // @[id_ex.scala 60:29:@1734.4]
  wire [4:0] _GEN_7; // @[id_ex.scala 60:29:@1734.4]
  wire  _GEN_8; // @[id_ex.scala 60:29:@1734.4]
  wire [63:0] _GEN_9; // @[id_ex.scala 60:29:@1734.4]
  wire [63:0] _GEN_10; // @[id_ex.scala 60:29:@1734.4]
  wire  _GEN_11; // @[id_ex.scala 60:29:@1734.4]
  wire [3:0] _GEN_13; // @[id_ex.scala 60:29:@1734.4]
  wire  _GEN_14; // @[id_ex.scala 60:29:@1734.4]
  wire [63:0] _GEN_15; // @[id_ex.scala 60:29:@1734.4]
  wire [11:0] _GEN_16; // @[id_ex.scala 60:29:@1734.4]
  wire  _GEN_17; // @[id_ex.scala 60:29:@1734.4]
  wire [31:0] _GEN_18; // @[id_ex.scala 60:29:@1734.4]
  wire [31:0] _GEN_19; // @[id_ex.scala 60:29:@1734.4]
  wire  _GEN_20; // @[id_ex.scala 60:29:@1734.4]
  wire [63:0] _GEN_21; // @[id_ex.scala 60:29:@1734.4]
  wire  _GEN_22; // @[id_ex.scala 60:29:@1734.4]
  assign _T_184 = io_bid | io_bex; // @[id_ex.scala 44:25:@1685.4]
  assign bubble = _T_184 | io_flush; // @[id_ex.scala 44:35:@1686.4]
  assign bm = bubble ? 64'h0 : 64'hffffffffffffffff; // @[id_ex.scala 45:21:@1688.4]
  assign _T_250 = io_en & io_pass; // @[id_ex.scala 60:17:@1733.4]
  assign _T_251 = io_immi & bm; // @[id_ex.scala 61:28:@1735.6]
  assign _T_252 = bm[3:0]; // @[id_ex.scala 62:32:@1737.6]
  assign _T_253 = io_ALUOpi & _T_252; // @[id_ex.scala 62:28:@1738.6]
  assign _T_255 = io_exeti & _T_252; // @[id_ex.scala 63:28:@1741.6]
  assign _T_256 = bm[0]; // @[id_ex.scala 65:26:@1744.6]
  assign _T_287_rs2_valid = _T_256 ? io_dregi_rs2_valid : 1'h0; // @[id_ex.scala 65:23:@1760.6]
  assign _T_287_rs1_value = _T_256 ? io_dregi_rs1_value : 64'h0; // @[id_ex.scala 65:23:@1760.6]
  assign _T_287_rs2_value = _T_256 ? io_dregi_rs2_value : 64'h0; // @[id_ex.scala 65:23:@1760.6]
  assign _T_287_rd_valid = _T_256 ? io_dregi_rd_valid : 1'h0; // @[id_ex.scala 65:23:@1760.6]
  assign _T_287_rd_index = _T_256 ? io_dregi_rd_index : 5'h0; // @[id_ex.scala 65:23:@1760.6]
  assign _T_294 = bubble ? 4'hf : io_lsmi; // @[id_ex.scala 66:21:@1767.6]
  assign _T_296 = io_op32i & _T_256; // @[id_ex.scala 67:27:@1770.6]
  assign _GEN_0 = bubble ? 64'h0 : io_csr_wb_i_csr_data; // @[id_ex.scala 68:22:@1772.6]
  assign _GEN_1 = bubble ? 12'h0 : io_csr_wb_i_csr_idx; // @[id_ex.scala 68:22:@1772.6]
  assign _GEN_2 = bubble ? 1'h0 : io_csr_wb_i_valid; // @[id_ex.scala 68:22:@1772.6]
  assign _T_317 = _T_256 ? io_excep_i_code : 32'h0; // @[id_ex.scala 73:26:@1792.6]
  assign _T_320 = _T_256 ? io_excep_i_value : 32'h0; // @[id_ex.scala 74:27:@1795.6]
  assign _T_323 = _T_256 ? io_excep_i_valid : 1'h0; // @[id_ex.scala 75:27:@1798.6]
  assign _T_326 = _T_256 ? io_excep_i_inst_valid : 1'h0; // @[id_ex.scala 77:32:@1802.6]
  assign _GEN_3 = _T_250 ? _T_251 : imm; // @[id_ex.scala 60:29:@1734.4]
  assign _GEN_4 = _T_250 ? _T_253 : ALUOp; // @[id_ex.scala 60:29:@1734.4]
  assign _GEN_5 = _T_250 ? _T_255 : exet; // @[id_ex.scala 60:29:@1734.4]
  assign _GEN_6 = _T_250 ? io_pci : pc; // @[id_ex.scala 60:29:@1734.4]
  assign _GEN_7 = _T_250 ? _T_287_rd_index : regInfo_rd_index; // @[id_ex.scala 60:29:@1734.4]
  assign _GEN_8 = _T_250 ? _T_287_rd_valid : regInfo_rd_valid; // @[id_ex.scala 60:29:@1734.4]
  assign _GEN_9 = _T_250 ? _T_287_rs2_value : regInfo_rs2_value; // @[id_ex.scala 60:29:@1734.4]
  assign _GEN_10 = _T_250 ? _T_287_rs1_value : regInfo_rs1_value; // @[id_ex.scala 60:29:@1734.4]
  assign _GEN_11 = _T_250 ? _T_287_rs2_valid : regInfo_rs2_valid; // @[id_ex.scala 60:29:@1734.4]
  assign _GEN_13 = _T_250 ? _T_294 : lsm; // @[id_ex.scala 60:29:@1734.4]
  assign _GEN_14 = _T_250 ? _T_296 : op32; // @[id_ex.scala 60:29:@1734.4]
  assign _GEN_15 = _T_250 ? _GEN_0 : csr_wb_csr_data; // @[id_ex.scala 60:29:@1734.4]
  assign _GEN_16 = _T_250 ? _GEN_1 : csr_wb_csr_idx; // @[id_ex.scala 60:29:@1734.4]
  assign _GEN_17 = _T_250 ? _GEN_2 : csr_wb_valid; // @[id_ex.scala 60:29:@1734.4]
  assign _GEN_18 = _T_250 ? _T_317 : excep_code; // @[id_ex.scala 60:29:@1734.4]
  assign _GEN_19 = _T_250 ? _T_320 : excep_value; // @[id_ex.scala 60:29:@1734.4]
  assign _GEN_20 = _T_250 ? _T_323 : excep_valid; // @[id_ex.scala 60:29:@1734.4]
  assign _GEN_21 = _T_250 ? io_excep_i_pc : excep_pc; // @[id_ex.scala 60:29:@1734.4]
  assign _GEN_22 = _T_250 ? _T_326 : excep_inst_valid; // @[id_ex.scala 60:29:@1734.4]
  assign io_immo = imm; // @[id_ex.scala 50:15:@1713.4]
  assign io_ALUOpo = ALUOp; // @[id_ex.scala 51:15:@1714.4]
  assign io_exeto = exet; // @[id_ex.scala 52:15:@1715.4]
  assign io_pco = pc; // @[id_ex.scala 53:15:@1716.4]
  assign io_lsmo = lsm; // @[id_ex.scala 55:15:@1723.4]
  assign io_op32o = op32; // @[id_ex.scala 56:15:@1724.4]
  assign io_csr_wb_o_valid = csr_wb_valid; // @[id_ex.scala 57:18:@1727.4]
  assign io_csr_wb_o_csr_idx = csr_wb_csr_idx; // @[id_ex.scala 57:18:@1726.4]
  assign io_csr_wb_o_csr_data = csr_wb_csr_data; // @[id_ex.scala 57:18:@1725.4]
  assign io_drego_rs2_valid = regInfo_rs2_valid; // @[id_ex.scala 54:14:@1721.4]
  assign io_drego_rs1_value = regInfo_rs1_value; // @[id_ex.scala 54:14:@1720.4]
  assign io_drego_rs2_value = regInfo_rs2_value; // @[id_ex.scala 54:14:@1719.4]
  assign io_drego_rd_valid = regInfo_rd_valid; // @[id_ex.scala 54:14:@1718.4]
  assign io_drego_rd_index = regInfo_rd_index; // @[id_ex.scala 54:14:@1717.4]
  assign io_excep_o_valid = excep_valid; // @[id_ex.scala 58:16:@1732.4]
  assign io_excep_o_code = excep_code; // @[id_ex.scala 58:16:@1731.4]
  assign io_excep_o_value = excep_value; // @[id_ex.scala 58:16:@1730.4]
  assign io_excep_o_pc = excep_pc; // @[id_ex.scala 58:16:@1729.4]
  assign io_excep_o_inst_valid = excep_inst_valid; // @[id_ex.scala 58:16:@1728.4]
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
  _RAND_17 = {2{`RANDOM}};
  excep_pc = _RAND_17[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  excep_inst_valid = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      imm <= 64'h0;
    end else begin
      if (_T_250) begin
        imm <= _T_251;
      end
    end
    if (reset) begin
      ALUOp <= 4'h0;
    end else begin
      if (_T_250) begin
        ALUOp <= _T_253;
      end
    end
    if (reset) begin
      exet <= 4'h0;
    end else begin
      if (_T_250) begin
        exet <= _T_255;
      end
    end
    if (reset) begin
      pc <= 64'h0;
    end else begin
      if (_T_250) begin
        pc <= io_pci;
      end
    end
    if (reset) begin
      regInfo_rs2_valid <= 1'h0;
    end else begin
      if (_T_250) begin
        if (_T_256) begin
          regInfo_rs2_valid <= io_dregi_rs2_valid;
        end else begin
          regInfo_rs2_valid <= 1'h0;
        end
      end
    end
    if (reset) begin
      regInfo_rs1_value <= 64'h0;
    end else begin
      if (_T_250) begin
        if (_T_256) begin
          regInfo_rs1_value <= io_dregi_rs1_value;
        end else begin
          regInfo_rs1_value <= 64'h0;
        end
      end
    end
    if (reset) begin
      regInfo_rs2_value <= 64'h0;
    end else begin
      if (_T_250) begin
        if (_T_256) begin
          regInfo_rs2_value <= io_dregi_rs2_value;
        end else begin
          regInfo_rs2_value <= 64'h0;
        end
      end
    end
    if (reset) begin
      regInfo_rd_valid <= 1'h0;
    end else begin
      if (_T_250) begin
        if (_T_256) begin
          regInfo_rd_valid <= io_dregi_rd_valid;
        end else begin
          regInfo_rd_valid <= 1'h0;
        end
      end
    end
    if (reset) begin
      regInfo_rd_index <= 5'h0;
    end else begin
      if (_T_250) begin
        if (_T_256) begin
          regInfo_rd_index <= io_dregi_rd_index;
        end else begin
          regInfo_rd_index <= 5'h0;
        end
      end
    end
    if (reset) begin
      lsm <= 4'hf;
    end else begin
      if (_T_250) begin
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
      if (_T_250) begin
        op32 <= _T_296;
      end
    end
    if (reset) begin
      csr_wb_valid <= 1'h0;
    end else begin
      if (_T_250) begin
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
      if (_T_250) begin
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
      if (_T_250) begin
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
      if (_T_250) begin
        if (_T_256) begin
          excep_valid <= io_excep_i_valid;
        end else begin
          excep_valid <= 1'h0;
        end
      end
    end
    if (reset) begin
      excep_code <= 32'h0;
    end else begin
      if (_T_250) begin
        if (_T_256) begin
          excep_code <= io_excep_i_code;
        end else begin
          excep_code <= 32'h0;
        end
      end
    end
    if (reset) begin
      excep_value <= 32'h0;
    end else begin
      if (_T_250) begin
        if (_T_256) begin
          excep_value <= io_excep_i_value;
        end else begin
          excep_value <= 32'h0;
        end
      end
    end
    if (reset) begin
      excep_pc <= 64'h0;
    end else begin
      if (_T_250) begin
        excep_pc <= io_excep_i_pc;
      end
    end
    if (reset) begin
      excep_inst_valid <= 1'h0;
    end else begin
      if (_T_250) begin
        if (_T_256) begin
          excep_inst_valid <= io_excep_i_inst_valid;
        end else begin
          excep_inst_valid <= 1'h0;
        end
      end
    end
  end
endmodule
module EX_MEM( // @[:@1808.2]
  input         clock, // @[:@1809.4]
  input         reset, // @[:@1810.4]
  input         io_en, // @[:@1811.4]
  input         io_pass, // @[:@1811.4]
  input         io_flush, // @[:@1811.4]
  input         io_nlsi, // @[:@1811.4]
  input  [3:0]  io_lsmi, // @[:@1811.4]
  input  [63:0] io_addri, // @[:@1811.4]
  input  [63:0] io_datai, // @[:@1811.4]
  input         io_wregi_wbrv, // @[:@1811.4]
  input  [4:0]  io_wregi_wbri, // @[:@1811.4]
  input  [63:0] io_wregi_wbrd, // @[:@1811.4]
  input         io_csr_wb_i_valid, // @[:@1811.4]
  input  [11:0] io_csr_wb_i_csr_idx, // @[:@1811.4]
  input  [63:0] io_csr_wb_i_csr_data, // @[:@1811.4]
  input         io_excep_i_valid, // @[:@1811.4]
  input  [31:0] io_excep_i_code, // @[:@1811.4]
  input  [31:0] io_excep_i_value, // @[:@1811.4]
  input  [63:0] io_excep_i_pc, // @[:@1811.4]
  input         io_excep_i_inst_valid, // @[:@1811.4]
  input         io_inter_i_valid, // @[:@1811.4]
  input  [31:0] io_inter_i_bits, // @[:@1811.4]
  output        io_nlso, // @[:@1811.4]
  output [3:0]  io_lsmo, // @[:@1811.4]
  output [63:0] io_addro, // @[:@1811.4]
  output [63:0] io_datao, // @[:@1811.4]
  output        io_wrego_wbrv, // @[:@1811.4]
  output [4:0]  io_wrego_wbri, // @[:@1811.4]
  output [63:0] io_wrego_wbrd, // @[:@1811.4]
  output        io_csr_wb_o_valid, // @[:@1811.4]
  output [11:0] io_csr_wb_o_csr_idx, // @[:@1811.4]
  output [63:0] io_csr_wb_o_csr_data, // @[:@1811.4]
  output        io_excep_o_valid, // @[:@1811.4]
  output [31:0] io_excep_o_code, // @[:@1811.4]
  output [31:0] io_excep_o_value, // @[:@1811.4]
  output [63:0] io_excep_o_pc, // @[:@1811.4]
  output        io_excep_o_inst_valid, // @[:@1811.4]
  output        io_inter_o_valid, // @[:@1811.4]
  output [31:0] io_inter_o_bits // @[:@1811.4]
);
  reg  nls; // @[ex_mem.scala 31:23:@1813.4]
  reg [31:0] _RAND_0;
  reg  wbrv; // @[ex_mem.scala 32:23:@1814.4]
  reg [31:0] _RAND_1;
  reg [63:0] wbrd; // @[ex_mem.scala 33:23:@1815.4]
  reg [63:0] _RAND_2;
  reg [4:0] wbri; // @[ex_mem.scala 34:23:@1816.4]
  reg [31:0] _RAND_3;
  reg [3:0] lsm; // @[ex_mem.scala 35:23:@1817.4]
  reg [31:0] _RAND_4;
  reg [63:0] addr; // @[ex_mem.scala 36:23:@1818.4]
  reg [63:0] _RAND_5;
  reg [63:0] data; // @[ex_mem.scala 37:23:@1819.4]
  reg [63:0] _RAND_6;
  reg  csr_wb_valid; // @[ex_mem.scala 38:26:@1829.4]
  reg [31:0] _RAND_7;
  reg [11:0] csr_wb_csr_idx; // @[ex_mem.scala 38:26:@1829.4]
  reg [31:0] _RAND_8;
  reg [63:0] csr_wb_csr_data; // @[ex_mem.scala 38:26:@1829.4]
  reg [63:0] _RAND_9;
  reg  excep_valid; // @[ex_mem.scala 39:26:@1843.4]
  reg [31:0] _RAND_10;
  reg [31:0] excep_code; // @[ex_mem.scala 39:26:@1843.4]
  reg [31:0] _RAND_11;
  reg [31:0] excep_value; // @[ex_mem.scala 39:26:@1843.4]
  reg [31:0] _RAND_12;
  reg [63:0] excep_pc; // @[ex_mem.scala 39:26:@1843.4]
  reg [63:0] _RAND_13;
  reg  excep_inst_valid; // @[ex_mem.scala 39:26:@1843.4]
  reg [31:0] _RAND_14;
  reg  inter_valid; // @[ex_mem.scala 40:26:@1851.4]
  reg [31:0] _RAND_15;
  reg [31:0] inter_bits; // @[ex_mem.scala 40:26:@1851.4]
  reg [31:0] _RAND_16;
  wire  _T_206; // @[ex_mem.scala 53:17:@1869.4]
  wire  _T_207; // @[ex_mem.scala 54:45:@1871.6]
  wire  _T_208; // @[ex_mem.scala 54:67:@1872.6]
  wire  _T_210; // @[ex_mem.scala 55:21:@1873.6]
  wire [4:0] _T_212; // @[ex_mem.scala 56:21:@1875.6]
  wire  _T_215; // @[ex_mem.scala 57:44:@1877.6]
  wire  _T_216; // @[ex_mem.scala 57:21:@1878.6]
  wire [63:0] _T_218; // @[ex_mem.scala 58:21:@1880.6]
  wire [3:0] _T_219; // @[ex_mem.scala 59:45:@1882.6]
  wire [3:0] _T_220; // @[ex_mem.scala 59:21:@1883.6]
  wire [63:0] _T_223; // @[ex_mem.scala 60:21:@1886.6]
  wire [63:0] _T_225; // @[ex_mem.scala 61:21:@1888.6]
  wire  _T_228; // @[ex_mem.scala 63:54:@1890.6]
  wire  _T_229; // @[ex_mem.scala 63:31:@1891.6]
  wire  _GEN_0; // @[ex_mem.scala 69:24:@1902.6]
  wire  _GEN_1; // @[ex_mem.scala 69:24:@1902.6]
  wire  _GEN_2; // @[ex_mem.scala 69:24:@1902.6]
  wire  _GEN_3; // @[ex_mem.scala 53:29:@1870.4]
  wire [4:0] _GEN_4; // @[ex_mem.scala 53:29:@1870.4]
  wire  _GEN_5; // @[ex_mem.scala 53:29:@1870.4]
  wire [63:0] _GEN_6; // @[ex_mem.scala 53:29:@1870.4]
  wire [3:0] _GEN_7; // @[ex_mem.scala 53:29:@1870.4]
  wire [63:0] _GEN_8; // @[ex_mem.scala 53:29:@1870.4]
  wire [63:0] _GEN_9; // @[ex_mem.scala 53:29:@1870.4]
  wire  _GEN_10; // @[ex_mem.scala 53:29:@1870.4]
  wire [11:0] _GEN_11; // @[ex_mem.scala 53:29:@1870.4]
  wire [63:0] _GEN_12; // @[ex_mem.scala 53:29:@1870.4]
  wire  _GEN_13; // @[ex_mem.scala 53:29:@1870.4]
  wire [63:0] _GEN_14; // @[ex_mem.scala 53:29:@1870.4]
  wire [31:0] _GEN_15; // @[ex_mem.scala 53:29:@1870.4]
  wire [31:0] _GEN_16; // @[ex_mem.scala 53:29:@1870.4]
  wire  _GEN_17; // @[ex_mem.scala 53:29:@1870.4]
  wire [31:0] _GEN_18; // @[ex_mem.scala 53:29:@1870.4]
  wire  _GEN_19; // @[ex_mem.scala 53:29:@1870.4]
  assign _T_206 = io_en & io_pass; // @[ex_mem.scala 53:17:@1869.4]
  assign _T_207 = io_excep_i_valid | io_inter_i_valid; // @[ex_mem.scala 54:45:@1871.6]
  assign _T_208 = _T_207 & io_excep_i_inst_valid; // @[ex_mem.scala 54:67:@1872.6]
  assign _T_210 = _T_208 ? 1'h0 : io_nlsi; // @[ex_mem.scala 55:21:@1873.6]
  assign _T_212 = io_flush ? 5'h0 : io_wregi_wbri; // @[ex_mem.scala 56:21:@1875.6]
  assign _T_215 = _T_208 ? 1'h0 : io_wregi_wbrv; // @[ex_mem.scala 57:44:@1877.6]
  assign _T_216 = io_flush ? 1'h0 : _T_215; // @[ex_mem.scala 57:21:@1878.6]
  assign _T_218 = io_flush ? 64'h0 : io_wregi_wbrd; // @[ex_mem.scala 58:21:@1880.6]
  assign _T_219 = _T_208 ? 4'hf : io_lsmi; // @[ex_mem.scala 59:45:@1882.6]
  assign _T_220 = io_flush ? 4'hf : _T_219; // @[ex_mem.scala 59:21:@1883.6]
  assign _T_223 = io_flush ? 64'hffffffffffffffff : io_addri; // @[ex_mem.scala 60:21:@1886.6]
  assign _T_225 = io_flush ? 64'h0 : io_datai; // @[ex_mem.scala 61:21:@1888.6]
  assign _T_228 = _T_208 ? 1'h1 : io_csr_wb_i_valid; // @[ex_mem.scala 63:54:@1890.6]
  assign _T_229 = io_flush ? 1'h0 : _T_228; // @[ex_mem.scala 63:31:@1891.6]
  assign _GEN_0 = io_flush ? 1'h0 : io_excep_i_valid; // @[ex_mem.scala 69:24:@1902.6]
  assign _GEN_1 = io_flush ? 1'h0 : io_excep_i_inst_valid; // @[ex_mem.scala 69:24:@1902.6]
  assign _GEN_2 = io_flush ? 1'h0 : io_inter_i_valid; // @[ex_mem.scala 69:24:@1902.6]
  assign _GEN_3 = _T_206 ? _T_210 : nls; // @[ex_mem.scala 53:29:@1870.4]
  assign _GEN_4 = _T_206 ? _T_212 : wbri; // @[ex_mem.scala 53:29:@1870.4]
  assign _GEN_5 = _T_206 ? _T_216 : wbrv; // @[ex_mem.scala 53:29:@1870.4]
  assign _GEN_6 = _T_206 ? _T_218 : wbrd; // @[ex_mem.scala 53:29:@1870.4]
  assign _GEN_7 = _T_206 ? _T_220 : lsm; // @[ex_mem.scala 53:29:@1870.4]
  assign _GEN_8 = _T_206 ? _T_223 : addr; // @[ex_mem.scala 53:29:@1870.4]
  assign _GEN_9 = _T_206 ? _T_225 : data; // @[ex_mem.scala 53:29:@1870.4]
  assign _GEN_10 = _T_206 ? _T_229 : csr_wb_valid; // @[ex_mem.scala 53:29:@1870.4]
  assign _GEN_11 = _T_206 ? io_csr_wb_i_csr_idx : csr_wb_csr_idx; // @[ex_mem.scala 53:29:@1870.4]
  assign _GEN_12 = _T_206 ? io_csr_wb_i_csr_data : csr_wb_csr_data; // @[ex_mem.scala 53:29:@1870.4]
  assign _GEN_13 = _T_206 ? _GEN_1 : excep_inst_valid; // @[ex_mem.scala 53:29:@1870.4]
  assign _GEN_14 = _T_206 ? io_excep_i_pc : excep_pc; // @[ex_mem.scala 53:29:@1870.4]
  assign _GEN_15 = _T_206 ? io_excep_i_value : excep_value; // @[ex_mem.scala 53:29:@1870.4]
  assign _GEN_16 = _T_206 ? io_excep_i_code : excep_code; // @[ex_mem.scala 53:29:@1870.4]
  assign _GEN_17 = _T_206 ? _GEN_0 : excep_valid; // @[ex_mem.scala 53:29:@1870.4]
  assign _GEN_18 = _T_206 ? io_inter_i_bits : inter_bits; // @[ex_mem.scala 53:29:@1870.4]
  assign _GEN_19 = _T_206 ? _GEN_2 : inter_valid; // @[ex_mem.scala 53:29:@1870.4]
  assign io_nlso = nls; // @[ex_mem.scala 42:13:@1852.4]
  assign io_lsmo = lsm; // @[ex_mem.scala 46:13:@1856.4]
  assign io_addro = addr; // @[ex_mem.scala 47:14:@1857.4]
  assign io_datao = data; // @[ex_mem.scala 48:14:@1858.4]
  assign io_wrego_wbrv = wbrv; // @[ex_mem.scala 44:19:@1854.4]
  assign io_wrego_wbri = wbri; // @[ex_mem.scala 45:19:@1855.4]
  assign io_wrego_wbrd = wbrd; // @[ex_mem.scala 43:19:@1853.4]
  assign io_csr_wb_o_valid = csr_wb_valid; // @[ex_mem.scala 49:18:@1861.4]
  assign io_csr_wb_o_csr_idx = csr_wb_csr_idx; // @[ex_mem.scala 49:18:@1860.4]
  assign io_csr_wb_o_csr_data = csr_wb_csr_data; // @[ex_mem.scala 49:18:@1859.4]
  assign io_excep_o_valid = excep_valid; // @[ex_mem.scala 50:18:@1866.4]
  assign io_excep_o_code = excep_code; // @[ex_mem.scala 50:18:@1865.4]
  assign io_excep_o_value = excep_value; // @[ex_mem.scala 50:18:@1864.4]
  assign io_excep_o_pc = excep_pc; // @[ex_mem.scala 50:18:@1863.4]
  assign io_excep_o_inst_valid = excep_inst_valid; // @[ex_mem.scala 50:18:@1862.4]
  assign io_inter_o_valid = inter_valid; // @[ex_mem.scala 51:18:@1868.4]
  assign io_inter_o_bits = inter_bits; // @[ex_mem.scala 51:18:@1867.4]
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
  _RAND_16 = {1{`RANDOM}};
  inter_bits = _RAND_16[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      nls <= 1'h0;
    end else begin
      if (_T_206) begin
        if (_T_208) begin
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
            csr_wb_valid <= 1'h1;
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
      excep_code <= 32'h0;
    end else begin
      if (_T_206) begin
        excep_code <= io_excep_i_code;
      end
    end
    if (reset) begin
      excep_value <= 32'h0;
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
      inter_bits <= 32'h0;
    end else begin
      if (_T_206) begin
        inter_bits <= io_inter_i_bits;
      end
    end
  end
endmodule
module MEM_WB( // @[:@1909.2]
  input         clock, // @[:@1910.4]
  input         reset, // @[:@1911.4]
  input         io_en, // @[:@1912.4]
  input         io_pass, // @[:@1912.4]
  input         io_wregi_wbrv, // @[:@1912.4]
  input  [4:0]  io_wregi_wbri, // @[:@1912.4]
  input  [63:0] io_wregi_wbrd, // @[:@1912.4]
  output        io_wrego_wbrv, // @[:@1912.4]
  output [4:0]  io_wrego_wbri, // @[:@1912.4]
  output [63:0] io_wrego_wbrd // @[:@1912.4]
);
  reg  wbrv; // @[mem_wb.scala 15:23:@1914.4]
  reg [31:0] _RAND_0;
  reg [63:0] wbrd; // @[mem_wb.scala 16:23:@1915.4]
  reg [63:0] _RAND_1;
  reg [4:0] wbri; // @[mem_wb.scala 17:23:@1916.4]
  reg [31:0] _RAND_2;
  wire  _T_35; // @[mem_wb.scala 23:17:@1920.4]
  wire [4:0] _GEN_0; // @[mem_wb.scala 23:29:@1921.4]
  wire  _GEN_1; // @[mem_wb.scala 23:29:@1921.4]
  wire [63:0] _GEN_2; // @[mem_wb.scala 23:29:@1921.4]
  assign _T_35 = io_en & io_pass; // @[mem_wb.scala 23:17:@1920.4]
  assign _GEN_0 = _T_35 ? io_wregi_wbri : wbri; // @[mem_wb.scala 23:29:@1921.4]
  assign _GEN_1 = _T_35 ? io_wregi_wbrv : wbrv; // @[mem_wb.scala 23:29:@1921.4]
  assign _GEN_2 = _T_35 ? io_wregi_wbrd : wbrd; // @[mem_wb.scala 23:29:@1921.4]
  assign io_wrego_wbrv = wbrv; // @[mem_wb.scala 20:19:@1918.4]
  assign io_wrego_wbri = wbri; // @[mem_wb.scala 21:19:@1919.4]
  assign io_wrego_wbrd = wbrd; // @[mem_wb.scala 19:19:@1917.4]
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
module CSR( // @[:@1927.2]
  input         clock, // @[:@1928.4]
  input         reset, // @[:@1929.4]
  input  [11:0] io_id_addr, // @[:@1930.4]
  output [63:0] io_id_rdata, // @[:@1930.4]
  output [1:0]  io_id_priv, // @[:@1930.4]
  input         io_mem_wrCSROp_valid, // @[:@1930.4]
  input  [11:0] io_mem_wrCSROp_csr_idx, // @[:@1930.4]
  input  [63:0] io_mem_wrCSROp_csr_data, // @[:@1930.4]
  input         io_mem_excep_valid, // @[:@1930.4]
  input  [31:0] io_mem_excep_code, // @[:@1930.4]
  input  [31:0] io_mem_excep_value, // @[:@1930.4]
  input  [63:0] io_mem_excep_pc, // @[:@1930.4]
  input         io_mem_excep_inst_valid, // @[:@1930.4]
  output [1:0]  io_mmu_priv, // @[:@1930.4]
  output        io_mmu_mxr, // @[:@1930.4]
  output        io_mmu_sum, // @[:@1930.4]
  output        io_flush, // @[:@1930.4]
  output [63:0] io_csrNewPc, // @[:@1930.4]
  output        io_inter_valid, // @[:@1930.4]
  output [31:0] io_inter_bits // @[:@1930.4]
);
  reg [63:0] csr [0:1023]; // @[CSR.scala 25:16:@1936.4]
  reg [63:0] _RAND_0;
  wire [63:0] csr__T_162_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_162_addr; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_251_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_251_addr; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_252_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_252_addr; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_275_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_275_addr; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_mtvec_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_mtvec_addr; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_stvec_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_stvec_addr; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_utvec_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_utvec_addr; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_medeleg_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_medeleg_addr; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_mideleg_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_mideleg_addr; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_sedeleg_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_sedeleg_addr; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_sideleg_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_sideleg_addr; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_mie_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_mie_addr; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_mip_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_mip_addr; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_mtimecmp_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_mtimecmp_addr; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_mepc_r_0_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_mepc_r_0_addr; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_sepc_r_0_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_sepc_r_0_addr; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_uepc_r_0_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_uepc_r_0_addr; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_278_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_278_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_278_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_278_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_281_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_281_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_281_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_281_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_284_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_284_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_284_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_284_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_287_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_287_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_287_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_287_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_289_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_289_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_289_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_289_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_291_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_291_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_291_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_291_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_293_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_293_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_293_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_293_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_295_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_295_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_295_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_295_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_297_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_297_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_297_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_297_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_299_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_299_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_299_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_299_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_301_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_301_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_301_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_301_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_303_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_303_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_303_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_303_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_305_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_305_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_305_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_305_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_307_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_307_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_307_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_307_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_309_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_309_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_309_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_309_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_311_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_311_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_311_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_311_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_313_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_313_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_313_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_313_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_315_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_315_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_315_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_315_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_317_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_317_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_317_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_317_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_319_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_319_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_319_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_319_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_321_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_321_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_321_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_321_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_323_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_323_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_323_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_323_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_325_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_325_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_325_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_325_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_327_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_327_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_327_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_327_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_329_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_329_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_329_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_329_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_331_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_331_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_331_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_331_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_333_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_333_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_333_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_333_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_335_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_335_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_335_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_335_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_337_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_337_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_337_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_337_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_339_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_339_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_339_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_339_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_341_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_341_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_341_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_341_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_343_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_343_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_343_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_343_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_345_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_345_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_345_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_345_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_347_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_347_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_347_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_347_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_349_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_349_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_349_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_349_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_352_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_352_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_352_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_352_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_355_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_355_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_355_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_355_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_mcause_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_mcause_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr_mcause_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr_mcause_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_scause_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_scause_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr_scause_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr_scause_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_ucause_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_ucause_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr_ucause_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr_ucause_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_mtval_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_mtval_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr_mtval_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr_mtval_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_stval_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_stval_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr_stval_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr_stval_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_utval_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_utval_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr_utval_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr_utval_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr__T_422_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr__T_422_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_422_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr__T_422_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_mepc_w_0_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_mepc_w_0_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr_mepc_w_0_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr_mepc_w_0_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_sepc_w_0_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_sepc_w_0_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr_sepc_w_0_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr_sepc_w_0_en; // @[CSR.scala 25:16:@1936.4]
  wire [63:0] csr_uepc_w_0_data; // @[CSR.scala 25:16:@1936.4]
  wire [9:0] csr_uepc_w_0_addr; // @[CSR.scala 25:16:@1936.4]
  wire  csr_uepc_w_0_mask; // @[CSR.scala 25:16:@1936.4]
  wire  csr_uepc_w_0_en; // @[CSR.scala 25:16:@1936.4]
  reg [1:0] prv; // @[CSR.scala 22:24:@1933.4]
  reg [31:0] _RAND_1;
  reg  mstatus_SD; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_2;
  reg [26:0] mstatus_zero1; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_3;
  reg [1:0] mstatus_SXL; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_4;
  reg [1:0] mstatus_UXL; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_5;
  reg  mstatus_TSR; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_6;
  reg [8:0] mstatus_zero2; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_7;
  reg  mstatus_TW; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_8;
  reg  mstatus_TVM; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_9;
  reg  mstatus_MXR; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_10;
  reg  mstatus_SUM; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_11;
  reg  mstatus_MPriv; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_12;
  reg [1:0] mstatus_XS; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_13;
  reg [1:0] mstatus_FS; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_14;
  reg [1:0] mstatus_MPP; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_15;
  reg [1:0] mstatus_old_HPP; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_16;
  reg  mstatus_SPP; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_17;
  reg  mstatus_MPIE; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_18;
  reg  mstatus_old_HPIE; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_19;
  reg  mstatus_SPIE; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_20;
  reg  mstatus_UPIE; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_21;
  reg  mstatus_MIE; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_22;
  reg  mstatus_old_HIE; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_23;
  reg  mstatus_SIE; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_24;
  reg  mstatus_UIE; // @[CSR.scala 102:24:@1988.4]
  reg [31:0] _RAND_25;
  reg [63:0] mtime; // @[CSR.scala 103:24:@1989.4]
  reg [63:0] _RAND_26;
  wire [64:0] _T_159; // @[CSR.scala 104:18:@1990.4]
  wire [63:0] _T_160; // @[CSR.scala 104:18:@1991.4]
  wire [5:0] _T_209; // @[CSR.scala 112:29:@1999.4]
  wire [14:0] _T_215; // @[CSR.scala 112:29:@2005.4]
  wire [6:0] _T_220; // @[CSR.scala 112:29:@2010.4]
  wire [63:0] _T_227; // @[CSR.scala 112:29:@2017.4]
  wire  _T_253; // @[Mux.scala 46:19:@2043.4]
  wire [63:0] _T_254; // @[Mux.scala 46:16:@2044.4]
  wire  _T_255; // @[Mux.scala 46:19:@2045.4]
  wire [63:0] _T_256; // @[Mux.scala 46:16:@2046.4]
  wire  _T_257; // @[Mux.scala 46:19:@2047.4]
  wire [63:0] _T_258; // @[Mux.scala 46:16:@2048.4]
  wire  _T_259; // @[Mux.scala 46:19:@2049.4]
  wire [63:0] _T_260; // @[Mux.scala 46:16:@2050.4]
  wire  _T_261; // @[Mux.scala 46:19:@2051.4]
  wire [63:0] _T_262; // @[Mux.scala 46:16:@2052.4]
  wire  _T_263; // @[Mux.scala 46:19:@2053.4]
  wire [63:0] _T_264; // @[Mux.scala 46:16:@2054.4]
  wire  _T_265; // @[Mux.scala 46:19:@2055.4]
  wire [63:0] _T_266; // @[Mux.scala 46:16:@2056.4]
  wire  _T_267; // @[Mux.scala 46:19:@2057.4]
  wire [63:0] _T_268; // @[Mux.scala 46:16:@2058.4]
  wire  _T_269; // @[Mux.scala 46:19:@2059.4]
  wire [63:0] _T_270; // @[Mux.scala 46:16:@2060.4]
  wire  _T_271; // @[Mux.scala 46:19:@2061.4]
  wire [63:0] _T_272; // @[Mux.scala 46:16:@2062.4]
  wire  _T_273; // @[Mux.scala 46:19:@2063.4]
  wire  _T_276; // @[CSR.scala 132:14:@2073.6]
  wire  _T_279; // @[CSR.scala 132:14:@2078.6]
  wire  _T_282; // @[CSR.scala 132:14:@2083.6]
  wire  _T_285; // @[CSR.scala 132:14:@2088.6]
  wire  _T_288; // @[CSR.scala 132:14:@2093.6]
  wire  _T_290; // @[CSR.scala 132:14:@2098.6]
  wire  _T_292; // @[CSR.scala 132:14:@2103.6]
  wire  _T_294; // @[CSR.scala 132:14:@2108.6]
  wire  _T_296; // @[CSR.scala 132:14:@2113.6]
  wire  _T_298; // @[CSR.scala 132:14:@2118.6]
  wire  _T_300; // @[CSR.scala 132:14:@2123.6]
  wire  _T_302; // @[CSR.scala 132:14:@2128.6]
  wire  _T_304; // @[CSR.scala 132:14:@2133.6]
  wire  _T_306; // @[CSR.scala 132:14:@2138.6]
  wire  _T_308; // @[CSR.scala 132:14:@2143.6]
  wire  _T_310; // @[CSR.scala 132:14:@2148.6]
  wire  _T_312; // @[CSR.scala 132:14:@2153.6]
  wire  _T_314; // @[CSR.scala 132:14:@2158.6]
  wire  _T_316; // @[CSR.scala 132:14:@2163.6]
  wire  _T_318; // @[CSR.scala 132:14:@2168.6]
  wire  _T_320; // @[CSR.scala 132:14:@2173.6]
  wire  _T_322; // @[CSR.scala 132:14:@2178.6]
  wire  _T_324; // @[CSR.scala 132:14:@2183.6]
  wire  _T_326; // @[CSR.scala 132:14:@2188.6]
  wire  _T_328; // @[CSR.scala 132:14:@2193.6]
  wire  _T_330; // @[CSR.scala 132:14:@2198.6]
  wire  _T_332; // @[CSR.scala 132:14:@2203.6]
  wire  _T_334; // @[CSR.scala 132:14:@2208.6]
  wire  _T_336; // @[CSR.scala 132:14:@2213.6]
  wire  _T_338; // @[CSR.scala 132:14:@2218.6]
  wire  _T_340; // @[CSR.scala 132:14:@2223.6]
  wire  _T_342; // @[CSR.scala 132:14:@2228.6]
  wire  _T_344; // @[CSR.scala 132:14:@2233.6]
  wire  _T_346; // @[CSR.scala 132:14:@2238.6]
  wire  _T_348; // @[CSR.scala 132:14:@2243.6]
  wire  _T_350; // @[CSR.scala 132:14:@2248.6]
  wire  _T_353; // @[CSR.scala 132:14:@2253.6]
  wire  _T_356; // @[CSR.scala 138:33:@2258.6]
  wire  _T_362; // @[CSR.scala 139:50:@2263.8]
  wire  _T_363; // @[CSR.scala 139:50:@2265.8]
  wire  _T_364; // @[CSR.scala 139:50:@2267.8]
  wire  _T_365; // @[CSR.scala 139:50:@2269.8]
  wire  _T_366; // @[CSR.scala 139:50:@2271.8]
  wire  _T_367; // @[CSR.scala 139:50:@2273.8]
  wire  _T_368; // @[CSR.scala 139:50:@2275.8]
  wire  _T_369; // @[CSR.scala 139:50:@2277.8]
  wire  _T_370; // @[CSR.scala 139:50:@2279.8]
  wire [1:0] _T_371; // @[CSR.scala 139:50:@2281.8]
  wire [1:0] _T_372; // @[CSR.scala 139:50:@2283.8]
  wire [1:0] _T_373; // @[CSR.scala 139:50:@2285.8]
  wire [1:0] _T_374; // @[CSR.scala 139:50:@2287.8]
  wire  _T_375; // @[CSR.scala 139:50:@2289.8]
  wire  _T_376; // @[CSR.scala 139:50:@2291.8]
  wire  _T_377; // @[CSR.scala 139:50:@2293.8]
  wire  _T_378; // @[CSR.scala 139:50:@2295.8]
  wire  _T_379; // @[CSR.scala 139:50:@2297.8]
  wire [8:0] _T_380; // @[CSR.scala 139:50:@2299.8]
  wire  _T_381; // @[CSR.scala 139:50:@2301.8]
  wire [1:0] _T_382; // @[CSR.scala 139:50:@2303.8]
  wire [1:0] _T_383; // @[CSR.scala 139:50:@2305.8]
  wire [26:0] _T_384; // @[CSR.scala 139:50:@2307.8]
  wire  _T_385; // @[CSR.scala 139:50:@2309.8]
  wire  _GEN_185; // @[CSR.scala 138:51:@2259.6]
  wire  _GEN_186; // @[CSR.scala 138:51:@2259.6]
  wire  _GEN_187; // @[CSR.scala 138:51:@2259.6]
  wire  _GEN_188; // @[CSR.scala 138:51:@2259.6]
  wire  _GEN_189; // @[CSR.scala 138:51:@2259.6]
  wire  _GEN_190; // @[CSR.scala 138:51:@2259.6]
  wire  _GEN_191; // @[CSR.scala 138:51:@2259.6]
  wire  _GEN_192; // @[CSR.scala 138:51:@2259.6]
  wire  _GEN_193; // @[CSR.scala 138:51:@2259.6]
  wire [1:0] _GEN_194; // @[CSR.scala 138:51:@2259.6]
  wire [1:0] _GEN_195; // @[CSR.scala 138:51:@2259.6]
  wire [1:0] _GEN_196; // @[CSR.scala 138:51:@2259.6]
  wire [1:0] _GEN_197; // @[CSR.scala 138:51:@2259.6]
  wire  _GEN_198; // @[CSR.scala 138:51:@2259.6]
  wire  _GEN_199; // @[CSR.scala 138:51:@2259.6]
  wire  _GEN_200; // @[CSR.scala 138:51:@2259.6]
  wire  _GEN_201; // @[CSR.scala 138:51:@2259.6]
  wire  _GEN_202; // @[CSR.scala 138:51:@2259.6]
  wire [8:0] _GEN_203; // @[CSR.scala 138:51:@2259.6]
  wire  _GEN_204; // @[CSR.scala 138:51:@2259.6]
  wire [1:0] _GEN_205; // @[CSR.scala 138:51:@2259.6]
  wire [1:0] _GEN_206; // @[CSR.scala 138:51:@2259.6]
  wire [26:0] _GEN_207; // @[CSR.scala 138:51:@2259.6]
  wire  _GEN_208; // @[CSR.scala 138:51:@2259.6]
  wire  _T_386; // @[CSR.scala 141:33:@2336.6]
  wire  _GEN_209; // @[CSR.scala 141:51:@2337.6]
  wire  _GEN_210; // @[CSR.scala 141:51:@2337.6]
  wire  _GEN_211; // @[CSR.scala 141:51:@2337.6]
  wire  _GEN_212; // @[CSR.scala 141:51:@2337.6]
  wire  _GEN_213; // @[CSR.scala 141:51:@2337.6]
  wire  _GEN_214; // @[CSR.scala 141:51:@2337.6]
  wire  _GEN_215; // @[CSR.scala 141:51:@2337.6]
  wire  _GEN_216; // @[CSR.scala 141:51:@2337.6]
  wire  _GEN_217; // @[CSR.scala 141:51:@2337.6]
  wire [1:0] _GEN_218; // @[CSR.scala 141:51:@2337.6]
  wire [1:0] _GEN_219; // @[CSR.scala 141:51:@2337.6]
  wire [1:0] _GEN_220; // @[CSR.scala 141:51:@2337.6]
  wire [1:0] _GEN_221; // @[CSR.scala 141:51:@2337.6]
  wire  _GEN_222; // @[CSR.scala 141:51:@2337.6]
  wire  _GEN_223; // @[CSR.scala 141:51:@2337.6]
  wire  _GEN_224; // @[CSR.scala 141:51:@2337.6]
  wire  _GEN_225; // @[CSR.scala 141:51:@2337.6]
  wire  _GEN_226; // @[CSR.scala 141:51:@2337.6]
  wire [8:0] _GEN_227; // @[CSR.scala 141:51:@2337.6]
  wire  _GEN_228; // @[CSR.scala 141:51:@2337.6]
  wire [1:0] _GEN_229; // @[CSR.scala 141:51:@2337.6]
  wire [1:0] _GEN_230; // @[CSR.scala 141:51:@2337.6]
  wire [26:0] _GEN_231; // @[CSR.scala 141:51:@2337.6]
  wire  _GEN_232; // @[CSR.scala 141:51:@2337.6]
  wire  _GEN_418; // @[CSR.scala 130:30:@2072.4]
  wire  _GEN_419; // @[CSR.scala 130:30:@2072.4]
  wire  _GEN_420; // @[CSR.scala 130:30:@2072.4]
  wire  _GEN_421; // @[CSR.scala 130:30:@2072.4]
  wire  _GEN_422; // @[CSR.scala 130:30:@2072.4]
  wire  _GEN_423; // @[CSR.scala 130:30:@2072.4]
  wire  _GEN_424; // @[CSR.scala 130:30:@2072.4]
  wire  _GEN_425; // @[CSR.scala 130:30:@2072.4]
  wire  _GEN_426; // @[CSR.scala 130:30:@2072.4]
  wire [1:0] _GEN_427; // @[CSR.scala 130:30:@2072.4]
  wire [1:0] _GEN_428; // @[CSR.scala 130:30:@2072.4]
  wire [1:0] _GEN_429; // @[CSR.scala 130:30:@2072.4]
  wire [1:0] _GEN_430; // @[CSR.scala 130:30:@2072.4]
  wire  _GEN_431; // @[CSR.scala 130:30:@2072.4]
  wire  _GEN_432; // @[CSR.scala 130:30:@2072.4]
  wire  _GEN_433; // @[CSR.scala 130:30:@2072.4]
  wire  _GEN_434; // @[CSR.scala 130:30:@2072.4]
  wire  _GEN_435; // @[CSR.scala 130:30:@2072.4]
  wire [8:0] _GEN_436; // @[CSR.scala 130:30:@2072.4]
  wire  _GEN_437; // @[CSR.scala 130:30:@2072.4]
  wire [1:0] _GEN_438; // @[CSR.scala 130:30:@2072.4]
  wire [1:0] _GEN_439; // @[CSR.scala 130:30:@2072.4]
  wire [26:0] _GEN_440; // @[CSR.scala 130:30:@2072.4]
  wire  _GEN_441; // @[CSR.scala 130:30:@2072.4]
  wire  _T_417; // @[Mux.scala 46:19:@2434.4]
  wire  _T_418; // @[Mux.scala 46:16:@2435.4]
  wire  _T_419; // @[Mux.scala 46:19:@2436.4]
  wire  _T_420; // @[Mux.scala 46:16:@2437.4]
  wire  _T_421; // @[Mux.scala 46:19:@2438.4]
  wire  ie; // @[Mux.scala 46:16:@2439.4]
  wire  time_inter; // @[CSR.scala 173:27:@2440.4]
  wire  _T_424; // @[CSR.scala 177:10:@2442.4]
  wire  _T_427; // @[CSR.scala 179:10:@2444.4]
  wire  _T_429; // @[CSR.scala 180:10:@2446.4]
  wire  _T_432; // @[CSR.scala 182:22:@2449.4]
  wire  _T_435; // @[CSR.scala 184:22:@2451.4]
  wire  _T_437; // @[CSR.scala 185:22:@2453.4]
  wire [3:0] _T_438; // @[CSR.scala 186:8:@2454.4]
  wire [7:0] _T_442; // @[Cat.scala 30:58:@2458.4]
  wire [63:0] ipie; // @[CSR.scala 189:20:@2465.4]
  wire [63:0] _T_448; // @[CSR.scala 190:25:@2466.4]
  wire [63:0] ipie_m; // @[CSR.scala 190:23:@2467.4]
  wire [63:0] ipie_s; // @[CSR.scala 191:23:@2468.4]
  wire  _T_449; // @[CSR.scala 194:14:@2469.4]
  wire  _T_451; // @[CSR.scala 195:14:@2470.4]
  wire  _T_453; // @[CSR.scala 196:14:@2471.4]
  wire  _T_455; // @[CSR.scala 198:14:@2472.4]
  wire  _T_457; // @[CSR.scala 199:14:@2473.4]
  wire  _T_459; // @[CSR.scala 200:14:@2474.4]
  wire  _T_461; // @[CSR.scala 202:14:@2475.4]
  wire  _T_463; // @[CSR.scala 203:14:@2476.4]
  wire  _T_465; // @[CSR.scala 204:14:@2477.4]
  wire  _T_467; // @[CSR.scala 206:14:@2478.4]
  wire  _T_469; // @[CSR.scala 207:14:@2479.4]
  wire  _T_471; // @[CSR.scala 208:14:@2480.4]
  wire  _T_473; // @[CSR.scala 210:14:@2481.4]
  wire  _T_475; // @[CSR.scala 211:14:@2482.4]
  wire  _T_477; // @[CSR.scala 212:14:@2483.4]
  wire  _T_479; // @[CSR.scala 214:14:@2484.4]
  wire  _T_481; // @[CSR.scala 215:14:@2485.4]
  wire [1:0] _T_489; // @[Mux.scala 31:69:@2489.4]
  wire [2:0] _T_490; // @[Mux.scala 31:69:@2490.4]
  wire [2:0] _T_491; // @[Mux.scala 31:69:@2491.4]
  wire [2:0] _T_492; // @[Mux.scala 31:69:@2492.4]
  wire [3:0] _T_493; // @[Mux.scala 31:69:@2493.4]
  wire [3:0] _T_494; // @[Mux.scala 31:69:@2494.4]
  wire [3:0] _T_495; // @[Mux.scala 31:69:@2495.4]
  wire [3:0] _T_496; // @[Mux.scala 31:69:@2496.4]
  wire [3:0] _T_497; // @[Mux.scala 31:69:@2497.4]
  wire [3:0] _T_498; // @[Mux.scala 31:69:@2498.4]
  wire [3:0] _T_499; // @[Mux.scala 31:69:@2499.4]
  wire [3:0] _T_500; // @[Mux.scala 31:69:@2500.4]
  wire [3:0] _T_501; // @[Mux.scala 31:69:@2501.4]
  wire [3:0] _T_502; // @[Mux.scala 31:69:@2502.4]
  wire [3:0] _T_503; // @[Mux.scala 31:69:@2503.4]
  wire [3:0] ic; // @[Mux.scala 31:69:@2504.4]
  wire [63:0] _T_504; // @[CSR.scala 221:38:@2505.4]
  wire  _T_505; // @[CSR.scala 221:38:@2506.4]
  wire [1:0] inter_new_mode; // @[CSR.scala 221:29:@2507.4]
  wire  _T_506; // @[CSR.scala 222:42:@2508.4]
  wire  _T_507; // @[CSR.scala 222:69:@2509.4]
  wire  _T_508; // @[CSR.scala 222:78:@2510.4]
  wire  inter_enable; // @[CSR.scala 222:49:@2511.4]
  wire  _T_510; // @[CSR.scala 224:44:@2512.4]
  wire [31:0] _GEN_790; // @[CSR.scala 225:47:@2516.4]
  wire  have_excep; // @[CSR.scala 236:41:@2520.4]
  wire [29:0] _T_516; // @[Const.scala 68:33:@2524.6]
  wire  _T_519; // @[Const.scala 68:40:@2525.6]
  wire [1:0] _T_520; // @[Const.scala 69:32:@2527.8]
  wire  _T_521; // @[Conditional.scala 37:30:@2528.8]
  wire  _T_523; // @[Conditional.scala 37:30:@2537.10]
  wire  _T_526; // @[Conditional.scala 37:30:@2546.12]
  wire  _GEN_442; // @[Conditional.scala 39:67:@2547.12]
  wire  _GEN_443; // @[Conditional.scala 39:67:@2547.12]
  wire [1:0] _GEN_444; // @[Conditional.scala 39:67:@2547.12]
  wire [63:0] _GEN_445; // @[Conditional.scala 39:67:@2547.12]
  wire  _GEN_446; // @[Conditional.scala 39:67:@2538.10]
  wire  _GEN_447; // @[Conditional.scala 39:67:@2538.10]
  wire  _GEN_448; // @[Conditional.scala 39:67:@2538.10]
  wire [1:0] _GEN_449; // @[Conditional.scala 39:67:@2538.10]
  wire [63:0] _GEN_450; // @[Conditional.scala 39:67:@2538.10]
  wire  _GEN_451; // @[Conditional.scala 39:67:@2538.10]
  wire  _GEN_452; // @[Conditional.scala 39:67:@2538.10]
  wire  _GEN_453; // @[Conditional.scala 40:58:@2529.8]
  wire  _GEN_454; // @[Conditional.scala 40:58:@2529.8]
  wire [1:0] _GEN_455; // @[Conditional.scala 40:58:@2529.8]
  wire [1:0] _GEN_456; // @[Conditional.scala 40:58:@2529.8]
  wire [63:0] _GEN_457; // @[Conditional.scala 40:58:@2529.8]
  wire  _GEN_458; // @[Conditional.scala 40:58:@2529.8]
  wire  _GEN_459; // @[Conditional.scala 40:58:@2529.8]
  wire  _GEN_460; // @[Conditional.scala 40:58:@2529.8]
  wire  _GEN_461; // @[Conditional.scala 40:58:@2529.8]
  wire  _GEN_462; // @[Conditional.scala 40:58:@2529.8]
  wire  _T_528; // @[CSR.scala 266:31:@2555.8]
  wire  _T_529; // @[CSR.scala 266:67:@2556.8]
  wire  _T_530; // @[CSR.scala 266:51:@2557.8]
  wire  _T_531; // @[CSR.scala 272:18:@2561.10]
  wire  _T_533; // @[CSR.scala 272:12:@2562.10]
  wire [4:0] _T_534; // @[CSR.scala 272:40:@2563.10]
  wire [63:0] _T_535; // @[CSR.scala 272:34:@2564.10]
  wire  _T_536; // @[CSR.scala 272:34:@2565.10]
  wire  _T_538; // @[CSR.scala 272:26:@2566.10]
  wire  _T_539; // @[CSR.scala 272:23:@2567.10]
  wire [63:0] _T_542; // @[CSR.scala 273:34:@2570.10]
  wire  _T_543; // @[CSR.scala 273:34:@2571.10]
  wire  _T_545; // @[CSR.scala 273:26:@2572.10]
  wire  _T_546; // @[CSR.scala 273:23:@2573.10]
  wire [63:0] _T_551; // @[CSR.scala 274:34:@2577.10]
  wire  _T_552; // @[CSR.scala 274:34:@2578.10]
  wire  _T_554; // @[CSR.scala 274:26:@2579.10]
  wire  _T_555; // @[CSR.scala 274:23:@2580.10]
  wire [63:0] _T_558; // @[CSR.scala 275:34:@2583.10]
  wire  _T_559; // @[CSR.scala 275:34:@2584.10]
  wire  _T_561; // @[CSR.scala 275:26:@2585.10]
  wire  _T_562; // @[CSR.scala 275:23:@2586.10]
  wire [1:0] _T_564; // @[Mux.scala 31:69:@2587.10]
  wire [1:0] _T_565; // @[Mux.scala 31:69:@2588.10]
  wire [1:0] _T_566; // @[Mux.scala 31:69:@2589.10]
  wire [1:0] _T_567; // @[Mux.scala 31:69:@2590.10]
  wire [1:0] _GEN_502; // @[CSR.scala 266:88:@2558.8]
  wire [1:0] _GEN_527; // @[CSR.scala 243:32:@2526.6]
  wire [1:0] nextPrv; // @[CSR.scala 242:22:@2523.4]
  wire  _T_568; // @[Conditional.scala 37:30:@2592.10]
  wire  _T_570; // @[Conditional.scala 37:30:@2602.12]
  wire  _T_572; // @[Conditional.scala 37:30:@2612.14]
  wire  _GEN_463; // @[Conditional.scala 39:67:@2613.14]
  wire  _GEN_464; // @[Conditional.scala 39:67:@2613.14]
  wire  _GEN_469; // @[Conditional.scala 39:67:@2603.12]
  wire  _GEN_470; // @[Conditional.scala 39:67:@2603.12]
  wire [1:0] _GEN_471; // @[Conditional.scala 39:67:@2603.12]
  wire  _GEN_476; // @[Conditional.scala 39:67:@2603.12]
  wire  _GEN_477; // @[Conditional.scala 39:67:@2603.12]
  wire  _GEN_479; // @[Conditional.scala 39:67:@2603.12]
  wire  _GEN_482; // @[Conditional.scala 40:58:@2593.10]
  wire  _GEN_483; // @[Conditional.scala 40:58:@2593.10]
  wire [1:0] _GEN_484; // @[Conditional.scala 40:58:@2593.10]
  wire  _GEN_489; // @[Conditional.scala 40:58:@2593.10]
  wire  _GEN_490; // @[Conditional.scala 40:58:@2593.10]
  wire [1:0] _GEN_491; // @[Conditional.scala 40:58:@2593.10]
  wire  _GEN_493; // @[Conditional.scala 40:58:@2593.10]
  wire  _GEN_496; // @[Conditional.scala 40:58:@2593.10]
  wire  _GEN_497; // @[Conditional.scala 40:58:@2593.10]
  wire  _GEN_499; // @[Conditional.scala 40:58:@2593.10]
  wire [63:0] _T_576; // @[Mux.scala 46:16:@2621.10]
  wire [63:0] _T_578; // @[Mux.scala 46:16:@2623.10]
  wire [63:0] _T_580; // @[Mux.scala 46:16:@2625.10]
  wire [29:0] _T_581; // @[CSR.scala 310:29:@2626.10]
  wire [31:0] _T_583; // @[Cat.scala 30:58:@2627.10]
  wire [1:0] _T_584; // @[CSR.scala 311:33:@2628.10]
  wire  _T_586; // @[CSR.scala 311:39:@2629.10]
  wire [34:0] _T_588; // @[CSR.scala 313:22:@2630.10]
  wire [34:0] _GEN_791; // @[CSR.scala 313:16:@2631.10]
  wire [35:0] _T_589; // @[CSR.scala 313:16:@2631.10]
  wire [34:0] _T_590; // @[CSR.scala 313:16:@2632.10]
  wire [34:0] _T_591; // @[CSR.scala 311:27:@2633.10]
  wire  _GEN_503; // @[CSR.scala 266:88:@2558.8]
  wire  _GEN_504; // @[CSR.scala 266:88:@2558.8]
  wire [1:0] _GEN_505; // @[CSR.scala 266:88:@2558.8]
  wire  _GEN_507; // @[CSR.scala 266:88:@2558.8]
  wire  _GEN_510; // @[CSR.scala 266:88:@2558.8]
  wire  _GEN_511; // @[CSR.scala 266:88:@2558.8]
  wire [1:0] _GEN_512; // @[CSR.scala 266:88:@2558.8]
  wire  _GEN_514; // @[CSR.scala 266:88:@2558.8]
  wire  _GEN_517; // @[CSR.scala 266:88:@2558.8]
  wire  _GEN_518; // @[CSR.scala 266:88:@2558.8]
  wire  _GEN_520; // @[CSR.scala 266:88:@2558.8]
  wire [34:0] _GEN_523; // @[CSR.scala 266:88:@2558.8]
  wire  _GEN_524; // @[CSR.scala 243:32:@2526.6]
  wire  _GEN_525; // @[CSR.scala 243:32:@2526.6]
  wire [1:0] _GEN_526; // @[CSR.scala 243:32:@2526.6]
  wire [63:0] _GEN_528; // @[CSR.scala 243:32:@2526.6]
  wire  _GEN_529; // @[CSR.scala 243:32:@2526.6]
  wire  _GEN_530; // @[CSR.scala 243:32:@2526.6]
  wire [1:0] _GEN_531; // @[CSR.scala 243:32:@2526.6]
  wire  _GEN_532; // @[CSR.scala 243:32:@2526.6]
  wire  _GEN_533; // @[CSR.scala 243:32:@2526.6]
  wire  _GEN_535; // @[CSR.scala 243:32:@2526.6]
  wire  _GEN_539; // @[CSR.scala 243:32:@2526.6]
  wire  _GEN_543; // @[CSR.scala 243:32:@2526.6]
  wire  _GEN_546; // @[CSR.scala 242:22:@2523.4]
  wire  _GEN_547; // @[CSR.scala 242:22:@2523.4]
  wire [1:0] _GEN_548; // @[CSR.scala 242:22:@2523.4]
  wire  _GEN_551; // @[CSR.scala 242:22:@2523.4]
  wire  _GEN_552; // @[CSR.scala 242:22:@2523.4]
  wire [1:0] _GEN_553; // @[CSR.scala 242:22:@2523.4]
  wire  _GEN_554; // @[CSR.scala 242:22:@2523.4]
  wire  _GEN_555; // @[CSR.scala 242:22:@2523.4]
  assign csr__T_162_addr = io_id_addr[9:0];
  assign csr__T_162_data = csr[csr__T_162_addr]; // @[CSR.scala 25:16:@1936.4]
  assign csr__T_251_addr = 10'h304;
  assign csr__T_251_data = csr[csr__T_251_addr]; // @[CSR.scala 25:16:@1936.4]
  assign csr__T_252_addr = 10'h344;
  assign csr__T_252_data = csr[csr__T_252_addr]; // @[CSR.scala 25:16:@1936.4]
  assign csr__T_275_addr = 10'h180;
  assign csr__T_275_data = csr[csr__T_275_addr]; // @[CSR.scala 25:16:@1936.4]
  assign csr_mtvec_addr = 10'h305;
  assign csr_mtvec_data = csr[csr_mtvec_addr]; // @[CSR.scala 25:16:@1936.4]
  assign csr_stvec_addr = 10'h105;
  assign csr_stvec_data = csr[csr_stvec_addr]; // @[CSR.scala 25:16:@1936.4]
  assign csr_utvec_addr = 10'h5;
  assign csr_utvec_data = csr[csr_utvec_addr]; // @[CSR.scala 25:16:@1936.4]
  assign csr_medeleg_addr = 10'h302;
  assign csr_medeleg_data = csr[csr_medeleg_addr]; // @[CSR.scala 25:16:@1936.4]
  assign csr_mideleg_addr = 10'h303;
  assign csr_mideleg_data = csr[csr_mideleg_addr]; // @[CSR.scala 25:16:@1936.4]
  assign csr_sedeleg_addr = 10'h102;
  assign csr_sedeleg_data = csr[csr_sedeleg_addr]; // @[CSR.scala 25:16:@1936.4]
  assign csr_sideleg_addr = 10'h103;
  assign csr_sideleg_data = csr[csr_sideleg_addr]; // @[CSR.scala 25:16:@1936.4]
  assign csr_mie_addr = 10'h304;
  assign csr_mie_data = csr[csr_mie_addr]; // @[CSR.scala 25:16:@1936.4]
  assign csr_mip_addr = 10'h344;
  assign csr_mip_data = csr[csr_mip_addr]; // @[CSR.scala 25:16:@1936.4]
  assign csr_mtimecmp_addr = 10'h321;
  assign csr_mtimecmp_data = csr[csr_mtimecmp_addr]; // @[CSR.scala 25:16:@1936.4]
  assign csr_mepc_r_0_addr = 10'h341;
  assign csr_mepc_r_0_data = csr[csr_mepc_r_0_addr]; // @[CSR.scala 25:16:@1936.4]
  assign csr_sepc_r_0_addr = 10'h141;
  assign csr_sepc_r_0_data = csr[csr_sepc_r_0_addr]; // @[CSR.scala 25:16:@1936.4]
  assign csr_uepc_r_0_addr = 10'h41;
  assign csr_uepc_r_0_data = csr[csr_uepc_r_0_addr]; // @[CSR.scala 25:16:@1936.4]
  assign csr__T_278_data = io_mem_wrCSROp_csr_data;
  assign csr__T_278_addr = 10'h311;
  assign csr__T_278_mask = 1'h1;
  assign csr__T_278_en = io_mem_wrCSROp_valid ? _T_276 : 1'h0;
  assign csr__T_281_data = io_mem_wrCSROp_csr_data;
  assign csr__T_281_addr = 10'h312;
  assign csr__T_281_mask = 1'h1;
  assign csr__T_281_en = io_mem_wrCSROp_valid ? _T_279 : 1'h0;
  assign csr__T_284_data = io_mem_wrCSROp_csr_data;
  assign csr__T_284_addr = 10'h313;
  assign csr__T_284_mask = 1'h1;
  assign csr__T_284_en = io_mem_wrCSROp_valid ? _T_282 : 1'h0;
  assign csr__T_287_data = io_mem_wrCSROp_csr_data;
  assign csr__T_287_addr = 10'h314;
  assign csr__T_287_mask = 1'h1;
  assign csr__T_287_en = io_mem_wrCSROp_valid ? _T_285 : 1'h0;
  assign csr__T_289_data = io_mem_wrCSROp_csr_data;
  assign csr__T_289_addr = 10'h300;
  assign csr__T_289_mask = 1'h1;
  assign csr__T_289_en = io_mem_wrCSROp_valid ? _T_288 : 1'h0;
  assign csr__T_291_data = io_mem_wrCSROp_csr_data;
  assign csr__T_291_addr = 10'h301;
  assign csr__T_291_mask = 1'h1;
  assign csr__T_291_en = io_mem_wrCSROp_valid ? _T_290 : 1'h0;
  assign csr__T_293_data = io_mem_wrCSROp_csr_data;
  assign csr__T_293_addr = 10'h302;
  assign csr__T_293_mask = 1'h1;
  assign csr__T_293_en = io_mem_wrCSROp_valid ? _T_292 : 1'h0;
  assign csr__T_295_data = io_mem_wrCSROp_csr_data;
  assign csr__T_295_addr = 10'h303;
  assign csr__T_295_mask = 1'h1;
  assign csr__T_295_en = io_mem_wrCSROp_valid ? _T_294 : 1'h0;
  assign csr__T_297_data = io_mem_wrCSROp_csr_data;
  assign csr__T_297_addr = 10'h304;
  assign csr__T_297_mask = 1'h1;
  assign csr__T_297_en = io_mem_wrCSROp_valid ? _T_296 : 1'h0;
  assign csr__T_299_data = io_mem_wrCSROp_csr_data;
  assign csr__T_299_addr = 10'h305;
  assign csr__T_299_mask = 1'h1;
  assign csr__T_299_en = io_mem_wrCSROp_valid ? _T_298 : 1'h0;
  assign csr__T_301_data = io_mem_wrCSROp_csr_data;
  assign csr__T_301_addr = 10'h306;
  assign csr__T_301_mask = 1'h1;
  assign csr__T_301_en = io_mem_wrCSROp_valid ? _T_300 : 1'h0;
  assign csr__T_303_data = io_mem_wrCSROp_csr_data;
  assign csr__T_303_addr = 10'h340;
  assign csr__T_303_mask = 1'h1;
  assign csr__T_303_en = io_mem_wrCSROp_valid ? _T_302 : 1'h0;
  assign csr__T_305_data = io_mem_wrCSROp_csr_data;
  assign csr__T_305_addr = 10'h341;
  assign csr__T_305_mask = 1'h1;
  assign csr__T_305_en = io_mem_wrCSROp_valid ? _T_304 : 1'h0;
  assign csr__T_307_data = io_mem_wrCSROp_csr_data;
  assign csr__T_307_addr = 10'h342;
  assign csr__T_307_mask = 1'h1;
  assign csr__T_307_en = io_mem_wrCSROp_valid ? _T_306 : 1'h0;
  assign csr__T_309_data = io_mem_wrCSROp_csr_data;
  assign csr__T_309_addr = 10'h343;
  assign csr__T_309_mask = 1'h1;
  assign csr__T_309_en = io_mem_wrCSROp_valid ? _T_308 : 1'h0;
  assign csr__T_311_data = io_mem_wrCSROp_csr_data;
  assign csr__T_311_addr = 10'h344;
  assign csr__T_311_mask = 1'h1;
  assign csr__T_311_en = io_mem_wrCSROp_valid ? _T_310 : 1'h0;
  assign csr__T_313_data = io_mem_wrCSROp_csr_data;
  assign csr__T_313_addr = 10'h100;
  assign csr__T_313_mask = 1'h1;
  assign csr__T_313_en = io_mem_wrCSROp_valid ? _T_312 : 1'h0;
  assign csr__T_315_data = io_mem_wrCSROp_csr_data;
  assign csr__T_315_addr = 10'h102;
  assign csr__T_315_mask = 1'h1;
  assign csr__T_315_en = io_mem_wrCSROp_valid ? _T_314 : 1'h0;
  assign csr__T_317_data = io_mem_wrCSROp_csr_data;
  assign csr__T_317_addr = 10'h103;
  assign csr__T_317_mask = 1'h1;
  assign csr__T_317_en = io_mem_wrCSROp_valid ? _T_316 : 1'h0;
  assign csr__T_319_data = io_mem_wrCSROp_csr_data;
  assign csr__T_319_addr = 10'h104;
  assign csr__T_319_mask = 1'h1;
  assign csr__T_319_en = io_mem_wrCSROp_valid ? _T_318 : 1'h0;
  assign csr__T_321_data = io_mem_wrCSROp_csr_data;
  assign csr__T_321_addr = 10'h105;
  assign csr__T_321_mask = 1'h1;
  assign csr__T_321_en = io_mem_wrCSROp_valid ? _T_320 : 1'h0;
  assign csr__T_323_data = io_mem_wrCSROp_csr_data;
  assign csr__T_323_addr = 10'h106;
  assign csr__T_323_mask = 1'h1;
  assign csr__T_323_en = io_mem_wrCSROp_valid ? _T_322 : 1'h0;
  assign csr__T_325_data = io_mem_wrCSROp_csr_data;
  assign csr__T_325_addr = 10'h140;
  assign csr__T_325_mask = 1'h1;
  assign csr__T_325_en = io_mem_wrCSROp_valid ? _T_324 : 1'h0;
  assign csr__T_327_data = io_mem_wrCSROp_csr_data;
  assign csr__T_327_addr = 10'h141;
  assign csr__T_327_mask = 1'h1;
  assign csr__T_327_en = io_mem_wrCSROp_valid ? _T_326 : 1'h0;
  assign csr__T_329_data = io_mem_wrCSROp_csr_data;
  assign csr__T_329_addr = 10'h142;
  assign csr__T_329_mask = 1'h1;
  assign csr__T_329_en = io_mem_wrCSROp_valid ? _T_328 : 1'h0;
  assign csr__T_331_data = io_mem_wrCSROp_csr_data;
  assign csr__T_331_addr = 10'h143;
  assign csr__T_331_mask = 1'h1;
  assign csr__T_331_en = io_mem_wrCSROp_valid ? _T_330 : 1'h0;
  assign csr__T_333_data = io_mem_wrCSROp_csr_data;
  assign csr__T_333_addr = 10'h144;
  assign csr__T_333_mask = 1'h1;
  assign csr__T_333_en = io_mem_wrCSROp_valid ? _T_332 : 1'h0;
  assign csr__T_335_data = io_mem_wrCSROp_csr_data;
  assign csr__T_335_addr = 10'h180;
  assign csr__T_335_mask = 1'h1;
  assign csr__T_335_en = io_mem_wrCSROp_valid ? _T_334 : 1'h0;
  assign csr__T_337_data = io_mem_wrCSROp_csr_data;
  assign csr__T_337_addr = 10'h5;
  assign csr__T_337_mask = 1'h1;
  assign csr__T_337_en = io_mem_wrCSROp_valid ? _T_336 : 1'h0;
  assign csr__T_339_data = io_mem_wrCSROp_csr_data;
  assign csr__T_339_addr = 10'h40;
  assign csr__T_339_mask = 1'h1;
  assign csr__T_339_en = io_mem_wrCSROp_valid ? _T_338 : 1'h0;
  assign csr__T_341_data = io_mem_wrCSROp_csr_data;
  assign csr__T_341_addr = 10'h41;
  assign csr__T_341_mask = 1'h1;
  assign csr__T_341_en = io_mem_wrCSROp_valid ? _T_340 : 1'h0;
  assign csr__T_343_data = io_mem_wrCSROp_csr_data;
  assign csr__T_343_addr = 10'h42;
  assign csr__T_343_mask = 1'h1;
  assign csr__T_343_en = io_mem_wrCSROp_valid ? _T_342 : 1'h0;
  assign csr__T_345_data = io_mem_wrCSROp_csr_data;
  assign csr__T_345_addr = 10'h43;
  assign csr__T_345_mask = 1'h1;
  assign csr__T_345_en = io_mem_wrCSROp_valid ? _T_344 : 1'h0;
  assign csr__T_347_data = io_mem_wrCSROp_csr_data;
  assign csr__T_347_addr = 10'h44;
  assign csr__T_347_mask = 1'h1;
  assign csr__T_347_en = io_mem_wrCSROp_valid ? _T_346 : 1'h0;
  assign csr__T_349_data = io_mem_wrCSROp_csr_data;
  assign csr__T_349_addr = 10'h321;
  assign csr__T_349_mask = 1'h1;
  assign csr__T_349_en = io_mem_wrCSROp_valid ? _T_348 : 1'h0;
  assign csr__T_352_data = io_mem_wrCSROp_csr_data;
  assign csr__T_352_addr = 10'h1;
  assign csr__T_352_mask = 1'h1;
  assign csr__T_352_en = io_mem_wrCSROp_valid ? _T_350 : 1'h0;
  assign csr__T_355_data = io_mem_wrCSROp_csr_data;
  assign csr__T_355_addr = 10'h0;
  assign csr__T_355_mask = 1'h1;
  assign csr__T_355_en = io_mem_wrCSROp_valid ? _T_353 : 1'h0;
  assign csr_mcause_data = {{32'd0}, io_mem_excep_code};
  assign csr_mcause_addr = 10'h342;
  assign csr_mcause_mask = have_excep ? _GEN_535 : 1'h0;
  assign csr_mcause_en = 1'h1;
  assign csr_scause_data = {{32'd0}, io_mem_excep_code};
  assign csr_scause_addr = 10'h142;
  assign csr_scause_mask = have_excep ? _GEN_539 : 1'h0;
  assign csr_scause_en = 1'h1;
  assign csr_ucause_data = {{32'd0}, io_mem_excep_code};
  assign csr_ucause_addr = 10'h42;
  assign csr_ucause_mask = have_excep ? _GEN_543 : 1'h0;
  assign csr_ucause_en = 1'h1;
  assign csr_mtval_data = {{32'd0}, io_mem_excep_value};
  assign csr_mtval_addr = 10'h343;
  assign csr_mtval_mask = have_excep ? _GEN_535 : 1'h0;
  assign csr_mtval_en = 1'h1;
  assign csr_stval_data = {{32'd0}, io_mem_excep_value};
  assign csr_stval_addr = 10'h143;
  assign csr_stval_mask = have_excep ? _GEN_539 : 1'h0;
  assign csr_stval_en = 1'h1;
  assign csr_utval_data = {{32'd0}, io_mem_excep_value};
  assign csr_utval_addr = 10'h43;
  assign csr_utval_mask = have_excep ? _GEN_543 : 1'h0;
  assign csr_utval_en = 1'h1;
  assign csr__T_422_data = {56'h0,_T_442};
  assign csr__T_422_addr = 10'h344;
  assign csr__T_422_mask = 1'h1;
  assign csr__T_422_en = 1'h1;
  assign csr_mepc_w_0_data = io_mem_excep_pc;
  assign csr_mepc_w_0_addr = 10'h341;
  assign csr_mepc_w_0_mask = have_excep ? _GEN_535 : 1'h0;
  assign csr_mepc_w_0_en = have_excep ? _GEN_535 : 1'h0;
  assign csr_sepc_w_0_data = io_mem_excep_pc;
  assign csr_sepc_w_0_addr = 10'h141;
  assign csr_sepc_w_0_mask = have_excep ? _GEN_539 : 1'h0;
  assign csr_sepc_w_0_en = have_excep ? _GEN_539 : 1'h0;
  assign csr_uepc_w_0_data = io_mem_excep_pc;
  assign csr_uepc_w_0_addr = 10'h41;
  assign csr_uepc_w_0_mask = have_excep ? _GEN_543 : 1'h0;
  assign csr_uepc_w_0_en = have_excep ? _GEN_543 : 1'h0;
  assign _T_159 = mtime + 64'h1; // @[CSR.scala 104:18:@1990.4]
  assign _T_160 = mtime + 64'h1; // @[CSR.scala 104:18:@1991.4]
  assign _T_209 = {mstatus_SPIE,mstatus_UPIE,mstatus_MIE,mstatus_old_HIE,mstatus_SIE,mstatus_UIE}; // @[CSR.scala 112:29:@1999.4]
  assign _T_215 = {mstatus_FS,mstatus_MPP,mstatus_old_HPP,mstatus_SPP,mstatus_MPIE,mstatus_old_HPIE,_T_209}; // @[CSR.scala 112:29:@2005.4]
  assign _T_220 = {mstatus_TW,mstatus_TVM,mstatus_MXR,mstatus_SUM,mstatus_MPriv,mstatus_XS}; // @[CSR.scala 112:29:@2010.4]
  assign _T_227 = {mstatus_SD,mstatus_zero1,mstatus_SXL,mstatus_UXL,mstatus_TSR,mstatus_zero2,_T_220,_T_215}; // @[CSR.scala 112:29:@2017.4]
  assign _T_253 = 12'hc00 == io_id_addr; // @[Mux.scala 46:19:@2043.4]
  assign _T_254 = _T_253 ? mtime : csr__T_162_data; // @[Mux.scala 46:16:@2044.4]
  assign _T_255 = 12'hc01 == io_id_addr; // @[Mux.scala 46:19:@2045.4]
  assign _T_256 = _T_255 ? mtime : _T_254; // @[Mux.scala 46:16:@2046.4]
  assign _T_257 = 12'h144 == io_id_addr; // @[Mux.scala 46:19:@2047.4]
  assign _T_258 = _T_257 ? csr__T_252_data : _T_256; // @[Mux.scala 46:16:@2048.4]
  assign _T_259 = 12'h104 == io_id_addr; // @[Mux.scala 46:19:@2049.4]
  assign _T_260 = _T_259 ? csr__T_251_data : _T_258; // @[Mux.scala 46:16:@2050.4]
  assign _T_261 = 12'h100 == io_id_addr; // @[Mux.scala 46:19:@2051.4]
  assign _T_262 = _T_261 ? _T_227 : _T_260; // @[Mux.scala 46:16:@2052.4]
  assign _T_263 = 12'h300 == io_id_addr; // @[Mux.scala 46:19:@2053.4]
  assign _T_264 = _T_263 ? _T_227 : _T_262; // @[Mux.scala 46:16:@2054.4]
  assign _T_265 = 12'h301 == io_id_addr; // @[Mux.scala 46:19:@2055.4]
  assign _T_266 = _T_265 ? 64'h0 : _T_264; // @[Mux.scala 46:16:@2056.4]
  assign _T_267 = 12'hf14 == io_id_addr; // @[Mux.scala 46:19:@2057.4]
  assign _T_268 = _T_267 ? 64'h0 : _T_266; // @[Mux.scala 46:16:@2058.4]
  assign _T_269 = 12'hf13 == io_id_addr; // @[Mux.scala 46:19:@2059.4]
  assign _T_270 = _T_269 ? 64'h91d : _T_268; // @[Mux.scala 46:16:@2060.4]
  assign _T_271 = 12'hf12 == io_id_addr; // @[Mux.scala 46:19:@2061.4]
  assign _T_272 = _T_271 ? 64'h8fffffff : _T_270; // @[Mux.scala 46:16:@2062.4]
  assign _T_273 = 12'hf11 == io_id_addr; // @[Mux.scala 46:19:@2063.4]
  assign _T_276 = 12'hf11 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2073.6]
  assign _T_279 = 12'hf12 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2078.6]
  assign _T_282 = 12'hf13 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2083.6]
  assign _T_285 = 12'hf14 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2088.6]
  assign _T_288 = 12'h300 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2093.6]
  assign _T_290 = 12'h301 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2098.6]
  assign _T_292 = 12'h302 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2103.6]
  assign _T_294 = 12'h303 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2108.6]
  assign _T_296 = 12'h304 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2113.6]
  assign _T_298 = 12'h305 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2118.6]
  assign _T_300 = 12'h306 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2123.6]
  assign _T_302 = 12'h340 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2128.6]
  assign _T_304 = 12'h341 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2133.6]
  assign _T_306 = 12'h342 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2138.6]
  assign _T_308 = 12'h343 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2143.6]
  assign _T_310 = 12'h344 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2148.6]
  assign _T_312 = 12'h100 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2153.6]
  assign _T_314 = 12'h102 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2158.6]
  assign _T_316 = 12'h103 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2163.6]
  assign _T_318 = 12'h104 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2168.6]
  assign _T_320 = 12'h105 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2173.6]
  assign _T_322 = 12'h106 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2178.6]
  assign _T_324 = 12'h140 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2183.6]
  assign _T_326 = 12'h141 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2188.6]
  assign _T_328 = 12'h142 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2193.6]
  assign _T_330 = 12'h143 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2198.6]
  assign _T_332 = 12'h144 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2203.6]
  assign _T_334 = 12'h180 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2208.6]
  assign _T_336 = 12'h5 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2213.6]
  assign _T_338 = 12'h40 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2218.6]
  assign _T_340 = 12'h41 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2223.6]
  assign _T_342 = 12'h42 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2228.6]
  assign _T_344 = 12'h43 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2233.6]
  assign _T_346 = 12'h44 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2238.6]
  assign _T_348 = 12'h321 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2243.6]
  assign _T_350 = 12'hc01 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2248.6]
  assign _T_353 = 12'hc00 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2253.6]
  assign _T_356 = io_mem_wrCSROp_csr_idx == 12'h300; // @[CSR.scala 138:33:@2258.6]
  assign _T_362 = io_mem_wrCSROp_csr_data[0]; // @[CSR.scala 139:50:@2263.8]
  assign _T_363 = io_mem_wrCSROp_csr_data[1]; // @[CSR.scala 139:50:@2265.8]
  assign _T_364 = io_mem_wrCSROp_csr_data[2]; // @[CSR.scala 139:50:@2267.8]
  assign _T_365 = io_mem_wrCSROp_csr_data[3]; // @[CSR.scala 139:50:@2269.8]
  assign _T_366 = io_mem_wrCSROp_csr_data[4]; // @[CSR.scala 139:50:@2271.8]
  assign _T_367 = io_mem_wrCSROp_csr_data[5]; // @[CSR.scala 139:50:@2273.8]
  assign _T_368 = io_mem_wrCSROp_csr_data[6]; // @[CSR.scala 139:50:@2275.8]
  assign _T_369 = io_mem_wrCSROp_csr_data[7]; // @[CSR.scala 139:50:@2277.8]
  assign _T_370 = io_mem_wrCSROp_csr_data[8]; // @[CSR.scala 139:50:@2279.8]
  assign _T_371 = io_mem_wrCSROp_csr_data[10:9]; // @[CSR.scala 139:50:@2281.8]
  assign _T_372 = io_mem_wrCSROp_csr_data[12:11]; // @[CSR.scala 139:50:@2283.8]
  assign _T_373 = io_mem_wrCSROp_csr_data[14:13]; // @[CSR.scala 139:50:@2285.8]
  assign _T_374 = io_mem_wrCSROp_csr_data[16:15]; // @[CSR.scala 139:50:@2287.8]
  assign _T_375 = io_mem_wrCSROp_csr_data[17]; // @[CSR.scala 139:50:@2289.8]
  assign _T_376 = io_mem_wrCSROp_csr_data[18]; // @[CSR.scala 139:50:@2291.8]
  assign _T_377 = io_mem_wrCSROp_csr_data[19]; // @[CSR.scala 139:50:@2293.8]
  assign _T_378 = io_mem_wrCSROp_csr_data[20]; // @[CSR.scala 139:50:@2295.8]
  assign _T_379 = io_mem_wrCSROp_csr_data[21]; // @[CSR.scala 139:50:@2297.8]
  assign _T_380 = io_mem_wrCSROp_csr_data[30:22]; // @[CSR.scala 139:50:@2299.8]
  assign _T_381 = io_mem_wrCSROp_csr_data[31]; // @[CSR.scala 139:50:@2301.8]
  assign _T_382 = io_mem_wrCSROp_csr_data[33:32]; // @[CSR.scala 139:50:@2303.8]
  assign _T_383 = io_mem_wrCSROp_csr_data[35:34]; // @[CSR.scala 139:50:@2305.8]
  assign _T_384 = io_mem_wrCSROp_csr_data[62:36]; // @[CSR.scala 139:50:@2307.8]
  assign _T_385 = io_mem_wrCSROp_csr_data[63]; // @[CSR.scala 139:50:@2309.8]
  assign _GEN_185 = _T_356 ? _T_362 : mstatus_UIE; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_186 = _T_356 ? _T_363 : mstatus_SIE; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_187 = _T_356 ? _T_364 : mstatus_old_HIE; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_188 = _T_356 ? _T_365 : mstatus_MIE; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_189 = _T_356 ? _T_366 : mstatus_UPIE; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_190 = _T_356 ? _T_367 : mstatus_SPIE; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_191 = _T_356 ? _T_368 : mstatus_old_HPIE; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_192 = _T_356 ? _T_369 : mstatus_MPIE; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_193 = _T_356 ? _T_370 : mstatus_SPP; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_194 = _T_356 ? _T_371 : mstatus_old_HPP; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_195 = _T_356 ? _T_372 : mstatus_MPP; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_196 = _T_356 ? _T_373 : mstatus_FS; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_197 = _T_356 ? _T_374 : mstatus_XS; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_198 = _T_356 ? _T_375 : mstatus_MPriv; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_199 = _T_356 ? _T_376 : mstatus_SUM; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_200 = _T_356 ? _T_377 : mstatus_MXR; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_201 = _T_356 ? _T_378 : mstatus_TVM; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_202 = _T_356 ? _T_379 : mstatus_TW; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_203 = _T_356 ? _T_380 : mstatus_zero2; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_204 = _T_356 ? _T_381 : mstatus_TSR; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_205 = _T_356 ? _T_382 : mstatus_UXL; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_206 = _T_356 ? _T_383 : mstatus_SXL; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_207 = _T_356 ? _T_384 : mstatus_zero1; // @[CSR.scala 138:51:@2259.6]
  assign _GEN_208 = _T_356 ? _T_385 : mstatus_SD; // @[CSR.scala 138:51:@2259.6]
  assign _T_386 = io_mem_wrCSROp_csr_idx == 12'h100; // @[CSR.scala 141:33:@2336.6]
  assign _GEN_209 = _T_386 ? _T_362 : _GEN_185; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_210 = _T_386 ? _T_363 : _GEN_186; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_211 = _T_386 ? _T_364 : _GEN_187; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_212 = _T_386 ? _T_365 : _GEN_188; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_213 = _T_386 ? _T_366 : _GEN_189; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_214 = _T_386 ? _T_367 : _GEN_190; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_215 = _T_386 ? _T_368 : _GEN_191; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_216 = _T_386 ? _T_369 : _GEN_192; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_217 = _T_386 ? _T_370 : _GEN_193; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_218 = _T_386 ? _T_371 : _GEN_194; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_219 = _T_386 ? _T_372 : _GEN_195; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_220 = _T_386 ? _T_373 : _GEN_196; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_221 = _T_386 ? _T_374 : _GEN_197; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_222 = _T_386 ? _T_375 : _GEN_198; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_223 = _T_386 ? _T_376 : _GEN_199; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_224 = _T_386 ? _T_377 : _GEN_200; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_225 = _T_386 ? _T_378 : _GEN_201; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_226 = _T_386 ? _T_379 : _GEN_202; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_227 = _T_386 ? _T_380 : _GEN_203; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_228 = _T_386 ? _T_381 : _GEN_204; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_229 = _T_386 ? _T_382 : _GEN_205; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_230 = _T_386 ? _T_383 : _GEN_206; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_231 = _T_386 ? _T_384 : _GEN_207; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_232 = _T_386 ? _T_385 : _GEN_208; // @[CSR.scala 141:51:@2337.6]
  assign _GEN_418 = io_mem_wrCSROp_valid ? _GEN_209 : mstatus_UIE; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_419 = io_mem_wrCSROp_valid ? _GEN_210 : mstatus_SIE; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_420 = io_mem_wrCSROp_valid ? _GEN_211 : mstatus_old_HIE; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_421 = io_mem_wrCSROp_valid ? _GEN_212 : mstatus_MIE; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_422 = io_mem_wrCSROp_valid ? _GEN_213 : mstatus_UPIE; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_423 = io_mem_wrCSROp_valid ? _GEN_214 : mstatus_SPIE; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_424 = io_mem_wrCSROp_valid ? _GEN_215 : mstatus_old_HPIE; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_425 = io_mem_wrCSROp_valid ? _GEN_216 : mstatus_MPIE; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_426 = io_mem_wrCSROp_valid ? _GEN_217 : mstatus_SPP; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_427 = io_mem_wrCSROp_valid ? _GEN_218 : mstatus_old_HPP; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_428 = io_mem_wrCSROp_valid ? _GEN_219 : mstatus_MPP; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_429 = io_mem_wrCSROp_valid ? _GEN_220 : mstatus_FS; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_430 = io_mem_wrCSROp_valid ? _GEN_221 : mstatus_XS; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_431 = io_mem_wrCSROp_valid ? _GEN_222 : mstatus_MPriv; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_432 = io_mem_wrCSROp_valid ? _GEN_223 : mstatus_SUM; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_433 = io_mem_wrCSROp_valid ? _GEN_224 : mstatus_MXR; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_434 = io_mem_wrCSROp_valid ? _GEN_225 : mstatus_TVM; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_435 = io_mem_wrCSROp_valid ? _GEN_226 : mstatus_TW; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_436 = io_mem_wrCSROp_valid ? _GEN_227 : mstatus_zero2; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_437 = io_mem_wrCSROp_valid ? _GEN_228 : mstatus_TSR; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_438 = io_mem_wrCSROp_valid ? _GEN_229 : mstatus_UXL; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_439 = io_mem_wrCSROp_valid ? _GEN_230 : mstatus_SXL; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_440 = io_mem_wrCSROp_valid ? _GEN_231 : mstatus_zero1; // @[CSR.scala 130:30:@2072.4]
  assign _GEN_441 = io_mem_wrCSROp_valid ? _GEN_232 : mstatus_SD; // @[CSR.scala 130:30:@2072.4]
  assign _T_417 = 2'h0 == prv; // @[Mux.scala 46:19:@2434.4]
  assign _T_418 = _T_417 ? mstatus_UIE : 1'h0; // @[Mux.scala 46:16:@2435.4]
  assign _T_419 = 2'h1 == prv; // @[Mux.scala 46:19:@2436.4]
  assign _T_420 = _T_419 ? mstatus_SIE : _T_418; // @[Mux.scala 46:16:@2437.4]
  assign _T_421 = 2'h3 == prv; // @[Mux.scala 46:19:@2438.4]
  assign ie = _T_421 ? mstatus_MIE : _T_420; // @[Mux.scala 46:16:@2439.4]
  assign time_inter = mtime >= csr_mtimecmp_data; // @[CSR.scala 173:27:@2440.4]
  assign _T_424 = prv == 2'h3; // @[CSR.scala 177:10:@2442.4]
  assign _T_427 = prv == 2'h1; // @[CSR.scala 179:10:@2444.4]
  assign _T_429 = prv == 2'h0; // @[CSR.scala 180:10:@2446.4]
  assign _T_432 = _T_424 & time_inter; // @[CSR.scala 182:22:@2449.4]
  assign _T_435 = _T_427 & time_inter; // @[CSR.scala 184:22:@2451.4]
  assign _T_437 = _T_429 & time_inter; // @[CSR.scala 185:22:@2453.4]
  assign _T_438 = csr_mip_data[3:0]; // @[CSR.scala 186:8:@2454.4]
  assign _T_442 = {_T_432,1'h0,_T_435,_T_437,_T_438}; // @[Cat.scala 30:58:@2458.4]
  assign ipie = csr_mip_data & csr_mie_data; // @[CSR.scala 189:20:@2465.4]
  assign _T_448 = ~ csr_mideleg_data; // @[CSR.scala 190:25:@2466.4]
  assign ipie_m = ipie & _T_448; // @[CSR.scala 190:23:@2467.4]
  assign ipie_s = ipie & csr_mideleg_data; // @[CSR.scala 191:23:@2468.4]
  assign _T_449 = ipie_m[11]; // @[CSR.scala 194:14:@2469.4]
  assign _T_451 = ipie_m[9]; // @[CSR.scala 195:14:@2470.4]
  assign _T_453 = ipie_m[8]; // @[CSR.scala 196:14:@2471.4]
  assign _T_455 = ipie_m[7]; // @[CSR.scala 198:14:@2472.4]
  assign _T_457 = ipie_m[5]; // @[CSR.scala 199:14:@2473.4]
  assign _T_459 = ipie_m[4]; // @[CSR.scala 200:14:@2474.4]
  assign _T_461 = ipie_m[3]; // @[CSR.scala 202:14:@2475.4]
  assign _T_463 = ipie_m[1]; // @[CSR.scala 203:14:@2476.4]
  assign _T_465 = ipie_m[0]; // @[CSR.scala 204:14:@2477.4]
  assign _T_467 = ipie_s[11]; // @[CSR.scala 206:14:@2478.4]
  assign _T_469 = ipie_s[9]; // @[CSR.scala 207:14:@2479.4]
  assign _T_471 = ipie_s[8]; // @[CSR.scala 208:14:@2480.4]
  assign _T_473 = ipie_s[7]; // @[CSR.scala 210:14:@2481.4]
  assign _T_475 = ipie_s[5]; // @[CSR.scala 211:14:@2482.4]
  assign _T_477 = ipie_s[4]; // @[CSR.scala 212:14:@2483.4]
  assign _T_479 = ipie_s[3]; // @[CSR.scala 214:14:@2484.4]
  assign _T_481 = ipie_s[1]; // @[CSR.scala 215:14:@2485.4]
  assign _T_489 = _T_479 ? 2'h3 : {{1'd0}, _T_481}; // @[Mux.scala 31:69:@2489.4]
  assign _T_490 = _T_477 ? 3'h4 : {{1'd0}, _T_489}; // @[Mux.scala 31:69:@2490.4]
  assign _T_491 = _T_475 ? 3'h5 : _T_490; // @[Mux.scala 31:69:@2491.4]
  assign _T_492 = _T_473 ? 3'h7 : _T_491; // @[Mux.scala 31:69:@2492.4]
  assign _T_493 = _T_471 ? 4'h8 : {{1'd0}, _T_492}; // @[Mux.scala 31:69:@2493.4]
  assign _T_494 = _T_469 ? 4'h9 : _T_493; // @[Mux.scala 31:69:@2494.4]
  assign _T_495 = _T_467 ? 4'hb : _T_494; // @[Mux.scala 31:69:@2495.4]
  assign _T_496 = _T_465 ? 4'h0 : _T_495; // @[Mux.scala 31:69:@2496.4]
  assign _T_497 = _T_463 ? 4'h1 : _T_496; // @[Mux.scala 31:69:@2497.4]
  assign _T_498 = _T_461 ? 4'h3 : _T_497; // @[Mux.scala 31:69:@2498.4]
  assign _T_499 = _T_459 ? 4'h4 : _T_498; // @[Mux.scala 31:69:@2499.4]
  assign _T_500 = _T_457 ? 4'h5 : _T_499; // @[Mux.scala 31:69:@2500.4]
  assign _T_501 = _T_455 ? 4'h7 : _T_500; // @[Mux.scala 31:69:@2501.4]
  assign _T_502 = _T_453 ? 4'h8 : _T_501; // @[Mux.scala 31:69:@2502.4]
  assign _T_503 = _T_451 ? 4'h9 : _T_502; // @[Mux.scala 31:69:@2503.4]
  assign ic = _T_449 ? 4'hb : _T_503; // @[Mux.scala 31:69:@2504.4]
  assign _T_504 = csr_mideleg_data >> ic; // @[CSR.scala 221:38:@2505.4]
  assign _T_505 = _T_504[0]; // @[CSR.scala 221:38:@2506.4]
  assign inter_new_mode = _T_505 ? 2'h1 : 2'h3; // @[CSR.scala 221:29:@2507.4]
  assign _T_506 = inter_new_mode > prv; // @[CSR.scala 222:42:@2508.4]
  assign _T_507 = inter_new_mode == prv; // @[CSR.scala 222:69:@2509.4]
  assign _T_508 = _T_507 & ie; // @[CSR.scala 222:78:@2510.4]
  assign inter_enable = _T_506 | _T_508; // @[CSR.scala 222:49:@2511.4]
  assign _T_510 = ipie != 64'h0; // @[CSR.scala 224:44:@2512.4]
  assign _GEN_790 = {{28'd0}, ic}; // @[CSR.scala 225:47:@2516.4]
  assign have_excep = io_mem_excep_valid & io_mem_excep_inst_valid; // @[CSR.scala 236:41:@2520.4]
  assign _T_516 = io_mem_excep_code[31:2]; // @[Const.scala 68:33:@2524.6]
  assign _T_519 = _T_516 == 30'h4; // @[Const.scala 68:40:@2525.6]
  assign _T_520 = io_mem_excep_code[1:0]; // @[Const.scala 69:32:@2527.8]
  assign _T_521 = 2'h3 == _T_520; // @[Conditional.scala 37:30:@2528.8]
  assign _T_523 = 2'h1 == _T_520; // @[Conditional.scala 37:30:@2537.10]
  assign _T_526 = 2'h0 == _T_520; // @[Conditional.scala 37:30:@2546.12]
  assign _GEN_442 = _T_526 ? mstatus_UPIE : _GEN_418; // @[Conditional.scala 39:67:@2547.12]
  assign _GEN_443 = _T_526 ? 1'h1 : _GEN_422; // @[Conditional.scala 39:67:@2547.12]
  assign _GEN_444 = _T_526 ? 2'h0 : prv; // @[Conditional.scala 39:67:@2547.12]
  assign _GEN_445 = _T_526 ? csr_uepc_r_0_data : 64'h0; // @[Conditional.scala 39:67:@2547.12]
  assign _GEN_446 = _T_523 ? mstatus_SPIE : _GEN_419; // @[Conditional.scala 39:67:@2538.10]
  assign _GEN_447 = _T_523 ? 1'h1 : _GEN_423; // @[Conditional.scala 39:67:@2538.10]
  assign _GEN_448 = _T_523 ? 1'h0 : _GEN_426; // @[Conditional.scala 39:67:@2538.10]
  assign _GEN_449 = _T_523 ? {{1'd0}, mstatus_SPP} : _GEN_444; // @[Conditional.scala 39:67:@2538.10]
  assign _GEN_450 = _T_523 ? csr_sepc_r_0_data : _GEN_445; // @[Conditional.scala 39:67:@2538.10]
  assign _GEN_451 = _T_523 ? _GEN_418 : _GEN_442; // @[Conditional.scala 39:67:@2538.10]
  assign _GEN_452 = _T_523 ? _GEN_422 : _GEN_443; // @[Conditional.scala 39:67:@2538.10]
  assign _GEN_453 = _T_521 ? mstatus_MPIE : _GEN_421; // @[Conditional.scala 40:58:@2529.8]
  assign _GEN_454 = _T_521 ? 1'h1 : _GEN_425; // @[Conditional.scala 40:58:@2529.8]
  assign _GEN_455 = _T_521 ? 2'h0 : _GEN_428; // @[Conditional.scala 40:58:@2529.8]
  assign _GEN_456 = _T_521 ? mstatus_MPP : _GEN_449; // @[Conditional.scala 40:58:@2529.8]
  assign _GEN_457 = _T_521 ? csr_mepc_r_0_data : _GEN_450; // @[Conditional.scala 40:58:@2529.8]
  assign _GEN_458 = _T_521 ? _GEN_419 : _GEN_446; // @[Conditional.scala 40:58:@2529.8]
  assign _GEN_459 = _T_521 ? _GEN_423 : _GEN_447; // @[Conditional.scala 40:58:@2529.8]
  assign _GEN_460 = _T_521 ? _GEN_426 : _GEN_448; // @[Conditional.scala 40:58:@2529.8]
  assign _GEN_461 = _T_521 ? _GEN_418 : _GEN_451; // @[Conditional.scala 40:58:@2529.8]
  assign _GEN_462 = _T_521 ? _GEN_422 : _GEN_452; // @[Conditional.scala 40:58:@2529.8]
  assign _T_528 = io_mem_excep_code == 32'h14; // @[CSR.scala 266:31:@2555.8]
  assign _T_529 = io_mem_excep_code == 32'h15; // @[CSR.scala 266:67:@2556.8]
  assign _T_530 = _T_528 | _T_529; // @[CSR.scala 266:51:@2557.8]
  assign _T_531 = io_mem_excep_code[31]; // @[CSR.scala 272:18:@2561.10]
  assign _T_533 = _T_531 == 1'h0; // @[CSR.scala 272:12:@2562.10]
  assign _T_534 = io_mem_excep_code[4:0]; // @[CSR.scala 272:40:@2563.10]
  assign _T_535 = csr_medeleg_data >> _T_534; // @[CSR.scala 272:34:@2564.10]
  assign _T_536 = _T_535[0]; // @[CSR.scala 272:34:@2565.10]
  assign _T_538 = _T_536 == 1'h0; // @[CSR.scala 272:26:@2566.10]
  assign _T_539 = _T_533 & _T_538; // @[CSR.scala 272:23:@2567.10]
  assign _T_542 = csr_mideleg_data >> _T_534; // @[CSR.scala 273:34:@2570.10]
  assign _T_543 = _T_542[0]; // @[CSR.scala 273:34:@2571.10]
  assign _T_545 = _T_543 == 1'h0; // @[CSR.scala 273:26:@2572.10]
  assign _T_546 = _T_531 & _T_545; // @[CSR.scala 273:23:@2573.10]
  assign _T_551 = csr_sedeleg_data >> _T_534; // @[CSR.scala 274:34:@2577.10]
  assign _T_552 = _T_551[0]; // @[CSR.scala 274:34:@2578.10]
  assign _T_554 = _T_552 == 1'h0; // @[CSR.scala 274:26:@2579.10]
  assign _T_555 = _T_533 & _T_554; // @[CSR.scala 274:23:@2580.10]
  assign _T_558 = csr_sideleg_data >> _T_534; // @[CSR.scala 275:34:@2583.10]
  assign _T_559 = _T_558[0]; // @[CSR.scala 275:34:@2584.10]
  assign _T_561 = _T_559 == 1'h0; // @[CSR.scala 275:26:@2585.10]
  assign _T_562 = _T_531 & _T_561; // @[CSR.scala 275:23:@2586.10]
  assign _T_564 = _T_562 ? 2'h1 : 2'h0; // @[Mux.scala 31:69:@2587.10]
  assign _T_565 = _T_555 ? 2'h1 : _T_564; // @[Mux.scala 31:69:@2588.10]
  assign _T_566 = _T_546 ? 2'h3 : _T_565; // @[Mux.scala 31:69:@2589.10]
  assign _T_567 = _T_539 ? 2'h3 : _T_566; // @[Mux.scala 31:69:@2590.10]
  assign _GEN_502 = _T_530 ? prv : _T_567; // @[CSR.scala 266:88:@2558.8]
  assign _GEN_527 = _T_519 ? _GEN_456 : _GEN_502; // @[CSR.scala 243:32:@2526.6]
  assign nextPrv = have_excep ? _GEN_527 : prv; // @[CSR.scala 242:22:@2523.4]
  assign _T_568 = 2'h3 == nextPrv; // @[Conditional.scala 37:30:@2592.10]
  assign _T_570 = 2'h1 == nextPrv; // @[Conditional.scala 37:30:@2602.12]
  assign _T_572 = 2'h0 == nextPrv; // @[Conditional.scala 37:30:@2612.14]
  assign _GEN_463 = _T_572 ? mstatus_UIE : _GEN_422; // @[Conditional.scala 39:67:@2613.14]
  assign _GEN_464 = _T_572 ? 1'h0 : _GEN_418; // @[Conditional.scala 39:67:@2613.14]
  assign _GEN_469 = _T_570 ? mstatus_SIE : _GEN_423; // @[Conditional.scala 39:67:@2603.12]
  assign _GEN_470 = _T_570 ? 1'h0 : _GEN_419; // @[Conditional.scala 39:67:@2603.12]
  assign _GEN_471 = _T_570 ? prv : {{1'd0}, _GEN_426}; // @[Conditional.scala 39:67:@2603.12]
  assign _GEN_476 = _T_570 ? _GEN_422 : _GEN_463; // @[Conditional.scala 39:67:@2603.12]
  assign _GEN_477 = _T_570 ? _GEN_418 : _GEN_464; // @[Conditional.scala 39:67:@2603.12]
  assign _GEN_479 = _T_570 ? 1'h0 : _T_572; // @[Conditional.scala 39:67:@2603.12]
  assign _GEN_482 = _T_568 ? mstatus_MIE : _GEN_425; // @[Conditional.scala 40:58:@2593.10]
  assign _GEN_483 = _T_568 ? 1'h0 : _GEN_421; // @[Conditional.scala 40:58:@2593.10]
  assign _GEN_484 = _T_568 ? prv : _GEN_428; // @[Conditional.scala 40:58:@2593.10]
  assign _GEN_489 = _T_568 ? _GEN_423 : _GEN_469; // @[Conditional.scala 40:58:@2593.10]
  assign _GEN_490 = _T_568 ? _GEN_419 : _GEN_470; // @[Conditional.scala 40:58:@2593.10]
  assign _GEN_491 = _T_568 ? {{1'd0}, _GEN_426} : _GEN_471; // @[Conditional.scala 40:58:@2593.10]
  assign _GEN_493 = _T_568 ? 1'h0 : _T_570; // @[Conditional.scala 40:58:@2593.10]
  assign _GEN_496 = _T_568 ? _GEN_422 : _GEN_476; // @[Conditional.scala 40:58:@2593.10]
  assign _GEN_497 = _T_568 ? _GEN_418 : _GEN_477; // @[Conditional.scala 40:58:@2593.10]
  assign _GEN_499 = _T_568 ? 1'h0 : _GEN_479; // @[Conditional.scala 40:58:@2593.10]
  assign _T_576 = _T_572 ? csr_utvec_data : 64'h0; // @[Mux.scala 46:16:@2621.10]
  assign _T_578 = _T_570 ? csr_stvec_data : _T_576; // @[Mux.scala 46:16:@2623.10]
  assign _T_580 = _T_568 ? csr_mtvec_data : _T_578; // @[Mux.scala 46:16:@2625.10]
  assign _T_581 = _T_580[31:2]; // @[CSR.scala 310:29:@2626.10]
  assign _T_583 = {_T_581,2'h0}; // @[Cat.scala 30:58:@2627.10]
  assign _T_584 = _T_580[1:0]; // @[CSR.scala 311:33:@2628.10]
  assign _T_586 = _T_584 == 2'h0; // @[CSR.scala 311:39:@2629.10]
  assign _T_588 = 32'h4 * io_mem_excep_code; // @[CSR.scala 313:22:@2630.10]
  assign _GEN_791 = {{3'd0}, _T_583}; // @[CSR.scala 313:16:@2631.10]
  assign _T_589 = _GEN_791 + _T_588; // @[CSR.scala 313:16:@2631.10]
  assign _T_590 = _GEN_791 + _T_588; // @[CSR.scala 313:16:@2632.10]
  assign _T_591 = _T_586 ? {{3'd0}, _T_583} : _T_590; // @[CSR.scala 311:27:@2633.10]
  assign _GEN_503 = _T_530 ? _GEN_425 : _GEN_482; // @[CSR.scala 266:88:@2558.8]
  assign _GEN_504 = _T_530 ? _GEN_421 : _GEN_483; // @[CSR.scala 266:88:@2558.8]
  assign _GEN_505 = _T_530 ? _GEN_428 : _GEN_484; // @[CSR.scala 266:88:@2558.8]
  assign _GEN_507 = _T_530 ? 1'h0 : _T_568; // @[CSR.scala 266:88:@2558.8]
  assign _GEN_510 = _T_530 ? _GEN_423 : _GEN_489; // @[CSR.scala 266:88:@2558.8]
  assign _GEN_511 = _T_530 ? _GEN_419 : _GEN_490; // @[CSR.scala 266:88:@2558.8]
  assign _GEN_512 = _T_530 ? {{1'd0}, _GEN_426} : _GEN_491; // @[CSR.scala 266:88:@2558.8]
  assign _GEN_514 = _T_530 ? 1'h0 : _GEN_493; // @[CSR.scala 266:88:@2558.8]
  assign _GEN_517 = _T_530 ? _GEN_422 : _GEN_496; // @[CSR.scala 266:88:@2558.8]
  assign _GEN_518 = _T_530 ? _GEN_418 : _GEN_497; // @[CSR.scala 266:88:@2558.8]
  assign _GEN_520 = _T_530 ? 1'h0 : _GEN_499; // @[CSR.scala 266:88:@2558.8]
  assign _GEN_523 = _T_530 ? 35'h0 : _T_591; // @[CSR.scala 266:88:@2558.8]
  assign _GEN_524 = _T_519 ? _GEN_453 : _GEN_504; // @[CSR.scala 243:32:@2526.6]
  assign _GEN_525 = _T_519 ? _GEN_454 : _GEN_503; // @[CSR.scala 243:32:@2526.6]
  assign _GEN_526 = _T_519 ? _GEN_455 : _GEN_505; // @[CSR.scala 243:32:@2526.6]
  assign _GEN_528 = _T_519 ? _GEN_457 : {{29'd0}, _GEN_523}; // @[CSR.scala 243:32:@2526.6]
  assign _GEN_529 = _T_519 ? _GEN_458 : _GEN_511; // @[CSR.scala 243:32:@2526.6]
  assign _GEN_530 = _T_519 ? _GEN_459 : _GEN_510; // @[CSR.scala 243:32:@2526.6]
  assign _GEN_531 = _T_519 ? {{1'd0}, _GEN_460} : _GEN_512; // @[CSR.scala 243:32:@2526.6]
  assign _GEN_532 = _T_519 ? _GEN_461 : _GEN_518; // @[CSR.scala 243:32:@2526.6]
  assign _GEN_533 = _T_519 ? _GEN_462 : _GEN_517; // @[CSR.scala 243:32:@2526.6]
  assign _GEN_535 = _T_519 ? 1'h0 : _GEN_507; // @[CSR.scala 243:32:@2526.6]
  assign _GEN_539 = _T_519 ? 1'h0 : _GEN_514; // @[CSR.scala 243:32:@2526.6]
  assign _GEN_543 = _T_519 ? 1'h0 : _GEN_520; // @[CSR.scala 243:32:@2526.6]
  assign _GEN_546 = have_excep ? _GEN_524 : _GEN_421; // @[CSR.scala 242:22:@2523.4]
  assign _GEN_547 = have_excep ? _GEN_525 : _GEN_425; // @[CSR.scala 242:22:@2523.4]
  assign _GEN_548 = have_excep ? _GEN_526 : _GEN_428; // @[CSR.scala 242:22:@2523.4]
  assign _GEN_551 = have_excep ? _GEN_529 : _GEN_419; // @[CSR.scala 242:22:@2523.4]
  assign _GEN_552 = have_excep ? _GEN_530 : _GEN_423; // @[CSR.scala 242:22:@2523.4]
  assign _GEN_553 = have_excep ? _GEN_531 : {{1'd0}, _GEN_426}; // @[CSR.scala 242:22:@2523.4]
  assign _GEN_554 = have_excep ? _GEN_532 : _GEN_418; // @[CSR.scala 242:22:@2523.4]
  assign _GEN_555 = have_excep ? _GEN_533 : _GEN_422; // @[CSR.scala 242:22:@2523.4]
  assign io_id_rdata = _T_273 ? 64'h91d : _T_272; // @[CSR.scala 106:15:@2065.4]
  assign io_id_priv = prv; // @[CSR.scala 119:14:@2066.4]
  assign io_mmu_priv = prv; // @[CSR.scala 122:15:@2069.4]
  assign io_mmu_mxr = mstatus_MXR; // @[CSR.scala 124:15:@2071.4]
  assign io_mmu_sum = mstatus_SUM; // @[CSR.scala 123:15:@2070.4]
  assign io_flush = io_mem_excep_valid & io_mem_excep_inst_valid; // @[CSR.scala 239:14:@2521.4]
  assign io_csrNewPc = have_excep ? _GEN_528 : 64'h0; // @[CSR.scala 240:17:@2522.4 CSR.scala 250:25:@2534.10 CSR.scala 257:25:@2543.12 CSR.scala 263:25:@2551.14 CSR.scala 311:21:@2634.10]
  assign io_inter_valid = inter_enable & _T_510; // @[CSR.scala 224:20:@2514.4]
  assign io_inter_bits = 32'h80000000 | _GEN_790; // @[CSR.scala 225:20:@2517.4]
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
    if(csr__T_278_en & csr__T_278_mask) begin
      csr[csr__T_278_addr] <= csr__T_278_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_281_en & csr__T_281_mask) begin
      csr[csr__T_281_addr] <= csr__T_281_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_284_en & csr__T_284_mask) begin
      csr[csr__T_284_addr] <= csr__T_284_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_287_en & csr__T_287_mask) begin
      csr[csr__T_287_addr] <= csr__T_287_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_289_en & csr__T_289_mask) begin
      csr[csr__T_289_addr] <= csr__T_289_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_291_en & csr__T_291_mask) begin
      csr[csr__T_291_addr] <= csr__T_291_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_293_en & csr__T_293_mask) begin
      csr[csr__T_293_addr] <= csr__T_293_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_295_en & csr__T_295_mask) begin
      csr[csr__T_295_addr] <= csr__T_295_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_297_en & csr__T_297_mask) begin
      csr[csr__T_297_addr] <= csr__T_297_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_299_en & csr__T_299_mask) begin
      csr[csr__T_299_addr] <= csr__T_299_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_301_en & csr__T_301_mask) begin
      csr[csr__T_301_addr] <= csr__T_301_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_303_en & csr__T_303_mask) begin
      csr[csr__T_303_addr] <= csr__T_303_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_305_en & csr__T_305_mask) begin
      csr[csr__T_305_addr] <= csr__T_305_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_307_en & csr__T_307_mask) begin
      csr[csr__T_307_addr] <= csr__T_307_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_309_en & csr__T_309_mask) begin
      csr[csr__T_309_addr] <= csr__T_309_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_311_en & csr__T_311_mask) begin
      csr[csr__T_311_addr] <= csr__T_311_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_313_en & csr__T_313_mask) begin
      csr[csr__T_313_addr] <= csr__T_313_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_315_en & csr__T_315_mask) begin
      csr[csr__T_315_addr] <= csr__T_315_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_317_en & csr__T_317_mask) begin
      csr[csr__T_317_addr] <= csr__T_317_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_319_en & csr__T_319_mask) begin
      csr[csr__T_319_addr] <= csr__T_319_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_321_en & csr__T_321_mask) begin
      csr[csr__T_321_addr] <= csr__T_321_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_323_en & csr__T_323_mask) begin
      csr[csr__T_323_addr] <= csr__T_323_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_325_en & csr__T_325_mask) begin
      csr[csr__T_325_addr] <= csr__T_325_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_327_en & csr__T_327_mask) begin
      csr[csr__T_327_addr] <= csr__T_327_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_329_en & csr__T_329_mask) begin
      csr[csr__T_329_addr] <= csr__T_329_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_331_en & csr__T_331_mask) begin
      csr[csr__T_331_addr] <= csr__T_331_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_333_en & csr__T_333_mask) begin
      csr[csr__T_333_addr] <= csr__T_333_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_335_en & csr__T_335_mask) begin
      csr[csr__T_335_addr] <= csr__T_335_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_337_en & csr__T_337_mask) begin
      csr[csr__T_337_addr] <= csr__T_337_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_339_en & csr__T_339_mask) begin
      csr[csr__T_339_addr] <= csr__T_339_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_341_en & csr__T_341_mask) begin
      csr[csr__T_341_addr] <= csr__T_341_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_343_en & csr__T_343_mask) begin
      csr[csr__T_343_addr] <= csr__T_343_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_345_en & csr__T_345_mask) begin
      csr[csr__T_345_addr] <= csr__T_345_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_347_en & csr__T_347_mask) begin
      csr[csr__T_347_addr] <= csr__T_347_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_349_en & csr__T_349_mask) begin
      csr[csr__T_349_addr] <= csr__T_349_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_352_en & csr__T_352_mask) begin
      csr[csr__T_352_addr] <= csr__T_352_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_355_en & csr__T_355_mask) begin
      csr[csr__T_355_addr] <= csr__T_355_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr_mcause_en & csr_mcause_mask) begin
      csr[csr_mcause_addr] <= csr_mcause_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr_scause_en & csr_scause_mask) begin
      csr[csr_scause_addr] <= csr_scause_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr_ucause_en & csr_ucause_mask) begin
      csr[csr_ucause_addr] <= csr_ucause_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr_mtval_en & csr_mtval_mask) begin
      csr[csr_mtval_addr] <= csr_mtval_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr_stval_en & csr_stval_mask) begin
      csr[csr_stval_addr] <= csr_stval_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr_utval_en & csr_utval_mask) begin
      csr[csr_utval_addr] <= csr_utval_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr__T_422_en & csr__T_422_mask) begin
      csr[csr__T_422_addr] <= csr__T_422_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr_mepc_w_0_en & csr_mepc_w_0_mask) begin
      csr[csr_mepc_w_0_addr] <= csr_mepc_w_0_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr_sepc_w_0_en & csr_sepc_w_0_mask) begin
      csr[csr_sepc_w_0_addr] <= csr_sepc_w_0_data; // @[CSR.scala 25:16:@1936.4]
    end
    if(csr_uepc_w_0_en & csr_uepc_w_0_mask) begin
      csr[csr_uepc_w_0_addr] <= csr_uepc_w_0_data; // @[CSR.scala 25:16:@1936.4]
    end
    if (reset) begin
      prv <= 2'h3;
    end else begin
      if (have_excep) begin
        if (_T_519) begin
          if (_T_521) begin
            prv <= mstatus_MPP;
          end else begin
            if (_T_523) begin
              prv <= {{1'd0}, mstatus_SPP};
            end else begin
              if (_T_526) begin
                prv <= 2'h0;
              end
            end
          end
        end else begin
          if (!(_T_530)) begin
            if (_T_539) begin
              prv <= 2'h3;
            end else begin
              if (_T_546) begin
                prv <= 2'h3;
              end else begin
                if (_T_555) begin
                  prv <= 2'h1;
                end else begin
                  if (_T_562) begin
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
        if (_T_386) begin
          mstatus_SD <= _T_385;
        end else begin
          if (_T_356) begin
            mstatus_SD <= _T_385;
          end
        end
      end
    end
    if (reset) begin
      mstatus_zero1 <= 27'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_386) begin
          mstatus_zero1 <= _T_384;
        end else begin
          if (_T_356) begin
            mstatus_zero1 <= _T_384;
          end
        end
      end
    end
    if (reset) begin
      mstatus_SXL <= 2'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_386) begin
          mstatus_SXL <= _T_383;
        end else begin
          if (_T_356) begin
            mstatus_SXL <= _T_383;
          end
        end
      end
    end
    if (reset) begin
      mstatus_UXL <= 2'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_386) begin
          mstatus_UXL <= _T_382;
        end else begin
          if (_T_356) begin
            mstatus_UXL <= _T_382;
          end
        end
      end
    end
    if (reset) begin
      mstatus_TSR <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_386) begin
          mstatus_TSR <= _T_381;
        end else begin
          if (_T_356) begin
            mstatus_TSR <= _T_381;
          end
        end
      end
    end
    if (reset) begin
      mstatus_zero2 <= 9'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_386) begin
          mstatus_zero2 <= _T_380;
        end else begin
          if (_T_356) begin
            mstatus_zero2 <= _T_380;
          end
        end
      end
    end
    if (reset) begin
      mstatus_TW <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_386) begin
          mstatus_TW <= _T_379;
        end else begin
          if (_T_356) begin
            mstatus_TW <= _T_379;
          end
        end
      end
    end
    if (reset) begin
      mstatus_TVM <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_386) begin
          mstatus_TVM <= _T_378;
        end else begin
          if (_T_356) begin
            mstatus_TVM <= _T_378;
          end
        end
      end
    end
    if (reset) begin
      mstatus_MXR <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_386) begin
          mstatus_MXR <= _T_377;
        end else begin
          if (_T_356) begin
            mstatus_MXR <= _T_377;
          end
        end
      end
    end
    if (reset) begin
      mstatus_SUM <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_386) begin
          mstatus_SUM <= _T_376;
        end else begin
          if (_T_356) begin
            mstatus_SUM <= _T_376;
          end
        end
      end
    end
    if (reset) begin
      mstatus_MPriv <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_386) begin
          mstatus_MPriv <= _T_375;
        end else begin
          if (_T_356) begin
            mstatus_MPriv <= _T_375;
          end
        end
      end
    end
    if (reset) begin
      mstatus_XS <= 2'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_386) begin
          mstatus_XS <= _T_374;
        end else begin
          if (_T_356) begin
            mstatus_XS <= _T_374;
          end
        end
      end
    end
    if (reset) begin
      mstatus_FS <= 2'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_386) begin
          mstatus_FS <= _T_373;
        end else begin
          if (_T_356) begin
            mstatus_FS <= _T_373;
          end
        end
      end
    end
    if (reset) begin
      mstatus_MPP <= 2'h0;
    end else begin
      if (have_excep) begin
        if (_T_519) begin
          if (_T_521) begin
            mstatus_MPP <= 2'h0;
          end else begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_386) begin
                mstatus_MPP <= _T_372;
              end else begin
                if (_T_356) begin
                  mstatus_MPP <= _T_372;
                end
              end
            end
          end
        end else begin
          if (_T_530) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_386) begin
                mstatus_MPP <= _T_372;
              end else begin
                if (_T_356) begin
                  mstatus_MPP <= _T_372;
                end
              end
            end
          end else begin
            if (_T_568) begin
              mstatus_MPP <= prv;
            end else begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_386) begin
                  mstatus_MPP <= _T_372;
                end else begin
                  if (_T_356) begin
                    mstatus_MPP <= _T_372;
                  end
                end
              end
            end
          end
        end
      end else begin
        if (io_mem_wrCSROp_valid) begin
          if (_T_386) begin
            mstatus_MPP <= _T_372;
          end else begin
            if (_T_356) begin
              mstatus_MPP <= _T_372;
            end
          end
        end
      end
    end
    if (reset) begin
      mstatus_old_HPP <= 2'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_386) begin
          mstatus_old_HPP <= _T_371;
        end else begin
          if (_T_356) begin
            mstatus_old_HPP <= _T_371;
          end
        end
      end
    end
    if (reset) begin
      mstatus_SPP <= 1'h0;
    end else begin
      mstatus_SPP <= _GEN_553[0];
    end
    if (reset) begin
      mstatus_MPIE <= 1'h0;
    end else begin
      if (have_excep) begin
        if (_T_519) begin
          if (_T_521) begin
            mstatus_MPIE <= 1'h1;
          end else begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_386) begin
                mstatus_MPIE <= _T_369;
              end else begin
                if (_T_356) begin
                  mstatus_MPIE <= _T_369;
                end
              end
            end
          end
        end else begin
          if (_T_530) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_386) begin
                mstatus_MPIE <= _T_369;
              end else begin
                if (_T_356) begin
                  mstatus_MPIE <= _T_369;
                end
              end
            end
          end else begin
            if (_T_568) begin
              mstatus_MPIE <= mstatus_MIE;
            end else begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_386) begin
                  mstatus_MPIE <= _T_369;
                end else begin
                  if (_T_356) begin
                    mstatus_MPIE <= _T_369;
                  end
                end
              end
            end
          end
        end
      end else begin
        if (io_mem_wrCSROp_valid) begin
          if (_T_386) begin
            mstatus_MPIE <= _T_369;
          end else begin
            if (_T_356) begin
              mstatus_MPIE <= _T_369;
            end
          end
        end
      end
    end
    if (reset) begin
      mstatus_old_HPIE <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_386) begin
          mstatus_old_HPIE <= _T_368;
        end else begin
          if (_T_356) begin
            mstatus_old_HPIE <= _T_368;
          end
        end
      end
    end
    if (reset) begin
      mstatus_SPIE <= 1'h0;
    end else begin
      if (have_excep) begin
        if (_T_519) begin
          if (_T_521) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_386) begin
                mstatus_SPIE <= _T_367;
              end else begin
                if (_T_356) begin
                  mstatus_SPIE <= _T_367;
                end
              end
            end
          end else begin
            if (_T_523) begin
              mstatus_SPIE <= 1'h1;
            end else begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_386) begin
                  mstatus_SPIE <= _T_367;
                end else begin
                  if (_T_356) begin
                    mstatus_SPIE <= _T_367;
                  end
                end
              end
            end
          end
        end else begin
          if (_T_530) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_386) begin
                mstatus_SPIE <= _T_367;
              end else begin
                if (_T_356) begin
                  mstatus_SPIE <= _T_367;
                end
              end
            end
          end else begin
            if (_T_568) begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_386) begin
                  mstatus_SPIE <= _T_367;
                end else begin
                  if (_T_356) begin
                    mstatus_SPIE <= _T_367;
                  end
                end
              end
            end else begin
              if (_T_570) begin
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
      if (have_excep) begin
        if (_T_519) begin
          if (_T_521) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_386) begin
                mstatus_UPIE <= _T_366;
              end else begin
                if (_T_356) begin
                  mstatus_UPIE <= _T_366;
                end
              end
            end
          end else begin
            if (_T_523) begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_386) begin
                  mstatus_UPIE <= _T_366;
                end else begin
                  if (_T_356) begin
                    mstatus_UPIE <= _T_366;
                  end
                end
              end
            end else begin
              if (_T_526) begin
                mstatus_UPIE <= 1'h1;
              end else begin
                if (io_mem_wrCSROp_valid) begin
                  if (_T_386) begin
                    mstatus_UPIE <= _T_366;
                  end else begin
                    if (_T_356) begin
                      mstatus_UPIE <= _T_366;
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (_T_530) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_386) begin
                mstatus_UPIE <= _T_366;
              end else begin
                if (_T_356) begin
                  mstatus_UPIE <= _T_366;
                end
              end
            end
          end else begin
            if (_T_568) begin
              mstatus_UPIE <= _GEN_422;
            end else begin
              if (_T_570) begin
                mstatus_UPIE <= _GEN_422;
              end else begin
                if (_T_572) begin
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
      if (have_excep) begin
        if (_T_519) begin
          if (_T_521) begin
            mstatus_MIE <= mstatus_MPIE;
          end else begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_386) begin
                mstatus_MIE <= _T_365;
              end else begin
                if (_T_356) begin
                  mstatus_MIE <= _T_365;
                end
              end
            end
          end
        end else begin
          if (_T_530) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_386) begin
                mstatus_MIE <= _T_365;
              end else begin
                if (_T_356) begin
                  mstatus_MIE <= _T_365;
                end
              end
            end
          end else begin
            if (_T_568) begin
              mstatus_MIE <= 1'h0;
            end else begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_386) begin
                  mstatus_MIE <= _T_365;
                end else begin
                  if (_T_356) begin
                    mstatus_MIE <= _T_365;
                  end
                end
              end
            end
          end
        end
      end else begin
        if (io_mem_wrCSROp_valid) begin
          if (_T_386) begin
            mstatus_MIE <= _T_365;
          end else begin
            if (_T_356) begin
              mstatus_MIE <= _T_365;
            end
          end
        end
      end
    end
    if (reset) begin
      mstatus_old_HIE <= 1'h0;
    end else begin
      if (io_mem_wrCSROp_valid) begin
        if (_T_386) begin
          mstatus_old_HIE <= _T_364;
        end else begin
          if (_T_356) begin
            mstatus_old_HIE <= _T_364;
          end
        end
      end
    end
    if (reset) begin
      mstatus_SIE <= 1'h0;
    end else begin
      if (have_excep) begin
        if (_T_519) begin
          if (_T_521) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_386) begin
                mstatus_SIE <= _T_363;
              end else begin
                if (_T_356) begin
                  mstatus_SIE <= _T_363;
                end
              end
            end
          end else begin
            if (_T_523) begin
              mstatus_SIE <= mstatus_SPIE;
            end else begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_386) begin
                  mstatus_SIE <= _T_363;
                end else begin
                  if (_T_356) begin
                    mstatus_SIE <= _T_363;
                  end
                end
              end
            end
          end
        end else begin
          if (_T_530) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_386) begin
                mstatus_SIE <= _T_363;
              end else begin
                if (_T_356) begin
                  mstatus_SIE <= _T_363;
                end
              end
            end
          end else begin
            if (_T_568) begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_386) begin
                  mstatus_SIE <= _T_363;
                end else begin
                  if (_T_356) begin
                    mstatus_SIE <= _T_363;
                  end
                end
              end
            end else begin
              if (_T_570) begin
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
      if (have_excep) begin
        if (_T_519) begin
          if (_T_521) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_386) begin
                mstatus_UIE <= _T_362;
              end else begin
                if (_T_356) begin
                  mstatus_UIE <= _T_362;
                end
              end
            end
          end else begin
            if (_T_523) begin
              if (io_mem_wrCSROp_valid) begin
                if (_T_386) begin
                  mstatus_UIE <= _T_362;
                end else begin
                  if (_T_356) begin
                    mstatus_UIE <= _T_362;
                  end
                end
              end
            end else begin
              if (_T_526) begin
                mstatus_UIE <= mstatus_UPIE;
              end else begin
                if (io_mem_wrCSROp_valid) begin
                  if (_T_386) begin
                    mstatus_UIE <= _T_362;
                  end else begin
                    if (_T_356) begin
                      mstatus_UIE <= _T_362;
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (_T_530) begin
            if (io_mem_wrCSROp_valid) begin
              if (_T_386) begin
                mstatus_UIE <= _T_362;
              end else begin
                if (_T_356) begin
                  mstatus_UIE <= _T_362;
                end
              end
            end
          end else begin
            if (_T_568) begin
              mstatus_UIE <= _GEN_418;
            end else begin
              if (_T_570) begin
                mstatus_UIE <= _GEN_418;
              end else begin
                if (_T_572) begin
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
      mtime <= _T_160;
    end
  end
endmodule
module CPU( // @[:@2640.2]
  input         clock, // @[:@2641.4]
  input         reset, // @[:@2642.4]
  input         io_en, // @[:@2643.4]
  output [63:0] io_debug_pc, // @[:@2643.4]
  output [31:0] io_debug_ins, // @[:@2643.4]
  output [1:0]  io_debug_if_wait, // @[:@2643.4]
  output [1:0]  io_debug_mem_wait, // @[:@2643.4]
  output        io_debug_if_ready, // @[:@2643.4]
  output        io_debug_mem_ready, // @[:@2643.4]
  output [3:0]  io_debug_if_mode, // @[:@2643.4]
  output [3:0]  io_debug_mem_mode, // @[:@2643.4]
  output [63:0] io_debug_if_addr, // @[:@2643.4]
  output [63:0] io_debug_mem_addr, // @[:@2643.4]
  output        io_debug_error, // @[:@2643.4]
  output [3:0]  io_mem_mode, // @[:@2643.4]
  input         io_mem_ready, // @[:@2643.4]
  output [63:0] io_mem_addr, // @[:@2643.4]
  input  [63:0] io_mem_rdata, // @[:@2643.4]
  output [63:0] io_mem_wdata, // @[:@2643.4]
  output [3:0]  io_serial_mode, // @[:@2643.4]
  input         io_serial_ready, // @[:@2643.4]
  output [63:0] io_serial_addr, // @[:@2643.4]
  input  [63:0] io_serial_rdata, // @[:@2643.4]
  output [63:0] io_serial_wdata // @[:@2643.4]
);
  wire  insr_io_jump; // @[cpu.scala 26:22:@2645.4]
  wire [63:0] insr_io_jdest; // @[cpu.scala 26:22:@2645.4]
  wire  insr_io_nls; // @[cpu.scala 26:22:@2645.4]
  wire [63:0] insr_io_lpc; // @[cpu.scala 26:22:@2645.4]
  wire [63:0] insr_io_insp; // @[cpu.scala 26:22:@2645.4]
  wire [63:0] insr_io_inspd; // @[cpu.scala 26:22:@2645.4]
  wire  insr_io_bubble; // @[cpu.scala 26:22:@2645.4]
  wire [31:0] insr_io_ins; // @[cpu.scala 26:22:@2645.4]
  wire [63:0] insr_io_pc; // @[cpu.scala 26:22:@2645.4]
  wire [63:0] insr_io_insn; // @[cpu.scala 26:22:@2645.4]
  wire [63:0] insr_io_insnd; // @[cpu.scala 26:22:@2645.4]
  wire [3:0] insr_io_mmu_mode; // @[cpu.scala 26:22:@2645.4]
  wire  insr_io_mmu_ready; // @[cpu.scala 26:22:@2645.4]
  wire [63:0] insr_io_mmu_addr; // @[cpu.scala 26:22:@2645.4]
  wire [63:0] insr_io_mmu_rdata; // @[cpu.scala 26:22:@2645.4]
  wire  insr_io_mmu_if_rst; // @[cpu.scala 26:22:@2645.4]
  wire [63:0] insr_io_excep_pc; // @[cpu.scala 26:22:@2645.4]
  wire  insr_io_excep_inst_valid; // @[cpu.scala 26:22:@2645.4]
  wire  insd_clock; // @[cpu.scala 27:22:@2648.4]
  wire  insd_reset; // @[cpu.scala 27:22:@2648.4]
  wire [31:0] insd_io_ins; // @[cpu.scala 27:22:@2648.4]
  wire  insd_io_lastload_valid; // @[cpu.scala 27:22:@2648.4]
  wire [4:0] insd_io_lastload_index; // @[cpu.scala 27:22:@2648.4]
  wire  insd_io_loadinfo_valid; // @[cpu.scala 27:22:@2648.4]
  wire [4:0] insd_io_loadinfo_index; // @[cpu.scala 27:22:@2648.4]
  wire [63:0] insd_io_imm; // @[cpu.scala 27:22:@2648.4]
  wire [3:0] insd_io_ALUOp; // @[cpu.scala 27:22:@2648.4]
  wire [3:0] insd_io_exe_type; // @[cpu.scala 27:22:@2648.4]
  wire [3:0] insd_io_ls_mode; // @[cpu.scala 27:22:@2648.4]
  wire  insd_io_op32; // @[cpu.scala 27:22:@2648.4]
  wire  insd_io_bubble; // @[cpu.scala 27:22:@2648.4]
  wire [4:0] insd_io_regr_r1; // @[cpu.scala 27:22:@2648.4]
  wire [4:0] insd_io_regr_r2; // @[cpu.scala 27:22:@2648.4]
  wire [63:0] insd_io_regr_r1d; // @[cpu.scala 27:22:@2648.4]
  wire [63:0] insd_io_regr_r2d; // @[cpu.scala 27:22:@2648.4]
  wire  insd_io_dreg_rs2_valid; // @[cpu.scala 27:22:@2648.4]
  wire [63:0] insd_io_dreg_rs1_value; // @[cpu.scala 27:22:@2648.4]
  wire [63:0] insd_io_dreg_rs2_value; // @[cpu.scala 27:22:@2648.4]
  wire  insd_io_dreg_rd_valid; // @[cpu.scala 27:22:@2648.4]
  wire [4:0] insd_io_dreg_rd_index; // @[cpu.scala 27:22:@2648.4]
  wire [11:0] insd_io_csr_addr; // @[cpu.scala 27:22:@2648.4]
  wire [63:0] insd_io_csr_rdata; // @[cpu.scala 27:22:@2648.4]
  wire [1:0] insd_io_csr_priv; // @[cpu.scala 27:22:@2648.4]
  wire  insd_io_csr_content_valid; // @[cpu.scala 27:22:@2648.4]
  wire [11:0] insd_io_csr_content_csr_idx; // @[cpu.scala 27:22:@2648.4]
  wire [63:0] insd_io_csr_content_csr_data; // @[cpu.scala 27:22:@2648.4]
  wire  insd_io_csr_from_ex_valid; // @[cpu.scala 27:22:@2648.4]
  wire [11:0] insd_io_csr_from_ex_csr_idx; // @[cpu.scala 27:22:@2648.4]
  wire [63:0] insd_io_csr_from_ex_csr_data; // @[cpu.scala 27:22:@2648.4]
  wire  insd_io_csr_from_mem_valid; // @[cpu.scala 27:22:@2648.4]
  wire [11:0] insd_io_csr_from_mem_csr_idx; // @[cpu.scala 27:22:@2648.4]
  wire [63:0] insd_io_csr_from_mem_csr_data; // @[cpu.scala 27:22:@2648.4]
  wire  insd_io_exWrReg_wbrv; // @[cpu.scala 27:22:@2648.4]
  wire [4:0] insd_io_exWrReg_wbri; // @[cpu.scala 27:22:@2648.4]
  wire [63:0] insd_io_exWrReg_wbrd; // @[cpu.scala 27:22:@2648.4]
  wire  insd_io_memWrReg_wbrv; // @[cpu.scala 27:22:@2648.4]
  wire [4:0] insd_io_memWrReg_wbri; // @[cpu.scala 27:22:@2648.4]
  wire [63:0] insd_io_memWrReg_wbrd; // @[cpu.scala 27:22:@2648.4]
  wire  insd_io_if_excep_valid; // @[cpu.scala 27:22:@2648.4]
  wire [31:0] insd_io_if_excep_code; // @[cpu.scala 27:22:@2648.4]
  wire [31:0] insd_io_if_excep_value; // @[cpu.scala 27:22:@2648.4]
  wire [63:0] insd_io_if_excep_pc; // @[cpu.scala 27:22:@2648.4]
  wire  insd_io_if_excep_inst_valid; // @[cpu.scala 27:22:@2648.4]
  wire  insd_io_ex_excep_valid; // @[cpu.scala 27:22:@2648.4]
  wire [31:0] insd_io_ex_excep_code; // @[cpu.scala 27:22:@2648.4]
  wire [31:0] insd_io_ex_excep_value; // @[cpu.scala 27:22:@2648.4]
  wire [63:0] insd_io_ex_excep_pc; // @[cpu.scala 27:22:@2648.4]
  wire  insd_io_ex_excep_inst_valid; // @[cpu.scala 27:22:@2648.4]
  wire [63:0] exec_io_imm; // @[cpu.scala 28:22:@2651.4]
  wire [3:0] exec_io_ALUOp; // @[cpu.scala 28:22:@2651.4]
  wire [63:0] exec_io_pc; // @[cpu.scala 28:22:@2651.4]
  wire [3:0] exec_io_exe_type; // @[cpu.scala 28:22:@2651.4]
  wire  exec_io_op32; // @[cpu.scala 28:22:@2651.4]
  wire  exec_io_dreg_rs2_valid; // @[cpu.scala 28:22:@2651.4]
  wire [63:0] exec_io_dreg_rs1_value; // @[cpu.scala 28:22:@2651.4]
  wire [63:0] exec_io_dreg_rs2_value; // @[cpu.scala 28:22:@2651.4]
  wire  exec_io_dreg_rd_valid; // @[cpu.scala 28:22:@2651.4]
  wire [4:0] exec_io_dreg_rd_index; // @[cpu.scala 28:22:@2651.4]
  wire  exec_io_nls; // @[cpu.scala 28:22:@2651.4]
  wire [63:0] exec_io_addr; // @[cpu.scala 28:22:@2651.4]
  wire [63:0] exec_io_data; // @[cpu.scala 28:22:@2651.4]
  wire  exec_io_jump; // @[cpu.scala 28:22:@2651.4]
  wire [63:0] exec_io_jdest; // @[cpu.scala 28:22:@2651.4]
  wire  exec_io_wreg_wbrv; // @[cpu.scala 28:22:@2651.4]
  wire [4:0] exec_io_wreg_wbri; // @[cpu.scala 28:22:@2651.4]
  wire [63:0] exec_io_wreg_wbrd; // @[cpu.scala 28:22:@2651.4]
  wire  exec_io_wcsr_valid; // @[cpu.scala 28:22:@2651.4]
  wire [11:0] exec_io_wcsr_csr_idx; // @[cpu.scala 28:22:@2651.4]
  wire [63:0] exec_io_wcsr_csr_data; // @[cpu.scala 28:22:@2651.4]
  wire  exec_io_csr_op_valid; // @[cpu.scala 28:22:@2651.4]
  wire [11:0] exec_io_csr_op_csr_idx; // @[cpu.scala 28:22:@2651.4]
  wire [63:0] exec_io_csr_op_csr_data; // @[cpu.scala 28:22:@2651.4]
  wire  exec_io_id_excep_valid; // @[cpu.scala 28:22:@2651.4]
  wire [31:0] exec_io_id_excep_code; // @[cpu.scala 28:22:@2651.4]
  wire [31:0] exec_io_id_excep_value; // @[cpu.scala 28:22:@2651.4]
  wire [63:0] exec_io_id_excep_pc; // @[cpu.scala 28:22:@2651.4]
  wire  exec_io_id_excep_inst_valid; // @[cpu.scala 28:22:@2651.4]
  wire  exec_io_mem_excep_valid; // @[cpu.scala 28:22:@2651.4]
  wire [31:0] exec_io_mem_excep_code; // @[cpu.scala 28:22:@2651.4]
  wire [31:0] exec_io_mem_excep_value; // @[cpu.scala 28:22:@2651.4]
  wire [63:0] exec_io_mem_excep_pc; // @[cpu.scala 28:22:@2651.4]
  wire  exec_io_mem_excep_inst_valid; // @[cpu.scala 28:22:@2651.4]
  wire  memc_io_nls; // @[cpu.scala 29:22:@2654.4]
  wire [3:0] memc_io_lsm; // @[cpu.scala 29:22:@2654.4]
  wire [63:0] memc_io_addr; // @[cpu.scala 29:22:@2654.4]
  wire [63:0] memc_io_data; // @[cpu.scala 29:22:@2654.4]
  wire  memc_io_ready; // @[cpu.scala 29:22:@2654.4]
  wire  memc_io_ereg_wbrv; // @[cpu.scala 29:22:@2654.4]
  wire [4:0] memc_io_ereg_wbri; // @[cpu.scala 29:22:@2654.4]
  wire [63:0] memc_io_ereg_wbrd; // @[cpu.scala 29:22:@2654.4]
  wire  memc_io_wreg_wbrv; // @[cpu.scala 29:22:@2654.4]
  wire [4:0] memc_io_wreg_wbri; // @[cpu.scala 29:22:@2654.4]
  wire [63:0] memc_io_wreg_wbrd; // @[cpu.scala 29:22:@2654.4]
  wire [3:0] memc_io_mem_mode; // @[cpu.scala 29:22:@2654.4]
  wire  memc_io_mem_ready; // @[cpu.scala 29:22:@2654.4]
  wire [63:0] memc_io_mem_addr; // @[cpu.scala 29:22:@2654.4]
  wire [63:0] memc_io_mem_rdata; // @[cpu.scala 29:22:@2654.4]
  wire [63:0] memc_io_mem_wdata; // @[cpu.scala 29:22:@2654.4]
  wire  memc_io_excep_valid; // @[cpu.scala 29:22:@2654.4]
  wire [31:0] memc_io_excep_code; // @[cpu.scala 29:22:@2654.4]
  wire [31:0] memc_io_excep_value; // @[cpu.scala 29:22:@2654.4]
  wire [63:0] memc_io_excep_pc; // @[cpu.scala 29:22:@2654.4]
  wire  memc_io_excep_inst_valid; // @[cpu.scala 29:22:@2654.4]
  wire  memc_io_csr_wb_valid; // @[cpu.scala 29:22:@2654.4]
  wire [11:0] memc_io_csr_wb_csr_idx; // @[cpu.scala 29:22:@2654.4]
  wire [63:0] memc_io_csr_wb_csr_data; // @[cpu.scala 29:22:@2654.4]
  wire  memc_io_csr_wrCSROp_valid; // @[cpu.scala 29:22:@2654.4]
  wire [11:0] memc_io_csr_wrCSROp_csr_idx; // @[cpu.scala 29:22:@2654.4]
  wire [63:0] memc_io_csr_wrCSROp_csr_data; // @[cpu.scala 29:22:@2654.4]
  wire  memc_io_csr_excep_valid; // @[cpu.scala 29:22:@2654.4]
  wire [31:0] memc_io_csr_excep_code; // @[cpu.scala 29:22:@2654.4]
  wire [31:0] memc_io_csr_excep_value; // @[cpu.scala 29:22:@2654.4]
  wire [63:0] memc_io_csr_excep_pc; // @[cpu.scala 29:22:@2654.4]
  wire  memc_io_csr_excep_inst_valid; // @[cpu.scala 29:22:@2654.4]
  wire  memc_io_inter_valid; // @[cpu.scala 29:22:@2654.4]
  wire [31:0] memc_io_inter_bits; // @[cpu.scala 29:22:@2654.4]
  wire  wrbk_io_wreg_wbrv; // @[cpu.scala 30:22:@2657.4]
  wire [4:0] wrbk_io_wreg_wbri; // @[cpu.scala 30:22:@2657.4]
  wire [63:0] wrbk_io_wreg_wbrd; // @[cpu.scala 30:22:@2657.4]
  wire  wrbk_io_reg_wen; // @[cpu.scala 30:22:@2657.4]
  wire [4:0] wrbk_io_reg_w; // @[cpu.scala 30:22:@2657.4]
  wire [63:0] wrbk_io_reg_wd; // @[cpu.scala 30:22:@2657.4]
  wire  regc_clock; // @[cpu.scala 31:22:@2660.4]
  wire [4:0] regc_io_r_r1; // @[cpu.scala 31:22:@2660.4]
  wire [4:0] regc_io_r_r2; // @[cpu.scala 31:22:@2660.4]
  wire [63:0] regc_io_r_r1d; // @[cpu.scala 31:22:@2660.4]
  wire [63:0] regc_io_r_r2d; // @[cpu.scala 31:22:@2660.4]
  wire  regc_io_w_wen; // @[cpu.scala 31:22:@2660.4]
  wire [4:0] regc_io_w_w; // @[cpu.scala 31:22:@2660.4]
  wire [63:0] regc_io_w_wd; // @[cpu.scala 31:22:@2660.4]
  wire  regc_io_pass; // @[cpu.scala 31:22:@2660.4]
  wire  mmu_clock; // @[cpu.scala 32:22:@2663.4]
  wire  mmu_reset; // @[cpu.scala 32:22:@2663.4]
  wire [3:0] mmu_io_mem_mode; // @[cpu.scala 32:22:@2663.4]
  wire  mmu_io_mem_ready; // @[cpu.scala 32:22:@2663.4]
  wire [63:0] mmu_io_mem_addr; // @[cpu.scala 32:22:@2663.4]
  wire [63:0] mmu_io_mem_rdata; // @[cpu.scala 32:22:@2663.4]
  wire [63:0] mmu_io_mem_wdata; // @[cpu.scala 32:22:@2663.4]
  wire [3:0] mmu_io_insr_mode; // @[cpu.scala 32:22:@2663.4]
  wire  mmu_io_insr_ready; // @[cpu.scala 32:22:@2663.4]
  wire [63:0] mmu_io_insr_addr; // @[cpu.scala 32:22:@2663.4]
  wire [63:0] mmu_io_insr_rdata; // @[cpu.scala 32:22:@2663.4]
  wire  mmu_io_insr_rst; // @[cpu.scala 32:22:@2663.4]
  wire [1:0] mmu_io_csr_priv; // @[cpu.scala 32:22:@2663.4]
  wire  mmu_io_csr_mxr; // @[cpu.scala 32:22:@2663.4]
  wire  mmu_io_csr_sum; // @[cpu.scala 32:22:@2663.4]
  wire [3:0] mmu_io_if_iom_mode; // @[cpu.scala 32:22:@2663.4]
  wire  mmu_io_if_iom_ready; // @[cpu.scala 32:22:@2663.4]
  wire [63:0] mmu_io_if_iom_addr; // @[cpu.scala 32:22:@2663.4]
  wire [63:0] mmu_io_if_iom_rdata; // @[cpu.scala 32:22:@2663.4]
  wire [3:0] mmu_io_mem_iom_mode; // @[cpu.scala 32:22:@2663.4]
  wire  mmu_io_mem_iom_ready; // @[cpu.scala 32:22:@2663.4]
  wire [63:0] mmu_io_mem_iom_addr; // @[cpu.scala 32:22:@2663.4]
  wire [63:0] mmu_io_mem_iom_rdata; // @[cpu.scala 32:22:@2663.4]
  wire [63:0] mmu_io_mem_iom_wdata; // @[cpu.scala 32:22:@2663.4]
  wire  iomn_clock; // @[cpu.scala 33:22:@2666.4]
  wire  iomn_reset; // @[cpu.scala 33:22:@2666.4]
  wire [3:0] iomn_io_mem_if_mode; // @[cpu.scala 33:22:@2666.4]
  wire  iomn_io_mem_if_ready; // @[cpu.scala 33:22:@2666.4]
  wire [63:0] iomn_io_mem_if_addr; // @[cpu.scala 33:22:@2666.4]
  wire [63:0] iomn_io_mem_if_rdata; // @[cpu.scala 33:22:@2666.4]
  wire [3:0] iomn_io_mem_mem_mode; // @[cpu.scala 33:22:@2666.4]
  wire  iomn_io_mem_mem_ready; // @[cpu.scala 33:22:@2666.4]
  wire [63:0] iomn_io_mem_mem_addr; // @[cpu.scala 33:22:@2666.4]
  wire [63:0] iomn_io_mem_mem_rdata; // @[cpu.scala 33:22:@2666.4]
  wire [63:0] iomn_io_mem_mem_wdata; // @[cpu.scala 33:22:@2666.4]
  wire [3:0] iomn_io_mem_out_mode; // @[cpu.scala 33:22:@2666.4]
  wire  iomn_io_mem_out_ready; // @[cpu.scala 33:22:@2666.4]
  wire [63:0] iomn_io_mem_out_addr; // @[cpu.scala 33:22:@2666.4]
  wire [63:0] iomn_io_mem_out_rdata; // @[cpu.scala 33:22:@2666.4]
  wire [63:0] iomn_io_mem_out_wdata; // @[cpu.scala 33:22:@2666.4]
  wire [3:0] iomn_io_serial_out_mode; // @[cpu.scala 33:22:@2666.4]
  wire  iomn_io_serial_out_ready; // @[cpu.scala 33:22:@2666.4]
  wire [63:0] iomn_io_serial_out_addr; // @[cpu.scala 33:22:@2666.4]
  wire [63:0] iomn_io_serial_out_rdata; // @[cpu.scala 33:22:@2666.4]
  wire [63:0] iomn_io_serial_out_wdata; // @[cpu.scala 33:22:@2666.4]
  wire [1:0] iomn_io_debug_if_wait; // @[cpu.scala 33:22:@2666.4]
  wire [1:0] iomn_io_debug_mem_wait; // @[cpu.scala 33:22:@2666.4]
  wire  iomn_io_debug_if_ready; // @[cpu.scala 33:22:@2666.4]
  wire  iomn_io_debug_mem_ready; // @[cpu.scala 33:22:@2666.4]
  wire [3:0] iomn_io_debug_if_mode; // @[cpu.scala 33:22:@2666.4]
  wire [3:0] iomn_io_debug_mem_mode; // @[cpu.scala 33:22:@2666.4]
  wire [63:0] iomn_io_debug_if_addr; // @[cpu.scala 33:22:@2666.4]
  wire [63:0] iomn_io_debug_mem_addr; // @[cpu.scala 33:22:@2666.4]
  wire  iomn_io_debug_error; // @[cpu.scala 33:22:@2666.4]
  wire  if_id_clock; // @[cpu.scala 34:24:@2669.4]
  wire  if_id_reset; // @[cpu.scala 34:24:@2669.4]
  wire  if_id_io_en; // @[cpu.scala 34:24:@2669.4]
  wire  if_id_io_pass; // @[cpu.scala 34:24:@2669.4]
  wire  if_id_io_flush; // @[cpu.scala 34:24:@2669.4]
  wire [31:0] if_id_io_insi; // @[cpu.scala 34:24:@2669.4]
  wire [63:0] if_id_io_pci; // @[cpu.scala 34:24:@2669.4]
  wire [63:0] if_id_io_insci; // @[cpu.scala 34:24:@2669.4]
  wire [63:0] if_id_io_icdi; // @[cpu.scala 34:24:@2669.4]
  wire  if_id_io_lastloadin_valid; // @[cpu.scala 34:24:@2669.4]
  wire [4:0] if_id_io_lastloadin_index; // @[cpu.scala 34:24:@2669.4]
  wire [63:0] if_id_io_excep_i_pc; // @[cpu.scala 34:24:@2669.4]
  wire  if_id_io_excep_i_inst_valid; // @[cpu.scala 34:24:@2669.4]
  wire [31:0] if_id_io_inso; // @[cpu.scala 34:24:@2669.4]
  wire [63:0] if_id_io_pco; // @[cpu.scala 34:24:@2669.4]
  wire [63:0] if_id_io_insco; // @[cpu.scala 34:24:@2669.4]
  wire [63:0] if_id_io_icdo; // @[cpu.scala 34:24:@2669.4]
  wire  if_id_io_lastloadout_valid; // @[cpu.scala 34:24:@2669.4]
  wire [4:0] if_id_io_lastloadout_index; // @[cpu.scala 34:24:@2669.4]
  wire  if_id_io_excep_o_valid; // @[cpu.scala 34:24:@2669.4]
  wire [31:0] if_id_io_excep_o_code; // @[cpu.scala 34:24:@2669.4]
  wire [31:0] if_id_io_excep_o_value; // @[cpu.scala 34:24:@2669.4]
  wire [63:0] if_id_io_excep_o_pc; // @[cpu.scala 34:24:@2669.4]
  wire  if_id_io_excep_o_inst_valid; // @[cpu.scala 34:24:@2669.4]
  wire  id_ex_clock; // @[cpu.scala 35:24:@2672.4]
  wire  id_ex_reset; // @[cpu.scala 35:24:@2672.4]
  wire  id_ex_io_en; // @[cpu.scala 35:24:@2672.4]
  wire  id_ex_io_bid; // @[cpu.scala 35:24:@2672.4]
  wire  id_ex_io_bex; // @[cpu.scala 35:24:@2672.4]
  wire  id_ex_io_flush; // @[cpu.scala 35:24:@2672.4]
  wire  id_ex_io_pass; // @[cpu.scala 35:24:@2672.4]
  wire [63:0] id_ex_io_immi; // @[cpu.scala 35:24:@2672.4]
  wire [3:0] id_ex_io_ALUOpi; // @[cpu.scala 35:24:@2672.4]
  wire [3:0] id_ex_io_exeti; // @[cpu.scala 35:24:@2672.4]
  wire [63:0] id_ex_io_pci; // @[cpu.scala 35:24:@2672.4]
  wire [3:0] id_ex_io_lsmi; // @[cpu.scala 35:24:@2672.4]
  wire  id_ex_io_op32i; // @[cpu.scala 35:24:@2672.4]
  wire  id_ex_io_csr_wb_i_valid; // @[cpu.scala 35:24:@2672.4]
  wire [11:0] id_ex_io_csr_wb_i_csr_idx; // @[cpu.scala 35:24:@2672.4]
  wire [63:0] id_ex_io_csr_wb_i_csr_data; // @[cpu.scala 35:24:@2672.4]
  wire  id_ex_io_dregi_rs2_valid; // @[cpu.scala 35:24:@2672.4]
  wire [63:0] id_ex_io_dregi_rs1_value; // @[cpu.scala 35:24:@2672.4]
  wire [63:0] id_ex_io_dregi_rs2_value; // @[cpu.scala 35:24:@2672.4]
  wire  id_ex_io_dregi_rd_valid; // @[cpu.scala 35:24:@2672.4]
  wire [4:0] id_ex_io_dregi_rd_index; // @[cpu.scala 35:24:@2672.4]
  wire  id_ex_io_excep_i_valid; // @[cpu.scala 35:24:@2672.4]
  wire [31:0] id_ex_io_excep_i_code; // @[cpu.scala 35:24:@2672.4]
  wire [31:0] id_ex_io_excep_i_value; // @[cpu.scala 35:24:@2672.4]
  wire [63:0] id_ex_io_excep_i_pc; // @[cpu.scala 35:24:@2672.4]
  wire  id_ex_io_excep_i_inst_valid; // @[cpu.scala 35:24:@2672.4]
  wire [63:0] id_ex_io_immo; // @[cpu.scala 35:24:@2672.4]
  wire [3:0] id_ex_io_ALUOpo; // @[cpu.scala 35:24:@2672.4]
  wire [3:0] id_ex_io_exeto; // @[cpu.scala 35:24:@2672.4]
  wire [63:0] id_ex_io_pco; // @[cpu.scala 35:24:@2672.4]
  wire [3:0] id_ex_io_lsmo; // @[cpu.scala 35:24:@2672.4]
  wire  id_ex_io_op32o; // @[cpu.scala 35:24:@2672.4]
  wire  id_ex_io_csr_wb_o_valid; // @[cpu.scala 35:24:@2672.4]
  wire [11:0] id_ex_io_csr_wb_o_csr_idx; // @[cpu.scala 35:24:@2672.4]
  wire [63:0] id_ex_io_csr_wb_o_csr_data; // @[cpu.scala 35:24:@2672.4]
  wire  id_ex_io_drego_rs2_valid; // @[cpu.scala 35:24:@2672.4]
  wire [63:0] id_ex_io_drego_rs1_value; // @[cpu.scala 35:24:@2672.4]
  wire [63:0] id_ex_io_drego_rs2_value; // @[cpu.scala 35:24:@2672.4]
  wire  id_ex_io_drego_rd_valid; // @[cpu.scala 35:24:@2672.4]
  wire [4:0] id_ex_io_drego_rd_index; // @[cpu.scala 35:24:@2672.4]
  wire  id_ex_io_excep_o_valid; // @[cpu.scala 35:24:@2672.4]
  wire [31:0] id_ex_io_excep_o_code; // @[cpu.scala 35:24:@2672.4]
  wire [31:0] id_ex_io_excep_o_value; // @[cpu.scala 35:24:@2672.4]
  wire [63:0] id_ex_io_excep_o_pc; // @[cpu.scala 35:24:@2672.4]
  wire  id_ex_io_excep_o_inst_valid; // @[cpu.scala 35:24:@2672.4]
  wire  ex_mem_clock; // @[cpu.scala 36:24:@2675.4]
  wire  ex_mem_reset; // @[cpu.scala 36:24:@2675.4]
  wire  ex_mem_io_en; // @[cpu.scala 36:24:@2675.4]
  wire  ex_mem_io_pass; // @[cpu.scala 36:24:@2675.4]
  wire  ex_mem_io_flush; // @[cpu.scala 36:24:@2675.4]
  wire  ex_mem_io_nlsi; // @[cpu.scala 36:24:@2675.4]
  wire [3:0] ex_mem_io_lsmi; // @[cpu.scala 36:24:@2675.4]
  wire [63:0] ex_mem_io_addri; // @[cpu.scala 36:24:@2675.4]
  wire [63:0] ex_mem_io_datai; // @[cpu.scala 36:24:@2675.4]
  wire  ex_mem_io_wregi_wbrv; // @[cpu.scala 36:24:@2675.4]
  wire [4:0] ex_mem_io_wregi_wbri; // @[cpu.scala 36:24:@2675.4]
  wire [63:0] ex_mem_io_wregi_wbrd; // @[cpu.scala 36:24:@2675.4]
  wire  ex_mem_io_csr_wb_i_valid; // @[cpu.scala 36:24:@2675.4]
  wire [11:0] ex_mem_io_csr_wb_i_csr_idx; // @[cpu.scala 36:24:@2675.4]
  wire [63:0] ex_mem_io_csr_wb_i_csr_data; // @[cpu.scala 36:24:@2675.4]
  wire  ex_mem_io_excep_i_valid; // @[cpu.scala 36:24:@2675.4]
  wire [31:0] ex_mem_io_excep_i_code; // @[cpu.scala 36:24:@2675.4]
  wire [31:0] ex_mem_io_excep_i_value; // @[cpu.scala 36:24:@2675.4]
  wire [63:0] ex_mem_io_excep_i_pc; // @[cpu.scala 36:24:@2675.4]
  wire  ex_mem_io_excep_i_inst_valid; // @[cpu.scala 36:24:@2675.4]
  wire  ex_mem_io_inter_i_valid; // @[cpu.scala 36:24:@2675.4]
  wire [31:0] ex_mem_io_inter_i_bits; // @[cpu.scala 36:24:@2675.4]
  wire  ex_mem_io_nlso; // @[cpu.scala 36:24:@2675.4]
  wire [3:0] ex_mem_io_lsmo; // @[cpu.scala 36:24:@2675.4]
  wire [63:0] ex_mem_io_addro; // @[cpu.scala 36:24:@2675.4]
  wire [63:0] ex_mem_io_datao; // @[cpu.scala 36:24:@2675.4]
  wire  ex_mem_io_wrego_wbrv; // @[cpu.scala 36:24:@2675.4]
  wire [4:0] ex_mem_io_wrego_wbri; // @[cpu.scala 36:24:@2675.4]
  wire [63:0] ex_mem_io_wrego_wbrd; // @[cpu.scala 36:24:@2675.4]
  wire  ex_mem_io_csr_wb_o_valid; // @[cpu.scala 36:24:@2675.4]
  wire [11:0] ex_mem_io_csr_wb_o_csr_idx; // @[cpu.scala 36:24:@2675.4]
  wire [63:0] ex_mem_io_csr_wb_o_csr_data; // @[cpu.scala 36:24:@2675.4]
  wire  ex_mem_io_excep_o_valid; // @[cpu.scala 36:24:@2675.4]
  wire [31:0] ex_mem_io_excep_o_code; // @[cpu.scala 36:24:@2675.4]
  wire [31:0] ex_mem_io_excep_o_value; // @[cpu.scala 36:24:@2675.4]
  wire [63:0] ex_mem_io_excep_o_pc; // @[cpu.scala 36:24:@2675.4]
  wire  ex_mem_io_excep_o_inst_valid; // @[cpu.scala 36:24:@2675.4]
  wire  ex_mem_io_inter_o_valid; // @[cpu.scala 36:24:@2675.4]
  wire [31:0] ex_mem_io_inter_o_bits; // @[cpu.scala 36:24:@2675.4]
  wire  mem_wb_clock; // @[cpu.scala 37:24:@2678.4]
  wire  mem_wb_reset; // @[cpu.scala 37:24:@2678.4]
  wire  mem_wb_io_en; // @[cpu.scala 37:24:@2678.4]
  wire  mem_wb_io_pass; // @[cpu.scala 37:24:@2678.4]
  wire  mem_wb_io_wregi_wbrv; // @[cpu.scala 37:24:@2678.4]
  wire [4:0] mem_wb_io_wregi_wbri; // @[cpu.scala 37:24:@2678.4]
  wire [63:0] mem_wb_io_wregi_wbrd; // @[cpu.scala 37:24:@2678.4]
  wire  mem_wb_io_wrego_wbrv; // @[cpu.scala 37:24:@2678.4]
  wire [4:0] mem_wb_io_wrego_wbri; // @[cpu.scala 37:24:@2678.4]
  wire [63:0] mem_wb_io_wrego_wbrd; // @[cpu.scala 37:24:@2678.4]
  wire  csr_clock; // @[cpu.scala 38:24:@2681.4]
  wire  csr_reset; // @[cpu.scala 38:24:@2681.4]
  wire [11:0] csr_io_id_addr; // @[cpu.scala 38:24:@2681.4]
  wire [63:0] csr_io_id_rdata; // @[cpu.scala 38:24:@2681.4]
  wire [1:0] csr_io_id_priv; // @[cpu.scala 38:24:@2681.4]
  wire  csr_io_mem_wrCSROp_valid; // @[cpu.scala 38:24:@2681.4]
  wire [11:0] csr_io_mem_wrCSROp_csr_idx; // @[cpu.scala 38:24:@2681.4]
  wire [63:0] csr_io_mem_wrCSROp_csr_data; // @[cpu.scala 38:24:@2681.4]
  wire  csr_io_mem_excep_valid; // @[cpu.scala 38:24:@2681.4]
  wire [31:0] csr_io_mem_excep_code; // @[cpu.scala 38:24:@2681.4]
  wire [31:0] csr_io_mem_excep_value; // @[cpu.scala 38:24:@2681.4]
  wire [63:0] csr_io_mem_excep_pc; // @[cpu.scala 38:24:@2681.4]
  wire  csr_io_mem_excep_inst_valid; // @[cpu.scala 38:24:@2681.4]
  wire [1:0] csr_io_mmu_priv; // @[cpu.scala 38:24:@2681.4]
  wire  csr_io_mmu_mxr; // @[cpu.scala 38:24:@2681.4]
  wire  csr_io_mmu_sum; // @[cpu.scala 38:24:@2681.4]
  wire  csr_io_flush; // @[cpu.scala 38:24:@2681.4]
  wire [63:0] csr_io_csrNewPc; // @[cpu.scala 38:24:@2681.4]
  wire  csr_io_inter_valid; // @[cpu.scala 38:24:@2681.4]
  wire [31:0] csr_io_inter_bits; // @[cpu.scala 38:24:@2681.4]
  InsReader insr ( // @[cpu.scala 26:22:@2645.4]
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
  Decoder insd ( // @[cpu.scala 27:22:@2648.4]
    .clock(insd_clock),
    .reset(insd_reset),
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
    .io_ex_excep_inst_valid(insd_io_ex_excep_inst_valid)
  );
  Execute exec ( // @[cpu.scala 28:22:@2651.4]
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
  MemoryCtrl memc ( // @[cpu.scala 29:22:@2654.4]
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
  WriteBack wrbk ( // @[cpu.scala 30:22:@2657.4]
    .io_wreg_wbrv(wrbk_io_wreg_wbrv),
    .io_wreg_wbri(wrbk_io_wreg_wbri),
    .io_wreg_wbrd(wrbk_io_wreg_wbrd),
    .io_reg_wen(wrbk_io_reg_wen),
    .io_reg_w(wrbk_io_reg_w),
    .io_reg_wd(wrbk_io_reg_wd)
  );
  RegCtrl regc ( // @[cpu.scala 31:22:@2660.4]
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
  MMU mmu ( // @[cpu.scala 32:22:@2663.4]
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
  IOManager iomn ( // @[cpu.scala 33:22:@2666.4]
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
    .io_debug_error(iomn_io_debug_error)
  );
  IF_ID if_id ( // @[cpu.scala 34:24:@2669.4]
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
  ID_EX id_ex ( // @[cpu.scala 35:24:@2672.4]
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
    .io_excep_o_inst_valid(id_ex_io_excep_o_inst_valid)
  );
  EX_MEM ex_mem ( // @[cpu.scala 36:24:@2675.4]
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
  MEM_WB mem_wb ( // @[cpu.scala 37:24:@2678.4]
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
  CSR csr ( // @[cpu.scala 38:24:@2681.4]
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
    .io_mmu_priv(csr_io_mmu_priv),
    .io_mmu_mxr(csr_io_mmu_mxr),
    .io_mmu_sum(csr_io_mmu_sum),
    .io_flush(csr_io_flush),
    .io_csrNewPc(csr_io_csrNewPc),
    .io_inter_valid(csr_io_inter_valid),
    .io_inter_bits(csr_io_inter_bits)
  );
  assign io_debug_pc = if_id_io_pco; // @[cpu.scala 41:20:@2684.4]
  assign io_debug_ins = if_id_io_inso; // @[cpu.scala 42:20:@2685.4]
  assign io_debug_if_wait = iomn_io_debug_if_wait; // @[cpu.scala 43:22:@2686.4]
  assign io_debug_mem_wait = iomn_io_debug_mem_wait; // @[cpu.scala 47:33:@2690.4]
  assign io_debug_if_ready = iomn_io_debug_if_ready; // @[cpu.scala 44:33:@2687.4]
  assign io_debug_mem_ready = iomn_io_debug_mem_ready; // @[cpu.scala 48:34:@2691.4]
  assign io_debug_if_mode = iomn_io_debug_if_mode; // @[cpu.scala 45:31:@2688.4]
  assign io_debug_mem_mode = iomn_io_debug_mem_mode; // @[cpu.scala 49:32:@2692.4]
  assign io_debug_if_addr = iomn_io_debug_if_addr; // @[cpu.scala 46:31:@2689.4]
  assign io_debug_mem_addr = iomn_io_debug_mem_addr; // @[cpu.scala 50:32:@2693.4]
  assign io_debug_error = iomn_io_debug_error; // @[cpu.scala 51:29:@2694.4]
  assign io_mem_mode = iomn_io_mem_out_mode; // @[cpu.scala 59:20:@2722.4]
  assign io_mem_addr = iomn_io_mem_out_addr; // @[cpu.scala 59:20:@2720.4]
  assign io_mem_wdata = iomn_io_mem_out_wdata; // @[cpu.scala 59:20:@2718.4]
  assign io_serial_mode = iomn_io_serial_out_mode; // @[cpu.scala 60:20:@2727.4]
  assign io_serial_addr = iomn_io_serial_out_addr; // @[cpu.scala 60:20:@2725.4]
  assign io_serial_wdata = iomn_io_serial_out_wdata; // @[cpu.scala 60:20:@2723.4]
  assign insr_io_jump = csr_io_flush | exec_io_jump; // @[cpu.scala 73:20:@2747.4]
  assign insr_io_jdest = csr_io_flush ? csr_io_csrNewPc : exec_io_jdest; // @[cpu.scala 74:20:@2749.4]
  assign insr_io_nls = ex_mem_io_nlso; // @[cpu.scala 75:20:@2750.4]
  assign insr_io_lpc = if_id_io_pco; // @[cpu.scala 94:20:@2769.4]
  assign insr_io_insp = if_id_io_insco; // @[cpu.scala 96:20:@2771.4]
  assign insr_io_inspd = if_id_io_icdo; // @[cpu.scala 97:20:@2772.4]
  assign insr_io_bubble = insd_io_bubble; // @[cpu.scala 76:20:@2751.4]
  assign insr_io_mmu_ready = mmu_io_insr_ready; // @[cpu.scala 54:20:@2699.4]
  assign insr_io_mmu_rdata = mmu_io_insr_rdata; // @[cpu.scala 54:20:@2697.4]
  assign insd_clock = clock; // @[:@2649.4]
  assign insd_reset = reset; // @[:@2650.4]
  assign insd_io_ins = if_id_io_inso; // @[cpu.scala 95:20:@2770.4]
  assign insd_io_lastload_valid = if_id_io_lastloadout_valid; // @[cpu.scala 98:26:@2774.4]
  assign insd_io_lastload_index = if_id_io_lastloadout_index; // @[cpu.scala 98:26:@2773.4]
  assign insd_io_regr_r1d = regc_io_r_r1d; // @[cpu.scala 65:19:@2734.4]
  assign insd_io_regr_r2d = regc_io_r_r2d; // @[cpu.scala 65:19:@2733.4]
  assign insd_io_csr_rdata = csr_io_id_rdata; // @[cpu.scala 155:21:@2871.4]
  assign insd_io_csr_priv = csr_io_id_priv; // @[cpu.scala 155:21:@2870.4]
  assign insd_io_csr_from_ex_valid = exec_io_wcsr_valid; // @[cpu.scala 151:25:@2866.4]
  assign insd_io_csr_from_ex_csr_idx = exec_io_wcsr_csr_idx; // @[cpu.scala 151:25:@2865.4]
  assign insd_io_csr_from_ex_csr_data = exec_io_wcsr_csr_data; // @[cpu.scala 151:25:@2864.4]
  assign insd_io_csr_from_mem_valid = ex_mem_io_csr_wb_o_valid; // @[cpu.scala 152:26:@2869.4]
  assign insd_io_csr_from_mem_csr_idx = ex_mem_io_csr_wb_o_csr_idx; // @[cpu.scala 152:26:@2868.4]
  assign insd_io_csr_from_mem_csr_data = ex_mem_io_csr_wb_o_csr_data; // @[cpu.scala 152:26:@2867.4]
  assign insd_io_exWrReg_wbrv = exec_io_wreg_wbrv; // @[cpu.scala 69:22:@2742.4]
  assign insd_io_exWrReg_wbri = exec_io_wreg_wbri; // @[cpu.scala 69:22:@2741.4]
  assign insd_io_exWrReg_wbrd = exec_io_wreg_wbrd; // @[cpu.scala 69:22:@2740.4]
  assign insd_io_memWrReg_wbrv = memc_io_wreg_wbrv; // @[cpu.scala 70:22:@2745.4]
  assign insd_io_memWrReg_wbri = memc_io_wreg_wbri; // @[cpu.scala 70:22:@2744.4]
  assign insd_io_memWrReg_wbrd = memc_io_wreg_wbrd; // @[cpu.scala 70:22:@2743.4]
  assign insd_io_if_excep_valid = if_id_io_excep_o_valid; // @[cpu.scala 99:26:@2779.4]
  assign insd_io_if_excep_code = if_id_io_excep_o_code; // @[cpu.scala 99:26:@2778.4]
  assign insd_io_if_excep_value = if_id_io_excep_o_value; // @[cpu.scala 99:26:@2777.4]
  assign insd_io_if_excep_pc = if_id_io_excep_o_pc; // @[cpu.scala 99:26:@2776.4]
  assign insd_io_if_excep_inst_valid = if_id_io_excep_o_inst_valid; // @[cpu.scala 99:26:@2775.4]
  assign exec_io_imm = id_ex_io_immo; // @[cpu.scala 116:21:@2803.4]
  assign exec_io_ALUOp = id_ex_io_ALUOpo; // @[cpu.scala 117:21:@2804.4]
  assign exec_io_pc = id_ex_io_pco; // @[cpu.scala 119:21:@2806.4]
  assign exec_io_exe_type = id_ex_io_exeto; // @[cpu.scala 118:21:@2805.4]
  assign exec_io_op32 = id_ex_io_op32o; // @[cpu.scala 121:21:@2813.4]
  assign exec_io_dreg_rs2_valid = id_ex_io_drego_rs2_valid; // @[cpu.scala 120:21:@2811.4]
  assign exec_io_dreg_rs1_value = id_ex_io_drego_rs1_value; // @[cpu.scala 120:21:@2810.4]
  assign exec_io_dreg_rs2_value = id_ex_io_drego_rs2_value; // @[cpu.scala 120:21:@2809.4]
  assign exec_io_dreg_rd_valid = id_ex_io_drego_rd_valid; // @[cpu.scala 120:21:@2808.4]
  assign exec_io_dreg_rd_index = id_ex_io_drego_rd_index; // @[cpu.scala 120:21:@2807.4]
  assign exec_io_csr_op_valid = id_ex_io_csr_wb_o_valid; // @[cpu.scala 122:24:@2816.4]
  assign exec_io_csr_op_csr_idx = id_ex_io_csr_wb_o_csr_idx; // @[cpu.scala 122:24:@2815.4]
  assign exec_io_csr_op_csr_data = id_ex_io_csr_wb_o_csr_data; // @[cpu.scala 122:24:@2814.4]
  assign exec_io_id_excep_valid = id_ex_io_excep_o_valid; // @[cpu.scala 123:24:@2821.4]
  assign exec_io_id_excep_code = id_ex_io_excep_o_code; // @[cpu.scala 123:24:@2820.4]
  assign exec_io_id_excep_value = id_ex_io_excep_o_value; // @[cpu.scala 123:24:@2819.4]
  assign exec_io_id_excep_pc = id_ex_io_excep_o_pc; // @[cpu.scala 123:24:@2818.4]
  assign exec_io_id_excep_inst_valid = id_ex_io_excep_o_inst_valid; // @[cpu.scala 123:24:@2817.4]
  assign memc_io_nls = ex_mem_io_nlso; // @[cpu.scala 136:21:@2840.4]
  assign memc_io_lsm = ex_mem_io_lsmo; // @[cpu.scala 138:21:@2844.4]
  assign memc_io_addr = ex_mem_io_addro; // @[cpu.scala 139:21:@2845.4]
  assign memc_io_data = ex_mem_io_datao; // @[cpu.scala 140:21:@2846.4]
  assign memc_io_ereg_wbrv = ex_mem_io_wrego_wbrv; // @[cpu.scala 137:21:@2843.4]
  assign memc_io_ereg_wbri = ex_mem_io_wrego_wbri; // @[cpu.scala 137:21:@2842.4]
  assign memc_io_ereg_wbrd = ex_mem_io_wrego_wbrd; // @[cpu.scala 137:21:@2841.4]
  assign memc_io_mem_ready = mmu_io_mem_ready; // @[cpu.scala 57:20:@2711.4]
  assign memc_io_mem_rdata = mmu_io_mem_rdata; // @[cpu.scala 57:20:@2709.4]
  assign memc_io_excep_valid = ex_mem_io_excep_o_valid; // @[cpu.scala 142:24:@2854.4]
  assign memc_io_excep_code = ex_mem_io_excep_o_code; // @[cpu.scala 142:24:@2853.4]
  assign memc_io_excep_value = ex_mem_io_excep_o_value; // @[cpu.scala 142:24:@2852.4]
  assign memc_io_excep_pc = ex_mem_io_excep_o_pc; // @[cpu.scala 142:24:@2851.4]
  assign memc_io_excep_inst_valid = ex_mem_io_excep_o_inst_valid; // @[cpu.scala 142:24:@2850.4]
  assign memc_io_csr_wb_valid = ex_mem_io_csr_wb_o_valid; // @[cpu.scala 141:24:@2849.4]
  assign memc_io_csr_wb_csr_idx = ex_mem_io_csr_wb_o_csr_idx; // @[cpu.scala 141:24:@2848.4]
  assign memc_io_csr_wb_csr_data = ex_mem_io_csr_wb_o_csr_data; // @[cpu.scala 141:24:@2847.4]
  assign memc_io_inter_valid = ex_mem_io_inter_o_valid; // @[cpu.scala 143:24:@2856.4]
  assign memc_io_inter_bits = ex_mem_io_inter_o_bits; // @[cpu.scala 143:24:@2855.4]
  assign wrbk_io_wreg_wbrv = mem_wb_io_wrego_wbrv; // @[cpu.scala 148:21:@2863.4]
  assign wrbk_io_wreg_wbri = mem_wb_io_wrego_wbri; // @[cpu.scala 148:21:@2862.4]
  assign wrbk_io_wreg_wbrd = mem_wb_io_wrego_wbrd; // @[cpu.scala 148:21:@2861.4]
  assign regc_clock = clock; // @[:@2661.4]
  assign regc_io_r_r1 = insd_io_regr_r1; // @[cpu.scala 65:19:@2736.4]
  assign regc_io_r_r2 = insd_io_regr_r2; // @[cpu.scala 65:19:@2735.4]
  assign regc_io_w_wen = wrbk_io_reg_wen; // @[cpu.scala 66:19:@2739.4]
  assign regc_io_w_w = wrbk_io_reg_w; // @[cpu.scala 66:19:@2738.4]
  assign regc_io_w_wd = wrbk_io_reg_wd; // @[cpu.scala 66:19:@2737.4]
  assign regc_io_pass = memc_io_ready; // @[cpu.scala 83:20:@2756.4]
  assign mmu_clock = clock; // @[:@2664.4]
  assign mmu_reset = reset; // @[:@2665.4]
  assign mmu_io_mem_mode = memc_io_mem_mode; // @[cpu.scala 57:20:@2712.4]
  assign mmu_io_mem_addr = memc_io_mem_addr; // @[cpu.scala 57:20:@2710.4]
  assign mmu_io_mem_wdata = memc_io_mem_wdata; // @[cpu.scala 57:20:@2708.4]
  assign mmu_io_insr_mode = insr_io_mmu_mode; // @[cpu.scala 54:20:@2700.4]
  assign mmu_io_insr_addr = insr_io_mmu_addr; // @[cpu.scala 54:20:@2698.4]
  assign mmu_io_insr_rst = insr_io_mmu_if_rst; // @[cpu.scala 55:25:@2701.4]
  assign mmu_io_csr_priv = csr_io_mmu_priv; // @[cpu.scala 61:20:@2730.4]
  assign mmu_io_csr_mxr = csr_io_mmu_mxr; // @[cpu.scala 61:20:@2729.4]
  assign mmu_io_csr_sum = csr_io_mmu_sum; // @[cpu.scala 61:20:@2728.4]
  assign mmu_io_if_iom_ready = iomn_io_mem_if_ready; // @[cpu.scala 56:20:@2705.4]
  assign mmu_io_if_iom_rdata = iomn_io_mem_if_rdata; // @[cpu.scala 56:20:@2703.4]
  assign mmu_io_mem_iom_ready = iomn_io_mem_mem_ready; // @[cpu.scala 58:20:@2716.4]
  assign mmu_io_mem_iom_rdata = iomn_io_mem_mem_rdata; // @[cpu.scala 58:20:@2714.4]
  assign iomn_clock = clock; // @[:@2667.4]
  assign iomn_reset = reset; // @[:@2668.4]
  assign iomn_io_mem_if_mode = mmu_io_if_iom_mode; // @[cpu.scala 56:20:@2706.4]
  assign iomn_io_mem_if_addr = mmu_io_if_iom_addr; // @[cpu.scala 56:20:@2704.4]
  assign iomn_io_mem_mem_mode = mmu_io_mem_iom_mode; // @[cpu.scala 58:20:@2717.4]
  assign iomn_io_mem_mem_addr = mmu_io_mem_iom_addr; // @[cpu.scala 58:20:@2715.4]
  assign iomn_io_mem_mem_wdata = mmu_io_mem_iom_wdata; // @[cpu.scala 58:20:@2713.4]
  assign iomn_io_mem_out_ready = io_mem_ready; // @[cpu.scala 59:20:@2721.4]
  assign iomn_io_mem_out_rdata = io_mem_rdata; // @[cpu.scala 59:20:@2719.4]
  assign iomn_io_serial_out_ready = io_serial_ready; // @[cpu.scala 60:20:@2726.4]
  assign iomn_io_serial_out_rdata = io_serial_rdata; // @[cpu.scala 60:20:@2724.4]
  assign if_id_clock = clock; // @[:@2670.4]
  assign if_id_reset = reset; // @[:@2671.4]
  assign if_id_io_en = io_en; // @[cpu.scala 86:20:@2757.4]
  assign if_id_io_pass = memc_io_ready; // @[cpu.scala 79:20:@2752.4]
  assign if_id_io_flush = csr_io_flush; // @[cpu.scala 161:21:@2883.4]
  assign if_id_io_insi = insr_io_ins; // @[cpu.scala 89:20:@2760.4]
  assign if_id_io_pci = insr_io_pc; // @[cpu.scala 90:20:@2761.4]
  assign if_id_io_insci = insr_io_insn; // @[cpu.scala 87:20:@2758.4]
  assign if_id_io_icdi = insr_io_insnd; // @[cpu.scala 88:20:@2759.4]
  assign if_id_io_lastloadin_valid = insd_io_loadinfo_valid; // @[cpu.scala 91:25:@2763.4]
  assign if_id_io_lastloadin_index = insd_io_loadinfo_index; // @[cpu.scala 91:25:@2762.4]
  assign if_id_io_excep_i_pc = insr_io_excep_pc; // @[cpu.scala 92:25:@2765.4]
  assign if_id_io_excep_i_inst_valid = insr_io_excep_inst_valid; // @[cpu.scala 92:25:@2764.4]
  assign id_ex_clock = clock; // @[:@2673.4]
  assign id_ex_reset = reset; // @[:@2674.4]
  assign id_ex_io_en = io_en; // @[cpu.scala 102:21:@2780.4]
  assign id_ex_io_bid = insd_io_bubble; // @[cpu.scala 103:21:@2781.4]
  assign id_ex_io_bex = exec_io_jump; // @[cpu.scala 104:21:@2782.4]
  assign id_ex_io_flush = csr_io_flush; // @[cpu.scala 162:21:@2884.4]
  assign id_ex_io_pass = memc_io_ready; // @[cpu.scala 80:20:@2753.4]
  assign id_ex_io_immi = insd_io_imm; // @[cpu.scala 106:21:@2783.4]
  assign id_ex_io_ALUOpi = insd_io_ALUOp; // @[cpu.scala 107:21:@2784.4]
  assign id_ex_io_exeti = insd_io_exe_type; // @[cpu.scala 108:21:@2785.4]
  assign id_ex_io_pci = if_id_io_pco; // @[cpu.scala 109:21:@2786.4]
  assign id_ex_io_lsmi = insd_io_ls_mode; // @[cpu.scala 111:21:@2793.4]
  assign id_ex_io_op32i = insd_io_op32; // @[cpu.scala 112:21:@2794.4]
  assign id_ex_io_csr_wb_i_valid = insd_io_csr_content_valid; // @[cpu.scala 113:24:@2797.4]
  assign id_ex_io_csr_wb_i_csr_idx = insd_io_csr_content_csr_idx; // @[cpu.scala 113:24:@2796.4]
  assign id_ex_io_csr_wb_i_csr_data = insd_io_csr_content_csr_data; // @[cpu.scala 113:24:@2795.4]
  assign id_ex_io_dregi_rs2_valid = insd_io_dreg_rs2_valid; // @[cpu.scala 110:21:@2791.4]
  assign id_ex_io_dregi_rs1_value = insd_io_dreg_rs1_value; // @[cpu.scala 110:21:@2790.4]
  assign id_ex_io_dregi_rs2_value = insd_io_dreg_rs2_value; // @[cpu.scala 110:21:@2789.4]
  assign id_ex_io_dregi_rd_valid = insd_io_dreg_rd_valid; // @[cpu.scala 110:21:@2788.4]
  assign id_ex_io_dregi_rd_index = insd_io_dreg_rd_index; // @[cpu.scala 110:21:@2787.4]
  assign id_ex_io_excep_i_valid = insd_io_ex_excep_valid; // @[cpu.scala 114:24:@2802.4]
  assign id_ex_io_excep_i_code = insd_io_ex_excep_code; // @[cpu.scala 114:24:@2801.4]
  assign id_ex_io_excep_i_value = insd_io_ex_excep_value; // @[cpu.scala 114:24:@2800.4]
  assign id_ex_io_excep_i_pc = insd_io_ex_excep_pc; // @[cpu.scala 114:24:@2799.4]
  assign id_ex_io_excep_i_inst_valid = insd_io_ex_excep_inst_valid; // @[cpu.scala 114:24:@2798.4]
  assign ex_mem_clock = clock; // @[:@2676.4]
  assign ex_mem_reset = reset; // @[:@2677.4]
  assign ex_mem_io_en = io_en; // @[cpu.scala 126:21:@2822.4]
  assign ex_mem_io_pass = memc_io_ready; // @[cpu.scala 81:20:@2754.4]
  assign ex_mem_io_flush = csr_io_flush; // @[cpu.scala 163:21:@2885.4]
  assign ex_mem_io_nlsi = exec_io_nls; // @[cpu.scala 128:21:@2824.4]
  assign ex_mem_io_lsmi = id_ex_io_lsmo; // @[cpu.scala 127:21:@2823.4]
  assign ex_mem_io_addri = exec_io_addr; // @[cpu.scala 130:21:@2828.4]
  assign ex_mem_io_datai = exec_io_data; // @[cpu.scala 131:21:@2829.4]
  assign ex_mem_io_wregi_wbrv = exec_io_wreg_wbrv; // @[cpu.scala 129:21:@2827.4]
  assign ex_mem_io_wregi_wbri = exec_io_wreg_wbri; // @[cpu.scala 129:21:@2826.4]
  assign ex_mem_io_wregi_wbrd = exec_io_wreg_wbrd; // @[cpu.scala 129:21:@2825.4]
  assign ex_mem_io_csr_wb_i_valid = exec_io_wcsr_valid; // @[cpu.scala 132:24:@2832.4]
  assign ex_mem_io_csr_wb_i_csr_idx = exec_io_wcsr_csr_idx; // @[cpu.scala 132:24:@2831.4]
  assign ex_mem_io_csr_wb_i_csr_data = exec_io_wcsr_csr_data; // @[cpu.scala 132:24:@2830.4]
  assign ex_mem_io_excep_i_valid = exec_io_mem_excep_valid; // @[cpu.scala 133:24:@2837.4]
  assign ex_mem_io_excep_i_code = exec_io_mem_excep_code; // @[cpu.scala 133:24:@2836.4]
  assign ex_mem_io_excep_i_value = exec_io_mem_excep_value; // @[cpu.scala 133:24:@2835.4]
  assign ex_mem_io_excep_i_pc = exec_io_mem_excep_pc; // @[cpu.scala 133:24:@2834.4]
  assign ex_mem_io_excep_i_inst_valid = exec_io_mem_excep_inst_valid; // @[cpu.scala 133:24:@2833.4]
  assign ex_mem_io_inter_i_valid = csr_io_inter_valid; // @[cpu.scala 134:24:@2839.4]
  assign ex_mem_io_inter_i_bits = csr_io_inter_bits; // @[cpu.scala 134:24:@2838.4]
  assign mem_wb_clock = clock; // @[:@2679.4]
  assign mem_wb_reset = reset; // @[:@2680.4]
  assign mem_wb_io_en = io_en; // @[cpu.scala 146:21:@2857.4]
  assign mem_wb_io_pass = memc_io_ready; // @[cpu.scala 82:20:@2755.4]
  assign mem_wb_io_wregi_wbrv = memc_io_wreg_wbrv; // @[cpu.scala 147:21:@2860.4]
  assign mem_wb_io_wregi_wbri = memc_io_wreg_wbri; // @[cpu.scala 147:21:@2859.4]
  assign mem_wb_io_wregi_wbrd = memc_io_wreg_wbrd; // @[cpu.scala 147:21:@2858.4]
  assign csr_clock = clock; // @[:@2682.4]
  assign csr_reset = reset; // @[:@2683.4]
  assign csr_io_id_addr = insd_io_csr_addr; // @[cpu.scala 155:21:@2872.4]
  assign csr_io_mem_wrCSROp_valid = memc_io_csr_wrCSROp_valid; // @[cpu.scala 156:21:@2880.4]
  assign csr_io_mem_wrCSROp_csr_idx = memc_io_csr_wrCSROp_csr_idx; // @[cpu.scala 156:21:@2879.4]
  assign csr_io_mem_wrCSROp_csr_data = memc_io_csr_wrCSROp_csr_data; // @[cpu.scala 156:21:@2878.4]
  assign csr_io_mem_excep_valid = memc_io_csr_excep_valid; // @[cpu.scala 156:21:@2877.4]
  assign csr_io_mem_excep_code = memc_io_csr_excep_code; // @[cpu.scala 156:21:@2876.4]
  assign csr_io_mem_excep_value = memc_io_csr_excep_value; // @[cpu.scala 156:21:@2875.4]
  assign csr_io_mem_excep_pc = memc_io_csr_excep_pc; // @[cpu.scala 156:21:@2874.4]
  assign csr_io_mem_excep_inst_valid = memc_io_csr_excep_inst_valid; // @[cpu.scala 156:21:@2873.4]
endmodule
