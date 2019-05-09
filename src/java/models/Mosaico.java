package models;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Scanner;
import java.util.concurrent.Executors;
import conexao.MysqlDB;
import conexao.MysqlQuery;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author guidotti
 */
public class Mosaico {

    private int id_mosaico;
    private String name_mosaico;
    private String img_mosaico;
    private int user_id_user;

    private boolean mosaicGerated = false;

    public Mosaico(int mosaico, String name_mosaico, String img_mosaico, int user_id_user) {
        this.id_mosaico = id_mosaico;
        this.name_mosaico = name_mosaico;
        this.img_mosaico = img_mosaico;
        this.user_id_user = user_id_user;
    }

    public Mosaico(String name_mosaico, String img_mosaico, int user_id_user) {
        this.name_mosaico = name_mosaico;
        this.img_mosaico = img_mosaico;
        this.user_id_user = user_id_user;
    }

    public Mosaico() {

    }

    public int getId_mosaico() {
        return id_mosaico;
    }

    public void setId_mosaico(int id_mosaico) {
        this.id_mosaico = id_mosaico;
    }

    public String getName_mosaico() {
        return name_mosaico;
    }

    public void setName_mosaico(String name_mosaico) {
        this.name_mosaico = name_mosaico;
    }

    public String getImg_mosaico() {
        return img_mosaico;
    }

    public void setImg_mosaico(String img_mosaico) {
        this.img_mosaico = img_mosaico;
    }

    public int getUser_id_user() {
        return user_id_user;
    }

    public void setUser_id_user(int user_id_user) {
        this.user_id_user = user_id_user;
    }

    public boolean isMosaicGerated() {
        return mosaicGerated;
    }

    public void setMosaicGerated(boolean mosaicGerated) {
        this.mosaicGerated = mosaicGerated;
    }

    public void carregarMosaico(String key) throws SQLException {
        int id = 0;
        try {
            id = (int) Integer.parseInt(key);
            
        } catch (NumberFormatException nfe) {
            id = 0;
            
        }
        MysqlDB banco = new MysqlDB();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = null;
        
        banco.connect();
        try {
            if(id == 0){
                sql = "SELECT * FROM mosaico WHERE name_mosaico = '" + key + "' and user_id_user = " + user_id_user;   
            } else{
                sql = "SELECT * FROM mosaico WHERE id_mosaico = " + id + " and user_id_user = " + user_id_user;
            }
            ps = banco.conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                this.id_mosaico = rs.getInt(1);
                this.name_mosaico = rs.getString(2);
                this.img_mosaico = rs.getString(3);
                this.user_id_user = rs.getInt(4);
            }
            banco.disconnect();
        } catch (SQLException e) {
            System.out.println("caiuu");
            System.out.println("Erro ao recuperar mosaico;" + e);
        }
    }

    public List<Mosaico> visualizar(int id_user) {
        List<Mosaico> mosaicos = new ArrayList<Mosaico>();

        try {
            MysqlDB banco = new MysqlDB();
            banco.connect();
            PreparedStatement ps = null;
            ResultSet rs = null;
            String sql = null;

            ps = banco.conn.prepareStatement("SELECT * FROM mosaico WHERE user_id_user = " + id_user);
            rs = ps.executeQuery();

            if (!rs.next()) {
                System.out.println("Não foi encontrado mosaicos");
            } else {
                rs.beforeFirst();
                while (rs.next()) {
                    Mosaico m = new Mosaico();
                    m.setId_mosaico(rs.getInt(1));
                    m.setName_mosaico(rs.getString(2));
                    mosaicos.add(m);
                }
            }
        } catch (SQLException exception) {
            System.out.println("Impossivel visualizar Linhas de cultivo " + exception);
        }
        return mosaicos;
    }

    private int getMaxIdMosaico() throws SQLException {
        boolean status = false;
        MysqlDB banco = new MysqlDB();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = null;

        banco.connect();

        int id_mosaico = 0;
        try {
            // Aqui pegamos o              
            sql = "SELECT MAX(id_mosaico) FROM mosaico WHERE user_id_user = " + this.user_id_user;
            ps = banco.conn.prepareStatement(sql);
            rs = ps.executeQuery(sql);
            while (rs.next()) {
                id_mosaico = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Erro ao recuperar maior id;" + e);
        }
        banco.disconnect();
        //System.out.println("id_mosaico>>" + id_mosaico);
        return id_mosaico;
    }

    public boolean validarNome(String name) throws SQLException {
        boolean valido = true;
        MysqlDB banco = new MysqlDB();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = null;

        banco.connect();

        int linhas = 0;
        try {
            // Aqui pegamos o              
            sql = "SELECT id_mosaico FROM mosaico WHERE name_mosaico = '" + name + "' and user_id_user = " + user_id_user;
            ps = banco.conn.prepareStatement(sql);
            rs = ps.executeQuery(sql);
            while (rs.next()) {
                linhas += 1;
            }
            if (linhas > 0) {
                valido = false;
            }
        } catch (SQLException e) {
            System.out.println("Erro ao validar nome;" + e);
        }
        banco.disconnect();
        return valido;
    }
    public boolean exits() throws SQLException{
        boolean exits = false;
        MysqlDB banco = new MysqlDB();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = null;

        banco.connect();

       
        banco.disconnect();
        
        return exits;
    }

    public boolean mosaico(int id_user) throws SQLException {

        boolean statusMosaico = false;
        MysqlDB banco = new MysqlDB();
        banco.connect();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = null;

        this.setUser_id_user(id_user);
        int id_mosaico = getMaxIdMosaico() + 1;
        try {

            sql = "INSERT INTO mosaico(id_mosaico,name_mosaico, img_mosaico, user_id_user)"
                    + "VALUES(?,?,?,?);";

            ps = banco.conn.prepareStatement(sql);

            ps.setInt(1, id_mosaico);
            ps.setString(2, getName_mosaico());
            ps.setString(3, getImg_mosaico());
            ps.setInt(4, getUser_id_user());

            ps.executeUpdate();
            ps.close();

            statusMosaico = true;
            this.id_mosaico = id_mosaico;
        } catch (SQLException e) {
            System.out.println("Exception is ;" + e);
        }

        return statusMosaico;

    }
   
    public void exec(String pasta) throws IOException, InterruptedException {

        
        String ABSOLUTE_PATH = System.getProperty("user.home") + "/mosaico/";
        String ABSOLUTE_PATH_IMG = System.getProperty("user.home") + "/tempOD/"+user_id_user+"/";
        String PATH_IMG_RESULT = System.getProperty("user.home") + "/od_images_mosaico/";
        
        
        String PATH_IMG_APP = "/opt/odrone-env/tomcat/webapps/ROOT/images/od_images_mosaico/"+user_id_user+"/";                
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
        
        String path_images = ABSOLUTE_PATH_IMG; // Pasta criada para descompactar os arquivos

        aplication = Runtime.getRuntime().exec("python3 " + ABSOLUTE_PATH + "gps.py " + path_images, null, new File(ABSOLUTE_PATH_IMG));


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

            File file = new File(ABSOLUTE_PATH + "resultado.png");
            while (!file.exists()) {
                try {
                    // Aguarde 5 segundos
                    Thread.sleep(2000);
                } catch (InterruptedException ex) {
                    Logger.getLogger(Mosaico.class.getName()).log(Level.SEVERE, null, ex);
                }
                file = new File(ABSOLUTE_PATH + "resultado.png");
            }
        });

        aplication.waitFor();

        mosaicGerated = true;
        
        String path_result_temp = ABSOLUTE_PATH_IMG; // Linux        
        String path_result_final = PATH_IMG_RESULT; // Linux
        
        String path_result_app = PATH_IMG_APP; // Copiar a imagem para a pasta images da aplicação

        Mosaico.copy(new File(path_result_temp + "resultado.png"), new File(path_result_final + name_mosaico));
      
        // Linha que serve para execução da aplicação apenas na VM
        Mosaico.copy(new File(path_result_temp + "resultado.png"), new File(path_result_app + name_mosaico));  
        

    }

    public void saveOneMosaicoLoaded(File source, File dest) throws IOException {
        Mosaico.copy(source, dest);
    }

    private static void copy(File source, File dest) throws IOException {
        Files.copy(source.toPath(), dest.toPath());
    }
}
