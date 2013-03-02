using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CommandLine;
using System.IO;

namespace WordCount
{
    class Program
    {
        static void Main(string[] args)
        {
            //one thread per file
            var options = new CommandlineOptions();
            if (!Parser.Default.ParseArguments(args, options))
            {
                return;
            }

            var path = Path.GetFullPath(options.Path);
            var files = Directory.EnumerateFiles(path);

            foreach (var file in files)
            {
                Console.WriteLine(file);
            }

            Console.ReadKey();
        }
    }
}
