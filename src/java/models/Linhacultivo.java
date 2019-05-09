package models;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import conexao.MysqlDB;
import java.awt.Image;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;
import java.util.concurrent.Executors;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author guidotti
 */
public class Linhacultivo {

    private int id_linhacultivo;
    private String name_linhacultivo;
    private int qtd_arbole;
    private String img_linhacultivo;
    private int user_id_user;
    private int id_mosaico;

    private boolean linhaGerated = false;

    public Linhacultivo(int id_linhacultivo, String name_linhacultivo, int qtd_arbole, String img_linhacultivo, int user_id_user) {
        this.id_linhacultivo = id_linhacultivo;
        this.name_linhacultivo = name_linhacultivo;
        this.qtd_arbole = qtd_arbole;
        this.img_linhacultivo = img_linhacultivo;
        this.user_id_user = user_id_user;
    }

    public Linhacultivo(String name_linhacultivo, int qtd_arbole, String img_linhacultivo, int user_id_user) {
        this.name_linhacultivo = name_linhacultivo;
        this.qtd_arbole = qtd_arbole;
        this.img_linhacultivo = img_linhacultivo;
        this.user_id_user = user_id_user;
    }

    public Linhacultivo() {

    }

    public int getId_linhacultivo() {
        return id_linhacultivo;
    }

    public void setId_linhacultivo(int id_linhacultivo) {
        this.id_linhacultivo = id_linhacultivo;
    }

    public String getName_linhacultivo() {
        return name_linhacultivo;
    }

    public void setName_linhacultivo(String name_linhacultivo) {
        this.name_linhacultivo = name_linhacultivo;
    }

    public int getQtd_arbole() {
        return qtd_arbole;
    }

    public void setQtd_arbole(int qtd_arbole) {
        this.qtd_arbole = qtd_arbole;
    }

    public String getImg_linhacultivo() {
        return img_linhacultivo;
    }

    public void setImg_linhacultivo(String img_linhacultivo) {
        this.img_linhacultivo = img_linhacultivo;
    }

    public int getUser_id_user() {
        return user_id_user;
    }

    public void setUser_id_user(int user_id_user) {
        this.user_id_user = user_id_user;
    }

    public int getId_mosaico() {
        return id_mosaico;
    }

    public void setId_mosaico(int id_mosaico) {
        this.id_mosaico = id_mosaico;
    }

    public boolean isLinhaGerated() {
        return linhaGerated;
    }

    public void setLinhaGerated(boolean linhaGerated) {
        this.linhaGerated = linhaGerated;
    }
    
    public boolean exits() throws SQLException{
        boolean exits = false;
        MysqlDB banco = new MysqlDB();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = null;

        banco.connect();

        try {
            // Aqui pegamos o              
            sql = "SELECT * FROM linhacultivo WHERE id_mosaico = '"+this.id_mosaico+"' and user_id_user = " + this.user_id_user;

            //System.out.println("Sql>> "+sql);
            ps = banco.conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                this.name_linhacultivo = rs.getString(2);
                this.qtd_arbole = rs.getInt(3);
                this.img_linhacultivo = rs.getString(4);
                
                exits = true;
            }
        } catch (SQLException e) {
            System.out.println("Erro ao recuperar maior id;" + e);
        }
        banco.disconnect();
        
        return exits;
    }

    public void exec(String pasta) throws IOException, InterruptedException {

        String ABSOLUTE_PATH = System.getProperty("user.home") + "/linhacultivo/";
        String PATH_IMG_RESULT = System.getProperty("user.home") + "/od_images_linhacultivo/";
        
        
        String PATH_IMG_APP = "/opt/odrone-env/tomcat/webapps/ROOT/images/img_linha_cultivo/"+user_id_user+"/";                
        File F_PATH_IMG_RESULT_APP = new File(PATH_IMG_APP);
        if (!F_PATH_IMG_RESULT_APP.exists()) {
           F_PATH_IMG_RESULT_APP.mkdir();
        }       


        File F_PATH_IMG_RESULT_Geral = new File(PATH_IMG_RESULT);
        if (!F_PATH_IMG_RESULT_Geral.exists()) {
            F_PATH_IMG_RESULT_Geral.mkdir();
        }
        PATH_IMG_RESULT += user_id_user+"/";
        File F_PATH_IMG_RESULT = new File(PATH_IMG_RESULT);
        if (!F_PATH_IMG_RESULT.exists()) {
            F_PATH_IMG_RESULT.mkdir();
        }
        
        

        Process aplication;     

        aplication = Runtime.getRuntime().exec("python3 " + ABSOLUTE_PATH + "metodo.py " + pasta, null, new File(ABSOLUTE_PATH)); // linux


        Executors.newSingleThreadExecutor().execute(() -> {
            Scanner sc = new Scanner(aplication.getInputStream());
            while (sc.hasNextLine()) {
                System.out.println(sc.nextLine());
                System.out.flush();
            }
        });
        Executors.newSingleThreadExecutor().execute(() -> {
            Scanner sc = new Scanner(aplication.getErrorStream());
            while (sc.hasNextLine()) {
                System.err.println(sc.nextLine());
                System.err.flush();
            }

            File file = new File(ABSOLUTE_PATH + "result.png");
            while (!file.exists()) {
                try {
                    // Aguarde 5 segundos
                    Thread.sleep(5000);
                } catch (InterruptedException ex) {
                    Logger.getLogger(Mosaico.class.getName()).log(Level.SEVERE, null, ex);
                }
                file = new File(ABSOLUTE_PATH + "result.png");
            }
        });

        aplication.waitFor();       
                
        Linhacultivo.copy(new File(ABSOLUTE_PATH + "result.png"), new File(PATH_IMG_RESULT + name_linhacultivo + ".png"));
        
        
        // As linhas 205 e 206 servem apenas para executar na VM pois o caminho da pasta onde as imagens vão ficar é feito com essas duas linhas + as linhas 150 a 154
        String path_result_app = PATH_IMG_APP; // Copiar a imagem para a pasta images da aplicação
        Linhacultivo.copy(new File(ABSOLUTE_PATH + "result.png"), new File(path_result_app + name_linhacultivo + ".png"));
        
        Thread.sleep(3000);

        // Leitura do arquivo result.txt
        try {
            FileReader arq = new FileReader(ABSOLUTE_PATH + "result.txt");
            BufferedReader lerArq = new BufferedReader(arq);

            String linha = lerArq.readLine(); // lê a primeira linha
            // a variável "linha" recebe o valor "null" quando o processo
            // de repetição atingir o final do arquivo texto
            while (linha != null) {
                this.qtd_arbole = (int) Integer.parseInt(linha);
                System.out.printf("%d\n", qtd_arbole);

                linha = lerArq.readLine(); // lê da segunda até a última linha
            }

            arq.close();
        } catch (IOException e) {
            System.err.printf("Erro na abertura do arquivo: %s.\n",
                    e.getMessage());
        }

        linhaGerated = true;

       // System.out.println("Finalizado com sucesso");

    }

    private static void copy(File source, File dest) throws IOException {
        Files.copy(source.toPath(), dest.toPath());
    }

    public boolean salvarLinhaCultivo() throws SQLException {
        boolean status_linhacultivo = false;

        MysqlDB banco = new MysqlDB();
        banco.connect();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = null;

        this.id_linhacultivo = getMaxIdLinhaCultivo() + 1;
        try {

            sql = "INSERT INTO linhacultivo(id_linhacultivo,name_linhacultivo, qtd_arbole, img_linhacultivo, user_id_user, id_mosaico)"
                    + " VALUES(?,?,?,?,?,?);";

            ps = banco.conn.prepareStatement(sql);

            ps.setInt(1, this.id_linhacultivo);
            ps.setString(2, this.name_linhacultivo);
            ps.setInt(3, this.qtd_arbole);
            ps.setString(4, this.img_linhacultivo);
            ps.setInt(5, this.user_id_user);
            ps.setInt(6, this.id_mosaico);
            //System.out.println("sql>> "+ sql);
            //System.out.println(ps.toString());
            ps.executeUpdate();
            ps.close();

            status_linhacultivo = true;

        } catch (SQLException e) {
            System.out.println("Exception is ;" + e);
        }

        return status_linhacultivo;

    }

    private int getMaxIdLinhaCultivo() throws SQLException {
        boolean status = false;
        MysqlDB banco = new MysqlDB();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = null;

        banco.connect();

        int id_linhacultivo = 0;
        try {
            // Aqui pegamos o              
            sql = "SELECT MAX(id_linhacultivo) FROM linhacultivo WHERE user_id_user = " + this.user_id_user;
            ps = banco.conn.prepareStatement(sql);
            rs = ps.executeQuery(sql);
            while (rs.next()) {
                id_linhacultivo = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Erro ao recuperar maior id;" + e);
        }
        banco.disconnect();
       // System.out.println("id_linhacultivo>>" + id_linhacultivo);
        return id_linhacultivo;
    }

}
