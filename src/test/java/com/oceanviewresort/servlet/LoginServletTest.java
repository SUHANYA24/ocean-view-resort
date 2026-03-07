package com.oceanviewresort.servlet;

import com.oceanviewresort.dao.UserDAO;
import com.oceanviewresort.model.User;
import jakarta.servlet.http.*;
import org.junit.jupiter.api.*;
import org.mockito.*;

import java.io.IOException;

import static org.mockito.Mockito.*;

class LoginServletTest {

    @Mock
    HttpServletRequest request;
    @Mock
    HttpServletResponse response;
    @Mock
    HttpSession session;
    @Mock
    UserDAO userDAO;

    private LoginServlet servlet;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
        servlet = new LoginServlet();
        servlet.setUserDAO(userDAO); // inject mock DAO
    }

    @Test
    void testDoPost_AdminUser_RedirectsToAdminDashboard() throws Exception {
        User adminUser = mock(User.class);
        when(request.getParameter("email")).thenReturn("admin@example.com");
        when(request.getParameter("password")).thenReturn("adminpass");
        when(userDAO.loginUser("admin@example.com", "adminpass")).thenReturn(adminUser);
        when(adminUser.isAdmin()).thenReturn(true);
        when(adminUser.isStaff()).thenReturn(false);
        when(request.getSession()).thenReturn(session);

        servlet.doPost(request, response);

        verify(session).setAttribute("loggedUser", adminUser);
        verify(response).sendRedirect("admin/dashboard");
    }

    @Test
    void testDoPost_StaffUser_RedirectsToStaffDashboard() throws Exception {
        User staffUser = mock(User.class);
        when(request.getParameter("email")).thenReturn("staff@example.com");
        when(request.getParameter("password")).thenReturn("staffpass");
        when(userDAO.loginUser("staff@example.com", "staffpass")).thenReturn(staffUser);
        when(staffUser.isAdmin()).thenReturn(false);
        when(staffUser.isStaff()).thenReturn(true);
        when(request.getSession()).thenReturn(session);

        servlet.doPost(request, response);

        verify(session).setAttribute("loggedUser", staffUser);
        verify(response).sendRedirect("staff/dashboard");
    }

    @Test
    void testDoPost_GuestUser_RedirectsToIndex() throws Exception {
        User guestUser = mock(User.class);
        when(request.getParameter("email")).thenReturn("guest@example.com");
        when(request.getParameter("password")).thenReturn("guestpass");
        when(userDAO.loginUser("guest@example.com", "guestpass")).thenReturn(guestUser);
        when(guestUser.isAdmin()).thenReturn(false);
        when(guestUser.isStaff()).thenReturn(false);
        when(request.getSession()).thenReturn(session);

        servlet.doPost(request, response);

        verify(session).setAttribute("loggedUser", guestUser);
        verify(response).sendRedirect("index.jsp");
    }

    @Test
    void testDoPost_InvalidCredentials_RedirectsToLoginWithError() throws Exception {
        when(request.getParameter("email")).thenReturn("wrong@example.com");
        when(request.getParameter("password")).thenReturn("wrongpass");
        when(userDAO.loginUser("wrong@example.com", "wrongpass")).thenReturn(null);

        servlet.doPost(request, response);

        verify(response).sendRedirect("login.jsp?error=Invalid+Credentials");
    }

    @Test
    void testDoGet_Logout_InvalidatesSession() throws IOException {
        when(request.getSession(false)).thenReturn(session);

        servlet.doGet(request, response);

        verify(session).invalidate();
        verify(response).sendRedirect("login.jsp");
    }
}
