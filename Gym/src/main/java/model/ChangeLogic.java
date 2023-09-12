package model;

import java.sql.SQLException;

import dao.CustomerDAO;

public class ChangeLogic {
	public Customer execute(Customer changeCon) throws SQLException {
		Customer customer = null;
		try {
			CustomerDAO dao = new CustomerDAO();
			customer = dao.update(changeCon);
		} catch (SQLException e) {
			throw e;
		}
		return customer;
	}
}