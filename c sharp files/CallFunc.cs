using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLConn
{
    internal class CallFunc
    {
        static void chal(string[] args)
        {
            //we are providing connection to the SQL server where our Database present
            string CONN_STRING = "Data Source=LocalHost;Encrypt=False;Initial Catalog=CollegeSportsManagement;Integrated Security=True; ";
            SqlConnection connect = new SqlConnection(CONN_STRING);
            //opening the server connection
            connect.Open();
            //creting a Sqlcommand to run the command we give in it
            SqlCommand cmd = connect.CreateCommand();
            int input = int.Parse(Console.ReadLine()!);
            string input1 = Console.ReadLine()!;
            using (SqlCommand conn1 = new SqlCommand("AddSports", connect))
            {
                cmd.CommandText = "SELECT * FROM SPORTS";
                SqlDataReader reader1 = conn1.ExecuteReader();
                {
                    Console.Write(reader1.GetInt32(0) + "\t");// We have the integer as the 1st column so we give it as Integer i.e., DeptId
                    Console.Write(reader1.GetString(1) + "\t");// We have string in the 2nd column so we give getstring i.e., Dept Name
                    Console.WriteLine();
                }
                conn1.CommandType = System.Data.CommandType.StoredProcedure;
                conn1.Parameters.Add("SportsId", System.Data.SqlDbType.Int).Value = input;
                conn1.Parameters.Add("SportsName", System.Data.SqlDbType.NChar).Value = input1;
                conn1.ExecuteReader();
                cmd.CommandText = "SELECT * FROM SPORTS";
                reader1 = conn1.ExecuteReader();
                Console.WriteLine("DeptId \t DeptName \t DeptHoD");
                while (reader1.Read())
                {
                    Console.Write(reader1.GetInt32(0) + "\t");// We have the integer as the 1st column so we give it as Integer i.e., DeptId
                    Console.Write(reader1.GetString(1) + "\t");// We have string in the 2nd column so we give getstring i.e., Dept Name
                    Console.WriteLine();
                }
                //Closing the reader
                reader1.Close();

            }


            connect.Close();
        }
    }
}/*
  * using Microsoft.Data.SqlClient;
using System.Data;

namespace DBOperations
{
    internal class Program
    {
        static void Main(string[] args)
        {
            SqlConnection conn = new Connection().conn;
            conn.Open();

                using (SqlCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandText = "select * from dbo.GetDobById(@name)";

                cmd.Parameters.Add(new SqlParameter("@name", "John Doe"));

                SqlDataReader reader = cmd.ExecuteReader();

                    DataTable dt = new DataTable();
                    dt.Load(reader);
                    Console.Write($" {dt.Rows[0][0]} - {dt.Rows[0][1]} - {dt.Rows[0][2]} ");
            
                }

            conn.Close();

 string CONN_STRING = "Data Source=LocalHost;Encrypt=False;Initial Catalog=Practice;Integrated Security=true; ";
            using (SqlConnection connect = new SqlConnection(CONN_STRING))
            {

                connect.Open();
                Console.WriteLine("Enter the dept name: ");
                string input = Console.ReadLine()!;
                using (SqlCommand conn1 = new SqlCommand("FetchStudentInDept", connect))
                {
                    conn1.CommandText = $"SELECT * FROM FetchStudentInDept({input})";
                    SqlDataReader reader = conn1.ExecuteReader();
                    DataTable dataTb= new DataTable();
                    dataTb.Load(reader);
                    while (.Read())
                    {
                        Console.WriteLine(reader.GetInt32(0));
                        Console.WriteLine(reader.GetString(1));
                    }

                }
            }
            
        }
    }
}
  */
