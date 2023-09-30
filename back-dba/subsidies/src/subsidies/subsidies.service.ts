import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { randomUUID } from 'crypto';
import { Aplicaciones } from './application.entity';

@Injectable()
export class SubsidiesService {
    constructor(
        @InjectRepository(Aplicaciones) private readonly personsRepository: Repository<Aplicaciones>
    ) {}

    async all() {
        return await this.personsRepository.find();
    }

    async one(id: string) {
        return await this.personsRepository.findBy({ id });
    }

    async create(obj: Aplicaciones) {
        obj.id = randomUUID();
        return await this.personsRepository.insert(obj);
    }

    async update(obj: Aplicaciones) {
        return await this.personsRepository.update({id: obj.id}, obj);
    }

    async delete(id: string) {
        return await this.personsRepository.delete({ id });
    }
}
