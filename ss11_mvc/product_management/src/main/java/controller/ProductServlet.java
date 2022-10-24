package controller;

import model.Product;
import service.IProductService;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "ProductServlet", value = "/servlet")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();
    List<Product> productList = productService.findAll();

    Product productToUpdate = null;
    PrintWriter writer;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "show":
                request.setAttribute("list", productList);
                request.getRequestDispatcher("/view/product/list.jsp").forward(request, response);
                break;
            case "create":
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                float price = Float.parseFloat(request.getParameter("price"));
                String description = request.getParameter("description");
                String brand = request.getParameter("brand");

                Product product = new Product(id, name, price, description, brand);
                productService.save(product);

                writer = response.getWriter();
                writer.println("<html>");
                writer.println("<h5>New Product added!</h5>");
                writer.println("<a href=\"/index.jsp\">Back to main menu</a>");
                writer.println("</html>");
                break;
            case "update":
                int idForUpdate = Integer.parseInt(request.getParameter("idForDelete"));
                for (Product p : productList) {
                    if(p.getId() == idForUpdate) {
                        productToUpdate = p;
                        break;
                    }
                }
                if(productToUpdate != null) {
                    request.setAttribute("productToUpdate", productToUpdate);
                    request.getRequestDispatcher("/view/product/update.jsp").forward(request, response);
                } else {
                    writer = response.getWriter();
                    writer.println("<html>");
                    writer.println("<p>Can't find any product with that id!</p>");
                    writer.println("<a href=\"/index.jsp\">Back to main menu</a>");
                    writer.println("</html>");
                }
                break;
            case "update2":
                productToUpdate.setId(Integer.parseInt(request.getParameter("id")));
                productToUpdate.setName( request.getParameter("name"));
                productToUpdate.setPrice(Float.parseFloat(request.getParameter("price")));
                productToUpdate.setDescription(request.getParameter("description"));
                productToUpdate.setBrand(request.getParameter("brand"));
                writer = response.getWriter();
                writer.println("<html>");
                writer.println("<p>Product updated!</p>");
                writer.println("<a href=\"/index.jsp\">Back to main menu</a>");
                writer.println("</html>");
                break;
            case "delete":
                boolean exist = false;
                writer = response.getWriter();
                int idForDelete = Integer.parseInt(request.getParameter("idForDelete"));
                for (Product p : productList) {
                    if(p.getId() == idForDelete) {
                        exist = true;
                        productList.remove(p);
                        writer.println("<html>");
                        writer.println("<p>Product deleted!</p>");
                        writer.println("<a href=\"/index.jsp\">Back to main menu</a>");
                        writer.println("</html>");
                        break;
                    }
                }
                if(!exist) {
                    writer.println("<html>");
                    writer.println("<p>Can't find any product with that id!</p>");
                    writer.println("<a href=\"/index.jsp\">Back to main menu</a>");
                    writer.println("</html>");
                }
                break;
            case "find":
                String nameToFind = request.getParameter("nameToFind");
                List<Product> foundList = new ArrayList();
                final String regex = "^*" + nameToFind + ".*";
                Pattern pattern = Pattern.compile(regex);

                for (Product p : productList) {
                    Matcher matcher = pattern.matcher(p.getName());
                    if(matcher.matches()) {
                        foundList.add(p);
                    }
                }
                request.setAttribute("list", foundList);
                request.getRequestDispatcher("view/product/find.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int id, String name, float price, String description, String brand


    }
}
