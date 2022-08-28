module tb();
reg clk;
reg reset;
reg load;
reg en;
reg [14:0]vector_in;
wire [14:0]vector_in2;
reg in;

reg [95:0]out_all;

wire out;
wire [95:0]values;
assign values= 96'hACBCD2114DAE1577C6DBF4C9; 
Randomizer r(clk,reset,load,en,vector_in,vector_in2,in,out);

initial   begin
$monitor("%h",out_all);
//vector_in= 15'b101010001110110;
vector_in=15'b011011100010101 ;

clk=0; 
en=1;

reset =0;
load=1'b1;
#100 load=0;


end

integer i=95;
always @(posedge clk,posedge reset)
begin
if(load==0&&i>=-1)
begin
in=values[i];
out_all[i+1]=out;

i<=i-1'b1;
end

if(i==-2)
 begin
if(out_all==96'h558AC4A53A1724E163AC2BF9) $display("true answer");
else if(out_all!=96'h558AC4A53A1724E163AC2BF9) $display("false answer");
$finish;

end
end





always begin #10 clk=~clk;
end

endmodule