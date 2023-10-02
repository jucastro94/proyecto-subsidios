import { Module } from '@nestjs/common';
import { DisbursementsController } from './disbursements.controller';
import { DisbursementsService } from './disbursements.service';

@Module({
  controllers: [DisbursementsController],
  providers: [DisbursementsService]
})
export class DisbursementsModule {}
