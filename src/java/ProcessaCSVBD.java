
import conexao.MysqlDB;
import conexao.MysqlQuery;
import java.io.File;
import java.io.FileNotFoundException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;


public class ProcessaCSVBD {
    
    

 public void gravaCSV(String pathArquivo) throws SQLException{
        boolean status = false;
        MysqlDB banco = new MysqlDB();        
        banco.connect();
       
       File arquivoCSV = new File(pathArquivo);
        
        try{  
            MysqlQuery consulta = new MysqlQuery(banco.conn);       
            String sql = null;
            //cria um scanner para ler o arquivo
            Scanner leitor = new Scanner(arquivoCSV);            
            //variavel que armazenara as linhas do arquivo
            String linhasDoArquivo = new String();
            String inicio = null;
            //ignora a primeira linha do arquivo
            leitor.nextLine();
            
            //percorre todo o arquivo
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
                          + "'"+valoresEntreVirgulas[25]+"',1,1);"    
                  ;         

       consulta.execute(sql);
                 
            }
        
        }catch(FileNotFoundException e){
            
        }      
        
      //  return status;
      banco.disconnect();
    }

    
}
