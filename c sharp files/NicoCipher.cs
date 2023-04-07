using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLConn
{
    internal class NicoCipher
    {

        public static void Main6(string[] args)
        {
           Console.WriteLine( SortPosition("612345"));
           Console.WriteLine( EncodeNico("CRAZY", "mubashirhassan"));
          //  Console.WriteLine(EncodeNico("edabitisamazing", "matt"));
            Console.WriteLine(EncodeNico("iloveher", "612345"));
        }
        public static string EncodeNico(string key, string message)
        {
            string position =SortPosition(key); 
            double div = message.Length / key.Length+1;
            int row = (int)Math.Floor(div);
            int column = key.Length;
            char[,] splitMsg = new char[row,column];
            int iterate = 0;
            for(int i=0;i<row; i++) { 
                for(int j=0;j<column;j++)
                {
                    if(iterate>=message.Length)
                    {
                        splitMsg[i, j] = ' ';
                        iterate++;
                        Console.WriteLine(splitMsg[i, j]);
                        continue;
                    }
                    splitMsg[i, j] = message[iterate];
                    iterate++;
                    Console.WriteLine(splitMsg[i, j]);
                }

            }
            char[,] sortMsg = new char[row, column];
            int cnt = 0;
            foreach(char c in position)
            {
                for(int i=0;i<row;i++)
                {
                    Console.WriteLine((int)c-49);
                    sortMsg[i, (int)c-49] = splitMsg[i, cnt];
                }
                cnt+=1;
            }
            string encoded_str = "";
            for (int i = 0; i < row; i++)
            {
                for (int j = 0; j < column; j++)
                {
                    encoded_str += sortMsg[i,j];
                }
            }

            return encoded_str;
        }
        public static string SortPosition(string key)
        {
            key=key.ToUpper();
            char[] charstr=key.ToCharArray();
            Array.Sort(charstr);
            string pos = "";
            foreach(char c in charstr)
            {
                Console.WriteLine(c);
                for (int i = 0; i < charstr.Length; i++)
                {
                    if (c == key[i])
                    {
                        pos += i+1;
                    }

                }
            }

            return pos;
            /*
            Dictionary<char, int> keyValuePairs = new();
            List<char> keyList = key.ToList();
            keyList.Sort();
            int cnt = 1;
            foreach (char c in keyList)
            {
                keyValuePairs.Add(c, cnt++);
            }
            string result = "";
            foreach(char ch in key)
            {
                result += keyValuePairs[ch];
            }
            return result;  
            */
        }

    }
}
