package controller.roles;

import java.io.IOException;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.users.UserServiceFactory;

import controller.PMF;
import model.entity.Role;

@SuppressWarnings("serial")
public class RolesControllerAdd extends HttpServlet {
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
					RequestDispatcher rd = this.getServletContext()
							.getRequestDispatcher("/WEB-INF/Views/Roles/add.jsp");
					rd.forward(req, resp);
				}
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PersistenceManager pm = PMF.get().getPersistenceManager();
		String nombre = request.getParameter("nombre");
		String query = "SELECT FROM " + Role.class.getName();
		List<Role> roles = (List<Role>) pm.newQuery(query).execute();
		int a = 0;
		for (Role r : roles) {
			if (r.getNombre().equals(nombre)) {
				a++;
			}
		}
		if (a == 0) {
			Role role = new Role(nombre);
			try {
				pm.makePersistent(role);
				pm.close();
				response.sendRedirect("/roles");
			} catch (Exception e) {
				System.out.println(e);
			}
		} else {
			response.sendRedirect("/roles/add");
		}

	}
}
