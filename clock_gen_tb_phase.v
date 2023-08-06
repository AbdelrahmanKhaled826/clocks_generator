
//change in duty cycle
`timescale 1ns/1 ps
module clock_gen_tb_phase();
  
reg enable;
wire clock1;
wire clock2;
wire clock3;
 
initial
enable <=0; 
always begin
#6 enable <=1;
#6  enable<=0;
end
initial begin
#100
$stop;
end
clock_generator u0(enable,clock1); 
clock_generator #(.PHASE(90)) u1(enable,clock2); 
clock_generator #(.PHASE(180)) u2(enable,clock3); 

endmodule



