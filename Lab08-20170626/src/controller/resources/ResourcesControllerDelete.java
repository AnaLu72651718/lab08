package controller.resources;
import java.io.IOException;


import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import controller.PMF;
import model.entity.Resource;
public class ResourcesControllerDelete extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Resource resources = pm.getObjectById(Resource.class, new Long(req.getParameter("id")).longValue());
		if (resources!=null){
			pm.deletePersistent(resources);
		}
		pm.close();
		resp.sendRedirect("/resources");
	}
}
