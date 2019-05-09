
package conexao;

import java.sql.*;


public class MysqlQuery {
    public Connection Database = null; 
    public boolean status;
    public ResultSet rs; // Contém o conjunto de dados retornado por uma consulta SQL
    public Statement stm; // Controla e executa uma instrução SQL
    private boolean statusreg = true;

    public MysqlQuery(Connection Db) {
        try {
            Database = Db;
            stm = Database.createStatement();
            status = false;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("Erro ao criar Query!");
        }
    }
    public void open(String sql) { // Utilizado quando deseja acessar os dados da consulta
        try {
            rs = stm.executeQuery(sql);
            status = true;
	} catch (SQLException e) {
            status = false;
            System.out.print("Erro ao executar Query!");
            e.printStackTrace();
	}
    }
    public void execute(String sql) { // Quando a instrução retorna true ou false
        try {
            stm.execute(sql);
            status = true;
	} catch (SQLException e) {
            status = false;
            System.out.print("Erro ao executar Query!");
            e.printStackTrace();
	}
    }
    public String fieldbyname(String field) {
        String value = null;
	try {
            if (rs.getString(1) != null)
                status = false;
            if (status)
                rs.next();
            value = rs.getString(field);
            status = true;
        } catch (SQLException e) {
            System.out.println("Field invalido!");
	}
	return value;
    }
    public ResultSet Resultado(String consulta) { // Utilizado em consultas SELECT
        try {
            rs = stm.executeQuery(consulta);
            return rs;
	} catch (SQLException eSQL) {
            eSQL.printStackTrace();
	}
	return null;
    }
    public int recordcount() { // Retorna quantas registros a consulta retornou
        int tot = 0;
	try {
            rs.first();
            while (rs.next())
                tot++;
	} catch (SQLException e) {
            status = false;
            System.out.print("Erro ao executar Query!");
            e.printStackTrace();
	}
	return tot;
    }
    public boolean next() { // Percorrer retorno da instrução
        boolean retorno = false;
	try {
            if (rs.next()) {
                retorno = true;
            }
        } catch (SQLException e) {
            System.out.print("Erro ao executar Query!");
        }
	return retorno;
    }
    public boolean prev() { // Retornar um indice quando esta percorrendo
	boolean retorno = false;
	try {
            if (rs.previous()) {
                retorno = true;
            }
	} catch (SQLException e) {
            System.out.print("Erro ao executar previous!");
        }
	return retorno;
    }
    public boolean first() {
        boolean retorno = false;
	try {
            if (rs.first()) {
                retorno = true;
            }
	} catch (SQLException e) {
            System.out.print("Erro ao executar first!");
	}
	return retorno;
    }
    public boolean last() {
        boolean retorno = false;
	try {
            if (rs.last()) {
                retorno = true;
            }
	} catch (SQLException e) {
            System.out.print("Erro ao executar last!");
	}
	return retorno;
    }
}

