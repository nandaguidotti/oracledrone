
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 *
 * @author vinicius
 */
public class Unzip_File_Folder {

    List fileList;
    private String INPUT_ZIP_FILE;
    private String OUTPUT_FOLDER;

    public Unzip_File_Folder(String INPUT_ZIP_FILE, String OUTPUT_FOLDER) {
        this.INPUT_ZIP_FILE = INPUT_ZIP_FILE;
        this.OUTPUT_FOLDER = OUTPUT_FOLDER;
        this.unZipIt(INPUT_ZIP_FILE, OUTPUT_FOLDER);
    }

    public void unZipIt(String zipFile, String outputFolder) {
        System.out.println("===> Inicio da descompactação do arquivo zip <===");
        System.out.println("zipFile => " + zipFile);
        byte[] buffer = new byte[1024];

        try {

            // Cria o input do arquivo ZIP
            ZipInputStream zinstream = new ZipInputStream(new FileInputStream(zipFile));

            // Pega a proxima entrada do arquivo
            ZipEntry zentry = zinstream.getNextEntry();

            // Enquanto existir entradas no ZIP
            while (zentry != null) {
                // Pega o nome da entrada
                String entryName = zentry.getName();
                System.out.println("entryName => "+entryName);
                
                if(entryName.indexOf("/") != -1 && entryName.indexOf(".") != -1){
                    String[] nameArray = entryName.split("/");
                    entryName = nameArray[nameArray.length-1];
                
                    // Cria o output do arquivo , Sera extraido onde esta rodando a classe
                    FileOutputStream outstream = new FileOutputStream(outputFolder+entryName);
                    int n;

                    // Escreve no arquivo
                    while ((n = zinstream.read(buffer)) > -1) {
                        outstream.write(buffer, 0, n);

                    }

                    // Fecha arquivo
                    outstream.close();
                }
                // Fecha entrada e tenta pegar a proxima
                zinstream.closeEntry();
                zentry = zinstream.getNextEntry();
            }

            // Fecha o zip como um todo
            zinstream.close();

            System.out.println("Done");
        } catch (IOException ex) {
            ex.printStackTrace();
        }

        System.out.println("===> Fim da descompactação do arquivo zip <===");
    }

}