using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLConn
{
    internal class ADDrecord
    {
        static void Main1(string[] args)
        {
            //we are providing connection to the SQL server where our Database present
            string CONN_STRING = "Data Source=LocalHost;Encrypt=False;Initial Catalog=Practice;Integrated Security=True; ";
            SqlConnection connect = new SqlConnection(CONN_STRING);
            //opening the server connection
            connect.Open();

            //creting a Sqlcommand to run the command we give in it
            SqlCommand cmd = connect.CreateCommand();

            //Inserting the record intot he DB
            Console.WriteLine("Enter the Dept ID ");
            int DeptId = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter the dept Name");
            string DeptName = Console.ReadLine()!;
            Console.WriteLine("Enter the HoD name");
            string HoD = Console.ReadLine()!;
            cmd.CommandText = $"INSERT INTO DeptMaster Values ({DeptId},'{DeptName}','{HoD}')";
            //closing this execute reader
            cmd.ExecuteReader().Close();

            //Reading the input from the db 
            cmd.CommandText = "SELECT * FROM DeptMaster";
            SqlDataReader reader1 = cmd.ExecuteReader();
            Console.WriteLine("DeptId \t DeptName \t DeptHoD");
            while (reader1.Read())
            {
                Console.Write(reader1.GetInt32(0) + "\t");// We have the integer as the 1st column so we give it as Integer i.e., DeptId
                Console.Write(reader1.GetString(1) + "\t");// We have string in the 2nd column so we give getstring i.e., Dept Name
                Console.Write(reader1.GetString(2) + "\t");// We have string in the 3rd column so we give getstring i.e., DeptHoD
                Console.WriteLine();
            }
            //Closing the reader
            reader1.Close();

            connect.Close();
        }
        
    }
}
