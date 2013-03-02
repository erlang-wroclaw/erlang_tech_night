using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CommandLine;

namespace WordCount
{
    class CommandlineOptions
    {
        [Option("path",Required=true)]
        public string Path { get; set; }
    }
}
