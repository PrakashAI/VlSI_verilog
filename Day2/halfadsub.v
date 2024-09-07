module halfadsub(a,b,sum,carry,diff,borrow);
input a,b;
output sum,carry,diff,borrow;
assign sum=a^b;
assign carry=a&b;
assign diff=a^b;
assign borrow=~a&b;
endmodule

module halfadsub_tb;
reg a,b;
wire sum,carry,diff,borrow;
halfadsub dut(.a(a),.b(b),.sum(sum),.carry(carry),.diff(diff),.borrow(borrow));
initial begin 
a=1'b0; b=1'b0;
#5 a=1'b0; b=1'b1;
#5 a=1'b1; b=1'b0;
#5 a=1'b1; b=1'b1;
#5 $stop;
end
endmodule
