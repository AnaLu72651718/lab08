package controller.roles;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import controller.PMF;
import model.entity.Role;

public class RolesControllerView extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Role roles = pm.getObjectById(Role.class, Long.parseLong(req.getParameter("id")));
		pm.close();
		req.setAttribute("roles", roles);
		RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Roles/view.jsp");
		rd.forward(req, resp);
	}
}