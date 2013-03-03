using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CommandLine;

namespace WordCount
{
    class CommandlineOptions
    {
        [Option("path",Required=false)]
        public string Path { get; set; }

        [Option("port", Required = false)]
        public int Port { get; set; }

    }
}
