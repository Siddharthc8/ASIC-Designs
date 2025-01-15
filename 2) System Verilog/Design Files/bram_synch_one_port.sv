`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2024 01:12:19 PM
// Design Name: 
// Module Name: bram_synch_one_port
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


module bram_synch_one_port
    #(parameter addr_width = 10, data_width = 8)(
    input logic clk,
    input logic we,
    input logic [addr_width - 1:0] addr_a,     // Read address                  
    input logic [data_width - 1:0] din_a,                // Write address                 
    output logic [data_width - 1:0] dout_a           // The read data from the address
    );

    logic [data_width-1:0] memory [0: 2**(addr_width)-1];
    
    //  Port a
    always_ff @(posedge clk)
    begin
        if(we)                           // write
            memory[addr_a] <= din_a;       // write
            
        dout_a <= memory[addr_a];          // Read data from address A 
    end
    
endmodule