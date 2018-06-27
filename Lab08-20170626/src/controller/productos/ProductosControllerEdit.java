package controller.productos;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import controller.PMF;
import model.entity.Producto;

public class ProductosControllerEdit extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Producto producto = pm.getObjectById(Producto.class, Long.parseLong(req.getParameter("id")));
		pm.close();
		req.setAttribute("producto", producto);
		RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Productos/edit.jsp");
		rd.forward(req, resp);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Producto producto = pm.getObjectById(Producto.class, Long.parseLong(req.getParameter("id")));
		producto.setNombre(req.getParameter("nombre"));
		producto.setDescripcion(req.getParameter("descripcion"));
		producto.setPrecio(req.getParameter("precio"));
		producto.setStock(Integer.parseInt(req.getParameter("stock")));
		pm.close();
		resp.sendRedirect("/productos/view?id="+req.getParameter("id"));
	}
}
