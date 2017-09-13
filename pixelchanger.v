`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2017 05:10:29 PM
// Design Name: 
// Module Name: pixelchanger
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

/* Project:
Input two images in the form of text files that contain their pixel values in hexadecimal format
gspic: Green screen picture.
bkpic: Background picture.
Print output that changes only the green part of gspic to the bkpic. 
*/

module pixelchanger;
    
    //32 bits per pixel - alpha, red, green, blue. Subtract 1 since it starts from zero.
    //image has dimensions 30x25 = 750 pixels. Subtract 1 since it starts from zero.
    reg [31:0] gspic [0:749]; 
    reg [31:0] bkpic [0:749];
    
    integer i; //iterator
    
    integer A,R,G,B; //alpha, red, green, blue values
    
    integer mask = 255; //decimal equivalent of mask FF, to be used to extract argb values
    
    initial
    begin
    
    //text files contain the argb pixel values of image in hexadecimal format #aarrggbb where each letter takes 4 bits
    $readmemh("C:/Users/Jessie/Desktop/converter/gs.txt", gspic);
    $readmemh("C:/Users/Jessie/Desktop/converter/bk.txt", bkpic);
    
    $display("Picture   Pixel No.      Alpha       Red         Green       Blue"); //explaining output
    
    //run a loop through all pixels
    for(i=0; i<750; i=i+1)
    begin
          //extract alpha, red, green, blue values of gspic using masking
          assign A = (gspic[i] >> 24) & mask;
          assign R = (gspic[i] >> 16) & mask;
          assign G = (gspic[i] >> 8) & mask;
          assign B = gspic[i] & mask;
      
      if(G>=200 && R<200 && B<200) //green pixel in gspic should be replaced by pixel from bkpic
            begin
            //extract alpha, red, green, blue values of bkpic using masking
            assign A = (gspic[i] >> 24) & mask;
            assign R = (bkpic[i] >> 16) & mask;
            assign G = (bkpic[i] >> 8) & mask;
            assign B = bkpic[i] & mask;
            $display("BK %d = %d %d %d %d",i,A,R,G,B); //print background pixel
            end //if
            
      else //not a green pixel in gspic
            $display("GS %d = %d %d %d %d",i,A,R,G,B); //print greenscreen pixel
    end//for loop
    
    end//initial
endmodule
