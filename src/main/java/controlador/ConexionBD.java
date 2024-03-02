package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {
    static Connection con;

    public static Connection ConectarBaseDeDatos() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_saludcontigo", "root", "123456789");
            System.out.println("Conexión exitosa a la base de datos");
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("No se pudo Conectar a la base de datos");
            ex.printStackTrace();
        }
        return con;
    }

    public static void cerrarConexion() {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException ex) {
            System.out.println("Error al cerrar la conexión");
            ex.printStackTrace();
        }
    }
}