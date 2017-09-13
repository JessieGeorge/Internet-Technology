# Internet-Technology

Project:
Input two images in the form of text files that contain their pixel values in hexadecimal format
gspic: Green screen picture.
bkpic: Background picture.
Print output that changes only the green part of gspic to the bkpic. 

greenred.png - input image which has green and red pixels (i.e. to be treated as the greenscreen picture)
blue.png - input image which has blue pixels (i.e. to be treated as the the background picture)
ConvertImageToText.java - code to convert images to text files
gs.txt - input to verilog program with pixels of greenscreen in hex format
bk.txt - input to verilog program with pixels of background in hex format
gs_argb.txt - decimal format of alpha,red,green,blue values in greenscreen, used to manually see that verilog output is correct
bk_argb.txt - decimal format of alpha,red,green,blue values in background, used to manually see that verilog output is correct
pixelchanger.v - verilog code to change the pixels
output from pixel changer
pixelchanger_behav.wcfg - the waveform file from simulation
simulation screenshot
