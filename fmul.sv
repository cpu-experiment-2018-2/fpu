module fmul(
  input wire        en,
  input wire [31:0] adata,
  input wire [31:0] bdata,
  output reg [31:0] result,
  output reg        done,
  output reg        busy,
  input wire        clk,
  input wire        rstn);

//WAIT_ST
reg [31:0] wadata;
reg [31:0] wbdata;

//STAGE1
reg        s1;
reg [8:0]  e1;
reg [24:0] adata1;
reg [24:0] bdata1;

//STAGE2
reg [47:0] kekka;
reg        s2;
reg [8:0]  e2;


typedef enum logic [2:0] {
  WAIT_ST,STAGE1,STAGE2,STAGE3
} state_type;
state_type state;

always@(posedge clk) begin
  if (~rstn) begin
    result <= 0;
    done   <= 0;
    busy   <= 0;
    state  <= WAIT_ST;
  end else if (state == WAIT_ST) begin
    done <= 0;
    if (en) begin
      state <= STAGE1;
      busy <= 1;
      wadata <= adata;
      wbdata <= bdata;
    end
  end else if (state == STAGE1) begin
    state <= STAGE2;
      s1 <= wadata[31] ^ wbdata[31];
      e1 <= wadata[30:23] + wbdata[30:23];
      adata1 <= {1'b1,wadata[22:0]};
      bdata1 <= {1'b1,wbdata[22:0]};
  end else if (state == STAGE2) begin
    state <= STAGE3;
    s2 <= s1;
    e2 <= e1 - 9'd127;
    kekka <= adata1 * bdata1;
  end else if (state == STAGE3) begin
    done <= 1;
    busy <= 0;
    state <= WAIT_ST;
    if (kekka[47] == 1) begin
      result <= {s2,e2[7:0]+8'd1,kekka[46:24]};
    end else begin
      result <= {s2,e2[7:0],kekka[45:23]};
    end
  end
end
endmodule

`default_nettype wire






