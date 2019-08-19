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
endmodule
module ALU( // @[:@444.2]
  input  [3:0]  io_ALUOp, // @[:@447.4]
  input         io_op32, // @[:@447.4]
  input  [63:0] io_inputA, // @[:@447.4]
  input  [63:0] io_inputB, // @[:@447.4]
  output [63:0] io_output // @[:@447.4]
);
  wire [5:0] shamt; // @[alu.scala 32:26:@449.4]
  wire [4:0] shamt32; // @[alu.scala 33:28:@450.4]
  wire [31:0] inputA32; // @[alu.scala 34:29:@451.4]
  wire [31:0] inputB32; // @[alu.scala 35:29:@452.4]
  wire [32:0] _T_16; // @[alu.scala 40:39:@453.4]
  wire [31:0] _T_17; // @[alu.scala 40:39:@454.4]
  wire [62:0] _GEN_0; // @[alu.scala 41:39:@455.4]
  wire [62:0] _T_18; // @[alu.scala 41:39:@455.4]
  wire [31:0] _T_19; // @[alu.scala 42:38:@456.4]
  wire [31:0] _T_20; // @[alu.scala 43:40:@457.4]
  wire [31:0] _T_21; // @[alu.scala 43:47:@458.4]
  wire [31:0] _T_22; // @[alu.scala 43:59:@459.4]
  wire [32:0] _T_23; // @[alu.scala 44:39:@460.4]
  wire [32:0] _T_24; // @[alu.scala 44:39:@461.4]
  wire [31:0] _T_25; // @[alu.scala 44:39:@462.4]
  wire  _T_26; // @[Mux.scala 46:19:@463.4]
  wire [31:0] _T_27; // @[Mux.scala 46:16:@464.4]
  wire  _T_28; // @[Mux.scala 46:19:@465.4]
  wire [31:0] _T_29; // @[Mux.scala 46:16:@466.4]
  wire  _T_30; // @[Mux.scala 46:19:@467.4]
  wire [31:0] _T_31; // @[Mux.scala 46:16:@468.4]
  wire  _T_32; // @[Mux.scala 46:19:@469.4]
  wire [62:0] _T_33; // @[Mux.scala 46:16:@470.4]
  wire  _T_34; // @[Mux.scala 46:19:@471.4]
  wire [62:0] op32res; // @[Mux.scala 46:16:@472.4]
  wire  _T_35; // @[alu.scala 48:29:@473.4]
  wire [31:0] _T_39; // @[Bitwise.scala 72:12:@475.4]
  wire [31:0] _T_40; // @[alu.scala 48:43:@476.4]
  wire [63:0] _T_41; // @[Cat.scala 30:58:@477.4]
  wire [64:0] _T_44; // @[alu.scala 56:44:@478.4]
  wire [63:0] _T_45; // @[alu.scala 56:44:@479.4]
  wire [63:0] _T_46; // @[alu.scala 57:44:@480.4]
  wire [63:0] _T_47; // @[alu.scala 58:43:@481.4]
  wire [63:0] _T_48; // @[alu.scala 59:44:@482.4]
  wire  _T_49; // @[alu.scala 60:46:@483.4]
  wire [63:0] _T_50; // @[alu.scala 61:45:@484.4]
  wire [63:0] _T_51; // @[alu.scala 61:64:@485.4]
  wire  _T_52; // @[alu.scala 61:52:@486.4]
  wire [126:0] _GEN_1; // @[alu.scala 62:44:@487.4]
  wire [126:0] _T_53; // @[alu.scala 62:44:@487.4]
  wire [63:0] _T_54; // @[alu.scala 63:43:@488.4]
  wire [63:0] _T_56; // @[alu.scala 64:52:@490.4]
  wire [63:0] _T_57; // @[alu.scala 64:62:@491.4]
  wire [64:0] _T_58; // @[alu.scala 65:44:@492.4]
  wire [64:0] _T_59; // @[alu.scala 65:44:@493.4]
  wire [63:0] _T_60; // @[alu.scala 65:44:@494.4]
  wire [63:0] _T_61; // @[alu.scala 66:34:@495.4]
  wire [63:0] _T_62; // @[alu.scala 66:45:@496.4]
  wire  _T_63; // @[Mux.scala 46:19:@497.4]
  wire [63:0] _T_64; // @[Mux.scala 46:16:@498.4]
  wire [63:0] _T_66; // @[Mux.scala 46:16:@500.4]
  wire [63:0] _T_68; // @[Mux.scala 46:16:@502.4]
  wire [63:0] _T_70; // @[Mux.scala 46:16:@504.4]
  wire [126:0] _T_72; // @[Mux.scala 46:16:@506.4]
  wire  _T_73; // @[Mux.scala 46:19:@507.4]
  wire [126:0] _T_74; // @[Mux.scala 46:16:@508.4]
  wire  _T_75; // @[Mux.scala 46:19:@509.4]
  wire [126:0] _T_76; // @[Mux.scala 46:16:@510.4]
  wire  _T_77; // @[Mux.scala 46:19:@511.4]
  wire [126:0] _T_78; // @[Mux.scala 46:16:@512.4]
  wire  _T_79; // @[Mux.scala 46:19:@513.4]
  wire [126:0] _T_80; // @[Mux.scala 46:16:@514.4]
  wire  _T_81; // @[Mux.scala 46:19:@515.4]
  wire [126:0] _T_82; // @[Mux.scala 46:16:@516.4]
  wire [126:0] _T_84; // @[Mux.scala 46:16:@518.4]
  wire  _T_85; // @[Mux.scala 46:19:@519.4]
  wire [126:0] _T_86; // @[Mux.scala 46:16:@520.4]
  wire  _T_87; // @[Mux.scala 46:19:@521.4]
  wire [126:0] _T_88; // @[Mux.scala 46:16:@522.4]
  wire  _T_89; // @[Mux.scala 46:19:@523.4]
  wire [126:0] _T_90; // @[Mux.scala 46:16:@524.4]
  wire [126:0] _T_91; // @[alu.scala 47:21:@525.4]
  assign shamt = io_inputB[5:0]; // @[alu.scala 32:26:@449.4]
  assign shamt32 = io_inputB[4:0]; // @[alu.scala 33:28:@450.4]
  assign inputA32 = io_inputA[31:0]; // @[alu.scala 34:29:@451.4]
  assign inputB32 = io_inputB[31:0]; // @[alu.scala 35:29:@452.4]
  assign _T_16 = inputA32 + inputB32; // @[alu.scala 40:39:@453.4]
  assign _T_17 = inputA32 + inputB32; // @[alu.scala 40:39:@454.4]
  assign _GEN_0 = {{31'd0}, inputA32}; // @[alu.scala 41:39:@455.4]
  assign _T_18 = _GEN_0 << shamt32; // @[alu.scala 41:39:@455.4]
  assign _T_19 = inputA32 >> shamt32; // @[alu.scala 42:38:@456.4]
  assign _T_20 = $signed(inputA32); // @[alu.scala 43:40:@457.4]
  assign _T_21 = $signed(_T_20) >>> shamt32; // @[alu.scala 43:47:@458.4]
  assign _T_22 = $unsigned(_T_21); // @[alu.scala 43:59:@459.4]
  assign _T_23 = inputA32 - inputB32; // @[alu.scala 44:39:@460.4]
  assign _T_24 = $unsigned(_T_23); // @[alu.scala 44:39:@461.4]
  assign _T_25 = _T_24[31:0]; // @[alu.scala 44:39:@462.4]
  assign _T_26 = 4'hb == io_ALUOp; // @[Mux.scala 46:19:@463.4]
  assign _T_27 = _T_26 ? _T_25 : 32'h0; // @[Mux.scala 46:16:@464.4]
  assign _T_28 = 4'ha == io_ALUOp; // @[Mux.scala 46:19:@465.4]
  assign _T_29 = _T_28 ? _T_22 : _T_27; // @[Mux.scala 46:16:@466.4]
  assign _T_30 = 4'h9 == io_ALUOp; // @[Mux.scala 46:19:@467.4]
  assign _T_31 = _T_30 ? _T_19 : _T_29; // @[Mux.scala 46:16:@468.4]
  assign _T_32 = 4'h8 == io_ALUOp; // @[Mux.scala 46:19:@469.4]
  assign _T_33 = _T_32 ? _T_18 : {{31'd0}, _T_31}; // @[Mux.scala 46:16:@470.4]
  assign _T_34 = 4'h3 == io_ALUOp; // @[Mux.scala 46:19:@471.4]
  assign op32res = _T_34 ? {{31'd0}, _T_17} : _T_33; // @[Mux.scala 46:16:@472.4]
  assign _T_35 = op32res[31]; // @[alu.scala 48:29:@473.4]
  assign _T_39 = _T_35 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12:@475.4]
  assign _T_40 = op32res[31:0]; // @[alu.scala 48:43:@476.4]
  assign _T_41 = {_T_39,_T_40}; // @[Cat.scala 30:58:@477.4]
  assign _T_44 = io_inputA + io_inputB; // @[alu.scala 56:44:@478.4]
  assign _T_45 = io_inputA + io_inputB; // @[alu.scala 56:44:@479.4]
  assign _T_46 = io_inputA & io_inputB; // @[alu.scala 57:44:@480.4]
  assign _T_47 = io_inputA | io_inputB; // @[alu.scala 58:43:@481.4]
  assign _T_48 = io_inputA ^ io_inputB; // @[alu.scala 59:44:@482.4]
  assign _T_49 = io_inputA < io_inputB; // @[alu.scala 60:46:@483.4]
  assign _T_50 = $signed(io_inputA); // @[alu.scala 61:45:@484.4]
  assign _T_51 = $signed(io_inputB); // @[alu.scala 61:64:@485.4]
  assign _T_52 = $signed(_T_50) < $signed(_T_51); // @[alu.scala 61:52:@486.4]
  assign _GEN_1 = {{63'd0}, io_inputA}; // @[alu.scala 62:44:@487.4]
  assign _T_53 = _GEN_1 << shamt; // @[alu.scala 62:44:@487.4]
  assign _T_54 = io_inputA >> shamt; // @[alu.scala 63:43:@488.4]
  assign _T_56 = $signed(_T_50) >>> shamt; // @[alu.scala 64:52:@490.4]
  assign _T_57 = $unsigned(_T_56); // @[alu.scala 64:62:@491.4]
  assign _T_58 = io_inputA - io_inputB; // @[alu.scala 65:44:@492.4]
  assign _T_59 = $unsigned(_T_58); // @[alu.scala 65:44:@493.4]
  assign _T_60 = _T_59[63:0]; // @[alu.scala 65:44:@494.4]
  assign _T_61 = ~ io_inputA; // @[alu.scala 66:34:@495.4]
  assign _T_62 = _T_61 & io_inputB; // @[alu.scala 66:45:@496.4]
  assign _T_63 = 4'hd == io_ALUOp; // @[Mux.scala 46:19:@497.4]
  assign _T_64 = _T_63 ? _T_62 : 64'h0; // @[Mux.scala 46:16:@498.4]
  assign _T_66 = _T_26 ? _T_60 : _T_64; // @[Mux.scala 46:16:@500.4]
  assign _T_68 = _T_28 ? _T_57 : _T_66; // @[Mux.scala 46:16:@502.4]
  assign _T_70 = _T_30 ? _T_54 : _T_68; // @[Mux.scala 46:16:@504.4]
  assign _T_72 = _T_32 ? _T_53 : {{63'd0}, _T_70}; // @[Mux.scala 46:16:@506.4]
  assign _T_73 = 4'h7 == io_ALUOp; // @[Mux.scala 46:19:@507.4]
  assign _T_74 = _T_73 ? {{126'd0}, _T_52} : _T_72; // @[Mux.scala 46:16:@508.4]
  assign _T_75 = 4'hc == io_ALUOp; // @[Mux.scala 46:19:@509.4]
  assign _T_76 = _T_75 ? {{126'd0}, _T_49} : _T_74; // @[Mux.scala 46:16:@510.4]
  assign _T_77 = 4'h6 == io_ALUOp; // @[Mux.scala 46:19:@511.4]
  assign _T_78 = _T_77 ? {{63'd0}, _T_48} : _T_76; // @[Mux.scala 46:16:@512.4]
  assign _T_79 = 4'h5 == io_ALUOp; // @[Mux.scala 46:19:@513.4]
  assign _T_80 = _T_79 ? {{63'd0}, _T_47} : _T_78; // @[Mux.scala 46:16:@514.4]
  assign _T_81 = 4'h4 == io_ALUOp; // @[Mux.scala 46:19:@515.4]
  assign _T_82 = _T_81 ? {{63'd0}, _T_46} : _T_80; // @[Mux.scala 46:16:@516.4]
  assign _T_84 = _T_34 ? {{63'd0}, _T_45} : _T_82; // @[Mux.scala 46:16:@518.4]
  assign _T_85 = 4'h2 == io_ALUOp; // @[Mux.scala 46:19:@519.4]
  assign _T_86 = _T_85 ? {{63'd0}, io_inputB} : _T_84; // @[Mux.scala 46:16:@520.4]
  assign _T_87 = 4'h1 == io_ALUOp; // @[Mux.scala 46:19:@521.4]
  assign _T_88 = _T_87 ? {{63'd0}, io_inputA} : _T_86; // @[Mux.scala 46:16:@522.4]
  assign _T_89 = 4'h0 == io_ALUOp; // @[Mux.scala 46:19:@523.4]
  assign _T_90 = _T_89 ? 127'h0 : _T_88; // @[Mux.scala 46:16:@524.4]
  assign _T_91 = io_op32 ? {{63'd0}, _T_41} : _T_90; // @[alu.scala 47:21:@525.4]
  assign io_output = _T_91[63:0]; // @[alu.scala 47:15:@526.4]
endmodule
module BranchCtrl( // @[:@530.2]
  input  [3:0]  io_exeType, // @[:@533.4]
  input  [63:0] io_input1, // @[:@533.4]
  input  [63:0] io_input2, // @[:@533.4]
  output        io_jump // @[:@533.4]
);
  wire [64:0] _T_13; // @[branch.scala 27:25:@535.4]
  wire [64:0] _T_14; // @[branch.scala 27:25:@536.4]
  wire [63:0] x; // @[branch.scala 27:25:@537.4]
  wire  ne; // @[branch.scala 28:17:@538.4]
  wire  eq; // @[branch.scala 29:15:@539.4]
  wire  _T_17; // @[branch.scala 30:24:@540.4]
  wire  _T_18; // @[branch.scala 30:42:@541.4]
  wire  st; // @[branch.scala 30:29:@542.4]
  wire  _T_19; // @[branch.scala 31:24:@543.4]
  wire  lt; // @[branch.scala 31:18:@545.4]
  wire  ge; // @[branch.scala 32:15:@546.4]
  wire  _T_23; // @[branch.scala 33:39:@548.4]
  wire  ltu; // @[branch.scala 33:18:@549.4]
  wire  geu; // @[branch.scala 34:15:@550.4]
  wire  _T_36; // @[Mux.scala 46:19:@551.4]
  wire  _T_38; // @[Mux.scala 46:19:@553.4]
  wire  _T_39; // @[Mux.scala 46:16:@554.4]
  wire  _T_40; // @[Mux.scala 46:19:@555.4]
  wire  _T_41; // @[Mux.scala 46:16:@556.4]
  wire  _T_42; // @[Mux.scala 46:19:@557.4]
  wire  _T_43; // @[Mux.scala 46:16:@558.4]
  wire  _T_44; // @[Mux.scala 46:19:@559.4]
  wire  _T_45; // @[Mux.scala 46:16:@560.4]
  wire  _T_46; // @[Mux.scala 46:19:@561.4]
  wire  _T_47; // @[Mux.scala 46:16:@562.4]
  wire  _T_48; // @[Mux.scala 46:19:@563.4]
  wire  _T_49; // @[Mux.scala 46:16:@564.4]
  wire  _T_50; // @[Mux.scala 46:19:@565.4]
  assign _T_13 = io_input1 - io_input2; // @[branch.scala 27:25:@535.4]
  assign _T_14 = $unsigned(_T_13); // @[branch.scala 27:25:@536.4]
  assign x = _T_14[63:0]; // @[branch.scala 27:25:@537.4]
  assign ne = x != 64'h0; // @[branch.scala 28:17:@538.4]
  assign eq = ne == 1'h0; // @[branch.scala 29:15:@539.4]
  assign _T_17 = io_input1[63]; // @[branch.scala 30:24:@540.4]
  assign _T_18 = io_input2[62]; // @[branch.scala 30:42:@541.4]
  assign st = _T_17 == _T_18; // @[branch.scala 30:29:@542.4]
  assign _T_19 = x[63]; // @[branch.scala 31:24:@543.4]
  assign lt = st ? _T_19 : _T_17; // @[branch.scala 31:18:@545.4]
  assign ge = lt == 1'h0; // @[branch.scala 32:15:@546.4]
  assign _T_23 = io_input2[63]; // @[branch.scala 33:39:@548.4]
  assign ltu = st ? _T_19 : _T_23; // @[branch.scala 33:18:@549.4]
  assign geu = ltu == 1'h0; // @[branch.scala 34:15:@550.4]
  assign _T_36 = 4'hf == io_exeType; // @[Mux.scala 46:19:@551.4]
  assign _T_38 = 4'he == io_exeType; // @[Mux.scala 46:19:@553.4]
  assign _T_39 = _T_38 ? geu : _T_36; // @[Mux.scala 46:16:@554.4]
  assign _T_40 = 4'hd == io_exeType; // @[Mux.scala 46:19:@555.4]
  assign _T_41 = _T_40 ? ltu : _T_39; // @[Mux.scala 46:16:@556.4]
  assign _T_42 = 4'hc == io_exeType; // @[Mux.scala 46:19:@557.4]
  assign _T_43 = _T_42 ? ge : _T_41; // @[Mux.scala 46:16:@558.4]
  assign _T_44 = 4'hb == io_exeType; // @[Mux.scala 46:19:@559.4]
  assign _T_45 = _T_44 ? lt : _T_43; // @[Mux.scala 46:16:@560.4]
  assign _T_46 = 4'ha == io_exeType; // @[Mux.scala 46:19:@561.4]
  assign _T_47 = _T_46 ? ne : _T_45; // @[Mux.scala 46:16:@562.4]
  assign _T_48 = 4'h9 == io_exeType; // @[Mux.scala 46:19:@563.4]
  assign _T_49 = _T_48 ? eq : _T_47; // @[Mux.scala 46:16:@564.4]
  assign _T_50 = 4'h8 == io_exeType; // @[Mux.scala 46:19:@565.4]
  assign io_jump = _T_50 ? 1'h1 : _T_49; // @[branch.scala 36:13:@567.4]
endmodule
module Branch( // @[:@569.2]
  input  [3:0]  io_exeType, // @[:@572.4]
  input  [63:0] io_input1, // @[:@572.4]
  input  [63:0] io_input2, // @[:@572.4]
  input  [63:0] io_pc, // @[:@572.4]
  input  [63:0] io_imm, // @[:@572.4]
  output        io_jump, // @[:@572.4]
  output [63:0] io_jdest // @[:@572.4]
);
  wire [3:0] bctrl_io_exeType; // @[branch.scala 64:23:@574.4]
  wire [63:0] bctrl_io_input1; // @[branch.scala 64:23:@574.4]
  wire [63:0] bctrl_io_input2; // @[branch.scala 64:23:@574.4]
  wire  bctrl_io_jump; // @[branch.scala 64:23:@574.4]
  wire  _T_19; // @[branch.scala 71:33:@581.4]
  wire [64:0] _T_20; // @[branch.scala 71:57:@582.4]
  wire [63:0] _T_21; // @[branch.scala 71:57:@583.4]
  wire [64:0] _T_22; // @[branch.scala 71:73:@584.4]
  wire [63:0] _T_23; // @[branch.scala 71:73:@585.4]
  BranchCtrl bctrl ( // @[branch.scala 64:23:@574.4]
    .io_exeType(bctrl_io_exeType),
    .io_input1(bctrl_io_input1),
    .io_input2(bctrl_io_input2),
    .io_jump(bctrl_io_jump)
  );
  assign _T_19 = io_exeType == 4'hf; // @[branch.scala 71:33:@581.4]
  assign _T_20 = io_input1 + io_imm; // @[branch.scala 71:57:@582.4]
  assign _T_21 = io_input1 + io_imm; // @[branch.scala 71:57:@583.4]
  assign _T_22 = io_pc + io_imm; // @[branch.scala 71:73:@584.4]
  assign _T_23 = io_pc + io_imm; // @[branch.scala 71:73:@585.4]
  assign io_jump = bctrl_io_jump; // @[branch.scala 69:26:@580.4]
  assign io_jdest = _T_19 ? _T_21 : _T_23; // @[branch.scala 71:14:@587.4]
  assign bctrl_io_exeType = io_exeType; // @[branch.scala 66:26:@577.4]
  assign bctrl_io_input1 = io_input1; // @[branch.scala 67:26:@578.4]
  assign bctrl_io_input2 = io_input2; // @[branch.scala 68:26:@579.4]
endmodule
module Execute( // @[:@589.2]
  input  [63:0] io_imm, // @[:@592.4]
  input  [3:0]  io_ALUOp, // @[:@592.4]
  input  [63:0] io_pc, // @[:@592.4]
  input  [3:0]  io_exe_type, // @[:@592.4]
  input         io_op32, // @[:@592.4]
  input         io_dreg_rs2_valid, // @[:@592.4]
  input  [63:0] io_dreg_rs1_value, // @[:@592.4]
  input  [63:0] io_dreg_rs2_value, // @[:@592.4]
  input         io_dreg_rd_valid, // @[:@592.4]
  input  [4:0]  io_dreg_rd_index, // @[:@592.4]
  output        io_nls, // @[:@592.4]
  output [63:0] io_addr, // @[:@592.4]
  output [63:0] io_data, // @[:@592.4]
  output        io_jump, // @[:@592.4]
  output [63:0] io_jdest, // @[:@592.4]
  output        io_wreg_wbrv, // @[:@592.4]
  output [4:0]  io_wreg_wbri, // @[:@592.4]
  output [63:0] io_wreg_wbrd, // @[:@592.4]
  output        io_wcsr_valid, // @[:@592.4]
  output [11:0] io_wcsr_csr_idx, // @[:@592.4]
  output [63:0] io_wcsr_csr_data, // @[:@592.4]
  input         io_csr_op_valid, // @[:@592.4]
  input  [11:0] io_csr_op_csr_idx, // @[:@592.4]
  input  [63:0] io_csr_op_csr_data, // @[:@592.4]
  input         io_id_excep_valid, // @[:@592.4]
  input  [31:0] io_id_excep_code, // @[:@592.4]
  input  [31:0] io_id_excep_value, // @[:@592.4]
  input  [63:0] io_id_excep_pc, // @[:@592.4]
  input         io_id_excep_inst_valid, // @[:@592.4]
  output        io_mem_excep_valid, // @[:@592.4]
  output [31:0] io_mem_excep_code, // @[:@592.4]
  output [31:0] io_mem_excep_value, // @[:@592.4]
  output [63:0] io_mem_excep_pc, // @[:@592.4]
  output        io_mem_excep_inst_valid // @[:@592.4]
);
  wire [3:0] alu_io_ALUOp; // @[execute.scala 30:21:@594.4]
  wire  alu_io_op32; // @[execute.scala 30:21:@594.4]
  wire [63:0] alu_io_inputA; // @[execute.scala 30:21:@594.4]
  wire [63:0] alu_io_inputB; // @[execute.scala 30:21:@594.4]
  wire [63:0] alu_io_output; // @[execute.scala 30:21:@594.4]
  wire [3:0] bra_io_exeType; // @[execute.scala 31:21:@597.4]
  wire [63:0] bra_io_input1; // @[execute.scala 31:21:@597.4]
  wire [63:0] bra_io_input2; // @[execute.scala 31:21:@597.4]
  wire [63:0] bra_io_pc; // @[execute.scala 31:21:@597.4]
  wire [63:0] bra_io_imm; // @[execute.scala 31:21:@597.4]
  wire  bra_io_jump; // @[execute.scala 31:21:@597.4]
  wire [63:0] bra_io_jdest; // @[execute.scala 31:21:@597.4]
  wire  _T_109; // @[execute.scala 33:38:@600.4]
  wire  _T_110; // @[execute.scala 37:38:@602.4]
  wire  _T_112; // @[execute.scala 37:50:@604.4]
  wire [63:0] _T_113; // @[execute.scala 39:14:@605.4]
  wire  nls; // @[execute.scala 41:28:@607.4]
  wire  _T_115; // @[execute.scala 42:36:@608.4]
  wire  _T_117; // @[execute.scala 44:43:@610.4]
  wire [64:0] _T_120; // @[execute.scala 44:69:@611.4]
  wire [63:0] _T_121; // @[execute.scala 44:69:@612.4]
  wire [63:0] _T_122; // @[execute.scala 44:25:@613.4]
  wire [64:0] _T_130; // @[execute.scala 47:30:@618.4]
  wire [63:0] _T_131; // @[execute.scala 47:30:@619.4]
  wire  _T_132; // @[Mux.scala 46:19:@620.4]
  wire [63:0] _T_133; // @[Mux.scala 46:16:@621.4]
  wire  _T_134; // @[Mux.scala 46:19:@622.4]
  wire [63:0] _T_135; // @[Mux.scala 46:16:@623.4]
  wire  _T_136; // @[Mux.scala 46:19:@624.4]
  wire [63:0] _T_137; // @[Mux.scala 46:16:@625.4]
  wire  _T_138; // @[Mux.scala 46:19:@626.4]
  wire [63:0] _T_139; // @[Mux.scala 46:16:@627.4]
  wire  _T_140; // @[Mux.scala 46:19:@628.4]
  wire [63:0] _T_141; // @[Mux.scala 46:16:@629.4]
  wire  _T_142; // @[Mux.scala 46:19:@630.4]
  wire [64:0] _T_143; // @[execute.scala 61:34:@639.4]
  ALU alu ( // @[execute.scala 30:21:@594.4]
    .io_ALUOp(alu_io_ALUOp),
    .io_op32(alu_io_op32),
    .io_inputA(alu_io_inputA),
    .io_inputB(alu_io_inputB),
    .io_output(alu_io_output)
  );
  Branch bra ( // @[execute.scala 31:21:@597.4]
    .io_exeType(bra_io_exeType),
    .io_input1(bra_io_input1),
    .io_input2(bra_io_input2),
    .io_pc(bra_io_pc),
    .io_imm(bra_io_imm),
    .io_jump(bra_io_jump),
    .io_jdest(bra_io_jdest)
  );
  assign _T_109 = io_exe_type == 4'h7; // @[execute.scala 33:38:@600.4]
  assign _T_110 = io_exe_type == 4'h6; // @[execute.scala 37:38:@602.4]
  assign _T_112 = _T_110 | _T_109; // @[execute.scala 37:50:@604.4]
  assign _T_113 = io_dreg_rs2_valid ? io_dreg_rs2_value : io_imm; // @[execute.scala 39:14:@605.4]
  assign nls = io_exe_type == 4'h2; // @[execute.scala 41:28:@607.4]
  assign _T_115 = nls == 1'h0; // @[execute.scala 42:36:@608.4]
  assign _T_117 = io_dreg_rd_index == 5'h0; // @[execute.scala 44:43:@610.4]
  assign _T_120 = io_pc + 64'h4; // @[execute.scala 44:69:@611.4]
  assign _T_121 = io_pc + 64'h4; // @[execute.scala 44:69:@612.4]
  assign _T_122 = _T_117 ? 64'h0 : _T_121; // @[execute.scala 44:25:@613.4]
  assign _T_130 = io_imm + io_pc; // @[execute.scala 47:30:@618.4]
  assign _T_131 = io_imm + io_pc; // @[execute.scala 47:30:@619.4]
  assign _T_132 = 4'h7 == io_exe_type; // @[Mux.scala 46:19:@620.4]
  assign _T_133 = _T_132 ? io_csr_op_csr_data : alu_io_output; // @[Mux.scala 46:16:@621.4]
  assign _T_134 = 4'h6 == io_exe_type; // @[Mux.scala 46:19:@622.4]
  assign _T_135 = _T_134 ? io_csr_op_csr_data : _T_133; // @[Mux.scala 46:16:@623.4]
  assign _T_136 = 4'h3 == io_exe_type; // @[Mux.scala 46:19:@624.4]
  assign _T_137 = _T_136 ? _T_131 : _T_135; // @[Mux.scala 46:16:@625.4]
  assign _T_138 = 4'h4 == io_exe_type; // @[Mux.scala 46:19:@626.4]
  assign _T_139 = _T_138 ? io_imm : _T_137; // @[Mux.scala 46:16:@627.4]
  assign _T_140 = 4'hf == io_exe_type; // @[Mux.scala 46:19:@628.4]
  assign _T_141 = _T_140 ? _T_122 : _T_139; // @[Mux.scala 46:16:@629.4]
  assign _T_142 = 4'h8 == io_exe_type; // @[Mux.scala 46:19:@630.4]
  assign _T_143 = io_dreg_rs1_value + io_imm; // @[execute.scala 61:34:@639.4]
  assign io_nls = io_exe_type == 4'h2; // @[execute.scala 72:12:@650.4]
  assign io_addr = io_dreg_rs1_value + io_imm; // @[execute.scala 61:13:@641.4]
  assign io_data = io_dreg_rs2_value; // @[execute.scala 62:13:@642.4]
  assign io_jump = bra_io_jump; // @[execute.scala 69:19:@648.4]
  assign io_jdest = bra_io_jdest; // @[execute.scala 70:19:@649.4]
  assign io_wreg_wbrv = io_dreg_rd_valid & _T_115; // @[execute.scala 57:19:@636.4]
  assign io_wreg_wbri = io_dreg_rd_index; // @[execute.scala 58:19:@637.4]
  assign io_wreg_wbrd = _T_142 ? _T_122 : _T_141; // @[execute.scala 59:19:@638.4]
  assign io_wcsr_valid = io_csr_op_valid; // @[execute.scala 74:19:@651.4]
  assign io_wcsr_csr_idx = io_csr_op_csr_idx; // @[execute.scala 75:21:@652.4]
  assign io_wcsr_csr_data = alu_io_output; // @[execute.scala 76:22:@653.4]
  assign io_mem_excep_valid = io_id_excep_valid; // @[execute.scala 78:18:@658.4]
  assign io_mem_excep_code = io_id_excep_code; // @[execute.scala 78:18:@657.4]
  assign io_mem_excep_value = io_id_excep_value; // @[execute.scala 78:18:@656.4]
  assign io_mem_excep_pc = io_id_excep_pc; // @[execute.scala 78:18:@655.4]
  assign io_mem_excep_inst_valid = io_id_excep_inst_valid; // @[execute.scala 78:18:@654.4]
  assign alu_io_ALUOp = io_ALUOp; // @[execute.scala 52:19:@632.4]
  assign alu_io_op32 = io_op32; // @[execute.scala 55:19:@635.4]
  assign alu_io_inputA = _T_109 ? io_imm : io_dreg_rs1_value; // @[execute.scala 53:19:@633.4]
  assign alu_io_inputB = _T_112 ? io_csr_op_csr_data : _T_113; // @[execute.scala 54:19:@634.4]
  assign bra_io_exeType = io_exe_type; // @[execute.scala 64:20:@643.4]
  assign bra_io_input1 = io_dreg_rs1_value; // @[execute.scala 65:20:@644.4]
  assign bra_io_input2 = io_dreg_rs2_value; // @[execute.scala 66:20:@645.4]
  assign bra_io_pc = io_pc; // @[execute.scala 67:20:@646.4]
  assign bra_io_imm = io_imm; // @[execute.scala 68:20:@647.4]
endmodule
module MemoryCtrl( // @[:@660.2]
  input         io_nls, // @[:@663.4]
  input  [3:0]  io_lsm, // @[:@663.4]
  input  [63:0] io_addr, // @[:@663.4]
  input  [63:0] io_data, // @[:@663.4]
  output        io_ready, // @[:@663.4]
  input         io_ereg_wbrv, // @[:@663.4]
  input  [4:0]  io_ereg_wbri, // @[:@663.4]
  input  [63:0] io_ereg_wbrd, // @[:@663.4]
  output        io_wreg_wbrv, // @[:@663.4]
  output [4:0]  io_wreg_wbri, // @[:@663.4]
  output [63:0] io_wreg_wbrd, // @[:@663.4]
  output [3:0]  io_mem_mode, // @[:@663.4]
  input         io_mem_ready, // @[:@663.4]
  output [63:0] io_mem_addr, // @[:@663.4]
  input  [63:0] io_mem_rdata, // @[:@663.4]
  output [63:0] io_mem_wdata, // @[:@663.4]
  input         io_excep_valid, // @[:@663.4]
  input  [31:0] io_excep_code, // @[:@663.4]
  input  [31:0] io_excep_value, // @[:@663.4]
  input  [63:0] io_excep_pc, // @[:@663.4]
  input         io_excep_inst_valid, // @[:@663.4]
  input         io_csr_wb_valid, // @[:@663.4]
  input  [11:0] io_csr_wb_csr_idx, // @[:@663.4]
  input  [63:0] io_csr_wb_csr_data, // @[:@663.4]
  output        io_csr_wrCSROp_valid, // @[:@663.4]
  output [11:0] io_csr_wrCSROp_csr_idx, // @[:@663.4]
  output [63:0] io_csr_wrCSROp_csr_data, // @[:@663.4]
  output        io_csr_excep_valid, // @[:@663.4]
  output [31:0] io_csr_excep_code, // @[:@663.4]
  output [31:0] io_csr_excep_value, // @[:@663.4]
  output [63:0] io_csr_excep_pc, // @[:@663.4]
  output        io_csr_excep_inst_valid, // @[:@663.4]
  input         io_inter_valid, // @[:@663.4]
  input  [31:0] io_inter_bits // @[:@663.4]
);
  wire  _T_135; // @[memoryCtrl.scala 53:21:@669.4]
  wire  _T_137; // @[memoryCtrl.scala 55:45:@672.4]
  wire  _T_138; // @[memoryCtrl.scala 55:67:@673.4]
  wire  _T_139; // @[memoryCtrl.scala 55:58:@674.4]
  assign _T_135 = io_nls == 1'h0; // @[memoryCtrl.scala 53:21:@669.4]
  assign _T_137 = io_lsm != 4'hf; // @[memoryCtrl.scala 55:45:@672.4]
  assign _T_138 = io_lsm[3]; // @[memoryCtrl.scala 55:67:@673.4]
  assign _T_139 = _T_137 & _T_138; // @[memoryCtrl.scala 55:58:@674.4]
  assign io_ready = _T_135 | io_mem_ready; // @[memoryCtrl.scala 53:18:@671.4]
  assign io_wreg_wbrv = io_ereg_wbrv | _T_139; // @[memoryCtrl.scala 55:18:@676.4]
  assign io_wreg_wbri = io_ereg_wbri; // @[memoryCtrl.scala 56:18:@677.4]
  assign io_wreg_wbrd = io_nls ? io_mem_rdata : io_ereg_wbrd; // @[memoryCtrl.scala 57:18:@679.4]
  assign io_mem_mode = io_nls ? io_lsm : 4'hf; // @[memoryCtrl.scala 49:18:@666.4]
  assign io_mem_addr = io_addr; // @[memoryCtrl.scala 50:17:@667.4]
  assign io_mem_wdata = io_data; // @[memoryCtrl.scala 51:18:@668.4]
  assign io_csr_wrCSROp_valid = io_csr_wb_valid; // @[memoryCtrl.scala 63:20:@684.4]
  assign io_csr_wrCSROp_csr_idx = io_csr_wb_csr_idx; // @[memoryCtrl.scala 63:20:@683.4]
  assign io_csr_wrCSROp_csr_data = io_csr_wb_csr_data; // @[memoryCtrl.scala 63:20:@682.4]
  assign io_csr_excep_valid = io_inter_valid ? 1'h1 : io_excep_valid; // @[memoryCtrl.scala 64:20:@689.4 memoryCtrl.scala 66:26:@691.6]
  assign io_csr_excep_code = io_inter_valid ? io_inter_bits : io_excep_code; // @[memoryCtrl.scala 64:20:@688.4 memoryCtrl.scala 67:26:@692.6]
  assign io_csr_excep_value = io_excep_value; // @[memoryCtrl.scala 64:20:@687.4]
  assign io_csr_excep_pc = io_excep_pc; // @[memoryCtrl.scala 64:20:@686.4]
  assign io_csr_excep_inst_valid = io_excep_inst_valid; // @[memoryCtrl.scala 64:20:@685.4]
endmodule
module WriteBack( // @[:@695.2]
  input         io_wreg_wbrv, // @[:@698.4]
  input  [4:0]  io_wreg_wbri, // @[:@698.4]
  input  [63:0] io_wreg_wbrd, // @[:@698.4]
  output        io_reg_wen, // @[:@698.4]
  output [4:0]  io_reg_w, // @[:@698.4]
  output [63:0] io_reg_wd // @[:@698.4]
);
  assign io_reg_wen = io_wreg_wbrv; // @[writeback.scala 12:16:@700.4]
  assign io_reg_w = io_wreg_wbri; // @[writeback.scala 13:16:@701.4]
  assign io_reg_wd = io_wreg_wbrd; // @[writeback.scala 14:16:@702.4]
endmodule
module RegCtrl( // @[:@704.2]
  input         clock, // @[:@705.4]
  input  [4:0]  io_r_r1, // @[:@707.4]
  input  [4:0]  io_r_r2, // @[:@707.4]
  output [63:0] io_r_r1d, // @[:@707.4]
  output [63:0] io_r_r2d, // @[:@707.4]
  input         io_w_wen, // @[:@707.4]
  input  [4:0]  io_w_w, // @[:@707.4]
  input  [63:0] io_w_wd, // @[:@707.4]
  input         io_pass // @[:@707.4]
);
  reg [63:0] regs [0:31]; // @[reg.scala 9:19:@709.4]
  reg [63:0] _RAND_0;
  wire [63:0] regs__T_25_data; // @[reg.scala 9:19:@709.4]
  wire [4:0] regs__T_25_addr; // @[reg.scala 9:19:@709.4]
  wire [63:0] regs__T_29_data; // @[reg.scala 9:19:@709.4]
  wire [4:0] regs__T_29_addr; // @[reg.scala 9:19:@709.4]
  wire [63:0] regs__T_35_data; // @[reg.scala 9:19:@709.4]
  wire [4:0] regs__T_35_addr; // @[reg.scala 9:19:@709.4]
  wire  regs__T_35_mask; // @[reg.scala 9:19:@709.4]
  wire  regs__T_35_en; // @[reg.scala 9:19:@709.4]
  wire  _T_23; // @[reg.scala 11:29:@710.4]
  wire  _T_24; // @[reg.scala 11:18:@711.4]
  wire  _T_27; // @[reg.scala 16:29:@715.4]
  wire  _T_28; // @[reg.scala 16:18:@716.4]
  wire  _T_32; // @[reg.scala 20:30:@720.4]
  wire  _T_33; // @[reg.scala 20:20:@721.4]
  assign regs__T_25_addr = io_r_r1;
  assign regs__T_25_data = regs[regs__T_25_addr]; // @[reg.scala 9:19:@709.4]
  assign regs__T_29_addr = io_r_r2;
  assign regs__T_29_data = regs[regs__T_29_addr]; // @[reg.scala 9:19:@709.4]
  assign regs__T_35_data = io_w_wd;
  assign regs__T_35_addr = io_w_w;
  assign regs__T_35_mask = 1'h1;
  assign regs__T_35_en = _T_33 & io_pass;
  assign _T_23 = io_r_r1 == io_w_w; // @[reg.scala 11:29:@710.4]
  assign _T_24 = io_w_wen & _T_23; // @[reg.scala 11:18:@711.4]
  assign _T_27 = io_r_r2 == io_w_w; // @[reg.scala 16:29:@715.4]
  assign _T_28 = io_w_wen & _T_27; // @[reg.scala 16:18:@716.4]
  assign _T_32 = io_w_w != 5'h0; // @[reg.scala 20:30:@720.4]
  assign _T_33 = io_w_wen & _T_32; // @[reg.scala 20:20:@721.4]
  assign io_r_r1d = _T_24 ? io_w_wd : regs__T_25_data; // @[reg.scala 10:14:@714.4]
  assign io_r_r2d = _T_28 ? io_w_wd : regs__T_29_data; // @[reg.scala 15:14:@719.4]
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
      regs[regs__T_35_addr] <= regs__T_35_data; // @[reg.scala 9:19:@709.4]
    end
  end
endmodule
module PTW( // @[:@728.2]
  input         clock, // @[:@729.4]
  input         reset, // @[:@730.4]
  input  [8:0]  io_root_p2, // @[:@731.4]
  input  [8:0]  io_root_p1, // @[:@731.4]
  input  [8:0]  io_root_p0, // @[:@731.4]
  input  [8:0]  io_req_p2, // @[:@731.4]
  input  [8:0]  io_req_p1, // @[:@731.4]
  input  [8:0]  io_req_p0, // @[:@731.4]
  input         io_req_valid, // @[:@731.4]
  output [8:0]  io_rsp_ppn_p2, // @[:@731.4]
  output [8:0]  io_rsp_ppn_p1, // @[:@731.4]
  output [8:0]  io_rsp_ppn_p0, // @[:@731.4]
  output        io_rsp_U, // @[:@731.4]
  output        io_rsp_X, // @[:@731.4]
  output        io_rsp_W, // @[:@731.4]
  output        io_rsp_R, // @[:@731.4]
  output        io_ready, // @[:@731.4]
  output        io_pf, // @[:@731.4]
  output [3:0]  io_mem_mode, // @[:@731.4]
  input         io_mem_ready, // @[:@731.4]
  output [63:0] io_mem_addr, // @[:@731.4]
  input  [63:0] io_mem_rdata // @[:@731.4]
);
  reg [1:0] wait_status; // @[PTW.scala 45:30:@733.4]
  reg [31:0] _RAND_0;
  reg [8:0] req_p1; // @[PTW.scala 48:23:@743.4]
  reg [31:0] _RAND_1;
  reg [8:0] req_p0; // @[PTW.scala 48:23:@743.4]
  reg [31:0] _RAND_2;
  reg  read; // @[PTW.scala 49:23:@744.4]
  reg [31:0] _RAND_3;
  reg [31:0] addr; // @[PTW.scala 50:23:@745.4]
  reg [31:0] _RAND_4;
  wire  pte_V; // @[PTW.scala 52:36:@749.4]
  wire  pte_R; // @[PTW.scala 52:36:@751.4]
  wire  pte_W; // @[PTW.scala 52:36:@753.4]
  wire  pte_X; // @[PTW.scala 52:36:@755.4]
  wire  pte_U; // @[PTW.scala 52:36:@757.4]
  wire [8:0] pte_ppn_p0; // @[PTW.scala 52:36:@767.4]
  wire [8:0] pte_ppn_p1; // @[PTW.scala 52:36:@769.4]
  wire [8:0] pte_ppn_p2; // @[PTW.scala 52:36:@771.4]
  wire  _T_71; // @[PTW.scala 53:23:@777.4]
  wire  _T_73; // @[PTW.scala 53:34:@778.4]
  wire  _T_74; // @[PTW.scala 53:41:@779.4]
  wire  pte_invalid; // @[PTW.scala 53:30:@780.4]
  wire  pte_leaf; // @[PTW.scala 54:30:@781.4]
  wire [38:0] addr2; // @[Cat.scala 30:58:@785.4]
  wire [38:0] addr1; // @[Cat.scala 30:58:@789.4]
  wire [38:0] addr0; // @[Cat.scala 30:58:@793.4]
  wire [3:0] _T_87; // @[PTW.scala 60:24:@794.4]
  wire  _T_111; // @[Conditional.scala 37:30:@845.4]
  wire [1:0] _GEN_0; // @[PTW.scala 70:33:@847.6]
  wire [3:0] _GEN_1; // @[PTW.scala 70:33:@847.6]
  wire [38:0] _GEN_2; // @[PTW.scala 70:33:@847.6]
  wire [8:0] _GEN_4; // @[PTW.scala 70:33:@847.6]
  wire [8:0] _GEN_5; // @[PTW.scala 70:33:@847.6]
  wire  _GEN_7; // @[PTW.scala 70:33:@847.6]
  wire  _T_113; // @[Conditional.scala 37:30:@859.6]
  wire  _T_118; // @[PTW.scala 98:47:@887.14]
  wire  _T_120; // @[PTW.scala 98:65:@888.14]
  wire  _T_121; // @[PTW.scala 98:51:@889.14]
  wire [1:0] _GEN_8; // @[PTW.scala 92:40:@869.12]
  wire  _GEN_10; // @[PTW.scala 92:40:@869.12]
  wire  _GEN_11; // @[PTW.scala 92:40:@869.12]
  wire  _GEN_12; // @[PTW.scala 92:40:@869.12]
  wire  _GEN_13; // @[PTW.scala 92:40:@869.12]
  wire [8:0] _GEN_18; // @[PTW.scala 92:40:@869.12]
  wire [8:0] _GEN_19; // @[PTW.scala 92:40:@869.12]
  wire [8:0] _GEN_20; // @[PTW.scala 92:40:@869.12]
  wire  _GEN_23; // @[PTW.scala 92:40:@869.12]
  wire  _GEN_25; // @[PTW.scala 92:40:@869.12]
  wire [38:0] _GEN_26; // @[PTW.scala 92:40:@869.12]
  wire [1:0] _GEN_27; // @[PTW.scala 86:36:@862.10]
  wire  _GEN_28; // @[PTW.scala 86:36:@862.10]
  wire  _GEN_29; // @[PTW.scala 86:36:@862.10]
  wire  _GEN_30; // @[PTW.scala 86:36:@862.10]
  wire  _GEN_32; // @[PTW.scala 86:36:@862.10]
  wire  _GEN_33; // @[PTW.scala 86:36:@862.10]
  wire  _GEN_34; // @[PTW.scala 86:36:@862.10]
  wire  _GEN_35; // @[PTW.scala 86:36:@862.10]
  wire [8:0] _GEN_40; // @[PTW.scala 86:36:@862.10]
  wire [8:0] _GEN_41; // @[PTW.scala 86:36:@862.10]
  wire [8:0] _GEN_42; // @[PTW.scala 86:36:@862.10]
  wire [38:0] _GEN_45; // @[PTW.scala 86:36:@862.10]
  wire [1:0] _GEN_46; // @[PTW.scala 85:33:@861.8]
  wire  _GEN_47; // @[PTW.scala 85:33:@861.8]
  wire  _GEN_48; // @[PTW.scala 85:33:@861.8]
  wire  _GEN_49; // @[PTW.scala 85:33:@861.8]
  wire  _GEN_51; // @[PTW.scala 85:33:@861.8]
  wire  _GEN_52; // @[PTW.scala 85:33:@861.8]
  wire  _GEN_53; // @[PTW.scala 85:33:@861.8]
  wire  _GEN_54; // @[PTW.scala 85:33:@861.8]
  wire [8:0] _GEN_59; // @[PTW.scala 85:33:@861.8]
  wire [8:0] _GEN_60; // @[PTW.scala 85:33:@861.8]
  wire [8:0] _GEN_61; // @[PTW.scala 85:33:@861.8]
  wire [38:0] _GEN_64; // @[PTW.scala 85:33:@861.8]
  wire  _T_124; // @[Conditional.scala 37:30:@901.8]
  wire [1:0] _GEN_65; // @[PTW.scala 117:40:@911.14]
  wire [8:0] _GEN_66; // @[PTW.scala 117:40:@911.14]
  wire  _GEN_67; // @[PTW.scala 117:40:@911.14]
  wire [38:0] _GEN_68; // @[PTW.scala 117:40:@911.14]
  wire [1:0] _GEN_69; // @[PTW.scala 111:36:@904.12]
  wire  _GEN_70; // @[PTW.scala 111:36:@904.12]
  wire [8:0] _GEN_71; // @[PTW.scala 111:36:@904.12]
  wire [38:0] _GEN_72; // @[PTW.scala 111:36:@904.12]
  wire [1:0] _GEN_73; // @[PTW.scala 110:33:@903.10]
  wire  _GEN_74; // @[PTW.scala 110:33:@903.10]
  wire [8:0] _GEN_75; // @[PTW.scala 110:33:@903.10]
  wire [38:0] _GEN_76; // @[PTW.scala 110:33:@903.10]
  wire  _T_132; // @[Conditional.scala 37:30:@940.10]
  wire  _T_136; // @[PTW.scala 138:38:@946.14]
  wire  _T_137; // @[PTW.scala 138:35:@947.14]
  wire  _GEN_79; // @[PTW.scala 138:49:@948.14]
  wire  _GEN_80; // @[PTW.scala 138:49:@948.14]
  wire  _GEN_81; // @[PTW.scala 138:49:@948.14]
  wire  _GEN_82; // @[PTW.scala 138:49:@948.14]
  wire [8:0] _GEN_87; // @[PTW.scala 138:49:@948.14]
  wire [8:0] _GEN_88; // @[PTW.scala 138:49:@948.14]
  wire [8:0] _GEN_89; // @[PTW.scala 138:49:@948.14]
  wire [1:0] _GEN_92; // @[PTW.scala 134:33:@942.12]
  wire  _GEN_93; // @[PTW.scala 134:33:@942.12]
  wire  _GEN_95; // @[PTW.scala 134:33:@942.12]
  wire  _GEN_97; // @[PTW.scala 134:33:@942.12]
  wire  _GEN_98; // @[PTW.scala 134:33:@942.12]
  wire  _GEN_99; // @[PTW.scala 134:33:@942.12]
  wire  _GEN_100; // @[PTW.scala 134:33:@942.12]
  wire [8:0] _GEN_105; // @[PTW.scala 134:33:@942.12]
  wire [8:0] _GEN_106; // @[PTW.scala 134:33:@942.12]
  wire [8:0] _GEN_107; // @[PTW.scala 134:33:@942.12]
  wire [1:0] _GEN_110; // @[Conditional.scala 39:67:@941.10]
  wire  _GEN_111; // @[Conditional.scala 39:67:@941.10]
  wire  _GEN_112; // @[Conditional.scala 39:67:@941.10]
  wire  _GEN_113; // @[Conditional.scala 39:67:@941.10]
  wire  _GEN_115; // @[Conditional.scala 39:67:@941.10]
  wire  _GEN_116; // @[Conditional.scala 39:67:@941.10]
  wire  _GEN_117; // @[Conditional.scala 39:67:@941.10]
  wire  _GEN_118; // @[Conditional.scala 39:67:@941.10]
  wire [8:0] _GEN_123; // @[Conditional.scala 39:67:@941.10]
  wire [8:0] _GEN_124; // @[Conditional.scala 39:67:@941.10]
  wire [8:0] _GEN_125; // @[Conditional.scala 39:67:@941.10]
  wire [1:0] _GEN_128; // @[Conditional.scala 39:67:@902.8]
  wire  _GEN_129; // @[Conditional.scala 39:67:@902.8]
  wire  _GEN_130; // @[Conditional.scala 39:67:@902.8]
  wire  _GEN_131; // @[Conditional.scala 39:67:@902.8]
  wire  _GEN_133; // @[Conditional.scala 39:67:@902.8]
  wire  _GEN_134; // @[Conditional.scala 39:67:@902.8]
  wire  _GEN_135; // @[Conditional.scala 39:67:@902.8]
  wire  _GEN_136; // @[Conditional.scala 39:67:@902.8]
  wire [8:0] _GEN_141; // @[Conditional.scala 39:67:@902.8]
  wire [8:0] _GEN_142; // @[Conditional.scala 39:67:@902.8]
  wire [8:0] _GEN_143; // @[Conditional.scala 39:67:@902.8]
  wire [38:0] _GEN_146; // @[Conditional.scala 39:67:@902.8]
  wire [1:0] _GEN_147; // @[Conditional.scala 39:67:@860.6]
  wire  _GEN_148; // @[Conditional.scala 39:67:@860.6]
  wire  _GEN_149; // @[Conditional.scala 39:67:@860.6]
  wire  _GEN_150; // @[Conditional.scala 39:67:@860.6]
  wire  _GEN_152; // @[Conditional.scala 39:67:@860.6]
  wire  _GEN_153; // @[Conditional.scala 39:67:@860.6]
  wire  _GEN_154; // @[Conditional.scala 39:67:@860.6]
  wire  _GEN_155; // @[Conditional.scala 39:67:@860.6]
  wire [8:0] _GEN_160; // @[Conditional.scala 39:67:@860.6]
  wire [8:0] _GEN_161; // @[Conditional.scala 39:67:@860.6]
  wire [8:0] _GEN_162; // @[Conditional.scala 39:67:@860.6]
  wire [38:0] _GEN_165; // @[Conditional.scala 39:67:@860.6]
  wire [1:0] _GEN_166; // @[Conditional.scala 40:58:@846.4]
  wire [38:0] _GEN_168; // @[Conditional.scala 40:58:@846.4]
  wire [8:0] _GEN_170; // @[Conditional.scala 40:58:@846.4]
  wire [8:0] _GEN_171; // @[Conditional.scala 40:58:@846.4]
  wire [38:0] _GEN_172; // @[Conditional.scala 40:58:@846.4]
  wire  _GEN_173; // @[Conditional.scala 40:58:@846.4]
  assign pte_V = io_mem_rdata[0]; // @[PTW.scala 52:36:@749.4]
  assign pte_R = io_mem_rdata[1]; // @[PTW.scala 52:36:@751.4]
  assign pte_W = io_mem_rdata[2]; // @[PTW.scala 52:36:@753.4]
  assign pte_X = io_mem_rdata[3]; // @[PTW.scala 52:36:@755.4]
  assign pte_U = io_mem_rdata[4]; // @[PTW.scala 52:36:@757.4]
  assign pte_ppn_p0 = io_mem_rdata[18:10]; // @[PTW.scala 52:36:@767.4]
  assign pte_ppn_p1 = io_mem_rdata[27:19]; // @[PTW.scala 52:36:@769.4]
  assign pte_ppn_p2 = io_mem_rdata[36:28]; // @[PTW.scala 52:36:@771.4]
  assign _T_71 = pte_V == 1'h0; // @[PTW.scala 53:23:@777.4]
  assign _T_73 = pte_R == 1'h0; // @[PTW.scala 53:34:@778.4]
  assign _T_74 = _T_73 & pte_W; // @[PTW.scala 53:41:@779.4]
  assign pte_invalid = _T_71 | _T_74; // @[PTW.scala 53:30:@780.4]
  assign pte_leaf = pte_R | pte_X; // @[PTW.scala 54:30:@781.4]
  assign addr2 = {io_root_p2,io_root_p1,io_root_p0,io_req_p2,3'h0}; // @[Cat.scala 30:58:@785.4]
  assign addr1 = {pte_ppn_p2,pte_ppn_p1,pte_ppn_p0,req_p1,3'h0}; // @[Cat.scala 30:58:@789.4]
  assign addr0 = {pte_ppn_p2,pte_ppn_p1,pte_ppn_p0,req_p0,3'h0}; // @[Cat.scala 30:58:@793.4]
  assign _T_87 = read ? 4'hb : 4'hf; // @[PTW.scala 60:24:@794.4]
  assign _T_111 = 2'h0 == wait_status; // @[Conditional.scala 37:30:@845.4]
  assign _GEN_0 = io_req_valid ? 2'h1 : wait_status; // @[PTW.scala 70:33:@847.6]
  assign _GEN_1 = io_req_valid ? 4'hb : _T_87; // @[PTW.scala 70:33:@847.6]
  assign _GEN_2 = io_req_valid ? addr2 : {{7'd0}, addr}; // @[PTW.scala 70:33:@847.6]
  assign _GEN_4 = io_req_valid ? io_req_p1 : req_p1; // @[PTW.scala 70:33:@847.6]
  assign _GEN_5 = io_req_valid ? io_req_p0 : req_p0; // @[PTW.scala 70:33:@847.6]
  assign _GEN_7 = io_req_valid ? 1'h1 : read; // @[PTW.scala 70:33:@847.6]
  assign _T_113 = 2'h1 == wait_status; // @[Conditional.scala 37:30:@859.6]
  assign _T_118 = pte_ppn_p1 != 9'h0; // @[PTW.scala 98:47:@887.14]
  assign _T_120 = pte_ppn_p0 != 9'h0; // @[PTW.scala 98:65:@888.14]
  assign _T_121 = _T_118 | _T_120; // @[PTW.scala 98:51:@889.14]
  assign _GEN_8 = pte_leaf ? 2'h0 : 2'h2; // @[PTW.scala 92:40:@869.12]
  assign _GEN_10 = pte_leaf ? pte_R : 1'h0; // @[PTW.scala 92:40:@869.12]
  assign _GEN_11 = pte_leaf ? pte_W : 1'h0; // @[PTW.scala 92:40:@869.12]
  assign _GEN_12 = pte_leaf ? pte_X : 1'h0; // @[PTW.scala 92:40:@869.12]
  assign _GEN_13 = pte_leaf ? pte_U : 1'h0; // @[PTW.scala 92:40:@869.12]
  assign _GEN_18 = pte_leaf ? req_p0 : 9'h0; // @[PTW.scala 92:40:@869.12]
  assign _GEN_19 = pte_leaf ? req_p1 : 9'h0; // @[PTW.scala 92:40:@869.12]
  assign _GEN_20 = pte_leaf ? pte_ppn_p2 : 9'h0; // @[PTW.scala 92:40:@869.12]
  assign _GEN_23 = pte_leaf ? _T_121 : 1'h0; // @[PTW.scala 92:40:@869.12]
  assign _GEN_25 = pte_leaf ? 1'h0 : read; // @[PTW.scala 92:40:@869.12]
  assign _GEN_26 = pte_leaf ? {{7'd0}, addr} : addr1; // @[PTW.scala 92:40:@869.12]
  assign _GEN_27 = pte_invalid ? 2'h0 : _GEN_8; // @[PTW.scala 86:36:@862.10]
  assign _GEN_28 = pte_invalid ? 1'h1 : _GEN_23; // @[PTW.scala 86:36:@862.10]
  assign _GEN_29 = pte_invalid ? 1'h1 : pte_leaf; // @[PTW.scala 86:36:@862.10]
  assign _GEN_30 = pte_invalid ? 1'h0 : _GEN_25; // @[PTW.scala 86:36:@862.10]
  assign _GEN_32 = pte_invalid ? 1'h0 : _GEN_10; // @[PTW.scala 86:36:@862.10]
  assign _GEN_33 = pte_invalid ? 1'h0 : _GEN_11; // @[PTW.scala 86:36:@862.10]
  assign _GEN_34 = pte_invalid ? 1'h0 : _GEN_12; // @[PTW.scala 86:36:@862.10]
  assign _GEN_35 = pte_invalid ? 1'h0 : _GEN_13; // @[PTW.scala 86:36:@862.10]
  assign _GEN_40 = pte_invalid ? 9'h0 : _GEN_18; // @[PTW.scala 86:36:@862.10]
  assign _GEN_41 = pte_invalid ? 9'h0 : _GEN_19; // @[PTW.scala 86:36:@862.10]
  assign _GEN_42 = pte_invalid ? 9'h0 : _GEN_20; // @[PTW.scala 86:36:@862.10]
  assign _GEN_45 = pte_invalid ? {{7'd0}, addr} : _GEN_26; // @[PTW.scala 86:36:@862.10]
  assign _GEN_46 = io_mem_ready ? _GEN_27 : wait_status; // @[PTW.scala 85:33:@861.8]
  assign _GEN_47 = io_mem_ready ? _GEN_28 : 1'h0; // @[PTW.scala 85:33:@861.8]
  assign _GEN_48 = io_mem_ready ? _GEN_29 : 1'h0; // @[PTW.scala 85:33:@861.8]
  assign _GEN_49 = io_mem_ready ? _GEN_30 : read; // @[PTW.scala 85:33:@861.8]
  assign _GEN_51 = io_mem_ready ? _GEN_32 : 1'h0; // @[PTW.scala 85:33:@861.8]
  assign _GEN_52 = io_mem_ready ? _GEN_33 : 1'h0; // @[PTW.scala 85:33:@861.8]
  assign _GEN_53 = io_mem_ready ? _GEN_34 : 1'h0; // @[PTW.scala 85:33:@861.8]
  assign _GEN_54 = io_mem_ready ? _GEN_35 : 1'h0; // @[PTW.scala 85:33:@861.8]
  assign _GEN_59 = io_mem_ready ? _GEN_40 : 9'h0; // @[PTW.scala 85:33:@861.8]
  assign _GEN_60 = io_mem_ready ? _GEN_41 : 9'h0; // @[PTW.scala 85:33:@861.8]
  assign _GEN_61 = io_mem_ready ? _GEN_42 : 9'h0; // @[PTW.scala 85:33:@861.8]
  assign _GEN_64 = io_mem_ready ? _GEN_45 : {{7'd0}, addr}; // @[PTW.scala 85:33:@861.8]
  assign _T_124 = 2'h2 == wait_status; // @[Conditional.scala 37:30:@901.8]
  assign _GEN_65 = pte_leaf ? 2'h0 : 2'h3; // @[PTW.scala 117:40:@911.14]
  assign _GEN_66 = pte_leaf ? pte_ppn_p1 : 9'h0; // @[PTW.scala 117:40:@911.14]
  assign _GEN_67 = pte_leaf ? _T_120 : 1'h0; // @[PTW.scala 117:40:@911.14]
  assign _GEN_68 = pte_leaf ? {{7'd0}, addr} : addr0; // @[PTW.scala 117:40:@911.14]
  assign _GEN_69 = pte_invalid ? 2'h0 : _GEN_65; // @[PTW.scala 111:36:@904.12]
  assign _GEN_70 = pte_invalid ? 1'h1 : _GEN_67; // @[PTW.scala 111:36:@904.12]
  assign _GEN_71 = pte_invalid ? 9'h0 : _GEN_66; // @[PTW.scala 111:36:@904.12]
  assign _GEN_72 = pte_invalid ? {{7'd0}, addr} : _GEN_68; // @[PTW.scala 111:36:@904.12]
  assign _GEN_73 = io_mem_ready ? _GEN_69 : wait_status; // @[PTW.scala 110:33:@903.10]
  assign _GEN_74 = io_mem_ready ? _GEN_70 : 1'h0; // @[PTW.scala 110:33:@903.10]
  assign _GEN_75 = io_mem_ready ? _GEN_71 : 9'h0; // @[PTW.scala 110:33:@903.10]
  assign _GEN_76 = io_mem_ready ? _GEN_72 : {{7'd0}, addr}; // @[PTW.scala 110:33:@903.10]
  assign _T_132 = 2'h3 == wait_status; // @[Conditional.scala 37:30:@940.10]
  assign _T_136 = pte_leaf == 1'h0; // @[PTW.scala 138:38:@946.14]
  assign _T_137 = pte_invalid | _T_136; // @[PTW.scala 138:35:@947.14]
  assign _GEN_79 = _T_137 ? 1'h0 : pte_R; // @[PTW.scala 138:49:@948.14]
  assign _GEN_80 = _T_137 ? 1'h0 : pte_W; // @[PTW.scala 138:49:@948.14]
  assign _GEN_81 = _T_137 ? 1'h0 : pte_X; // @[PTW.scala 138:49:@948.14]
  assign _GEN_82 = _T_137 ? 1'h0 : pte_U; // @[PTW.scala 138:49:@948.14]
  assign _GEN_87 = _T_137 ? 9'h0 : pte_ppn_p0; // @[PTW.scala 138:49:@948.14]
  assign _GEN_88 = _T_137 ? 9'h0 : pte_ppn_p1; // @[PTW.scala 138:49:@948.14]
  assign _GEN_89 = _T_137 ? 9'h0 : pte_ppn_p2; // @[PTW.scala 138:49:@948.14]
  assign _GEN_92 = io_mem_ready ? 2'h0 : wait_status; // @[PTW.scala 134:33:@942.12]
  assign _GEN_93 = io_mem_ready ? 1'h0 : read; // @[PTW.scala 134:33:@942.12]
  assign _GEN_95 = io_mem_ready ? _T_137 : 1'h0; // @[PTW.scala 134:33:@942.12]
  assign _GEN_97 = io_mem_ready ? _GEN_79 : 1'h0; // @[PTW.scala 134:33:@942.12]
  assign _GEN_98 = io_mem_ready ? _GEN_80 : 1'h0; // @[PTW.scala 134:33:@942.12]
  assign _GEN_99 = io_mem_ready ? _GEN_81 : 1'h0; // @[PTW.scala 134:33:@942.12]
  assign _GEN_100 = io_mem_ready ? _GEN_82 : 1'h0; // @[PTW.scala 134:33:@942.12]
  assign _GEN_105 = io_mem_ready ? _GEN_87 : 9'h0; // @[PTW.scala 134:33:@942.12]
  assign _GEN_106 = io_mem_ready ? _GEN_88 : 9'h0; // @[PTW.scala 134:33:@942.12]
  assign _GEN_107 = io_mem_ready ? _GEN_89 : 9'h0; // @[PTW.scala 134:33:@942.12]
  assign _GEN_110 = _T_132 ? _GEN_92 : wait_status; // @[Conditional.scala 39:67:@941.10]
  assign _GEN_111 = _T_132 ? _GEN_93 : read; // @[Conditional.scala 39:67:@941.10]
  assign _GEN_112 = _T_132 ? io_mem_ready : 1'h0; // @[Conditional.scala 39:67:@941.10]
  assign _GEN_113 = _T_132 ? _GEN_95 : 1'h0; // @[Conditional.scala 39:67:@941.10]
  assign _GEN_115 = _T_132 ? _GEN_97 : 1'h0; // @[Conditional.scala 39:67:@941.10]
  assign _GEN_116 = _T_132 ? _GEN_98 : 1'h0; // @[Conditional.scala 39:67:@941.10]
  assign _GEN_117 = _T_132 ? _GEN_99 : 1'h0; // @[Conditional.scala 39:67:@941.10]
  assign _GEN_118 = _T_132 ? _GEN_100 : 1'h0; // @[Conditional.scala 39:67:@941.10]
  assign _GEN_123 = _T_132 ? _GEN_105 : 9'h0; // @[Conditional.scala 39:67:@941.10]
  assign _GEN_124 = _T_132 ? _GEN_106 : 9'h0; // @[Conditional.scala 39:67:@941.10]
  assign _GEN_125 = _T_132 ? _GEN_107 : 9'h0; // @[Conditional.scala 39:67:@941.10]
  assign _GEN_128 = _T_124 ? _GEN_73 : _GEN_110; // @[Conditional.scala 39:67:@902.8]
  assign _GEN_129 = _T_124 ? _GEN_74 : _GEN_113; // @[Conditional.scala 39:67:@902.8]
  assign _GEN_130 = _T_124 ? _GEN_48 : _GEN_112; // @[Conditional.scala 39:67:@902.8]
  assign _GEN_131 = _T_124 ? _GEN_49 : _GEN_111; // @[Conditional.scala 39:67:@902.8]
  assign _GEN_133 = _T_124 ? _GEN_51 : _GEN_115; // @[Conditional.scala 39:67:@902.8]
  assign _GEN_134 = _T_124 ? _GEN_52 : _GEN_116; // @[Conditional.scala 39:67:@902.8]
  assign _GEN_135 = _T_124 ? _GEN_53 : _GEN_117; // @[Conditional.scala 39:67:@902.8]
  assign _GEN_136 = _T_124 ? _GEN_54 : _GEN_118; // @[Conditional.scala 39:67:@902.8]
  assign _GEN_141 = _T_124 ? _GEN_59 : _GEN_123; // @[Conditional.scala 39:67:@902.8]
  assign _GEN_142 = _T_124 ? _GEN_75 : _GEN_124; // @[Conditional.scala 39:67:@902.8]
  assign _GEN_143 = _T_124 ? _GEN_61 : _GEN_125; // @[Conditional.scala 39:67:@902.8]
  assign _GEN_146 = _T_124 ? _GEN_76 : {{7'd0}, addr}; // @[Conditional.scala 39:67:@902.8]
  assign _GEN_147 = _T_113 ? _GEN_46 : _GEN_128; // @[Conditional.scala 39:67:@860.6]
  assign _GEN_148 = _T_113 ? _GEN_47 : _GEN_129; // @[Conditional.scala 39:67:@860.6]
  assign _GEN_149 = _T_113 ? _GEN_48 : _GEN_130; // @[Conditional.scala 39:67:@860.6]
  assign _GEN_150 = _T_113 ? _GEN_49 : _GEN_131; // @[Conditional.scala 39:67:@860.6]
  assign _GEN_152 = _T_113 ? _GEN_51 : _GEN_133; // @[Conditional.scala 39:67:@860.6]
  assign _GEN_153 = _T_113 ? _GEN_52 : _GEN_134; // @[Conditional.scala 39:67:@860.6]
  assign _GEN_154 = _T_113 ? _GEN_53 : _GEN_135; // @[Conditional.scala 39:67:@860.6]
  assign _GEN_155 = _T_113 ? _GEN_54 : _GEN_136; // @[Conditional.scala 39:67:@860.6]
  assign _GEN_160 = _T_113 ? _GEN_59 : _GEN_141; // @[Conditional.scala 39:67:@860.6]
  assign _GEN_161 = _T_113 ? _GEN_60 : _GEN_142; // @[Conditional.scala 39:67:@860.6]
  assign _GEN_162 = _T_113 ? _GEN_61 : _GEN_143; // @[Conditional.scala 39:67:@860.6]
  assign _GEN_165 = _T_113 ? _GEN_64 : _GEN_146; // @[Conditional.scala 39:67:@860.6]
  assign _GEN_166 = _T_111 ? _GEN_0 : _GEN_147; // @[Conditional.scala 40:58:@846.4]
  assign _GEN_168 = _T_111 ? _GEN_2 : {{7'd0}, addr}; // @[Conditional.scala 40:58:@846.4]
  assign _GEN_170 = _T_111 ? _GEN_4 : req_p1; // @[Conditional.scala 40:58:@846.4]
  assign _GEN_171 = _T_111 ? _GEN_5 : req_p0; // @[Conditional.scala 40:58:@846.4]
  assign _GEN_172 = _T_111 ? _GEN_2 : _GEN_165; // @[Conditional.scala 40:58:@846.4]
  assign _GEN_173 = _T_111 ? _GEN_7 : _GEN_150; // @[Conditional.scala 40:58:@846.4]
  assign io_rsp_ppn_p2 = _T_111 ? 9'h0 : _GEN_162; // @[PTW.scala 63:18:@840.4 PTW.scala 94:33:@882.14 PTW.scala 119:33:@924.16 PTW.scala 141:33:@963.16]
  assign io_rsp_ppn_p1 = _T_111 ? 9'h0 : _GEN_161; // @[PTW.scala 63:18:@839.4 PTW.scala 94:33:@881.14 PTW.scala 95:37:@885.14 PTW.scala 119:33:@923.16 PTW.scala 141:33:@962.16]
  assign io_rsp_ppn_p0 = _T_111 ? 9'h0 : _GEN_160; // @[PTW.scala 63:18:@838.4 PTW.scala 94:33:@880.14 PTW.scala 96:37:@886.14 PTW.scala 119:33:@922.16 PTW.scala 120:37:@927.16 PTW.scala 141:33:@961.16]
  assign io_rsp_U = _T_111 ? 1'h0 : _GEN_155; // @[PTW.scala 63:18:@833.4 PTW.scala 94:33:@875.14 PTW.scala 119:33:@917.16 PTW.scala 141:33:@956.16]
  assign io_rsp_X = _T_111 ? 1'h0 : _GEN_154; // @[PTW.scala 63:18:@832.4 PTW.scala 94:33:@874.14 PTW.scala 119:33:@916.16 PTW.scala 141:33:@955.16]
  assign io_rsp_W = _T_111 ? 1'h0 : _GEN_153; // @[PTW.scala 63:18:@831.4 PTW.scala 94:33:@873.14 PTW.scala 119:33:@915.16 PTW.scala 141:33:@954.16]
  assign io_rsp_R = _T_111 ? 1'h0 : _GEN_152; // @[PTW.scala 63:18:@830.4 PTW.scala 94:33:@872.14 PTW.scala 119:33:@914.16 PTW.scala 141:33:@953.16]
  assign io_ready = _T_111 ? 1'h0 : _GEN_149; // @[PTW.scala 65:18:@844.4 PTW.scala 90:33:@865.12 PTW.scala 99:33:@891.14 PTW.scala 115:33:@907.14 PTW.scala 123:33:@930.16 PTW.scala 137:29:@945.14]
  assign io_pf = _T_111 ? 1'h0 : _GEN_148; // @[PTW.scala 64:18:@843.4 PTW.scala 89:33:@864.12 PTW.scala 98:33:@890.14 PTW.scala 114:33:@906.14 PTW.scala 122:33:@929.16 PTW.scala 139:33:@949.16]
  assign io_mem_mode = _T_111 ? _GEN_1 : _T_87; // @[PTW.scala 60:18:@795.4 PTW.scala 72:29:@849.8]
  assign io_mem_addr = {{25'd0}, _GEN_168}; // @[PTW.scala 61:18:@796.4 PTW.scala 73:29:@850.8]
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
module MMU( // @[:@1341.2]
  input         clock, // @[:@1342.4]
  input         reset, // @[:@1343.4]
  input  [3:0]  io_mem_mode, // @[:@1344.4]
  output        io_mem_ready, // @[:@1344.4]
  input  [63:0] io_mem_addr, // @[:@1344.4]
  output [63:0] io_mem_rdata, // @[:@1344.4]
  input  [63:0] io_mem_wdata, // @[:@1344.4]
  input  [3:0]  io_insr_mode, // @[:@1344.4]
  output        io_insr_ready, // @[:@1344.4]
  input  [63:0] io_insr_addr, // @[:@1344.4]
  output [63:0] io_insr_rdata, // @[:@1344.4]
  input         io_insr_rst, // @[:@1344.4]
  input  [63:0] io_csr_satp, // @[:@1344.4]
  input  [1:0]  io_csr_priv, // @[:@1344.4]
  input         io_csr_mxr, // @[:@1344.4]
  input         io_csr_sum, // @[:@1344.4]
  output [3:0]  io_if_iom_mode, // @[:@1344.4]
  input         io_if_iom_ready, // @[:@1344.4]
  output [63:0] io_if_iom_addr, // @[:@1344.4]
  input  [63:0] io_if_iom_rdata, // @[:@1344.4]
  output [3:0]  io_mem_iom_mode, // @[:@1344.4]
  input         io_mem_iom_ready, // @[:@1344.4]
  output [63:0] io_mem_iom_addr, // @[:@1344.4]
  input  [63:0] io_mem_iom_rdata, // @[:@1344.4]
  output [63:0] io_mem_iom_wdata // @[:@1344.4]
);
  wire  ptw_if_clock; // @[MMU.scala 21:23:@1346.4]
  wire  ptw_if_reset; // @[MMU.scala 21:23:@1346.4]
  wire [8:0] ptw_if_io_root_p2; // @[MMU.scala 21:23:@1346.4]
  wire [8:0] ptw_if_io_root_p1; // @[MMU.scala 21:23:@1346.4]
  wire [8:0] ptw_if_io_root_p0; // @[MMU.scala 21:23:@1346.4]
  wire [8:0] ptw_if_io_req_p2; // @[MMU.scala 21:23:@1346.4]
  wire [8:0] ptw_if_io_req_p1; // @[MMU.scala 21:23:@1346.4]
  wire [8:0] ptw_if_io_req_p0; // @[MMU.scala 21:23:@1346.4]
  wire  ptw_if_io_req_valid; // @[MMU.scala 21:23:@1346.4]
  wire [8:0] ptw_if_io_rsp_ppn_p2; // @[MMU.scala 21:23:@1346.4]
  wire [8:0] ptw_if_io_rsp_ppn_p1; // @[MMU.scala 21:23:@1346.4]
  wire [8:0] ptw_if_io_rsp_ppn_p0; // @[MMU.scala 21:23:@1346.4]
  wire  ptw_if_io_rsp_U; // @[MMU.scala 21:23:@1346.4]
  wire  ptw_if_io_rsp_X; // @[MMU.scala 21:23:@1346.4]
  wire  ptw_if_io_rsp_W; // @[MMU.scala 21:23:@1346.4]
  wire  ptw_if_io_rsp_R; // @[MMU.scala 21:23:@1346.4]
  wire  ptw_if_io_ready; // @[MMU.scala 21:23:@1346.4]
  wire  ptw_if_io_pf; // @[MMU.scala 21:23:@1346.4]
  wire [3:0] ptw_if_io_mem_mode; // @[MMU.scala 21:23:@1346.4]
  wire  ptw_if_io_mem_ready; // @[MMU.scala 21:23:@1346.4]
  wire [63:0] ptw_if_io_mem_addr; // @[MMU.scala 21:23:@1346.4]
  wire [63:0] ptw_if_io_mem_rdata; // @[MMU.scala 21:23:@1346.4]
  wire  ptw_mem_clock; // @[MMU.scala 22:23:@1349.4]
  wire  ptw_mem_reset; // @[MMU.scala 22:23:@1349.4]
  wire [8:0] ptw_mem_io_root_p2; // @[MMU.scala 22:23:@1349.4]
  wire [8:0] ptw_mem_io_root_p1; // @[MMU.scala 22:23:@1349.4]
  wire [8:0] ptw_mem_io_root_p0; // @[MMU.scala 22:23:@1349.4]
  wire [8:0] ptw_mem_io_req_p2; // @[MMU.scala 22:23:@1349.4]
  wire [8:0] ptw_mem_io_req_p1; // @[MMU.scala 22:23:@1349.4]
  wire [8:0] ptw_mem_io_req_p0; // @[MMU.scala 22:23:@1349.4]
  wire  ptw_mem_io_req_valid; // @[MMU.scala 22:23:@1349.4]
  wire [8:0] ptw_mem_io_rsp_ppn_p2; // @[MMU.scala 22:23:@1349.4]
  wire [8:0] ptw_mem_io_rsp_ppn_p1; // @[MMU.scala 22:23:@1349.4]
  wire [8:0] ptw_mem_io_rsp_ppn_p0; // @[MMU.scala 22:23:@1349.4]
  wire  ptw_mem_io_rsp_U; // @[MMU.scala 22:23:@1349.4]
  wire  ptw_mem_io_rsp_X; // @[MMU.scala 22:23:@1349.4]
  wire  ptw_mem_io_rsp_W; // @[MMU.scala 22:23:@1349.4]
  wire  ptw_mem_io_rsp_R; // @[MMU.scala 22:23:@1349.4]
  wire  ptw_mem_io_ready; // @[MMU.scala 22:23:@1349.4]
  wire  ptw_mem_io_pf; // @[MMU.scala 22:23:@1349.4]
  wire [3:0] ptw_mem_io_mem_mode; // @[MMU.scala 22:23:@1349.4]
  wire  ptw_mem_io_mem_ready; // @[MMU.scala 22:23:@1349.4]
  wire [63:0] ptw_mem_io_mem_addr; // @[MMU.scala 22:23:@1349.4]
  wire [63:0] ptw_mem_io_mem_rdata; // @[MMU.scala 22:23:@1349.4]
  reg [63:0] csr_satp; // @[MMU.scala 25:24:@1366.4]
  reg [63:0] _RAND_0;
  reg [1:0] csr_priv; // @[MMU.scala 25:24:@1366.4]
  reg [31:0] _RAND_1;
  reg  csr_mxr; // @[MMU.scala 25:24:@1366.4]
  reg [31:0] _RAND_2;
  reg  csr_sum; // @[MMU.scala 25:24:@1366.4]
  reg [31:0] _RAND_3;
  reg [1:0] if_status; // @[MMU.scala 28:27:@1367.4]
  reg [31:0] _RAND_4;
  reg [3:0] if_mode; // @[MMU.scala 29:27:@1368.4]
  reg [31:0] _RAND_5;
  reg [63:0] if_addr; // @[MMU.scala 30:27:@1369.4]
  reg [63:0] _RAND_6;
  reg [63:0] if_pha; // @[MMU.scala 31:27:@1370.4]
  reg [63:0] _RAND_7;
  reg  if_rst; // @[MMU.scala 32:27:@1371.4]
  reg [31:0] _RAND_8;
  reg [1:0] mem_status; // @[MMU.scala 33:27:@1372.4]
  reg [31:0] _RAND_9;
  reg [3:0] mem_mode; // @[MMU.scala 34:27:@1373.4]
  reg [31:0] _RAND_10;
  reg [63:0] mem_addr; // @[MMU.scala 35:27:@1374.4]
  reg [63:0] _RAND_11;
  reg [63:0] mem_pha; // @[MMU.scala 36:27:@1375.4]
  reg [63:0] _RAND_12;
  wire  if_free; // @[MMU.scala 38:30:@1376.4]
  wire  mem_free; // @[MMU.scala 39:31:@1377.4]
  wire  _T_106; // @[MMU.scala 40:32:@1378.4]
  wire [63:0] real_csr_satp; // @[MMU.scala 40:23:@1379.4]
  wire [1:0] real_csr_priv; // @[MMU.scala 40:23:@1379.4]
  wire  real_csr_mxr; // @[MMU.scala 40:23:@1379.4]
  wire  real_csr_sum; // @[MMU.scala 40:23:@1379.4]
  wire  _T_107; // @[MMU.scala 45:35:@1380.4]
  wire  _T_109; // @[MMU.scala 45:49:@1381.4]
  wire  e_if_user; // @[MMU.scala 45:46:@1382.4]
  wire  e_if_exec; // @[MMU.scala 46:21:@1383.4]
  wire  _T_111; // @[MMU.scala 47:34:@1384.4]
  wire  e_if; // @[MMU.scala 47:47:@1385.4]
  wire  _T_114; // @[MMU.scala 49:49:@1387.4]
  wire  e_mem_user; // @[MMU.scala 49:46:@1388.4]
  wire  _T_115; // @[memoryCtrl.scala 20:35:@1389.4]
  wire [3:0] _T_116; // @[memoryCtrl.scala 20:46:@1390.4]
  wire  _T_118; // @[memoryCtrl.scala 20:46:@1391.4]
  wire  _T_120; // @[memoryCtrl.scala 20:42:@1392.4]
  wire  _T_121; // @[memoryCtrl.scala 20:39:@1393.4]
  wire  _T_122; // @[MMU.scala 50:83:@1394.4]
  wire  _T_123; // @[MMU.scala 50:65:@1395.4]
  wire  _T_125; // @[MMU.scala 50:49:@1396.4]
  wire  e_mem_read; // @[MMU.scala 50:46:@1397.4]
  wire  _T_128; // @[memoryCtrl.scala 21:34:@1399.4]
  wire  _T_130; // @[MMU.scala 51:50:@1400.4]
  wire  e_mem_write; // @[MMU.scala 51:47:@1401.4]
  wire  _T_131; // @[MMU.scala 52:35:@1402.4]
  wire  _T_133; // @[MMU.scala 52:49:@1403.4]
  wire  _T_134; // @[MMU.scala 52:46:@1404.4]
  wire  e_mem_sum; // @[MMU.scala 52:63:@1405.4]
  wire  _T_135; // @[MMU.scala 53:35:@1406.4]
  wire  _T_136; // @[MMU.scala 53:49:@1407.4]
  wire  _T_137; // @[MMU.scala 53:63:@1408.4]
  wire  e_mem; // @[MMU.scala 53:78:@1409.4]
  wire [3:0] _T_138; // @[MMU.scala 55:30:@1410.4]
  wire  mmu_en; // @[MMU.scala 55:38:@1411.4]
  wire  is_mem; // @[MMU.scala 56:29:@1412.4]
  wire  _T_140; // @[MMU.scala 57:30:@1413.4]
  wire  _T_142; // @[MMU.scala 57:46:@1414.4]
  wire  is_if; // @[MMU.scala 57:43:@1415.4]
  wire [64:0] _T_144; // @[MMU.scala 67:62:@1417.4]
  wire [64:0] _T_145; // @[MMU.scala 67:62:@1418.4]
  wire [63:0] _T_146; // @[MMU.scala 67:62:@1419.4]
  wire [63:0] real_if_addr; // @[MMU.scala 67:26:@1420.4]
  wire [64:0] _T_147; // @[MMU.scala 68:62:@1421.4]
  wire [64:0] _T_148; // @[MMU.scala 68:62:@1422.4]
  wire [63:0] _T_149; // @[MMU.scala 68:62:@1423.4]
  wire [63:0] real_mem_addr; // @[MMU.scala 68:26:@1424.4]
  wire [11:0] _T_153; // @[MMU.scala 69:66:@1427.4]
  wire [63:0] ptw_if_addr; // @[Cat.scala 30:58:@1429.4]
  wire [11:0] _T_158; // @[MMU.scala 70:67:@1432.4]
  wire [63:0] ptw_mem_addr; // @[Cat.scala 30:58:@1434.4]
  wire [26:0] _T_170; // @[MMU.scala 74:36:@1445.4]
  wire  _GEN_5; // @[MMU.scala 126:22:@1564.4]
  wire  _T_228; // @[Conditional.scala 37:30:@1567.4]
  wire  _T_229; // @[MMU.scala 132:19:@1569.6]
  wire [3:0] _GEN_8; // @[MMU.scala 143:36:@1583.10]
  wire [63:0] _GEN_9; // @[MMU.scala 143:36:@1583.10]
  wire [1:0] _GEN_15; // @[MMU.scala 137:23:@1575.8]
  wire [3:0] _GEN_17; // @[MMU.scala 137:23:@1575.8]
  wire [63:0] _GEN_18; // @[MMU.scala 137:23:@1575.8]
  wire [63:0] _GEN_19; // @[MMU.scala 137:23:@1575.8]
  wire [3:0] _GEN_20; // @[MMU.scala 132:32:@1570.6]
  wire [3:0] _GEN_21; // @[MMU.scala 132:32:@1570.6]
  wire [63:0] _GEN_22; // @[MMU.scala 132:32:@1570.6]
  wire  _GEN_23; // @[MMU.scala 132:32:@1570.6]
  wire  _GEN_27; // @[MMU.scala 132:32:@1570.6]
  wire [1:0] _GEN_28; // @[MMU.scala 132:32:@1570.6]
  wire [63:0] _GEN_30; // @[MMU.scala 132:32:@1570.6]
  wire [63:0] _GEN_31; // @[MMU.scala 132:32:@1570.6]
  wire  _T_236; // @[Conditional.scala 37:30:@1602.6]
  wire [1:0] _GEN_33; // @[MMU.scala 164:21:@1607.10]
  wire [63:0] _GEN_34; // @[MMU.scala 164:21:@1607.10]
  wire  _GEN_53; // @[MMU.scala 163:30:@1606.8]
  wire [1:0] _GEN_54; // @[MMU.scala 163:30:@1606.8]
  wire [63:0] _GEN_55; // @[MMU.scala 163:30:@1606.8]
  wire  _T_248; // @[Conditional.scala 37:30:@1647.8]
  wire  _T_250; // @[MMU.scala 185:47:@1653.12]
  wire  _T_252; // @[MMU.scala 185:58:@1654.12]
  wire  _T_253; // @[MMU.scala 185:55:@1655.12]
  wire [63:0] _GEN_75; // @[MMU.scala 185:72:@1656.12]
  wire [63:0] _GEN_76; // @[MMU.scala 185:72:@1656.12]
  wire [1:0] _GEN_77; // @[MMU.scala 183:30:@1651.10]
  wire  _GEN_78; // @[MMU.scala 183:30:@1651.10]
  wire [63:0] _GEN_79; // @[MMU.scala 183:30:@1651.10]
  wire [63:0] _GEN_80; // @[MMU.scala 183:30:@1651.10]
  wire [3:0] _GEN_81; // @[Conditional.scala 39:67:@1648.8]
  wire [63:0] _GEN_82; // @[Conditional.scala 39:67:@1648.8]
  wire [1:0] _GEN_83; // @[Conditional.scala 39:67:@1648.8]
  wire  _GEN_84; // @[Conditional.scala 39:67:@1648.8]
  wire [63:0] _GEN_85; // @[Conditional.scala 39:67:@1648.8]
  wire [63:0] _GEN_86; // @[Conditional.scala 39:67:@1648.8]
  wire [3:0] _GEN_87; // @[Conditional.scala 39:67:@1603.6]
  wire [63:0] _GEN_88; // @[Conditional.scala 39:67:@1603.6]
  wire  _GEN_90; // @[Conditional.scala 39:67:@1603.6]
  wire [1:0] _GEN_91; // @[Conditional.scala 39:67:@1603.6]
  wire [63:0] _GEN_92; // @[Conditional.scala 39:67:@1603.6]
  wire [63:0] _GEN_111; // @[Conditional.scala 39:67:@1603.6]
  wire [3:0] _GEN_113; // @[Conditional.scala 40:58:@1568.4]
  wire [63:0] _GEN_114; // @[Conditional.scala 40:58:@1568.4]
  wire  _GEN_115; // @[Conditional.scala 40:58:@1568.4]
  wire [1:0] _GEN_120; // @[Conditional.scala 40:58:@1568.4]
  wire [63:0] _GEN_123; // @[Conditional.scala 40:58:@1568.4]
  wire  _T_255; // @[Conditional.scala 37:30:@1665.4]
  wire  _T_256; // @[MMU.scala 198:20:@1667.6]
  wire  _T_257; // @[MMU.scala 205:29:@1673.10]
  wire [3:0] _GEN_144; // @[MMU.scala 215:38:@1687.12]
  wire [63:0] _GEN_145; // @[MMU.scala 215:38:@1687.12]
  wire [1:0] _GEN_147; // @[MMU.scala 205:44:@1674.10]
  wire [63:0] _GEN_148; // @[MMU.scala 205:44:@1674.10]
  wire [63:0] _GEN_149; // @[MMU.scala 205:44:@1674.10]
  wire  _GEN_154; // @[MMU.scala 205:44:@1674.10]
  wire [3:0] _GEN_155; // @[MMU.scala 205:44:@1674.10]
  wire [1:0] _GEN_156; // @[MMU.scala 230:35:@1703.10]
  wire [1:0] _GEN_158; // @[MMU.scala 203:23:@1672.8]
  wire [63:0] _GEN_159; // @[MMU.scala 203:23:@1672.8]
  wire [63:0] _GEN_160; // @[MMU.scala 203:23:@1672.8]
  wire  _GEN_165; // @[MMU.scala 203:23:@1672.8]
  wire [3:0] _GEN_166; // @[MMU.scala 203:23:@1672.8]
  wire  _GEN_167; // @[MMU.scala 203:23:@1672.8]
  wire [3:0] _GEN_168; // @[MMU.scala 198:32:@1668.6]
  wire [3:0] _GEN_169; // @[MMU.scala 198:32:@1668.6]
  wire [63:0] _GEN_170; // @[MMU.scala 198:32:@1668.6]
  wire [1:0] _GEN_171; // @[MMU.scala 198:32:@1668.6]
  wire [63:0] _GEN_172; // @[MMU.scala 198:32:@1668.6]
  wire [63:0] _GEN_173; // @[MMU.scala 198:32:@1668.6]
  wire  _GEN_178; // @[MMU.scala 198:32:@1668.6]
  wire  _GEN_179; // @[MMU.scala 198:32:@1668.6]
  wire  _T_264; // @[Conditional.scala 37:30:@1711.6]
  wire [1:0] _GEN_181; // @[MMU.scala 241:22:@1716.10]
  wire [63:0] _GEN_182; // @[MMU.scala 241:22:@1716.10]
  wire  _GEN_201; // @[MMU.scala 240:31:@1715.8]
  wire [1:0] _GEN_202; // @[MMU.scala 240:31:@1715.8]
  wire [63:0] _GEN_203; // @[MMU.scala 240:31:@1715.8]
  wire  _T_276; // @[Conditional.scala 37:30:@1756.8]
  wire [1:0] _GEN_222; // @[MMU.scala 259:31:@1760.10]
  wire [3:0] _GEN_223; // @[Conditional.scala 39:67:@1757.8]
  wire [63:0] _GEN_224; // @[Conditional.scala 39:67:@1757.8]
  wire [1:0] _GEN_225; // @[Conditional.scala 39:67:@1757.8]
  wire  _GEN_226; // @[Conditional.scala 39:67:@1757.8]
  wire [3:0] _GEN_227; // @[Conditional.scala 39:67:@1712.6]
  wire [63:0] _GEN_228; // @[Conditional.scala 39:67:@1712.6]
  wire  _GEN_230; // @[Conditional.scala 39:67:@1712.6]
  wire [1:0] _GEN_231; // @[Conditional.scala 39:67:@1712.6]
  wire [63:0] _GEN_232; // @[Conditional.scala 39:67:@1712.6]
  wire [3:0] _GEN_252; // @[Conditional.scala 40:58:@1666.4]
  wire [63:0] _GEN_253; // @[Conditional.scala 40:58:@1666.4]
  wire [1:0] _GEN_254; // @[Conditional.scala 40:58:@1666.4]
  wire [63:0] _GEN_256; // @[Conditional.scala 40:58:@1666.4]
  PTW ptw_if ( // @[MMU.scala 21:23:@1346.4]
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
  PTW ptw_mem ( // @[MMU.scala 22:23:@1349.4]
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
  assign if_free = if_status == 2'h0; // @[MMU.scala 38:30:@1376.4]
  assign mem_free = mem_status == 2'h0; // @[MMU.scala 39:31:@1377.4]
  assign _T_106 = if_free & mem_free; // @[MMU.scala 40:32:@1378.4]
  assign real_csr_satp = _T_106 ? io_csr_satp : csr_satp; // @[MMU.scala 40:23:@1379.4]
  assign real_csr_priv = _T_106 ? io_csr_priv : csr_priv; // @[MMU.scala 40:23:@1379.4]
  assign real_csr_mxr = _T_106 ? io_csr_mxr : csr_mxr; // @[MMU.scala 40:23:@1379.4]
  assign real_csr_sum = _T_106 ? io_csr_sum : csr_sum; // @[MMU.scala 40:23:@1379.4]
  assign _T_107 = real_csr_priv == 2'h0; // @[MMU.scala 45:35:@1380.4]
  assign _T_109 = ptw_if_io_rsp_U == 1'h0; // @[MMU.scala 45:49:@1381.4]
  assign e_if_user = _T_107 & _T_109; // @[MMU.scala 45:46:@1382.4]
  assign e_if_exec = ptw_if_io_rsp_X == 1'h0; // @[MMU.scala 46:21:@1383.4]
  assign _T_111 = ptw_if_io_pf | e_if_user; // @[MMU.scala 47:34:@1384.4]
  assign e_if = _T_111 | e_if_exec; // @[MMU.scala 47:47:@1385.4]
  assign _T_114 = ptw_mem_io_rsp_U == 1'h0; // @[MMU.scala 49:49:@1387.4]
  assign e_mem_user = _T_107 & _T_114; // @[MMU.scala 49:46:@1388.4]
  assign _T_115 = io_mem_mode[3]; // @[memoryCtrl.scala 20:35:@1389.4]
  assign _T_116 = ~ io_mem_mode; // @[memoryCtrl.scala 20:46:@1390.4]
  assign _T_118 = _T_116 == 4'h0; // @[memoryCtrl.scala 20:46:@1391.4]
  assign _T_120 = _T_118 == 1'h0; // @[memoryCtrl.scala 20:42:@1392.4]
  assign _T_121 = _T_115 & _T_120; // @[memoryCtrl.scala 20:39:@1393.4]
  assign _T_122 = ptw_mem_io_rsp_X & real_csr_mxr; // @[MMU.scala 50:83:@1394.4]
  assign _T_123 = ptw_mem_io_rsp_R | _T_122; // @[MMU.scala 50:65:@1395.4]
  assign _T_125 = _T_123 == 1'h0; // @[MMU.scala 50:49:@1396.4]
  assign e_mem_read = _T_121 & _T_125; // @[MMU.scala 50:46:@1397.4]
  assign _T_128 = _T_115 == 1'h0; // @[memoryCtrl.scala 21:34:@1399.4]
  assign _T_130 = ptw_mem_io_rsp_W == 1'h0; // @[MMU.scala 51:50:@1400.4]
  assign e_mem_write = _T_128 & _T_130; // @[MMU.scala 51:47:@1401.4]
  assign _T_131 = real_csr_priv == 2'h1; // @[MMU.scala 52:35:@1402.4]
  assign _T_133 = real_csr_sum == 1'h0; // @[MMU.scala 52:49:@1403.4]
  assign _T_134 = _T_131 & _T_133; // @[MMU.scala 52:46:@1404.4]
  assign e_mem_sum = _T_134 & ptw_mem_io_rsp_U; // @[MMU.scala 52:63:@1405.4]
  assign _T_135 = ptw_mem_io_pf | e_mem_user; // @[MMU.scala 53:35:@1406.4]
  assign _T_136 = _T_135 | e_mem_read; // @[MMU.scala 53:49:@1407.4]
  assign _T_137 = _T_136 | e_mem_write; // @[MMU.scala 53:63:@1408.4]
  assign e_mem = _T_137 | e_mem_sum; // @[MMU.scala 53:78:@1409.4]
  assign _T_138 = real_csr_satp[63:60]; // @[MMU.scala 55:30:@1410.4]
  assign mmu_en = _T_138 == 4'h8; // @[MMU.scala 55:38:@1411.4]
  assign is_mem = io_mem_mode != 4'hf; // @[MMU.scala 56:29:@1412.4]
  assign _T_140 = io_insr_mode != 4'hf; // @[MMU.scala 57:30:@1413.4]
  assign _T_142 = is_mem == 1'h0; // @[MMU.scala 57:46:@1414.4]
  assign is_if = _T_140 & _T_142; // @[MMU.scala 57:43:@1415.4]
  assign _T_144 = io_insr_addr - 64'hc0020000; // @[MMU.scala 67:62:@1417.4]
  assign _T_145 = $unsigned(_T_144); // @[MMU.scala 67:62:@1418.4]
  assign _T_146 = _T_145[63:0]; // @[MMU.scala 67:62:@1419.4]
  assign real_if_addr = mmu_en ? io_insr_addr : _T_146; // @[MMU.scala 67:26:@1420.4]
  assign _T_147 = io_mem_addr - 64'hc0020000; // @[MMU.scala 68:62:@1421.4]
  assign _T_148 = $unsigned(_T_147); // @[MMU.scala 68:62:@1422.4]
  assign _T_149 = _T_148[63:0]; // @[MMU.scala 68:62:@1423.4]
  assign real_mem_addr = mmu_en ? io_mem_addr : _T_149; // @[MMU.scala 68:26:@1424.4]
  assign _T_153 = if_addr[11:0]; // @[MMU.scala 69:66:@1427.4]
  assign ptw_if_addr = {25'h0,ptw_if_io_rsp_ppn_p2,ptw_if_io_rsp_ppn_p1,ptw_if_io_rsp_ppn_p0,_T_153}; // @[Cat.scala 30:58:@1429.4]
  assign _T_158 = mem_addr[11:0]; // @[MMU.scala 70:67:@1432.4]
  assign ptw_mem_addr = {25'h0,ptw_mem_io_rsp_ppn_p2,ptw_mem_io_rsp_ppn_p1,ptw_mem_io_rsp_ppn_p0,_T_158}; // @[Cat.scala 30:58:@1434.4]
  assign _T_170 = real_csr_satp[26:0]; // @[MMU.scala 74:36:@1445.4]
  assign _GEN_5 = io_insr_rst ? 1'h1 : if_rst; // @[MMU.scala 126:22:@1564.4]
  assign _T_228 = 2'h0 == if_status; // @[Conditional.scala 37:30:@1567.4]
  assign _T_229 = is_if & mem_free; // @[MMU.scala 132:19:@1569.6]
  assign _GEN_8 = ptw_if_io_mem_mode; // @[MMU.scala 143:36:@1583.10]
  assign _GEN_9 = ptw_if_io_mem_addr; // @[MMU.scala 143:36:@1583.10]
  assign _GEN_15 = mmu_en ? 2'h1 : 2'h2; // @[MMU.scala 137:23:@1575.8]
  assign _GEN_17 = mmu_en ? _GEN_8 : io_insr_mode; // @[MMU.scala 137:23:@1575.8]
  assign _GEN_18 = mmu_en ? _GEN_9 : real_if_addr; // @[MMU.scala 137:23:@1575.8]
  assign _GEN_19 = mmu_en ? if_pha : real_if_addr; // @[MMU.scala 137:23:@1575.8]
  assign _GEN_20 = _T_229 ? _GEN_17 : 4'hf; // @[MMU.scala 132:32:@1570.6]
  assign _GEN_21 = _T_229 ? io_insr_mode : if_mode; // @[MMU.scala 132:32:@1570.6]
  assign _GEN_22 = _T_229 ? real_if_addr : if_addr; // @[MMU.scala 132:32:@1570.6]
  assign _GEN_23 = _T_229 ? 1'h0 : _GEN_5; // @[MMU.scala 132:32:@1570.6]
  assign _GEN_27 = _T_229 ? mmu_en : 1'h0; // @[MMU.scala 132:32:@1570.6]
  assign _GEN_28 = _T_229 ? _GEN_15 : if_status; // @[MMU.scala 132:32:@1570.6]
  assign _GEN_30 = _T_229 ? _GEN_18 : real_if_addr; // @[MMU.scala 132:32:@1570.6]
  assign _GEN_31 = _T_229 ? _GEN_19 : if_pha; // @[MMU.scala 132:32:@1570.6]
  assign _T_236 = 2'h1 == if_status; // @[Conditional.scala 37:30:@1602.6]
  assign _GEN_33 = e_if ? 2'h0 : 2'h2; // @[MMU.scala 164:21:@1607.10]
  assign _GEN_34 = e_if ? if_pha : ptw_if_addr; // @[MMU.scala 164:21:@1607.10]
  assign _GEN_53 = ptw_if_io_ready ? e_if : 1'h0; // @[MMU.scala 163:30:@1606.8]
  assign _GEN_54 = ptw_if_io_ready ? _GEN_33 : if_status; // @[MMU.scala 163:30:@1606.8]
  assign _GEN_55 = ptw_if_io_ready ? _GEN_34 : if_pha; // @[MMU.scala 163:30:@1606.8]
  assign _T_248 = 2'h2 == if_status; // @[Conditional.scala 37:30:@1647.8]
  assign _T_250 = if_rst == 1'h0; // @[MMU.scala 185:47:@1653.12]
  assign _T_252 = io_insr_rst == 1'h0; // @[MMU.scala 185:58:@1654.12]
  assign _T_253 = _T_250 & _T_252; // @[MMU.scala 185:55:@1655.12]
  assign _GEN_75 = _T_253 ? if_addr : real_if_addr; // @[MMU.scala 185:72:@1656.12]
  assign _GEN_76 = _T_253 ? if_pha : real_if_addr; // @[MMU.scala 185:72:@1656.12]
  assign _GEN_77 = io_if_iom_ready ? 2'h0 : if_status; // @[MMU.scala 183:30:@1651.10]
  assign _GEN_78 = io_if_iom_ready ? _T_253 : 1'h0; // @[MMU.scala 183:30:@1651.10]
  assign _GEN_79 = io_if_iom_ready ? _GEN_75 : if_addr; // @[MMU.scala 183:30:@1651.10]
  assign _GEN_80 = io_if_iom_ready ? _GEN_76 : if_pha; // @[MMU.scala 183:30:@1651.10]
  assign _GEN_81 = _T_248 ? if_mode : 4'hf; // @[Conditional.scala 39:67:@1648.8]
  assign _GEN_82 = _T_248 ? if_pha : real_if_addr; // @[Conditional.scala 39:67:@1648.8]
  assign _GEN_83 = _T_248 ? _GEN_77 : if_status; // @[Conditional.scala 39:67:@1648.8]
  assign _GEN_84 = _T_248 ? _GEN_78 : 1'h0; // @[Conditional.scala 39:67:@1648.8]
  assign _GEN_85 = _T_248 ? _GEN_79 : if_addr; // @[Conditional.scala 39:67:@1648.8]
  assign _GEN_86 = _T_248 ? _GEN_80 : if_pha; // @[Conditional.scala 39:67:@1648.8]
  assign _GEN_87 = _T_236 ? ptw_if_io_mem_mode : _GEN_81; // @[Conditional.scala 39:67:@1603.6]
  assign _GEN_88 = _T_236 ? ptw_if_io_mem_addr : _GEN_82; // @[Conditional.scala 39:67:@1603.6]
  assign _GEN_90 = _T_236 ? _GEN_53 : _GEN_84; // @[Conditional.scala 39:67:@1603.6]
  assign _GEN_91 = _T_236 ? _GEN_54 : _GEN_83; // @[Conditional.scala 39:67:@1603.6]
  assign _GEN_92 = _T_236 ? _GEN_55 : _GEN_86; // @[Conditional.scala 39:67:@1603.6]
  assign _GEN_111 = _T_236 ? if_addr : _GEN_85; // @[Conditional.scala 39:67:@1603.6]
  assign _GEN_113 = _T_228 ? _GEN_21 : if_mode; // @[Conditional.scala 40:58:@1568.4]
  assign _GEN_114 = _T_228 ? _GEN_22 : _GEN_111; // @[Conditional.scala 40:58:@1568.4]
  assign _GEN_115 = _T_228 ? _GEN_23 : _GEN_5; // @[Conditional.scala 40:58:@1568.4]
  assign _GEN_120 = _T_228 ? _GEN_28 : _GEN_91; // @[Conditional.scala 40:58:@1568.4]
  assign _GEN_123 = _T_228 ? _GEN_31 : _GEN_92; // @[Conditional.scala 40:58:@1568.4]
  assign _T_255 = 2'h0 == mem_status; // @[Conditional.scala 37:30:@1665.4]
  assign _T_256 = is_mem & if_free; // @[MMU.scala 198:20:@1667.6]
  assign _T_257 = io_mem_addr == 64'h123456789abcdef0; // @[MMU.scala 205:29:@1673.10]
  assign _GEN_144 = ptw_mem_io_mem_mode; // @[MMU.scala 215:38:@1687.12]
  assign _GEN_145 = ptw_mem_io_mem_addr; // @[MMU.scala 215:38:@1687.12]
  assign _GEN_147 = _T_257 ? 2'h2 : 2'h1; // @[MMU.scala 205:44:@1674.10]
  assign _GEN_148 = _T_257 ? 64'h807ffff8 : _GEN_145; // @[MMU.scala 205:44:@1674.10]
  assign _GEN_149 = _T_257 ? 64'h807ffff8 : mem_pha; // @[MMU.scala 205:44:@1674.10]
  assign _GEN_154 = _T_257 ? 1'h0 : 1'h1; // @[MMU.scala 205:44:@1674.10]
  assign _GEN_155 = _T_257 ? io_mem_mode : _GEN_144; // @[MMU.scala 205:44:@1674.10]
  assign _GEN_156 = io_mem_iom_ready ? 2'h0 : 2'h2; // @[MMU.scala 230:35:@1703.10]
  assign _GEN_158 = mmu_en ? _GEN_147 : _GEN_156; // @[MMU.scala 203:23:@1672.8]
  assign _GEN_159 = mmu_en ? _GEN_148 : real_mem_addr; // @[MMU.scala 203:23:@1672.8]
  assign _GEN_160 = mmu_en ? _GEN_149 : real_mem_addr; // @[MMU.scala 203:23:@1672.8]
  assign _GEN_165 = mmu_en ? _GEN_154 : 1'h0; // @[MMU.scala 203:23:@1672.8]
  assign _GEN_166 = mmu_en ? _GEN_155 : io_mem_mode; // @[MMU.scala 203:23:@1672.8]
  assign _GEN_167 = mmu_en ? 1'h0 : io_mem_iom_ready; // @[MMU.scala 203:23:@1672.8]
  assign _GEN_168 = _T_256 ? _GEN_166 : 4'hf; // @[MMU.scala 198:32:@1668.6]
  assign _GEN_169 = _T_256 ? io_mem_mode : mem_mode; // @[MMU.scala 198:32:@1668.6]
  assign _GEN_170 = _T_256 ? real_mem_addr : mem_addr; // @[MMU.scala 198:32:@1668.6]
  assign _GEN_171 = _T_256 ? _GEN_158 : mem_status; // @[MMU.scala 198:32:@1668.6]
  assign _GEN_172 = _T_256 ? _GEN_159 : real_mem_addr; // @[MMU.scala 198:32:@1668.6]
  assign _GEN_173 = _T_256 ? _GEN_160 : mem_pha; // @[MMU.scala 198:32:@1668.6]
  assign _GEN_178 = _T_256 ? _GEN_165 : 1'h0; // @[MMU.scala 198:32:@1668.6]
  assign _GEN_179 = _T_256 ? _GEN_167 : 1'h0; // @[MMU.scala 198:32:@1668.6]
  assign _T_264 = 2'h1 == mem_status; // @[Conditional.scala 37:30:@1711.6]
  assign _GEN_181 = e_mem ? 2'h0 : 2'h2; // @[MMU.scala 241:22:@1716.10]
  assign _GEN_182 = e_mem ? mem_pha : ptw_mem_addr; // @[MMU.scala 241:22:@1716.10]
  assign _GEN_201 = ptw_mem_io_ready ? e_mem : 1'h0; // @[MMU.scala 240:31:@1715.8]
  assign _GEN_202 = ptw_mem_io_ready ? _GEN_181 : mem_status; // @[MMU.scala 240:31:@1715.8]
  assign _GEN_203 = ptw_mem_io_ready ? _GEN_182 : mem_pha; // @[MMU.scala 240:31:@1715.8]
  assign _T_276 = 2'h2 == mem_status; // @[Conditional.scala 37:30:@1756.8]
  assign _GEN_222 = io_mem_iom_ready ? 2'h0 : mem_status; // @[MMU.scala 259:31:@1760.10]
  assign _GEN_223 = _T_276 ? mem_mode : 4'hf; // @[Conditional.scala 39:67:@1757.8]
  assign _GEN_224 = _T_276 ? mem_pha : real_mem_addr; // @[Conditional.scala 39:67:@1757.8]
  assign _GEN_225 = _T_276 ? _GEN_222 : mem_status; // @[Conditional.scala 39:67:@1757.8]
  assign _GEN_226 = _T_276 ? io_mem_iom_ready : 1'h0; // @[Conditional.scala 39:67:@1757.8]
  assign _GEN_227 = _T_264 ? ptw_mem_io_mem_mode : _GEN_223; // @[Conditional.scala 39:67:@1712.6]
  assign _GEN_228 = _T_264 ? ptw_mem_io_mem_addr : _GEN_224; // @[Conditional.scala 39:67:@1712.6]
  assign _GEN_230 = _T_264 ? _GEN_201 : _GEN_226; // @[Conditional.scala 39:67:@1712.6]
  assign _GEN_231 = _T_264 ? _GEN_202 : _GEN_225; // @[Conditional.scala 39:67:@1712.6]
  assign _GEN_232 = _T_264 ? _GEN_203 : mem_pha; // @[Conditional.scala 39:67:@1712.6]
  assign _GEN_252 = _T_255 ? _GEN_169 : mem_mode; // @[Conditional.scala 40:58:@1666.4]
  assign _GEN_253 = _T_255 ? _GEN_170 : mem_addr; // @[Conditional.scala 40:58:@1666.4]
  assign _GEN_254 = _T_255 ? _GEN_171 : _GEN_231; // @[Conditional.scala 40:58:@1666.4]
  assign _GEN_256 = _T_255 ? _GEN_173 : _GEN_232; // @[Conditional.scala 40:58:@1666.4]
  assign io_mem_ready = _T_255 ? _GEN_179 : _GEN_230; // @[MMU.scala 87:21:@1464.4 MMU.scala 232:27:@1705.12 MMU.scala 243:29:@1718.12 MMU.scala 261:23:@1762.12]
  assign io_mem_rdata = io_mem_iom_rdata; // @[MMU.scala 83:21:@1461.4]
  assign io_insr_ready = _T_228 ? 1'h0 : _GEN_90; // @[MMU.scala 86:21:@1463.4 MMU.scala 166:30:@1609.12 MMU.scala 187:25:@1657.14]
  assign io_insr_rdata = io_if_iom_rdata; // @[MMU.scala 80:21:@1458.4]
  assign io_if_iom_mode = _T_228 ? _GEN_20 : _GEN_87; // @[MMU.scala 77:21:@1455.4 MMU.scala 133:27:@1571.8 MMU.scala 146:33:@1586.12 MMU.scala 161:27:@1604.8 MMU.scala 181:25:@1649.10]
  assign io_if_iom_addr = _T_228 ? _GEN_30 : _GEN_88; // @[MMU.scala 78:21:@1456.4 MMU.scala 147:33:@1587.12 MMU.scala 151:33:@1591.12 MMU.scala 162:27:@1605.8 MMU.scala 182:22:@1650.10]
  assign io_mem_iom_mode = _T_255 ? _GEN_168 : _GEN_227; // @[MMU.scala 81:21:@1459.4 MMU.scala 199:27:@1669.8 MMU.scala 218:36:@1690.14 MMU.scala 238:28:@1713.8 MMU.scala 257:25:@1758.10]
  assign io_mem_iom_addr = _T_255 ? _GEN_172 : _GEN_228; // @[MMU.scala 82:21:@1460.4 MMU.scala 207:34:@1676.12 MMU.scala 219:36:@1691.14 MMU.scala 222:36:@1695.14 MMU.scala 239:28:@1714.8 MMU.scala 258:23:@1759.10]
  assign io_mem_iom_wdata = io_mem_wdata; // @[MMU.scala 84:21:@1462.4]
  assign ptw_if_clock = clock; // @[:@1347.4]
  assign ptw_if_reset = reset; // @[:@1348.4]
  assign ptw_if_io_root_p2 = _T_170[26:18]; // @[MMU.scala 91:21:@1469.4]
  assign ptw_if_io_root_p1 = _T_170[17:9]; // @[MMU.scala 91:21:@1468.4]
  assign ptw_if_io_root_p0 = _T_170[8:0]; // @[MMU.scala 91:21:@1467.4]
  assign ptw_if_io_req_p2 = io_insr_addr[38:30]; // @[MMU.scala 99:20:@1478.4]
  assign ptw_if_io_req_p1 = io_insr_addr[29:21]; // @[MMU.scala 100:20:@1480.4]
  assign ptw_if_io_req_p0 = io_insr_addr[20:12]; // @[MMU.scala 101:20:@1482.4]
  assign ptw_if_io_req_valid = _T_228 ? _GEN_27 : 1'h0; // @[MMU.scala 102:23:@1483.4 MMU.scala 145:33:@1585.12]
  assign ptw_if_io_mem_ready = io_if_iom_ready; // @[MMU.scala 94:24:@1473.4]
  assign ptw_if_io_mem_rdata = io_if_iom_rdata; // @[MMU.scala 95:24:@1474.4]
  assign ptw_mem_clock = clock; // @[:@1350.4]
  assign ptw_mem_reset = reset; // @[:@1351.4]
  assign ptw_mem_io_root_p2 = _T_170[26:18]; // @[MMU.scala 92:21:@1472.4]
  assign ptw_mem_io_root_p1 = _T_170[17:9]; // @[MMU.scala 92:21:@1471.4]
  assign ptw_mem_io_root_p0 = _T_170[8:0]; // @[MMU.scala 92:21:@1470.4]
  assign ptw_mem_io_req_p2 = io_mem_addr[38:30]; // @[MMU.scala 104:21:@1485.4]
  assign ptw_mem_io_req_p1 = io_mem_addr[29:21]; // @[MMU.scala 105:21:@1487.4]
  assign ptw_mem_io_req_p0 = io_mem_addr[20:12]; // @[MMU.scala 106:21:@1489.4]
  assign ptw_mem_io_req_valid = _T_255 ? _GEN_178 : 1'h0; // @[MMU.scala 107:24:@1490.4 MMU.scala 217:36:@1689.14]
  assign ptw_mem_io_mem_ready = io_mem_iom_ready; // @[MMU.scala 96:24:@1475.4]
  assign ptw_mem_io_mem_rdata = io_mem_iom_rdata; // @[MMU.scala 97:24:@1476.4]
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
      if (_T_228) begin
        if (_T_229) begin
          if (mmu_en) begin
            if_status <= 2'h1;
          end else begin
            if_status <= 2'h2;
          end
        end
      end else begin
        if (_T_236) begin
          if (ptw_if_io_ready) begin
            if (e_if) begin
              if_status <= 2'h0;
            end else begin
              if_status <= 2'h2;
            end
          end
        end else begin
          if (_T_248) begin
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
      if (_T_228) begin
        if (_T_229) begin
          if_mode <= io_insr_mode;
        end
      end
    end
    if (reset) begin
      if_addr <= 64'h0;
    end else begin
      if (_T_228) begin
        if (_T_229) begin
          if (mmu_en) begin
            if_addr <= io_insr_addr;
          end else begin
            if_addr <= _T_146;
          end
        end
      end else begin
        if (!(_T_236)) begin
          if (_T_248) begin
            if (io_if_iom_ready) begin
              if (!(_T_253)) begin
                if (mmu_en) begin
                  if_addr <= io_insr_addr;
                end else begin
                  if_addr <= _T_146;
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
      if (_T_228) begin
        if (_T_229) begin
          if (!(mmu_en)) begin
            if (mmu_en) begin
              if_pha <= io_insr_addr;
            end else begin
              if_pha <= _T_146;
            end
          end
        end
      end else begin
        if (_T_236) begin
          if (ptw_if_io_ready) begin
            if (!(e_if)) begin
              if_pha <= ptw_if_addr;
            end
          end
        end else begin
          if (_T_248) begin
            if (io_if_iom_ready) begin
              if (!(_T_253)) begin
                if (mmu_en) begin
                  if_pha <= io_insr_addr;
                end else begin
                  if_pha <= _T_146;
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
      if (_T_228) begin
        if (_T_229) begin
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
      if (_T_255) begin
        if (_T_256) begin
          if (mmu_en) begin
            if (_T_257) begin
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
        if (_T_264) begin
          if (ptw_mem_io_ready) begin
            if (e_mem) begin
              mem_status <= 2'h0;
            end else begin
              mem_status <= 2'h2;
            end
          end
        end else begin
          if (_T_276) begin
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
      if (_T_255) begin
        if (_T_256) begin
          mem_mode <= io_mem_mode;
        end
      end
    end
    if (reset) begin
      mem_addr <= 64'h0;
    end else begin
      if (_T_255) begin
        if (_T_256) begin
          if (mmu_en) begin
            mem_addr <= io_mem_addr;
          end else begin
            mem_addr <= _T_149;
          end
        end
      end
    end
    if (reset) begin
      mem_pha <= 64'h0;
    end else begin
      if (_T_255) begin
        if (_T_256) begin
          if (mmu_en) begin
            if (_T_257) begin
              mem_pha <= 64'h807ffff8;
            end
          end else begin
            if (mmu_en) begin
              mem_pha <= io_mem_addr;
            end else begin
              mem_pha <= _T_149;
            end
          end
        end
      end else begin
        if (_T_264) begin
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
module IOManager( // @[:@1783.2]
  input         clock, // @[:@1784.4]
  input         reset, // @[:@1785.4]
  input  [3:0]  io_mem_if_mode, // @[:@1786.4]
  output        io_mem_if_ready, // @[:@1786.4]
  input  [63:0] io_mem_if_addr, // @[:@1786.4]
  output [63:0] io_mem_if_rdata, // @[:@1786.4]
  input  [3:0]  io_mem_mem_mode, // @[:@1786.4]
  output        io_mem_mem_ready, // @[:@1786.4]
  input  [63:0] io_mem_mem_addr, // @[:@1786.4]
  output [63:0] io_mem_mem_rdata, // @[:@1786.4]
  input  [63:0] io_mem_mem_wdata, // @[:@1786.4]
  output [3:0]  io_mem_out_mode, // @[:@1786.4]
  input         io_mem_out_ready, // @[:@1786.4]
  output [63:0] io_mem_out_addr, // @[:@1786.4]
  input  [63:0] io_mem_out_rdata, // @[:@1786.4]
  output [63:0] io_mem_out_wdata, // @[:@1786.4]
  output [3:0]  io_serial_out_mode, // @[:@1786.4]
  input         io_serial_out_ready, // @[:@1786.4]
  output [63:0] io_serial_out_addr, // @[:@1786.4]
  input  [63:0] io_serial_out_rdata, // @[:@1786.4]
  output [63:0] io_serial_out_wdata, // @[:@1786.4]
  output [1:0]  io_debug_if_wait, // @[:@1786.4]
  output [1:0]  io_debug_mem_wait, // @[:@1786.4]
  output        io_debug_if_ready, // @[:@1786.4]
  output        io_debug_mem_ready, // @[:@1786.4]
  output [3:0]  io_debug_if_mode, // @[:@1786.4]
  output [3:0]  io_debug_mem_mode, // @[:@1786.4]
  output [63:0] io_debug_if_addr, // @[:@1786.4]
  output [63:0] io_debug_mem_addr, // @[:@1786.4]
  output        io_debug_if_error, // @[:@1786.4]
  output        io_debug_mem_error // @[:@1786.4]
);
  reg [1:0] ifWait; // @[iomanager.scala 61:25:@1814.4]
  reg [31:0] _RAND_0;
  reg [1:0] memWait; // @[iomanager.scala 62:26:@1815.4]
  reg [31:0] _RAND_1;
  reg  if_error; // @[iomanager.scala 63:27:@1816.4]
  reg [31:0] _RAND_2;
  reg  mem_error; // @[iomanager.scala 64:28:@1817.4]
  reg [31:0] _RAND_3;
  wire  _T_95; // @[Conditional.scala 37:30:@1818.4]
  wire  _T_96; // @[Conditional.scala 37:30:@1824.6]
  wire [63:0] _GEN_0; // @[Conditional.scala 39:67:@1825.6]
  wire  _GEN_1; // @[Conditional.scala 39:67:@1825.6]
  wire  _GEN_3; // @[Conditional.scala 40:58:@1819.4]
  wire  _T_97; // @[Conditional.scala 37:30:@1829.4]
  wire  _T_98; // @[Conditional.scala 37:30:@1835.6]
  wire [63:0] _GEN_4; // @[Conditional.scala 39:67:@1836.6]
  wire  _GEN_5; // @[Conditional.scala 39:67:@1836.6]
  wire  _GEN_7; // @[Conditional.scala 40:58:@1830.4]
  wire  _T_99; // @[iomanager.scala 88:26:@1840.4]
  wire  _T_101; // @[iomanager.scala 88:42:@1841.4]
  wire  _T_102; // @[iomanager.scala 88:39:@1842.4]
  wire [1:0] _T_103; // @[iomanager.scala 88:18:@1843.4]
  wire  _T_104; // @[iomanager.scala 89:28:@1845.4]
  wire  _T_106; // @[iomanager.scala 89:44:@1846.4]
  wire  _T_107; // @[iomanager.scala 89:41:@1847.4]
  wire [1:0] _T_108; // @[iomanager.scala 89:19:@1848.4]
  wire  _T_110; // @[iomanager.scala 101:18:@1852.4]
  wire  _T_111; // @[iomanager.scala 101:41:@1853.4]
  wire  _T_112; // @[iomanager.scala 101:31:@1854.4]
  wire  _T_113; // @[iomanager.scala 101:66:@1855.4]
  wire  _T_114; // @[iomanager.scala 101:54:@1856.4]
  wire  _T_120; // @[iomanager.scala 16:43:@1859.6]
  wire  _T_123; // @[iomanager.scala 17:25:@1869.8]
  wire  _T_124; // @[iomanager.scala 17:49:@1870.8]
  wire  _T_125; // @[iomanager.scala 17:41:@1871.8]
  wire  _T_129; // @[iomanager.scala 122:15:@1881.10]
  wire [63:0] _GEN_8; // @[iomanager.scala 112:37:@1872.8]
  wire [3:0] _GEN_9; // @[iomanager.scala 112:37:@1872.8]
  wire [63:0] _GEN_10; // @[iomanager.scala 112:37:@1872.8]
  wire [1:0] _GEN_11; // @[iomanager.scala 112:37:@1872.8]
  wire  _GEN_12; // @[iomanager.scala 112:37:@1872.8]
  wire  _GEN_13; // @[iomanager.scala 112:37:@1872.8]
  wire [63:0] _GEN_14; // @[iomanager.scala 102:28:@1861.6]
  wire [3:0] _GEN_15; // @[iomanager.scala 102:28:@1861.6]
  wire [63:0] _GEN_16; // @[iomanager.scala 102:28:@1861.6]
  wire [1:0] _GEN_17; // @[iomanager.scala 102:28:@1861.6]
  wire  _GEN_18; // @[iomanager.scala 102:28:@1861.6]
  wire [63:0] _GEN_19; // @[iomanager.scala 102:28:@1861.6]
  wire [3:0] _GEN_20; // @[iomanager.scala 102:28:@1861.6]
  wire [63:0] _GEN_21; // @[iomanager.scala 102:28:@1861.6]
  wire  _GEN_22; // @[iomanager.scala 102:28:@1861.6]
  wire [63:0] _GEN_23; // @[iomanager.scala 101:80:@1857.4]
  wire [3:0] _GEN_24; // @[iomanager.scala 101:80:@1857.4]
  wire [63:0] _GEN_25; // @[iomanager.scala 101:80:@1857.4]
  wire [1:0] _GEN_26; // @[iomanager.scala 101:80:@1857.4]
  wire  _GEN_31; // @[iomanager.scala 101:80:@1857.4]
  wire  _T_133; // @[iomanager.scala 128:30:@1890.4]
  wire  _T_134; // @[iomanager.scala 128:66:@1891.4]
  wire  _T_135; // @[iomanager.scala 128:54:@1892.4]
  wire  _T_136; // @[iomanager.scala 128:91:@1893.4]
  wire  _T_137; // @[iomanager.scala 128:79:@1894.4]
  wire  _T_139; // @[iomanager.scala 16:43:@1897.6]
  wire [63:0] _GEN_32; // @[iomanager.scala 129:30:@1899.6]
  wire [3:0] _GEN_33; // @[iomanager.scala 129:30:@1899.6]
  wire [63:0] _GEN_34; // @[iomanager.scala 129:30:@1899.6]
  wire [1:0] _GEN_35; // @[iomanager.scala 129:30:@1899.6]
  wire  _GEN_36; // @[iomanager.scala 129:30:@1899.6]
  wire  _GEN_37; // @[iomanager.scala 129:30:@1899.6]
  wire [1:0] _GEN_41; // @[iomanager.scala 128:105:@1895.4]
  wire  _GEN_43; // @[iomanager.scala 128:105:@1895.4]
  wire  _GEN_44; // @[iomanager.scala 122:15:@1883.12]
  wire  _GEN_45; // @[iomanager.scala 122:15:@1883.12]
  wire  _GEN_46; // @[iomanager.scala 122:15:@1883.12]
  wire  _GEN_47; // @[iomanager.scala 122:15:@1883.12]
  wire  _GEN_48; // @[iomanager.scala 134:19:@1910.10]
  wire  _GEN_49; // @[iomanager.scala 134:19:@1910.10]
  assign _T_95 = 2'h1 == ifWait; // @[Conditional.scala 37:30:@1818.4]
  assign _T_96 = 2'h2 == ifWait; // @[Conditional.scala 37:30:@1824.6]
  assign _GEN_0 = _T_96 ? io_serial_out_rdata : 64'h0; // @[Conditional.scala 39:67:@1825.6]
  assign _GEN_1 = _T_96 ? io_serial_out_ready : 1'h0; // @[Conditional.scala 39:67:@1825.6]
  assign _GEN_3 = _T_95 ? io_mem_out_ready : _GEN_1; // @[Conditional.scala 40:58:@1819.4]
  assign _T_97 = 2'h1 == memWait; // @[Conditional.scala 37:30:@1829.4]
  assign _T_98 = 2'h2 == memWait; // @[Conditional.scala 37:30:@1835.6]
  assign _GEN_4 = _T_98 ? io_serial_out_rdata : 64'h0; // @[Conditional.scala 39:67:@1836.6]
  assign _GEN_5 = _T_98 ? io_serial_out_ready : 1'h0; // @[Conditional.scala 39:67:@1836.6]
  assign _GEN_7 = _T_97 ? io_mem_out_ready : _GEN_5; // @[Conditional.scala 40:58:@1830.4]
  assign _T_99 = ifWait != 2'h0; // @[iomanager.scala 88:26:@1840.4]
  assign _T_101 = io_mem_if_ready == 1'h0; // @[iomanager.scala 88:42:@1841.4]
  assign _T_102 = _T_99 & _T_101; // @[iomanager.scala 88:39:@1842.4]
  assign _T_103 = _T_102 ? ifWait : 2'h0; // @[iomanager.scala 88:18:@1843.4]
  assign _T_104 = memWait != 2'h0; // @[iomanager.scala 89:28:@1845.4]
  assign _T_106 = io_mem_mem_ready == 1'h0; // @[iomanager.scala 89:44:@1846.4]
  assign _T_107 = _T_104 & _T_106; // @[iomanager.scala 89:41:@1847.4]
  assign _T_108 = _T_107 ? memWait : 2'h0; // @[iomanager.scala 89:19:@1848.4]
  assign _T_110 = memWait == 2'h0; // @[iomanager.scala 101:18:@1852.4]
  assign _T_111 = ifWait == 2'h0; // @[iomanager.scala 101:41:@1853.4]
  assign _T_112 = _T_110 & _T_111; // @[iomanager.scala 101:31:@1854.4]
  assign _T_113 = io_mem_mem_mode != 4'hf; // @[iomanager.scala 101:66:@1855.4]
  assign _T_114 = _T_112 & _T_113; // @[iomanager.scala 101:54:@1856.4]
  assign _T_120 = io_mem_mem_addr < 64'h7ffff8; // @[iomanager.scala 16:43:@1859.6]
  assign _T_123 = io_mem_mem_addr >= 64'h7ffff8; // @[iomanager.scala 17:25:@1869.8]
  assign _T_124 = io_mem_mem_addr < 64'h800000; // @[iomanager.scala 17:49:@1870.8]
  assign _T_125 = _T_123 & _T_124; // @[iomanager.scala 17:41:@1871.8]
  assign _T_129 = reset == 1'h0; // @[iomanager.scala 122:15:@1881.10]
  assign _GEN_8 = _T_125 ? io_mem_mem_wdata : 64'h0; // @[iomanager.scala 112:37:@1872.8]
  assign _GEN_9 = _T_125 ? io_mem_mem_mode : 4'hf; // @[iomanager.scala 112:37:@1872.8]
  assign _GEN_10 = _T_125 ? io_mem_mem_addr : 64'h0; // @[iomanager.scala 112:37:@1872.8]
  assign _GEN_11 = _T_125 ? 2'h2 : _T_108; // @[iomanager.scala 112:37:@1872.8]
  assign _GEN_12 = _T_125 ? 1'h0 : _GEN_7; // @[iomanager.scala 112:37:@1872.8]
  assign _GEN_13 = _T_125 ? mem_error : 1'h1; // @[iomanager.scala 112:37:@1872.8]
  assign _GEN_14 = _T_120 ? io_mem_mem_wdata : 64'h0; // @[iomanager.scala 102:28:@1861.6]
  assign _GEN_15 = _T_120 ? io_mem_mem_mode : 4'hf; // @[iomanager.scala 102:28:@1861.6]
  assign _GEN_16 = _T_120 ? io_mem_mem_addr : 64'h0; // @[iomanager.scala 102:28:@1861.6]
  assign _GEN_17 = _T_120 ? 2'h1 : _GEN_11; // @[iomanager.scala 102:28:@1861.6]
  assign _GEN_18 = _T_120 ? 1'h0 : _GEN_12; // @[iomanager.scala 102:28:@1861.6]
  assign _GEN_19 = _T_120 ? 64'h0 : _GEN_8; // @[iomanager.scala 102:28:@1861.6]
  assign _GEN_20 = _T_120 ? 4'hf : _GEN_9; // @[iomanager.scala 102:28:@1861.6]
  assign _GEN_21 = _T_120 ? 64'h0 : _GEN_10; // @[iomanager.scala 102:28:@1861.6]
  assign _GEN_22 = _T_120 ? mem_error : _GEN_13; // @[iomanager.scala 102:28:@1861.6]
  assign _GEN_23 = _T_114 ? _GEN_14 : 64'h0; // @[iomanager.scala 101:80:@1857.4]
  assign _GEN_24 = _T_114 ? _GEN_15 : 4'hf; // @[iomanager.scala 101:80:@1857.4]
  assign _GEN_25 = _T_114 ? _GEN_16 : 64'h0; // @[iomanager.scala 101:80:@1857.4]
  assign _GEN_26 = _T_114 ? _GEN_17 : _T_108; // @[iomanager.scala 101:80:@1857.4]
  assign _GEN_31 = _T_114 ? _GEN_22 : mem_error; // @[iomanager.scala 101:80:@1857.4]
  assign _T_133 = _T_111 & _T_110; // @[iomanager.scala 128:30:@1890.4]
  assign _T_134 = io_mem_mem_mode == 4'hf; // @[iomanager.scala 128:66:@1891.4]
  assign _T_135 = _T_133 & _T_134; // @[iomanager.scala 128:54:@1892.4]
  assign _T_136 = io_mem_if_mode != 4'hf; // @[iomanager.scala 128:91:@1893.4]
  assign _T_137 = _T_135 & _T_136; // @[iomanager.scala 128:79:@1894.4]
  assign _T_139 = io_mem_if_addr < 64'h7ffff8; // @[iomanager.scala 16:43:@1897.6]
  assign _GEN_32 = _T_139 ? 64'h0 : _GEN_23; // @[iomanager.scala 129:30:@1899.6]
  assign _GEN_33 = _T_139 ? io_mem_if_mode : _GEN_24; // @[iomanager.scala 129:30:@1899.6]
  assign _GEN_34 = _T_139 ? io_mem_if_addr : _GEN_25; // @[iomanager.scala 129:30:@1899.6]
  assign _GEN_35 = _T_139 ? 2'h1 : _T_103; // @[iomanager.scala 129:30:@1899.6]
  assign _GEN_36 = _T_139 ? 1'h0 : _GEN_3; // @[iomanager.scala 129:30:@1899.6]
  assign _GEN_37 = _T_139 ? if_error : 1'h1; // @[iomanager.scala 129:30:@1899.6]
  assign _GEN_41 = _T_137 ? _GEN_35 : _T_103; // @[iomanager.scala 128:105:@1895.4]
  assign _GEN_43 = _T_137 ? _GEN_37 : if_error; // @[iomanager.scala 128:105:@1895.4]
  assign io_mem_if_ready = _T_137 ? _GEN_36 : _GEN_3; // @[iomanager.scala 53:16:@1802.4 iomanager.scala 71:18:@1821.6 iomanager.scala 71:18:@1827.8 iomanager.scala 132:23:@1904.8]
  assign io_mem_if_rdata = _T_95 ? io_mem_out_rdata : _GEN_0; // @[iomanager.scala 53:16:@1800.4 iomanager.scala 70:18:@1820.6 iomanager.scala 70:18:@1826.8]
  assign io_mem_mem_ready = _T_114 ? _GEN_18 : _GEN_7; // @[iomanager.scala 52:16:@1797.4 iomanager.scala 71:18:@1832.6 iomanager.scala 71:18:@1838.8 iomanager.scala 110:23:@1866.8 iomanager.scala 119:23:@1877.10]
  assign io_mem_mem_rdata = _T_97 ? io_mem_out_rdata : _GEN_4; // @[iomanager.scala 52:16:@1795.4 iomanager.scala 70:18:@1831.6 iomanager.scala 70:18:@1837.8]
  assign io_mem_out_mode = _T_137 ? _GEN_33 : _GEN_24; // @[iomanager.scala 54:20:@1808.4 iomanager.scala 76:20:@1863.8 iomanager.scala 76:20:@1901.8]
  assign io_mem_out_addr = _T_137 ? _GEN_34 : _GEN_25; // @[iomanager.scala 54:20:@1806.4 iomanager.scala 77:20:@1864.8 iomanager.scala 77:20:@1902.8]
  assign io_mem_out_wdata = _T_137 ? _GEN_32 : _GEN_23; // @[iomanager.scala 54:20:@1804.4 iomanager.scala 75:20:@1862.8 iomanager.scala 75:20:@1900.8]
  assign io_serial_out_mode = _T_114 ? _GEN_20 : 4'hf; // @[iomanager.scala 55:20:@1813.4 iomanager.scala 76:20:@1874.10]
  assign io_serial_out_addr = _T_114 ? _GEN_21 : 64'h0; // @[iomanager.scala 55:20:@1811.4 iomanager.scala 77:20:@1875.10]
  assign io_serial_out_wdata = _T_114 ? _GEN_19 : 64'h0; // @[iomanager.scala 55:20:@1809.4 iomanager.scala 75:20:@1873.10]
  assign io_debug_if_wait = ifWait; // @[iomanager.scala 140:22:@1915.4]
  assign io_debug_mem_wait = memWait; // @[iomanager.scala 142:23:@1917.4]
  assign io_debug_if_ready = io_mem_if_ready; // @[iomanager.scala 141:23:@1916.4]
  assign io_debug_mem_ready = io_mem_mem_ready; // @[iomanager.scala 143:24:@1918.4]
  assign io_debug_if_mode = io_mem_if_mode; // @[iomanager.scala 144:22:@1919.4]
  assign io_debug_mem_mode = io_mem_mem_mode; // @[iomanager.scala 145:23:@1920.4]
  assign io_debug_if_addr = io_mem_if_addr; // @[iomanager.scala 146:22:@1921.4]
  assign io_debug_mem_addr = io_mem_mem_addr; // @[iomanager.scala 147:23:@1922.4]
  assign io_debug_if_error = if_error; // @[iomanager.scala 148:23:@1923.4]
  assign io_debug_mem_error = mem_error; // @[iomanager.scala 149:24:@1924.4]
  assign _GEN_44 = _T_120 == 1'h0; // @[iomanager.scala 122:15:@1883.12]
  assign _GEN_45 = _T_114 & _GEN_44; // @[iomanager.scala 122:15:@1883.12]
  assign _GEN_46 = _T_125 == 1'h0; // @[iomanager.scala 122:15:@1883.12]
  assign _GEN_47 = _GEN_45 & _GEN_46; // @[iomanager.scala 122:15:@1883.12]
  assign _GEN_48 = _T_139 == 1'h0; // @[iomanager.scala 134:19:@1910.10]
  assign _GEN_49 = _T_137 & _GEN_48; // @[iomanager.scala 134:19:@1910.10]
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
        if (_T_139) begin
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
        if (_T_120) begin
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
        if (!(_T_139)) begin
          if_error <= 1'h1;
        end
      end
    end
    if (reset) begin
      mem_error <= 1'h0;
    end else begin
      if (_T_114) begin
        if (!(_T_120)) begin
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
          $fwrite(32'h80000002,"[IO] MEM access invalid address: %x\n",io_mem_mem_addr); // @[iomanager.scala 122:15:@1883.12]
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
          $fwrite(32'h80000002,"[IO] IF access invalid address: %x\n",io_mem_if_addr); // @[iomanager.scala 134:19:@1910.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module IF_ID( // @[:@1926.2]
  input         clock, // @[:@1927.4]
  input         reset, // @[:@1928.4]
  input         io_en, // @[:@1929.4]
  input         io_pass, // @[:@1929.4]
  input         io_flush, // @[:@1929.4]
  input  [31:0] io_insi, // @[:@1929.4]
  input  [63:0] io_pci, // @[:@1929.4]
  input  [63:0] io_insci, // @[:@1929.4]
  input  [63:0] io_icdi, // @[:@1929.4]
  input         io_lastloadin_valid, // @[:@1929.4]
  input  [4:0]  io_lastloadin_index, // @[:@1929.4]
  input  [63:0] io_excep_i_pc, // @[:@1929.4]
  input         io_excep_i_inst_valid, // @[:@1929.4]
  output [31:0] io_inso, // @[:@1929.4]
  output [63:0] io_pco, // @[:@1929.4]
  output [63:0] io_insco, // @[:@1929.4]
  output [63:0] io_icdo, // @[:@1929.4]
  output        io_lastloadout_valid, // @[:@1929.4]
  output [4:0]  io_lastloadout_index, // @[:@1929.4]
  output        io_excep_o_valid, // @[:@1929.4]
  output [31:0] io_excep_o_code, // @[:@1929.4]
  output [31:0] io_excep_o_value, // @[:@1929.4]
  output [63:0] io_excep_o_pc, // @[:@1929.4]
  output        io_excep_o_inst_valid // @[:@1929.4]
);
  reg [31:0] ins; // @[if_id.scala 27:23:@1931.4]
  reg [31:0] _RAND_0;
  reg [63:0] pc; // @[if_id.scala 30:23:@1933.4]
  reg [63:0] _RAND_1;
  reg [63:0] insc; // @[if_id.scala 32:23:@1934.4]
  reg [63:0] _RAND_2;
  reg [63:0] icd; // @[if_id.scala 33:23:@1936.4]
  reg [63:0] _RAND_3;
  reg  lastload_valid; // @[if_id.scala 34:35:@1937.4]
  reg [31:0] _RAND_4;
  reg [4:0] lastload_index; // @[if_id.scala 35:35:@1938.4]
  reg [31:0] _RAND_5;
  reg  excep_valid; // @[if_id.scala 36:24:@1952.4]
  reg [31:0] _RAND_6;
  reg [31:0] excep_code; // @[if_id.scala 36:24:@1952.4]
  reg [31:0] _RAND_7;
  reg [31:0] excep_value; // @[if_id.scala 36:24:@1952.4]
  reg [31:0] _RAND_8;
  reg [63:0] excep_pc; // @[if_id.scala 36:24:@1952.4]
  reg [63:0] _RAND_9;
  reg  excep_inst_valid; // @[if_id.scala 36:24:@1952.4]
  reg [31:0] _RAND_10;
  wire  _T_148; // @[if_id.scala 46:17:@1964.4]
  wire [31:0] _T_150; // @[if_id.scala 47:20:@1966.6]
  wire [63:0] _T_152; // @[if_id.scala 49:20:@1969.6]
  wire [63:0] _T_154; // @[if_id.scala 50:20:@1971.6]
  wire  _T_156; // @[if_id.scala 51:32:@1973.6]
  wire [4:0] _T_158; // @[if_id.scala 52:32:@1975.6]
  wire  _GEN_3; // @[if_id.scala 53:25:@1977.6]
  wire [63:0] _GEN_4; // @[if_id.scala 53:25:@1977.6]
  wire [31:0] _GEN_5; // @[if_id.scala 46:29:@1965.4]
  wire [63:0] _GEN_6; // @[if_id.scala 46:29:@1965.4]
  wire [63:0] _GEN_7; // @[if_id.scala 46:29:@1965.4]
  wire [63:0] _GEN_8; // @[if_id.scala 46:29:@1965.4]
  wire  _GEN_9; // @[if_id.scala 46:29:@1965.4]
  wire [4:0] _GEN_10; // @[if_id.scala 46:29:@1965.4]
  wire  _GEN_11; // @[if_id.scala 46:29:@1965.4]
  wire [31:0] _GEN_12; // @[if_id.scala 46:29:@1965.4]
  wire [31:0] _GEN_13; // @[if_id.scala 46:29:@1965.4]
  wire  _GEN_14; // @[if_id.scala 46:29:@1965.4]
  wire [63:0] _GEN_15; // @[if_id.scala 46:29:@1965.4]
  assign _T_148 = io_en & io_pass; // @[if_id.scala 46:17:@1964.4]
  assign _T_150 = io_flush ? 32'h0 : io_insi; // @[if_id.scala 47:20:@1966.6]
  assign _T_152 = io_flush ? 64'h0 : io_insci; // @[if_id.scala 49:20:@1969.6]
  assign _T_154 = io_flush ? 64'h0 : io_icdi; // @[if_id.scala 50:20:@1971.6]
  assign _T_156 = io_flush ? 1'h0 : io_lastloadin_valid; // @[if_id.scala 51:32:@1973.6]
  assign _T_158 = io_flush ? 5'h0 : io_lastloadin_index; // @[if_id.scala 52:32:@1975.6]
  assign _GEN_3 = io_flush ? 1'h0 : io_excep_i_inst_valid; // @[if_id.scala 53:25:@1977.6]
  assign _GEN_4 = io_flush ? excep_pc : io_excep_i_pc; // @[if_id.scala 53:25:@1977.6]
  assign _GEN_5 = _T_148 ? _T_150 : ins; // @[if_id.scala 46:29:@1965.4]
  assign _GEN_6 = _T_148 ? io_pci : pc; // @[if_id.scala 46:29:@1965.4]
  assign _GEN_7 = _T_148 ? _T_152 : insc; // @[if_id.scala 46:29:@1965.4]
  assign _GEN_8 = _T_148 ? _T_154 : icd; // @[if_id.scala 46:29:@1965.4]
  assign _GEN_9 = _T_148 ? _T_156 : lastload_valid; // @[if_id.scala 46:29:@1965.4]
  assign _GEN_10 = _T_148 ? _T_158 : lastload_index; // @[if_id.scala 46:29:@1965.4]
  assign _GEN_11 = _T_148 ? 1'h0 : excep_valid; // @[if_id.scala 46:29:@1965.4]
  assign _GEN_12 = _T_148 ? 32'h0 : excep_code; // @[if_id.scala 46:29:@1965.4]
  assign _GEN_13 = _T_148 ? 32'h0 : excep_value; // @[if_id.scala 46:29:@1965.4]
  assign _GEN_14 = _T_148 ? _GEN_3 : excep_inst_valid; // @[if_id.scala 46:29:@1965.4]
  assign _GEN_15 = _T_148 ? _GEN_4 : excep_pc; // @[if_id.scala 46:29:@1965.4]
  assign io_inso = ins; // @[if_id.scala 38:14:@1953.4]
  assign io_pco = pc; // @[if_id.scala 39:14:@1954.4]
  assign io_insco = insc; // @[if_id.scala 40:14:@1955.4]
  assign io_icdo = icd; // @[if_id.scala 41:14:@1956.4]
  assign io_lastloadout_valid = lastload_valid; // @[if_id.scala 42:28:@1957.4]
  assign io_lastloadout_index = lastload_index; // @[if_id.scala 43:28:@1958.4]
  assign io_excep_o_valid = excep_valid; // @[if_id.scala 44:16:@1963.4]
  assign io_excep_o_code = excep_code; // @[if_id.scala 44:16:@1962.4]
  assign io_excep_o_value = excep_value; // @[if_id.scala 44:16:@1961.4]
  assign io_excep_o_pc = excep_pc; // @[if_id.scala 44:16:@1960.4]
  assign io_excep_o_inst_valid = excep_inst_valid; // @[if_id.scala 44:16:@1959.4]
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
module ID_EX( // @[:@1994.2]
  input         clock, // @[:@1995.4]
  input         reset, // @[:@1996.4]
  input         io_en, // @[:@1997.4]
  input         io_bid, // @[:@1997.4]
  input         io_bex, // @[:@1997.4]
  input         io_flush, // @[:@1997.4]
  input         io_pass, // @[:@1997.4]
  input  [63:0] io_immi, // @[:@1997.4]
  input  [3:0]  io_ALUOpi, // @[:@1997.4]
  input  [3:0]  io_exeti, // @[:@1997.4]
  input  [63:0] io_pci, // @[:@1997.4]
  input  [3:0]  io_lsmi, // @[:@1997.4]
  input         io_op32i, // @[:@1997.4]
  input         io_csr_wb_i_valid, // @[:@1997.4]
  input  [11:0] io_csr_wb_i_csr_idx, // @[:@1997.4]
  input  [63:0] io_csr_wb_i_csr_data, // @[:@1997.4]
  input         io_dregi_rs2_valid, // @[:@1997.4]
  input  [63:0] io_dregi_rs1_value, // @[:@1997.4]
  input  [63:0] io_dregi_rs2_value, // @[:@1997.4]
  input         io_dregi_rd_valid, // @[:@1997.4]
  input  [4:0]  io_dregi_rd_index, // @[:@1997.4]
  input         io_excep_i_valid, // @[:@1997.4]
  input  [31:0] io_excep_i_code, // @[:@1997.4]
  input  [31:0] io_excep_i_value, // @[:@1997.4]
  input  [63:0] io_excep_i_pc, // @[:@1997.4]
  input         io_excep_i_inst_valid, // @[:@1997.4]
  output [63:0] io_immo, // @[:@1997.4]
  output [3:0]  io_ALUOpo, // @[:@1997.4]
  output [3:0]  io_exeto, // @[:@1997.4]
  output [63:0] io_pco, // @[:@1997.4]
  output [3:0]  io_lsmo, // @[:@1997.4]
  output        io_op32o, // @[:@1997.4]
  output        io_csr_wb_o_valid, // @[:@1997.4]
  output [11:0] io_csr_wb_o_csr_idx, // @[:@1997.4]
  output [63:0] io_csr_wb_o_csr_data, // @[:@1997.4]
  output        io_drego_rs2_valid, // @[:@1997.4]
  output [63:0] io_drego_rs1_value, // @[:@1997.4]
  output [63:0] io_drego_rs2_value, // @[:@1997.4]
  output        io_drego_rd_valid, // @[:@1997.4]
  output [4:0]  io_drego_rd_index, // @[:@1997.4]
  output        io_excep_o_valid, // @[:@1997.4]
  output [31:0] io_excep_o_code, // @[:@1997.4]
  output [31:0] io_excep_o_value, // @[:@1997.4]
  output [63:0] io_excep_o_pc, // @[:@1997.4]
  output        io_excep_o_inst_valid // @[:@1997.4]
);
  reg [63:0] imm; // @[id_ex.scala 36:24:@1999.4]
  reg [63:0] _RAND_0;
  reg [3:0] ALUOp; // @[id_ex.scala 37:24:@2000.4]
  reg [31:0] _RAND_1;
  reg [3:0] exet; // @[id_ex.scala 38:24:@2001.4]
  reg [31:0] _RAND_2;
  reg [63:0] pc; // @[id_ex.scala 39:24:@2002.4]
  reg [63:0] _RAND_3;
  reg  regInfo_rs2_valid; // @[id_ex.scala 40:26:@2018.4]
  reg [31:0] _RAND_4;
  reg [63:0] regInfo_rs1_value; // @[id_ex.scala 40:26:@2018.4]
  reg [63:0] _RAND_5;
  reg [63:0] regInfo_rs2_value; // @[id_ex.scala 40:26:@2018.4]
  reg [63:0] _RAND_6;
  reg  regInfo_rd_valid; // @[id_ex.scala 40:26:@2018.4]
  reg [31:0] _RAND_7;
  reg [4:0] regInfo_rd_index; // @[id_ex.scala 40:26:@2018.4]
  reg [31:0] _RAND_8;
  reg [3:0] lsm; // @[id_ex.scala 41:24:@2019.4]
  reg [31:0] _RAND_9;
  reg  op32; // @[id_ex.scala 42:24:@2020.4]
  reg [31:0] _RAND_10;
  wire  _T_184; // @[id_ex.scala 44:25:@2021.4]
  wire  bubble; // @[id_ex.scala 44:35:@2022.4]
  wire [63:0] bm; // @[id_ex.scala 45:21:@2024.4]
  reg  csr_wb_valid; // @[id_ex.scala 47:26:@2034.4]
  reg [31:0] _RAND_11;
  reg [11:0] csr_wb_csr_idx; // @[id_ex.scala 47:26:@2034.4]
  reg [31:0] _RAND_12;
  reg [63:0] csr_wb_csr_data; // @[id_ex.scala 47:26:@2034.4]
  reg [63:0] _RAND_13;
  reg  excep_valid; // @[id_ex.scala 48:25:@2048.4]
  reg [31:0] _RAND_14;
  reg [31:0] excep_code; // @[id_ex.scala 48:25:@2048.4]
  reg [31:0] _RAND_15;
  reg [31:0] excep_value; // @[id_ex.scala 48:25:@2048.4]
  reg [31:0] _RAND_16;
  reg [63:0] excep_pc; // @[id_ex.scala 48:25:@2048.4]
  reg [63:0] _RAND_17;
  reg  excep_inst_valid; // @[id_ex.scala 48:25:@2048.4]
  reg [31:0] _RAND_18;
  wire  _T_250; // @[id_ex.scala 60:17:@2069.4]
  wire [63:0] _T_251; // @[id_ex.scala 61:28:@2071.6]
  wire [3:0] _T_252; // @[id_ex.scala 62:32:@2073.6]
  wire [3:0] _T_253; // @[id_ex.scala 62:28:@2074.6]
  wire [3:0] _T_255; // @[id_ex.scala 63:28:@2077.6]
  wire  _T_256; // @[id_ex.scala 65:26:@2080.6]
  wire  _T_287_rs2_valid; // @[id_ex.scala 65:23:@2096.6]
  wire [63:0] _T_287_rs1_value; // @[id_ex.scala 65:23:@2096.6]
  wire [63:0] _T_287_rs2_value; // @[id_ex.scala 65:23:@2096.6]
  wire  _T_287_rd_valid; // @[id_ex.scala 65:23:@2096.6]
  wire [4:0] _T_287_rd_index; // @[id_ex.scala 65:23:@2096.6]
  wire [3:0] _T_294; // @[id_ex.scala 66:21:@2103.6]
  wire  _T_296; // @[id_ex.scala 67:27:@2106.6]
  wire [63:0] _GEN_0; // @[id_ex.scala 68:22:@2108.6]
  wire [11:0] _GEN_1; // @[id_ex.scala 68:22:@2108.6]
  wire  _GEN_2; // @[id_ex.scala 68:22:@2108.6]
  wire [31:0] _T_317; // @[id_ex.scala 73:26:@2128.6]
  wire [31:0] _T_320; // @[id_ex.scala 74:27:@2131.6]
  wire  _T_323; // @[id_ex.scala 75:27:@2134.6]
  wire  _T_326; // @[id_ex.scala 77:32:@2138.6]
  wire [63:0] _GEN_3; // @[id_ex.scala 60:29:@2070.4]
  wire [3:0] _GEN_4; // @[id_ex.scala 60:29:@2070.4]
  wire [3:0] _GEN_5; // @[id_ex.scala 60:29:@2070.4]
  wire [63:0] _GEN_6; // @[id_ex.scala 60:29:@2070.4]
  wire [4:0] _GEN_7; // @[id_ex.scala 60:29:@2070.4]
  wire  _GEN_8; // @[id_ex.scala 60:29:@2070.4]
  wire [63:0] _GEN_9; // @[id_ex.scala 60:29:@2070.4]
  wire [63:0] _GEN_10; // @[id_ex.scala 60:29:@2070.4]
  wire  _GEN_11; // @[id_ex.scala 60:29:@2070.4]
  wire [3:0] _GEN_13; // @[id_ex.scala 60:29:@2070.4]
  wire  _GEN_14; // @[id_ex.scala 60:29:@2070.4]
  wire [63:0] _GEN_15; // @[id_ex.scala 60:29:@2070.4]
  wire [11:0] _GEN_16; // @[id_ex.scala 60:29:@2070.4]
  wire  _GEN_17; // @[id_ex.scala 60:29:@2070.4]
  wire [31:0] _GEN_18; // @[id_ex.scala 60:29:@2070.4]
  wire [31:0] _GEN_19; // @[id_ex.scala 60:29:@2070.4]
  wire  _GEN_20; // @[id_ex.scala 60:29:@2070.4]
  wire [63:0] _GEN_21; // @[id_ex.scala 60:29:@2070.4]
  wire  _GEN_22; // @[id_ex.scala 60:29:@2070.4]
  assign _T_184 = io_bid | io_bex; // @[id_ex.scala 44:25:@2021.4]
  assign bubble = _T_184 | io_flush; // @[id_ex.scala 44:35:@2022.4]
  assign bm = bubble ? 64'h0 : 64'hffffffffffffffff; // @[id_ex.scala 45:21:@2024.4]
  assign _T_250 = io_en & io_pass; // @[id_ex.scala 60:17:@2069.4]
  assign _T_251 = io_immi & bm; // @[id_ex.scala 61:28:@2071.6]
  assign _T_252 = bm[3:0]; // @[id_ex.scala 62:32:@2073.6]
  assign _T_253 = io_ALUOpi & _T_252; // @[id_ex.scala 62:28:@2074.6]
  assign _T_255 = io_exeti & _T_252; // @[id_ex.scala 63:28:@2077.6]
  assign _T_256 = bm[0]; // @[id_ex.scala 65:26:@2080.6]
  assign _T_287_rs2_valid = _T_256 ? io_dregi_rs2_valid : 1'h0; // @[id_ex.scala 65:23:@2096.6]
  assign _T_287_rs1_value = _T_256 ? io_dregi_rs1_value : 64'h0; // @[id_ex.scala 65:23:@2096.6]
  assign _T_287_rs2_value = _T_256 ? io_dregi_rs2_value : 64'h0; // @[id_ex.scala 65:23:@2096.6]
  assign _T_287_rd_valid = _T_256 ? io_dregi_rd_valid : 1'h0; // @[id_ex.scala 65:23:@2096.6]
  assign _T_287_rd_index = _T_256 ? io_dregi_rd_index : 5'h0; // @[id_ex.scala 65:23:@2096.6]
  assign _T_294 = bubble ? 4'hf : io_lsmi; // @[id_ex.scala 66:21:@2103.6]
  assign _T_296 = io_op32i & _T_256; // @[id_ex.scala 67:27:@2106.6]
  assign _GEN_0 = bubble ? 64'h0 : io_csr_wb_i_csr_data; // @[id_ex.scala 68:22:@2108.6]
  assign _GEN_1 = bubble ? 12'h0 : io_csr_wb_i_csr_idx; // @[id_ex.scala 68:22:@2108.6]
  assign _GEN_2 = bubble ? 1'h0 : io_csr_wb_i_valid; // @[id_ex.scala 68:22:@2108.6]
  assign _T_317 = _T_256 ? io_excep_i_code : 32'h0; // @[id_ex.scala 73:26:@2128.6]
  assign _T_320 = _T_256 ? io_excep_i_value : 32'h0; // @[id_ex.scala 74:27:@2131.6]
  assign _T_323 = _T_256 ? io_excep_i_valid : 1'h0; // @[id_ex.scala 75:27:@2134.6]
  assign _T_326 = _T_256 ? io_excep_i_inst_valid : 1'h0; // @[id_ex.scala 77:32:@2138.6]
  assign _GEN_3 = _T_250 ? _T_251 : imm; // @[id_ex.scala 60:29:@2070.4]
  assign _GEN_4 = _T_250 ? _T_253 : ALUOp; // @[id_ex.scala 60:29:@2070.4]
  assign _GEN_5 = _T_250 ? _T_255 : exet; // @[id_ex.scala 60:29:@2070.4]
  assign _GEN_6 = _T_250 ? io_pci : pc; // @[id_ex.scala 60:29:@2070.4]
  assign _GEN_7 = _T_250 ? _T_287_rd_index : regInfo_rd_index; // @[id_ex.scala 60:29:@2070.4]
  assign _GEN_8 = _T_250 ? _T_287_rd_valid : regInfo_rd_valid; // @[id_ex.scala 60:29:@2070.4]
  assign _GEN_9 = _T_250 ? _T_287_rs2_value : regInfo_rs2_value; // @[id_ex.scala 60:29:@2070.4]
  assign _GEN_10 = _T_250 ? _T_287_rs1_value : regInfo_rs1_value; // @[id_ex.scala 60:29:@2070.4]
  assign _GEN_11 = _T_250 ? _T_287_rs2_valid : regInfo_rs2_valid; // @[id_ex.scala 60:29:@2070.4]
  assign _GEN_13 = _T_250 ? _T_294 : lsm; // @[id_ex.scala 60:29:@2070.4]
  assign _GEN_14 = _T_250 ? _T_296 : op32; // @[id_ex.scala 60:29:@2070.4]
  assign _GEN_15 = _T_250 ? _GEN_0 : csr_wb_csr_data; // @[id_ex.scala 60:29:@2070.4]
  assign _GEN_16 = _T_250 ? _GEN_1 : csr_wb_csr_idx; // @[id_ex.scala 60:29:@2070.4]
  assign _GEN_17 = _T_250 ? _GEN_2 : csr_wb_valid; // @[id_ex.scala 60:29:@2070.4]
  assign _GEN_18 = _T_250 ? _T_317 : excep_code; // @[id_ex.scala 60:29:@2070.4]
  assign _GEN_19 = _T_250 ? _T_320 : excep_value; // @[id_ex.scala 60:29:@2070.4]
  assign _GEN_20 = _T_250 ? _T_323 : excep_valid; // @[id_ex.scala 60:29:@2070.4]
  assign _GEN_21 = _T_250 ? io_excep_i_pc : excep_pc; // @[id_ex.scala 60:29:@2070.4]
  assign _GEN_22 = _T_250 ? _T_326 : excep_inst_valid; // @[id_ex.scala 60:29:@2070.4]
  assign io_immo = imm; // @[id_ex.scala 50:15:@2049.4]
  assign io_ALUOpo = ALUOp; // @[id_ex.scala 51:15:@2050.4]
  assign io_exeto = exet; // @[id_ex.scala 52:15:@2051.4]
  assign io_pco = pc; // @[id_ex.scala 53:15:@2052.4]
  assign io_lsmo = lsm; // @[id_ex.scala 55:15:@2059.4]
  assign io_op32o = op32; // @[id_ex.scala 56:15:@2060.4]
  assign io_csr_wb_o_valid = csr_wb_valid; // @[id_ex.scala 57:18:@2063.4]
  assign io_csr_wb_o_csr_idx = csr_wb_csr_idx; // @[id_ex.scala 57:18:@2062.4]
  assign io_csr_wb_o_csr_data = csr_wb_csr_data; // @[id_ex.scala 57:18:@2061.4]
  assign io_drego_rs2_valid = regInfo_rs2_valid; // @[id_ex.scala 54:14:@2057.4]
  assign io_drego_rs1_value = regInfo_rs1_value; // @[id_ex.scala 54:14:@2056.4]
  assign io_drego_rs2_value = regInfo_rs2_value; // @[id_ex.scala 54:14:@2055.4]
  assign io_drego_rd_valid = regInfo_rd_valid; // @[id_ex.scala 54:14:@2054.4]
  assign io_drego_rd_index = regInfo_rd_index; // @[id_ex.scala 54:14:@2053.4]
  assign io_excep_o_valid = excep_valid; // @[id_ex.scala 58:16:@2068.4]
  assign io_excep_o_code = excep_code; // @[id_ex.scala 58:16:@2067.4]
  assign io_excep_o_value = excep_value; // @[id_ex.scala 58:16:@2066.4]
  assign io_excep_o_pc = excep_pc; // @[id_ex.scala 58:16:@2065.4]
  assign io_excep_o_inst_valid = excep_inst_valid; // @[id_ex.scala 58:16:@2064.4]
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
module EX_MEM( // @[:@2144.2]
  input         clock, // @[:@2145.4]
  input         reset, // @[:@2146.4]
  input         io_en, // @[:@2147.4]
  input         io_pass, // @[:@2147.4]
  input         io_flush, // @[:@2147.4]
  input         io_nlsi, // @[:@2147.4]
  input  [3:0]  io_lsmi, // @[:@2147.4]
  input  [63:0] io_addri, // @[:@2147.4]
  input  [63:0] io_datai, // @[:@2147.4]
  input         io_wregi_wbrv, // @[:@2147.4]
  input  [4:0]  io_wregi_wbri, // @[:@2147.4]
  input  [63:0] io_wregi_wbrd, // @[:@2147.4]
  input         io_csr_wb_i_valid, // @[:@2147.4]
  input  [11:0] io_csr_wb_i_csr_idx, // @[:@2147.4]
  input  [63:0] io_csr_wb_i_csr_data, // @[:@2147.4]
  input         io_excep_i_valid, // @[:@2147.4]
  input  [31:0] io_excep_i_code, // @[:@2147.4]
  input  [31:0] io_excep_i_value, // @[:@2147.4]
  input  [63:0] io_excep_i_pc, // @[:@2147.4]
  input         io_excep_i_inst_valid, // @[:@2147.4]
  input         io_inter_i_valid, // @[:@2147.4]
  input  [31:0] io_inter_i_bits, // @[:@2147.4]
  output        io_nlso, // @[:@2147.4]
  output [3:0]  io_lsmo, // @[:@2147.4]
  output [63:0] io_addro, // @[:@2147.4]
  output [63:0] io_datao, // @[:@2147.4]
  output        io_wrego_wbrv, // @[:@2147.4]
  output [4:0]  io_wrego_wbri, // @[:@2147.4]
  output [63:0] io_wrego_wbrd, // @[:@2147.4]
  output        io_csr_wb_o_valid, // @[:@2147.4]
  output [11:0] io_csr_wb_o_csr_idx, // @[:@2147.4]
  output [63:0] io_csr_wb_o_csr_data, // @[:@2147.4]
  output        io_excep_o_valid, // @[:@2147.4]
  output [31:0] io_excep_o_code, // @[:@2147.4]
  output [31:0] io_excep_o_value, // @[:@2147.4]
  output [63:0] io_excep_o_pc, // @[:@2147.4]
  output        io_excep_o_inst_valid, // @[:@2147.4]
  output        io_inter_o_valid, // @[:@2147.4]
  output [31:0] io_inter_o_bits // @[:@2147.4]
);
  reg  nls; // @[ex_mem.scala 31:23:@2149.4]
  reg [31:0] _RAND_0;
  reg  wbrv; // @[ex_mem.scala 32:23:@2150.4]
  reg [31:0] _RAND_1;
  reg [63:0] wbrd; // @[ex_mem.scala 33:23:@2151.4]
  reg [63:0] _RAND_2;
  reg [4:0] wbri; // @[ex_mem.scala 34:23:@2152.4]
  reg [31:0] _RAND_3;
  reg [3:0] lsm; // @[ex_mem.scala 35:23:@2153.4]
  reg [31:0] _RAND_4;
  reg [63:0] addr; // @[ex_mem.scala 36:23:@2154.4]
  reg [63:0] _RAND_5;
  reg [63:0] data; // @[ex_mem.scala 37:23:@2155.4]
  reg [63:0] _RAND_6;
  reg  csr_wb_valid; // @[ex_mem.scala 38:26:@2165.4]
  reg [31:0] _RAND_7;
  reg [11:0] csr_wb_csr_idx; // @[ex_mem.scala 38:26:@2165.4]
  reg [31:0] _RAND_8;
  reg [63:0] csr_wb_csr_data; // @[ex_mem.scala 38:26:@2165.4]
  reg [63:0] _RAND_9;
  reg  excep_valid; // @[ex_mem.scala 39:26:@2179.4]
  reg [31:0] _RAND_10;
  reg [31:0] excep_code; // @[ex_mem.scala 39:26:@2179.4]
  reg [31:0] _RAND_11;
  reg [31:0] excep_value; // @[ex_mem.scala 39:26:@2179.4]
  reg [31:0] _RAND_12;
  reg [63:0] excep_pc; // @[ex_mem.scala 39:26:@2179.4]
  reg [63:0] _RAND_13;
  reg  excep_inst_valid; // @[ex_mem.scala 39:26:@2179.4]
  reg [31:0] _RAND_14;
  reg  inter_valid; // @[ex_mem.scala 40:26:@2187.4]
  reg [31:0] _RAND_15;
  reg [31:0] inter_bits; // @[ex_mem.scala 40:26:@2187.4]
  reg [31:0] _RAND_16;
  wire  _T_206; // @[ex_mem.scala 53:17:@2205.4]
  wire  _T_207; // @[ex_mem.scala 54:45:@2207.6]
  wire  _T_208; // @[ex_mem.scala 54:67:@2208.6]
  wire  _T_209; // @[ex_mem.scala 55:31:@2209.6]
  wire  _T_211; // @[ex_mem.scala 55:21:@2210.6]
  wire [4:0] _T_213; // @[ex_mem.scala 56:21:@2212.6]
  wire  _T_216; // @[ex_mem.scala 57:44:@2214.6]
  wire  _T_217; // @[ex_mem.scala 57:21:@2215.6]
  wire [63:0] _T_219; // @[ex_mem.scala 58:21:@2217.6]
  wire [3:0] _T_220; // @[ex_mem.scala 59:45:@2219.6]
  wire [3:0] _T_221; // @[ex_mem.scala 59:21:@2220.6]
  wire [63:0] _T_224; // @[ex_mem.scala 60:21:@2223.6]
  wire [63:0] _T_226; // @[ex_mem.scala 61:21:@2225.6]
  wire  _T_229; // @[ex_mem.scala 63:54:@2227.6]
  wire  _T_230; // @[ex_mem.scala 63:31:@2228.6]
  wire  _GEN_0; // @[ex_mem.scala 69:24:@2239.6]
  wire  _GEN_1; // @[ex_mem.scala 69:24:@2239.6]
  wire  _GEN_2; // @[ex_mem.scala 69:24:@2239.6]
  wire  _GEN_3; // @[ex_mem.scala 53:29:@2206.4]
  wire [4:0] _GEN_4; // @[ex_mem.scala 53:29:@2206.4]
  wire  _GEN_5; // @[ex_mem.scala 53:29:@2206.4]
  wire [63:0] _GEN_6; // @[ex_mem.scala 53:29:@2206.4]
  wire [3:0] _GEN_7; // @[ex_mem.scala 53:29:@2206.4]
  wire [63:0] _GEN_8; // @[ex_mem.scala 53:29:@2206.4]
  wire [63:0] _GEN_9; // @[ex_mem.scala 53:29:@2206.4]
  wire  _GEN_10; // @[ex_mem.scala 53:29:@2206.4]
  wire [11:0] _GEN_11; // @[ex_mem.scala 53:29:@2206.4]
  wire [63:0] _GEN_12; // @[ex_mem.scala 53:29:@2206.4]
  wire  _GEN_13; // @[ex_mem.scala 53:29:@2206.4]
  wire [63:0] _GEN_14; // @[ex_mem.scala 53:29:@2206.4]
  wire [31:0] _GEN_15; // @[ex_mem.scala 53:29:@2206.4]
  wire [31:0] _GEN_16; // @[ex_mem.scala 53:29:@2206.4]
  wire  _GEN_17; // @[ex_mem.scala 53:29:@2206.4]
  wire [31:0] _GEN_18; // @[ex_mem.scala 53:29:@2206.4]
  wire  _GEN_19; // @[ex_mem.scala 53:29:@2206.4]
  assign _T_206 = io_en & io_pass; // @[ex_mem.scala 53:17:@2205.4]
  assign _T_207 = io_excep_i_valid | io_inter_i_valid; // @[ex_mem.scala 54:45:@2207.6]
  assign _T_208 = _T_207 & io_excep_i_inst_valid; // @[ex_mem.scala 54:67:@2208.6]
  assign _T_209 = io_flush | _T_208; // @[ex_mem.scala 55:31:@2209.6]
  assign _T_211 = _T_209 ? 1'h0 : io_nlsi; // @[ex_mem.scala 55:21:@2210.6]
  assign _T_213 = io_flush ? 5'h0 : io_wregi_wbri; // @[ex_mem.scala 56:21:@2212.6]
  assign _T_216 = _T_208 ? 1'h0 : io_wregi_wbrv; // @[ex_mem.scala 57:44:@2214.6]
  assign _T_217 = io_flush ? 1'h0 : _T_216; // @[ex_mem.scala 57:21:@2215.6]
  assign _T_219 = io_flush ? 64'h0 : io_wregi_wbrd; // @[ex_mem.scala 58:21:@2217.6]
  assign _T_220 = _T_208 ? 4'hf : io_lsmi; // @[ex_mem.scala 59:45:@2219.6]
  assign _T_221 = io_flush ? 4'hf : _T_220; // @[ex_mem.scala 59:21:@2220.6]
  assign _T_224 = io_flush ? 64'hffffffffffffffff : io_addri; // @[ex_mem.scala 60:21:@2223.6]
  assign _T_226 = io_flush ? 64'h0 : io_datai; // @[ex_mem.scala 61:21:@2225.6]
  assign _T_229 = _T_208 ? 1'h1 : io_csr_wb_i_valid; // @[ex_mem.scala 63:54:@2227.6]
  assign _T_230 = io_flush ? 1'h0 : _T_229; // @[ex_mem.scala 63:31:@2228.6]
  assign _GEN_0 = io_flush ? 1'h0 : io_excep_i_valid; // @[ex_mem.scala 69:24:@2239.6]
  assign _GEN_1 = io_flush ? 1'h0 : io_excep_i_inst_valid; // @[ex_mem.scala 69:24:@2239.6]
  assign _GEN_2 = io_flush ? 1'h0 : io_inter_i_valid; // @[ex_mem.scala 69:24:@2239.6]
  assign _GEN_3 = _T_206 ? _T_211 : nls; // @[ex_mem.scala 53:29:@2206.4]
  assign _GEN_4 = _T_206 ? _T_213 : wbri; // @[ex_mem.scala 53:29:@2206.4]
  assign _GEN_5 = _T_206 ? _T_217 : wbrv; // @[ex_mem.scala 53:29:@2206.4]
  assign _GEN_6 = _T_206 ? _T_219 : wbrd; // @[ex_mem.scala 53:29:@2206.4]
  assign _GEN_7 = _T_206 ? _T_221 : lsm; // @[ex_mem.scala 53:29:@2206.4]
  assign _GEN_8 = _T_206 ? _T_224 : addr; // @[ex_mem.scala 53:29:@2206.4]
  assign _GEN_9 = _T_206 ? _T_226 : data; // @[ex_mem.scala 53:29:@2206.4]
  assign _GEN_10 = _T_206 ? _T_230 : csr_wb_valid; // @[ex_mem.scala 53:29:@2206.4]
  assign _GEN_11 = _T_206 ? io_csr_wb_i_csr_idx : csr_wb_csr_idx; // @[ex_mem.scala 53:29:@2206.4]
  assign _GEN_12 = _T_206 ? io_csr_wb_i_csr_data : csr_wb_csr_data; // @[ex_mem.scala 53:29:@2206.4]
  assign _GEN_13 = _T_206 ? _GEN_1 : excep_inst_valid; // @[ex_mem.scala 53:29:@2206.4]
  assign _GEN_14 = _T_206 ? io_excep_i_pc : excep_pc; // @[ex_mem.scala 53:29:@2206.4]
  assign _GEN_15 = _T_206 ? io_excep_i_value : excep_value; // @[ex_mem.scala 53:29:@2206.4]
  assign _GEN_16 = _T_206 ? io_excep_i_code : excep_code; // @[ex_mem.scala 53:29:@2206.4]
  assign _GEN_17 = _T_206 ? _GEN_0 : excep_valid; // @[ex_mem.scala 53:29:@2206.4]
  assign _GEN_18 = _T_206 ? io_inter_i_bits : inter_bits; // @[ex_mem.scala 53:29:@2206.4]
  assign _GEN_19 = _T_206 ? _GEN_2 : inter_valid; // @[ex_mem.scala 53:29:@2206.4]
  assign io_nlso = nls; // @[ex_mem.scala 42:13:@2188.4]
  assign io_lsmo = lsm; // @[ex_mem.scala 46:13:@2192.4]
  assign io_addro = addr; // @[ex_mem.scala 47:14:@2193.4]
  assign io_datao = data; // @[ex_mem.scala 48:14:@2194.4]
  assign io_wrego_wbrv = wbrv; // @[ex_mem.scala 44:19:@2190.4]
  assign io_wrego_wbri = wbri; // @[ex_mem.scala 45:19:@2191.4]
  assign io_wrego_wbrd = wbrd; // @[ex_mem.scala 43:19:@2189.4]
  assign io_csr_wb_o_valid = csr_wb_valid; // @[ex_mem.scala 49:18:@2197.4]
  assign io_csr_wb_o_csr_idx = csr_wb_csr_idx; // @[ex_mem.scala 49:18:@2196.4]
  assign io_csr_wb_o_csr_data = csr_wb_csr_data; // @[ex_mem.scala 49:18:@2195.4]
  assign io_excep_o_valid = excep_valid; // @[ex_mem.scala 50:18:@2202.4]
  assign io_excep_o_code = excep_code; // @[ex_mem.scala 50:18:@2201.4]
  assign io_excep_o_value = excep_value; // @[ex_mem.scala 50:18:@2200.4]
  assign io_excep_o_pc = excep_pc; // @[ex_mem.scala 50:18:@2199.4]
  assign io_excep_o_inst_valid = excep_inst_valid; // @[ex_mem.scala 50:18:@2198.4]
  assign io_inter_o_valid = inter_valid; // @[ex_mem.scala 51:18:@2204.4]
  assign io_inter_o_bits = inter_bits; // @[ex_mem.scala 51:18:@2203.4]
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
module MEM_WB( // @[:@2246.2]
  input         clock, // @[:@2247.4]
  input         reset, // @[:@2248.4]
  input         io_en, // @[:@2249.4]
  input         io_pass, // @[:@2249.4]
  input         io_wregi_wbrv, // @[:@2249.4]
  input  [4:0]  io_wregi_wbri, // @[:@2249.4]
  input  [63:0] io_wregi_wbrd, // @[:@2249.4]
  output        io_wrego_wbrv, // @[:@2249.4]
  output [4:0]  io_wrego_wbri, // @[:@2249.4]
  output [63:0] io_wrego_wbrd // @[:@2249.4]
);
  reg  wbrv; // @[mem_wb.scala 15:23:@2251.4]
  reg [31:0] _RAND_0;
  reg [63:0] wbrd; // @[mem_wb.scala 16:23:@2252.4]
  reg [63:0] _RAND_1;
  reg [4:0] wbri; // @[mem_wb.scala 17:23:@2253.4]
  reg [31:0] _RAND_2;
  wire  _T_35; // @[mem_wb.scala 23:17:@2257.4]
  wire [4:0] _GEN_0; // @[mem_wb.scala 23:29:@2258.4]
  wire  _GEN_1; // @[mem_wb.scala 23:29:@2258.4]
  wire [63:0] _GEN_2; // @[mem_wb.scala 23:29:@2258.4]
  assign _T_35 = io_en & io_pass; // @[mem_wb.scala 23:17:@2257.4]
  assign _GEN_0 = _T_35 ? io_wregi_wbri : wbri; // @[mem_wb.scala 23:29:@2258.4]
  assign _GEN_1 = _T_35 ? io_wregi_wbrv : wbrv; // @[mem_wb.scala 23:29:@2258.4]
  assign _GEN_2 = _T_35 ? io_wregi_wbrd : wbrd; // @[mem_wb.scala 23:29:@2258.4]
  assign io_wrego_wbrv = wbrv; // @[mem_wb.scala 20:19:@2255.4]
  assign io_wrego_wbri = wbri; // @[mem_wb.scala 21:19:@2256.4]
  assign io_wrego_wbrd = wbrd; // @[mem_wb.scala 19:19:@2254.4]
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
module CSR( // @[:@2264.2]
  input         clock, // @[:@2265.4]
  input         reset, // @[:@2266.4]
  input  [11:0] io_id_addr, // @[:@2267.4]
  output [63:0] io_id_rdata, // @[:@2267.4]
  output [1:0]  io_id_priv, // @[:@2267.4]
  input         io_mem_wrCSROp_valid, // @[:@2267.4]
  input  [11:0] io_mem_wrCSROp_csr_idx, // @[:@2267.4]
  input  [63:0] io_mem_wrCSROp_csr_data, // @[:@2267.4]
  input         io_mem_excep_valid, // @[:@2267.4]
  input  [31:0] io_mem_excep_code, // @[:@2267.4]
  input  [31:0] io_mem_excep_value, // @[:@2267.4]
  input  [63:0] io_mem_excep_pc, // @[:@2267.4]
  input         io_mem_excep_inst_valid, // @[:@2267.4]
  output [63:0] io_mmu_satp, // @[:@2267.4]
  output [1:0]  io_mmu_priv, // @[:@2267.4]
  output        io_mmu_mxr, // @[:@2267.4]
  output        io_mmu_sum, // @[:@2267.4]
  output        io_flush, // @[:@2267.4]
  output [63:0] io_csrNewPc, // @[:@2267.4]
  output        io_inter_valid, // @[:@2267.4]
  output [31:0] io_inter_bits // @[:@2267.4]
);
  reg [63:0] csr [0:1023]; // @[CSR.scala 25:16:@2273.4]
  reg [63:0] _RAND_0;
  wire [63:0] csr__T_156_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_156_addr; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_245_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_245_addr; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_246_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_246_addr; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_269_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_269_addr; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_mtvec_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_mtvec_addr; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_stvec_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_stvec_addr; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_utvec_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_utvec_addr; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_medeleg_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_medeleg_addr; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_mideleg_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_mideleg_addr; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_sedeleg_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_sedeleg_addr; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_sideleg_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_sideleg_addr; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_mie_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_mie_addr; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_mip_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_mip_addr; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_mtimecmp_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_mtimecmp_addr; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_mepc_r_0_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_mepc_r_0_addr; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_sepc_r_0_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_sepc_r_0_addr; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_uepc_r_0_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_uepc_r_0_addr; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_272_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_272_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_272_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_272_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_275_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_275_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_275_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_275_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_278_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_278_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_278_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_278_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_281_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_281_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_281_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_281_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_283_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_283_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_283_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_283_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_285_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_285_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_285_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_285_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_287_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_287_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_287_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_287_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_289_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_289_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_289_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_289_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_291_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_291_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_291_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_291_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_293_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_293_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_293_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_293_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_295_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_295_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_295_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_295_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_297_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_297_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_297_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_297_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_299_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_299_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_299_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_299_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_301_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_301_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_301_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_301_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_303_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_303_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_303_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_303_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_305_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_305_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_305_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_305_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_307_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_307_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_307_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_307_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_309_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_309_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_309_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_309_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_311_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_311_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_311_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_311_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_313_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_313_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_313_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_313_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_315_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_315_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_315_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_315_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_317_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_317_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_317_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_317_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_319_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_319_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_319_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_319_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_321_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_321_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_321_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_321_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_323_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_323_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_323_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_323_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_325_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_325_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_325_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_325_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_327_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_327_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_327_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_327_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_329_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_329_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_329_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_329_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_331_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_331_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_331_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_331_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_333_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_333_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_333_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_333_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_335_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_335_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_335_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_335_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_337_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_337_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_337_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_337_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_339_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_339_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_339_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_339_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_341_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_341_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_341_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_341_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_343_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_343_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_343_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_343_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_346_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_346_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_346_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_346_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_349_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_349_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_349_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_349_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_mcause_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_mcause_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr_mcause_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr_mcause_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_scause_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_scause_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr_scause_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr_scause_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_ucause_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_ucause_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr_ucause_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr_ucause_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_mtval_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_mtval_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr_mtval_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr_mtval_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_stval_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_stval_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr_stval_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr_stval_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_utval_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_utval_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr_utval_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr_utval_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr__T_416_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr__T_416_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_416_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr__T_416_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_mepc_w_0_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_mepc_w_0_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr_mepc_w_0_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr_mepc_w_0_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_sepc_w_0_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_sepc_w_0_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr_sepc_w_0_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr_sepc_w_0_en; // @[CSR.scala 25:16:@2273.4]
  wire [63:0] csr_uepc_w_0_data; // @[CSR.scala 25:16:@2273.4]
  wire [9:0] csr_uepc_w_0_addr; // @[CSR.scala 25:16:@2273.4]
  wire  csr_uepc_w_0_mask; // @[CSR.scala 25:16:@2273.4]
  wire  csr_uepc_w_0_en; // @[CSR.scala 25:16:@2273.4]
  reg [1:0] prv; // @[CSR.scala 22:24:@2270.4]
  reg [31:0] _RAND_1;
  reg  mstatus_SD; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_2;
  reg [26:0] mstatus_zero1; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_3;
  reg [1:0] mstatus_SXL; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_4;
  reg [1:0] mstatus_UXL; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_5;
  reg  mstatus_TSR; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_6;
  reg [8:0] mstatus_zero2; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_7;
  reg  mstatus_TW; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_8;
  reg  mstatus_TVM; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_9;
  reg  mstatus_MXR; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_10;
  reg  mstatus_SUM; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_11;
  reg  mstatus_MPriv; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_12;
  reg [1:0] mstatus_XS; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_13;
  reg [1:0] mstatus_FS; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_14;
  reg [1:0] mstatus_MPP; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_15;
  reg [1:0] mstatus_old_HPP; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_16;
  reg  mstatus_SPP; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_17;
  reg  mstatus_MPIE; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_18;
  reg  mstatus_old_HPIE; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_19;
  reg  mstatus_SPIE; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_20;
  reg  mstatus_UPIE; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_21;
  reg  mstatus_MIE; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_22;
  reg  mstatus_old_HIE; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_23;
  reg  mstatus_SIE; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_24;
  reg  mstatus_UIE; // @[CSR.scala 102:24:@2325.4]
  reg [31:0] _RAND_25;
  reg [63:0] mtime; // @[CSR.scala 103:24:@2326.4]
  reg [63:0] _RAND_26;
  wire [64:0] _T_153; // @[CSR.scala 104:18:@2327.4]
  wire [63:0] _T_154; // @[CSR.scala 104:18:@2328.4]
  wire [5:0] _T_203; // @[CSR.scala 112:29:@2336.4]
  wire [14:0] _T_209; // @[CSR.scala 112:29:@2342.4]
  wire [6:0] _T_214; // @[CSR.scala 112:29:@2347.4]
  wire [63:0] _T_221; // @[CSR.scala 112:29:@2354.4]
  wire  _T_247; // @[Mux.scala 46:19:@2380.4]
  wire [63:0] _T_248; // @[Mux.scala 46:16:@2381.4]
  wire  _T_249; // @[Mux.scala 46:19:@2382.4]
  wire [63:0] _T_250; // @[Mux.scala 46:16:@2383.4]
  wire  _T_251; // @[Mux.scala 46:19:@2384.4]
  wire [63:0] _T_252; // @[Mux.scala 46:16:@2385.4]
  wire  _T_253; // @[Mux.scala 46:19:@2386.4]
  wire [63:0] _T_254; // @[Mux.scala 46:16:@2387.4]
  wire  _T_255; // @[Mux.scala 46:19:@2388.4]
  wire [63:0] _T_256; // @[Mux.scala 46:16:@2389.4]
  wire  _T_257; // @[Mux.scala 46:19:@2390.4]
  wire [63:0] _T_258; // @[Mux.scala 46:16:@2391.4]
  wire  _T_259; // @[Mux.scala 46:19:@2392.4]
  wire [63:0] _T_260; // @[Mux.scala 46:16:@2393.4]
  wire  _T_261; // @[Mux.scala 46:19:@2394.4]
  wire [63:0] _T_262; // @[Mux.scala 46:16:@2395.4]
  wire  _T_263; // @[Mux.scala 46:19:@2396.4]
  wire [63:0] _T_264; // @[Mux.scala 46:16:@2397.4]
  wire  _T_265; // @[Mux.scala 46:19:@2398.4]
  wire [63:0] _T_266; // @[Mux.scala 46:16:@2399.4]
  wire  _T_267; // @[Mux.scala 46:19:@2400.4]
  wire  _T_270; // @[CSR.scala 132:14:@2410.6]
  wire  _T_273; // @[CSR.scala 132:14:@2415.6]
  wire  _T_276; // @[CSR.scala 132:14:@2420.6]
  wire  _T_279; // @[CSR.scala 132:14:@2425.6]
  wire  _T_282; // @[CSR.scala 132:14:@2430.6]
  wire  _T_284; // @[CSR.scala 132:14:@2435.6]
  wire  _T_286; // @[CSR.scala 132:14:@2440.6]
  wire  _T_288; // @[CSR.scala 132:14:@2445.6]
  wire  _T_290; // @[CSR.scala 132:14:@2450.6]
  wire  _T_292; // @[CSR.scala 132:14:@2455.6]
  wire  _T_294; // @[CSR.scala 132:14:@2460.6]
  wire  _T_296; // @[CSR.scala 132:14:@2465.6]
  wire  _T_298; // @[CSR.scala 132:14:@2470.6]
  wire  _T_300; // @[CSR.scala 132:14:@2475.6]
  wire  _T_302; // @[CSR.scala 132:14:@2480.6]
  wire  _T_304; // @[CSR.scala 132:14:@2485.6]
  wire  _T_306; // @[CSR.scala 132:14:@2490.6]
  wire  _T_308; // @[CSR.scala 132:14:@2495.6]
  wire  _T_310; // @[CSR.scala 132:14:@2500.6]
  wire  _T_312; // @[CSR.scala 132:14:@2505.6]
  wire  _T_314; // @[CSR.scala 132:14:@2510.6]
  wire  _T_316; // @[CSR.scala 132:14:@2515.6]
  wire  _T_318; // @[CSR.scala 132:14:@2520.6]
  wire  _T_320; // @[CSR.scala 132:14:@2525.6]
  wire  _T_322; // @[CSR.scala 132:14:@2530.6]
  wire  _T_324; // @[CSR.scala 132:14:@2535.6]
  wire  _T_326; // @[CSR.scala 132:14:@2540.6]
  wire  _T_328; // @[CSR.scala 132:14:@2545.6]
  wire  _T_330; // @[CSR.scala 132:14:@2550.6]
  wire  _T_332; // @[CSR.scala 132:14:@2555.6]
  wire  _T_334; // @[CSR.scala 132:14:@2560.6]
  wire  _T_336; // @[CSR.scala 132:14:@2565.6]
  wire  _T_338; // @[CSR.scala 132:14:@2570.6]
  wire  _T_340; // @[CSR.scala 132:14:@2575.6]
  wire  _T_342; // @[CSR.scala 132:14:@2580.6]
  wire  _T_344; // @[CSR.scala 132:14:@2585.6]
  wire  _T_347; // @[CSR.scala 132:14:@2590.6]
  wire  _T_350; // @[CSR.scala 136:33:@2595.6]
  wire  _T_356; // @[CSR.scala 137:50:@2600.8]
  wire  _T_357; // @[CSR.scala 137:50:@2602.8]
  wire  _T_358; // @[CSR.scala 137:50:@2604.8]
  wire  _T_359; // @[CSR.scala 137:50:@2606.8]
  wire  _T_360; // @[CSR.scala 137:50:@2608.8]
  wire  _T_361; // @[CSR.scala 137:50:@2610.8]
  wire  _T_362; // @[CSR.scala 137:50:@2612.8]
  wire  _T_363; // @[CSR.scala 137:50:@2614.8]
  wire  _T_364; // @[CSR.scala 137:50:@2616.8]
  wire [1:0] _T_365; // @[CSR.scala 137:50:@2618.8]
  wire [1:0] _T_366; // @[CSR.scala 137:50:@2620.8]
  wire [1:0] _T_367; // @[CSR.scala 137:50:@2622.8]
  wire [1:0] _T_368; // @[CSR.scala 137:50:@2624.8]
  wire  _T_369; // @[CSR.scala 137:50:@2626.8]
  wire  _T_370; // @[CSR.scala 137:50:@2628.8]
  wire  _T_371; // @[CSR.scala 137:50:@2630.8]
  wire  _T_372; // @[CSR.scala 137:50:@2632.8]
  wire  _T_373; // @[CSR.scala 137:50:@2634.8]
  wire [8:0] _T_374; // @[CSR.scala 137:50:@2636.8]
  wire  _T_375; // @[CSR.scala 137:50:@2638.8]
  wire [1:0] _T_376; // @[CSR.scala 137:50:@2640.8]
  wire [1:0] _T_377; // @[CSR.scala 137:50:@2642.8]
  wire [26:0] _T_378; // @[CSR.scala 137:50:@2644.8]
  wire  _T_379; // @[CSR.scala 137:50:@2646.8]
  wire  _GEN_185; // @[CSR.scala 136:51:@2596.6]
  wire  _GEN_186; // @[CSR.scala 136:51:@2596.6]
  wire  _GEN_187; // @[CSR.scala 136:51:@2596.6]
  wire  _GEN_188; // @[CSR.scala 136:51:@2596.6]
  wire  _GEN_189; // @[CSR.scala 136:51:@2596.6]
  wire  _GEN_190; // @[CSR.scala 136:51:@2596.6]
  wire  _GEN_191; // @[CSR.scala 136:51:@2596.6]
  wire  _GEN_192; // @[CSR.scala 136:51:@2596.6]
  wire  _GEN_193; // @[CSR.scala 136:51:@2596.6]
  wire [1:0] _GEN_194; // @[CSR.scala 136:51:@2596.6]
  wire [1:0] _GEN_195; // @[CSR.scala 136:51:@2596.6]
  wire [1:0] _GEN_196; // @[CSR.scala 136:51:@2596.6]
  wire [1:0] _GEN_197; // @[CSR.scala 136:51:@2596.6]
  wire  _GEN_198; // @[CSR.scala 136:51:@2596.6]
  wire  _GEN_199; // @[CSR.scala 136:51:@2596.6]
  wire  _GEN_200; // @[CSR.scala 136:51:@2596.6]
  wire  _GEN_201; // @[CSR.scala 136:51:@2596.6]
  wire  _GEN_202; // @[CSR.scala 136:51:@2596.6]
  wire [8:0] _GEN_203; // @[CSR.scala 136:51:@2596.6]
  wire  _GEN_204; // @[CSR.scala 136:51:@2596.6]
  wire [1:0] _GEN_205; // @[CSR.scala 136:51:@2596.6]
  wire [1:0] _GEN_206; // @[CSR.scala 136:51:@2596.6]
  wire [26:0] _GEN_207; // @[CSR.scala 136:51:@2596.6]
  wire  _GEN_208; // @[CSR.scala 136:51:@2596.6]
  wire  _T_380; // @[CSR.scala 139:33:@2673.6]
  wire  _GEN_209; // @[CSR.scala 139:51:@2674.6]
  wire  _GEN_210; // @[CSR.scala 139:51:@2674.6]
  wire  _GEN_211; // @[CSR.scala 139:51:@2674.6]
  wire  _GEN_212; // @[CSR.scala 139:51:@2674.6]
  wire  _GEN_213; // @[CSR.scala 139:51:@2674.6]
  wire  _GEN_214; // @[CSR.scala 139:51:@2674.6]
  wire  _GEN_215; // @[CSR.scala 139:51:@2674.6]
  wire  _GEN_216; // @[CSR.scala 139:51:@2674.6]
  wire  _GEN_217; // @[CSR.scala 139:51:@2674.6]
  wire [1:0] _GEN_218; // @[CSR.scala 139:51:@2674.6]
  wire [1:0] _GEN_219; // @[CSR.scala 139:51:@2674.6]
  wire [1:0] _GEN_220; // @[CSR.scala 139:51:@2674.6]
  wire [1:0] _GEN_221; // @[CSR.scala 139:51:@2674.6]
  wire  _GEN_222; // @[CSR.scala 139:51:@2674.6]
  wire  _GEN_223; // @[CSR.scala 139:51:@2674.6]
  wire  _GEN_224; // @[CSR.scala 139:51:@2674.6]
  wire  _GEN_225; // @[CSR.scala 139:51:@2674.6]
  wire  _GEN_226; // @[CSR.scala 139:51:@2674.6]
  wire [8:0] _GEN_227; // @[CSR.scala 139:51:@2674.6]
  wire  _GEN_228; // @[CSR.scala 139:51:@2674.6]
  wire [1:0] _GEN_229; // @[CSR.scala 139:51:@2674.6]
  wire [1:0] _GEN_230; // @[CSR.scala 139:51:@2674.6]
  wire [26:0] _GEN_231; // @[CSR.scala 139:51:@2674.6]
  wire  _GEN_232; // @[CSR.scala 139:51:@2674.6]
  wire  _GEN_418; // @[CSR.scala 130:30:@2409.4]
  wire  _GEN_419; // @[CSR.scala 130:30:@2409.4]
  wire  _GEN_420; // @[CSR.scala 130:30:@2409.4]
  wire  _GEN_421; // @[CSR.scala 130:30:@2409.4]
  wire  _GEN_422; // @[CSR.scala 130:30:@2409.4]
  wire  _GEN_423; // @[CSR.scala 130:30:@2409.4]
  wire  _GEN_424; // @[CSR.scala 130:30:@2409.4]
  wire  _GEN_425; // @[CSR.scala 130:30:@2409.4]
  wire  _GEN_426; // @[CSR.scala 130:30:@2409.4]
  wire [1:0] _GEN_427; // @[CSR.scala 130:30:@2409.4]
  wire [1:0] _GEN_428; // @[CSR.scala 130:30:@2409.4]
  wire [1:0] _GEN_429; // @[CSR.scala 130:30:@2409.4]
  wire [1:0] _GEN_430; // @[CSR.scala 130:30:@2409.4]
  wire  _GEN_431; // @[CSR.scala 130:30:@2409.4]
  wire  _GEN_432; // @[CSR.scala 130:30:@2409.4]
  wire  _GEN_433; // @[CSR.scala 130:30:@2409.4]
  wire  _GEN_434; // @[CSR.scala 130:30:@2409.4]
  wire  _GEN_435; // @[CSR.scala 130:30:@2409.4]
  wire [8:0] _GEN_436; // @[CSR.scala 130:30:@2409.4]
  wire  _GEN_437; // @[CSR.scala 130:30:@2409.4]
  wire [1:0] _GEN_438; // @[CSR.scala 130:30:@2409.4]
  wire [1:0] _GEN_439; // @[CSR.scala 130:30:@2409.4]
  wire [26:0] _GEN_440; // @[CSR.scala 130:30:@2409.4]
  wire  _GEN_441; // @[CSR.scala 130:30:@2409.4]
  wire  _T_411; // @[Mux.scala 46:19:@2771.4]
  wire  _T_412; // @[Mux.scala 46:16:@2772.4]
  wire  _T_413; // @[Mux.scala 46:19:@2773.4]
  wire  _T_414; // @[Mux.scala 46:16:@2774.4]
  wire  _T_415; // @[Mux.scala 46:19:@2775.4]
  wire  ie; // @[Mux.scala 46:16:@2776.4]
  wire  time_inter; // @[CSR.scala 171:27:@2777.4]
  wire  _T_418; // @[CSR.scala 175:10:@2779.4]
  wire  _T_421; // @[CSR.scala 177:10:@2781.4]
  wire  _T_423; // @[CSR.scala 178:10:@2783.4]
  wire  _T_426; // @[CSR.scala 180:22:@2786.4]
  wire  _T_429; // @[CSR.scala 182:22:@2788.4]
  wire  _T_431; // @[CSR.scala 183:22:@2790.4]
  wire [3:0] _T_432; // @[CSR.scala 184:8:@2791.4]
  wire [7:0] _T_436; // @[Cat.scala 30:58:@2795.4]
  wire [63:0] ipie; // @[CSR.scala 187:20:@2802.4]
  wire [63:0] _T_442; // @[CSR.scala 188:25:@2803.4]
  wire [63:0] ipie_m; // @[CSR.scala 188:23:@2804.4]
  wire [63:0] ipie_s; // @[CSR.scala 189:23:@2805.4]
  wire  _T_443; // @[CSR.scala 192:14:@2806.4]
  wire  _T_445; // @[CSR.scala 193:14:@2807.4]
  wire  _T_447; // @[CSR.scala 194:14:@2808.4]
  wire  _T_449; // @[CSR.scala 196:14:@2809.4]
  wire  _T_451; // @[CSR.scala 197:14:@2810.4]
  wire  _T_453; // @[CSR.scala 198:14:@2811.4]
  wire  _T_455; // @[CSR.scala 200:14:@2812.4]
  wire  _T_457; // @[CSR.scala 201:14:@2813.4]
  wire  _T_459; // @[CSR.scala 202:14:@2814.4]
  wire  _T_461; // @[CSR.scala 204:14:@2815.4]
  wire  _T_463; // @[CSR.scala 205:14:@2816.4]
  wire  _T_465; // @[CSR.scala 206:14:@2817.4]
  wire  _T_467; // @[CSR.scala 208:14:@2818.4]
  wire  _T_469; // @[CSR.scala 209:14:@2819.4]
  wire  _T_471; // @[CSR.scala 210:14:@2820.4]
  wire  _T_473; // @[CSR.scala 212:14:@2821.4]
  wire  _T_475; // @[CSR.scala 213:14:@2822.4]
  wire [1:0] _T_483; // @[Mux.scala 31:69:@2826.4]
  wire [2:0] _T_484; // @[Mux.scala 31:69:@2827.4]
  wire [2:0] _T_485; // @[Mux.scala 31:69:@2828.4]
  wire [2:0] _T_486; // @[Mux.scala 31:69:@2829.4]
  wire [3:0] _T_487; // @[Mux.scala 31:69:@2830.4]
  wire [3:0] _T_488; // @[Mux.scala 31:69:@2831.4]
  wire [3:0] _T_489; // @[Mux.scala 31:69:@2832.4]
  wire [3:0] _T_490; // @[Mux.scala 31:69:@2833.4]
  wire [3:0] _T_491; // @[Mux.scala 31:69:@2834.4]
  wire [3:0] _T_492; // @[Mux.scala 31:69:@2835.4]
  wire [3:0] _T_493; // @[Mux.scala 31:69:@2836.4]
  wire [3:0] _T_494; // @[Mux.scala 31:69:@2837.4]
  wire [3:0] _T_495; // @[Mux.scala 31:69:@2838.4]
  wire [3:0] _T_496; // @[Mux.scala 31:69:@2839.4]
  wire [3:0] _T_497; // @[Mux.scala 31:69:@2840.4]
  wire [3:0] ic; // @[Mux.scala 31:69:@2841.4]
  wire [63:0] _T_498; // @[CSR.scala 219:38:@2842.4]
  wire  _T_499; // @[CSR.scala 219:38:@2843.4]
  wire [1:0] inter_new_mode; // @[CSR.scala 219:29:@2844.4]
  wire  _T_500; // @[CSR.scala 220:42:@2845.4]
  wire  _T_501; // @[CSR.scala 220:69:@2846.4]
  wire  _T_502; // @[CSR.scala 220:78:@2847.4]
  wire  inter_enable; // @[CSR.scala 220:49:@2848.4]
  wire  _T_504; // @[CSR.scala 222:44:@2849.4]
  wire [31:0] _GEN_790; // @[CSR.scala 223:47:@2853.4]
  wire  have_excep; // @[CSR.scala 234:41:@2857.4]
  wire [29:0] _T_510; // @[Const.scala 68:33:@2861.6]
  wire  _T_513; // @[Const.scala 68:40:@2862.6]
  wire [1:0] _T_514; // @[Const.scala 69:32:@2864.8]
  wire  _T_515; // @[Conditional.scala 37:30:@2865.8]
  wire  _T_517; // @[Conditional.scala 37:30:@2874.10]
  wire  _T_520; // @[Conditional.scala 37:30:@2883.12]
  wire  _GEN_442; // @[Conditional.scala 39:67:@2884.12]
  wire  _GEN_443; // @[Conditional.scala 39:67:@2884.12]
  wire [1:0] _GEN_444; // @[Conditional.scala 39:67:@2884.12]
  wire [63:0] _GEN_445; // @[Conditional.scala 39:67:@2884.12]
  wire  _GEN_446; // @[Conditional.scala 39:67:@2875.10]
  wire  _GEN_447; // @[Conditional.scala 39:67:@2875.10]
  wire  _GEN_448; // @[Conditional.scala 39:67:@2875.10]
  wire [1:0] _GEN_449; // @[Conditional.scala 39:67:@2875.10]
  wire [63:0] _GEN_450; // @[Conditional.scala 39:67:@2875.10]
  wire  _GEN_451; // @[Conditional.scala 39:67:@2875.10]
  wire  _GEN_452; // @[Conditional.scala 39:67:@2875.10]
  wire  _GEN_453; // @[Conditional.scala 40:58:@2866.8]
  wire  _GEN_454; // @[Conditional.scala 40:58:@2866.8]
  wire [1:0] _GEN_455; // @[Conditional.scala 40:58:@2866.8]
  wire [1:0] _GEN_456; // @[Conditional.scala 40:58:@2866.8]
  wire [63:0] _GEN_457; // @[Conditional.scala 40:58:@2866.8]
  wire  _GEN_458; // @[Conditional.scala 40:58:@2866.8]
  wire  _GEN_459; // @[Conditional.scala 40:58:@2866.8]
  wire  _GEN_460; // @[Conditional.scala 40:58:@2866.8]
  wire  _GEN_461; // @[Conditional.scala 40:58:@2866.8]
  wire  _GEN_462; // @[Conditional.scala 40:58:@2866.8]
  wire  _T_522; // @[CSR.scala 264:31:@2892.8]
  wire  _T_523; // @[CSR.scala 264:67:@2893.8]
  wire  _T_524; // @[CSR.scala 264:51:@2894.8]
  wire  _T_525; // @[CSR.scala 269:18:@2898.10]
  wire  _T_527; // @[CSR.scala 269:12:@2899.10]
  wire [4:0] _T_528; // @[CSR.scala 269:40:@2900.10]
  wire [63:0] _T_529; // @[CSR.scala 269:34:@2901.10]
  wire  _T_530; // @[CSR.scala 269:34:@2902.10]
  wire  _T_532; // @[CSR.scala 269:26:@2903.10]
  wire  _T_533; // @[CSR.scala 269:23:@2904.10]
  wire [63:0] _T_536; // @[CSR.scala 270:34:@2907.10]
  wire  _T_537; // @[CSR.scala 270:34:@2908.10]
  wire  _T_539; // @[CSR.scala 270:26:@2909.10]
  wire  _T_540; // @[CSR.scala 270:23:@2910.10]
  wire [63:0] _T_545; // @[CSR.scala 271:34:@2914.10]
  wire  _T_546; // @[CSR.scala 271:34:@2915.10]
  wire  _T_548; // @[CSR.scala 271:26:@2916.10]
  wire  _T_549; // @[CSR.scala 271:23:@2917.10]
  wire [63:0] _T_552; // @[CSR.scala 272:34:@2920.10]
  wire  _T_553; // @[CSR.scala 272:34:@2921.10]
  wire  _T_555; // @[CSR.scala 272:26:@2922.10]
  wire  _T_556; // @[CSR.scala 272:23:@2923.10]
  wire [1:0] _T_558; // @[Mux.scala 31:69:@2924.10]
  wire [1:0] _T_559; // @[Mux.scala 31:69:@2925.10]
  wire [1:0] _T_560; // @[Mux.scala 31:69:@2926.10]
  wire [1:0] _T_561; // @[Mux.scala 31:69:@2927.10]
  wire [1:0] _GEN_502; // @[CSR.scala 264:88:@2895.8]
  wire [1:0] _GEN_527; // @[CSR.scala 241:32:@2863.6]
  wire [1:0] nextPrv; // @[CSR.scala 240:22:@2860.4]
  wire  _T_562; // @[Conditional.scala 37:30:@2929.10]
  wire  _T_564; // @[Conditional.scala 37:30:@2939.12]
  wire  _T_566; // @[Conditional.scala 37:30:@2949.14]
  wire  _GEN_463; // @[Conditional.scala 39:67:@2950.14]
  wire  _GEN_464; // @[Conditional.scala 39:67:@2950.14]
  wire  _GEN_469; // @[Conditional.scala 39:67:@2940.12]
  wire  _GEN_470; // @[Conditional.scala 39:67:@2940.12]
  wire [1:0] _GEN_471; // @[Conditional.scala 39:67:@2940.12]
  wire  _GEN_476; // @[Conditional.scala 39:67:@2940.12]
  wire  _GEN_477; // @[Conditional.scala 39:67:@2940.12]
  wire  _GEN_479; // @[Conditional.scala 39:67:@2940.12]
  wire  _GEN_482; // @[Conditional.scala 40:58:@2930.10]
  wire  _GEN_483; // @[Conditional.scala 40:58:@2930.10]
  wire [1:0] _GEN_484; // @[Conditional.scala 40:58:@2930.10]
  wire  _GEN_489; // @[Conditional.scala 40:58:@2930.10]
  wire  _GEN_490; // @[Conditional.scala 40:58:@2930.10]
  wire [1:0] _GEN_491; // @[Conditional.scala 40:58:@2930.10]
  wire  _GEN_493; // @[Conditional.scala 40:58:@2930.10]
  wire  _GEN_496; // @[Conditional.scala 40:58:@2930.10]
  wire  _GEN_497; // @[Conditional.scala 40:58:@2930.10]
  wire  _GEN_499; // @[Conditional.scala 40:58:@2930.10]
  wire [63:0] _T_570; // @[Mux.scala 46:16:@2958.10]
  wire [63:0] _T_572; // @[Mux.scala 46:16:@2960.10]
  wire [63:0] _T_574; // @[Mux.scala 46:16:@2962.10]
  wire [61:0] _T_575; // @[CSR.scala 306:29:@2963.10]
  wire [63:0] _T_577; // @[Cat.scala 30:58:@2964.10]
  wire [1:0] _T_578; // @[CSR.scala 307:33:@2965.10]
  wire  _T_580; // @[CSR.scala 307:39:@2966.10]
  wire [34:0] _T_582; // @[CSR.scala 309:22:@2967.10]
  wire [63:0] _GEN_791; // @[CSR.scala 309:16:@2968.10]
  wire [64:0] _T_583; // @[CSR.scala 309:16:@2968.10]
  wire [63:0] _T_584; // @[CSR.scala 309:16:@2969.10]
  wire [63:0] _T_585; // @[CSR.scala 307:27:@2970.10]
  wire  _GEN_503; // @[CSR.scala 264:88:@2895.8]
  wire  _GEN_504; // @[CSR.scala 264:88:@2895.8]
  wire [1:0] _GEN_505; // @[CSR.scala 264:88:@2895.8]
  wire  _GEN_507; // @[CSR.scala 264:88:@2895.8]
  wire  _GEN_510; // @[CSR.scala 264:88:@2895.8]
  wire  _GEN_511; // @[CSR.scala 264:88:@2895.8]
  wire [1:0] _GEN_512; // @[CSR.scala 264:88:@2895.8]
  wire  _GEN_514; // @[CSR.scala 264:88:@2895.8]
  wire  _GEN_517; // @[CSR.scala 264:88:@2895.8]
  wire  _GEN_518; // @[CSR.scala 264:88:@2895.8]
  wire  _GEN_520; // @[CSR.scala 264:88:@2895.8]
  wire [63:0] _GEN_523; // @[CSR.scala 264:88:@2895.8]
  wire  _GEN_524; // @[CSR.scala 241:32:@2863.6]
  wire  _GEN_525; // @[CSR.scala 241:32:@2863.6]
  wire [1:0] _GEN_526; // @[CSR.scala 241:32:@2863.6]
  wire [63:0] _GEN_528; // @[CSR.scala 241:32:@2863.6]
  wire  _GEN_529; // @[CSR.scala 241:32:@2863.6]
  wire  _GEN_530; // @[CSR.scala 241:32:@2863.6]
  wire [1:0] _GEN_531; // @[CSR.scala 241:32:@2863.6]
  wire  _GEN_532; // @[CSR.scala 241:32:@2863.6]
  wire  _GEN_533; // @[CSR.scala 241:32:@2863.6]
  wire  _GEN_535; // @[CSR.scala 241:32:@2863.6]
  wire  _GEN_539; // @[CSR.scala 241:32:@2863.6]
  wire  _GEN_543; // @[CSR.scala 241:32:@2863.6]
  wire  _GEN_546; // @[CSR.scala 240:22:@2860.4]
  wire  _GEN_547; // @[CSR.scala 240:22:@2860.4]
  wire [1:0] _GEN_548; // @[CSR.scala 240:22:@2860.4]
  wire  _GEN_551; // @[CSR.scala 240:22:@2860.4]
  wire  _GEN_552; // @[CSR.scala 240:22:@2860.4]
  wire [1:0] _GEN_553; // @[CSR.scala 240:22:@2860.4]
  wire  _GEN_554; // @[CSR.scala 240:22:@2860.4]
  wire  _GEN_555; // @[CSR.scala 240:22:@2860.4]
  assign csr__T_156_addr = io_id_addr[9:0];
  assign csr__T_156_data = csr[csr__T_156_addr]; // @[CSR.scala 25:16:@2273.4]
  assign csr__T_245_addr = 10'h304;
  assign csr__T_245_data = csr[csr__T_245_addr]; // @[CSR.scala 25:16:@2273.4]
  assign csr__T_246_addr = 10'h344;
  assign csr__T_246_data = csr[csr__T_246_addr]; // @[CSR.scala 25:16:@2273.4]
  assign csr__T_269_addr = 10'h180;
  assign csr__T_269_data = csr[csr__T_269_addr]; // @[CSR.scala 25:16:@2273.4]
  assign csr_mtvec_addr = 10'h305;
  assign csr_mtvec_data = csr[csr_mtvec_addr]; // @[CSR.scala 25:16:@2273.4]
  assign csr_stvec_addr = 10'h105;
  assign csr_stvec_data = csr[csr_stvec_addr]; // @[CSR.scala 25:16:@2273.4]
  assign csr_utvec_addr = 10'h5;
  assign csr_utvec_data = csr[csr_utvec_addr]; // @[CSR.scala 25:16:@2273.4]
  assign csr_medeleg_addr = 10'h302;
  assign csr_medeleg_data = csr[csr_medeleg_addr]; // @[CSR.scala 25:16:@2273.4]
  assign csr_mideleg_addr = 10'h303;
  assign csr_mideleg_data = csr[csr_mideleg_addr]; // @[CSR.scala 25:16:@2273.4]
  assign csr_sedeleg_addr = 10'h102;
  assign csr_sedeleg_data = csr[csr_sedeleg_addr]; // @[CSR.scala 25:16:@2273.4]
  assign csr_sideleg_addr = 10'h103;
  assign csr_sideleg_data = csr[csr_sideleg_addr]; // @[CSR.scala 25:16:@2273.4]
  assign csr_mie_addr = 10'h304;
  assign csr_mie_data = csr[csr_mie_addr]; // @[CSR.scala 25:16:@2273.4]
  assign csr_mip_addr = 10'h344;
  assign csr_mip_data = csr[csr_mip_addr]; // @[CSR.scala 25:16:@2273.4]
  assign csr_mtimecmp_addr = 10'h321;
  assign csr_mtimecmp_data = csr[csr_mtimecmp_addr]; // @[CSR.scala 25:16:@2273.4]
  assign csr_mepc_r_0_addr = 10'h341;
  assign csr_mepc_r_0_data = csr[csr_mepc_r_0_addr]; // @[CSR.scala 25:16:@2273.4]
  assign csr_sepc_r_0_addr = 10'h141;
  assign csr_sepc_r_0_data = csr[csr_sepc_r_0_addr]; // @[CSR.scala 25:16:@2273.4]
  assign csr_uepc_r_0_addr = 10'h41;
  assign csr_uepc_r_0_data = csr[csr_uepc_r_0_addr]; // @[CSR.scala 25:16:@2273.4]
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
  assign csr__T_416_data = {56'h0,_T_436};
  assign csr__T_416_addr = 10'h344;
  assign csr__T_416_mask = 1'h1;
  assign csr__T_416_en = 1'h1;
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
  assign _T_153 = mtime + 64'h1; // @[CSR.scala 104:18:@2327.4]
  assign _T_154 = mtime + 64'h1; // @[CSR.scala 104:18:@2328.4]
  assign _T_203 = {mstatus_SPIE,mstatus_UPIE,mstatus_MIE,mstatus_old_HIE,mstatus_SIE,mstatus_UIE}; // @[CSR.scala 112:29:@2336.4]
  assign _T_209 = {mstatus_FS,mstatus_MPP,mstatus_old_HPP,mstatus_SPP,mstatus_MPIE,mstatus_old_HPIE,_T_203}; // @[CSR.scala 112:29:@2342.4]
  assign _T_214 = {mstatus_TW,mstatus_TVM,mstatus_MXR,mstatus_SUM,mstatus_MPriv,mstatus_XS}; // @[CSR.scala 112:29:@2347.4]
  assign _T_221 = {mstatus_SD,mstatus_zero1,mstatus_SXL,mstatus_UXL,mstatus_TSR,mstatus_zero2,_T_214,_T_209}; // @[CSR.scala 112:29:@2354.4]
  assign _T_247 = 12'hc00 == io_id_addr; // @[Mux.scala 46:19:@2380.4]
  assign _T_248 = _T_247 ? mtime : csr__T_156_data; // @[Mux.scala 46:16:@2381.4]
  assign _T_249 = 12'hc01 == io_id_addr; // @[Mux.scala 46:19:@2382.4]
  assign _T_250 = _T_249 ? mtime : _T_248; // @[Mux.scala 46:16:@2383.4]
  assign _T_251 = 12'h144 == io_id_addr; // @[Mux.scala 46:19:@2384.4]
  assign _T_252 = _T_251 ? csr__T_246_data : _T_250; // @[Mux.scala 46:16:@2385.4]
  assign _T_253 = 12'h104 == io_id_addr; // @[Mux.scala 46:19:@2386.4]
  assign _T_254 = _T_253 ? csr__T_245_data : _T_252; // @[Mux.scala 46:16:@2387.4]
  assign _T_255 = 12'h100 == io_id_addr; // @[Mux.scala 46:19:@2388.4]
  assign _T_256 = _T_255 ? _T_221 : _T_254; // @[Mux.scala 46:16:@2389.4]
  assign _T_257 = 12'h300 == io_id_addr; // @[Mux.scala 46:19:@2390.4]
  assign _T_258 = _T_257 ? _T_221 : _T_256; // @[Mux.scala 46:16:@2391.4]
  assign _T_259 = 12'h301 == io_id_addr; // @[Mux.scala 46:19:@2392.4]
  assign _T_260 = _T_259 ? 64'h0 : _T_258; // @[Mux.scala 46:16:@2393.4]
  assign _T_261 = 12'hf14 == io_id_addr; // @[Mux.scala 46:19:@2394.4]
  assign _T_262 = _T_261 ? 64'h0 : _T_260; // @[Mux.scala 46:16:@2395.4]
  assign _T_263 = 12'hf13 == io_id_addr; // @[Mux.scala 46:19:@2396.4]
  assign _T_264 = _T_263 ? 64'h91d : _T_262; // @[Mux.scala 46:16:@2397.4]
  assign _T_265 = 12'hf12 == io_id_addr; // @[Mux.scala 46:19:@2398.4]
  assign _T_266 = _T_265 ? 64'h8fffffff : _T_264; // @[Mux.scala 46:16:@2399.4]
  assign _T_267 = 12'hf11 == io_id_addr; // @[Mux.scala 46:19:@2400.4]
  assign _T_270 = 12'hf11 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2410.6]
  assign _T_273 = 12'hf12 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2415.6]
  assign _T_276 = 12'hf13 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2420.6]
  assign _T_279 = 12'hf14 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2425.6]
  assign _T_282 = 12'h300 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2430.6]
  assign _T_284 = 12'h301 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2435.6]
  assign _T_286 = 12'h302 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2440.6]
  assign _T_288 = 12'h303 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2445.6]
  assign _T_290 = 12'h304 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2450.6]
  assign _T_292 = 12'h305 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2455.6]
  assign _T_294 = 12'h306 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2460.6]
  assign _T_296 = 12'h340 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2465.6]
  assign _T_298 = 12'h341 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2470.6]
  assign _T_300 = 12'h342 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2475.6]
  assign _T_302 = 12'h343 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2480.6]
  assign _T_304 = 12'h344 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2485.6]
  assign _T_306 = 12'h100 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2490.6]
  assign _T_308 = 12'h102 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2495.6]
  assign _T_310 = 12'h103 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2500.6]
  assign _T_312 = 12'h104 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2505.6]
  assign _T_314 = 12'h105 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2510.6]
  assign _T_316 = 12'h106 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2515.6]
  assign _T_318 = 12'h140 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2520.6]
  assign _T_320 = 12'h141 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2525.6]
  assign _T_322 = 12'h142 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2530.6]
  assign _T_324 = 12'h143 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2535.6]
  assign _T_326 = 12'h144 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2540.6]
  assign _T_328 = 12'h180 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2545.6]
  assign _T_330 = 12'h5 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2550.6]
  assign _T_332 = 12'h40 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2555.6]
  assign _T_334 = 12'h41 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2560.6]
  assign _T_336 = 12'h42 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2565.6]
  assign _T_338 = 12'h43 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2570.6]
  assign _T_340 = 12'h44 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2575.6]
  assign _T_342 = 12'h321 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2580.6]
  assign _T_344 = 12'hc01 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2585.6]
  assign _T_347 = 12'hc00 == io_mem_wrCSROp_csr_idx; // @[CSR.scala 132:14:@2590.6]
  assign _T_350 = io_mem_wrCSROp_csr_idx == 12'h300; // @[CSR.scala 136:33:@2595.6]
  assign _T_356 = io_mem_wrCSROp_csr_data[0]; // @[CSR.scala 137:50:@2600.8]
  assign _T_357 = io_mem_wrCSROp_csr_data[1]; // @[CSR.scala 137:50:@2602.8]
  assign _T_358 = io_mem_wrCSROp_csr_data[2]; // @[CSR.scala 137:50:@2604.8]
  assign _T_359 = io_mem_wrCSROp_csr_data[3]; // @[CSR.scala 137:50:@2606.8]
  assign _T_360 = io_mem_wrCSROp_csr_data[4]; // @[CSR.scala 137:50:@2608.8]
  assign _T_361 = io_mem_wrCSROp_csr_data[5]; // @[CSR.scala 137:50:@2610.8]
  assign _T_362 = io_mem_wrCSROp_csr_data[6]; // @[CSR.scala 137:50:@2612.8]
  assign _T_363 = io_mem_wrCSROp_csr_data[7]; // @[CSR.scala 137:50:@2614.8]
  assign _T_364 = io_mem_wrCSROp_csr_data[8]; // @[CSR.scala 137:50:@2616.8]
  assign _T_365 = io_mem_wrCSROp_csr_data[10:9]; // @[CSR.scala 137:50:@2618.8]
  assign _T_366 = io_mem_wrCSROp_csr_data[12:11]; // @[CSR.scala 137:50:@2620.8]
  assign _T_367 = io_mem_wrCSROp_csr_data[14:13]; // @[CSR.scala 137:50:@2622.8]
  assign _T_368 = io_mem_wrCSROp_csr_data[16:15]; // @[CSR.scala 137:50:@2624.8]
  assign _T_369 = io_mem_wrCSROp_csr_data[17]; // @[CSR.scala 137:50:@2626.8]
  assign _T_370 = io_mem_wrCSROp_csr_data[18]; // @[CSR.scala 137:50:@2628.8]
  assign _T_371 = io_mem_wrCSROp_csr_data[19]; // @[CSR.scala 137:50:@2630.8]
  assign _T_372 = io_mem_wrCSROp_csr_data[20]; // @[CSR.scala 137:50:@2632.8]
  assign _T_373 = io_mem_wrCSROp_csr_data[21]; // @[CSR.scala 137:50:@2634.8]
  assign _T_374 = io_mem_wrCSROp_csr_data[30:22]; // @[CSR.scala 137:50:@2636.8]
  assign _T_375 = io_mem_wrCSROp_csr_data[31]; // @[CSR.scala 137:50:@2638.8]
  assign _T_376 = io_mem_wrCSROp_csr_data[33:32]; // @[CSR.scala 137:50:@2640.8]
  assign _T_377 = io_mem_wrCSROp_csr_data[35:34]; // @[CSR.scala 137:50:@2642.8]
  assign _T_378 = io_mem_wrCSROp_csr_data[62:36]; // @[CSR.scala 137:50:@2644.8]
  assign _T_379 = io_mem_wrCSROp_csr_data[63]; // @[CSR.scala 137:50:@2646.8]
  assign _GEN_185 = _T_350 ? _T_356 : mstatus_UIE; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_186 = _T_350 ? _T_357 : mstatus_SIE; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_187 = _T_350 ? _T_358 : mstatus_old_HIE; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_188 = _T_350 ? _T_359 : mstatus_MIE; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_189 = _T_350 ? _T_360 : mstatus_UPIE; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_190 = _T_350 ? _T_361 : mstatus_SPIE; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_191 = _T_350 ? _T_362 : mstatus_old_HPIE; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_192 = _T_350 ? _T_363 : mstatus_MPIE; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_193 = _T_350 ? _T_364 : mstatus_SPP; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_194 = _T_350 ? _T_365 : mstatus_old_HPP; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_195 = _T_350 ? _T_366 : mstatus_MPP; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_196 = _T_350 ? _T_367 : mstatus_FS; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_197 = _T_350 ? _T_368 : mstatus_XS; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_198 = _T_350 ? _T_369 : mstatus_MPriv; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_199 = _T_350 ? _T_370 : mstatus_SUM; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_200 = _T_350 ? _T_371 : mstatus_MXR; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_201 = _T_350 ? _T_372 : mstatus_TVM; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_202 = _T_350 ? _T_373 : mstatus_TW; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_203 = _T_350 ? _T_374 : mstatus_zero2; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_204 = _T_350 ? _T_375 : mstatus_TSR; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_205 = _T_350 ? _T_376 : mstatus_UXL; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_206 = _T_350 ? _T_377 : mstatus_SXL; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_207 = _T_350 ? _T_378 : mstatus_zero1; // @[CSR.scala 136:51:@2596.6]
  assign _GEN_208 = _T_350 ? _T_379 : mstatus_SD; // @[CSR.scala 136:51:@2596.6]
  assign _T_380 = io_mem_wrCSROp_csr_idx == 12'h100; // @[CSR.scala 139:33:@2673.6]
  assign _GEN_209 = _T_380 ? _T_356 : _GEN_185; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_210 = _T_380 ? _T_357 : _GEN_186; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_211 = _T_380 ? _T_358 : _GEN_187; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_212 = _T_380 ? _T_359 : _GEN_188; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_213 = _T_380 ? _T_360 : _GEN_189; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_214 = _T_380 ? _T_361 : _GEN_190; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_215 = _T_380 ? _T_362 : _GEN_191; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_216 = _T_380 ? _T_363 : _GEN_192; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_217 = _T_380 ? _T_364 : _GEN_193; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_218 = _T_380 ? _T_365 : _GEN_194; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_219 = _T_380 ? _T_366 : _GEN_195; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_220 = _T_380 ? _T_367 : _GEN_196; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_221 = _T_380 ? _T_368 : _GEN_197; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_222 = _T_380 ? _T_369 : _GEN_198; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_223 = _T_380 ? _T_370 : _GEN_199; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_224 = _T_380 ? _T_371 : _GEN_200; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_225 = _T_380 ? _T_372 : _GEN_201; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_226 = _T_380 ? _T_373 : _GEN_202; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_227 = _T_380 ? _T_374 : _GEN_203; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_228 = _T_380 ? _T_375 : _GEN_204; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_229 = _T_380 ? _T_376 : _GEN_205; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_230 = _T_380 ? _T_377 : _GEN_206; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_231 = _T_380 ? _T_378 : _GEN_207; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_232 = _T_380 ? _T_379 : _GEN_208; // @[CSR.scala 139:51:@2674.6]
  assign _GEN_418 = io_mem_wrCSROp_valid ? _GEN_209 : mstatus_UIE; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_419 = io_mem_wrCSROp_valid ? _GEN_210 : mstatus_SIE; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_420 = io_mem_wrCSROp_valid ? _GEN_211 : mstatus_old_HIE; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_421 = io_mem_wrCSROp_valid ? _GEN_212 : mstatus_MIE; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_422 = io_mem_wrCSROp_valid ? _GEN_213 : mstatus_UPIE; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_423 = io_mem_wrCSROp_valid ? _GEN_214 : mstatus_SPIE; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_424 = io_mem_wrCSROp_valid ? _GEN_215 : mstatus_old_HPIE; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_425 = io_mem_wrCSROp_valid ? _GEN_216 : mstatus_MPIE; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_426 = io_mem_wrCSROp_valid ? _GEN_217 : mstatus_SPP; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_427 = io_mem_wrCSROp_valid ? _GEN_218 : mstatus_old_HPP; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_428 = io_mem_wrCSROp_valid ? _GEN_219 : mstatus_MPP; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_429 = io_mem_wrCSROp_valid ? _GEN_220 : mstatus_FS; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_430 = io_mem_wrCSROp_valid ? _GEN_221 : mstatus_XS; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_431 = io_mem_wrCSROp_valid ? _GEN_222 : mstatus_MPriv; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_432 = io_mem_wrCSROp_valid ? _GEN_223 : mstatus_SUM; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_433 = io_mem_wrCSROp_valid ? _GEN_224 : mstatus_MXR; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_434 = io_mem_wrCSROp_valid ? _GEN_225 : mstatus_TVM; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_435 = io_mem_wrCSROp_valid ? _GEN_226 : mstatus_TW; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_436 = io_mem_wrCSROp_valid ? _GEN_227 : mstatus_zero2; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_437 = io_mem_wrCSROp_valid ? _GEN_228 : mstatus_TSR; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_438 = io_mem_wrCSROp_valid ? _GEN_229 : mstatus_UXL; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_439 = io_mem_wrCSROp_valid ? _GEN_230 : mstatus_SXL; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_440 = io_mem_wrCSROp_valid ? _GEN_231 : mstatus_zero1; // @[CSR.scala 130:30:@2409.4]
  assign _GEN_441 = io_mem_wrCSROp_valid ? _GEN_232 : mstatus_SD; // @[CSR.scala 130:30:@2409.4]
  assign _T_411 = 2'h0 == prv; // @[Mux.scala 46:19:@2771.4]
  assign _T_412 = _T_411 ? mstatus_UIE : 1'h0; // @[Mux.scala 46:16:@2772.4]
  assign _T_413 = 2'h1 == prv; // @[Mux.scala 46:19:@2773.4]
  assign _T_414 = _T_413 ? mstatus_SIE : _T_412; // @[Mux.scala 46:16:@2774.4]
  assign _T_415 = 2'h3 == prv; // @[Mux.scala 46:19:@2775.4]
  assign ie = _T_415 ? mstatus_MIE : _T_414; // @[Mux.scala 46:16:@2776.4]
  assign time_inter = mtime >= csr_mtimecmp_data; // @[CSR.scala 171:27:@2777.4]
  assign _T_418 = prv == 2'h3; // @[CSR.scala 175:10:@2779.4]
  assign _T_421 = prv == 2'h1; // @[CSR.scala 177:10:@2781.4]
  assign _T_423 = prv == 2'h0; // @[CSR.scala 178:10:@2783.4]
  assign _T_426 = _T_418 & time_inter; // @[CSR.scala 180:22:@2786.4]
  assign _T_429 = _T_421 & time_inter; // @[CSR.scala 182:22:@2788.4]
  assign _T_431 = _T_423 & time_inter; // @[CSR.scala 183:22:@2790.4]
  assign _T_432 = csr_mip_data[3:0]; // @[CSR.scala 184:8:@2791.4]
  assign _T_436 = {_T_426,1'h0,_T_429,_T_431,_T_432}; // @[Cat.scala 30:58:@2795.4]
  assign ipie = csr_mip_data & csr_mie_data; // @[CSR.scala 187:20:@2802.4]
  assign _T_442 = ~ csr_mideleg_data; // @[CSR.scala 188:25:@2803.4]
  assign ipie_m = ipie & _T_442; // @[CSR.scala 188:23:@2804.4]
  assign ipie_s = ipie & csr_mideleg_data; // @[CSR.scala 189:23:@2805.4]
  assign _T_443 = ipie_m[11]; // @[CSR.scala 192:14:@2806.4]
  assign _T_445 = ipie_m[9]; // @[CSR.scala 193:14:@2807.4]
  assign _T_447 = ipie_m[8]; // @[CSR.scala 194:14:@2808.4]
  assign _T_449 = ipie_m[7]; // @[CSR.scala 196:14:@2809.4]
  assign _T_451 = ipie_m[5]; // @[CSR.scala 197:14:@2810.4]
  assign _T_453 = ipie_m[4]; // @[CSR.scala 198:14:@2811.4]
  assign _T_455 = ipie_m[3]; // @[CSR.scala 200:14:@2812.4]
  assign _T_457 = ipie_m[1]; // @[CSR.scala 201:14:@2813.4]
  assign _T_459 = ipie_m[0]; // @[CSR.scala 202:14:@2814.4]
  assign _T_461 = ipie_s[11]; // @[CSR.scala 204:14:@2815.4]
  assign _T_463 = ipie_s[9]; // @[CSR.scala 205:14:@2816.4]
  assign _T_465 = ipie_s[8]; // @[CSR.scala 206:14:@2817.4]
  assign _T_467 = ipie_s[7]; // @[CSR.scala 208:14:@2818.4]
  assign _T_469 = ipie_s[5]; // @[CSR.scala 209:14:@2819.4]
  assign _T_471 = ipie_s[4]; // @[CSR.scala 210:14:@2820.4]
  assign _T_473 = ipie_s[3]; // @[CSR.scala 212:14:@2821.4]
  assign _T_475 = ipie_s[1]; // @[CSR.scala 213:14:@2822.4]
  assign _T_483 = _T_473 ? 2'h3 : {{1'd0}, _T_475}; // @[Mux.scala 31:69:@2826.4]
  assign _T_484 = _T_471 ? 3'h4 : {{1'd0}, _T_483}; // @[Mux.scala 31:69:@2827.4]
  assign _T_485 = _T_469 ? 3'h5 : _T_484; // @[Mux.scala 31:69:@2828.4]
  assign _T_486 = _T_467 ? 3'h7 : _T_485; // @[Mux.scala 31:69:@2829.4]
  assign _T_487 = _T_465 ? 4'h8 : {{1'd0}, _T_486}; // @[Mux.scala 31:69:@2830.4]
  assign _T_488 = _T_463 ? 4'h9 : _T_487; // @[Mux.scala 31:69:@2831.4]
  assign _T_489 = _T_461 ? 4'hb : _T_488; // @[Mux.scala 31:69:@2832.4]
  assign _T_490 = _T_459 ? 4'h0 : _T_489; // @[Mux.scala 31:69:@2833.4]
  assign _T_491 = _T_457 ? 4'h1 : _T_490; // @[Mux.scala 31:69:@2834.4]
  assign _T_492 = _T_455 ? 4'h3 : _T_491; // @[Mux.scala 31:69:@2835.4]
  assign _T_493 = _T_453 ? 4'h4 : _T_492; // @[Mux.scala 31:69:@2836.4]
  assign _T_494 = _T_451 ? 4'h5 : _T_493; // @[Mux.scala 31:69:@2837.4]
  assign _T_495 = _T_449 ? 4'h7 : _T_494; // @[Mux.scala 31:69:@2838.4]
  assign _T_496 = _T_447 ? 4'h8 : _T_495; // @[Mux.scala 31:69:@2839.4]
  assign _T_497 = _T_445 ? 4'h9 : _T_496; // @[Mux.scala 31:69:@2840.4]
  assign ic = _T_443 ? 4'hb : _T_497; // @[Mux.scala 31:69:@2841.4]
  assign _T_498 = csr_mideleg_data >> ic; // @[CSR.scala 219:38:@2842.4]
  assign _T_499 = _T_498[0]; // @[CSR.scala 219:38:@2843.4]
  assign inter_new_mode = _T_499 ? 2'h1 : 2'h3; // @[CSR.scala 219:29:@2844.4]
  assign _T_500 = inter_new_mode > prv; // @[CSR.scala 220:42:@2845.4]
  assign _T_501 = inter_new_mode == prv; // @[CSR.scala 220:69:@2846.4]
  assign _T_502 = _T_501 & ie; // @[CSR.scala 220:78:@2847.4]
  assign inter_enable = _T_500 | _T_502; // @[CSR.scala 220:49:@2848.4]
  assign _T_504 = ipie != 64'h0; // @[CSR.scala 222:44:@2849.4]
  assign _GEN_790 = {{28'd0}, ic}; // @[CSR.scala 223:47:@2853.4]
  assign have_excep = io_mem_excep_valid & io_mem_excep_inst_valid; // @[CSR.scala 234:41:@2857.4]
  assign _T_510 = io_mem_excep_code[31:2]; // @[Const.scala 68:33:@2861.6]
  assign _T_513 = _T_510 == 30'h4; // @[Const.scala 68:40:@2862.6]
  assign _T_514 = io_mem_excep_code[1:0]; // @[Const.scala 69:32:@2864.8]
  assign _T_515 = 2'h3 == _T_514; // @[Conditional.scala 37:30:@2865.8]
  assign _T_517 = 2'h1 == _T_514; // @[Conditional.scala 37:30:@2874.10]
  assign _T_520 = 2'h0 == _T_514; // @[Conditional.scala 37:30:@2883.12]
  assign _GEN_442 = _T_520 ? mstatus_UPIE : _GEN_418; // @[Conditional.scala 39:67:@2884.12]
  assign _GEN_443 = _T_520 ? 1'h1 : _GEN_422; // @[Conditional.scala 39:67:@2884.12]
  assign _GEN_444 = _T_520 ? 2'h0 : prv; // @[Conditional.scala 39:67:@2884.12]
  assign _GEN_445 = _T_520 ? csr_uepc_r_0_data : 64'h0; // @[Conditional.scala 39:67:@2884.12]
  assign _GEN_446 = _T_517 ? mstatus_SPIE : _GEN_419; // @[Conditional.scala 39:67:@2875.10]
  assign _GEN_447 = _T_517 ? 1'h1 : _GEN_423; // @[Conditional.scala 39:67:@2875.10]
  assign _GEN_448 = _T_517 ? 1'h0 : _GEN_426; // @[Conditional.scala 39:67:@2875.10]
  assign _GEN_449 = _T_517 ? {{1'd0}, mstatus_SPP} : _GEN_444; // @[Conditional.scala 39:67:@2875.10]
  assign _GEN_450 = _T_517 ? csr_sepc_r_0_data : _GEN_445; // @[Conditional.scala 39:67:@2875.10]
  assign _GEN_451 = _T_517 ? _GEN_418 : _GEN_442; // @[Conditional.scala 39:67:@2875.10]
  assign _GEN_452 = _T_517 ? _GEN_422 : _GEN_443; // @[Conditional.scala 39:67:@2875.10]
  assign _GEN_453 = _T_515 ? mstatus_MPIE : _GEN_421; // @[Conditional.scala 40:58:@2866.8]
  assign _GEN_454 = _T_515 ? 1'h1 : _GEN_425; // @[Conditional.scala 40:58:@2866.8]
  assign _GEN_455 = _T_515 ? 2'h0 : _GEN_428; // @[Conditional.scala 40:58:@2866.8]
  assign _GEN_456 = _T_515 ? mstatus_MPP : _GEN_449; // @[Conditional.scala 40:58:@2866.8]
  assign _GEN_457 = _T_515 ? csr_mepc_r_0_data : _GEN_450; // @[Conditional.scala 40:58:@2866.8]
  assign _GEN_458 = _T_515 ? _GEN_419 : _GEN_446; // @[Conditional.scala 40:58:@2866.8]
  assign _GEN_459 = _T_515 ? _GEN_423 : _GEN_447; // @[Conditional.scala 40:58:@2866.8]
  assign _GEN_460 = _T_515 ? _GEN_426 : _GEN_448; // @[Conditional.scala 40:58:@2866.8]
  assign _GEN_461 = _T_515 ? _GEN_418 : _GEN_451; // @[Conditional.scala 40:58:@2866.8]
  assign _GEN_462 = _T_515 ? _GEN_422 : _GEN_452; // @[Conditional.scala 40:58:@2866.8]
  assign _T_522 = io_mem_excep_code == 32'h14; // @[CSR.scala 264:31:@2892.8]
  assign _T_523 = io_mem_excep_code == 32'h15; // @[CSR.scala 264:67:@2893.8]
  assign _T_524 = _T_522 | _T_523; // @[CSR.scala 264:51:@2894.8]
  assign _T_525 = io_mem_excep_code[31]; // @[CSR.scala 269:18:@2898.10]
  assign _T_527 = _T_525 == 1'h0; // @[CSR.scala 269:12:@2899.10]
  assign _T_528 = io_mem_excep_code[4:0]; // @[CSR.scala 269:40:@2900.10]
  assign _T_529 = csr_medeleg_data >> _T_528; // @[CSR.scala 269:34:@2901.10]
  assign _T_530 = _T_529[0]; // @[CSR.scala 269:34:@2902.10]
  assign _T_532 = _T_530 == 1'h0; // @[CSR.scala 269:26:@2903.10]
  assign _T_533 = _T_527 & _T_532; // @[CSR.scala 269:23:@2904.10]
  assign _T_536 = csr_mideleg_data >> _T_528; // @[CSR.scala 270:34:@2907.10]
  assign _T_537 = _T_536[0]; // @[CSR.scala 270:34:@2908.10]
  assign _T_539 = _T_537 == 1'h0; // @[CSR.scala 270:26:@2909.10]
  assign _T_540 = _T_525 & _T_539; // @[CSR.scala 270:23:@2910.10]
  assign _T_545 = csr_sedeleg_data >> _T_528; // @[CSR.scala 271:34:@2914.10]
  assign _T_546 = _T_545[0]; // @[CSR.scala 271:34:@2915.10]
  assign _T_548 = _T_546 == 1'h0; // @[CSR.scala 271:26:@2916.10]
  assign _T_549 = _T_527 & _T_548; // @[CSR.scala 271:23:@2917.10]
  assign _T_552 = csr_sideleg_data >> _T_528; // @[CSR.scala 272:34:@2920.10]
  assign _T_553 = _T_552[0]; // @[CSR.scala 272:34:@2921.10]
  assign _T_555 = _T_553 == 1'h0; // @[CSR.scala 272:26:@2922.10]
  assign _T_556 = _T_525 & _T_555; // @[CSR.scala 272:23:@2923.10]
  assign _T_558 = _T_556 ? 2'h1 : 2'h0; // @[Mux.scala 31:69:@2924.10]
  assign _T_559 = _T_549 ? 2'h1 : _T_558; // @[Mux.scala 31:69:@2925.10]
  assign _T_560 = _T_540 ? 2'h3 : _T_559; // @[Mux.scala 31:69:@2926.10]
  assign _T_561 = _T_533 ? 2'h3 : _T_560; // @[Mux.scala 31:69:@2927.10]
  assign _GEN_502 = _T_524 ? prv : _T_561; // @[CSR.scala 264:88:@2895.8]
  assign _GEN_527 = _T_513 ? _GEN_456 : _GEN_502; // @[CSR.scala 241:32:@2863.6]
  assign nextPrv = have_excep ? _GEN_527 : prv; // @[CSR.scala 240:22:@2860.4]
  assign _T_562 = 2'h3 == nextPrv; // @[Conditional.scala 37:30:@2929.10]
  assign _T_564 = 2'h1 == nextPrv; // @[Conditional.scala 37:30:@2939.12]
  assign _T_566 = 2'h0 == nextPrv; // @[Conditional.scala 37:30:@2949.14]
  assign _GEN_463 = _T_566 ? mstatus_UIE : _GEN_422; // @[Conditional.scala 39:67:@2950.14]
  assign _GEN_464 = _T_566 ? 1'h0 : _GEN_418; // @[Conditional.scala 39:67:@2950.14]
  assign _GEN_469 = _T_564 ? mstatus_SIE : _GEN_423; // @[Conditional.scala 39:67:@2940.12]
  assign _GEN_470 = _T_564 ? 1'h0 : _GEN_419; // @[Conditional.scala 39:67:@2940.12]
  assign _GEN_471 = _T_564 ? prv : {{1'd0}, _GEN_426}; // @[Conditional.scala 39:67:@2940.12]
  assign _GEN_476 = _T_564 ? _GEN_422 : _GEN_463; // @[Conditional.scala 39:67:@2940.12]
  assign _GEN_477 = _T_564 ? _GEN_418 : _GEN_464; // @[Conditional.scala 39:67:@2940.12]
  assign _GEN_479 = _T_564 ? 1'h0 : _T_566; // @[Conditional.scala 39:67:@2940.12]
  assign _GEN_482 = _T_562 ? mstatus_MIE : _GEN_425; // @[Conditional.scala 40:58:@2930.10]
  assign _GEN_483 = _T_562 ? 1'h0 : _GEN_421; // @[Conditional.scala 40:58:@2930.10]
  assign _GEN_484 = _T_562 ? prv : _GEN_428; // @[Conditional.scala 40:58:@2930.10]
  assign _GEN_489 = _T_562 ? _GEN_423 : _GEN_469; // @[Conditional.scala 40:58:@2930.10]
  assign _GEN_490 = _T_562 ? _GEN_419 : _GEN_470; // @[Conditional.scala 40:58:@2930.10]
  assign _GEN_491 = _T_562 ? {{1'd0}, _GEN_426} : _GEN_471; // @[Conditional.scala 40:58:@2930.10]
  assign _GEN_493 = _T_562 ? 1'h0 : _T_564; // @[Conditional.scala 40:58:@2930.10]
  assign _GEN_496 = _T_562 ? _GEN_422 : _GEN_476; // @[Conditional.scala 40:58:@2930.10]
  assign _GEN_497 = _T_562 ? _GEN_418 : _GEN_477; // @[Conditional.scala 40:58:@2930.10]
  assign _GEN_499 = _T_562 ? 1'h0 : _GEN_479; // @[Conditional.scala 40:58:@2930.10]
  assign _T_570 = _T_566 ? csr_utvec_data : 64'h0; // @[Mux.scala 46:16:@2958.10]
  assign _T_572 = _T_564 ? csr_stvec_data : _T_570; // @[Mux.scala 46:16:@2960.10]
  assign _T_574 = _T_562 ? csr_mtvec_data : _T_572; // @[Mux.scala 46:16:@2962.10]
  assign _T_575 = _T_574[63:2]; // @[CSR.scala 306:29:@2963.10]
  assign _T_577 = {_T_575,2'h0}; // @[Cat.scala 30:58:@2964.10]
  assign _T_578 = _T_574[1:0]; // @[CSR.scala 307:33:@2965.10]
  assign _T_580 = _T_578 == 2'h0; // @[CSR.scala 307:39:@2966.10]
  assign _T_582 = 32'h4 * io_mem_excep_code; // @[CSR.scala 309:22:@2967.10]
  assign _GEN_791 = {{29'd0}, _T_582}; // @[CSR.scala 309:16:@2968.10]
  assign _T_583 = _T_577 + _GEN_791; // @[CSR.scala 309:16:@2968.10]
  assign _T_584 = _T_577 + _GEN_791; // @[CSR.scala 309:16:@2969.10]
  assign _T_585 = _T_580 ? _T_577 : _T_584; // @[CSR.scala 307:27:@2970.10]
  assign _GEN_503 = _T_524 ? _GEN_425 : _GEN_482; // @[CSR.scala 264:88:@2895.8]
  assign _GEN_504 = _T_524 ? _GEN_421 : _GEN_483; // @[CSR.scala 264:88:@2895.8]
  assign _GEN_505 = _T_524 ? _GEN_428 : _GEN_484; // @[CSR.scala 264:88:@2895.8]
  assign _GEN_507 = _T_524 ? 1'h0 : _T_562; // @[CSR.scala 264:88:@2895.8]
  assign _GEN_510 = _T_524 ? _GEN_423 : _GEN_489; // @[CSR.scala 264:88:@2895.8]
  assign _GEN_511 = _T_524 ? _GEN_419 : _GEN_490; // @[CSR.scala 264:88:@2895.8]
  assign _GEN_512 = _T_524 ? {{1'd0}, _GEN_426} : _GEN_491; // @[CSR.scala 264:88:@2895.8]
  assign _GEN_514 = _T_524 ? 1'h0 : _GEN_493; // @[CSR.scala 264:88:@2895.8]
  assign _GEN_517 = _T_524 ? _GEN_422 : _GEN_496; // @[CSR.scala 264:88:@2895.8]
  assign _GEN_518 = _T_524 ? _GEN_418 : _GEN_497; // @[CSR.scala 264:88:@2895.8]
  assign _GEN_520 = _T_524 ? 1'h0 : _GEN_499; // @[CSR.scala 264:88:@2895.8]
  assign _GEN_523 = _T_524 ? 64'h0 : _T_585; // @[CSR.scala 264:88:@2895.8]
  assign _GEN_524 = _T_513 ? _GEN_453 : _GEN_504; // @[CSR.scala 241:32:@2863.6]
  assign _GEN_525 = _T_513 ? _GEN_454 : _GEN_503; // @[CSR.scala 241:32:@2863.6]
  assign _GEN_526 = _T_513 ? _GEN_455 : _GEN_505; // @[CSR.scala 241:32:@2863.6]
  assign _GEN_528 = _T_513 ? _GEN_457 : _GEN_523; // @[CSR.scala 241:32:@2863.6]
  assign _GEN_529 = _T_513 ? _GEN_458 : _GEN_511; // @[CSR.scala 241:32:@2863.6]
  assign _GEN_530 = _T_513 ? _GEN_459 : _GEN_510; // @[CSR.scala 241:32:@2863.6]
  assign _GEN_531 = _T_513 ? {{1'd0}, _GEN_460} : _GEN_512; // @[CSR.scala 241:32:@2863.6]
  assign _GEN_532 = _T_513 ? _GEN_461 : _GEN_518; // @[CSR.scala 241:32:@2863.6]
  assign _GEN_533 = _T_513 ? _GEN_462 : _GEN_517; // @[CSR.scala 241:32:@2863.6]
  assign _GEN_535 = _T_513 ? 1'h0 : _GEN_507; // @[CSR.scala 241:32:@2863.6]
  assign _GEN_539 = _T_513 ? 1'h0 : _GEN_514; // @[CSR.scala 241:32:@2863.6]
  assign _GEN_543 = _T_513 ? 1'h0 : _GEN_520; // @[CSR.scala 241:32:@2863.6]
  assign _GEN_546 = have_excep ? _GEN_524 : _GEN_421; // @[CSR.scala 240:22:@2860.4]
  assign _GEN_547 = have_excep ? _GEN_525 : _GEN_425; // @[CSR.scala 240:22:@2860.4]
  assign _GEN_548 = have_excep ? _GEN_526 : _GEN_428; // @[CSR.scala 240:22:@2860.4]
  assign _GEN_551 = have_excep ? _GEN_529 : _GEN_419; // @[CSR.scala 240:22:@2860.4]
  assign _GEN_552 = have_excep ? _GEN_530 : _GEN_423; // @[CSR.scala 240:22:@2860.4]
  assign _GEN_553 = have_excep ? _GEN_531 : {{1'd0}, _GEN_426}; // @[CSR.scala 240:22:@2860.4]
  assign _GEN_554 = have_excep ? _GEN_532 : _GEN_418; // @[CSR.scala 240:22:@2860.4]
  assign _GEN_555 = have_excep ? _GEN_533 : _GEN_422; // @[CSR.scala 240:22:@2860.4]
  assign io_id_rdata = _T_267 ? 64'h91d : _T_266; // @[CSR.scala 106:15:@2402.4]
  assign io_id_priv = prv; // @[CSR.scala 119:14:@2403.4]
  assign io_mmu_satp = csr__T_269_data; // @[CSR.scala 121:15:@2405.4]
  assign io_mmu_priv = prv; // @[CSR.scala 122:15:@2406.4]
  assign io_mmu_mxr = mstatus_MXR; // @[CSR.scala 124:15:@2408.4]
  assign io_mmu_sum = mstatus_SUM; // @[CSR.scala 123:15:@2407.4]
  assign io_flush = io_mem_excep_valid & io_mem_excep_inst_valid; // @[CSR.scala 237:14:@2858.4]
  assign io_csrNewPc = have_excep ? _GEN_528 : 64'h0; // @[CSR.scala 238:17:@2859.4 CSR.scala 248:25:@2871.10 CSR.scala 255:25:@2880.12 CSR.scala 261:25:@2888.14 CSR.scala 307:21:@2971.10]
  assign io_inter_valid = inter_enable & _T_504; // @[CSR.scala 222:20:@2851.4]
  assign io_inter_bits = 32'h80000000 | _GEN_790; // @[CSR.scala 223:20:@2854.4]
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
      csr[csr__T_272_addr] <= csr__T_272_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_275_en & csr__T_275_mask) begin
      csr[csr__T_275_addr] <= csr__T_275_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_278_en & csr__T_278_mask) begin
      csr[csr__T_278_addr] <= csr__T_278_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_281_en & csr__T_281_mask) begin
      csr[csr__T_281_addr] <= csr__T_281_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_283_en & csr__T_283_mask) begin
      csr[csr__T_283_addr] <= csr__T_283_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_285_en & csr__T_285_mask) begin
      csr[csr__T_285_addr] <= csr__T_285_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_287_en & csr__T_287_mask) begin
      csr[csr__T_287_addr] <= csr__T_287_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_289_en & csr__T_289_mask) begin
      csr[csr__T_289_addr] <= csr__T_289_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_291_en & csr__T_291_mask) begin
      csr[csr__T_291_addr] <= csr__T_291_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_293_en & csr__T_293_mask) begin
      csr[csr__T_293_addr] <= csr__T_293_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_295_en & csr__T_295_mask) begin
      csr[csr__T_295_addr] <= csr__T_295_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_297_en & csr__T_297_mask) begin
      csr[csr__T_297_addr] <= csr__T_297_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_299_en & csr__T_299_mask) begin
      csr[csr__T_299_addr] <= csr__T_299_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_301_en & csr__T_301_mask) begin
      csr[csr__T_301_addr] <= csr__T_301_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_303_en & csr__T_303_mask) begin
      csr[csr__T_303_addr] <= csr__T_303_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_305_en & csr__T_305_mask) begin
      csr[csr__T_305_addr] <= csr__T_305_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_307_en & csr__T_307_mask) begin
      csr[csr__T_307_addr] <= csr__T_307_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_309_en & csr__T_309_mask) begin
      csr[csr__T_309_addr] <= csr__T_309_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_311_en & csr__T_311_mask) begin
      csr[csr__T_311_addr] <= csr__T_311_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_313_en & csr__T_313_mask) begin
      csr[csr__T_313_addr] <= csr__T_313_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_315_en & csr__T_315_mask) begin
      csr[csr__T_315_addr] <= csr__T_315_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_317_en & csr__T_317_mask) begin
      csr[csr__T_317_addr] <= csr__T_317_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_319_en & csr__T_319_mask) begin
      csr[csr__T_319_addr] <= csr__T_319_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_321_en & csr__T_321_mask) begin
      csr[csr__T_321_addr] <= csr__T_321_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_323_en & csr__T_323_mask) begin
      csr[csr__T_323_addr] <= csr__T_323_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_325_en & csr__T_325_mask) begin
      csr[csr__T_325_addr] <= csr__T_325_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_327_en & csr__T_327_mask) begin
      csr[csr__T_327_addr] <= csr__T_327_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_329_en & csr__T_329_mask) begin
      csr[csr__T_329_addr] <= csr__T_329_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_331_en & csr__T_331_mask) begin
      csr[csr__T_331_addr] <= csr__T_331_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_333_en & csr__T_333_mask) begin
      csr[csr__T_333_addr] <= csr__T_333_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_335_en & csr__T_335_mask) begin
      csr[csr__T_335_addr] <= csr__T_335_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_337_en & csr__T_337_mask) begin
      csr[csr__T_337_addr] <= csr__T_337_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_339_en & csr__T_339_mask) begin
      csr[csr__T_339_addr] <= csr__T_339_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_341_en & csr__T_341_mask) begin
      csr[csr__T_341_addr] <= csr__T_341_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_343_en & csr__T_343_mask) begin
      csr[csr__T_343_addr] <= csr__T_343_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_346_en & csr__T_346_mask) begin
      csr[csr__T_346_addr] <= csr__T_346_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_349_en & csr__T_349_mask) begin
      csr[csr__T_349_addr] <= csr__T_349_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr_mcause_en & csr_mcause_mask) begin
      csr[csr_mcause_addr] <= csr_mcause_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr_scause_en & csr_scause_mask) begin
      csr[csr_scause_addr] <= csr_scause_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr_ucause_en & csr_ucause_mask) begin
      csr[csr_ucause_addr] <= csr_ucause_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr_mtval_en & csr_mtval_mask) begin
      csr[csr_mtval_addr] <= csr_mtval_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr_stval_en & csr_stval_mask) begin
      csr[csr_stval_addr] <= csr_stval_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr_utval_en & csr_utval_mask) begin
      csr[csr_utval_addr] <= csr_utval_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr__T_416_en & csr__T_416_mask) begin
      csr[csr__T_416_addr] <= csr__T_416_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr_mepc_w_0_en & csr_mepc_w_0_mask) begin
      csr[csr_mepc_w_0_addr] <= csr_mepc_w_0_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr_sepc_w_0_en & csr_sepc_w_0_mask) begin
      csr[csr_sepc_w_0_addr] <= csr_sepc_w_0_data; // @[CSR.scala 25:16:@2273.4]
    end
    if(csr_uepc_w_0_en & csr_uepc_w_0_mask) begin
      csr[csr_uepc_w_0_addr] <= csr_uepc_w_0_data; // @[CSR.scala 25:16:@2273.4]
    end
    if (reset) begin
      prv <= 2'h3;
    end else begin
      if (have_excep) begin
        if (_T_513) begin
          if (_T_515) begin
            prv <= mstatus_MPP;
          end else begin
            if (_T_517) begin
              prv <= {{1'd0}, mstatus_SPP};
            end else begin
              if (_T_520) begin
                prv <= 2'h0;
              end
            end
          end
        end else begin
          if (!(_T_524)) begin
            if (_T_533) begin
              prv <= 2'h3;
            end else begin
              if (_T_540) begin
                prv <= 2'h3;
              end else begin
                if (_T_549) begin
                  prv <= 2'h1;
                end else begin
                  if (_T_556) begin
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
        if (_T_513) begin
          if (_T_515) begin
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
          if (_T_524) begin
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
            if (_T_562) begin
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
      mstatus_SPP <= _GEN_553[0];
    end
    if (reset) begin
      mstatus_MPIE <= 1'h0;
    end else begin
      if (have_excep) begin
        if (_T_513) begin
          if (_T_515) begin
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
          if (_T_524) begin
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
            if (_T_562) begin
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
        if (_T_513) begin
          if (_T_515) begin
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
            if (_T_517) begin
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
          if (_T_524) begin
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
            if (_T_562) begin
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
              if (_T_564) begin
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
        if (_T_513) begin
          if (_T_515) begin
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
            if (_T_517) begin
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
              if (_T_520) begin
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
          if (_T_524) begin
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
            if (_T_562) begin
              mstatus_UPIE <= _GEN_422;
            end else begin
              if (_T_564) begin
                mstatus_UPIE <= _GEN_422;
              end else begin
                if (_T_566) begin
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
        if (_T_513) begin
          if (_T_515) begin
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
          if (_T_524) begin
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
            if (_T_562) begin
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
        if (_T_513) begin
          if (_T_515) begin
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
            if (_T_517) begin
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
          if (_T_524) begin
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
            if (_T_562) begin
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
              if (_T_564) begin
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
        if (_T_513) begin
          if (_T_515) begin
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
            if (_T_517) begin
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
              if (_T_520) begin
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
          if (_T_524) begin
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
            if (_T_562) begin
              mstatus_UIE <= _GEN_418;
            end else begin
              if (_T_564) begin
                mstatus_UIE <= _GEN_418;
              end else begin
                if (_T_566) begin
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
      mtime <= _T_154;
    end
  end
endmodule
module CPU( // @[:@2975.2]
  input         clock, // @[:@2976.4]
  input         reset, // @[:@2977.4]
  input         io_en, // @[:@2978.4]
  output [63:0] io_debug_pc, // @[:@2978.4]
  output [31:0] io_debug_ins, // @[:@2978.4]
  output [1:0]  io_debug_if_wait, // @[:@2978.4]
  output [1:0]  io_debug_mem_wait, // @[:@2978.4]
  output        io_debug_if_ready, // @[:@2978.4]
  output        io_debug_mem_ready, // @[:@2978.4]
  output [3:0]  io_debug_if_mode, // @[:@2978.4]
  output [3:0]  io_debug_mem_mode, // @[:@2978.4]
  output [63:0] io_debug_if_addr, // @[:@2978.4]
  output [63:0] io_debug_mem_addr, // @[:@2978.4]
  output        io_debug_if_error, // @[:@2978.4]
  output        io_debug_mem_error, // @[:@2978.4]
  output [3:0]  io_mem_mode, // @[:@2978.4]
  input         io_mem_ready, // @[:@2978.4]
  output [63:0] io_mem_addr, // @[:@2978.4]
  input  [63:0] io_mem_rdata, // @[:@2978.4]
  output [63:0] io_mem_wdata, // @[:@2978.4]
  output [3:0]  io_serial_mode, // @[:@2978.4]
  input         io_serial_ready, // @[:@2978.4]
  output [63:0] io_serial_addr, // @[:@2978.4]
  input  [63:0] io_serial_rdata, // @[:@2978.4]
  output [63:0] io_serial_wdata // @[:@2978.4]
);
  wire  insr_io_jump; // @[cpu.scala 27:22:@2980.4]
  wire [63:0] insr_io_jdest; // @[cpu.scala 27:22:@2980.4]
  wire  insr_io_nls; // @[cpu.scala 27:22:@2980.4]
  wire [63:0] insr_io_lpc; // @[cpu.scala 27:22:@2980.4]
  wire [63:0] insr_io_insp; // @[cpu.scala 27:22:@2980.4]
  wire [63:0] insr_io_inspd; // @[cpu.scala 27:22:@2980.4]
  wire  insr_io_bubble; // @[cpu.scala 27:22:@2980.4]
  wire [31:0] insr_io_ins; // @[cpu.scala 27:22:@2980.4]
  wire [63:0] insr_io_pc; // @[cpu.scala 27:22:@2980.4]
  wire [63:0] insr_io_insn; // @[cpu.scala 27:22:@2980.4]
  wire [63:0] insr_io_insnd; // @[cpu.scala 27:22:@2980.4]
  wire [3:0] insr_io_mmu_mode; // @[cpu.scala 27:22:@2980.4]
  wire  insr_io_mmu_ready; // @[cpu.scala 27:22:@2980.4]
  wire [63:0] insr_io_mmu_addr; // @[cpu.scala 27:22:@2980.4]
  wire [63:0] insr_io_mmu_rdata; // @[cpu.scala 27:22:@2980.4]
  wire  insr_io_mmu_if_rst; // @[cpu.scala 27:22:@2980.4]
  wire [63:0] insr_io_excep_pc; // @[cpu.scala 27:22:@2980.4]
  wire  insr_io_excep_inst_valid; // @[cpu.scala 27:22:@2980.4]
  wire [31:0] insd_io_ins; // @[cpu.scala 28:22:@2983.4]
  wire  insd_io_lastload_valid; // @[cpu.scala 28:22:@2983.4]
  wire [4:0] insd_io_lastload_index; // @[cpu.scala 28:22:@2983.4]
  wire  insd_io_loadinfo_valid; // @[cpu.scala 28:22:@2983.4]
  wire [4:0] insd_io_loadinfo_index; // @[cpu.scala 28:22:@2983.4]
  wire [63:0] insd_io_imm; // @[cpu.scala 28:22:@2983.4]
  wire [3:0] insd_io_ALUOp; // @[cpu.scala 28:22:@2983.4]
  wire [3:0] insd_io_exe_type; // @[cpu.scala 28:22:@2983.4]
  wire [3:0] insd_io_ls_mode; // @[cpu.scala 28:22:@2983.4]
  wire  insd_io_op32; // @[cpu.scala 28:22:@2983.4]
  wire  insd_io_bubble; // @[cpu.scala 28:22:@2983.4]
  wire [4:0] insd_io_regr_r1; // @[cpu.scala 28:22:@2983.4]
  wire [4:0] insd_io_regr_r2; // @[cpu.scala 28:22:@2983.4]
  wire [63:0] insd_io_regr_r1d; // @[cpu.scala 28:22:@2983.4]
  wire [63:0] insd_io_regr_r2d; // @[cpu.scala 28:22:@2983.4]
  wire  insd_io_dreg_rs2_valid; // @[cpu.scala 28:22:@2983.4]
  wire [63:0] insd_io_dreg_rs1_value; // @[cpu.scala 28:22:@2983.4]
  wire [63:0] insd_io_dreg_rs2_value; // @[cpu.scala 28:22:@2983.4]
  wire  insd_io_dreg_rd_valid; // @[cpu.scala 28:22:@2983.4]
  wire [4:0] insd_io_dreg_rd_index; // @[cpu.scala 28:22:@2983.4]
  wire [11:0] insd_io_csr_addr; // @[cpu.scala 28:22:@2983.4]
  wire [63:0] insd_io_csr_rdata; // @[cpu.scala 28:22:@2983.4]
  wire [1:0] insd_io_csr_priv; // @[cpu.scala 28:22:@2983.4]
  wire  insd_io_csr_content_valid; // @[cpu.scala 28:22:@2983.4]
  wire [11:0] insd_io_csr_content_csr_idx; // @[cpu.scala 28:22:@2983.4]
  wire [63:0] insd_io_csr_content_csr_data; // @[cpu.scala 28:22:@2983.4]
  wire  insd_io_csr_from_ex_valid; // @[cpu.scala 28:22:@2983.4]
  wire [11:0] insd_io_csr_from_ex_csr_idx; // @[cpu.scala 28:22:@2983.4]
  wire [63:0] insd_io_csr_from_ex_csr_data; // @[cpu.scala 28:22:@2983.4]
  wire  insd_io_csr_from_mem_valid; // @[cpu.scala 28:22:@2983.4]
  wire [11:0] insd_io_csr_from_mem_csr_idx; // @[cpu.scala 28:22:@2983.4]
  wire [63:0] insd_io_csr_from_mem_csr_data; // @[cpu.scala 28:22:@2983.4]
  wire  insd_io_exWrReg_wbrv; // @[cpu.scala 28:22:@2983.4]
  wire [4:0] insd_io_exWrReg_wbri; // @[cpu.scala 28:22:@2983.4]
  wire [63:0] insd_io_exWrReg_wbrd; // @[cpu.scala 28:22:@2983.4]
  wire  insd_io_memWrReg_wbrv; // @[cpu.scala 28:22:@2983.4]
  wire [4:0] insd_io_memWrReg_wbri; // @[cpu.scala 28:22:@2983.4]
  wire [63:0] insd_io_memWrReg_wbrd; // @[cpu.scala 28:22:@2983.4]
  wire  insd_io_if_excep_valid; // @[cpu.scala 28:22:@2983.4]
  wire [31:0] insd_io_if_excep_code; // @[cpu.scala 28:22:@2983.4]
  wire [31:0] insd_io_if_excep_value; // @[cpu.scala 28:22:@2983.4]
  wire [63:0] insd_io_if_excep_pc; // @[cpu.scala 28:22:@2983.4]
  wire  insd_io_if_excep_inst_valid; // @[cpu.scala 28:22:@2983.4]
  wire  insd_io_ex_excep_valid; // @[cpu.scala 28:22:@2983.4]
  wire [31:0] insd_io_ex_excep_code; // @[cpu.scala 28:22:@2983.4]
  wire [31:0] insd_io_ex_excep_value; // @[cpu.scala 28:22:@2983.4]
  wire [63:0] insd_io_ex_excep_pc; // @[cpu.scala 28:22:@2983.4]
  wire  insd_io_ex_excep_inst_valid; // @[cpu.scala 28:22:@2983.4]
  wire [63:0] exec_io_imm; // @[cpu.scala 29:22:@2986.4]
  wire [3:0] exec_io_ALUOp; // @[cpu.scala 29:22:@2986.4]
  wire [63:0] exec_io_pc; // @[cpu.scala 29:22:@2986.4]
  wire [3:0] exec_io_exe_type; // @[cpu.scala 29:22:@2986.4]
  wire  exec_io_op32; // @[cpu.scala 29:22:@2986.4]
  wire  exec_io_dreg_rs2_valid; // @[cpu.scala 29:22:@2986.4]
  wire [63:0] exec_io_dreg_rs1_value; // @[cpu.scala 29:22:@2986.4]
  wire [63:0] exec_io_dreg_rs2_value; // @[cpu.scala 29:22:@2986.4]
  wire  exec_io_dreg_rd_valid; // @[cpu.scala 29:22:@2986.4]
  wire [4:0] exec_io_dreg_rd_index; // @[cpu.scala 29:22:@2986.4]
  wire  exec_io_nls; // @[cpu.scala 29:22:@2986.4]
  wire [63:0] exec_io_addr; // @[cpu.scala 29:22:@2986.4]
  wire [63:0] exec_io_data; // @[cpu.scala 29:22:@2986.4]
  wire  exec_io_jump; // @[cpu.scala 29:22:@2986.4]
  wire [63:0] exec_io_jdest; // @[cpu.scala 29:22:@2986.4]
  wire  exec_io_wreg_wbrv; // @[cpu.scala 29:22:@2986.4]
  wire [4:0] exec_io_wreg_wbri; // @[cpu.scala 29:22:@2986.4]
  wire [63:0] exec_io_wreg_wbrd; // @[cpu.scala 29:22:@2986.4]
  wire  exec_io_wcsr_valid; // @[cpu.scala 29:22:@2986.4]
  wire [11:0] exec_io_wcsr_csr_idx; // @[cpu.scala 29:22:@2986.4]
  wire [63:0] exec_io_wcsr_csr_data; // @[cpu.scala 29:22:@2986.4]
  wire  exec_io_csr_op_valid; // @[cpu.scala 29:22:@2986.4]
  wire [11:0] exec_io_csr_op_csr_idx; // @[cpu.scala 29:22:@2986.4]
  wire [63:0] exec_io_csr_op_csr_data; // @[cpu.scala 29:22:@2986.4]
  wire  exec_io_id_excep_valid; // @[cpu.scala 29:22:@2986.4]
  wire [31:0] exec_io_id_excep_code; // @[cpu.scala 29:22:@2986.4]
  wire [31:0] exec_io_id_excep_value; // @[cpu.scala 29:22:@2986.4]
  wire [63:0] exec_io_id_excep_pc; // @[cpu.scala 29:22:@2986.4]
  wire  exec_io_id_excep_inst_valid; // @[cpu.scala 29:22:@2986.4]
  wire  exec_io_mem_excep_valid; // @[cpu.scala 29:22:@2986.4]
  wire [31:0] exec_io_mem_excep_code; // @[cpu.scala 29:22:@2986.4]
  wire [31:0] exec_io_mem_excep_value; // @[cpu.scala 29:22:@2986.4]
  wire [63:0] exec_io_mem_excep_pc; // @[cpu.scala 29:22:@2986.4]
  wire  exec_io_mem_excep_inst_valid; // @[cpu.scala 29:22:@2986.4]
  wire  memc_io_nls; // @[cpu.scala 30:22:@2989.4]
  wire [3:0] memc_io_lsm; // @[cpu.scala 30:22:@2989.4]
  wire [63:0] memc_io_addr; // @[cpu.scala 30:22:@2989.4]
  wire [63:0] memc_io_data; // @[cpu.scala 30:22:@2989.4]
  wire  memc_io_ready; // @[cpu.scala 30:22:@2989.4]
  wire  memc_io_ereg_wbrv; // @[cpu.scala 30:22:@2989.4]
  wire [4:0] memc_io_ereg_wbri; // @[cpu.scala 30:22:@2989.4]
  wire [63:0] memc_io_ereg_wbrd; // @[cpu.scala 30:22:@2989.4]
  wire  memc_io_wreg_wbrv; // @[cpu.scala 30:22:@2989.4]
  wire [4:0] memc_io_wreg_wbri; // @[cpu.scala 30:22:@2989.4]
  wire [63:0] memc_io_wreg_wbrd; // @[cpu.scala 30:22:@2989.4]
  wire [3:0] memc_io_mem_mode; // @[cpu.scala 30:22:@2989.4]
  wire  memc_io_mem_ready; // @[cpu.scala 30:22:@2989.4]
  wire [63:0] memc_io_mem_addr; // @[cpu.scala 30:22:@2989.4]
  wire [63:0] memc_io_mem_rdata; // @[cpu.scala 30:22:@2989.4]
  wire [63:0] memc_io_mem_wdata; // @[cpu.scala 30:22:@2989.4]
  wire  memc_io_excep_valid; // @[cpu.scala 30:22:@2989.4]
  wire [31:0] memc_io_excep_code; // @[cpu.scala 30:22:@2989.4]
  wire [31:0] memc_io_excep_value; // @[cpu.scala 30:22:@2989.4]
  wire [63:0] memc_io_excep_pc; // @[cpu.scala 30:22:@2989.4]
  wire  memc_io_excep_inst_valid; // @[cpu.scala 30:22:@2989.4]
  wire  memc_io_csr_wb_valid; // @[cpu.scala 30:22:@2989.4]
  wire [11:0] memc_io_csr_wb_csr_idx; // @[cpu.scala 30:22:@2989.4]
  wire [63:0] memc_io_csr_wb_csr_data; // @[cpu.scala 30:22:@2989.4]
  wire  memc_io_csr_wrCSROp_valid; // @[cpu.scala 30:22:@2989.4]
  wire [11:0] memc_io_csr_wrCSROp_csr_idx; // @[cpu.scala 30:22:@2989.4]
  wire [63:0] memc_io_csr_wrCSROp_csr_data; // @[cpu.scala 30:22:@2989.4]
  wire  memc_io_csr_excep_valid; // @[cpu.scala 30:22:@2989.4]
  wire [31:0] memc_io_csr_excep_code; // @[cpu.scala 30:22:@2989.4]
  wire [31:0] memc_io_csr_excep_value; // @[cpu.scala 30:22:@2989.4]
  wire [63:0] memc_io_csr_excep_pc; // @[cpu.scala 30:22:@2989.4]
  wire  memc_io_csr_excep_inst_valid; // @[cpu.scala 30:22:@2989.4]
  wire  memc_io_inter_valid; // @[cpu.scala 30:22:@2989.4]
  wire [31:0] memc_io_inter_bits; // @[cpu.scala 30:22:@2989.4]
  wire  wrbk_io_wreg_wbrv; // @[cpu.scala 31:22:@2992.4]
  wire [4:0] wrbk_io_wreg_wbri; // @[cpu.scala 31:22:@2992.4]
  wire [63:0] wrbk_io_wreg_wbrd; // @[cpu.scala 31:22:@2992.4]
  wire  wrbk_io_reg_wen; // @[cpu.scala 31:22:@2992.4]
  wire [4:0] wrbk_io_reg_w; // @[cpu.scala 31:22:@2992.4]
  wire [63:0] wrbk_io_reg_wd; // @[cpu.scala 31:22:@2992.4]
  wire  regc_clock; // @[cpu.scala 32:22:@2995.4]
  wire [4:0] regc_io_r_r1; // @[cpu.scala 32:22:@2995.4]
  wire [4:0] regc_io_r_r2; // @[cpu.scala 32:22:@2995.4]
  wire [63:0] regc_io_r_r1d; // @[cpu.scala 32:22:@2995.4]
  wire [63:0] regc_io_r_r2d; // @[cpu.scala 32:22:@2995.4]
  wire  regc_io_w_wen; // @[cpu.scala 32:22:@2995.4]
  wire [4:0] regc_io_w_w; // @[cpu.scala 32:22:@2995.4]
  wire [63:0] regc_io_w_wd; // @[cpu.scala 32:22:@2995.4]
  wire  regc_io_pass; // @[cpu.scala 32:22:@2995.4]
  wire  mmu_clock; // @[cpu.scala 33:22:@2998.4]
  wire  mmu_reset; // @[cpu.scala 33:22:@2998.4]
  wire [3:0] mmu_io_mem_mode; // @[cpu.scala 33:22:@2998.4]
  wire  mmu_io_mem_ready; // @[cpu.scala 33:22:@2998.4]
  wire [63:0] mmu_io_mem_addr; // @[cpu.scala 33:22:@2998.4]
  wire [63:0] mmu_io_mem_rdata; // @[cpu.scala 33:22:@2998.4]
  wire [63:0] mmu_io_mem_wdata; // @[cpu.scala 33:22:@2998.4]
  wire [3:0] mmu_io_insr_mode; // @[cpu.scala 33:22:@2998.4]
  wire  mmu_io_insr_ready; // @[cpu.scala 33:22:@2998.4]
  wire [63:0] mmu_io_insr_addr; // @[cpu.scala 33:22:@2998.4]
  wire [63:0] mmu_io_insr_rdata; // @[cpu.scala 33:22:@2998.4]
  wire  mmu_io_insr_rst; // @[cpu.scala 33:22:@2998.4]
  wire [63:0] mmu_io_csr_satp; // @[cpu.scala 33:22:@2998.4]
  wire [1:0] mmu_io_csr_priv; // @[cpu.scala 33:22:@2998.4]
  wire  mmu_io_csr_mxr; // @[cpu.scala 33:22:@2998.4]
  wire  mmu_io_csr_sum; // @[cpu.scala 33:22:@2998.4]
  wire [3:0] mmu_io_if_iom_mode; // @[cpu.scala 33:22:@2998.4]
  wire  mmu_io_if_iom_ready; // @[cpu.scala 33:22:@2998.4]
  wire [63:0] mmu_io_if_iom_addr; // @[cpu.scala 33:22:@2998.4]
  wire [63:0] mmu_io_if_iom_rdata; // @[cpu.scala 33:22:@2998.4]
  wire [3:0] mmu_io_mem_iom_mode; // @[cpu.scala 33:22:@2998.4]
  wire  mmu_io_mem_iom_ready; // @[cpu.scala 33:22:@2998.4]
  wire [63:0] mmu_io_mem_iom_addr; // @[cpu.scala 33:22:@2998.4]
  wire [63:0] mmu_io_mem_iom_rdata; // @[cpu.scala 33:22:@2998.4]
  wire [63:0] mmu_io_mem_iom_wdata; // @[cpu.scala 33:22:@2998.4]
  wire  iomn_clock; // @[cpu.scala 34:22:@3001.4]
  wire  iomn_reset; // @[cpu.scala 34:22:@3001.4]
  wire [3:0] iomn_io_mem_if_mode; // @[cpu.scala 34:22:@3001.4]
  wire  iomn_io_mem_if_ready; // @[cpu.scala 34:22:@3001.4]
  wire [63:0] iomn_io_mem_if_addr; // @[cpu.scala 34:22:@3001.4]
  wire [63:0] iomn_io_mem_if_rdata; // @[cpu.scala 34:22:@3001.4]
  wire [3:0] iomn_io_mem_mem_mode; // @[cpu.scala 34:22:@3001.4]
  wire  iomn_io_mem_mem_ready; // @[cpu.scala 34:22:@3001.4]
  wire [63:0] iomn_io_mem_mem_addr; // @[cpu.scala 34:22:@3001.4]
  wire [63:0] iomn_io_mem_mem_rdata; // @[cpu.scala 34:22:@3001.4]
  wire [63:0] iomn_io_mem_mem_wdata; // @[cpu.scala 34:22:@3001.4]
  wire [3:0] iomn_io_mem_out_mode; // @[cpu.scala 34:22:@3001.4]
  wire  iomn_io_mem_out_ready; // @[cpu.scala 34:22:@3001.4]
  wire [63:0] iomn_io_mem_out_addr; // @[cpu.scala 34:22:@3001.4]
  wire [63:0] iomn_io_mem_out_rdata; // @[cpu.scala 34:22:@3001.4]
  wire [63:0] iomn_io_mem_out_wdata; // @[cpu.scala 34:22:@3001.4]
  wire [3:0] iomn_io_serial_out_mode; // @[cpu.scala 34:22:@3001.4]
  wire  iomn_io_serial_out_ready; // @[cpu.scala 34:22:@3001.4]
  wire [63:0] iomn_io_serial_out_addr; // @[cpu.scala 34:22:@3001.4]
  wire [63:0] iomn_io_serial_out_rdata; // @[cpu.scala 34:22:@3001.4]
  wire [63:0] iomn_io_serial_out_wdata; // @[cpu.scala 34:22:@3001.4]
  wire [1:0] iomn_io_debug_if_wait; // @[cpu.scala 34:22:@3001.4]
  wire [1:0] iomn_io_debug_mem_wait; // @[cpu.scala 34:22:@3001.4]
  wire  iomn_io_debug_if_ready; // @[cpu.scala 34:22:@3001.4]
  wire  iomn_io_debug_mem_ready; // @[cpu.scala 34:22:@3001.4]
  wire [3:0] iomn_io_debug_if_mode; // @[cpu.scala 34:22:@3001.4]
  wire [3:0] iomn_io_debug_mem_mode; // @[cpu.scala 34:22:@3001.4]
  wire [63:0] iomn_io_debug_if_addr; // @[cpu.scala 34:22:@3001.4]
  wire [63:0] iomn_io_debug_mem_addr; // @[cpu.scala 34:22:@3001.4]
  wire  iomn_io_debug_if_error; // @[cpu.scala 34:22:@3001.4]
  wire  iomn_io_debug_mem_error; // @[cpu.scala 34:22:@3001.4]
  wire  if_id_clock; // @[cpu.scala 35:24:@3004.4]
  wire  if_id_reset; // @[cpu.scala 35:24:@3004.4]
  wire  if_id_io_en; // @[cpu.scala 35:24:@3004.4]
  wire  if_id_io_pass; // @[cpu.scala 35:24:@3004.4]
  wire  if_id_io_flush; // @[cpu.scala 35:24:@3004.4]
  wire [31:0] if_id_io_insi; // @[cpu.scala 35:24:@3004.4]
  wire [63:0] if_id_io_pci; // @[cpu.scala 35:24:@3004.4]
  wire [63:0] if_id_io_insci; // @[cpu.scala 35:24:@3004.4]
  wire [63:0] if_id_io_icdi; // @[cpu.scala 35:24:@3004.4]
  wire  if_id_io_lastloadin_valid; // @[cpu.scala 35:24:@3004.4]
  wire [4:0] if_id_io_lastloadin_index; // @[cpu.scala 35:24:@3004.4]
  wire [63:0] if_id_io_excep_i_pc; // @[cpu.scala 35:24:@3004.4]
  wire  if_id_io_excep_i_inst_valid; // @[cpu.scala 35:24:@3004.4]
  wire [31:0] if_id_io_inso; // @[cpu.scala 35:24:@3004.4]
  wire [63:0] if_id_io_pco; // @[cpu.scala 35:24:@3004.4]
  wire [63:0] if_id_io_insco; // @[cpu.scala 35:24:@3004.4]
  wire [63:0] if_id_io_icdo; // @[cpu.scala 35:24:@3004.4]
  wire  if_id_io_lastloadout_valid; // @[cpu.scala 35:24:@3004.4]
  wire [4:0] if_id_io_lastloadout_index; // @[cpu.scala 35:24:@3004.4]
  wire  if_id_io_excep_o_valid; // @[cpu.scala 35:24:@3004.4]
  wire [31:0] if_id_io_excep_o_code; // @[cpu.scala 35:24:@3004.4]
  wire [31:0] if_id_io_excep_o_value; // @[cpu.scala 35:24:@3004.4]
  wire [63:0] if_id_io_excep_o_pc; // @[cpu.scala 35:24:@3004.4]
  wire  if_id_io_excep_o_inst_valid; // @[cpu.scala 35:24:@3004.4]
  wire  id_ex_clock; // @[cpu.scala 36:24:@3007.4]
  wire  id_ex_reset; // @[cpu.scala 36:24:@3007.4]
  wire  id_ex_io_en; // @[cpu.scala 36:24:@3007.4]
  wire  id_ex_io_bid; // @[cpu.scala 36:24:@3007.4]
  wire  id_ex_io_bex; // @[cpu.scala 36:24:@3007.4]
  wire  id_ex_io_flush; // @[cpu.scala 36:24:@3007.4]
  wire  id_ex_io_pass; // @[cpu.scala 36:24:@3007.4]
  wire [63:0] id_ex_io_immi; // @[cpu.scala 36:24:@3007.4]
  wire [3:0] id_ex_io_ALUOpi; // @[cpu.scala 36:24:@3007.4]
  wire [3:0] id_ex_io_exeti; // @[cpu.scala 36:24:@3007.4]
  wire [63:0] id_ex_io_pci; // @[cpu.scala 36:24:@3007.4]
  wire [3:0] id_ex_io_lsmi; // @[cpu.scala 36:24:@3007.4]
  wire  id_ex_io_op32i; // @[cpu.scala 36:24:@3007.4]
  wire  id_ex_io_csr_wb_i_valid; // @[cpu.scala 36:24:@3007.4]
  wire [11:0] id_ex_io_csr_wb_i_csr_idx; // @[cpu.scala 36:24:@3007.4]
  wire [63:0] id_ex_io_csr_wb_i_csr_data; // @[cpu.scala 36:24:@3007.4]
  wire  id_ex_io_dregi_rs2_valid; // @[cpu.scala 36:24:@3007.4]
  wire [63:0] id_ex_io_dregi_rs1_value; // @[cpu.scala 36:24:@3007.4]
  wire [63:0] id_ex_io_dregi_rs2_value; // @[cpu.scala 36:24:@3007.4]
  wire  id_ex_io_dregi_rd_valid; // @[cpu.scala 36:24:@3007.4]
  wire [4:0] id_ex_io_dregi_rd_index; // @[cpu.scala 36:24:@3007.4]
  wire  id_ex_io_excep_i_valid; // @[cpu.scala 36:24:@3007.4]
  wire [31:0] id_ex_io_excep_i_code; // @[cpu.scala 36:24:@3007.4]
  wire [31:0] id_ex_io_excep_i_value; // @[cpu.scala 36:24:@3007.4]
  wire [63:0] id_ex_io_excep_i_pc; // @[cpu.scala 36:24:@3007.4]
  wire  id_ex_io_excep_i_inst_valid; // @[cpu.scala 36:24:@3007.4]
  wire [63:0] id_ex_io_immo; // @[cpu.scala 36:24:@3007.4]
  wire [3:0] id_ex_io_ALUOpo; // @[cpu.scala 36:24:@3007.4]
  wire [3:0] id_ex_io_exeto; // @[cpu.scala 36:24:@3007.4]
  wire [63:0] id_ex_io_pco; // @[cpu.scala 36:24:@3007.4]
  wire [3:0] id_ex_io_lsmo; // @[cpu.scala 36:24:@3007.4]
  wire  id_ex_io_op32o; // @[cpu.scala 36:24:@3007.4]
  wire  id_ex_io_csr_wb_o_valid; // @[cpu.scala 36:24:@3007.4]
  wire [11:0] id_ex_io_csr_wb_o_csr_idx; // @[cpu.scala 36:24:@3007.4]
  wire [63:0] id_ex_io_csr_wb_o_csr_data; // @[cpu.scala 36:24:@3007.4]
  wire  id_ex_io_drego_rs2_valid; // @[cpu.scala 36:24:@3007.4]
  wire [63:0] id_ex_io_drego_rs1_value; // @[cpu.scala 36:24:@3007.4]
  wire [63:0] id_ex_io_drego_rs2_value; // @[cpu.scala 36:24:@3007.4]
  wire  id_ex_io_drego_rd_valid; // @[cpu.scala 36:24:@3007.4]
  wire [4:0] id_ex_io_drego_rd_index; // @[cpu.scala 36:24:@3007.4]
  wire  id_ex_io_excep_o_valid; // @[cpu.scala 36:24:@3007.4]
  wire [31:0] id_ex_io_excep_o_code; // @[cpu.scala 36:24:@3007.4]
  wire [31:0] id_ex_io_excep_o_value; // @[cpu.scala 36:24:@3007.4]
  wire [63:0] id_ex_io_excep_o_pc; // @[cpu.scala 36:24:@3007.4]
  wire  id_ex_io_excep_o_inst_valid; // @[cpu.scala 36:24:@3007.4]
  wire  ex_mem_clock; // @[cpu.scala 37:24:@3010.4]
  wire  ex_mem_reset; // @[cpu.scala 37:24:@3010.4]
  wire  ex_mem_io_en; // @[cpu.scala 37:24:@3010.4]
  wire  ex_mem_io_pass; // @[cpu.scala 37:24:@3010.4]
  wire  ex_mem_io_flush; // @[cpu.scala 37:24:@3010.4]
  wire  ex_mem_io_nlsi; // @[cpu.scala 37:24:@3010.4]
  wire [3:0] ex_mem_io_lsmi; // @[cpu.scala 37:24:@3010.4]
  wire [63:0] ex_mem_io_addri; // @[cpu.scala 37:24:@3010.4]
  wire [63:0] ex_mem_io_datai; // @[cpu.scala 37:24:@3010.4]
  wire  ex_mem_io_wregi_wbrv; // @[cpu.scala 37:24:@3010.4]
  wire [4:0] ex_mem_io_wregi_wbri; // @[cpu.scala 37:24:@3010.4]
  wire [63:0] ex_mem_io_wregi_wbrd; // @[cpu.scala 37:24:@3010.4]
  wire  ex_mem_io_csr_wb_i_valid; // @[cpu.scala 37:24:@3010.4]
  wire [11:0] ex_mem_io_csr_wb_i_csr_idx; // @[cpu.scala 37:24:@3010.4]
  wire [63:0] ex_mem_io_csr_wb_i_csr_data; // @[cpu.scala 37:24:@3010.4]
  wire  ex_mem_io_excep_i_valid; // @[cpu.scala 37:24:@3010.4]
  wire [31:0] ex_mem_io_excep_i_code; // @[cpu.scala 37:24:@3010.4]
  wire [31:0] ex_mem_io_excep_i_value; // @[cpu.scala 37:24:@3010.4]
  wire [63:0] ex_mem_io_excep_i_pc; // @[cpu.scala 37:24:@3010.4]
  wire  ex_mem_io_excep_i_inst_valid; // @[cpu.scala 37:24:@3010.4]
  wire  ex_mem_io_inter_i_valid; // @[cpu.scala 37:24:@3010.4]
  wire [31:0] ex_mem_io_inter_i_bits; // @[cpu.scala 37:24:@3010.4]
  wire  ex_mem_io_nlso; // @[cpu.scala 37:24:@3010.4]
  wire [3:0] ex_mem_io_lsmo; // @[cpu.scala 37:24:@3010.4]
  wire [63:0] ex_mem_io_addro; // @[cpu.scala 37:24:@3010.4]
  wire [63:0] ex_mem_io_datao; // @[cpu.scala 37:24:@3010.4]
  wire  ex_mem_io_wrego_wbrv; // @[cpu.scala 37:24:@3010.4]
  wire [4:0] ex_mem_io_wrego_wbri; // @[cpu.scala 37:24:@3010.4]
  wire [63:0] ex_mem_io_wrego_wbrd; // @[cpu.scala 37:24:@3010.4]
  wire  ex_mem_io_csr_wb_o_valid; // @[cpu.scala 37:24:@3010.4]
  wire [11:0] ex_mem_io_csr_wb_o_csr_idx; // @[cpu.scala 37:24:@3010.4]
  wire [63:0] ex_mem_io_csr_wb_o_csr_data; // @[cpu.scala 37:24:@3010.4]
  wire  ex_mem_io_excep_o_valid; // @[cpu.scala 37:24:@3010.4]
  wire [31:0] ex_mem_io_excep_o_code; // @[cpu.scala 37:24:@3010.4]
  wire [31:0] ex_mem_io_excep_o_value; // @[cpu.scala 37:24:@3010.4]
  wire [63:0] ex_mem_io_excep_o_pc; // @[cpu.scala 37:24:@3010.4]
  wire  ex_mem_io_excep_o_inst_valid; // @[cpu.scala 37:24:@3010.4]
  wire  ex_mem_io_inter_o_valid; // @[cpu.scala 37:24:@3010.4]
  wire [31:0] ex_mem_io_inter_o_bits; // @[cpu.scala 37:24:@3010.4]
  wire  mem_wb_clock; // @[cpu.scala 38:24:@3013.4]
  wire  mem_wb_reset; // @[cpu.scala 38:24:@3013.4]
  wire  mem_wb_io_en; // @[cpu.scala 38:24:@3013.4]
  wire  mem_wb_io_pass; // @[cpu.scala 38:24:@3013.4]
  wire  mem_wb_io_wregi_wbrv; // @[cpu.scala 38:24:@3013.4]
  wire [4:0] mem_wb_io_wregi_wbri; // @[cpu.scala 38:24:@3013.4]
  wire [63:0] mem_wb_io_wregi_wbrd; // @[cpu.scala 38:24:@3013.4]
  wire  mem_wb_io_wrego_wbrv; // @[cpu.scala 38:24:@3013.4]
  wire [4:0] mem_wb_io_wrego_wbri; // @[cpu.scala 38:24:@3013.4]
  wire [63:0] mem_wb_io_wrego_wbrd; // @[cpu.scala 38:24:@3013.4]
  wire  csr_clock; // @[cpu.scala 39:24:@3016.4]
  wire  csr_reset; // @[cpu.scala 39:24:@3016.4]
  wire [11:0] csr_io_id_addr; // @[cpu.scala 39:24:@3016.4]
  wire [63:0] csr_io_id_rdata; // @[cpu.scala 39:24:@3016.4]
  wire [1:0] csr_io_id_priv; // @[cpu.scala 39:24:@3016.4]
  wire  csr_io_mem_wrCSROp_valid; // @[cpu.scala 39:24:@3016.4]
  wire [11:0] csr_io_mem_wrCSROp_csr_idx; // @[cpu.scala 39:24:@3016.4]
  wire [63:0] csr_io_mem_wrCSROp_csr_data; // @[cpu.scala 39:24:@3016.4]
  wire  csr_io_mem_excep_valid; // @[cpu.scala 39:24:@3016.4]
  wire [31:0] csr_io_mem_excep_code; // @[cpu.scala 39:24:@3016.4]
  wire [31:0] csr_io_mem_excep_value; // @[cpu.scala 39:24:@3016.4]
  wire [63:0] csr_io_mem_excep_pc; // @[cpu.scala 39:24:@3016.4]
  wire  csr_io_mem_excep_inst_valid; // @[cpu.scala 39:24:@3016.4]
  wire [63:0] csr_io_mmu_satp; // @[cpu.scala 39:24:@3016.4]
  wire [1:0] csr_io_mmu_priv; // @[cpu.scala 39:24:@3016.4]
  wire  csr_io_mmu_mxr; // @[cpu.scala 39:24:@3016.4]
  wire  csr_io_mmu_sum; // @[cpu.scala 39:24:@3016.4]
  wire  csr_io_flush; // @[cpu.scala 39:24:@3016.4]
  wire [63:0] csr_io_csrNewPc; // @[cpu.scala 39:24:@3016.4]
  wire  csr_io_inter_valid; // @[cpu.scala 39:24:@3016.4]
  wire [31:0] csr_io_inter_bits; // @[cpu.scala 39:24:@3016.4]
  InsReader insr ( // @[cpu.scala 27:22:@2980.4]
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
  Decoder insd ( // @[cpu.scala 28:22:@2983.4]
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
  Execute exec ( // @[cpu.scala 29:22:@2986.4]
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
  MemoryCtrl memc ( // @[cpu.scala 30:22:@2989.4]
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
  WriteBack wrbk ( // @[cpu.scala 31:22:@2992.4]
    .io_wreg_wbrv(wrbk_io_wreg_wbrv),
    .io_wreg_wbri(wrbk_io_wreg_wbri),
    .io_wreg_wbrd(wrbk_io_wreg_wbrd),
    .io_reg_wen(wrbk_io_reg_wen),
    .io_reg_w(wrbk_io_reg_w),
    .io_reg_wd(wrbk_io_reg_wd)
  );
  RegCtrl regc ( // @[cpu.scala 32:22:@2995.4]
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
  MMU mmu ( // @[cpu.scala 33:22:@2998.4]
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
  IOManager iomn ( // @[cpu.scala 34:22:@3001.4]
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
  IF_ID if_id ( // @[cpu.scala 35:24:@3004.4]
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
  ID_EX id_ex ( // @[cpu.scala 36:24:@3007.4]
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
  EX_MEM ex_mem ( // @[cpu.scala 37:24:@3010.4]
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
  MEM_WB mem_wb ( // @[cpu.scala 38:24:@3013.4]
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
  CSR csr ( // @[cpu.scala 39:24:@3016.4]
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
  assign io_debug_pc = if_id_io_pco; // @[cpu.scala 42:20:@3019.4]
  assign io_debug_ins = if_id_io_inso; // @[cpu.scala 43:20:@3020.4]
  assign io_debug_if_wait = iomn_io_debug_if_wait; // @[cpu.scala 44:22:@3021.4]
  assign io_debug_mem_wait = iomn_io_debug_mem_wait; // @[cpu.scala 48:33:@3025.4]
  assign io_debug_if_ready = iomn_io_debug_if_ready; // @[cpu.scala 45:33:@3022.4]
  assign io_debug_mem_ready = iomn_io_debug_mem_ready; // @[cpu.scala 49:34:@3026.4]
  assign io_debug_if_mode = iomn_io_debug_if_mode; // @[cpu.scala 46:31:@3023.4]
  assign io_debug_mem_mode = iomn_io_debug_mem_mode; // @[cpu.scala 50:32:@3027.4]
  assign io_debug_if_addr = iomn_io_debug_if_addr; // @[cpu.scala 47:31:@3024.4]
  assign io_debug_mem_addr = iomn_io_debug_mem_addr; // @[cpu.scala 51:32:@3028.4]
  assign io_debug_if_error = iomn_io_debug_if_error; // @[cpu.scala 52:32:@3029.4]
  assign io_debug_mem_error = iomn_io_debug_mem_error; // @[cpu.scala 53:33:@3030.4]
  assign io_mem_mode = iomn_io_mem_out_mode; // @[cpu.scala 61:20:@3058.4]
  assign io_mem_addr = iomn_io_mem_out_addr; // @[cpu.scala 61:20:@3056.4]
  assign io_mem_wdata = iomn_io_mem_out_wdata; // @[cpu.scala 61:20:@3054.4]
  assign io_serial_mode = iomn_io_serial_out_mode; // @[cpu.scala 62:20:@3063.4]
  assign io_serial_addr = iomn_io_serial_out_addr; // @[cpu.scala 62:20:@3061.4]
  assign io_serial_wdata = iomn_io_serial_out_wdata; // @[cpu.scala 62:20:@3059.4]
  assign insr_io_jump = csr_io_flush | exec_io_jump; // @[cpu.scala 75:20:@3083.4]
  assign insr_io_jdest = csr_io_flush ? csr_io_csrNewPc : exec_io_jdest; // @[cpu.scala 76:20:@3085.4]
  assign insr_io_nls = ex_mem_io_nlso; // @[cpu.scala 77:20:@3086.4]
  assign insr_io_lpc = if_id_io_pco; // @[cpu.scala 96:20:@3105.4]
  assign insr_io_insp = if_id_io_insco; // @[cpu.scala 98:20:@3107.4]
  assign insr_io_inspd = if_id_io_icdo; // @[cpu.scala 99:20:@3108.4]
  assign insr_io_bubble = insd_io_bubble; // @[cpu.scala 78:20:@3087.4]
  assign insr_io_mmu_ready = mmu_io_insr_ready; // @[cpu.scala 56:20:@3035.4]
  assign insr_io_mmu_rdata = mmu_io_insr_rdata; // @[cpu.scala 56:20:@3033.4]
  assign insd_io_ins = if_id_io_inso; // @[cpu.scala 97:20:@3106.4]
  assign insd_io_lastload_valid = if_id_io_lastloadout_valid; // @[cpu.scala 100:26:@3110.4]
  assign insd_io_lastload_index = if_id_io_lastloadout_index; // @[cpu.scala 100:26:@3109.4]
  assign insd_io_regr_r1d = regc_io_r_r1d; // @[cpu.scala 67:19:@3070.4]
  assign insd_io_regr_r2d = regc_io_r_r2d; // @[cpu.scala 67:19:@3069.4]
  assign insd_io_csr_rdata = csr_io_id_rdata; // @[cpu.scala 157:21:@3207.4]
  assign insd_io_csr_priv = csr_io_id_priv; // @[cpu.scala 157:21:@3206.4]
  assign insd_io_csr_from_ex_valid = exec_io_wcsr_valid; // @[cpu.scala 153:25:@3202.4]
  assign insd_io_csr_from_ex_csr_idx = exec_io_wcsr_csr_idx; // @[cpu.scala 153:25:@3201.4]
  assign insd_io_csr_from_ex_csr_data = exec_io_wcsr_csr_data; // @[cpu.scala 153:25:@3200.4]
  assign insd_io_csr_from_mem_valid = ex_mem_io_csr_wb_o_valid; // @[cpu.scala 154:26:@3205.4]
  assign insd_io_csr_from_mem_csr_idx = ex_mem_io_csr_wb_o_csr_idx; // @[cpu.scala 154:26:@3204.4]
  assign insd_io_csr_from_mem_csr_data = ex_mem_io_csr_wb_o_csr_data; // @[cpu.scala 154:26:@3203.4]
  assign insd_io_exWrReg_wbrv = exec_io_wreg_wbrv; // @[cpu.scala 71:22:@3078.4]
  assign insd_io_exWrReg_wbri = exec_io_wreg_wbri; // @[cpu.scala 71:22:@3077.4]
  assign insd_io_exWrReg_wbrd = exec_io_wreg_wbrd; // @[cpu.scala 71:22:@3076.4]
  assign insd_io_memWrReg_wbrv = memc_io_wreg_wbrv; // @[cpu.scala 72:22:@3081.4]
  assign insd_io_memWrReg_wbri = memc_io_wreg_wbri; // @[cpu.scala 72:22:@3080.4]
  assign insd_io_memWrReg_wbrd = memc_io_wreg_wbrd; // @[cpu.scala 72:22:@3079.4]
  assign insd_io_if_excep_valid = if_id_io_excep_o_valid; // @[cpu.scala 101:26:@3115.4]
  assign insd_io_if_excep_code = if_id_io_excep_o_code; // @[cpu.scala 101:26:@3114.4]
  assign insd_io_if_excep_value = if_id_io_excep_o_value; // @[cpu.scala 101:26:@3113.4]
  assign insd_io_if_excep_pc = if_id_io_excep_o_pc; // @[cpu.scala 101:26:@3112.4]
  assign insd_io_if_excep_inst_valid = if_id_io_excep_o_inst_valid; // @[cpu.scala 101:26:@3111.4]
  assign exec_io_imm = id_ex_io_immo; // @[cpu.scala 118:21:@3139.4]
  assign exec_io_ALUOp = id_ex_io_ALUOpo; // @[cpu.scala 119:21:@3140.4]
  assign exec_io_pc = id_ex_io_pco; // @[cpu.scala 121:21:@3142.4]
  assign exec_io_exe_type = id_ex_io_exeto; // @[cpu.scala 120:21:@3141.4]
  assign exec_io_op32 = id_ex_io_op32o; // @[cpu.scala 123:21:@3149.4]
  assign exec_io_dreg_rs2_valid = id_ex_io_drego_rs2_valid; // @[cpu.scala 122:21:@3147.4]
  assign exec_io_dreg_rs1_value = id_ex_io_drego_rs1_value; // @[cpu.scala 122:21:@3146.4]
  assign exec_io_dreg_rs2_value = id_ex_io_drego_rs2_value; // @[cpu.scala 122:21:@3145.4]
  assign exec_io_dreg_rd_valid = id_ex_io_drego_rd_valid; // @[cpu.scala 122:21:@3144.4]
  assign exec_io_dreg_rd_index = id_ex_io_drego_rd_index; // @[cpu.scala 122:21:@3143.4]
  assign exec_io_csr_op_valid = id_ex_io_csr_wb_o_valid; // @[cpu.scala 124:24:@3152.4]
  assign exec_io_csr_op_csr_idx = id_ex_io_csr_wb_o_csr_idx; // @[cpu.scala 124:24:@3151.4]
  assign exec_io_csr_op_csr_data = id_ex_io_csr_wb_o_csr_data; // @[cpu.scala 124:24:@3150.4]
  assign exec_io_id_excep_valid = id_ex_io_excep_o_valid; // @[cpu.scala 125:24:@3157.4]
  assign exec_io_id_excep_code = id_ex_io_excep_o_code; // @[cpu.scala 125:24:@3156.4]
  assign exec_io_id_excep_value = id_ex_io_excep_o_value; // @[cpu.scala 125:24:@3155.4]
  assign exec_io_id_excep_pc = id_ex_io_excep_o_pc; // @[cpu.scala 125:24:@3154.4]
  assign exec_io_id_excep_inst_valid = id_ex_io_excep_o_inst_valid; // @[cpu.scala 125:24:@3153.4]
  assign memc_io_nls = ex_mem_io_nlso; // @[cpu.scala 138:21:@3176.4]
  assign memc_io_lsm = ex_mem_io_lsmo; // @[cpu.scala 140:21:@3180.4]
  assign memc_io_addr = ex_mem_io_addro; // @[cpu.scala 141:21:@3181.4]
  assign memc_io_data = ex_mem_io_datao; // @[cpu.scala 142:21:@3182.4]
  assign memc_io_ereg_wbrv = ex_mem_io_wrego_wbrv; // @[cpu.scala 139:21:@3179.4]
  assign memc_io_ereg_wbri = ex_mem_io_wrego_wbri; // @[cpu.scala 139:21:@3178.4]
  assign memc_io_ereg_wbrd = ex_mem_io_wrego_wbrd; // @[cpu.scala 139:21:@3177.4]
  assign memc_io_mem_ready = mmu_io_mem_ready; // @[cpu.scala 59:20:@3047.4]
  assign memc_io_mem_rdata = mmu_io_mem_rdata; // @[cpu.scala 59:20:@3045.4]
  assign memc_io_excep_valid = ex_mem_io_excep_o_valid; // @[cpu.scala 144:24:@3190.4]
  assign memc_io_excep_code = ex_mem_io_excep_o_code; // @[cpu.scala 144:24:@3189.4]
  assign memc_io_excep_value = ex_mem_io_excep_o_value; // @[cpu.scala 144:24:@3188.4]
  assign memc_io_excep_pc = ex_mem_io_excep_o_pc; // @[cpu.scala 144:24:@3187.4]
  assign memc_io_excep_inst_valid = ex_mem_io_excep_o_inst_valid; // @[cpu.scala 144:24:@3186.4]
  assign memc_io_csr_wb_valid = ex_mem_io_csr_wb_o_valid; // @[cpu.scala 143:24:@3185.4]
  assign memc_io_csr_wb_csr_idx = ex_mem_io_csr_wb_o_csr_idx; // @[cpu.scala 143:24:@3184.4]
  assign memc_io_csr_wb_csr_data = ex_mem_io_csr_wb_o_csr_data; // @[cpu.scala 143:24:@3183.4]
  assign memc_io_inter_valid = ex_mem_io_inter_o_valid; // @[cpu.scala 145:24:@3192.4]
  assign memc_io_inter_bits = ex_mem_io_inter_o_bits; // @[cpu.scala 145:24:@3191.4]
  assign wrbk_io_wreg_wbrv = mem_wb_io_wrego_wbrv; // @[cpu.scala 150:21:@3199.4]
  assign wrbk_io_wreg_wbri = mem_wb_io_wrego_wbri; // @[cpu.scala 150:21:@3198.4]
  assign wrbk_io_wreg_wbrd = mem_wb_io_wrego_wbrd; // @[cpu.scala 150:21:@3197.4]
  assign regc_clock = clock; // @[:@2996.4]
  assign regc_io_r_r1 = insd_io_regr_r1; // @[cpu.scala 67:19:@3072.4]
  assign regc_io_r_r2 = insd_io_regr_r2; // @[cpu.scala 67:19:@3071.4]
  assign regc_io_w_wen = wrbk_io_reg_wen; // @[cpu.scala 68:19:@3075.4]
  assign regc_io_w_w = wrbk_io_reg_w; // @[cpu.scala 68:19:@3074.4]
  assign regc_io_w_wd = wrbk_io_reg_wd; // @[cpu.scala 68:19:@3073.4]
  assign regc_io_pass = memc_io_ready; // @[cpu.scala 85:20:@3092.4]
  assign mmu_clock = clock; // @[:@2999.4]
  assign mmu_reset = reset; // @[:@3000.4]
  assign mmu_io_mem_mode = memc_io_mem_mode; // @[cpu.scala 59:20:@3048.4]
  assign mmu_io_mem_addr = memc_io_mem_addr; // @[cpu.scala 59:20:@3046.4]
  assign mmu_io_mem_wdata = memc_io_mem_wdata; // @[cpu.scala 59:20:@3044.4]
  assign mmu_io_insr_mode = insr_io_mmu_mode; // @[cpu.scala 56:20:@3036.4]
  assign mmu_io_insr_addr = insr_io_mmu_addr; // @[cpu.scala 56:20:@3034.4]
  assign mmu_io_insr_rst = insr_io_mmu_if_rst; // @[cpu.scala 57:25:@3037.4]
  assign mmu_io_csr_satp = csr_io_mmu_satp; // @[cpu.scala 63:20:@3067.4]
  assign mmu_io_csr_priv = csr_io_mmu_priv; // @[cpu.scala 63:20:@3066.4]
  assign mmu_io_csr_mxr = csr_io_mmu_mxr; // @[cpu.scala 63:20:@3065.4]
  assign mmu_io_csr_sum = csr_io_mmu_sum; // @[cpu.scala 63:20:@3064.4]
  assign mmu_io_if_iom_ready = iomn_io_mem_if_ready; // @[cpu.scala 58:20:@3041.4]
  assign mmu_io_if_iom_rdata = iomn_io_mem_if_rdata; // @[cpu.scala 58:20:@3039.4]
  assign mmu_io_mem_iom_ready = iomn_io_mem_mem_ready; // @[cpu.scala 60:20:@3052.4]
  assign mmu_io_mem_iom_rdata = iomn_io_mem_mem_rdata; // @[cpu.scala 60:20:@3050.4]
  assign iomn_clock = clock; // @[:@3002.4]
  assign iomn_reset = reset; // @[:@3003.4]
  assign iomn_io_mem_if_mode = mmu_io_if_iom_mode; // @[cpu.scala 58:20:@3042.4]
  assign iomn_io_mem_if_addr = mmu_io_if_iom_addr; // @[cpu.scala 58:20:@3040.4]
  assign iomn_io_mem_mem_mode = mmu_io_mem_iom_mode; // @[cpu.scala 60:20:@3053.4]
  assign iomn_io_mem_mem_addr = mmu_io_mem_iom_addr; // @[cpu.scala 60:20:@3051.4]
  assign iomn_io_mem_mem_wdata = mmu_io_mem_iom_wdata; // @[cpu.scala 60:20:@3049.4]
  assign iomn_io_mem_out_ready = io_mem_ready; // @[cpu.scala 61:20:@3057.4]
  assign iomn_io_mem_out_rdata = io_mem_rdata; // @[cpu.scala 61:20:@3055.4]
  assign iomn_io_serial_out_ready = io_serial_ready; // @[cpu.scala 62:20:@3062.4]
  assign iomn_io_serial_out_rdata = io_serial_rdata; // @[cpu.scala 62:20:@3060.4]
  assign if_id_clock = clock; // @[:@3005.4]
  assign if_id_reset = reset; // @[:@3006.4]
  assign if_id_io_en = io_en; // @[cpu.scala 88:20:@3093.4]
  assign if_id_io_pass = memc_io_ready; // @[cpu.scala 81:20:@3088.4]
  assign if_id_io_flush = csr_io_flush; // @[cpu.scala 163:21:@3219.4]
  assign if_id_io_insi = insr_io_ins; // @[cpu.scala 91:20:@3096.4]
  assign if_id_io_pci = insr_io_pc; // @[cpu.scala 92:20:@3097.4]
  assign if_id_io_insci = insr_io_insn; // @[cpu.scala 89:20:@3094.4]
  assign if_id_io_icdi = insr_io_insnd; // @[cpu.scala 90:20:@3095.4]
  assign if_id_io_lastloadin_valid = insd_io_loadinfo_valid; // @[cpu.scala 93:25:@3099.4]
  assign if_id_io_lastloadin_index = insd_io_loadinfo_index; // @[cpu.scala 93:25:@3098.4]
  assign if_id_io_excep_i_pc = insr_io_excep_pc; // @[cpu.scala 94:25:@3101.4]
  assign if_id_io_excep_i_inst_valid = insr_io_excep_inst_valid; // @[cpu.scala 94:25:@3100.4]
  assign id_ex_clock = clock; // @[:@3008.4]
  assign id_ex_reset = reset; // @[:@3009.4]
  assign id_ex_io_en = io_en; // @[cpu.scala 104:21:@3116.4]
  assign id_ex_io_bid = insd_io_bubble; // @[cpu.scala 105:21:@3117.4]
  assign id_ex_io_bex = exec_io_jump; // @[cpu.scala 106:21:@3118.4]
  assign id_ex_io_flush = csr_io_flush; // @[cpu.scala 164:21:@3220.4]
  assign id_ex_io_pass = memc_io_ready; // @[cpu.scala 82:20:@3089.4]
  assign id_ex_io_immi = insd_io_imm; // @[cpu.scala 108:21:@3119.4]
  assign id_ex_io_ALUOpi = insd_io_ALUOp; // @[cpu.scala 109:21:@3120.4]
  assign id_ex_io_exeti = insd_io_exe_type; // @[cpu.scala 110:21:@3121.4]
  assign id_ex_io_pci = if_id_io_pco; // @[cpu.scala 111:21:@3122.4]
  assign id_ex_io_lsmi = insd_io_ls_mode; // @[cpu.scala 113:21:@3129.4]
  assign id_ex_io_op32i = insd_io_op32; // @[cpu.scala 114:21:@3130.4]
  assign id_ex_io_csr_wb_i_valid = insd_io_csr_content_valid; // @[cpu.scala 115:24:@3133.4]
  assign id_ex_io_csr_wb_i_csr_idx = insd_io_csr_content_csr_idx; // @[cpu.scala 115:24:@3132.4]
  assign id_ex_io_csr_wb_i_csr_data = insd_io_csr_content_csr_data; // @[cpu.scala 115:24:@3131.4]
  assign id_ex_io_dregi_rs2_valid = insd_io_dreg_rs2_valid; // @[cpu.scala 112:21:@3127.4]
  assign id_ex_io_dregi_rs1_value = insd_io_dreg_rs1_value; // @[cpu.scala 112:21:@3126.4]
  assign id_ex_io_dregi_rs2_value = insd_io_dreg_rs2_value; // @[cpu.scala 112:21:@3125.4]
  assign id_ex_io_dregi_rd_valid = insd_io_dreg_rd_valid; // @[cpu.scala 112:21:@3124.4]
  assign id_ex_io_dregi_rd_index = insd_io_dreg_rd_index; // @[cpu.scala 112:21:@3123.4]
  assign id_ex_io_excep_i_valid = insd_io_ex_excep_valid; // @[cpu.scala 116:24:@3138.4]
  assign id_ex_io_excep_i_code = insd_io_ex_excep_code; // @[cpu.scala 116:24:@3137.4]
  assign id_ex_io_excep_i_value = insd_io_ex_excep_value; // @[cpu.scala 116:24:@3136.4]
  assign id_ex_io_excep_i_pc = insd_io_ex_excep_pc; // @[cpu.scala 116:24:@3135.4]
  assign id_ex_io_excep_i_inst_valid = insd_io_ex_excep_inst_valid; // @[cpu.scala 116:24:@3134.4]
  assign ex_mem_clock = clock; // @[:@3011.4]
  assign ex_mem_reset = reset; // @[:@3012.4]
  assign ex_mem_io_en = io_en; // @[cpu.scala 128:21:@3158.4]
  assign ex_mem_io_pass = memc_io_ready; // @[cpu.scala 83:20:@3090.4]
  assign ex_mem_io_flush = csr_io_flush; // @[cpu.scala 165:21:@3221.4]
  assign ex_mem_io_nlsi = exec_io_nls; // @[cpu.scala 130:21:@3160.4]
  assign ex_mem_io_lsmi = id_ex_io_lsmo; // @[cpu.scala 129:21:@3159.4]
  assign ex_mem_io_addri = exec_io_addr; // @[cpu.scala 132:21:@3164.4]
  assign ex_mem_io_datai = exec_io_data; // @[cpu.scala 133:21:@3165.4]
  assign ex_mem_io_wregi_wbrv = exec_io_wreg_wbrv; // @[cpu.scala 131:21:@3163.4]
  assign ex_mem_io_wregi_wbri = exec_io_wreg_wbri; // @[cpu.scala 131:21:@3162.4]
  assign ex_mem_io_wregi_wbrd = exec_io_wreg_wbrd; // @[cpu.scala 131:21:@3161.4]
  assign ex_mem_io_csr_wb_i_valid = exec_io_wcsr_valid; // @[cpu.scala 134:24:@3168.4]
  assign ex_mem_io_csr_wb_i_csr_idx = exec_io_wcsr_csr_idx; // @[cpu.scala 134:24:@3167.4]
  assign ex_mem_io_csr_wb_i_csr_data = exec_io_wcsr_csr_data; // @[cpu.scala 134:24:@3166.4]
  assign ex_mem_io_excep_i_valid = exec_io_mem_excep_valid; // @[cpu.scala 135:24:@3173.4]
  assign ex_mem_io_excep_i_code = exec_io_mem_excep_code; // @[cpu.scala 135:24:@3172.4]
  assign ex_mem_io_excep_i_value = exec_io_mem_excep_value; // @[cpu.scala 135:24:@3171.4]
  assign ex_mem_io_excep_i_pc = exec_io_mem_excep_pc; // @[cpu.scala 135:24:@3170.4]
  assign ex_mem_io_excep_i_inst_valid = exec_io_mem_excep_inst_valid; // @[cpu.scala 135:24:@3169.4]
  assign ex_mem_io_inter_i_valid = csr_io_inter_valid; // @[cpu.scala 136:24:@3175.4]
  assign ex_mem_io_inter_i_bits = csr_io_inter_bits; // @[cpu.scala 136:24:@3174.4]
  assign mem_wb_clock = clock; // @[:@3014.4]
  assign mem_wb_reset = reset; // @[:@3015.4]
  assign mem_wb_io_en = io_en; // @[cpu.scala 148:21:@3193.4]
  assign mem_wb_io_pass = memc_io_ready; // @[cpu.scala 84:20:@3091.4]
  assign mem_wb_io_wregi_wbrv = memc_io_wreg_wbrv; // @[cpu.scala 149:21:@3196.4]
  assign mem_wb_io_wregi_wbri = memc_io_wreg_wbri; // @[cpu.scala 149:21:@3195.4]
  assign mem_wb_io_wregi_wbrd = memc_io_wreg_wbrd; // @[cpu.scala 149:21:@3194.4]
  assign csr_clock = clock; // @[:@3017.4]
  assign csr_reset = reset; // @[:@3018.4]
  assign csr_io_id_addr = insd_io_csr_addr; // @[cpu.scala 157:21:@3208.4]
  assign csr_io_mem_wrCSROp_valid = memc_io_csr_wrCSROp_valid; // @[cpu.scala 158:21:@3216.4]
  assign csr_io_mem_wrCSROp_csr_idx = memc_io_csr_wrCSROp_csr_idx; // @[cpu.scala 158:21:@3215.4]
  assign csr_io_mem_wrCSROp_csr_data = memc_io_csr_wrCSROp_csr_data; // @[cpu.scala 158:21:@3214.4]
  assign csr_io_mem_excep_valid = memc_io_csr_excep_valid; // @[cpu.scala 158:21:@3213.4]
  assign csr_io_mem_excep_code = memc_io_csr_excep_code; // @[cpu.scala 158:21:@3212.4]
  assign csr_io_mem_excep_value = memc_io_csr_excep_value; // @[cpu.scala 158:21:@3211.4]
  assign csr_io_mem_excep_pc = memc_io_csr_excep_pc; // @[cpu.scala 158:21:@3210.4]
  assign csr_io_mem_excep_inst_valid = memc_io_csr_excep_inst_valid; // @[cpu.scala 158:21:@3209.4]
endmodule
