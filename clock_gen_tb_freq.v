//change in frequency 
`timescale 1ns/1 ps
module clock_gen_tb_freq();
  
reg enable;
wire clock1;
wire clock2;
wire clock3;
 
initial  begin
enable =0;
end
always 
begin
#6 enable =~enable;
end

initial begin
#1000
$stop;
end

clock_generator u0(enable,clock1); 
clock_generator #(.FREQUANCY(200000)) u1(enable,clock2); 
clock_generator #(.FREQUANCY(400000)) u2(enable,clock3); 

endmodule

