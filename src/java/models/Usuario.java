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

/**
 *
 * @author guidotti
 */
public class Usuario {
    
   
  private int id_user;
  private String name_user;
  private String email_user;
  private String yearb_user;
  private String pass_user;
  private String country_user;

    public Usuario(int id_user, String name_user, String email_user, String yearb_user, String pass_user, String country_user) {
        this.id_user = id_user;
        this.name_user = name_user;
        this.email_user = email_user;
        this.yearb_user = yearb_user;
        this.pass_user = pass_user;
        this.country_user = country_user;
    }   

    public Usuario(String name_user, String email_user, String yearb_user, String pass_user, String country_user) {
        this.name_user = name_user;
        this.email_user = email_user;
        this.yearb_user = yearb_user;
        this.pass_user = pass_user;
        this.country_user = country_user;
    }
   
    public Usuario() {
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }
    
    public String getName_user() {
        return name_user;
    }

    public void setName_user(String name_user) {
        this.name_user = name_user;
    }

    public String getEmail_user() {
        return email_user;
    }

    public void setEmail_user(String email_user) {
        this.email_user = email_user;
    }

    public String getYearb_user() {
        return yearb_user;
    }

    public void setYearb_user(String yearb_user) {
        this.yearb_user = yearb_user;
    }

    public String getPass_user() {
        return pass_user;
    }

    public void setPass_user(String pass_user) {
        this.pass_user = pass_user;
    }

    public String getCountry_user() {
        return country_user;
    }

    public void setCountry_user(String country_user) {
        this.country_user = country_user;
    }

 public boolean logar() throws SQLException{
        
        boolean statusLogin = false;
        MysqlDB banco = new MysqlDB();               
        banco.connect();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = null;
             
        sql = "SELECT * from user where email_user = '" + getEmail_user() + "' and pass_user = '"+ getPass_user()+"';";

        
        ps = banco.conn.prepareStatement(sql);
        
        rs = ps.executeQuery(sql);
        while(rs.next()){
                    
            this.id_user = rs.getInt(1);
            this.name_user = rs.getString(2);
            this.email_user = rs.getString(3);
            this.yearb_user = rs.getString(4);
            this.pass_user = rs.getString(5);
            this.country_user = rs.getString(6);           
            
            statusLogin = true;
        }
        
        banco.disconnect();
        return statusLogin;
    }
   
public boolean cadastroUser() throws SQLException{

        boolean statusCadUser = false;
        MysqlDB banco = new MysqlDB();               
        banco.connect();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = null;    
             
    try {
              
       sql = "INSERT INTO user(name_user,email_user,yearb_user,pass_user,country_user)"
                + "VALUES(?,?,?,?,?);";   
      
      
        ps = banco.conn.prepareStatement(sql);
 
        ps.setString(1, getName_user());
        ps.setString(2, getEmail_user());
        ps.setString(3, getYearb_user());
        ps.setString(4, getPass_user());        
        ps.setString(5, getCountry_user());        
        
        ps.executeUpdate();
        ps.close();  
      
        statusCadUser = true;
    }catch(SQLException e){
       System.out.println("Exception is ;"+e);
    }
    
    
 return statusCadUser;    

}
 
    
    
    
}
