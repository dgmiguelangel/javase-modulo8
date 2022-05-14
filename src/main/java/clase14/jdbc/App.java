package clase14.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class App {

	public static void main(String[] args) {

		if (conectarBD() != null)
			System.out.println("Me conecte!!");

//		insertar();

		consultar();

	}

	private static void consultar() {

		String sql = "select id, numero, activa, color, marca, encendido, puestos from compacto";

		try (Connection con = conectarBD(); Statement st = con.createStatement();) {

			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()) {
				System.out.println(rs.getString(2));
				System.out.println(rs.getBoolean("activa"));
				System.out.println(rs.getString("color"));
				System.out.println(rs.getString("marca"));
				System.out.println(rs.getBoolean("encendido"));
				System.out.println(rs.getInt("puestos"));
				System.out.println("---------------------------");
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		}	
		
	}

	private static void insertar() {

		String sql = "insert into compacto (numero, activa, color, marca, encendido, puestos)"
				+ " values ('MMM258', 1, 'ROJO', 'RENAULT', 1, 2)";

		try (Connection con = conectarBD(); Statement st = con.createStatement();) {

			st.execute(sql);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	private static Connection conectarBD() {
		Connection con = null;

		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/curso_javase";
		String usuario = "root";
		String clave = "root";

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, usuario, clave);

		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();

		} catch (SQLException e) {
			System.out.println("Hubo un error en la conexion...");
		}

		return con;
	}

}
