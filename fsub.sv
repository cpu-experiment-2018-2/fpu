module fsub(
input wire [31:0] adata,
input wire [31:0] bdata,
output reg [31:0] result,
input wire clk);

wire hiseiki_a;
assign hiseiki_a = ! (| adata[30:23]);

wire hiseiki_b;
assign hiseiki_b = ! (| bdata[30:23]);

wire hiseiki;
assign hiseiki   = hiseiki_a || hiseiki_b;

wire tashi1hiki0;
assign tashi1hiki0 = adata[31] ^ bdata[31];

wire sisuudeka_a;
assign sisuudeka_a = adata[30:23] > bdata[30:23];

wire sisuuonaji;
assign sisuuonaji = adata[30:23] == bdata[30:23];

wire kasuudeka_a;
assign kasuudeka_a = adata[22:0] > bdata[22:0];

wire deka_a;
assign deka_a = sisuudeka_a || (sisuuonaji && kasuudeka_a);

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

reg hiseiki_reg;
reg hiseiki_a_reg;
reg tashi1hiki0_reg;
reg deka_s_reg;
reg [7:0]  deka_e_reg;
reg [23:0] deka_m_reg;
reg [23:0] chibi_m_reg;
reg [31:0] adata_reg_1;
reg [31:0] bdata_reg_1;

always@(posedge clk) begin

hiseiki_reg <= hiseiki;
hiseiki_a_reg <= hiseiki_a;
tashi1hiki0_reg <= tashi1hiki0; 
deka_s_reg <= deka_s;
deka_e_reg <= deka_e;
deka_m_reg <= deka_m;
chibi_m_reg <= chibi_m;
adata_reg_1 <= adata;
bdata_reg_1 <= {~bdata[31],bdata[30:0]};

end

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

reg hiseiki_reg_2;
reg hiseiki_a_reg_2;
reg s2_reg;
reg [7:0] e2_reg;
reg [24:0] kekka_reg;
reg [31:0] adata_reg_2;
reg [31:0] bdata_reg_2;

always@(posedge clk) begin

hiseiki_reg_2 <= hiseiki_reg;
hiseiki_a_reg_2 <= hiseiki_a_reg;
s2_reg <= deka_s_reg;
e2_reg <= deka_e_reg;
kekka_reg <= carry ? {Hcarry,L} : {Hnocarry,L};
adata_reg_2 <= adata_reg_1;
bdata_reg_2 <= bdata_reg_1;

end

always@(posedge clk) begin

if (hiseiki_reg_2) begin
result <= hiseiki_a_reg_2 ? bdata_reg_2 : adata_reg_2;
end else if (kekka_reg[24] == 1) begin
result <= {s2_reg,e2_reg+8'd1,kekka_reg[23:1]};
end else if (kekka_reg[23] == 1) begin
result <= {s2_reg,e2_reg,kekka_reg[22:0]};
end else if (kekka_reg[22] == 1) begin
result <= (e2_reg < 1) ? 0 : {s2_reg,e2_reg-8'd1,kekka_reg[21:0],1'b0};
end else if (kekka_reg[21] == 1) begin
result <= (e2_reg < 2) ? 0 : {s2_reg,e2_reg-8'd2,kekka_reg[20:0],2'b0};
end else if (kekka_reg[20] == 1) begin
result <= (e2_reg < 3) ? 0 : {s2_reg,e2_reg-8'd3,kekka_reg[19:0],3'b0};
end else if (kekka_reg[19] == 1) begin
result <= (e2_reg < 4) ? 0 : {s2_reg,e2_reg-8'd4,kekka_reg[18:0],4'b0};
end else if (kekka_reg[18] == 1) begin
result <= (e2_reg < 5) ? 0 : {s2_reg,e2_reg-8'd5,kekka_reg[17:0],5'b0};
end else if (kekka_reg[17] == 1) begin
result <= (e2_reg < 6) ? 0 : {s2_reg,e2_reg-8'd6,kekka_reg[16:0],6'b0};
end else if (kekka_reg[16] == 1) begin
result <= (e2_reg < 7) ? 0 : {s2_reg,e2_reg-8'd7,kekka_reg[15:0],7'b0};
end else if (kekka_reg[15] == 1) begin
result <= (e2_reg < 8) ? 0 : {s2_reg,e2_reg-8'd8,kekka_reg[14:0],8'b0};
end else if (kekka_reg[14] == 1) begin
result <= (e2_reg < 9) ? 0 : {s2_reg,e2_reg-8'd9,kekka_reg[13:0],9'b0};
end else if (kekka_reg[13] == 1) begin
result <= (e2_reg < 10) ? 0 : {s2_reg,e2_reg-8'd10,kekka_reg[12:0],10'b0};
end else if (kekka_reg[12] == 1) begin
result <= (e2_reg < 11) ? 0 : {s2_reg,e2_reg-8'd11,kekka_reg[11:0],11'b0};
end else if (kekka_reg[11] == 1) begin
result <= (e2_reg < 12) ? 0 : {s2_reg,e2_reg-8'd12,kekka_reg[10:0],12'b0};
end else if (kekka_reg[10] == 1) begin
result <= (e2_reg < 13) ? 0 : {s2_reg,e2_reg-8'd13,kekka_reg[9:0],13'b0};
end else if (kekka_reg[9] == 1) begin
result <= (e2_reg < 14) ? 0 : {s2_reg,e2_reg-8'd14,kekka_reg[8:0],14'b0};
end else if (kekka_reg[8] == 1) begin
result <= (e2_reg < 15) ? 0 : {s2_reg,e2_reg-8'd15,kekka_reg[7:0],15'b0};
end else if (kekka_reg[7] == 1) begin
result <= (e2_reg < 16) ? 0 : {s2_reg,e2_reg-8'd16,kekka_reg[6:0],16'b0};
end else if (kekka_reg[6] == 1) begin
result <= (e2_reg < 17) ? 0 : {s2_reg,e2_reg-8'd17,kekka_reg[5:0],17'b0};
end else if (kekka_reg[5] == 1) begin
result <= (e2_reg < 18) ? 0 : {s2_reg,e2_reg-8'd18,kekka_reg[4:0],18'b0};
end else if (kekka_reg[4] == 1) begin
result <= (e2_reg < 19) ? 0 : {s2_reg,e2_reg-8'd19,kekka_reg[3:0],19'b0};
end else if (kekka_reg[3] == 1) begin
result <= (e2_reg < 20) ? 0 : {s2_reg,e2_reg-8'd20,kekka_reg[2:0],20'b0};
end else if (kekka_reg[2] == 1) begin
result <= (e2_reg < 21) ? 0 : {s2_reg,e2_reg-8'd21,kekka_reg[1:0],21'b0};
end else if (kekka_reg[1] == 1) begin
result <= (e2_reg < 22) ? 0 : {s2_reg,e2_reg-8'd22,kekka_reg[0:0],22'b0};
end else if (kekka_reg[0] == 1) begin
result <= (e2_reg < 23) ? 0 : {s2_reg,e2_reg-8'd23,23'b0};
end else begin
result <= 0;
end
end
endmodule

`default_nettype wire 














