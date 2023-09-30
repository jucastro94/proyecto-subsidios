import { Controller } from '@nestjs/common';
import { SubsidiesService } from './subsidies.service';
import { MessagePattern, Payload } from '@nestjs/microservices';
import { Aplicaciones } from './application.entity';

@Controller('subsidies')
export class SubsidiesController {
    constructor(private service: SubsidiesService,) {}

    @MessagePattern('getAllSubsidies')
    async getAllPersons() {
        return await this.service.all();
    }

    @MessagePattern('getOneSubsidy')
    async getOnePerson(id: string) {
        return await this.service.one(id);
    }

    @MessagePattern('createSubsidy')
    async createPerson(@Payload() message: Aplicaciones) {
        return await this.service.create(message);
    }

    @MessagePattern('updateSubsidy')
    async updatePerson(body: Aplicaciones) {
        return await this.service.update(body);
    }

    @MessagePattern('deleteSubsidy')
    async deleteOnePerson(id: string) {
        return await this.service.delete(id);
    }
}
