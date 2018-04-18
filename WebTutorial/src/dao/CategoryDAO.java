package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import connectORACLE.ConnectionUtils;
import model.Category;

public class CategoryDAO {

	// get danh sach the loai
	public ArrayList<Category> getListCategory() throws SQLException, ClassNotFoundException {

		ArrayList<Category> list = new ArrayList<Category>();

		String SQL = "select * from category";

		// 1st : get connection
		Connection connection = ConnectionUtils.getMyConnection();

		// 2nd : tao doi tuong Statement
		Statement statement = connection.createStatement();

		// 3rd : get resultset
		ResultSet rs = statement.executeQuery(SQL);

		while (rs.next()) {

			Category category = new Category();

			int category_id = rs.getInt(1);
			String category_name = rs.getString(2);

			// System.out.println("ID ==" + category_id);
			// System.out.println("Name ==" + category_name);

			category.setCategoryId(category_id);
			category.setCategoryName(category_name);
			list.add(category);

		}

		return list;

	}

	public static void main(String[] args) throws ClassNotFoundException, SQLException {

		CategoryDAO categoryDAO = new CategoryDAO();
		for (Category ds : categoryDAO.getListCategory()) {
			System.out.println("ID ==" + ds.getCategoryId());
			System.out.println("Name ==" + ds.getCategoryName());
		}
	}
}
