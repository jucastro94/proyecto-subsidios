import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PersonsModule } from './persons/persons.module';
import { SubsidiesModule } from './subsidies/subsidies.module';
import { DisbursementsModule } from './disbursements/disbursements.module';

@Module({
  imports: [PersonsModule, SubsidiesModule, DisbursementsModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
