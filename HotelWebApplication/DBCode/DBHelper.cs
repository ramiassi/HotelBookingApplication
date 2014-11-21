using System;
using System.Data;
using System.Data.SqlClient;

namespace HotelWebApplication.DBCode
{
    public class DBHelper
    {
        public string connectionString { get; set; }

        public DBHelper()
        {
            this.connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\DB.mdf;Integrated Security=True;User Instance=True";
        }

        public DBHelper(string connectionString)
        {
            this.connectionString = connectionString;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="checkIn"></param>
        /// <param name="checkOut"></param>
        /// <param name="roomID"></param>
        /// <param name="persons"></param>
        /// <returns>roomID of first available room, 0 if not available</returns>
        public int CheckAvailability(DateTime checkIn, DateTime checkOut, int roomLevel, int roomType)
        {
            SqlConnection con = new SqlConnection(this.connectionString);
            try
            {                
                // Select Room IDs whose level and type are requested
                SqlCommand cmd = new SqlCommand(
                  @"SELECT     roomID
                    FROM       Rooms
                    WHERE      roomLevel = " + roomLevel +
                               "AND roomType = " + roomType,
                    con);

                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                
                SqlDataReader reader = cmd.ExecuteReader();
                // check availability for each room 
                while (reader.Read())
                {
                    // return roomID on first room available
                    int roomID = (int)reader["roomID"];
                    if (CheckRoomAvailability(checkIn, checkOut, roomID))
                    {
                        reader.Close();
                        return roomID;
                    }
                }
                // if no room available
                return 0;
            }
            finally
            {
                con.Close();
            }
        }
        public bool CheckRoomAvailability(DateTime checkIn, DateTime checkOut, int roomID)
        {
            SqlConnection con = new SqlConnection(this.connectionString);
            try
            {
                // Select reservations conflicts
                SqlCommand cmd = new SqlCommand(
                  @"SELECT  res.reservID
                    FROM    Reservations AS res INNER JOIN
                            Rooms ON res.roomID = Rooms.roomID AND res.roomID = @roomID
                    WHERE   (res.checkIn >= @checkIn) AND (res.checkIn <= @checkOut) 
                            OR
                            (@checkIn >= res.checkIn) AND (@checkIn <= res.checkOut)",
                    con);

                cmd.Parameters.Add("@checkIn", SqlDbType.DateTime).Value = checkIn;
                cmd.Parameters.Add("@checkOut", SqlDbType.DateTime).Value = checkOut;
                cmd.Parameters.Add("@roomID", SqlDbType.Int).Value = roomID;

                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }            

                SqlDataReader reader = cmd.ExecuteReader();
                //if there are conflicts
                if (reader.HasRows)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            finally
            {
                con.Close();
            }
        }
        // Returns the inserted reservation ID 
        public int InsertReservation(DateTime checkIn, DateTime checkOut,int roomID, int persons,
            string fullName, string tel, string email, string address, int offerID,
            DateTime reservDate)
        {
            SqlConnection con = new SqlConnection(this.connectionString);
            try
            {
                SqlCommand cmd = new SqlCommand(
                  @"INSERT INTO 
                    Reservations(roomID, checkIn, checkOut, persons, clientFullName, clientTel, clientEmail, clientAddress, offerID, reservDate) 
                    VALUES(@roomID, @checkIn, @checkOut, @persons, @clientFullName, @clientTel, @clientEmail, @clientAddress, @offerID, @reservDate)",
                    con);
                cmd.Parameters.Add("@roomID", SqlDbType.Int).Value = roomID;
                cmd.Parameters.Add("@checkIn", SqlDbType.DateTime).Value = checkIn;
                cmd.Parameters.Add("@checkOut", SqlDbType.DateTime).Value = checkOut;
                cmd.Parameters.Add("@persons", SqlDbType.Int).Value = persons;
                cmd.Parameters.Add("@clientFullName", SqlDbType.NVarChar).Value = fullName;
                cmd.Parameters.Add("@clientTel", SqlDbType.NVarChar).Value = tel;
                cmd.Parameters.Add("@clientEmail", SqlDbType.NVarChar).Value = email;
                cmd.Parameters.Add("@clientAddress", SqlDbType.Text).Value = address;
                cmd.Parameters.Add("@offerID", SqlDbType.Int).Value = offerID;
                cmd.Parameters.Add("@reservDate", SqlDbType.DateTime).Value = reservDate;

                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                if (cmd.ExecuteNonQuery() > 0)
                {
                    cmd.CommandText = "SELECT MAX(reservID) FROM Reservations";

                    return (int)cmd.ExecuteScalar();
                }
                return 0;
            }
            finally
            {
                con.Close();
            }
        }
        public int CheckAdminLogin(string username, string password)
        {
            SqlConnection con = new SqlConnection(this.connectionString);
            try
            {
                SqlCommand cmd = new SqlCommand(
                        @"SELECT adminID FROM Admins WHERE username = @username AND password = @password",
                        con);
                cmd.Parameters.Add("@username", SqlDbType.NVarChar).Value = username;
                cmd.Parameters.Add("@password", SqlDbType.NVarChar).Value = password;
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    return (int)reader["adminID"];
                }
                return 0;
            }
            finally
            {
                con.Close();
            }

        }
    }
}
