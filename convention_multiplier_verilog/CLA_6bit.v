`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:12:38 12/10/2024 
// Design Name: 
// Module Name:    CLA_6bit 
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
module CLA_6bit (
    input  [5:0] A,      // 6-bit input A
    input  [5:0] B,      // 6-bit input B
    output [5:0] Sum    // 6-bit Sum output    // Carry-out
);
    wire [5:0] G;        // Generate signals
    wire [5:0] P;        // Propagate signals
    wire [5:0] C;        // Internal carry signals

    // Step 1: Generate and Propagate signals
    assign G = A & B;    // Generate: G[i] = A[i] & B[i]
    assign P = A ^ B;    // Propagate: P[i] = A[i] ^ B[i]

    // Step 2: Carry signals
	 assign C[0]=0;
    assign C[1] = G[0] | (P[0] &C[0]);                       // C1 = G0 + P0*Cin
    assign C[2] = G[1] | (P[1] & C[1]);                     // C2 = G1 + P1*C1
    assign C[3] = G[2] | (P[2] & C[2]);                     // C3 = G2 + P2*C2
    assign C[4] = G[3] | (P[3] & C[3]);                     // C4 = G3 + P3*C3
    assign C[5] = G[4] | (P[4] & C[4]);                     // C5 = G4 + P4*C4
                        // Cout = G5 + P5*C5
     
    // Step 3: Sum computation
    assign Sum = P ^ C; // Sum[i] = P[i] ^ C[i]

endmodule
