`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:24:42 12/09/2024 
// Design Name: 
// Module Name:    vedic_multiplier_8bit 
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
module vedic_multiplier_8bit_convention(
    input [7:0] A1,  // 8-bit multiplicand
    input [7:0] B1,  // 8-bit multiplier
    output [15:0] product // 16-bit product
);
    wire [7:0] A, B;
    wire [7:0] P0, P1, P2, P3;
    wire [11:0] temp1, temp2, temp3, sum1, sum2,temp4,temp6,temp5;
    wire [7:0] temp8;
    wire [3:0]temp9;
    assign A = A1;
	 wire [7:0] B2;
	 two_complement_8 a1(B1,B2);
    assign B = B1[7] ? B2: B1;  
    wire [15:0]product1;
    // 4-bit Vedic multipliers for smaller sections
    vedic_multiplier_4bit VM4 (A[3:0], B[3:0], {P0[7:4],product1[3:0]});
    vedic_multiplier_4bit VM5 (A[7:4], B[3:0], P1);
    vedic_multiplier_4bit VM6 (A[3:0], B[7:4], P2);
    vedic_multiplier_4bit VM7 (A[7:4], B[7:4], P3);
    
	 
	 

	 wire [11:0] temp7;
	 assign temp7[11:9]=3'b000;
	 cla_8bit t5(P1,P2,temp7[7:0],temp7[8]);
    CLA_12bit t6(temp7,{P3,P0[7:4]},product1[15:4]);	 
//	 cla_8bit t2(temp7[7:0],{P3[3:0],P0[7:4]},product1[11:4],c2);
//	 and(c4,c1,c2);
//	 xor(c3,c1,c2);
//	 CLA_4_2bit t10(P3[7:4],{c4,c3},product1[15:12],c5);
    // Partial products alignment
//    assign temp1 = {4'b0,P1};   // P1 aligned to bits [11:4]
//    assign temp2 = {4'b0,P2};   // P2 aligned to bits [11:4]
//    assign temp3 = {P3,4'b0}; 
//    assign temp4=  {8'b0,P0[7:4]};         	 // P3 aligned to bits [15:8]

    // Summing up partial products (excluding P0[3:0], which are directly assigned to product[3:0])
	 
	 
	 
//    CLA_12bit c4(temp1,temp2,temp5);
//	 CLA_12bit c5(temp3,temp4,temp6);
//	 CLA_12bit c6(temp5,temp6,sum2);
//    brent_kung_adder_12bit c4(temp1,temp2,temp5);
//	 brent_kung_adder_12bit c5(temp3,temp4,temp6);
//	 brent_kung_adder_12bit c6(temp5,temp6,sum2);
    // Final product assignment
             // Directly assign the 4 LSBs from P0
    //assign product1[15:4] = sum2; // Assign the remaining bits
	 wire [15:0] product2;
	 two_complement_16 a2(product1,product2);
    assign product=B1[7]?product2:product1;
endmodule

// 4-bit Vedic Multiplier Module


 module vedic_multiplier_4bit (
    input [3:0] A,  // 4-bit multiplicand
    input [3:0] B,  // 4-bit multiplier
    output [7:0] product  // 8-bit product                                          
);
    
    wire [3:0] P0, P1, P2, P3;
    wire [5:0] temp0,temp3,temp4,sum1;	
    wire [5:0]temp1,temp2;
    wire c1,c2;
    // 2-bit Vedic multipliers for smaller sections
    vedic_multiplier_2bit VM0 (A[1:0], B[1:0], P0);
    vedic_multiplier_2bit VM1 (A[3:2], B[1:0], P1);
    vedic_multiplier_2bit VM2 (A[1:0], B[3:2], P2);
    vedic_multiplier_2bit VM3 (A[3:2], B[3:2], P3);

     //Partial products alignment
	 //assign temp5[5]=1'b0; 
    assign temp1 = {2'b0,P1};   // P1 aligned to bits [5:2]
    assign temp2 = {2'b0,P2};   // P2 aligned to bits [5:2]
    
    assign temp3 = {P3,2'b0};    // P3 aligned to bits [7:4]
    assign temp4=  {4'b0,P0[3:2]};
wire [5:0]temp5,temp6;
assign product[1:0] = P0[1:0];     
//assign temp0[1:0]=P2[1:0];
//TwoBitAdder t1(P2[3:2],P3[1:0],temp0[3:2],c1);
//CLA_4_2bit t2(P1,P0[3:2],temp1,c2);
//CLA_5bit t3({c1,temp0},{c2,temp1},temp5);
//assign product[5:2]=temp5[3:0];
//TwoBitAddernoc t4(temp5[5:4],P3[3:2],product[7:6]);
////
//
//
//
//   brent_kung_adder_6bit c7(temp1,temp2,temp5);
//	//brent_kung_adder_4bit c7(P1,P2,temp5[3:0],temp5[4]);
////	//CLA_4bit c10(P1,P2,temp5[4:0]);
//   brent_kung_adder_6bit c8(temp3,temp4,temp6);
// brent_kung_adder_6bit c9(temp5,temp6,sum1);
    CLA_6bit c4(temp1,temp2,temp5);
	 CLA_6bit c5(temp3,temp4,temp6);
	 CLA_6bit c6(temp5,temp6,sum1);
//    wire [3:0]P4;
//	 wire x5,x6;
//	 CLA_Adder(P1,P2,P4,x5);
//	 CLA_Adder(P4,{P3[1:0],P0[3:2]},sum1[3:0],x6);
//	 
//
//



    // Final product assignment
    //assign product[1:0] = P0[1:0];     // Directly assign the 2 LSBs from P0
assign product[7:2] = sum1;

endmodule


// 2-bit Vedic Multiplier Module
module vedic_multiplier_2bit (
    input [1:0] A,  // 2-bit multiplicand
    input [1:0] B,  // 2-bit multiplier
    output [3:0] product  // 4-bit product
);
    wire P1, P2, P3, P4; // Partial product bits
    wire c1;

    // Partial products
    assign P1 = A[0] & B[0];  // Least significant bit
    assign P2 = A[1] & B[0];  
    assign P3 = A[0] & B[1];  
    assign P4 = A[1] & B[1];  // Most significant bit

    // Construct final product
    assign product[0] = P1;
    assign product[1] = P2 ^ P3;
    assign c1 = P2 & P3;
    assign product[2] = c1 ^ P4;
    assign product[3] = c1 & P4;

endmodule


module HalfAdder (
    input a, b,
    output sum, carry
);
    assign sum = a ^ b;      // XOR for sum
    assign carry = a & b;    // AND for carry
endmodule

module TwoBitAdder (
    input [1:0] a,       // 2-bit input a
    input [1:0] b,       // 2-bit input b
    output [1:0] sum,    // 2-bit sum output
    output cout          // Carry-out
);
    wire c1, c2;  // Intermediate carries
    wire sum1;    // Intermediate sum for the second bit

    // First Half Adder for a[0] and b[0]
    HalfAdder HA1 (a[0], b[0], sum[0], c1);

    // Second Half Adder for a[1] and b[1]
    HalfAdder HA2 (a[1], b[1], sum1, c2);

    // Sum and carry-out logic
    assign sum[1] = sum1 ^ c1;
    assign cout = c2 | (sum1 & c1);

endmodule

module CLA_4_2bit (
    input  [3:0] A,      // 6-bit input A
    input  [1:0] B,      // 6-bit input B
    output [3:0] Sum, 
    output cout	 // 6-bit Sum output    // Carry-out
);
    wire [3:0] G;        // Generate signals
    wire [3:0] P;        // Propagate signals
    wire [3:0] C;        // Internal carry signals

    // Step 1: Generate and Propagate signals
    assign G[3:2]=2'b00;
    assign G[1:0]=A[1:0]&B[1:0];                    // Generate: G[i] = A[i] & B[i]
    //assign P = A ^ B;                             // Propagate: P[i] = A[i] ^ B[i]
    assign P[3:2]=A[3:2];
    assign P[1:0]=A[1:0]^B[1:0];                    
    // Step 2: Carry signals
	 assign C[0]=0;
    assign C[1] = G[0] | (P[0] &C[0]);                       // C1 = G0 + P0*Cin
    assign C[2] = G[1] | (P[1] & C[1]);                     // C2 = G1 + P1*C1
    assign C[3] = P[2] & C[2];                     // C3 = G2 + P2*C2
    assign cout = P[3] & C[3];                     // C4 = G3 + P3*C3
                              // C5 = G4 + P4*C4
                        // Cout = G5 + P5*C5
     
    // Step 3: Sum computation
    assign Sum = P ^ C; // Sum[i] = P[i] ^ C[i]

endmodule


module CLA_5bit (
    input  [4:0] A,      // 6-bit input A
    input  [4:0] B,      // 6-bit input B
    output [5:0] Sum    // 6-bit Sum output    // Carry-out
);
    wire [4:0] G;        // Generate signals
    wire [4:0] P;        // Propagate signals
    wire [4:0] C;        // Internal carry signals

    // Step 1: Generate and Propagate signals
    assign G = A & B;    // Generate: G[i] = A[i] & B[i]
    assign P = A ^ B;    // Propagate: P[i] = A[i] ^ B[i]

    // Step 2: Carry signals
	 assign C[0]=0;
    assign C[1] = G[0] | (P[0] &C[0]);                       // C1 = G0 + P0*Cin
    assign C[2] = G[1] | (P[1] & C[1]);                     // C2 = G1 + P1*C1
    assign C[3] = G[2] | (P[2] & C[2]);                     // C3 = G2 + P2*C2
    assign C[4] = G[3] | (P[3] & C[3]);                     // C4 = G3 + P3*C3
    assign Sum[5] = G[4] | (P[4] & C[4]);                     // C5 = G4 + P4*C4
                        // Cout = G5 + P5*C5
     
    // Step 3: Sum computation
    assign Sum[4:0]= P ^ C; // Sum[i] = P[i] ^ C[i]

endmodule


module HalfAdder1 (
    input a, b,
    output sum, carry
);
    assign sum = a ^ b;      // XOR for sum
    assign carry = a & b;    // AND for carry
endmodule

module TwoBitAddernoc (
    input [1:0] a,       // 2-bit input a
    input [1:0] b,       // 2-bit input b
    output [1:0] sum   // 2-bit sum output      // Carry-out
);
    wire c1, c2;  // Intermediate carries
    wire sum1;    // Intermediate sum for the second bit

    // First Half Adder for a[0] and b[0]
    HalfAdder1 HA1 (a[0], b[0], sum[0], c1);

    // Second Half Adder for a[1] and b[1]
    HalfAdder1 HA2 (a[1], b[1], sum1, c2);

    // Sum and carry-out logic
    assign sum[1] = sum1 ^ c1;

endmodule

