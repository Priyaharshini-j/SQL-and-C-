using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLConn
{
    internal class RetrivingData
    {
        static void Main3(string[] args)
        {
            //we are providing connection to the SQL server where our Database present
            string CONN_STRING = "Data Source=LocalHost;Encrypt=False;Initial Catalog=Practice;Integrated Security=True; ";
            SqlConnection connect = new SqlConnection(CONN_STRING);
            //opening the server connection
            connect.Open();

            //creting a Sqlcommand to run the command we give in it
            SqlCommand cmd = connect.CreateCommand();

            //Seeing the already present data
            cmd.CommandText = $"SELECT * FROM STUDENTDB;";
            SqlDataReader showDate = cmd.ExecuteReader();
            Console.WriteLine("StudentID \t Name\t Dept\t Age\t Date of Birth\t Email");
            while (showDate.Read())
            {
                Console.Write(showDate.GetInt32(0) + "\t");
                Console.Write(showDate.GetString(1) + "\t");
                Console.Write(showDate.GetString(2) + "\t");
                Console.Write(showDate.GetInt32(3) + "\t");
                Console.Write(showDate.GetDateTime(4).ToShortDateString() + "\t");
                Console.Write(showDate.GetString(5) + "\t");
                Console.WriteLine();
            }

            //Lets try retriving the data based on User's Input
            Console.WriteLine("Enter the student record you need to Display.. Enter the Student ID");
            int StudentId = Convert.ToInt32(Console.ReadLine());
            cmd.CommandText = $"SELECT * FROM STUDENTDB WHERE Id={StudentId}";
            SqlDataReader retrivedDate = cmd.ExecuteReader();
            Console.WriteLine("StudentID \t Name\t Dept\t Age\t Date of Birth\t Email");
            while (retrivedDate.Read())
            {
                Console.Write(retrivedDate.GetInt32(0) + "\t");
                Console.Write(retrivedDate.GetString(1) + "\t");
                Console.Write(retrivedDate.GetString(2) + "\t");
                Console.Write(retrivedDate.GetInt32(3) + "\t");
                Console.Write(retrivedDate.GetDateTime(4).ToShortDateString() + "\t");
                Console.Write(retrivedDate.GetString(5) + "\t");
            }
            retrivedDate.Close();

            connect.Close();
        }
    }
}
