module carrylook(a,b,cin,sum,carrry);
input [3:0]a,b;
output [3:0]sum;
output carrry;
input cin;
wire [3:0]p,g,c;
genvar i;
generate
for(i=0;i<4;i=i+1)
begin:gen
assign 
p[i]=a[i]^b[i],
g[i]=a[i]&b[i];
end
endgenerate
assign c[0]=g[0]|(p[0]&cin),
c[1]=g[1]|(p[1]&g[0])|(p[1]&p[0]&cin),

c[2]=g[2]|(p[2]&g[1])|(p[2]&p[1]&p[0]&cin)|(p[2]&p[1]&g[0]),

c[3]=g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&p[0]&cin)|(p[3]&p[2]&p[1]&g[0]),

sum[0]=p[0]^cin,
sum[1]=p[1]^c[0],
sum[2]=p[2]^c[1],
sum[3]=p[3]^c[2],
carrry=c[3];
endmodule

module carrylook_tb;
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire carry;
carrylook dut(.a(a),.b(b),.sum(sum),.carry(carry),.cin(cin));
initial begin
a=4'd0; b=4'd3; cin=1'b0;
#3 a=4'd3; b=4'd3; cin=1'b0;
#3 a=4'd15; b=4'd10; cin=1'b1;
#3 a=4'd15; b=4'd15; cin=1'b1;
#3 $stop;
end 
endmodule
