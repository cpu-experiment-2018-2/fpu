`default_nettype none

//32bitの浮動小数点数srcaとsrcbを受け取り、　srca　<　srcb　を返すモジュール
module fless(
input wire [31:0] srca,
input wire [31:0] srcb,
output wire result);

assign result = 
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

endmodule

`default_nettype wire
