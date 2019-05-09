/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import conexao.MysqlDB;
import conexao.MysqlQuery;
import java.io.File;
import java.io.FileNotFoundException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

/**
 *
 * @author guidotti
 */
public class Logidrone {
    
    
    public void gravaCSV(String pathArquivo, int id_user) throws SQLException{
        boolean status = false;
        MysqlDB banco = new MysqlDB();        
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = null;
        
        banco.connect();              
        
        int id_logidrone_user = id_user;
        int id_route = 0;
       File arquivoCSV = new File(pathArquivo);
        
        try{  
            // Aqui pegamos o              
            sql = "SELECT MAX(id_routeidrone) FROM routeidrone WHERE user_id_user = " +  id_logidrone_user;            
            ps = banco.conn.prepareStatement(sql);
            rs = ps.executeQuery(sql);            
            while(rs.next()){
                id_route = rs.getInt(1);
            }
                    
           // Aqui começa a preparação para o Insert em lote na Tabela Logidrone 
            MysqlQuery consulta = new MysqlQuery(banco.conn);            
                    
            Scanner leitor = new Scanner(arquivoCSV); 
            String linhasDoArquivo = new String();
            String inicio = null;            
            leitor.nextLine();           
            
            while(leitor.hasNext()){                
                //recebe cada linha do arquivo
                linhasDoArquivo = leitor.nextLine();
                //separa os campos entre as virgulas de cada linha
                String[] valoresEntreVirgulas = linhasDoArquivo.split(";");                
                             
       inicio = "INSERT INTO `logidrone`(`time`, `lat`, `lng`, `alt_rel`, `alt_abs`, `voltage_bat`, `current_bat`, `level_bat`, `pitch`, `yaw`, `roll`, `vx`, `vy`, `vz`, `fixtype`, `satellitesvisible`, `eph`, `epv`, `heading`, `groundspeed`, `airspeed`, `mode`, `system-status`, `armed`, `is-armable`, `ekf-ok`, `routeidrone_id_routeidrone`, `routeidrone_user_id_user`)";
 
       sql = inicio + "VALUES ('" + valoresEntreVirgulas[0]+"'" + "," 
                          + "'"+valoresEntreVirgulas[1]+"',"                   
                          + "'"+valoresEntreVirgulas[2]+"'," 
                          + "'"+valoresEntreVirgulas[3]+"'," 
                          + "'"+valoresEntreVirgulas[4]+"'," 
                          + "'"+valoresEntreVirgulas[5]+"'," 
                          + "'"+valoresEntreVirgulas[6]+"'," 
                          + "'"+valoresEntreVirgulas[7]+"'," 
                          + "'"+valoresEntreVirgulas[8]+"'," 
                          + "'"+valoresEntreVirgulas[9]+"'," 
                          + "'"+valoresEntreVirgulas[10]+"'," 
                          + "'"+valoresEntreVirgulas[11]+"'," 
                          + "'"+valoresEntreVirgulas[12]+"'," 
                          + "'"+valoresEntreVirgulas[13]+"'," 
                          + "'"+valoresEntreVirgulas[14]+"'," 
                          + "'"+valoresEntreVirgulas[15]+"'," 
                          + "'"+valoresEntreVirgulas[16]+"'," 
                          + "'"+valoresEntreVirgulas[17]+"'," 
                          + "'"+valoresEntreVirgulas[18]+"'," 
                          + "'"+valoresEntreVirgulas[19]+"'," 
                          + "'"+valoresEntreVirgulas[20]+"'," 
                          + "'"+valoresEntreVirgulas[21]+"'," 
                          + "'"+valoresEntreVirgulas[22]+"'," 
                          + "'"+valoresEntreVirgulas[23]+"'," 
                          + "'"+valoresEntreVirgulas[24]+"'," 
                          + "'"+valoresEntreVirgulas[25]+"',"+id_route+
                           ","+id_logidrone_user+");"    
                  ;         

            consulta.execute(sql);
            }
        
        }catch(FileNotFoundException e){
            System.out.println(e.toString());
        }     
        

    }

    
    
    public ArrayList<List<String>> getRota(String route_id, int id_user) throws SQLException{
      MysqlDB banco = new MysqlDB();               
      banco.connect();
      PreparedStatement ps = null;
      ResultSet rs = null;
      String sql = null;  
      
      String latitude = new String("");
      String longitude = new String("");
     
      ArrayList<List<String>> result = new ArrayList<List<String>>();
      
      List<String> listaLong = new ArrayList<String>();  
      List<String> listaLat = new ArrayList<String>();  
    

    
      try {
            
                     
         sql = "SELECT `lat`,`lng` FROM `logidrone` WHERE `routeidrone_user_id_user` = " + id_user + " and `routeidrone_id_routeidrone` =" + route_id;
                
          
          
          ps = banco.conn.prepareStatement(sql);        
          rs = ps.executeQuery(sql);
         
         
          while(rs.next()){
                      
              latitude = rs.getString(1);
              longitude = rs.getString(2);                       
              
              listaLat.add(latitude);
              listaLong.add(longitude);
              
              
          } // Fim do Laço da Consulta
                
         // System.out.println("Fim do Laço da Consulta");
          result.add(listaLat);
          result.add(listaLong);
      }catch(Exception e){
         System.out.println("Exception is ;"+e);
      }
      return result;
    }
    
    
    
    
}
