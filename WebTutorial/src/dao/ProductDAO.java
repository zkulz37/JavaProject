package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import connectORACLE.ConnectionUtils;
import model.Product;

public class ProductDAO {

	// get danh sach the loai
	public ArrayList<Product> getListProduct(int id) throws SQLException, ClassNotFoundException {

		ArrayList<Product> list = new ArrayList<Product>();

		String SQL = "select * from s_product where category_id = '" + id + "'";

		// 1st : get connection
		Connection connection = ConnectionUtils.getMyConnection();

		// 2nd : tao doi tuong Statement
		Statement statement = connection.createStatement();

		// 3rd : get resultset
		ResultSet rs = statement.executeQuery(SQL);

		while (rs.next()) {

			Product product = new Product();

			int product_id = rs.getInt(1);
			int category_id = rs.getInt(2);
			String product_name = rs.getString(3);
			String product_image = rs.getString(4);
			long product_price = rs.getLong(5);
			String product_description = rs.getString(6);

			// System.out.println("ID ==" + category_id);
			// System.out.println("Name ==" + category_name);

			product.setProductID(product_id);
			product.setCategoryID(category_id);
			product.setProductName(product_name);
			product.setProductImage(product_image);
			product.setProductPrice(product_price);
			product.setProductDescription(product_description);

			list.add(product);

		}

		return list;

	}

	public static void main(String[] args) throws ClassNotFoundException, SQLException {

		int id = 1;

		ProductDAO productDAO = new ProductDAO();
		for (Product ds : productDAO.getListProduct(id)) {
			System.out.println("ID product ==" + ds.getProductID());
			System.out.println("ID category ==" + ds.getCategoryID());
			System.out.println("Name ==" + ds.getProductName());
			System.out.println("image ==" + ds.getProductImage());
			System.out.println("price ==" + ds.getProductPrice());
			System.out.println("Description ==" + ds.getProductDescription());
		}
	}
}
