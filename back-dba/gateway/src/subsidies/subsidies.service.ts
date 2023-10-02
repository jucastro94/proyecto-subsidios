import { Inject, Injectable } from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';

@Injectable()
export class SubsidiesService {

    constructor(
        @Inject('SUBSIDY_SERVICE') private readonly client: ClientProxy,
    ) {}

    getAll() {
        return this.client.send('getAllSubsidies', {});
    }

    getOne(id: string) {
        return this.client.send('getOneSubsidy', id);
    }

    create(payload: Record<string, any>) {
        return this.client.send('createSubsidy', payload);
    }

    update(payload: Record<string, any>) {
        return this.client.send('updateSubsidy', payload);
    }

    deleteOne(id: string) {
        return this.client.send('deleteSubsidy', id);
    }
}
