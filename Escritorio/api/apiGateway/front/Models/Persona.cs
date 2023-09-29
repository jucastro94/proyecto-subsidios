using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace front.Models
{
    public class Persona
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string telefono { get; set; }
        public string direccion { get; set; }
        public DateTimeOffset fechaNacimiento { get; set; }
        public string numeroIdentificacaion { get; set; }
        public string tipoIdentificacion { get; set; }
        public string lugarResidencia { get; set; }
        public string rol { get; set; }
        public string clave { get; set; }
        public string correo { get; set; }
        public string estado { get; set; }

        public static Enlace enlc = new Enlace();
        public string enlace { get; } = enlc.link + "persona";
    }
}