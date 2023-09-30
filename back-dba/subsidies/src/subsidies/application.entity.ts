import { Column, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { Personas } from "./person.entity";
import { Proyectos } from "./project.entity";
import { Subsidios } from "./subsidy.entity";

@Entity()
export class Aplicaciones {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @ManyToOne(() => Personas)
  @JoinColumn()
  aplicante: Personas;

  @Column({ length: 50, default: 'Pendiente' })
  estado: string;

  @ManyToOne(() => Subsidios)
  @JoinColumn()
  subsidio: Subsidios;

  @Column({ type: 'date' })
  fechainicio: Date;

  @Column({ type: 'date', nullable: true })
  fechafin: Date;

  @ManyToOne(() => Proyectos)
  @JoinColumn()
  proyecto: Proyectos;
}
