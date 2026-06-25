`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 12:48:56
// Design Name: 
// Module Name: top
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
module top(
    input wire sys_clk, sys_rst,
    output wire audio_out
    );
    wire enable;
    wire [17:0] addr;
    wire [7:0] brom_out;
    
    blk_mem_gen_0 your_inst1 (
  .clka(sys_clk),    // input wire clka
  .ena(enable),      // input wire ena
  .addra(addr),  // input wire [17 : 0] addra
  .douta(brom_out)  // output wire [7 : 0] douta
);
    
    pwm_module inst2(
	.clk(sys_clk), 
	.rst(sys_rst),
	.pwm_in(brom_out),
	.pwm_out(audio_out)
);

    clk_44kHz inst3(
    .clk(sys_clk), .rst(sys_rst),
    .enable(enable),
    .addr(addr)
   );

endmodule
