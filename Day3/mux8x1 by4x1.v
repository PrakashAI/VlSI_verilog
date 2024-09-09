module   mux(a,b,c,d,e,f,g,h,s0,s1,s2,y);
input [2:0]a,b,c,d,e,f,g,h;
input s0,s1,s2;
output [2:0]y;
wire [2:0]y1,y2;
assign y1=s1?(s0?d:c):s0?b:a;
assign y2=s1?(s0?h:g):s0?f:e;
assign y=s2?y2:y1;
endmodule

module mux_tb;
reg [2:0]a,b,c,d,e,f,g,h;
reg s0,s1,s2;
wire [2:0]y;
mux dut(.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.h(h),.s0(s0),.s1(s1),.s2(s2),.y(y));
initial begin
a=3'd0;
b=3'd1;
c=3'd2;
d=3'd3;
e=3'd4;
f=3'd5;
g=3'd6;
h=3'd7;
#3 s2=1'b0 ; s1=1'b0; s0=1'b0 ;
#3 s2=1'b0 ; s1=1'b0; s0=1'b1 ;
#3 s2=1'b0 ; s1=1'b1; s0=1'b0 ;
#3 s2=1'b0 ; s1=1'b1; s0=1'b1 ;
#3 s2=1'b1 ; s1=1'b0; s0=1'b0 ;
#3 s2=1'b1 ; s1=1'b0; s0=1'b1 ;
#3 s2=1'b1 ; s1=1'b1; s0=1'b0 ;
#3 s2=1'b1 ; s1=1'b1; s0=1'b1 ;
#3 $stop;
end
endmodule
