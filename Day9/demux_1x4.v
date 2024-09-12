module demux_1x4(a,s0,s1,y);
input s0,s1,a;
output reg [3:0]y;
always @(s0 or s1 or a)
begin
y=4'b0000;
case({s1,s0})
2'b00:y[0]=a;
2'b01:y[1]=a;
2'b10:y[2]=a;
2'b11:y[3]=a;
endcase
end
endmodule

module demux_tb;
reg a,s0,s1;
wire [3:0]y;
demux_1x4 dut(.a(a),.s0(s0),.s1(s1),.y(y));
initial begin
a=1'b1;
s0=1'b0; s1=1'b0;

#3 s0=1'b1; s1=1'b0;
#3 s0=1'b0; s1=1'b1;
#3 s0=1'b1; s1=1'b1;
#3 $stop;
end 
endmodule
