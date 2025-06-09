`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:28:10 12/09/2024 
// Design Name: 
// Module Name:    two_complement_16 
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
module two_complement_16(
    input [15:0] a,
    output [15:0] b
    );
assign b[0]=a[0];
assign b[1]=a[0]^a[1];
wire p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13;

assign p0=a[0]|a[1];
assign b[2]=a[2]^p0;
 
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

assign p6=p5|a[7];
assign b[8]=a[8]^p6;

assign p7=p6|a[8];
assign b[9]=a[9]^p7;

assign p8=p7|a[9];
assign b[10]=a[10]^p8;

assign p9=p8|a[10];
assign b[11]=a[11]^p9;

assign p10=p9|a[11];
assign b[12]=a[12]^p10;

assign p11=p10|a[12];
assign b[13]=a[13]^p11;

assign p12=p11|a[13];
assign b[14]=a[14]^p12;

assign p13=p12|a[14];
assign b[15]=a[15]^p13;
endmodule
