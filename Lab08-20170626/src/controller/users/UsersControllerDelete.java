package controller.users;
import java.io.IOException;



import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import controller.PMF;
import model.entity.User;
public class UsersControllerDelete extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		User user = pm.getObjectById(User.class, new Long(req.getParameter("id")).longValue());
		if (user!=null){
			pm.deletePersistent(user);
		}
		pm.close();
		resp.sendRedirect("/users");
	}
}
