using Microsoft.Data.SqlClient;

namespace SQLConn
{
    internal class ReadingSQLData
    {
        static void Main2(string[] args)
        {
            //we are providing connection to the SQL server where our Database present
            string CONN_STRING = "Data Source=LocalHost;Encrypt=False;Initial Catalog=Practice;Integrated Security=True; ";
            SqlConnection connect = new SqlConnection(CONN_STRING);
            //opening the server connection
            connect.Open();

            //creting a Sqlcommand to run the command we give in it
            SqlCommand cmd = connect.CreateCommand();

            //Reading the input from the db 
            cmd.CommandText = "SELECT * FROM DeptMaster";
            SqlDataReader reader = cmd.ExecuteReader();
            Console.WriteLine("DeptId \t DeptName \t DeptHoD");
            while (reader.Read())
            {
                Console.Write(reader.GetInt32(0) + "\t");// We have the integer as the 1st column so we give it as Integer i.e., DeptId
                Console.Write(reader.GetString(1) + "\t");// We have string in the 2nd column so we give getstring i.e., Dept Name
                Console.Write(reader.GetString(2) + "\t");// We have string in the 3rd column so we give getstring i.e., DeptHoD
                Console.WriteLine();
            }
            //closing the reader connection
            reader.Close();

            
            //closing the connection
            connect.Close();

        }

    }
}