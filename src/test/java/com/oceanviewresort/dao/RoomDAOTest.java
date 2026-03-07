package com.oceanviewresort.dao;

import com.oceanviewresort.model.Room;
import com.oceanviewresort.model.RoomType;
import org.junit.jupiter.api.*;
import org.mockito.*;

import java.sql.*;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class RoomDAOTest {

    @Mock
    private Connection mockConnection;
    @Mock
    private PreparedStatement mockPreparedStatement;
    @Mock
    private ResultSet mockResultSet;

    private RoomDAO roomDAO;

    @BeforeEach
    void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);

        roomDAO = new RoomDAO() {
            {
                this.connection = mockConnection; // inject mock connection
            }
        };
    }

    @Test
    void testAddRoom() throws Exception {
        RoomType roomType = new RoomType();
        roomType.setRoomTypeId(1);

        Room room = new Room();
        room.setRoomNumber("101");
        room.setRoomType(roomType);

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeUpdate()).thenReturn(1);

        boolean result = roomDAO.addRoom(room);

        assertTrue(result);
        verify(mockPreparedStatement, times(1)).executeUpdate();
        System.out.println("Test 1: AddRoom  Passed");
    }

    @Test
    void testGetRoomByNumber() throws Exception {
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);

        when(mockResultSet.next()).thenReturn(true);
        when(mockResultSet.getInt("room_id")).thenReturn(1);
        when(mockResultSet.getString("room_number")).thenReturn("101");
        when(mockResultSet.getInt("room_type_id")).thenReturn(1);
        when(mockResultSet.getString("room_type")).thenReturn("Deluxe");
        when(mockResultSet.getDouble("price_per_night")).thenReturn(150.0);
        when(mockResultSet.getString("image_url")).thenReturn("deluxe.jpg");

        Room room = roomDAO.getRoomByNumber("101");

        assertNotNull(room);
        assertEquals("101", room.getRoomNumber());
        assertEquals("Deluxe", room.getRoomType().getRoomType());
        System.out.println("Test 2: GetRoomByNumber  Passed");
    }

    @Test
    void testGetAllRooms() throws Exception {
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);

        // Mock 2 rows
        when(mockResultSet.next()).thenReturn(true, true, false);
        when(mockResultSet.getInt("room_id")).thenReturn(1, 2);
        when(mockResultSet.getString("room_number")).thenReturn("101", "102");
        when(mockResultSet.getInt("room_type_id")).thenReturn(1, 2);
        when(mockResultSet.getString("room_type")).thenReturn("Deluxe", "Suite");
        when(mockResultSet.getDouble("price_per_night")).thenReturn(150.0, 200.0);
        when(mockResultSet.getString("image_url")).thenReturn("deluxe.jpg", "suite.jpg");

        List<Room> rooms = roomDAO.getAllRooms();

        assertEquals(2, rooms.size());
        assertEquals("Suite", rooms.get(1).getRoomType().getRoomType());
        System.out.println("Test 3: GetAllRooms  Passed");
    }

    @Test
    void testUpdateRoom() throws Exception {
        RoomType roomType = new RoomType();
        roomType.setRoomTypeId(1);

        Room room = new Room();
        room.setRoomId(1);
        room.setRoomNumber("101 Updated");
        room.setRoomType(roomType);

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeUpdate()).thenReturn(1);

        boolean result = roomDAO.updateRoom(room);

        assertTrue(result);
        verify(mockPreparedStatement, times(1)).executeUpdate();
        System.out.println("Test 4: UpdateRoom  Passed");
    }

    @Test
    void testDeleteRoom() throws Exception {
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeUpdate()).thenReturn(1);

        boolean result = roomDAO.deleteRoom(1);

        assertTrue(result);
        verify(mockPreparedStatement, times(1)).executeUpdate();
        System.out.println("Test 5: DeleteRoom  Passed");
    }
}