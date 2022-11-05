package controller;

import model.User;
import service.IUserService;
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
    IUserService service = new UserService();
    PrintWriter writer;
    String action;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action = request.getParameter("action");
        writer = response.getWriter();
        switch (action) {
            case "show":
                showList(request, response);
                break;
            case "update":
                showFormUpdate(request, response);
                break;
            case "delete":
                int idForDelete = Integer.parseInt(request.getParameter("id"));
                service.deleteUser(idForDelete);
                request.setAttribute("mess","User delete");
                showList(request, response);
                break;
            case "find":
                String countryToFind = request.getParameter("country");
                List usersInCountry = service.findByCountry(countryToFind);
                request.setAttribute("list", usersInCountry);
                request.setAttribute("country", countryToFind);
                request.getRequestDispatcher("/view/user/show.jsp").forward(request, response);
                break;
            case "sort":
                List<User> sortedList = service.sortByName();
                request.setAttribute("list", sortedList);
                request.getRequestDispatcher("/view/user/show.jsp").forward(request, response);
                break;
        }
    }

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User userForUpdate = service.selectUser(id);
        request.setAttribute("user", userForUpdate);
        request.getRequestDispatcher("/view/user/update.jsp").forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> list = service.callList();
        request.setAttribute("list", list);
        request.getRequestDispatcher("view/user/show.jsp").forward(request, response);
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
                updateUser(request, response);
                break;
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nameForUpdate = request.getParameter("name");
        String emailForUpdate = request.getParameter("email");
        String countryForUpdate = request.getParameter("country");
        User userForUpdate = new User(id, nameForUpdate, emailForUpdate, countryForUpdate);
        service.updateUser(userForUpdate);
        request.setAttribute("mess", "User updated");
        showList(request, response);
    }
}
