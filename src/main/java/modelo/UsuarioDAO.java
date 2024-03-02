package modelo;

import controlador.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {
    ConexionBD conexion = new ConexionBD(); // Instancia de la conexión a la base de datos
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public List<Usuario> listar() {
        String sql = "SELECT * FROM usuario";
        List<Usuario> lista = new ArrayList<>();
        try {
            con = conexion.ConectarBaseDeDatos();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                usuario.setIdentificacion(rs.getString("identificacion"));
                usuario.setUser(rs.getString("user"));
                usuario.setPassword(rs.getString("password"));
                lista.add(usuario);
            }
        } catch(SQLException e) {
            System.out.println("Error al listar: " + e);
        } finally {
            conexion.cerrarConexion();
        }
        return lista;
    }  //Fin del método listar

    // Método para agregar
    public void agregar(Usuario usuario) {
        String sql = "INSERT INTO usuario (nombre, apellido, identificacion, user, password) VALUES (?, ?, ?, ?, ?)";
        try {
            con = conexion.ConectarBaseDeDatos();
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getApellido());
            ps.setString(3, usuario.getIdentificacion());
            ps.setString(4, usuario.getUser());
            ps.setString(5, usuario.getPassword());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en el método agregar: " + e);
        } finally {
            conexion.cerrarConexion();
        }
    }//Fin método agregar

}//Fin de la clase UsuarioDAO