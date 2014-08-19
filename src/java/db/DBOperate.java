package db;
import java.sql.*;

//methods to operate datebase is encapulated in DBOperate class.
public class DBOperate {
	private static final DBOperate Instance=new DBOperate();
	private Connection conn=null;
	
	private DBOperate(){
		conn=null;
	}
	public static DBOperate getInstance(){
		return Instance;
	}
        
        //build connection to database:
	public void buildConnection(){ 
		if (conn!=null)return;
		String driverClass="org.apache.derby.jdbc.ClientDriver";
		String url="jdbc:derby://localhost:1527/HotPitt";
		String username="IS2560";
		String pwd="IS2560";
//		System.out.println(url);
		try{
		Class.forName(driverClass);
		conn=DriverManager.getConnection(url,username,pwd);
		}catch(Exception e){
			e.printStackTrace();
			return;
		}
	}
        
        //process select sql:
	public ResultSet select(String sql){
		ResultSet rs;
		Statement stmt;
		try{
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			return rs;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
        
        //process sql sentences except select sql sentence:
	public void operate(String sql){
		try{
			Statement stmt=conn.createStatement();
			stmt.execute(sql);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
