package controller.roles;
import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import controller.PMF;
import model.entity.Role;
public class RolesControllerDelete extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Role roles = pm.getObjectById(Role.class, new Long(req.getParameter("id")).longValue());
		if (roles!=null){
			pm.deletePersistent(roles);
		}
		pm.close();
		resp.sendRedirect("/roles");
	}
}
