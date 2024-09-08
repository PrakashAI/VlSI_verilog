module fulladsub(a,b,cin,sum,carry,borrow,diff);
input a,b,cin;
output sum,carry,borrow,diff;
assign sum=a^b^cin;
assign diff=sum;
assign carry=(a&b)|cin&(a^b);
assign borrow=((~a)&b)|cin&(a~^b);
endmodule

module fulladsub_tb;
reg a,b,cin;
wire sum,carry,borrow,diff;
fulladsub dut(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry),.borrow(borrow),.diff(diff));
initial begin
a=1'b0;b=1'b0; cin=1'b0;

#3 a=1'b0;b=1'b0; cin=1'b1;
#3 a=1'b0;b=1'b1; cin=1'b0;
#3 a=1'b0;b=1'b1; cin=1'b1;
#3 a=1'b1;b=1'b0; cin=1'b0;
#3 a=1'b1;b=1'b0; cin=1'b1;
#3 a=1'b1;b=1'b1; cin=1'b0;
#3 a=1'b1;b=1'b1; cin=1'b1;
#3 $stop;
end 
endmodule
