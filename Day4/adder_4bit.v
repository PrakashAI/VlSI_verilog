module adder_4bit(a,b,c,sum,carry);
input [3:0]a,b;
input c;
output [3:0]sum;
output carry;
wire [3:0]cout;
genvar i;
generate
for (i=0;i<4;i=i+1)
begin:adder
if(i==0)
ad u_adder_0(a[i],b[i],c,sum[i],cout[i]);
else
ad u_adder_i(a[i],b[i],cout[i-1],sum[i],cout[i]);
end
endgenerate
assign carry=cout[3];
endmodule

module ad(a,b,c,sum,carry);
input a,b,c;
output sum,carry;
assign sum=a^b^c;
assign carry=(a&b)|(c&(a^b));
endmodule

module adder_4bit_tb;
reg [3:0]a,b;
reg c;
wire [3:0]sum,carry;
adder_4bit dut (.a(a),.b(b),.c(c),.sum(sum),.carry(carry));
initial begin	
	a=4'd0; b=4'd10; c=1'b0;
#3 a=4'd5; b=4'd10; c=1'b0; 
#3 a=4'd0; b=4'd11; c=1'b1;
#3 a=4'd4; b=4'd8 ;  c=1'b1;
#3 a=4'd0; b=4'd9;  c=1'b1;
#3 $stop;
end
endmodule
