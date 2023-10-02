import { Module } from '@nestjs/common';
import { PersonsService } from './persons.service';
import { PersonsController } from './persons.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Person } from './person.entity';
import { ClientsModule, Transport } from '@nestjs/microservices';

@Module({
  providers: [PersonsService],
  controllers: [PersonsController],
  imports: [
    TypeOrmModule.forFeature([Person]),
    ClientsModule.register([
      {
        name: 'PERSON_SERVICE',
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
  exports: [TypeOrmModule]
})
export class PersonsModule {}
