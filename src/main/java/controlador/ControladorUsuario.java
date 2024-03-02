package controlador;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Usuario;


@WebServlet("/ControladorUsuario")
public class ControladorUsuario extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;

    public ControladorUsuario() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                listarUsuarios(request, response);
                break;
            case "insert":
                // Aquí manejar la inserción de un usuario
                break;
            case "update":
                // Aquí manejar la actualización de un usuario
                break;
            case "delete":
                // Aquí manejar el borrado de un usuario
                break;
            default:
                listarUsuarios(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void listarUsuarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Usuario> listaUsuarios = new ArrayList<>();

        try {
            con = ConexionBD.ConectarBaseDeDatos();
            stmt = con.prepareStatement("SELECT * FROM Usuario");
            rs = stmt.executeQuery();

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("Id"));
                usuario.setNombre(rs.getString("Nombre"));
                usuario.setApellido(rs.getString("Apellido"));
                usuario.setIdentificacion(rs.getString("Identificacion"));
                usuario.setUser(rs.getString("Usuario"));
                usuario.setPassword(rs.getString("Contraseña"));
                listaUsuarios.add(usuario);
            }

            request.setAttribute("listaUsuarios", listaUsuarios);
            RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}