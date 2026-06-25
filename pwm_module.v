`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 12:44:16
// Design Name: 
// Module Name: pwm_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`default_nettype none

module pwm_module(
	input wire clk, 
	input wire rst,
	input wire [7:0] pwm_in,
	output reg pwm_out
);

reg [7:0] count;

always @ (posedge clk or posedge rst) begin
	if(rst) begin	
		pwm_out <= 0;
		count <= 0;
	end
	else begin
		count <= count + 1;
		if(count < pwm_in) begin
			pwm_out <= 1;
		end
		else begin
			pwm_out <= 0;
		end
	end
end
endmodule
