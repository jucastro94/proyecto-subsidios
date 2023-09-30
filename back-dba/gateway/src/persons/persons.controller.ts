import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { PersonsService } from './persons.service';

@Controller('persons')
export class PersonsController {

    constructor(private personsService: PersonsService) {}

    @Get('all')
    getAllPersons() {
        return this.personsService.getAllPersons();
    }

    @Get('one/:id')
    getOnePerson(@Param('id') id: string) {
        return this.personsService.getOnePerson(id);
    }

    @Post('create')
    createPerson(@Body() body: Record<string, any>) {
        return this.personsService.createPerson(body);
    }

    @Put('update')
    updatePerson(@Body() body: Record<string, any>) {
        return this.personsService.updatePerson(body);
    }

    @Delete('one/:id')
    deleteOnePerson(@Param('id') id: string) {
        return this.personsService.deleteOnePerson(id);
    }

}
