import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ListServlet", value = "/display-list")
public class ListServlet extends HttpServlet {
    private static List<Customer> customers = new ArrayList();
    static {
        customers.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "<img src=\"https://play-lh.googleusercontent.com/97SBxbD2bNm201fHNM440s71k2jmaYPuJrQVBHZuFu81Cr83VWrXei_SZuaR2jIbReY\">"));
        customers.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "<img src=\"https://play-lh.googleusercontent.com/97SBxbD2bNm201fHNM440s71k2jmaYPuJrQVBHZuFu81Cr83VWrXei_SZuaR2jIbReY\">"));
        customers.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "<img src=\"https://play-lh.googleusercontent.com/97SBxbD2bNm201fHNM440s71k2jmaYPuJrQVBHZuFu81Cr83VWrXei_SZuaR2jIbReY\">"));
        customers.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "<img src=\"https://play-lh.googleusercontent.com/97SBxbD2bNm201fHNM440s71k2jmaYPuJrQVBHZuFu81Cr83VWrXei_SZuaR2jIbReY\">"));
        customers.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "<img src=\"https://play-lh.googleusercontent.com/97SBxbD2bNm201fHNM440s71k2jmaYPuJrQVBHZuFu81Cr83VWrXei_SZuaR2jIbReY\">"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("/display-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
