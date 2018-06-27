package controller.productos;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import controller.PMF;
import model.entity.Producto;

public class ProductosControllerView extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Producto producto = pm.getObjectById(Producto.class, Long.parseLong(req.getParameter("id")));
		pm.close();
		req.setAttribute("producto", producto);
		RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Productos/view.jsp");
		rd.forward(req, resp);
	}
}

