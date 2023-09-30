import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { SubsidiesService } from './subsidies.service';

@Controller('subsidies')
export class SubsidiesController {

    constructor(private subsidiesService: SubsidiesService) {}

    @Get('all')
    getAllPersons() {
        return this.subsidiesService.getAll();
    }

    @Get('one/:id')
    getOnePerson(@Param('id') id: string) {
        return this.subsidiesService.getOne(id);
    }

    @Post('create')
    createPerson(@Body() body: Record<string, any>) {
        return this.subsidiesService.create(body);
    }

    @Put('update')
    updatePerson(@Body() body: Record<string, any>) {
        return this.subsidiesService.update(body);
    }

    @Delete('one/:id')
    deleteOnePerson(@Param('id') id: string) {
        return this.subsidiesService.deleteOne(id);
    }

}
