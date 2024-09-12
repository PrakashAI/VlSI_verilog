module encode(a,y);
input [7:0]a;
output y;
reg [2:0]y;
always @(a)
begin
case(a)
8'b10000000:y=3'd7;
8'b01000000:y=3'd6;
8'b00100000:y=3'd5;
8'b00010000:y=3'd4;
8'b00001000:y=3'd3;
8'b00000100:y=3'd2;
8'b00000010:y=3'd1;
8'b00000000:y=3'd0;
default:y=3'd0;
endcase
end
endmodule

module encode_tb;
reg [7:0]a;
wire [2:0]y;
encode dut(.a(a),.y(y));
initial begin
	a=8'b10000000;
#3 a=8'b01000000;
#3 a=8'b00100000;
#3 a=8'b00010000;
#3 a=8'b00001000;
#3 a=8'b00000100;
#3 a=8'b00000010;
#3 a=8'b00000000;
#3 $stop;
end 
endmodule
