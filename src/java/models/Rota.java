/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import conexao.MysqlDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author guidotti
 */
public class Rota {

   private int id_routeidrone;
   private String name_routeidrone; 
   private int user_id_user;

    public Rota(int id_routeidrone, String name_routeidrone, int user_id_user) {
        this.id_routeidrone = id_routeidrone;
        this.name_routeidrone = name_routeidrone;
        this.user_id_user = user_id_user;
    }

    public Rota(String name_routeidrone, int user_id_user) {
        this.name_routeidrone = name_routeidrone;
        this.user_id_user = user_id_user;
    }

    public Rota() {
    }

    public int getId_routeidrone() {
        return id_routeidrone;
    }

    public void setId_routeidrone(int id_routeidrone) {
        this.id_routeidrone = id_routeidrone;
    }

    public String getName_routeidrone() {
        return name_routeidrone;
    }

    public void setName_routeidrone(String name_routeidrone) {
        this.name_routeidrone = name_routeidrone;
    }

    public int getUser_id_user() {
        return user_id_user;
    }

    public void setUser_id_user(int user_id_user) {
        this.user_id_user = user_id_user;
    }
   
   public boolean cadastroRota(int id_user) throws SQLException{

        boolean statusCadRota = false;
        MysqlDB banco = new MysqlDB();               
        banco.connect();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = null;    
        
        this.setUser_id_user(id_user); // Aqui iremos pegar o ID do Usuário para ser inserido no BD
                     
    try {
              
       sql = "INSERT INTO routeidrone(name_routeidrone, user_id_user)"
                + "VALUES(?,?);";   
  
      
       
        ps = banco.conn.prepareStatement(sql);
 
        ps.setString(1, getName_routeidrone());
        ps.setInt(2, getUser_id_user());
        
        
        ps.executeUpdate();
        ps.close();  
      
        statusCadRota = true;
    }catch(SQLException e){
       System.out.println("Exception is ;"+e);
    }
    

    
 return statusCadRota;    

}
    public boolean validarNome(String name) throws SQLException{
        boolean valido = true;
        MysqlDB banco = new MysqlDB();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = null;
        
        banco.connect();              
        
        int linhas = 0; 
        try{  
            // Aqui pegamos o              
            sql = "SELECT id_routeidrone FROM routeidrone WHERE name_routeidrone = '" +  name + "' and user_id_user = " + user_id_user;   
            ps = banco.conn.prepareStatement(sql);
            rs = ps.executeQuery(sql);            
            while(rs.next()){
                linhas += 1;
            }
            if(linhas > 0){
                valido = false;
            }
        } catch(SQLException e){
            System.out.println("Erro ao validar nome;"+e);
        }
        banco.disconnect();
        return valido;   
    }
    
    public List<Rota> visualizar(String id_user) {
        List<Rota> lp = new ArrayList<Rota>();

        try {
            MysqlDB banco = new MysqlDB();               
            banco.connect();
            PreparedStatement ps = null;
            ResultSet rs = null;
            String sql = null; 
            String id_user_rota = id_user;
            
            ps = banco.conn.prepareStatement("SELECT * FROM routeidrone WHERE user_id_user = " + id_user_rota);
            rs = ps.executeQuery();
                      
            if (!rs.next()) {
                System.out.println("Não existem Rotas Cadastrados");
            } else {
                rs.beforeFirst();
                while (rs.next()) {
                    Rota p = new Rota();                    
                    p.setId_routeidrone(rs.getInt(1));
                    p.setName_routeidrone(rs.getString(2));                                        
                    lp.add(p);
                }
            }
        } catch (SQLException exception) {
            System.out.println("Impossivel visualizar Rotas " + exception);
        }
        return lp;
    }    


    
}
