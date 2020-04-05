import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class FileName {
    public static void main(String variables[]) {
        if (variables[0].equals("Check.FileName.Lock")) {
            FileName fn = new FileName();
            fn.checkCanLock(variables[1]);
        }
    }

    public int writeFile(String path, String content) {
        try {
            File file = new File(path);
            FileWriter filewriter = new FileWriter(file);
            filewriter.write(content);
            filewriter.close();
            return 1;
        } catch(IOException e){
            System.out.println(e);
            return 0;
        }
    }

    public void checkCanLock(String filepath) {
        if (filepath.contains(" ")||filepath.contains("　")) {
            writeFile("system\\temp\\checkCanLock.log", "ERROR: ファイルパスに空白を含めることはできません!");
        } if (filepath.contains("\"")) {
            writeFile("system\\temp\\checkCanLock.log", "ERROR: ファイルパスにダブルクォーテーション(\")を含めることはできません!");
        } else {
            writeFile("system\\temp\\checkCanLock.log", "PASS");
        }
    }
}