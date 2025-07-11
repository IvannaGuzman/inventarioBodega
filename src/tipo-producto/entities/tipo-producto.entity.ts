import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
import { Equipo } from '../../equipos/entities/equipos.entity';

@Entity('tipo_producto')
export class TipoProducto {
  @PrimaryGeneratedColumn({ name: 'id_tipo_producto' })
  id: number;

  @Column({ length: 100 })
  nombre: string;

  //@OneToMany(() => Equipo, (producto) => producto.tipoProducto)
  //productos: Equipo[];
}
