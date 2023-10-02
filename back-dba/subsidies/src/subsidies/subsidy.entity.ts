import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class Subsidios {
  @PrimaryGeneratedColumn('uuid')
  id?: string;

  @Column({ length: 50 })
  nombre: string;
}
