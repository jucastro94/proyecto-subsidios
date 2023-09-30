import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { MicroserviceOptions, Transport } from '@nestjs/microservices';

async function bootstrap() {
  const app = await NestFactory.createMicroservice<MicroserviceOptions>(
    AppModule, 
    {
      transport: Transport.RMQ,
      options: {
        urls: ['amqp://127.0.0.1:5672'],
        queue: 'main_queue',
        queueOptions: {
          durable: false,
        },
      },
    }
  );

  await app.listen().then(() => console.log('subsidies microservice is listening'));
}

bootstrap();
