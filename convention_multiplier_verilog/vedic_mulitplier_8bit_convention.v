`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:15:36 12/10/2024 
// Design Name: 
// Module Name:    vedic_mulitplier_8bit_convention 
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
module vedic_multiplier_8bit_convention (
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
    //wire [3:0] temp,temp3,temp4,sum1;
    wire [5:0]temp1,temp2,temp3,temp4,sum1;	 
    //wire [3:0]temp1,temp2;
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
    CLA_6bit c4(temp1,temp2,temp5);
	 CLA_6bit c5(temp3,temp4,temp6);
	 CLA_6bit c6(temp5,temp6,sum1);
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
