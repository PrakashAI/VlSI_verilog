module basicgates(a,b,and_,or_,not_,xor_,xnor_,nand_,nor_);
input a,b;
output and_,or_,not_,xor_,xnor_,nand_,nor_;
assign and_=a&b;
assign nand_=~(a&b);
assign or_=a|b;
assign nor_=~(a|b);
assign xor_=a^b;
assign xnor_=~(a^b);
assign not_=~a;
endmodule

module basicgates_tb;
reg a,b;
wire and_,nand_,or_,nor_,xor_,xnor_,not_;

basicgates dut(.a(a),.b(b),.and_(and_),.or_(or_),.not_(not_),.xor_(xor_),.xnor_(xnor_),.nand_(nand_),.nor_(nor_));
initial begin
a=1'b0; b=1'b0;
#5 a=1'b0; b=1'b0;
#5 a=1'b0; b=1'b1;
#5 a=1'b1; b=1'b0;
#5 a=1'b1; b=1'b1;
#5 $stop;
end
endmodule
