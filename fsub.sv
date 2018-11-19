module fsub(
input wire [31:0] adata,
input wire [31:0] bdata,
output reg [31:0] result,
input wire clk,
input wire flag_in,
input wire [4:0] address_in,
output reg flag_out,
output reg [4:0] address_out);

wire hiseiki_a;
assign hiseiki_a = ! (| adata[30:23]);

wire hiseiki_b;
assign hiseiki_b = ! (| bdata[30:23]);

wire hiseiki;
assign hiseiki   = hiseiki_a || hiseiki_b;

wire tashi1hiki0;
assign tashi1hiki0 = adata[31] ^ bdata[31];

wire deka_a;
assign deka_a = adata[30:0] > bdata[30:0];

wire deka_s;
assign deka_s = deka_a ? adata[31] : ~bdata[31];

wire [7:0] deka_e;
assign deka_e = deka_a ? adata[30:23] : bdata[30:23];

wire [23:0] deka_m;
assign deka_m = deka_a ? {1'b1,adata[22:0]} : {1'b1,bdata[22:0]};

wire [7:0] ahikub;
assign ahikub = adata[30:23] - bdata[30:23];

wire [7:0] bhikua;
assign bhikua = bdata[30:23] - adata[30:23];

wire [23:0] chibi_m;
assign chibi_m = deka_a ? ({1'b1,bdata[22:0]} >> ahikub) : ({1'b1,adata[22:0]} >> bhikua);

/*

wire hiseiki_reg;
wire hiseiki_a_reg;
wire tashi1hiki0_reg;
wire deka_s_reg;
wire [7:0]  deka_e_reg;
wire [23:0] deka_m_reg;
wire [23:0] chibi_m_reg;
wire [31:0] adata_reg_1;
wire [31:0] bdata_reg_1;
wire flag1;
wire [4:0] address1;



assign hiseiki_reg = hiseiki;
assign hiseiki_a_reg = hiseiki_a;
assign tashi1hiki0_reg = tashi1hiki0; 
assign deka_s_reg = deka_s;
assign deka_e_reg = deka_e;
assign deka_m_reg = deka_m;
assign chibi_m_reg = chibi_m;
assign adata_reg_1 = adata;
assign bdata_reg_1 = bdata;
assign flag1 = flag_in;
assign address1 = address_in;



wire [12:0] Hcarrysub;
assign Hcarrysub = tashi1hiki0_reg ? {deka_m_reg[23:13],1'b1} + {chibi_m_reg[23:13],1'b1} : {deka_m_reg[23:13],1'b0} - {chibi_m_reg[23:13],1'b1};

wire [11:0] Hcarry;
assign Hcarry = Hcarrysub[12:1];

wire [11:0] Hnocarry;
assign Hnocarry = tashi1hiki0_reg ? deka_m_reg[23:13] + chibi_m_reg[23:13] : deka_m_reg[23:13] - chibi_m_reg[23:13];

wire [13:0] Lsub;
assign Lsub = tashi1hiki0_reg ? deka_m_reg[12:0] + chibi_m_reg[12:0] : {1'b1,deka_m_reg[12:0]} - chibi_m_reg[12:0];

wire carry;
assign carry = tashi1hiki0_reg ? Lsub[13] : ~Lsub[13];

wire [12:0] L;
assign L = Lsub[12:0];

*/

reg hiseiki_reg_2;
reg hiseiki_a_reg_2;
reg s2_reg;
reg [7:0] e2_reg;
reg [24:0] kekka_reg;
reg [31:0] adata_reg_2;
reg [31:0] bdata_reg_2;
reg flag2;
reg [4:0] address2;

always@(posedge clk) begin

hiseiki_reg_2 <= hiseiki;
hiseiki_a_reg_2 <= hiseiki_a;
s2_reg <= deka_s;
e2_reg <= deka_e;
kekka_reg <= tashi1hiki0 ? deka_m + chibi_m : deka_m - chibi_m;
adata_reg_2 <= adata;
bdata_reg_2 <= {~bdata[31],bdata[30:0]};
flag2 <= flag_in;
address2 <= address_in;

end

always@(posedge clk) begin
flag_out <= flag2;
address_out <= address2;
if (hiseiki_reg_2) begin
result <= hiseiki_a_reg_2 ? bdata_reg_2 : adata_reg_2;
end else begin
casex (kekka_reg) 
25'b1xxxxxxxxxxxxxxxxxxxxxxxx: 
result <= {s2_reg,e2_reg+8'd1,kekka_reg[23:1]};
25'b01xxxxxxxxxxxxxxxxxxxxxxx: 
result <= {s2_reg,e2_reg,kekka_reg[22:0]};
25'b001xxxxxxxxxxxxxxxxxxxxxx: 
result <= (e2_reg < 1) ? 0 : {s2_reg,e2_reg-8'd1,kekka_reg[21:0],1'b0};
25'b0001xxxxxxxxxxxxxxxxxxxxx: 
result <= (e2_reg < 2) ? 0 : {s2_reg,e2_reg-8'd2,kekka_reg[20:0],2'b0};
25'b00001xxxxxxxxxxxxxxxxxxxx: 
result <= (e2_reg < 3) ? 0 : {s2_reg,e2_reg-8'd3,kekka_reg[19:0],3'b0};
25'b000001xxxxxxxxxxxxxxxxxxx: 
result <= (e2_reg < 4) ? 0 : {s2_reg,e2_reg-8'd4,kekka_reg[18:0],4'b0};
25'b0000001xxxxxxxxxxxxxxxxxx: 
result <= (e2_reg < 5) ? 0 : {s2_reg,e2_reg-8'd5,kekka_reg[17:0],5'b0};
25'b00000001xxxxxxxxxxxxxxxxx: 
result <= (e2_reg < 6) ? 0 : {s2_reg,e2_reg-8'd6,kekka_reg[16:0],6'b0};
25'b000000001xxxxxxxxxxxxxxxx: 
result <= (e2_reg < 7) ? 0 : {s2_reg,e2_reg-8'd7,kekka_reg[15:0],7'b0};
25'b0000000001xxxxxxxxxxxxxxx: 
result <= (e2_reg < 8) ? 0 : {s2_reg,e2_reg-8'd8,kekka_reg[14:0],8'b0};
25'b00000000001xxxxxxxxxxxxxx: 
result <= (e2_reg < 9) ? 0 : {s2_reg,e2_reg-8'd9,kekka_reg[13:0],9'b0};
25'b000000000001xxxxxxxxxxxxx: 
result <= (e2_reg < 10) ? 0 : {s2_reg,e2_reg-8'd10,kekka_reg[12:0],10'b0};
25'b0000000000001xxxxxxxxxxxx: 
result <= (e2_reg < 11) ? 0 : {s2_reg,e2_reg-8'd11,kekka_reg[11:0],11'b0};
25'b00000000000001xxxxxxxxxxx: 
result <= (e2_reg < 12) ? 0 : {s2_reg,e2_reg-8'd12,kekka_reg[10:0],12'b0};
25'b000000000000001xxxxxxxxxx: 
result <= (e2_reg < 13) ? 0 : {s2_reg,e2_reg-8'd13,kekka_reg[9:0],13'b0};
25'b0000000000000001xxxxxxxxx: 
result <= (e2_reg < 14) ? 0 : {s2_reg,e2_reg-8'd14,kekka_reg[8:0],14'b0};
25'b00000000000000001xxxxxxxx: 
result <= (e2_reg < 15) ? 0 : {s2_reg,e2_reg-8'd15,kekka_reg[7:0],15'b0};
25'b000000000000000001xxxxxxx: 
result <= (e2_reg < 16) ? 0 : {s2_reg,e2_reg-8'd16,kekka_reg[6:0],16'b0};
25'b0000000000000000001xxxxxx: 
result <= (e2_reg < 17) ? 0 : {s2_reg,e2_reg-8'd17,kekka_reg[5:0],17'b0};
25'b00000000000000000001xxxxx: 
result <= (e2_reg < 18) ? 0 : {s2_reg,e2_reg-8'd18,kekka_reg[4:0],18'b0};
25'b000000000000000000001xxxx: 
result <= (e2_reg < 19) ? 0 : {s2_reg,e2_reg-8'd19,kekka_reg[3:0],19'b0};
25'b0000000000000000000001xxx: 
result <= (e2_reg < 20) ? 0 : {s2_reg,e2_reg-8'd20,kekka_reg[2:0],20'b0};
25'b00000000000000000000001xx: 
result <= (e2_reg < 21) ? 0 : {s2_reg,e2_reg-8'd21,kekka_reg[1:0],21'b0};
25'b000000000000000000000001x: 
result <= (e2_reg < 22) ? 0 : {s2_reg,e2_reg-8'd22,kekka_reg[0:0],22'b0};
25'b0000000000000000000000001: 
result <= (e2_reg < 23) ? 0 : {s2_reg,e2_reg-8'd23,23'b0};
25'b0:
result <= 0;
endcase
end
end
endmodule

`default_nettype wire 














