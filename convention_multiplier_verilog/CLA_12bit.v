`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:27:35 12/09/2024 
// Design Name: 
// Module Name:    CLA_12bit 
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
module CLA_12bit (
    input  [11:0] A,      // 12-bit input A
    input  [11:0] B,      // 12-bit input B
    output [11:0] Sum     // 12-bit Sum output
);
    wire [11:0] G;        // Generate signals
    wire [11:0] P;        // Propagate signals
    wire [11:1] C;        // Internal carry signals

    // Step 1: Generate and Propagate signals
    assign G = A & B;     // Generate: G[i] = A[i] & B[i]
    assign P = A ^ B;     // Propagate: P[i] = A[i] ^ B[i]

    // Step 2: Carry signals (no Cin, so C[0] = 0)
    assign C[1]  = G[0];                       // C1 = G0
    assign C[2]  = G[1] | (P[1] & C[1]);       // C2 = G1 + P1*C1
    assign C[3]  = G[2] | (P[2] & C[2]);       // C3 = G2 + P2*C2
    assign C[4]  = G[3] | (P[3] & C[3]);       // C4 = G3 + P3*C3
    assign C[5]  = G[4] | (P[4] & C[4]);       // C5 = G4 + P4*C4
    assign C[6]  = G[5] | (P[5] & C[5]);       // C6 = G5 + P5*C5
    assign C[7]  = G[6] | (P[6] & C[6]);       // C7 = G6 + P6*C6
    assign C[8]  = G[7] | (P[7] & C[7]);       // C8 = G7 + P7*C7
    assign C[9]  = G[8] | (P[8] & C[8]);       // C9 = G8 + P8*C8
    assign C[10] = G[9] | (P[9] & C[9]);       // C10 = G9 + P9*C9
    assign C[11] = G[10] | (P[10] & C[10]);    // C11 = G10 + P10*C10

    // Step 3: Sum computation
    assign Sum = P ^ {C[11:1], 1'b0}; // Sum[i] = P[i] ^ C[i]; C[0] = 0

endmodule


