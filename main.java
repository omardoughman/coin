import java.io.File;
import java.nio.file.Files;

public class main {
    public static void main(String[] args) throws Exception {
        System.out.println("Java Layer: Independent Mode Active.");
        
        File codec = new File("main.codec");
        while(true) {
            if(codec.exists()) {
                byte[] data = Files.readAllBytes(codec.toPath());
                System.out.println("Java: Detected new binary data from C Engine.");
                // Process data here
            }
            Thread.sleep(5000); // Check every 5 seconds
        }
    }
}
