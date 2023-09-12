package model;

import java.sql.SQLException;

import dao.CustomerDAO;

public class LoginLogic {
	public Customer execute(Customer customer) throws SQLException {
		try {
			CustomerDAO dao = new CustomerDAO();
			customer = dao.findByLogin(customer);
		} catch (SQLException e) {
			throw e;
		}
		return customer;
	}
}
