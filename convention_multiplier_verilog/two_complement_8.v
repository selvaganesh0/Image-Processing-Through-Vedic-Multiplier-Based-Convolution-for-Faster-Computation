`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:27:15 12/09/2024 
// Design Name: 
// Module Name:    two_complement_8 
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
module two_complement_8(
    input [7:0] a,
    output [7:0] b
    );
	 
assign b[0]=a[0];
assign b[1]=a[0]^a[1];
wire p0;
assign p0=a[0]|a[1];
assign b[2]=a[2]^p0;
wire p1,p2,p3,p4,p5,p6;
assign p1=p0|a[2];
assign b[3]=a[3]^p1;
assign p2=p1|a[3];
assign b[4]=a[4]^p2;
assign p3=p2|a[4];
assign b[5]=a[5]^p3;
assign p4=p3|a[5];
assign b[6]=a[6]^p4;

assign p5=p4|a[6];
assign b[7]=a[7]^p5;






endmodule
