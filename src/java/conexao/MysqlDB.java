
package conexao;

import java.sql.*;

public class MysqlDB {
    public Connection conn = null;
    public boolean status;
    
    String host = "localhost";
    String user = "root";
    String pwd = "root";
    String nomeBD = "od";
    
    public MysqlDB(String hosttmp){
        host = hosttmp;
	status = false;
    }
    public MysqlDB(){
	host = "jdbc:mysql://"+host+"/"+nomeBD+"?user="+user+"&password="+pwd;
	status=false;
    }
    public void connect() throws SQLException{ 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection( host );
	    status=true;
	    //System.out.println("A conexão foi um sucesso");
	} catch (ClassNotFoundException e) {
            
            System.out.println("excessão Classe não encontrada");
	    e.printStackTrace();
	} catch(SQLException e) {
            System.out.println("SQL Exception... Não conectado");
	    e.printStackTrace();
	}
    }
    public void disconnect() throws SQLException{
        conn.close();
        status = false;
        //System.out.println("Fechando conexão");
    }
    public boolean isconnected(){
        return status;
    }
}
