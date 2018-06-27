package controller.resources;

import java.io.IOException;


import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import controller.PMF;
import model.entity.Resource;

public class ResourcesControllerEdit extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Resource resources = pm.getObjectById(Resource.class, Long.parseLong(req.getParameter("id")));
		pm.close();
		req.setAttribute("resources", resources);
		RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Resources/edit.jsp");
		rd.forward(req, resp);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		Resource resources = pm.getObjectById(Resource.class, Long.parseLong(req.getParameter("id")));
		resources.setUrl(req.getParameter("nombre"));
		pm.close();
		resp.sendRedirect("/resources/view?id="+req.getParameter("id"));
	}
}
