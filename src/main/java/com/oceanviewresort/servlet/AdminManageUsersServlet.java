import com.oceanviewresort.dao.UserDAO;
import com.oceanviewresort.model.User;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/manage-users")
public class AdminManageUsersServlet extends HttpServlet {

    private UserDAO userDao;

    @Override
    public void init() {
        userDao = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            List<User> users = userDao.getAllUsers();

            int adminCount = userDao.countByRole("ADMIN");
            int staffCount = userDao.countByRole("STAFF");
            int customerCount = userDao.countByRole("GUEST");

            request.setAttribute("users", users);
            request.setAttribute("adminCount", adminCount);
            request.setAttribute("staffCount", staffCount);
            request.setAttribute("guestCount", customerCount);

            request.getRequestDispatcher("/admin/manage-users.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("../error.jsp");
        }
    }
}