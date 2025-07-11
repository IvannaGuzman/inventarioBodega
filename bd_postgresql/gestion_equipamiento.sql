-- ================================
-- TABLAS
-- ================================

CREATE TABLE Equipos (
  id serial PRIMARY KEY,
  codigo_interno varchar(255),
  tipo_equipo varchar(255),
  marca varchar(255),
  modelo varchar(255),
  numero_serie varchar(255),
  ram varchar(255),
  disco varchar(255),
  procesador varchar(255),
  categoria_id int,
  subcategoria_id int,
  modalidad_adquisicion_id int,
  proveedor_id int,
  licitacion_id int,
  ubicacion_id int,
  estado varchar(255),
  fecha_ingreso date,
  fecha_baja date,
  motivo_baja varchar(255),
  es_temporal boolean,
  nota text,
  created_at timestamp,
  updated_at timestamp
);

CREATE TABLE DocumentosEquipo (
  id serial PRIMARY KEY,
  equipo_id int,
  tipo_documento varchar(255),
  nombre_archivo varchar(255),
  url_archivo text,
  created_at timestamp
);

CREATE TABLE Categorias (
  id serial PRIMARY KEY,
  nombre varchar(255)
);

CREATE TABLE Subcategorias (
  id serial PRIMARY KEY,
  categoria_id int,
  nombre varchar(255)
);

CREATE TABLE ModalidadesAdquisicion (
  id serial PRIMARY KEY,
  tipo varchar(255),
  plazo_contrato varchar(255)
);

CREATE TABLE Proveedores (
  id serial PRIMARY KEY,
  nombre varchar(255),
  rut varchar(255),
  contacto varchar(255),
  correo varchar(255),
  telefono varchar(255),
  direccion text
);

CREATE TABLE Licitaciones (
  id serial PRIMARY KEY,
  nombre varchar(255),
  numero_expediente varchar(255),
  fecha_adjudicacion date,
  contrato_url text
);

CREATE TABLE Asignaciones (
  id serial PRIMARY KEY,
  equipo_id int,
  usuario_id int,
  responsable_id int,
  tipo_asignacion varchar(255),
  motivo text,
  fecha_asignacion date,
  fecha_devolucion date,
  created_at timestamp
);

CREATE TABLE EstadosStock (
  id serial PRIMARY KEY,
  equipo_id int,
  estado varchar(255),
  fecha timestamp
);

CREATE TABLE Movimientos (
  id serial PRIMARY KEY,
  equipo_id int,
  evento varchar(255),
  descripcion text,
  fecha timestamp,
  usuario_id int
);

CREATE TABLE Usuarios (
  id serial PRIMARY KEY,
  nombre varchar(255),
  email varchar(255),
  perfil_id int,
  activo boolean
);

CREATE TABLE Perfiles (
  id serial PRIMARY KEY,
  nombre varchar(255),
  permisos text
);

CREATE TABLE Auditoria (
  id serial PRIMARY KEY,
  usuario_id int,
  accion varchar(255),
  entidad varchar(255),
  entidad_id int,
  detalle text,
  fecha timestamp
);

CREATE TABLE InventariosFisicos (
  id serial PRIMARY KEY,
  equipo_id int,
  fecha date,
  estado_sistema varchar(255),
  estado_fisico varchar(255),
  diferencia text,
  observacion text,
  escaneado boolean
);

CREATE TABLE Configuraciones (
  id serial PRIMARY KEY,
  clave varchar(255),
  valor text,
  descripcion text
);

CREATE TABLE LogsSistema (
  id serial PRIMARY KEY,
  usuario_id int,
  accion varchar(255),
  fecha timestamp,
  ip_origen varchar(255)
);

CREATE TABLE Bodegas (
  id serial PRIMARY KEY,
  nombre varchar(255),
  descripcion text,
  ubicacion_geografica varchar(255),
  responsable_id int,
  created_at timestamp
);

CREATE TABLE Ubicaciones (
  id serial PRIMARY KEY,
  bodega_id int,
  nombre varchar(255),
  tipo varchar(255),
  ubicacion_padre_id int,
  codigo_referencia varchar(255)
);

CREATE TABLE MovimientosFisicos (
  id serial PRIMARY KEY,
  equipo_id int,
  ubicacion_origen_id int,
  ubicacion_destino_id int,
  fecha timestamp,
  usuario_id int,
  observacion text
);

-- ================================
-- CLAVES FORÁNEAS
-- ================================

ALTER TABLE Equipos ADD FOREIGN KEY (categoria_id) REFERENCES Categorias(id);
ALTER TABLE Equipos ADD FOREIGN KEY (subcategoria_id) REFERENCES Subcategorias(id);
ALTER TABLE Equipos ADD FOREIGN KEY (modalidad_adquisicion_id) REFERENCES ModalidadesAdquisicion(id);
ALTER TABLE Equipos ADD FOREIGN KEY (proveedor_id) REFERENCES Proveedores(id);
ALTER TABLE Equipos ADD FOREIGN KEY (licitacion_id) REFERENCES Licitaciones(id);
ALTER TABLE Equipos ADD FOREIGN KEY (ubicacion_id) REFERENCES Ubicaciones(id);

ALTER TABLE DocumentosEquipo ADD FOREIGN KEY (equipo_id) REFERENCES Equipos(id);

ALTER TABLE Subcategorias ADD FOREIGN KEY (categoria_id) REFERENCES Categorias(id);

ALTER TABLE Asignaciones ADD FOREIGN KEY (equipo_id) REFERENCES Equipos(id);
ALTER TABLE Asignaciones ADD FOREIGN KEY (usuario_id) REFERENCES Usuarios(id);
ALTER TABLE Asignaciones ADD FOREIGN KEY (responsable_id) REFERENCES Usuarios(id);

ALTER TABLE EstadosStock ADD FOREIGN KEY (equipo_id) REFERENCES Equipos(id);

ALTER TABLE Movimientos ADD FOREIGN KEY (equipo_id) REFERENCES Equipos(id);
ALTER TABLE Movimientos ADD FOREIGN KEY (usuario_id) REFERENCES Usuarios(id);

ALTER TABLE Usuarios ADD FOREIGN KEY (perfil_id) REFERENCES Perfiles(id);

ALTER TABLE Auditoria ADD FOREIGN KEY (usuario_id) REFERENCES Usuarios(id);

ALTER TABLE InventariosFisicos ADD FOREIGN KEY (equipo_id) REFERENCES Equipos(id);

ALTER TABLE LogsSistema ADD FOREIGN KEY (usuario_id) REFERENCES Usuarios(id);

ALTER TABLE Bodegas ADD FOREIGN KEY (responsable_id) REFERENCES Usuarios(id);

ALTER TABLE Ubicaciones ADD FOREIGN KEY (bodega_id) REFERENCES Bodegas(id);
ALTER TABLE Ubicaciones ADD FOREIGN KEY (ubicacion_padre_id) REFERENCES Ubicaciones(id);

ALTER TABLE MovimientosFisicos ADD FOREIGN KEY (equipo_id) REFERENCES Equipos(id);
ALTER TABLE MovimientosFisicos ADD FOREIGN KEY (ubicacion_origen_id) REFERENCES Ubicaciones(id);
ALTER TABLE MovimientosFisicos ADD FOREIGN KEY (ubicacion_destino_id) REFERENCES Ubicaciones(id);
ALTER TABLE MovimientosFisicos ADD FOREIGN KEY (usuario_id) REFERENCES Usuarios(id);


select * from equipos;


GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO root;

GRANT USAGE ON SCHEMA public TO root;


ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO root;



