package controller.access;

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
import model.entity.Role;
import model.entity.Resource;
import model.entity.Access;

@SuppressWarnings("serial")
public class AccessControllerAdd extends HttpServlet {
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

					PersistenceManager pm5 = PMF.get().getPersistenceManager();
					String query5 = "SELECT FROM " + Role.class.getName();
					List<Role> roles = (List<Role>) pm5.newQuery(query5).execute();
					req.setAttribute("roles", roles);

					query5 = "SELECT FROM " + Resource.class.getName();
					List<Resource> resources = (List<Resource>) pm5.newQuery(query5).execute();
					req.setAttribute("resources", resources);

					RequestDispatcher rd = this.getServletContext()
							.getRequestDispatcher("/WEB-INF/Views/Access/add.jsp");
					rd.forward(req, resp);
				}
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PersistenceManager pm = PMF.get().getPersistenceManager();
		String nombre = request.getParameter("nombre");
		String query = "SELECT FROM " + Resource.class.getName();
		List<Access> access = (List<Access>) pm.newQuery(query).execute();

		Access access2 = new Access(Long.parseLong(request.getParameter("roles")),
				Long.parseLong(request.getParameter("resources")));
		try {
			pm.makePersistent(access2);
			pm.close();
			response.sendRedirect("/access");
		} catch (Exception e) {
			System.out.println(e);
		}

	}
}
