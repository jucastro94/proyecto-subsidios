import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class Proyectos {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column({ length: 50 })
  direccion: string;

  @Column('geography')
  ubicacion: any;

  @Column()
  estrato: number;

  @Column({ length: 50 })
  ciudad: string;

  @Column({ length: 50 })
  departamento: string;

  @Column({ length: 50 })
  indicaciones: string;
}