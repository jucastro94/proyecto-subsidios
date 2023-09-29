using front2.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace front2.Controllers
{
    public class personaController : Controller
    {
        private Persona persona = new Persona();
        public List<Persona> listPeronas = new List<Persona>();

        // GET: persona

        public async Task<ActionResult> Inicio()
        {
            listPeronas.Add(new Persona() { id = 101241729, nombre = "Juan Castro" });
            listPeronas.Add(new Persona() { id = 123123, nombre = "2222" });

            using (HttpClient httpClient = new HttpClient())
            {/*
                  httpClient.DefaultRequestHeaders.Clear();
                  HttpResponseMessage response = await httpClient.GetAsync(persona.enlace);
                  if (response.IsSuccessStatusCode)
                  {
                      string cuerpo = await response.Content.ReadAsStringAsync();
                      listPeronas = JsonConvert.DeserializeObject<List<Persona>>(cuerpo);
                  }
                  else
                  {
                      Console.WriteLine("ha errado la peticion");
                  }*/
                return View(listPeronas);
            }

        }

        //Get persona
        public async Task<ActionResult> buscarPersona(int id)
        {
            Persona est = new Persona();
            using (HttpClient httpClient = new HttpClient())
            {
                httpClient.DefaultRequestHeaders.Clear();
                HttpResponseMessage response = await httpClient.GetAsync(persona.enlace + "/" + id);
                if (response.IsSuccessStatusCode)
                {
                    string cuerpo = await response.Content.ReadAsStringAsync();
                    est = JsonConvert.DeserializeObject<Persona>(cuerpo);
                }
                else
                {
                    Console.WriteLine("ha errado la peticion");
                }
                return View(est);
            }

        }
        [HttpGet]
        public ActionResult registro()
        {
            return View();
        }
        [HttpGet]
        public ActionResult editar()
        {
            return View();
        }
        //Post persona
        [HttpPost]
        public async Task<ActionResult> crearPersona(Persona persona)
        {
            using (HttpClient httpClient = new HttpClient())
            {
                httpClient.DefaultRequestHeaders.Clear();

                string data = JsonConvert.SerializeObject(persona);
                var content = new StringContent(data, Encoding.UTF8, "application/json");
                HttpResponseMessage response = await httpClient.PostAsync(persona.enlace, content);

                if (response.IsSuccessStatusCode)
                {
                    string msg = "";
                    string cuerpo = await response.Content.ReadAsStringAsync();
                    msg = (cuerpo == "true") ? "se ha registrado satisfactoriamente" : "no se ha podido registrar";

                }
                else
                {
                    Console.WriteLine("ha errado la peticion");
                }
                return RedirectToAction("Inicio", "persona");
            }

        }
        //PUT persona
        [HttpPost]
        public async Task<ActionResult> editarPersona(Persona persona)
        {
            using (HttpClient httpClient = new HttpClient())
            {
                httpClient.DefaultRequestHeaders.Clear();

                string data = JsonConvert.SerializeObject(persona);
                var content = new StringContent(data, Encoding.UTF8, "application/json");
                HttpResponseMessage response = await httpClient.PostAsync(persona.enlace, content);

                if (response.IsSuccessStatusCode)
                {
                    string msg = "";
                    string cuerpo = await response.Content.ReadAsStringAsync();
                    msg = (cuerpo == "true") ? "se ha modificado satisfactoriamente" : "no se ha podido modificado";

                }
                else
                {
                    Console.WriteLine("ha errado la peticion");
                }
                return RedirectToAction("Inicio", "persona");
            }

        }
       
        [HttpGet]
        public ActionResult eliminar(int id, string nom, string apell)
        {
            Persona per = new Persona();
            per.id = id;
            per.nombre = nom;
            per.apellido = apell;
            return View(per);
        }
        //Delete persona
        [HttpPost]
        public async Task<ActionResult> eliminarPersona(int id)
        {
            using (HttpClient httpClient = new HttpClient())
            {
                httpClient.DefaultRequestHeaders.Clear();
                HttpResponseMessage response = await httpClient.DeleteAsync(persona.enlace + "/" + id);

                if (response.IsSuccessStatusCode)
                {
                    Console.WriteLine("se ha eliminado correctamente");
                }
                else
                {
                    Console.WriteLine("ha errado la peticion");
                }
                return RedirectToAction("Inicio", "Estudiantes");
            }

        }
    }
}
