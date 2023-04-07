using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLConn
{
    internal class ExceptionSQLretrival
    {
        static void Main4(string[] args)
        {
            //we are providing connection to the SQL server where our Database present
            string CONN_STRING = "Data Source=LocalHost;Encrypt=False;Initial Catalog=Practice;Integrated Security=True; ";
            SqlConnection connect = new SqlConnection(CONN_STRING);
            //opening the server connection
            connect.Open();

            //creting a Sqlcommand to run the command we give in it
            SqlCommand cmd = connect.CreateCommand();

            try
            {
                //Deleting the record based on the id of Employee
                int id = int.Parse(Console.ReadLine()!);
                cmd.CommandText = $"DELETE FROM EmployeeDetails WHERE EmployeeId={id}";
                SqlDataReader del = cmd.ExecuteReader();
                del.Close();
            }
            catch (FormatException e)
            {
                //If we give different datatype value as input this error throws
                Console.WriteLine($"Format Error: {e.Message}");

            }
            catch (Exception e)
            {
                Console.WriteLine($"Error: {e.Message}");

            }

            //Exectuion of the table
            cmd.CommandText = $"SELECT EmployeeId, EmployeeName FROM EmployeeDetails";
            SqlDataReader retrivedDate = cmd.ExecuteReader();
            Console.WriteLine("EmployeeID \t Name\t");
            while (retrivedDate.Read())
            {
                Console.Write(retrivedDate.GetInt32(0) + "\t");
                Console.Write(retrivedDate.GetString(1) + "\t");
                Console.WriteLine();
            }

            retrivedDate.Close();

            connect.Close();
        }
    }
}
