module deco(a,y);
input [2:0]a;
output reg [7:0]y;

always @(a)
begin
case(a)
3'd7:y=8'b10000000;
3'd6:y=8'b01000000;
3'd5:y=8'b00100000;
3'd4:y=8'b00010000;
3'd3:y=8'b00001000;
3'd2:y=8'b00000100;
3'd1:y=8'b00000010;
3'd0:y=8'b00000001;
endcase
end
endmodule

module decoder_tb;
reg [2:0]a;
wire [7:0]y;
deco dut(.a(a),.y(y));
initial begin
a=3'd7;
#3 a=3'd6;
#3 a=3'd5;
#3 a=3'd4;
#3 a=3'd3;
#3 a=3'd2;
#3 a=3'd1;
#3 a=3'd0;
#3 $stop;
end 
endmodule
