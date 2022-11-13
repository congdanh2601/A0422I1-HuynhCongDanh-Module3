package controller;

import model.Customer;
import service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customerServlet")
public class CustomerServlet extends HttpServlet {
    CustomerService service = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                request.setAttribute("typeList", service.getCustomerType());
                request.getRequestDispatcher("/view/customer/create.jsp").forward(request, response);
                break;
            case "update":
                int id = Integer.parseInt(request.getParameter("id"));
                List<Customer> customerList = service.showAll();
                for (Customer c : customerList) {
                    if (c.getCustomerId() == id) {
                        request.setAttribute("customer", c);
                        break;
                    }
                }
                request.setAttribute("typeList", service.getCustomerType());
                request.getRequestDispatcher("/view/customer/update.jsp").forward(request, response);
                break;
            case "search":
                request.setAttribute("list", service.findByName(request.getParameter("name")));
                request.getRequestDispatcher("/view/customer/show.jsp").forward(request, response);
                break;
            case "sort":
                request.setAttribute("list", service.sortByName());
                request.getRequestDispatcher("/view/customer/show.jsp").forward(request, response);
                break;
            case "delete":
                int idDelete = Integer.parseInt(request.getParameter("id"));
                if (service.delete(idDelete)) {
                    request.setAttribute("mess", "Customer deleted.");
                }
                showList(request, response);
                break;
            default:
                showList(request, response);
                break;
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String getPage = request.getParameter("page");
        if(getPage == null) {
            getPage = "1";
        }
        int page = Integer.parseInt(getPage);
        request.setAttribute("page", page);
        request.setAttribute("pageList", service.showPage(page));
        request.setAttribute("fullList", service.showAll());
        request.getRequestDispatcher("/view/customer/show.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                String type = request.getParameter("type");
                String name = request.getParameter("name");
                String birthday = request.getParameter("birthday");
                boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
                String nationalId = request.getParameter("idCard");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                Customer customer = new Customer(type, name, birthday, gender, nationalId, phone, email, address);
                if (service.create(customer)) {
                    request.setAttribute("mess", "Customer added.");
                }
                showList(request, response);
                break;
            case "update":
                int id = Integer.parseInt(request.getParameter("id"));
                String type2 = request.getParameter("type");
                String name2 = request.getParameter("name");
                String birthday2 = request.getParameter("birthday");
                boolean gender2 = Boolean.parseBoolean(request.getParameter("gender"));
                String nationalId2 = request.getParameter("idCard");
                String phone2 = request.getParameter("phone");
                String email2 = request.getParameter("email");
                String address2 = request.getParameter("address");
                Customer customer2 = new Customer(id, type2, name2, birthday2, gender2, nationalId2, phone2, email2, address2);
                if (service.update(customer2)) {
                    request.setAttribute("mess", "Customer updated.");
                }
                showList(request, response);
                break;
        }
    }
}
