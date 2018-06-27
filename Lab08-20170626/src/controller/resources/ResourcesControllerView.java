package controller.resources;

import java.io.IOException;


import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import controller.PMF;
import model.entity.Resource;

public class ResourcesControllerView extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Resource resources = pm.getObjectById(Resource.class, Long.parseLong(req.getParameter("id")));
		pm.close();
		req.setAttribute("resources", resources);
		RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Resources/view.jsp");
		rd.forward(req, resp);
	}
}