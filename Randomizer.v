module Randomizer(clk, reset,load,en,vector_in,vector_in2,in,out);
input wire clk;
input reset;
input load;
input wire en;
input wire [14:0]vector_in;
 output reg [14:0]vector_in2;
input wire in;
output wire out;
reg outtemp;

 always @(posedge clk,posedge reset)
begin
if(reset)
begin
outtemp<=1'b0;
end
else if(en==0)begin outtemp<=out; end


else if (load=='b1 )begin
vector_in2<=vector_in;
end 
else  begin

vector_in2[14]<=vector_in2[0]^vector_in2[1];
vector_in2[13:0]<=vector_in2[14:1];
//outtemp=vector_in2[14]^in;
end


end
assign out= (reset==1||en==0)?outtemp : vector_in2[14]^in;
endmodule