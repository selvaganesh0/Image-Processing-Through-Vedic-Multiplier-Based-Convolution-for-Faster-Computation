`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:18:10 12/09/2024 
// Design Name: 
// Module Name:    convolution 
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
/////////////////////////////////////////////////////////////////////////////////

module convolution_3x3_convention (
    input [7:0] in_matrix_0,
	 input [7:0] in_matrix_1,
	 input [7:0] in_matrix_2,
	 input [7:0] in_matrix_3,
	 input [7:0] in_matrix_4,
	 input [7:0] in_matrix_5,
	 input [7:0] in_matrix_6,
	 input [7:0] in_matrix_7,
	 input [7:0] in_matrix_8,
	 input[71:0]kernel,
    output[15:0]conv_result
 );

    // Internal register to store 3x3 kernel
     
    wire signed[15:0]pp[8:0];
    // Initialize the kernel
vedic_multiplier_8bit_convention w1(in_matrix_0,kernel[7:0],pp[0]);
vedic_multiplier_8bit_convention w2(in_matrix_1,kernel[15:8], pp[1]);
vedic_multiplier_8bit_convention w3(in_matrix_2,kernel[23:16], pp[2]);
vedic_multiplier_8bit_convention w4(in_matrix_3,kernel[31:24], pp[3]);
vedic_multiplier_8bit_convention w5(in_matrix_4,kernel[39:32], pp[4]);
vedic_multiplier_8bit_convention w6(in_matrix_5,kernel[47:40], pp[5]);
vedic_multiplier_8bit_convention w7(in_matrix_6,kernel[55:48], pp[6]);
vedic_multiplier_8bit_convention w8(in_matrix_7,kernel[63:56], pp[7]);
vedic_multiplier_8bit_convention w9(in_matrix_8,kernel[71:64], pp[8]);








wire [15:0]ppa[8:0];
wire [15:0]conv_result_prod;
assign ppa[0]=pp[0]+pp[1];
assign ppa[1]=pp[2]+pp[3];
assign ppa[2]=pp[4]+pp[5];
assign ppa[3]=pp[6]+pp[7];

assign ppa[4]=ppa[0]+ppa[1];
assign ppa[5]=ppa[2]+ppa[3];
assign ppa[6]=ppa[4]+ppa[5];
assign conv_result=ppa[6]+pp[8];
endmodule