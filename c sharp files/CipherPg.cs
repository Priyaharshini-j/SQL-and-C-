using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLConn
{
    internal class CipherPg
    {
        static void Main8(string[] args)
        {
            Console.WriteLine("Enter the message you want to encode");
            string message=Console.ReadLine()!;
            Console.WriteLine("Enter the Key");
            string key = Console.ReadLine()!;
            Console.WriteLine($"The Encoded string is: {NicoCipherEncoding(message,key)}");
        }
        static string NicoCipherEncoding(string message, string key)
        {
            
            int[] keySortPosition = SortedPosition(key);
            double div = message.Length / key.Length + 1;
            int row = (int)Math.Floor(div);
            int column = key.Length;
            char[,] encodedstr = new char[row,column];
            char[,] encodedMsg = new char[row,column];
            int iterate = 0;
            for (int index = 0; index < row; index++)
            {
                for (int j_index = 0; j_index < column; j_index++)
                {
                    if (iterate >= message.Length)
                    {
                        encodedstr[index, j_index] = ' ';
                        iterate++;
                        Console.Write(encodedstr[index, j_index]);
                        continue;
                    }
                    encodedstr[index, j_index] = message[iterate];
                    iterate++;
                    Console.Write(encodedstr[index, j_index]);
                }
                Console.WriteLine();
            }
            int i = 0;
            for (i = 0; i < row; i++)
            {
                for(int j = 0; j < column; j++)
                {
                    Console.Write(encodedstr[i, j]);
                }
            }
            i = 0;
            for (int k=0, column_index = keySortPosition[i]; k<column && column_index < keySortPosition.Length ;k++, i++)
            {
                column_index = keySortPosition[i];
                for (int row_index = 0, j=0 ;row_index<row && j < row ;row_index++, j++)
                {
                    Console.Write(encodedstr[row_index, column_index]);
                    encodedMsg[j,k] = encodedstr[row_index, column_index];
                }
                Console.WriteLine();
            }
            for (i = 0; i < row; i++)
            {
                for (int j = 0; j < column; j++)
                {
                    Console.Write(encodedMsg[i, j]);
                }
            }
            return "";
        }
        static int[] SortedPosition(string key)
        {
            int[] keySortPosition= new int[key.Length];
            key=key.ToUpper();
            char[] keyChar= key.ToCharArray();
            Array.Sort(keyChar);
            int i = 0;
            for (int index = 0; index < key.Length; index++)
            {
                for(int j_index=0;j_index<keyChar.Length;j_index++)
                {
                    if (keyChar[index] == key[j_index])
                    {
                        keySortPosition[i]= j_index;
                        i++;
                    }
                }
            }
            return keySortPosition;
        }
    }
}
