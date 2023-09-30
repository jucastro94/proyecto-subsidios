using apiGateway.services;
using ClassLibrary;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace apiGateway.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class personaController : ControllerBase
    {
        private readonly RabbitMqPublisher _rabbitMqPublisher;
        private readonly ILogger _logger;
        private readonly string personQueue = Environment.GetEnvironmentVariable("PERSON_QUEUE") ?? "personas";

        private Personas personas = new Personas();
        public personaController(ILogger<personaController> logger, RabbitMqPublisher rabbitMqPublisher)
        {
            _logger = logger;
            _rabbitMqPublisher = rabbitMqPublisher;
        }

        [Route("")]
        [HttpPost]
        public IActionResult CrearPersona(Personas person)
        {
            try
            {
                if (!ModelState.IsValid) BadRequest();

                //personas.registrarPersona(person);

                RabbitMqMessage<Personas> message = new RabbitMqMessage<Personas>();
                message.ObjData = person;
                message.Operation = "Create";


                _rabbitMqPublisher.SendMessage<Personas>(message, personQueue);

                _logger.LogInformation($"Create event in queue {personQueue}, message: {message}");
                return Ok(new
                {
                    message = "Success",
                    data = message
                });
            }
            catch (Exception e)
            {
                return BadRequest(new { message = "error", data = e.Message });
            }

        }

        /*
        [Route("")]
        [HttpDelete]
        public IActionResult EliminarPersona(int id)
        {
            try
            {
                if (!ModelState.IsValid) BadRequest();

                personas.eliminar(id);

                RabbitMqMessage<Personas> message = new RabbitMqMessage<Personas>();
                message.ObjData = personas;
                message.Operation = "Delete";


                _rabbitMqPublisher.SendMessage<Personas>(message, personQueue);

                _logger.LogInformation($"Create event in queue {personQueue}, message: {message}");
                return Ok(new
                {
                    message = "Success",
                    data = message
                });
            }
            catch (Exception e)
            {
                return BadRequest(new { message = "error", data = e.Message });
            }

        }

       
        public IActionResult BuscarPersona(Personas person)
        {
            try
            {
                if (!ModelState.IsValid) BadRequest();

                personas.registrarPersona(person);

                RabbitMqMessage<Personas> message = new RabbitMqMessage<Personas>();
                message.ObjData = person;
                message.Operation = "SearchOne";


                _rabbitMqPublisher.SendMessage<Personas>(message, personQueue);

                _logger.LogInformation($"Create event in queue {personQueue}, message: {message}");
                return Ok(new
                {
                    message = "Success",
                    data = message
                });
            }
            catch (Exception e)
            {
                return BadRequest(new { message = "error", data = e.Message });
            }

        }

        [Route("")]
        [HttpGet]
        public IActionResult BuscarVarios(Personas person)
        {
            try
            {
                if (!ModelState.IsValid) BadRequest();

                personas.registrarPersona(person);

                RabbitMqMessage<Personas> message = new RabbitMqMessage<Personas>();
                message.ObjData = person;
                message.Operation = "SearchAll";


                _rabbitMqPublisher.SendMessage<Personas>(message, personQueue);

                _logger.LogInformation($"Create event in queue {personQueue}, message: {message}");
                return Ok(new
                {
                    message = "Success",
                    data = message
                });
            }
            catch (Exception e)
            {
                return BadRequest(new { message = "error", data = e.Message });
            }

        }

        [Route("")]
        [HttpPost]
        public IActionResult ModificarPersona(Personas person)
        {
            try
            {
                if (!ModelState.IsValid) BadRequest();

                personas.registrarPersona(person);

                RabbitMqMessage<Personas> message = new RabbitMqMessage<Personas>();
                message.ObjData = person;
                message.Operation = "Update";


                _rabbitMqPublisher.SendMessage<Personas>(message, personQueue);

                _logger.LogInformation($"Create event in queue {personQueue}, message: {message}");
                return Ok(new
                {
                    message = "Success",
                    data = message
                });
            }
            catch (Exception e)
            {
                return BadRequest(new { message = "error", data = e.Message });
            }

        }*/
    }



}
