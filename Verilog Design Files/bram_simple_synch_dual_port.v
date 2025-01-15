`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2024 08:48:36 PM
// Design Name: 
// Module Name: bram_simple_synch_dual_port
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


module bram_simple_synch_dual_port
    #(parameter addr_width = 10, data_width = 8)(
    input clk,
    input we,
    input [addr_width - 1:0] addr_r, addr_w,     // Read address                  
    input [data_width - 1:0] din,                // Write address                 
    output reg [data_width - 1:0] dout           // The read data from the address
    );
    
    reg [data_width-1:0] memory [0: 2**(addr_width)-1];
    
    //  Port a
    always @(posedge clk)
    begin
        if(we)                           // write
            memory[addr_w] <= din;       // write
            
        dout <= memory[addr_r];          // Read data from address A 
    end

endmodule
