using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace front.Models
{
    public class Enlace
    {
        public string link { get; }
        public Enlace()
        {
            link = "https://localhost:5094/api/";
        }

    }
}