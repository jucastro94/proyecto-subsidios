import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PersonsModule } from './persons/persons.module';

@Module({
  imports: [
    PersonsModule,
    TypeOrmModule.forRoot({
      type: 'mssql',
      host: 'localhost',
      port: 1433,
      username: 'SA',
      password: 'root@abc123',
      database: 'DBA',
      autoLoadEntities: true,
      synchronize: true,
      options: {
        trustServerCertificate: true,
      },
    })
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
