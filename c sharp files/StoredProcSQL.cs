using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLConn
{
    internal class StoredProcSQL
    {
        static void Main4(string[] args)
        {
            //we are providing connection to the SQL server where our Database present
            string CONN_STRING = "Data Source=LocalHost;Encrypt=False;Initial Catalog=Practice;Integrated Security=true; ";
           using (SqlConnection connect = new SqlConnection(CONN_STRING))
            {
                connect.Open();
                int input = int.Parse(Console.ReadLine()!);
                using (SqlCommand conn1 = new SqlCommand("FetchEmpDetails",connect))
                {
                    conn1.CommandType = System.Data.CommandType.StoredProcedure;
                    conn1.Parameters.Add("empId",System.Data.SqlDbType.Int).Value=input;
                    SqlDataReader reader = conn1.ExecuteReader();
                    while (reader.Read())
                    {
                        Console.WriteLine(reader.GetInt32(0));
                        Console.WriteLine(reader.GetString(1));
                        Console.WriteLine(reader.GetInt32(2));
                        Console.WriteLine(reader.GetString(3));
                        Console.WriteLine(reader.GetDouble(4));
                        Console.WriteLine(reader.GetString(5));
                        Console.WriteLine(reader.GetString(6));


                    }
                }
            }

            //creting a Sqlcommand to run the command we give in it
            

        }
    }
}
