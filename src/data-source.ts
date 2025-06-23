import { DataSource } from 'typeorm';
import * as dotenv from 'dotenv';
import { Persona } from './persona/entities/persona.entity';
import { TipoProducto } from './tipo-producto/entities/tipo-producto.entity';

dotenv.config(); // <- Muy importante, va antes de usar process.env

export const AppDataSource = new DataSource({
  type: process.env.DB_TYPE as any, // <- ahora sí puede ser leído
  host: process.env.DB_HOST,
  port: parseInt(process.env.DB_PORT || '5432', 10),
  username: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  entities: [Persona, TipoProducto],
  synchronize: true,
});
