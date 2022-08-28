module shift_xor( clk,in,out,n);
input clk;
input wire [14:0]in;
output reg  [14:0]out;
output reg n;
always @(posedge clk)
begin 
n=in[0]^in[1];
out={n,in[14:1]};
end
endmodule