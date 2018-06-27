package controller.access;
import java.io.IOException;
import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import controller.PMF;
import model.entity.Access;
public class AccessControllerDelete extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Access access= pm.getObjectById(Access.class, new Long(req.getParameter("id")).longValue());
		if (access!=null){
			pm.deletePersistent(access);
		}
		pm.close();
		resp.sendRedirect("/access");
	}
}
