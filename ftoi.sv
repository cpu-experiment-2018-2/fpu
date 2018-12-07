`default_nettype none

module ftoi(
input wire [31:0] adata,
output reg [31:0] result,
input wire clk,
input wire flag_in,
input wire [4:0] address_in,
output reg flag_out,
output reg [4:0] address_out);

always@(posedge clk) begin
if (adata[31])begin
casex (adata[30:23])
157:
result <= ~{2'b1,adata[22:0],7'b0} + 1;
156:
result <= ~{3'b1,adata[22:0],6'b0} + 1;
155:
result <= ~{4'b1,adata[22:0],5'b0} + 1;
154:
result <= ~{5'b1,adata[22:0],4'b0} + 1;
153:
result <= ~{6'b1,adata[22:0],3'b0} + 1;
152:
result <= ~{7'b1,adata[22:0],2'b0} + 1;
151:
result <= ~{8'b1,adata[22:0],1'b0} + 1;
150:
result <= ~{9'b1,adata[22:0]} + 1;
149:
result <= adata[0] ? ~({10'b1,adata[22:1]}+32'b1) + 1 : ~{10'b1,adata[22:1]} + 1;
148:
result <= adata[1] ? ~({11'b1,adata[22:2]}+32'b1) + 1 : ~{11'b1,adata[22:2]} + 1;
147:
result <= adata[2] ? ~({12'b1,adata[22:3]}+32'b1) + 1 : ~{12'b1,adata[22:3]} + 1;
146:
result <= adata[3] ? ~({13'b1,adata[22:4]}+32'b1) + 1 : ~{13'b1,adata[22:4]} + 1;
145:
result <= adata[4] ? ~({14'b1,adata[22:5]}+32'b1) + 1 : ~{14'b1,adata[22:5]} + 1;
144:
result <= adata[5] ? ~({15'b1,adata[22:6]}+32'b1) + 1 : ~{15'b1,adata[22:6]} + 1;
143:
result <= adata[6] ? ~({16'b1,adata[22:7]}+32'b1) + 1 : ~{16'b1,adata[22:7]} + 1;
142:
result <= adata[7] ? ~({17'b1,adata[22:8]}+32'b1) + 1 : ~{17'b1,adata[22:8]} + 1;
141:
result <= adata[8] ? ~({18'b1,adata[22:9]}+32'b1) + 1 : ~{18'b1,adata[22:9]} + 1;
140:
result <= adata[9] ? ~({19'b1,adata[22:10]}+32'b1) + 1 : ~{19'b1,adata[22:10]} + 1;
139:
result <= adata[10] ? ~({20'b1,adata[22:11]}+32'b1) + 1 : ~{20'b1,adata[22:11]} + 1;
138:
result <= adata[11] ? ~({21'b1,adata[22:12]}+32'b1) + 1 : ~{21'b1,adata[22:12]} + 1;
137:
result <= adata[12] ? ~({22'b1,adata[22:13]}+32'b1) + 1 : ~{22'b1,adata[22:13]} + 1;
136:
result <= adata[13] ? ~({23'b1,adata[22:14]}+32'b1) + 1 : ~{23'b1,adata[22:14]} + 1;
135:
result <= adata[14] ? ~({24'b1,adata[22:15]}+32'b1) + 1 : ~{24'b1,adata[22:15]} + 1;
134:
result <= adata[15] ? ~({25'b1,adata[22:16]}+32'b1) + 1 : ~{25'b1,adata[22:16]} + 1;
133:
result <= adata[16] ? ~({26'b1,adata[22:17]}+32'b1) + 1 : ~{26'b1,adata[22:17]} + 1;
132:
result <= adata[17] ? ~({27'b1,adata[22:18]}+32'b1) + 1 : ~{27'b1,adata[22:18]} + 1;
131:
result <= adata[18] ? ~({28'b1,adata[22:19]}+32'b1) + 1 : ~{28'b1,adata[22:19]} + 1;
130:
result <= adata[19] ? ~({29'b1,adata[22:20]}+32'b1) + 1 : ~{29'b1,adata[22:20]} + 1;
129:
result <= adata[20] ? ~({30'b1,adata[22:21]}+32'b1) + 1 : ~{30'b1,adata[22:21]} + 1;
128:
result <= adata[21] ? ~({31'b1,adata[22:22]}+32'b1) + 1 : ~{31'b1,adata[22:22]} + 1;
127:
result <= adata[22] ? ~32'b10  + 1: ~32'b1 + 1;
126:
result <= ~32'b1 + 1;
default:
result <= 32'b0;
endcase
end else begin
casex (adata[30:23])
157:
result <= {2'b1,adata[22:0],7'b0};
156:
result <= {3'b1,adata[22:0],6'b0};
155:
result <= {4'b1,adata[22:0],5'b0};
154:
result <= {5'b1,adata[22:0],4'b0};
153:
result <= {6'b1,adata[22:0],3'b0};
152:
result <= {7'b1,adata[22:0],2'b0};
151:
result <= {8'b1,adata[22:0],1'b0};
150:
result <= {9'b1,adata[22:0]};
149:
result <= adata[0] ? {10'b1,adata[22:1]}+32'b1 : {10'b1,adata[22:1]};
148:
result <= adata[1] ? {11'b1,adata[22:2]}+32'b1 : {11'b1,adata[22:2]};
147:
result <= adata[2] ? {12'b1,adata[22:3]}+32'b1 : {12'b1,adata[22:3]};
146:
result <= adata[3] ? {13'b1,adata[22:4]}+32'b1 : {13'b1,adata[22:4]};
145:
result <= adata[4] ? {14'b1,adata[22:5]}+32'b1 : {14'b1,adata[22:5]};
144:
result <= adata[5] ? {15'b1,adata[22:6]}+32'b1 : {15'b1,adata[22:6]};
143:
result <= adata[6] ? {16'b1,adata[22:7]}+32'b1 : {16'b1,adata[22:7]};
142:
result <= adata[7] ? {17'b1,adata[22:8]}+32'b1 : {17'b1,adata[22:8]};
141:
result <= adata[8] ? {18'b1,adata[22:9]}+32'b1 : {18'b1,adata[22:9]};
140:
result <= adata[9] ? {19'b1,adata[22:10]}+32'b1 : {19'b1,adata[22:10]};
139:
result <= adata[10] ? {20'b1,adata[22:11]}+32'b1 : {20'b1,adata[22:11]};
138:
result <= adata[11] ? {21'b1,adata[22:12]}+32'b1 : {21'b1,adata[22:12]};
137:
result <= adata[12] ? {22'b1,adata[22:13]}+32'b1 : {22'b1,adata[22:13]};
136:
result <= adata[13] ? {23'b1,adata[22:14]}+32'b1 : {23'b1,adata[22:14]};
135:
result <= adata[14] ? {24'b1,adata[22:15]}+32'b1 : {24'b1,adata[22:15]};
134:
result <= adata[15] ? {25'b1,adata[22:16]}+32'b1 : {25'b1,adata[22:16]};
133:
result <= adata[16] ? {26'b1,adata[22:17]}+32'b1 : {26'b1,adata[22:17]};
132:
result <= adata[17] ? {27'b1,adata[22:18]}+32'b1 : {27'b1,adata[22:18]};
131:
result <= adata[18] ? {28'b1,adata[22:19]}+32'b1 : {28'b1,adata[22:19]};
130:
result <= adata[19] ? {29'b1,adata[22:20]}+32'b1 : {29'b1,adata[22:20]};
129:
result <= adata[20] ? {30'b1,adata[22:21]}+32'b1 : {30'b1,adata[22:21]};
128:
result <= adata[21] ? {31'b1,adata[22:22]}+32'b1 : {31'b1,adata[22:22]};
127:
result <= adata[22] ? 32'b10 : 32'b1;
126:
result <= 32'b1;
default:
result <= 32'b0;
endcase
end
address_out <= address_in;
flag_out <= flag_in;
end
endmodule

`default_nettype wire
