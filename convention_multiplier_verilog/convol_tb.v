`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:31:40 12/09/2024
// Design Name:   convolution_3x3
// Module Name:   F:/mini_project_final/convolution_vedic_convention/convol_tb.v
// Project Name:  convolution_vedic_convention
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: convolution_3x3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module image_convol_tb;
     // Inputs
	reg [7:0] in_matrix_0;
	reg [7:0] in_matrix_1;
	reg [7:0] in_matrix_2;
	reg [7:0] in_matrix_3;
	reg [7:0] in_matrix_4;
	reg [7:0] in_matrix_5;
	reg [7:0] in_matrix_6;
	reg [7:0] in_matrix_7;
	reg [7:0] in_matrix_8;
   reg[71:0] kernel;
	// Outputs
	  wire [15:0]conv_result;
	  reg [7:0] image_data_r [0:479][0:639];
	  reg [7:0] image_data_g [0:479][0:639];
	  reg [7:0] image_data_b [0:479][0:639];
	  //integer i,j,data_r,data_g,data_b,file_id_r,file_id_b,file_id_g,file_r,file_g,file_b;
	// Instantiate the Unit Under Test (UUT)
	convolution_3x3_convention uut (
		.in_matrix_0(in_matrix_0), 
		.in_matrix_1(in_matrix_1), 
		.in_matrix_2(in_matrix_2), 
		.in_matrix_3(in_matrix_3), 
		.in_matrix_4(in_matrix_4), 
		.in_matrix_5(in_matrix_5), 
		.in_matrix_6(in_matrix_6), 
		.in_matrix_7(in_matrix_7), 
		.in_matrix_8(in_matrix_8), 
		.kernel(kernel),
		.conv_result(conv_result)
	);

	initial begin
	
	
	
kernel[7:0]=-1;
	kernel[15:8]=-1;
   kernel[23:16]=-1;
	
	kernel[31:24]=-1;
	kernel[39:32]=9;
   kernel[47:40]=-1;
	
	kernel[55:48]=-1;
	kernel[63:56]=-1;
   kernel[71:64]=-1;	
        file_id_r = $fopen("red_channel.txt","r");
		  file_id_g = $fopen("green_channel.txt", "r");
        file_id_b = $fopen("blue_channel.txt", "r");

	     file_r= $fopen("red_output.txt", "w");
		  file_g= $fopen("green_output.txt", "w");
		  file_b= $fopen("blue_output.txt", "w");
          

	 for(i=0;i<480;i=i+1)
	 for(j=0;j<640;j=j+1)
	 begin
	 #1
	 $fscanf(file_id_r,"%d",data_r);
	 image_data_r[i][j]=data_r;
	 
	 $fscanf(file_id_g,"%d",data_g);
	 image_data_g[i][j]=data_g;

	 $fscanf(file_id_b,"%d",data_b);
	 image_data_b[i][j]=data_b;

    end
    $fclose(file_id_r);
	 $fclose(file_id_g);
    $fclose(file_id_b);

    
	 for(i=0;i<478;i=i+1)
	 for(j=0;j<638;j=j+1)
	 begin
	 #0.5
	 in_matrix_0=image_data_r[i][j];
	 in_matrix_1=image_data_r[i][j+1];
	 in_matrix_2=image_data_r[i][j+2];
	 
	 in_matrix_3=image_data_r[i+1][j];
	 in_matrix_4=image_data_r[i+1][j+1];
	 in_matrix_5=image_data_r[i+1][j+2];
	 
	 in_matrix_6=image_data_r[i+2][j];
	 in_matrix_7=image_data_r[i+2][j+1];
	 in_matrix_8=image_data_r[i+2][j+2];
	 #0.5
	 $fwrite(file_r,"%b ",conv_result);
        // Writing decimal numbers to file	 
    
    #0.5
	 in_matrix_0=image_data_g[i][j];
	 in_matrix_1=image_data_g[i][j+1];
	 in_matrix_2=image_data_g[i][j+2];
	 
	 in_matrix_3=image_data_g[i+1][j];
	 in_matrix_4=image_data_g[i+1][j+1];
	 in_matrix_5=image_data_g[i+1][j+2];
	 
	 in_matrix_6=image_data_g[i+2][j];
	 in_matrix_7=image_data_g[i+2][j+1];
	 in_matrix_8=image_data_g[i+2][j+2];
	 #0.5
	 $fwrite(file_g,"%b ",conv_result);
    #0.5
	 in_matrix_0=image_data_b[i][j];
	 in_matrix_1=image_data_b[i][j+1];
	 in_matrix_2=image_data_b[i][j+2];
	 
	 in_matrix_3=image_data_b[i+1][j];
	 in_matrix_4=image_data_b[i+1][j+1];
	 in_matrix_5=image_data_b[i+1][j+2];
	 
	 in_matrix_6=image_data_b[i+2][j];
	 in_matrix_7=image_data_b[i+2][j+1];
	 in_matrix_8=image_data_b[i+2][j+2];
	 #0.5
	 $fwrite(file_b,"%b ",conv_result);
	 end
	 
	 
	 $fclose(file_r);
	 $fclose(file_g);
	 $fclose(file_b);


 end 
//      
endmodule

