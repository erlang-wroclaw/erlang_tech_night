using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Threading.Tasks;

namespace WordCount
{
    class TextFile
    {
        private string _path;
        public TextFile(string path)
        {
            _path = path;
        }

        private object _locker = new object();

        public ulong Words { get; private set; }

        //with side effects !
        public void Parse()
        {
            var lines = File.ReadAllLines(_path);
            Parallel.ForEach(lines, line =>
                {
                    var words = line.Split(null); //use all whitespace characters

                    //make update synched
                    lock (_locker)
                    {
                        Words = Words + (ulong)words.LongCount();
                    }
                });
        }
    }
}
