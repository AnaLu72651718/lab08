package controller.access;

import java.io.IOException;



import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import controller.PMF;
import model.entity.Access;

public class AccessControllerView extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Access access= pm.getObjectById(Access.class, Long.parseLong(req.getParameter("id")));
		pm.close();
		req.setAttribute("access", access);
		RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Access/view.jsp");
		rd.forward(req, resp);
	}
}