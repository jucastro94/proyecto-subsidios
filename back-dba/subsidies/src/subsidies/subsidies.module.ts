import { Module } from '@nestjs/common';
import { SubsidiesController } from './subsidies.controller';
import { SubsidiesService } from './subsidies.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ClientsModule, Transport } from '@nestjs/microservices';
import { Aplicaciones } from './application.entity';
import { Proyectos } from './project.entity';
import { Subsidios } from './subsidy.entity';
import { Personas } from './person.entity';

@Module({
  controllers: [SubsidiesController],
  providers: [SubsidiesService],
  imports: [
    TypeOrmModule.forFeature([Aplicaciones, Proyectos, Subsidios, Personas]),
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
