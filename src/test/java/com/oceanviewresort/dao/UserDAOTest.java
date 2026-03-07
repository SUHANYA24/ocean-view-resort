package com.oceanviewresort.dao;

import com.oceanviewresort.connection.DbConnection;
import com.oceanviewresort.model.*;
import com.oceanviewresort.util.PasswordUtil;
import org.junit.jupiter.api.*;
import org.mockito.*;

import java.sql.*;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class UserDAOTest {

    @Mock
    private Connection mockConnection;
    @Mock
    private PreparedStatement mockPreparedStatement;
    @Mock
    private ResultSet mockResultSet;

    private UserDAO userDAO;

    @BeforeEach
    void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);

        // Mock DbConnection to return our mock connection
        DbConnection dbConnection = mock(DbConnection.class);
        when(dbConnection.getConnection()).thenReturn(mockConnection);

        // Inject mock connection into DAO
        userDAO = new UserDAO() {
            {
                this.connection = mockConnection; // override the connection
            }
        };
    }

    @Test
    void testRegisterUserGuest() throws Exception {
        Guest guest = new Guest();
        guest.setEmail("test@example.com");
        guest.setPassword("password");
        guest.setRole("GUEST");
        guest.setFirstName("John");
        guest.setLastName("Doe");
        guest.setContactNumber("123456789");
        guest.setAddress("123 Ocean St");

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeUpdate()).thenReturn(1);

        boolean result = userDAO.registerUser(guest);

        assertTrue(result);
        verify(mockPreparedStatement, times(1)).executeUpdate();
        System.out.println("Test 1: RegisterUserGuest  Passed");
    }

    @Test
    void testLoginUserGuest() throws Exception {
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);

        when(mockResultSet.next()).thenReturn(true);
        when(mockResultSet.getString("password")).thenReturn(PasswordUtil.hashPassword("password"));
        when(mockResultSet.getString("role")).thenReturn("GUEST");
        when(mockResultSet.getInt("user_id")).thenReturn(1);
        when(mockResultSet.getString("email")).thenReturn("test@example.com");
        when(mockResultSet.getString("first_name")).thenReturn("John");
        when(mockResultSet.getString("last_name")).thenReturn("Doe");
        when(mockResultSet.getString("contact_number")).thenReturn("123456789");
        when(mockResultSet.getString("address")).thenReturn("123 Ocean St");

        User user = userDAO.loginUser("test@example.com", "password");

        assertNotNull(user);
        assertTrue(user instanceof Guest);
        assertEquals("test@example.com", user.getEmail());
        System.out.println("Test 2: LoginUserGuest  Passed");
    }

    @Test
    void testUpdateUserAdmin() throws Exception {
        Admin admin = new Admin();
        admin.setId(1);
        admin.setEmail("admin@example.com");
        admin.setPassword("adminpass");
        admin.setRole("ADMIN");
        admin.setEmpId("EMP001");
        admin.setAdminRole("Manager");

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeUpdate()).thenReturn(1);

        boolean updated = userDAO.updateUser(admin);

        assertTrue(updated);
        verify(mockPreparedStatement, times(1)).executeUpdate();
        System.out.println("Test 3: UpdateUserAdmin  Passed");
    }

    @Test
    void testDeleteUser() throws Exception {
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeUpdate()).thenReturn(1);

        boolean deleted = userDAO.deleteUser(1);

        assertTrue(deleted);
        verify(mockPreparedStatement, times(1)).executeUpdate();
        System.out.println("Test 4: DeleteUser  Passed");
    }

    @Test
    void testCountByRole() throws Exception {
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true);
        when(mockResultSet.getInt(1)).thenReturn(5);

        int count = userDAO.countByRole("GUEST");

        assertEquals(5, count);
        System.out.println("Test 5: CountByRole  Passed");
    }
}