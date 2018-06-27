package controller.productos;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.users.UserServiceFactory;

import controller.PMF;
import model.entity.Access;
import model.entity.Producto;

import javax.jdo.Query;

@SuppressWarnings("serial")
public class ProductosControllerAdd extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		com.google.appengine.api.users.User uGoogle = UserServiceFactory.getUserService().getCurrentUser();

		/* Verifica login */
		if (uGoogle == null) {
			RequestDispatcher dp = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/deny1.jsp");
			dp.forward(req, resp);
		} else {
			/* PMF de consultas */
			PersistenceManager pm = PMF.get().getPersistenceManager();
			/* Buscando usuario registrado activo con el email */
			String query = "select from " + model.entity.User.class.getName() + " where correo=='" + uGoogle.getEmail()
					+ "'" + " && estatus==true";
			List<model.entity.User> uSearch = (List<model.entity.User>) pm.newQuery(query).execute();
			/* Verificando usuario registrado */
			if (uSearch.isEmpty()) {
				RequestDispatcher dp = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/deny2.jsp");
				dp.forward(req, resp);
			} else {
				System.out.println(req.getServletPath());
				/* Buscando resource registrado activo de acuerdo a la URL */
				String query2 = "select from " + model.entity.Resource.class.getName() + " where url=='"
						+ req.getServletPath() + "'" + " && status==true";
				List<model.entity.Resource> rSearch = (List<model.entity.Resource>) pm.newQuery(query2).execute();
				/* verificando recurso de registrado */
				if (rSearch.isEmpty()) {
					RequestDispatcher dp = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/deny3.jsp");
					dp.forward(req, resp);
				} else {
					/*
					 * Buscando acceso registrado activo para el Rol y Recurso
					 */
					String query3 = "select from " + Access.class.getName() + " where idRol =="
							+ uSearch.get(0).getIdRol() + "&& idResource==" + rSearch.get(0).getId();
					List<Access> aSearch = (List<Access>) pm.newQuery(query3).execute();
					/* Verificando acceso registrado */
					if (aSearch.isEmpty()) {
						RequestDispatcher dp = getServletContext()
								.getRequestDispatcher("/WEB-INF/Views/Errors/deny4.jsp");
						dp.forward(req, resp);
					} else {

						RequestDispatcher rd = this.getServletContext()
								.getRequestDispatcher("/WEB-INF/Views/Productos/add.jsp");
						rd.forward(req, resp);
					}
				}
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		final Query q = pm.newQuery(Producto.class);

		String nombre = request.getParameter("nombre");
		int a = 0;
		List<Producto> productos = (List<Producto>) q.execute();
		for (Producto p : productos) {
			if (p.getNombre().equals(nombre))
				a++;
		}
		if (a == 0) {
			Producto producto = new Producto(nombre, request.getParameter("descripcion"),
					String.valueOf(request.getParameter("precio")), Integer.parseInt(request.getParameter("stock")));
			try {
				pm.makePersistent(producto);
				pm.close();
			} catch (Exception e) {
				System.out.println(e);
			}

		} else {
			System.out.println("Ya existe este producto");
		}

		response.sendRedirect("/productos");
	}
}
