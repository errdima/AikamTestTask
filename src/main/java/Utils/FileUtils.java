package Utils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class FileUtils {
    public static String readFile (String path) {
        StringBuilder sb = new StringBuilder();
        try(BufferedReader reader = new BufferedReader(new java.io.FileReader(path))) {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return sb.toString();
    }

    public static void writeJSONFile (String result, String file){
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))){
            writer.write(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
