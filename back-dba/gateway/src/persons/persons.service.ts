import { Inject, Injectable } from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';


@Injectable()
export class PersonsService {

    constructor(
        @Inject('PERSON_SERVICE') private readonly client: ClientProxy,
    ) {}

    getAllPersons() {
        return this.client.send('getAllPersons', {});
    }

    getOnePerson(id: string) {
        return this.client.send('getOnePerson', id);
    }

    createPerson(payload: Record<string, any>) {
        return this.client.send('createPerson', payload);
    }

    updatePerson(payload: Record<string, any>) {
        return this.client.send('updatePerson', payload);
    }

    deleteOnePerson(id: string) {
        return this.client.send('deletePerson', id);
    }

}
