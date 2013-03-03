using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.SelfHost;
using System;
using System.ServiceModel;


namespace WordCount
{

    [ServiceContract]
    public interface IServer
    {
        [OperationContract]
        ulong CountWords(string path);
    }

    public class Server : IServer
    {

        public ulong CountWords(string path)
        {
            var file = new TextFile(path);
            file.Parse(); 
            return file.Words;
        }

        public void Close()
        {
            Environment.Exit(0);
        }

    }
}

