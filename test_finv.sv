`timescale 1ns / 100ps
`default_nettype none

module test_finv
  #(parameter NSTAGE = 4)
   ();
   logic [31:0] y;
   shortreal    fx1,fx2,fy;
   int          i,j,k,it,jt;
   bit [22:0]   m1,m2;
   bit [9:0]    dum1,dum2;
   logic [31:0] fybit;
   int          s1,s2;
   logic [23:0] dy;
   bit [22:0] 	tm;
   logic        done;
   logic        busy;
   logic          en;
   logic 	clk;
   logic 	rstn;
   logic        flagin;
   logic [4:0]  addin;
   logic        flagout;
   logic [4:0]  addout;

   logic [31:0]	x1_reg[NSTAGE:0];
   logic [31:0]	x2_reg[NSTAGE:0];
   logic 	val[NSTAGE:0];
   logic        flag[NSTAGE:0];
   logic [4:0]  add[NSTAGE:0];
   assign flagin = flag[0];
   assign addin = add[0];
   
   logic [31:0] x1;
   logic [31:0] x2;
   
   assign x1 = x1_reg[0];
   assign x2 = x2_reg[0];
   
   logic [29:0] counter1;
   logic [29:0] counter2;
   logic [29:0] counter3;
   
   logic [22:0] hoge; 
   
   wire [31:0] fuga;
   assign fuga = x1_reg[NSTAGE];

   fdiv u1(x1,x2,y,clk,flagin,addin,flagout,addout);

   initial begin
     //  $dumpfile("test_fadd_p2.vcd");
     //  $dumpvars(0);
      #1;
      rstn = 0;
      clk = 1;
      val[0] <= 0;
      val[1] <= 0;
      val[2] <= 0;
      val[3] <= 0;
      x1_reg[0] = 0;
      x2_reg[0] = 0;
      hoge <= 0;
      en <= 0;
      counter1 <= 0;
  //                $display("counter1 %b ", counter1);

      #1;
      clk = 0;
      #1;
      clk = 1;
      rstn = 1;
      counter1 <= counter1+1;
  //           $display("counter1 %b ", counter1);
      #1;
      clk = 0;

      #1;
       counter1 <= counter1+1;
      for (i=0;i<8388608;i++) begin
      clk = 1;
      x1_reg[0] <= 32'b00111111100000000000000000000000;
      x2_reg[0] <= {1'b0,8'd127,hoge};
      val[0] <= 1;
			en <= 1;
			flag[0] <= $urandom();
			add[0] <= $urandom();

      #1;
      hoge <= hoge+1;
      clk = 0;
      #1;
      end
      $finish;
   end

   always @(posedge clk) begin
 //  $display ("x1 \n 4 %b \n 3 %b \n 2 %b \n 1 %b \n 0 %b \n", x1_reg[4], x1_reg[3],x1_reg[2],x1_reg[1],x1_reg[0]);
 //    $display ("x2 \n 4 %b \n 3 %b \n 2 %b \n 1 %b \n 0 %b \n", x2_reg[4], x2_reg[3],x2_reg[2],x2_reg[1],x2_reg[0]);
 //    $display("x1wire %b \n x2wire %b \n y %b", x1,x2,y);
   if (counter1 == 2) begin
   counter2 <= 3;
      x1_reg[NSTAGE:1] <= x1_reg[NSTAGE-1:0];
      x2_reg[NSTAGE:1] <= x2_reg[NSTAGE-1:0];
      val[NSTAGE:1] <= val[NSTAGE-1:0];
      flag[NSTAGE:1] <= flag[NSTAGE-1:0];
      add[NSTAGE:1] <= add[NSTAGE-1:0];
  //           $display("counter2 %b ", counter2);
   end else begin
  counter2 <= counter2 + 1;
      x1_reg[NSTAGE:1] <= x1_reg[NSTAGE-1:0];
      x2_reg[NSTAGE:1] <= x2_reg[NSTAGE-1:0];
      val[NSTAGE:1] <= val[NSTAGE-1:0];
      flag[NSTAGE:1] <= flag[NSTAGE-1:0];
      add[NSTAGE:1] <= add[NSTAGE-1:0];  
  //           $display("counter2 %b ", counter2);
   end 
   end
   
   always @(posedge clk) begin
   if (counter1 == 2) begin
   counter3 <= 3;
 //         $display("counter3 %b ", counter3);
   end else begin
   counter3 <= counter3 + 1;
 //         $display("counter3 %b ", counter3);
   end
      if (val[NSTAGE]) begin
	 fx1 = $bitstoshortreal(x1_reg[NSTAGE]);
	 fx2 = $bitstoshortreal(x2_reg[NSTAGE]);
	 fy = fx1 / fx2;
	 fybit = $shortrealtobits(fy);

/*	$display("kekka = %b",u1.kekka_reg);
	$display ("deka = %b",u1.deka_m_reg);
	$display("adata = %b",u1.adata);
	$display("bdata = %b",u1.bdata);
	$display("Hcarry = %b",u1.Hcarry);
	$display("Hnocarry = %b",u1.Hnocarry);
	$display("L = %b",u1.L);
*/	if (flagout != flag[NSTAGE] || add[NSTAGE] != addout) begin
$display("flag,add %b %b %b %b", flagout,flag[NSTAGE],addout,add[NSTAGE]);
end 
	 if ((!((fybit[30:23] == 0 || fuga[30:23] == 0) && y[30:23] == 0)) && (y < fybit - 3 || y > fybit + 3) && (!(fybit[30:23] == 255))) begin
            $display("x1, x2 = %b %b", x1_reg[NSTAGE], x2_reg[NSTAGE]);
            $display("%e %b ", fy, fybit);
            $display("%e %b \n", $bitstoshortreal(y), y);
	 end
      end
   end
endmodule

