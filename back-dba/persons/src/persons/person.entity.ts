import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class Person {
    @PrimaryGeneratedColumn('uuid')
    id?: string;
  
    @Column({ length: 50 })
    nombre: string;
  
    @Column({ length: 50 })
    apellido: string;
  
    @Column({ length: 50 })
    telefono: string;
  
    @Column({ length: 50 })
    direccion: string;
  
    @Column({ type: 'date' })
    fechanacimiento: Date;
  
    @Column({ length: 50 })
    numeroidentificacion: string;
  
    @Column({ length: 50 })
    tipoidentificacion: string;
  
    @Column({ length: 150, nullable: true })
    lugarresidencia: string;
  
    @Column({ length: 50, nullable: true })
    rol: string;
  
    @Column({ length: 50, nullable: true })
    clave: string;
  
    @Column({ length: 50 })
    correo: string;
  
    @Column({ length: 50 })
    estado: string;

}