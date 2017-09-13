# Internet-Technology
 
Project: <br />
Input two images in the form of text files that contain their pixel values in hexadecimal format <br />
gspic: Green screen picture. <br />
bkpic: Background picture. <br />
Print output that changes only the green part of gspic to the bkpic. <br />

greenred.png - input image which has green and red pixels (i.e. to be treated as the greenscreen picture) <br />
blue.png - input image which has blue pixels (i.e. to be treated as the the background picture) <br />
ConvertImageToText.java - code to convert images to text files <br />
gs.txt - input to verilog program with pixels of greenscreen in hex format <br />
bk.txt - input to verilog program with pixels of background in hex format <br />
gs_argb.txt - decimal format of alpha,red,green,blue values in greenscreen, used to manually see that verilog output is correct <br />
bk_argb.txt - decimal format of alpha,red,green,blue values in background, used to manually see that verilog output is correct <br />
pixelchanger.v - verilog code to change the pixels <br />
OUTPUT from pixel changer.txt - the output from pixel changer shows each pixel value in a table that specifies the picture it was taken from (GS for green screen picture, BK for background picture), the pixel number, and the alpha, red, green and blue value of that pixel <br />
pixelchanger_behav.wcfg - the waveform file from simulation <br />
simulation screenshot <br />
