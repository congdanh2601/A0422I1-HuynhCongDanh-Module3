package controller;

import model.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/servlet")
public class UserServlet extends HttpServlet {
    UserService service = new UserService();
    PrintWriter writer;
    String action;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action = request.getParameter("action");
        writer = response.getWriter();
        switch (action) {
            case "show":
                List<User> list = service.selectAllUsers();
                request.setAttribute("list", list);
                request.getRequestDispatcher("/view/user/show.jsp").forward(request, response);
                break;
            case "update":
                int id = Integer.parseInt(request.getParameter("idForUpdate"));
                User userForUpdate = service.selectUser(id);
                if (userForUpdate != null) {
                    request.setAttribute("user", userForUpdate);
                    request.getRequestDispatcher("/view/user/update.jsp").forward(request, response);
                } else {
                    writer.println("<html>");
                    writer.println("<p>Can't find any user with that id!</p>");
                    writer.println("<a href=\"/index.jsp\">Back to main menu</a>");
                    writer.println("</html>");
                }
                break;
            case "delete":
                int idForDelete = Integer.parseInt(request.getParameter("idForDelete"));
                service.deleteUser(idForDelete);
                writer.println("<html>");
                writer.println("<p>User deleted!</p>");
                writer.println("<a href=\"/index.jsp\">Back to main menu</a>");
                writer.println("</html>");
                break;
            case "find":
                String countryToFind = request.getParameter("countryToFind");
                List usersInCountry = service.findByCountry(countryToFind);
                request.setAttribute("list", usersInCountry);
                request.setAttribute("country", countryToFind);
                request.getRequestDispatcher("view/user/find.jsp").forward(request, response);
                break;
            case "sort":
                List<User> sortedList = service.sortByName();
                request.setAttribute("list", sortedList);
                request.getRequestDispatcher("/view/user/show.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action = request.getParameter("action");
        writer = response.getWriter();
        switch (action) {
            case "create":
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String country = request.getParameter("country");
                User user = new User(name, email, country);
                service.insertUser(user);
                writer.println("<html>");
                writer.println("<h5>New user added!</h5>");
                writer.println("<a href=\"/index.jsp\">Back to main menu</a>");
                writer.println("</html>");
                break;
            case "update":
                int id = Integer.parseInt(request.getParameter("id"));
                String nameForUpdate = request.getParameter("name");
                String emailForUpdate = request.getParameter("email");
                String countryForUpdate = request.getParameter("country");
                User userForUpdate = new User(id, nameForUpdate, emailForUpdate, countryForUpdate);
                service.updateUser(userForUpdate);
                writer.println("<html>");
                writer.println("<p>User updated!</p>");
                writer.println("<a href=\"/index.jsp\">Back to main menu</a>");
                writer.println("</html>");
                break;
        }
    }
}
