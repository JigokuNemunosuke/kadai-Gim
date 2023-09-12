package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Customer;

public class CustomerDAO {
	//DB接続に使用する情報
	private final String JDBC_URL = "jdbc:h2:tcp://localhost/~/example";
	private final String DB_USER = "sa";
	private final String DB_PASS = "";
	
	public Customer findByLogin(Customer login) throws SQLException {
		Customer customer = null;
		
		//DBへ接続
		try(Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER,DB_PASS)) {
			//SELECT文を準備
			String sql = "SELECT CODE, NAME, PASSWORD, TELNO, POSTALCODE, ADDRESS, STARTDATE, RANK, STATUS, DELETE_FLAG FROM CUSTOMER WHERE CODE = ? AND PASSWORD = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1,  login.getCode());
			pStmt.setString(2, login.getPass());
			
			//SELECT文を実行し、結果表を取得
			ResultSet rs = pStmt.executeQuery();
			
			//一致したユーザーが存在した場合、そのユーザーを表すCustomerインスタンスを生成
			if (rs.next()) {
				//結果からデータを取得
				String code = rs.getString(1);
				String name = rs.getString(2);
				String pass = rs.getString(3);
				String telno = rs.getString(4);
				String postalcode = rs.getString(5);
				String address = rs.getString(6);
				String startdate = rs.getString(7);
				String rank = rs.getString(8);
				String status = rs.getString(9);
				boolean delete_flag = rs.getBoolean(10);
				customer = new Customer(code, name, pass,telno, postalcode, address, startdate, rank, status, delete_flag);
			}
		} catch (SQLException e) {
			throw e;
		}
		
		//見つかったユーザーまたはnullを返す
		return customer;
	}
	
	public Customer update(Customer changeCon) throws SQLException {
		Customer customer = null;
		
		//DBへ接続
		try(Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER,DB_PASS)) {
			
			//SELECT文を準備
			String sql1 = "UPDATE CUSTOMER SET NAME = ?, TELNO = ?, POSTALCODE = ?, ADDRESS = ?, RANK = ? WHERE CODE = ?";
			PreparedStatement pStmt1 = conn.prepareStatement(sql1);
			pStmt1.setString(1, changeCon.getName());
			pStmt1.setString(2, changeCon.getTelno());
			pStmt1.setString(3, changeCon.getPostalcode());
			pStmt1.setString(4, changeCon.getAddress());
			pStmt1.setString(5, changeCon.getRank());
			pStmt1.setString(6, changeCon.getCode());
			
			//情報更新を実行
			pStmt1.executeUpdate();
			
			//SELECT文を実行し、更新後のレコードを取得
			String sql2 = "SELECT CODE, NAME, PASSWORD, TELNO, POSTALCODE, ADDRESS, STARTDATE, RANK, STATUS, DELETE_FLAG FROM CUSTOMER WHERE CODE = ?";
			PreparedStatement pStmt2 = conn.prepareStatement(sql2);
			pStmt2.setString(1, changeCon.getCode());
			ResultSet rs = pStmt2.executeQuery();
			
			if (rs.next()) {
				//結果からデータを取得
				String code = rs.getString(1);
				String name = rs.getString(2);
				String pass = rs.getString(3);
				String telno = rs.getString(4);
				String postalcode = rs.getString(5);
				String address = rs.getString(6);
				String startdate = rs.getString(7);
				String rank = rs.getString(8);
				String status = rs.getString(9);
				boolean delete_flag = rs.getBoolean(10);
				customer = new Customer(code, name, pass,telno, postalcode, address, startdate, rank, status, delete_flag);
			}
		
		} catch (SQLException e) {
			throw e;
		}
		return customer;
	}
}
