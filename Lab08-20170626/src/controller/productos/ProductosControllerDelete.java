package controller.productos;
import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import controller.PMF;
import model.entity.Producto;
public class ProductosControllerDelete extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Producto producto = pm.getObjectById(Producto.class, new Long(req.getParameter("id")).longValue());
		if (producto!=null){
			pm.deletePersistent(producto);
		}
		pm.close();
		resp.sendRedirect("/productos");
	}
}
