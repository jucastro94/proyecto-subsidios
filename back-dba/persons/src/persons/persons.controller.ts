import { Controller } from '@nestjs/common';
import { PersonsService } from './persons.service';
import { Person } from './person.entity';
import { MessagePattern, Payload } from '@nestjs/microservices';


@Controller('persons')
export class PersonsController {

    constructor(private personsService: PersonsService,) {}

    @MessagePattern('getAllPersons')
    async getAllPersons() {
        return await this.personsService.all();
    }

    @MessagePattern('getOnePerson')
    async getOnePerson(id: string) {
        return await this.personsService.one(id);
    }

    @MessagePattern('createPerson')
    async createPerson(@Payload() message: Person) {
        return await this.personsService.create(message);
    }

    @MessagePattern('updatePerson')
    async updatePerson(body: Person) {
        return await this.personsService.update(body);
    }

    @MessagePattern('deletePerson')
    async deleteOnePerson(id: string) {
        return await this.personsService.delete(id);
    }

}
