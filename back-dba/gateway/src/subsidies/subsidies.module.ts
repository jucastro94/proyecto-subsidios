import { Module } from '@nestjs/common';
import { SubsidiesController } from './subsidies.controller';
import { SubsidiesService } from './subsidies.service';
import { ClientsModule, Transport } from '@nestjs/microservices';

@Module({
  controllers: [SubsidiesController],
  providers: [SubsidiesService],
  imports: [
    ClientsModule.register([
      {
        name: 'SUBSIDY_SERVICE',
        transport: Transport.RMQ,
        options: {
          urls: ['amqp://127.0.0.1:5672'],
          queue: 'main_queue',
          queueOptions: {
            durable: false,
          }
        }
      }
    ])
  ],
})
export class SubsidiesModule {}
