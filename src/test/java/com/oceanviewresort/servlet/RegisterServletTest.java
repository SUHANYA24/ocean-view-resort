package com.oceanviewresort.servlet;

import com.oceanviewresort.dao.UserDAO;
import com.oceanviewresort.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.*;
import org.junit.jupiter.api.*;
import org.mockito.*;

import java.io.IOException;

import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

class RegisterServletTest {

    @Mock
    private HttpServletRequest request;
    @Mock
    private HttpServletResponse response;
    @Mock
    private HttpSession session;
    @Mock
    private RequestDispatcher dispatcher;
    @Mock
    private UserDAO userDAO;

    private RegisterServlet servlet;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);

        servlet = new RegisterServlet();
        // inject mock DAO
        servlet.init();
        // Override DAO with mock
        servlet.setUserDAO(userDAO);
    }

    @Test
    void testDoPost_SuccessfulRegistration() throws Exception {
        when(request.getParameter("role")).thenReturn("GUEST");
        when(request.getParameter("email")).thenReturn("guest@example.com");
        when(request.getParameter("password")).thenReturn("password123");
        when(request.getParameter("firstName")).thenReturn("John");
        when(request.getParameter("lastName")).thenReturn("Doe");

        when(userDAO.registerUser(any(User.class))).thenReturn(true);

        servlet.doPost(request, response);

        verify(userDAO, times(1)).registerUser(any(User.class));
        verify(response).sendRedirect("login.jsp?msg=Account created successfully, please login.");
        System.out.println("Test 1: SuccessfulRegistration : Passed");
    }

    @Test
    void testDoPost_RegistrationFails() throws Exception {
        when(request.getParameter("role")).thenReturn("GUEST");
        when(request.getParameter("email")).thenReturn("guest@example.com");
        when(request.getParameter("password")).thenReturn("password123");
        when(request.getParameter("firstName")).thenReturn("John");
        when(request.getParameter("lastName")).thenReturn("Doe");

        when(userDAO.registerUser(any(User.class))).thenReturn(false);
        when(request.getRequestDispatcher("register.jsp")).thenReturn(dispatcher);

        servlet.doPost(request, response);

        verify(userDAO, times(1)).registerUser(any(User.class));
        verify(request).setAttribute(eq("error"), anyString());
        verify(dispatcher).forward(request, response);
        System.out.println("Test 2: RegistrationFails : Passed");
    }

    @Test
    void testDoPost_MissingFields() throws Exception {
        when(request.getParameter("role")).thenReturn("GUEST");
        when(request.getParameter("email")).thenReturn(null); // missing email
        when(request.getRequestDispatcher("register.jsp")).thenReturn(dispatcher);

        servlet.doPost(request, response);

        verify(userDAO, never()).registerUser(any(User.class));
        verify(request).setAttribute(eq("error"), eq("All fields are required"));
        verify(dispatcher).forward(request, response);
        System.out.println("Test 3: MissingFields : Passed");
    }
}