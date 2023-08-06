`timescale 1ns/1ps
module clock_generator
#(
parameter DUTY=50, //in precentage 
parameter PHASE=0,//in degree
parameter FREQUANCY=100000//khz
)
(
input enable,
output reg clock
);


localparam real period=  (1.0/(FREQUANCY * 1000.0))*(10**9); // to make it by ns 
localparam real clock_onn= (period/100.0)*DUTY;
localparam real clock_off = period - clock_onn;
localparam real start_delay= (period/4 ) *(PHASE /90);

reg sta_clk;


initial begin
clock <=0;
sta_clk <=0;
end

always @(posedge enable, negedge enable) 
begin
if (enable) 
	begin
		#(start_delay) sta_clk=1;
	end
	else begin
	     sta_clk=0;
	end
end

always@(posedge sta_clk)
  begin
    if(sta_clk)begin
          clock=1;
          while(sta_clk) begin
          #(clock_onn)  clock=0;
          #(clock_off) clock=1;
          
          end
          
          clock=0;
          end
else 
clock=0;       
          
end





initial begin
  $display("the  clock  frequancy =%dKHZ , duty=%d ns, phase=%d degree:",FREQUANCY,DUTY,PHASE);
  $display ("the clock period is =%0.2f ns",period);
  $display ("the time of clock high is =%0.2f ns",clock_onn);
  $display ("the time of clock low  is =%0.2f ns",clock_off);
  $display("______________________________________________________________________________");
  
end 

endmodule 
