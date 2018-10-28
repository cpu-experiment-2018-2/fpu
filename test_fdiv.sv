`timescale 1fs / 1fs
`default_nettype none

module test_fdiv
  #(parameter NSTAGE = 11)
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


   logic [31:0]	x1_reg[NSTAGE:0];
   logic [31:0]	x2_reg[NSTAGE:0];
   logic 	val[NSTAGE:0];
   
   logic [31:0] x1;
   logic [31:0] x2;
   
   assign x1 = x1_reg[0];
   assign x2 = x2_reg[0];
   
   logic [29:0] counter1;
   logic [29:0] counter2;
   logic [29:0] counter3;
   logic [22:0] hoge;

   fdiv u1(en,x1,x2,y,done,busy,clk,rstn);

   initial begin
      // $dumpfile("test_fadd_p2.vcd");
      // $dumpvars(0);
      #1;
      rstn = 0;
      clk = 1;
      val[0] <= 0;
      val[1] <= 0;
      val[2] <= 0;
      val[3] <= 0;
      x1_reg[0] = 0;
      x2_reg[0] = 0;
      en <= 0;
      counter1 <= 0;
      
    
  //                $display("counter1 %b ", counter1);

      #1;
      clk = 0;
      #1;
      clk = 1;
      rstn = 1;
      counter1 <= counter1+1;
      hoge <= 23'b0;
  //           $display("counter1 %b ", counter1);
      #1;
      clk = 0;

      #1;
      clk = 1;
       counter1 <= counter1+1;
       $display("counter1 %b ", counter1);
      for (i=1; i<8388608; i++) begin
                        x1_reg[0] <= {32'b00111111100000000000000000000000};
                        x2_reg[0] <= {9'b001111111,hoge[22:0]};
			val[0] <= 1;
			en <= 1;

                        #1;
			clk = 0;			
			
			#1;
			clk = 1;
			val[0] <= 0;
			 counter1 <= counter1+1;
			 hoge[22:0] <= hoge[22:0] + 23'b1;
//			        $display("counter1 %b ", counter1);
			#1;
			clk = 0;
			
			#1;
			clk = 1;
			val[0] <= 0;
			 counter1 <= counter1+1;
	//		        $display("counter1 %b ", counter1);
			#1;
			clk = 0;
			
			#1;
			clk = 1;
			val[0] <= 0;
			 counter1 <= counter1+1;
	//		        $display("counter1 %b ", counter1);
			#1;
			clk = 0;
			
			
			#1;
			clk = 1;
			val[0] <= 0;
			 counter1 <= counter1+1;
	//		        $display("counter1 %b ", counter1);
			#1;
			clk = 0;
			
						
			#1;
			clk = 1;
			val[0] <= 0;
			 counter1 <= counter1+1;
	//		        $display("counter1 %b ", counter1);
			#1;
			clk = 0;
			
						
			#1;
			clk = 1;
			val[0] <= 0;
			 counter1 <= counter1+1;
	//		        $display("counter1 %b ", counter1);
			#1;
			clk = 0;
			
						
			#1;
			clk = 1;
			val[0] <= 0;
			 counter1 <= counter1+1;
	//		        $display("counter1 %b ", counter1);
			#1;
			clk = 0;
			
						
			#1;
			clk = 1;
			val[0] <= 0;
			 counter1 <= counter1+1;
	//		        $display("counter1 %b ", counter1);
			#1;
			clk = 0;
			
						
			#1;
			clk = 1;
			val[0] <= 0;
			 counter1 <= counter1+1;
	//		        $display("counter1 %b ", counter1);
			#1;
			clk = 0;
			
						
			#1;
			clk = 1;
			val[0] <= 0;
			 counter1 <= counter1+1;
	//		        $display("counter1 %b ", counter1);
			#1;
			clk = 0;
			
						
			#1;
			clk = 1;	
			 counter1 <= counter1+1;
      end
      $finish;
   end

   always @(posedge clk) begin
 //  $display ("x1 \n 4 %b \n 3 %b \n 2 %b \n 1 %b \n 0 %b \n", x1_reg[4], x1_reg[3],x1_reg[2],x1_reg[1],x1_reg[0]);
 //    $display ("x2 \n 4 %b \n 3 %b \n 2 %b \n 1 %b \n 0 %b \n", x2_reg[4], x2_reg[3],x2_reg[2],x2_reg[1],x2_reg[0]);
 //    $display("x1wire %b \n x2wire %b \n y %b", x1,x2,y);
 // $display("%b",hoge);
   if (counter1 == 2) begin
   counter2 <= 3;
      x1_reg[NSTAGE:1] <= x1_reg[NSTAGE-1:0];
      x2_reg[NSTAGE:1] <= x2_reg[NSTAGE-1:0];
      val[NSTAGE:1] <= val[NSTAGE-1:0];
  //           $display("counter2 %b ", counter2);
   end else begin
  counter2 <= counter2 + 1;
      x1_reg[NSTAGE:1] <= x1_reg[NSTAGE-1:0];
      x2_reg[NSTAGE:1] <= x2_reg[NSTAGE-1:0];
      val[NSTAGE:1] <= val[NSTAGE-1:0];  
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


	 if (y != fybit && y != fybit - 1 && y != fybit + 1  && fybit[30:23] != 8'd255 && y != fybit -2 && y != fybit + 2 && y != fybit - 3 && y != fybit + 3) begin
            $display("x1, x2 = %b %b", x1_reg[NSTAGE], x2_reg[NSTAGE]);
            $display("%e %b ", fy, fybit);
            $display("%e %b \n", $bitstoshortreal(y), y);
	 end
      end
   end
endmodule

