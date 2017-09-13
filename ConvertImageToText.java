import java.awt.image.*;
import javax.imageio.ImageIO;
import java.io.*;

//convert an image to a text file containing the pixel values
public class ConvertImageToText {
	public static void main(String[] args) throws FileNotFoundException, IOException
    {
        File output_file=new File("C:/Users/Jessie/Desktop/converter/bk_argb.txt");                   //Output Text file
        PrintStream out=new PrintStream(new FileOutputStream(output_file));
        System.setOut(out);
        BufferedImage image = readImage("C:/Users/Jessie/Desktop/converter/blue.png");               //Input Image file
        
        int width = image.getWidth();
        int height = image.getHeight();
        int[] rgb = null;
        rgb = image.getRGB(0, 0, width, height, rgb, 0, width);
        
        //printHexPixels(image, rgb);
        printARGBValues(image, rgb);
    }
     
	public static BufferedImage readImage(String fileLocation) throws IOException
    {
        BufferedImage img = null;
        img = ImageIO.read(new File(fileLocation));
        return img;
    }
	
	//print pixel as a hexadecimal value #aarrggbb. This will be fed into the verilog program.
    public static void printHexPixels(BufferedImage image, int[]rgb)
    {
    	int width = image.getWidth();
        int height = image.getHeight();
 
        int count = 0;
        int total_pix=width*height;
        for(int pixel : rgb)
        {
        	System.out.print(String.format("%08X", pixel));
            if(count<total_pix)       //To delete the line that generates at end of file
            {
                System.out.println("");
            }
            count++;
        }
        
    }
    
    //print pixel as decimal values of alpha, red, green and blue separately. This will be used to manually check output of verilog program.
    public static void printARGBValues(BufferedImage image, int[]rgb)
    {
    	int width = image.getWidth();
        int height = image.getHeight();
        
        int count = 0;
        int total_pix=width*height;
        int alpha, red, green, blue;
        
        for(int pixel : rgb)
        {
        	//the pixel will be #aarrggbb with each letter made of 4 bits, so right shift and mask
        	alpha = (pixel >> 24) & 0xFF;
        	red = (pixel >> 16) & 0xFF;
            green = (pixel >> 8 ) & 0xFF;
            blue = (pixel) & 0xFF;
            
            System.out.print(alpha+" "+red+" "+green+" "+blue); 
            if(count<total_pix)       //To delete the line that generates at end of file
            {
                System.out.println("");
            }
            count++;
        }
        
    }
    
}
