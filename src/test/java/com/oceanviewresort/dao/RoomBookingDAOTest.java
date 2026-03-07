package com.oceanviewresort.dao;

import com.oceanviewresort.model.*;
import org.junit.jupiter.api.*;
import org.mockito.*;

import java.sql.*;
import java.time.LocalDate;
import java.util.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class RoomBookingDAOTest {

    @Mock
    private Connection mockConnection;
    @Mock
    private PreparedStatement mockPreparedStatement;
    @Mock
    private ResultSet mockResultSet;

    private RoomBookingDAO roomBookingDAO;

    @BeforeEach
    void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);

        roomBookingDAO = new RoomBookingDAO() {
            {
                this.connection = mockConnection; // override DAO connection with mock
            }
        };
    }

    @Test
    void testGetAvailableRooms() throws Exception {
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);

        // Mock 2 available rooms
        when(mockResultSet.next()).thenReturn(true, true, false);
        when(mockResultSet.getInt("room_id")).thenReturn(1, 2);
        when(mockResultSet.getString("room_number")).thenReturn("101", "102");

        List<Room> rooms = roomBookingDAO.getAvailableRooms(1, new java.util.Date(), new java.util.Date());

        assertEquals(2, rooms.size());
        assertEquals("102", rooms.get(1).getRoomNumber());
    }

    @Test
    void testAddBookingOnline() throws Exception {
        Room room = new Room();
        room.setRoomId(1);

        User customer = new User();
        customer.setId(10);

        OnlineBooking booking = new OnlineBooking(customer, true, "John Doe", "123456789", room,
                new java.util.Date(), new java.util.Date(), null);

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeUpdate()).thenReturn(1);

        boolean result = roomBookingDAO.addBooking(booking);

        assertTrue(result);
        verify(mockPreparedStatement, times(1)).executeUpdate();
    }

    @Test
    void testAddBookingWalkIn() throws Exception {
        Room room = new Room();
        room.setRoomId(1);

        User createdBy = new User();
        createdBy.setId(5);

        WalkInBooking booking = new WalkInBooking(createdBy, 0, "Jane Doe", "987654321", room,
                new java.util.Date(), new java.util.Date(), null);

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeUpdate()).thenReturn(1);

        boolean result = roomBookingDAO.addBooking(booking);

        assertTrue(result);
        verify(mockPreparedStatement, times(1)).executeUpdate();
    }

    @Test
    void testDeleteBooking() throws Exception {
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeUpdate()).thenReturn(1);

        boolean deleted = roomBookingDAO.deleteBooking(1);

        assertTrue(deleted);
        verify(mockPreparedStatement, times(1)).executeUpdate();
    }

    @Test
    void testCountArrivals() throws Exception {
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true);
        when(mockResultSet.getInt(1)).thenReturn(5);

        int count = roomBookingDAO.countArrivals(LocalDate.now());

        assertEquals(5, count);
    }

    @Test
    void testCountDepartures() throws Exception {
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true);
        when(mockResultSet.getInt(1)).thenReturn(3);

        int count = roomBookingDAO.countDepartures(LocalDate.now());

        assertEquals(3, count);
    }
}