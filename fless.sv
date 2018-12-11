`default_nettype none

//32bitの浮動小数点数srcaとsrcbを受け取り、　srca　<　srcb　を返すモジュール
module fless(
input wire [31:0] srca,
input wire [31:0] srcb,
output reg result,
input wire clk);

//kekkaが実質の出力
wire kekka;
assign kekka = 
  |srca[30:23] ? 
    |srcb[30:23] ? 
      srca[31] ? 
        srcb[31] ?  
          srca[30:0] > srcb[30:0] 
          : 1
        : srcb[31] ?  
          0 
          : srca[30:0] < srcb[30:0]
      : srca[31]
    : |srcb[30:23] ?
      ~srcb[31]
      : 0;     


always@(posedge clk) begin
result <= kekka;
end

endmodule

`default_nettype wire
