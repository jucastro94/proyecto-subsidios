import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Person } from './person.entity';
import { Repository } from 'typeorm';
import { randomUUID } from 'crypto';

@Injectable()
export class PersonsService {

    constructor(
        @InjectRepository(Person) private readonly personsRepository: Repository<Person>
    ) {}

    async all() {
        return await this.personsRepository.find();
    }

    async one(id: string) {
        return await this.personsRepository.findBy({ id });
    }

    async create(obj: Person) {
        obj.id = randomUUID();
        return await this.personsRepository.insert(obj);
    }

    async update(obj: Person) {
        return await this.personsRepository.update({id: obj.id}, obj);
    }

    async delete(id: string) {
        return await this.personsRepository.delete({ id });
    }
}
