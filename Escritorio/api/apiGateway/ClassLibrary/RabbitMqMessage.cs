using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class RabbitMqMessage<T>
    {
        public string Operation { get; set; }
        public T ObjData { get; set; }
    }
}
