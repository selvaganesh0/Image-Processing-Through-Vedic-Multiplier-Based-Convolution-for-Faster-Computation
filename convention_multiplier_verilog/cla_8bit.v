`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:26:51 12/09/2024 
// Design Name: 
// Module Name:    cla_8bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module cla_8bit (
    input  [7:0] A,  // 8-bit input A
    input  [7:0] B,  // 8-bit input B
    output [7:0] Sum, // 8-bit Sum output
    output Cout       // Carry out
);
    wire [7:0] P, G;  // Propagate and Generate signals
    wire [8:0] C;     // Carry signals, including carry out

    assign P = A ^ B; // Propagate: P = A ? B
    assign G = A & B; // Generate: G = A & B
    
    assign C[0] = 0;  // Cin is 0
    
    // Carry lookahead logic
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign C[4] = G[3] | (P[3] & C[3]);
    assign C[5] = G[4] | (P[4] & C[4]);
    assign C[6] = G[5] | (P[5] & C[5]);
    assign C[7] = G[6] | (P[6] & C[6]);
    assign C[8] = G[7] | (P[7] & C[7]); // Final carry out

    assign Sum = P ^ C[7:0]; // Sum calculation
    assign Cout = C[8];      // Carry out
endmodule
