package com.oceanviewresort.dao;

import com.oceanviewresort.connection.DbConnection;
import com.oceanviewresort.model.RoomType;
import org.junit.jupiter.api.*;
import org.mockito.*;

import java.sql.*;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class RoomTypeDAOTest {

    @Mock
    private Connection mockConnection;
    @Mock
    private PreparedStatement mockPreparedStatement;
    @Mock
    private ResultSet mockResultSet;

    private RoomTypeDAO roomTypeDAO;

    @BeforeEach
    void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);

        // Mock DbConnection to return our mock connection
        DbConnection dbConnection = mock(DbConnection.class);
        when(dbConnection.getConnection()).thenReturn(mockConnection);

        roomTypeDAO = new RoomTypeDAO() {
            {
                this.connection = mockConnection;
            }
        };
    }

    @Test
    void testAddRoomType() throws Exception {
        RoomType roomType = new RoomType();
        roomType.setRoomType("Deluxe");
        roomType.setPricePerNight(150.0);
        roomType.setImageUrl("deluxe.jpg");

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeUpdate()).thenReturn(1);

        boolean result = roomTypeDAO.addRoomType(roomType);

        assertTrue(result);
        verify(mockPreparedStatement, times(1)).executeUpdate();
        System.out.println("Test 1: AddRoomType Passed");
    }

    @Test
    void testGetRoomTypeById() throws Exception {
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);

        when(mockResultSet.next()).thenReturn(true);
        when(mockResultSet.getInt("room_type_id")).thenReturn(1);
        when(mockResultSet.getString("room_type")).thenReturn("Deluxe");
        when(mockResultSet.getDouble("price_per_night")).thenReturn(150.0);
        when(mockResultSet.getString("image_url")).thenReturn("deluxe.jpg");

        RoomType roomType = roomTypeDAO.getRoomTypeById("Deluxe");

        assertNotNull(roomType);
        assertEquals("Deluxe", roomType.getRoomType());
        assertEquals(150.0, roomType.getPricePerNight());
        System.out.println("Test 2: GetRoomTypeById  Passed");
    }

    @Test
    void testGetAllRoomTypes() throws Exception {
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);

        when(mockResultSet.next()).thenReturn(true, true, false); // 2 rows
        when(mockResultSet.getInt("room_type_id")).thenReturn(1, 2);
        when(mockResultSet.getString("room_type")).thenReturn("Deluxe", "Suite");
        when(mockResultSet.getDouble("price_per_night")).thenReturn(150.0, 200.0);
        when(mockResultSet.getString("image_url")).thenReturn("deluxe.jpg", "suite.jpg");

        List<RoomType> list = roomTypeDAO.getAllRoomTypes();

        assertEquals(2, list.size());
        assertEquals("Suite", list.get(1).getRoomType());
        System.out.println("Test 3: GetAllRoomTypes  Passed");
    }

    @Test
    void testUpdateRoomType() throws Exception {
        RoomType roomType = new RoomType();
        roomType.setRoomTypeId(1);
        roomType.setRoomType("Deluxe Updated");
        roomType.setPricePerNight(160.0);
        roomType.setImageUrl("deluxe_updated.jpg");

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeUpdate()).thenReturn(1);

        boolean updated = roomTypeDAO.updateRoomType(roomType);

        assertTrue(updated);
        verify(mockPreparedStatement, times(1)).executeUpdate();
        System.out.println("Test 4: UpdateRoomType  Passed");
    }

    @Test
    void testDeleteRoomType() throws Exception {
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeUpdate()).thenReturn(1);

        boolean deleted = roomTypeDAO.deleteRoomType(1);

        assertTrue(deleted);
        verify(mockPreparedStatement, times(1)).executeUpdate();
        System.out.println("Test 5: DeleteRoomType  Passed");
    }
}