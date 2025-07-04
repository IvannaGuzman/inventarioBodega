import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn } from 'typeorm';
import { Producto } from '../../producto/entities/producto.entity';
import { Bodega } from '../../bodega/entities/bodega.entity';

@Entity('stock')
export class Stock {
  @PrimaryGeneratedColumn({ name: 'id_stock' })
  id: number;

  @ManyToOne(() => Producto, (producto) => producto.stock)
  @JoinColumn({ name: 'producto_id' }) // 👈 importante
  producto: Producto;

  @ManyToOne(() => Bodega, (bodega) => bodega.stock)
  @JoinColumn({ name: 'bodega_id' }) // 👈 importante
  bodega: Bodega;

  @Column()
  cantidad: number;
}
