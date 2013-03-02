using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CommandLine;
using System.IO;
using System.Threading.Tasks;

namespace WordCount
{
    class Program
    {
        private static readonly object _locker = new object();

        static void Main(string[] args)
        {
            //one thread per file
            var options = new CommandlineOptions();
            if (!Parser.Default.ParseArguments(args, options))
            {
                return;
            }

            var directoryPath = Path.GetFullPath(options.Path);
            var filePaths = Directory.EnumerateFiles(directoryPath);

            ulong count = 0;
            Parallel.ForEach(filePaths, path =>
            {
                
                var file = new TextFile(path);
                file.Parse();
                Console.WriteLine(path+": "+file.Words);
                lock (_locker)
                {
                    count += file.Words;
                }

            });

            Console.WriteLine();
            Console.WriteLine("all words in all files: " + count);

            Console.ReadKey();
        }
    }
}
