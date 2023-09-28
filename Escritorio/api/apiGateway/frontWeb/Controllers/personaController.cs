using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace frontWeb.Controllers
{
    public class personaController : Controller
    {
        // GET: persona
        public async Task<ActionResult> Inicio()
        {
            using (HttpClient httpClient = new HttpClient())
            {
               
            }

        }
    }
}