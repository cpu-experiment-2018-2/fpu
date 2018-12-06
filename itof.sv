`default_nettype none

module itof(
input wire [31:0] adata,
output reg [31:0] result,
input wire clk,
input wire flag_in,
input wire [4:0] address_in,
output reg flag_out,
output reg [4:0] address_out);

wire [31:0] hosuu;
assign hosuu = ~adata + 1;

wire [31:0] kuriage30;
assign kuriage30 = ~adata + 257;

wire [31:0] kuriage29;
assign kuriage29 = ~adata + 129;

wire [31:0] kuriage28;
assign kuriage28 = ~adata + 65;

wire [31:0] kuriage27;
assign kuriage27 = ~adata + 33;

wire [31:0] kuriage26;
assign kuriage26 = ~adata + 17;

wire [31:0] kuriage25;
assign kuriage25 = ~adata + 9;

wire [31:0] kuriage24;
assign kuriage24 = ~adata + 5;

wire [31:0] kuriage23;
assign kuriage23 = ~adata + 3;

wire [31:0] a_kuriage30;
assign a_kuriage30 = adata + 256;

wire [31:0] a_kuriage29;
assign a_kuriage29 = adata + 128;

wire [31:0] a_kuriage28;
assign a_kuriage28 = adata + 64;

wire [31:0] a_kuriage27;
assign a_kuriage27 = adata + 32;

wire [31:0] a_kuriage26;
assign a_kuriage26 = adata + 16;

wire [31:0] a_kuriage25;
assign a_kuriage25 = adata + 8;

wire [31:0] a_kuriage24;
assign a_kuriage24 = adata + 4;

wire [31:0] a_kuriage23;
assign a_kuriage23 = adata + 2;

always@(posedge clk) begin
if (adata[31]) begin 
casex (hosuu)
32'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
result <=  hosuu[7] ? {9'd414,kuriage30[30:8]} : {9'd414,hosuu[30:8]};
32'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
result <=  hosuu[6] ? {9'd413,kuriage29[29:7]} : {9'd413,hosuu[29:7]};
32'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
result <=  hosuu[5] ? {9'd412,kuriage28[28:6]} : {9'd412,hosuu[28:6]};
32'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
result <=  hosuu[4] ? {9'd411,kuriage27[27:5]} : {9'd411,hosuu[27:5]};
32'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
result <=  hosuu[3] ? {9'd410,kuriage26[26:4]} : {9'd410,hosuu[26:4]};
32'b000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
result <=  hosuu[2] ? {9'd409,kuriage25[25:3]} : {9'd409,hosuu[25:3]};
32'b0000001xxxxxxxxxxxxxxxxxxxxxxxxx:
result <=  hosuu[1] ? {9'd408,kuriage24[24:2]} : {9'd408,hosuu[24:2]};
32'b00000001xxxxxxxxxxxxxxxxxxxxxxxx:
result <=  hosuu[0] ? {9'd407,kuriage23[23:1]} : {9'd407,hosuu[23:1]};
32'b000000001xxxxxxxxxxxxxxxxxxxxxxx:
result <=  {9'd406,hosuu[22:0]};
32'b0000000001xxxxxxxxxxxxxxxxxxxxxx:
result <=  {9'd405,hosuu[21:0],1'b0};
32'b00000000001xxxxxxxxxxxxxxxxxxxxx:
result <=  {9'd404,hosuu[20:0],2'b0};
32'b000000000001xxxxxxxxxxxxxxxxxxxx:
result <=  {9'd403,hosuu[19:0],3'b0};
32'b0000000000001xxxxxxxxxxxxxxxxxxx:
result <=  {9'd402,hosuu[18:0],4'b0};
32'b00000000000001xxxxxxxxxxxxxxxxxx:
result <=  {9'd401,hosuu[17:0],5'b0};
32'b000000000000001xxxxxxxxxxxxxxxxx:
result <=  {9'd400,hosuu[16:0],6'b0};
32'b0000000000000001xxxxxxxxxxxxxxxx:
result <=  {9'd399,hosuu[15:0],7'b0};
32'b00000000000000001xxxxxxxxxxxxxxx:
result <=  {9'd398,hosuu[14:0],8'b0};
32'b000000000000000001xxxxxxxxxxxxxx:
result <=  {9'd397,hosuu[13:0],9'b0};
32'b0000000000000000001xxxxxxxxxxxxx:
result <=  {9'd396,hosuu[12:0],10'b0};
32'b00000000000000000001xxxxxxxxxxxx:
result <=  {9'd395,hosuu[11:0],11'b0};
32'b000000000000000000001xxxxxxxxxxx:
result <=  {9'd394,hosuu[10:0],12'b0};
32'b0000000000000000000001xxxxxxxxxx:
result <=  {9'd393,hosuu[9:0],13'b0};
32'b00000000000000000000001xxxxxxxxx:
result <=  {9'd392,hosuu[8:0],14'b0};
32'b000000000000000000000001xxxxxxxx:
result <=  {9'd391,hosuu[7:0],15'b0};
32'b0000000000000000000000001xxxxxxx:
result <=  {9'd390,hosuu[6:0],16'b0};
32'b00000000000000000000000001xxxxxx:
result <=  {9'd389,hosuu[5:0],17'b0};
32'b000000000000000000000000001xxxxx:
result <=  {9'd388,hosuu[4:0],18'b0};
32'b0000000000000000000000000001xxxx:
result <=  {9'd387,hosuu[3:0],19'b0};
32'b00000000000000000000000000001xxx:
result <=  {9'd386,hosuu[2:0],20'b0};
32'b000000000000000000000000000001xx:
result <=  {9'd385,hosuu[1:0],21'b0};
32'b0000000000000000000000000000001x:
result <=  {9'd384,hosuu[0:0],22'b0};
32'b00000000000000000000000000000001:
result <=  32'd3212836864;
endcase
end else begin
casex (adata)
32'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
result <=  adata[7] ? {9'd158,a_kuriage30[30:8]} : {9'd158,adata[30:8]};
32'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
result <=  adata[6] ? {9'd157,a_kuriage29[29:7]} : {9'd157,adata[29:7]};
32'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
result <=  adata[5] ? {9'd156,a_kuriage28[28:6]} : {9'd156,adata[28:6]};
32'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
result <=  adata[4] ? {9'd155,a_kuriage27[27:5]} : {9'd155,adata[27:5]};
32'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
result <=  adata[3] ? {9'd154,a_kuriage26[26:4]} : {9'd154,adata[26:4]};
32'b000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
result <=  adata[2] ? {9'd153,a_kuriage25[25:3]} : {9'd153,adata[25:3]};
32'b0000001xxxxxxxxxxxxxxxxxxxxxxxxx:
result <=  adata[1] ? {9'd152,a_kuriage24[24:2]} : {9'd152,adata[24:2]};
32'b00000001xxxxxxxxxxxxxxxxxxxxxxxx:
result <=  adata[0] ? {9'd151,a_kuriage23[23:1]} : {9'd151,adata[23:1]};
32'b000000001xxxxxxxxxxxxxxxxxxxxxxx:
result <=  {9'd150,adata[22:0]};
32'b0000000001xxxxxxxxxxxxxxxxxxxxxx:
result <=  {9'd149,adata[21:0],1'b0};
32'b00000000001xxxxxxxxxxxxxxxxxxxxx:
result <=  {9'd148,adata[20:0],2'b0};
32'b000000000001xxxxxxxxxxxxxxxxxxxx:
result <=  {9'd147,adata[19:0],3'b0};
32'b0000000000001xxxxxxxxxxxxxxxxxxx:
result <=  {9'd146,adata[18:0],4'b0};
32'b00000000000001xxxxxxxxxxxxxxxxxx:
result <=  {9'd145,adata[17:0],5'b0};
32'b000000000000001xxxxxxxxxxxxxxxxx:
result <=  {9'd144,adata[16:0],6'b0};
32'b0000000000000001xxxxxxxxxxxxxxxx:
result <=  {9'd143,adata[15:0],7'b0};
32'b00000000000000001xxxxxxxxxxxxxxx:
result <=  {9'd142,adata[14:0],8'b0};
32'b000000000000000001xxxxxxxxxxxxxx:
result <=  {9'd141,adata[13:0],9'b0};
32'b0000000000000000001xxxxxxxxxxxxx:
result <=  {9'd140,adata[12:0],10'b0};
32'b00000000000000000001xxxxxxxxxxxx:
result <=  {9'd139,adata[11:0],11'b0};
32'b000000000000000000001xxxxxxxxxxx:
result <=  {9'd138,adata[10:0],12'b0};
32'b0000000000000000000001xxxxxxxxxx:
result <=  {9'd137,adata[9:0],13'b0};
32'b00000000000000000000001xxxxxxxxx:
result <=  {9'd136,adata[8:0],14'b0};
32'b000000000000000000000001xxxxxxxx:
result <=  {9'd135,adata[7:0],15'b0};
32'b0000000000000000000000001xxxxxxx:
result <=  {9'd134,adata[6:0],16'b0};
32'b00000000000000000000000001xxxxxx:
result <=  {9'd133,adata[5:0],17'b0};
32'b000000000000000000000000001xxxxx:
result <=  {9'd132,adata[4:0],18'b0};
32'b0000000000000000000000000001xxxx:
result <=  {9'd131,adata[3:0],19'b0};
32'b00000000000000000000000000001xxx:
result <=  {9'd130,adata[2:0],20'b0};
32'b000000000000000000000000000001xx:
result <=  {9'd129,adata[1:0],21'b0};
32'b0000000000000000000000000000001x:
result <=  {9'd128,adata[0:0],22'b0};
32'b00000000000000000000000000000001:
result <=  32'd1065353216;
endcase
end
address_out <= address_in;
flag_out <= flag_in;
end
endmodule

`default_nettype wire
