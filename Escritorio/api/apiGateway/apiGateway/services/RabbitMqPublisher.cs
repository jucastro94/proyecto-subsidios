using RabbitMQ.Client;
using System.Text.Json;
using System.Text;
using ClassLibrary;

namespace apiGateway.services
{
    public class RabbitMqPublisher
    {
        private IModel _channel;

        public RabbitMqPublisher()
        {
            ConnectionFactory factory = new ConnectionFactory
            {
                HostName = Environment.GetEnvironmentVariable("HOSTNAME_RABBITMQ"),
                UserName = Environment.GetEnvironmentVariable("USERNAME_RABBITMQ"),
                Password = Environment.GetEnvironmentVariable("PASSWORD_RABBITMQ"),

            };
            IConnection connection = factory.CreateConnection();
            _channel = connection.CreateModel();
            CreateQueues();


        }

        private void CreateQueues()
        {
            if (_channel != null)
            {
                _channel.QueueDeclare(queue: "personas", durable: true, exclusive: false, autoDelete: false, arguments: null);
                _channel.QueueDeclare(queue: "subsidios", durable: true, exclusive: false, autoDelete: false, arguments: null);
            }
        }

        public void SendMessage<T>(RabbitMqMessage<T> message, string queue)
        {
            if (_channel != null)
            {
                string jsonString = JsonSerializer.Serialize(message);
                byte[] body = Encoding.UTF8.GetBytes(jsonString);

                _channel.BasicPublish(
                    exchange: string.Empty,
                    routingKey: queue,
                    body: body
                    );
            }
        }
    }
}
