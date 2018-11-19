module fmul(
input wire [31:0] adata,
input wire [31:0] bdata,
output reg [31:0] result,
input wire clk,
input wire flag_in,
input wire [4:0] address_in,
output reg flag_out,
output reg [4:0] address_out);

wire [13:0] a0;
assign a0 = {1'b1,adata[22:10]};

wire [13:0] b0;
assign b0 = {1'b1,bdata[22:10]};

wire [9:0] a1;
assign a1 = adata[9:0];

wire [9:0] b1;
assign b1 = bdata[9:0];

wire [23:0] hoge;
assign hoge = a0*b1;

wire [23:0] fuga;
assign fuga = a1*b0;

reg [27:0] a0b0;
reg [23:0] a1b0;
reg [23:0] a0b1;
reg [7:0] e;
reg [7:0] e_kuriage;
reg s;
reg notzero;
reg flag;
reg [4:0] address;

wire [8:0] eadd;
assign eadd = adata[30:23] + bdata[30:23];

always@(posedge clk) begin

a0b0 <= a0 * b0;

a1b0 <= a1 * b0;

a0b1 <= a0 * b1;

e <= (eadd < 127) ? 0 : eadd - 127;

e_kuriage <= (eadd < 127) ? 0 : eadd - 126;

s <= adata[31] ^ bdata[31];

notzero <= (|adata[30:23]) && (|bdata[30:23]);

flag <= flag_in;

address <= address_in;


end

wire [14:0] a0b1tasua1b0;
assign a0b1tasua1b0 = a1b0[23:10] + a0b1[23:10] ;

wire [15:0] kekka_L;
assign kekka_L= a0b1tasua1b0 + a0b0[14:0];

wire [12:0] kekka_H_carry;
assign kekka_H_carry = a0b0[27:15] + 1;

wire [12:0] kekka_H_nocarry;
assign kekka_H_nocarry = a0b0[27:15];

wire carry;
assign carry = kekka_L[15];

wire [24:0] kekka;
assign kekka = carry ? {kekka_H_carry,kekka_L[14:3]} : {kekka_H_nocarry,kekka_L[14:3]};


wire [31:0] kotae;
assign kotae = notzero ? 
( kekka[24] ? {s,e_kuriage,kekka[23:1]} : {s,e,kekka[22:0]} ) : 0;

always@(posedge clk) begin
result <= kotae;
flag_out <= flag;
address_out <= address;
end
endmodule

`default_nettype wire
