`default_nettype none

module fmul
( input wire [31:0] x1,
  input wire [31:0] x2,
  output wire [31:0] y,
  output wire ovf);

wire [0:0] s1;
wire [7:0] e1;
wire [22:0] m1;
wire [0:0] s2;
wire [7:0] e2;
wire [22:0] m2;

assign s1 = x1[31];
assign e1 = x1[30:23];
assign m1 = x1[22:0];
assign s2 = x2[31];
assign e2 = x2[30:23];
assign m2 = x2[22:0];

wire [23:0] m1a;
wire [23:0] m2a;

assign m1a = (e1 == 0) ? {1'b0,m1} : {1'b1,m1};
assign m2a = (e2 == 0) ? {1'b0,m2} : {1'b1,m2};

wire [47:0] myd;

assign myd = m1a * m2a;

wire [5:0] se;

assign se = (myd[47] == 1) ? 0 : (
  (myd[46] == 1) ? 1 : (
  (myd[45] == 1) ? 2 : (
  (myd[44] == 1) ? 3 : (
  (myd[43] == 1) ? 4 : (
  (myd[42] == 1) ? 5 : (
  (myd[41] == 1) ? 6 : (
  (myd[40] == 1) ? 7 : (
  (myd[39] == 1) ? 8 : (
  (myd[38] == 1) ? 9 : (
  (myd[37] == 1) ? 10 : (
  (myd[36] == 1) ? 11 : (
  (myd[35] == 1) ? 12 : (
  (myd[34] == 1) ? 13 : (
  (myd[33] == 1) ? 14 : (
  (myd[32] == 1) ? 15 : (
  (myd[31] == 1) ? 16 : (
  (myd[30] == 1) ? 17 : (
  (myd[29] == 1) ? 18 : (
  (myd[28] == 1) ? 19 : (
  (myd[27] == 1) ? 20 : (
  (myd[26] == 1) ? 21 : (
  (myd[25] == 1) ? 22 : (
  (myd[24] == 1) ? 23 : (
  (myd[23] == 1) ? 24 : (
  (myd[22] == 1) ? 25 : (
  (myd[21] == 1) ? 26 : (
  (myd[20] == 1) ? 27 : (
  (myd[19] == 1) ? 28 : (
  (myd[18] == 1) ? 29 : (
  (myd[17] == 1) ? 30 : (
  (myd[16] == 1) ? 31 : (
  (myd[15] == 1) ? 32 : (
  (myd[14] == 1) ? 33 : (
  (myd[13] == 1) ? 34 : (
  (myd[12] == 1) ? 35 : (
  (myd[11] == 1) ? 36 : (
  (myd[10] == 1) ? 37 : (
  (myd[9] == 1) ? 38 : (
  (myd[8] == 1) ? 39 : (
  (myd[7] == 1) ? 40 : (
  (myd[6] == 1) ? 41 : (
  (myd[5] == 1) ? 42 : (
  (myd[4] == 1) ? 43 : (
  (myd[3] == 1) ? 44 : (
  (myd[2] == 1) ? 45 : (
  (myd[1] == 1) ? 46 : (
  (myd[0] == 1) ? 47 : 48
)))))))))))))))))))))))))))))))))))))))))))))));

wire [7:0] e1maji;
wire [7:0] e2maji;

assign e1maji = (e1 != 0) ? e1 : 1 ;
assign e2maji = (e2 != 0) ? e2 : 1 ;

wire [8:0] ekari;

assign ekari = e1maji + e2maji;

wire [8:0] emaji;

assign emaji = (ekari > 50) ? ekari + (1 - se) : 10;

wire stck;

assign stck = (se == 0) ? (|myd[21:0]) : 
  ((se == 1) ? (|myd[20:0]) : 
  ((se == 2) ? (|myd[19:0]) : 
  ((se == 3) ? (|myd[18:0]) : 
  ((se == 4) ? (|myd[17:0]) : 
  ((se == 5) ? (|myd[16:0]) : 
  ((se == 6) ? (|myd[15:0]) : 
  ((se == 7) ? (|myd[14:0]) : 
  ((se == 8) ? (|myd[13:0]) : 
  ((se == 9) ? (|myd[12:0]) : 
  ((se == 10) ? (|myd[11:0]) : 
  ((se == 11) ? (|myd[10:0]) : 
  ((se == 12) ? (|myd[9:0]) : 
  ((se == 13) ? (|myd[8:0]) : 
  ((se == 14) ? (|myd[7:0]) : 
  ((se == 15) ? (|myd[6:0]) : 
  ((se == 16) ? (|myd[5:0]) : 
  ((se == 17) ? (|myd[4:0]) : 
  ((se == 18) ? (|myd[3:0]) : 
  ((se == 19) ? (|myd[2:0]) : 
  ((se == 20) ? (|myd[1:0]) : 
  ((se == 21) ? (|myd[0:0]) : 0 ))))))))))))))))))))); 

wire [26:0] myf;

assign myf = (se < 23) ? myd[(47-se)-:26] : 
  ((se == 23) ? (myd[24:0] << 1) :
  ((se == 24) ? (myd[23:0] << 2) :
  ((se == 25) ? (myd[22:0] << 3) :
  ((se == 26) ? (myd[21:0] << 4) :
  ((se == 27) ? (myd[20:0] << 5) :
  ((se == 28) ? (myd[19:0] << 6) :
  ((se == 29) ? (myd[18:0] << 7) :
  ((se == 30) ? (myd[17:0] << 8) :
  ((se == 31) ? (myd[16:0] << 9) :
  ((se == 32) ? (myd[15:0] << 10) :
  ((se == 33) ? (myd[14:0] << 11) :
  ((se == 34) ? (myd[13:0] << 12) :
  ((se == 35) ? (myd[12:0] << 13) :
  ((se == 36) ? (myd[11:0] << 14) :
  ((se == 37) ? (myd[10:0] << 15) :
  ((se == 38) ? (myd[9:0] << 16) :
  ((se == 39) ? (myd[8:0] << 17) :
  ((se == 40) ? (myd[7:0] << 18) :
  ((se == 41) ? (myd[6:0] << 19) :
  ((se == 42) ? (myd[5:0] << 20) :
  ((se == 43) ? (myd[4:0] << 21) :
  ((se == 44) ? (myd[3:0] << 22) :
  ((se == 45) ? (myd[2:0] << 23) :
  ((se == 46) ? (myd[1:0] << 24) :
  ((se == 47) ? (myd[0:0] << 25) : 0 )))))))))))))))))))))))));


wire [24:0] myr;

assign myr = (((myf[1]==1)&&(myf[0]==0)&&(stck==0)&&(myf[2]==1)) || ((myf[1]==1)&&(myf[0]==0)&&((stck==1))) || ((myf[1]==1)&&(myf[0]==1))) ? (myf[26:2]+25'b1) : myf[26:2];


wire [9:0] egachimae;

assign egachimae = (myr[24] == 1) ? (emaji + 1) : emaji;

wire [23:0] mgachimae;

assign mgachimae = (myr[24] == 1) ? myr[24:1] : myr[23:0];

wire [0:7] egachi;

assign egachi = (egachimae < 128) ? 0 : 
  ((egachimae > 381) ? 255 : (egachimae - 127));

wire [22:0] mgachi;

assign mgachi = (egachimae < 105) ? 0 :

  ((egachimae == 105) ? (mgachimae[22] ? mgachimae[23:23]+1 : mgachimae[23:23]) :
  ((egachimae == 106) ? (mgachimae[21] ? mgachimae[23:22]+1 : mgachimae[23:22]) :
  ((egachimae == 107) ? (mgachimae[20] ? mgachimae[23:21]+1 : mgachimae[23:21]) :
  ((egachimae == 108) ? (mgachimae[19] ? mgachimae[23:20]+1 : mgachimae[23:20]) :
  ((egachimae == 109) ? (mgachimae[18] ? mgachimae[23:19]+1 : mgachimae[23:19]) :
  ((egachimae == 110) ? (mgachimae[17] ? mgachimae[23:18]+1 : mgachimae[23:18]) :
  ((egachimae == 111) ? (mgachimae[16] ? mgachimae[23:17]+1 : mgachimae[23:17]) :
  ((egachimae == 112) ? (mgachimae[15] ? mgachimae[23:16]+1 : mgachimae[23:16]) :
  ((egachimae == 113) ? (mgachimae[14] ? mgachimae[23:15]+1 : mgachimae[23:15]) :
  ((egachimae == 114) ? (mgachimae[13] ? mgachimae[23:14]+1 : mgachimae[23:14]) :
  ((egachimae == 115) ? (mgachimae[12] ? mgachimae[23:13]+1 : mgachimae[23:13]) :
  ((egachimae == 116) ? (mgachimae[11] ? mgachimae[23:12]+1 : mgachimae[23:12]) :
  ((egachimae == 117) ? (mgachimae[10] ? mgachimae[23:11]+1 : mgachimae[23:11]) :
  ((egachimae == 118) ? (mgachimae[9] ? mgachimae[23:10]+1 : mgachimae[23:10]) :
  ((egachimae == 119) ? (mgachimae[8] ? mgachimae[23:9]+1 : mgachimae[23:9]) :
  ((egachimae == 120) ? (mgachimae[7] ? mgachimae[23:8]+1 : mgachimae[23:8]) :
  ((egachimae == 121) ? (mgachimae[6] ? mgachimae[23:7]+1 : mgachimae[23:7]) :
  ((egachimae == 122) ? (mgachimae[5] ? mgachimae[23:6]+1 : mgachimae[23:6]) :
  ((egachimae == 123) ? (mgachimae[4] ? mgachimae[23:5]+1 : mgachimae[23:5]) :
  ((egachimae == 124) ? (mgachimae[3] ? mgachimae[23:4]+1 : mgachimae[23:4]) :
  ((egachimae == 125) ? (mgachimae[2] ? mgachimae[23:3]+1 : mgachimae[23:3]) :
  ((egachimae == 126) ? (mgachimae[1] ? mgachimae[23:2]+1 : mgachimae[23:2]) :
  ((egachimae == 127) ? (mgachimae[0] ? mgachimae[23:1]+1 : mgachimae[23:1]) :

  ((egachimae > 381) ? 0 : mgachimae[22:0] ))))))))))))))))))))))));


wire sgachi;

assign sgachi = (s1 == s2) ? 0 : 1;

wire [0:0] nzm1;
wire [0:0] nzm2;

assign nzm1 = |(m1[22:0]);
assign nzm2 = |(m2[22:0]);

assign y = ((e1==255)&&(e2!=255)) ? 
  (nzm1 ? {s1,8'd255,1'b1,m1[21:0]} : {sgachi,8'd255,23'b0}) : 
  (((e2==255)&&(e1!=255)) ? 
  (nzm2 ? {s2,8'd255,1'b1,m2[21:0]} :
  {sgachi,8'd255,23'b0}) : (
    ((e1==255)&&(e2==255)&&nzm2) ? {s2,8'd255,1'b1,m2[21:0]} : (
    ((e1==255)&&(e2==255)&&nzm1) ? {s1,8'd255,1'b1,m1[21:0]} : (
    ((e1==255)&&(e2==255)&&(s1==s2)) ? {1'b0,8'd255,23'b0} : (
    ((e1==255)&&(e2==255)) ? {1'b1,8'd255,23'b0} : {sgachi,egachi,mgachi})))));

  assign ovf = ((e1 < 255) && (e2 < 255) && (egachi == 255)) ? 1 : 0;

  endmodule





  `default_nettype wire
