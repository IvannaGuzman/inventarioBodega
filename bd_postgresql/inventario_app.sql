--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-06-23 01:45:43

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5008 (class 1262 OID 16546)
-- Name: inventario_app; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE inventario_app WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Chile.1252';


ALTER DATABASE inventario_app OWNER TO postgres;

\connect inventario_app

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: root
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO root;

--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: root
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 230 (class 1259 OID 16776)
-- Name: bodega; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bodega (
    id_bodega integer NOT NULL,
    nombre character varying(100) NOT NULL,
    direccion character varying(255),
    telefono_contacto character varying(20),
    encargado_id integer
);


ALTER TABLE public.bodega OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16775)
-- Name: bodega_id_bodega_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bodega_id_bodega_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bodega_id_bodega_seq OWNER TO postgres;

--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 229
-- Name: bodega_id_bodega_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bodega_id_bodega_seq OWNED BY public.bodega.id_bodega;


--
-- TOC entry 222 (class 1259 OID 16729)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id_city integer NOT NULL,
    name character varying(100) NOT NULL,
    region_id integer,
    country_id integer
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16728)
-- Name: cities_id_city_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_id_city_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cities_id_city_seq OWNER TO postgres;

--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 221
-- Name: cities_id_city_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_city_seq OWNED BY public.cities.id_city;


--
-- TOC entry 218 (class 1259 OID 16710)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id_country integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16709)
-- Name: countries_id_country_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_id_country_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.countries_id_country_seq OWNER TO postgres;

--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 217
-- Name: countries_id_country_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_country_seq OWNED BY public.countries.id_country;


--
-- TOC entry 244 (class 1259 OID 16897)
-- Name: despacho_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.despacho_producto (
    id integer NOT NULL,
    fecha date NOT NULL,
    destinatario_id integer,
    tipo_producto_id integer,
    producto_id integer,
    serie_id character varying(100),
    cantidad integer,
    origen_equipo character varying(255),
    destino_despacho character varying(255),
    despacho_realizado character varying(255),
    estado_entrega_id integer,
    observacion text
);


ALTER TABLE public.despacho_producto OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16896)
-- Name: despacho_producto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.despacho_producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.despacho_producto_id_seq OWNER TO postgres;

--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 243
-- Name: despacho_producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.despacho_producto_id_seq OWNED BY public.despacho_producto.id;


--
-- TOC entry 242 (class 1259 OID 16887)
-- Name: estado_entrega; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado_entrega (
    id_estado integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.estado_entrega OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16886)
-- Name: estado_entrega_id_estado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estado_entrega_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estado_entrega_id_estado_seq OWNER TO postgres;

--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 241
-- Name: estado_entrega_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estado_entrega_id_estado_seq OWNED BY public.estado_entrega.id_estado;


--
-- TOC entry 238 (class 1259 OID 16854)
-- Name: ingreso_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingreso_producto (
    id integer NOT NULL,
    fecha date,
    tipo_producto character varying(100),
    producto character varying(255),
    marca character varying(100),
    serie_id character varying(100),
    cantidad integer,
    lugar_origen character varying(255),
    direccion_origen character varying(255),
    equipo_arriendo_id character varying(100),
    despacho_realizado character varying(255),
    caja_vacia character varying(255),
    donde_esta character varying(255)
);


ALTER TABLE public.ingreso_producto OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16853)
-- Name: ingreso_producto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingreso_producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ingreso_producto_id_seq OWNER TO postgres;

--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 237
-- Name: ingreso_producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingreso_producto_id_seq OWNED BY public.ingreso_producto.id;


--
-- TOC entry 232 (class 1259 OID 16788)
-- Name: movimiento_tipo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movimiento_tipo (
    id_tipo integer NOT NULL,
    nombre character varying(20) NOT NULL
);


ALTER TABLE public.movimiento_tipo OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16787)
-- Name: movimiento_tipo_id_tipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movimiento_tipo_id_tipo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movimiento_tipo_id_tipo_seq OWNER TO postgres;

--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 231
-- Name: movimiento_tipo_id_tipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movimiento_tipo_id_tipo_seq OWNED BY public.movimiento_tipo.id_tipo;


--
-- TOC entry 224 (class 1259 OID 16746)
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persona (
    id_persona integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    cargo character varying(100),
    email character varying(100),
    telefono character varying(20),
    rut character varying(20),
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.persona OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16878)
-- Name: persona_destinatario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persona_destinatario (
    id_destinatario integer NOT NULL,
    nombre_completo character varying(255) NOT NULL
);


ALTER TABLE public.persona_destinatario OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16877)
-- Name: persona_destinatario_id_destinatario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persona_destinatario_id_destinatario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.persona_destinatario_id_destinatario_seq OWNER TO postgres;

--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 239
-- Name: persona_destinatario_id_destinatario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.persona_destinatario_id_destinatario_seq OWNED BY public.persona_destinatario.id_destinatario;


--
-- TOC entry 223 (class 1259 OID 16745)
-- Name: persona_id_persona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persona_id_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.persona_id_persona_seq OWNER TO postgres;

--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 223
-- Name: persona_id_persona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.persona_id_persona_seq OWNED BY public.persona.id_persona;


--
-- TOC entry 228 (class 1259 OID 16761)
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    id_producto integer NOT NULL,
    modelo character varying(100),
    marca character varying(100),
    serie_id character varying(100),
    estado character varying(20) DEFAULT 'nuevo'::character varying,
    fecha_ingreso date,
    id_tipo_producto integer
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16760)
-- Name: producto_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.producto_id_producto_seq OWNER TO postgres;

--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 227
-- Name: producto_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_id_producto_seq OWNED BY public.producto.id_producto;


--
-- TOC entry 220 (class 1259 OID 16717)
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    id_region integer NOT NULL,
    name character varying(100) NOT NULL,
    country_id integer
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16716)
-- Name: regions_id_region_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.regions_id_region_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.regions_id_region_seq OWNER TO postgres;

--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 219
-- Name: regions_id_region_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.regions_id_region_seq OWNED BY public.regions.id_region;


--
-- TOC entry 236 (class 1259 OID 16814)
-- Name: registro_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registro_producto (
    id_registro_producto integer NOT NULL,
    fecha date NOT NULL,
    cantidad integer NOT NULL,
    serie_id character varying(100),
    equipo_arriendo_id character varying(100),
    observacion text,
    despacho_realizado character varying(255),
    ubicacion_actual character varying(255),
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    producto_id integer,
    bodega_origen_id integer,
    id_persona_despacha integer,
    persona_recibe_id integer,
    usuario_registra_id integer,
    tipo_movimiento_id integer
);


ALTER TABLE public.registro_producto OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16813)
-- Name: registro_producto_id_registro_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registro_producto_id_registro_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.registro_producto_id_registro_producto_seq OWNER TO postgres;

--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 235
-- Name: registro_producto_id_registro_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registro_producto_id_registro_producto_seq OWNED BY public.registro_producto.id_registro_producto;


--
-- TOC entry 234 (class 1259 OID 16797)
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    id_stock integer NOT NULL,
    id_producto integer,
    id_bodega integer,
    cantidad integer NOT NULL
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16796)
-- Name: stock_id_stock_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_id_stock_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_id_stock_seq OWNER TO postgres;

--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 233
-- Name: stock_id_stock_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_id_stock_seq OWNED BY public.stock.id_stock;


--
-- TOC entry 226 (class 1259 OID 16754)
-- Name: tipo_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_producto (
    id_tipo_producto integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.tipo_producto OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16753)
-- Name: tipo_producto_id_tipo_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_producto_id_tipo_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_producto_id_tipo_producto_seq OWNER TO postgres;

--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 225
-- Name: tipo_producto_id_tipo_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_producto_id_tipo_producto_seq OWNED BY public.tipo_producto.id_tipo_producto;


--
-- TOC entry 4768 (class 2604 OID 16779)
-- Name: bodega id_bodega; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bodega ALTER COLUMN id_bodega SET DEFAULT nextval('public.bodega_id_bodega_seq'::regclass);


--
-- TOC entry 4762 (class 2604 OID 16732)
-- Name: cities id_city; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id_city SET DEFAULT nextval('public.cities_id_city_seq'::regclass);


--
-- TOC entry 4760 (class 2604 OID 16713)
-- Name: countries id_country; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id_country SET DEFAULT nextval('public.countries_id_country_seq'::regclass);


--
-- TOC entry 4776 (class 2604 OID 16900)
-- Name: despacho_producto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.despacho_producto ALTER COLUMN id SET DEFAULT nextval('public.despacho_producto_id_seq'::regclass);


--
-- TOC entry 4775 (class 2604 OID 16890)
-- Name: estado_entrega id_estado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_entrega ALTER COLUMN id_estado SET DEFAULT nextval('public.estado_entrega_id_estado_seq'::regclass);


--
-- TOC entry 4773 (class 2604 OID 16857)
-- Name: ingreso_producto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingreso_producto ALTER COLUMN id SET DEFAULT nextval('public.ingreso_producto_id_seq'::regclass);


--
-- TOC entry 4769 (class 2604 OID 16791)
-- Name: movimiento_tipo id_tipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimiento_tipo ALTER COLUMN id_tipo SET DEFAULT nextval('public.movimiento_tipo_id_tipo_seq'::regclass);


--
-- TOC entry 4763 (class 2604 OID 16749)
-- Name: persona id_persona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona ALTER COLUMN id_persona SET DEFAULT nextval('public.persona_id_persona_seq'::regclass);


--
-- TOC entry 4774 (class 2604 OID 16881)
-- Name: persona_destinatario id_destinatario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona_destinatario ALTER COLUMN id_destinatario SET DEFAULT nextval('public.persona_destinatario_id_destinatario_seq'::regclass);


--
-- TOC entry 4766 (class 2604 OID 16764)
-- Name: producto id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto ALTER COLUMN id_producto SET DEFAULT nextval('public.producto_id_producto_seq'::regclass);


--
-- TOC entry 4761 (class 2604 OID 16720)
-- Name: regions id_region; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions ALTER COLUMN id_region SET DEFAULT nextval('public.regions_id_region_seq'::regclass);


--
-- TOC entry 4771 (class 2604 OID 16817)
-- Name: registro_producto id_registro_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro_producto ALTER COLUMN id_registro_producto SET DEFAULT nextval('public.registro_producto_id_registro_producto_seq'::regclass);


--
-- TOC entry 4770 (class 2604 OID 16800)
-- Name: stock id_stock; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock ALTER COLUMN id_stock SET DEFAULT nextval('public.stock_id_stock_seq'::regclass);


--
-- TOC entry 4765 (class 2604 OID 16757)
-- Name: tipo_producto id_tipo_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_producto ALTER COLUMN id_tipo_producto SET DEFAULT nextval('public.tipo_producto_id_tipo_producto_seq'::regclass);


--
-- TOC entry 4988 (class 0 OID 16776)
-- Dependencies: 230
-- Data for Name: bodega; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4980 (class 0 OID 16729)
-- Dependencies: 222
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4976 (class 0 OID 16710)
-- Dependencies: 218
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5002 (class 0 OID 16897)
-- Dependencies: 244
-- Data for Name: despacho_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (395, '2025-04-22', 15, 1, 95, '52786', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'JUAN DUJISIN', 1, 'MOUSE INALAMBRICO LOGITECH');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (396, '2024-12-10', 12, 1, 116, '100101380', 20, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'Airpods');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (397, '2025-03-18', 23, 1, 126, ' 8SSA10R16922C2TJ', 1, 'TECNODATA', 'ALAMEDA PISO 4', 'MAXIMILIANO SALAZAR', 1, 'CARGADOR TIPO C LENOVO X1');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (398, '2024-10-12', 31, 5, 129, ' V90DD2GK', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (399, '2025-03-01', 13, 5, 130, ' V90DD2HB', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'JUAN DUJISIN', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (400, '2025-04-02', 32, 6, 132, '0L672', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'PENDRIVE KINGSTON 256GB');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (401, '2025-04-02', 33, 6, 132, '0L672', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'PENDRIVE KINGSTON 256GB');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (402, '2025-11-03', 12, 4, 530, 'STMGQJ1C601', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'NOTEBOOK MACBOOK');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (403, '2025-10-02', 34, 6, 132, '0L672', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'PENDRIVE KINGSTON 256GB');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (404, '2025-10-02', 35, 6, 132, '0L672', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'PENDRIVE KINGSTON 256GB');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (405, '2025-03-02', 12, 1, 133, '100119017-E', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 5', 'SEBASTIAN DINAMARCA', 1, 'MINISOPURU SUPERIOR SPEED 40GBPS M.2 NVME SSD ENCLOSURE ');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (406, '2025-01-15', 13, 1, 140, '2420SC109EH9', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'LOGITECH MODELO: MK220');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (407, '2025-01-20', 37, 1, 143, '2420SC109EM9', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 5', 'SEBASTIAN DINAMARCA', 1, 'TECLADO INALAMBRICO LOGIN');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (408, '2024-09-01', 39, 1, 151, '4X30M39482KPV257M8', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 5', 'JUAN DUJISIN', 1, 'TECLADO INALAMBRICO CON PILAS ');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (409, '2024-08-01', 12, 1, 156, '8CCD50M39532KPV257MC', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'TECLADO INALAMBRICO CON PILAS ');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (410, '2024-08-01', 12, 1, 157, '8CCM50M39559MPV257MC', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'MOUSE INALAMBRICO N PILAS');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (411, '2025-01-17', 67, 1, 160, '8SSD50M3948KPV257LZ', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'TECLADO INALAMBRICO LENOVO');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (412, '2025-04-15', 69, 1, 161, '8SSD50M39532KPV257MG', 1, 'ALAMEDA PISO 4 BODEGA', 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'SEBASTIAN DINAMARCA', 1, 'TECLADO INALAMBRICO LENOVO');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (413, '2025-04-15', 71, 1, 162, '8SSD50M39532KPV257MK', 1, 'ALAMEDA PISO 4 BODEGA', 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'SEBASTIAN DINAMARCA', 1, 'TECLADO INALAMBRICO LENOVO');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (414, '2025-04-28', 72, 1, 163, '8SSD50M39532KPV257MP', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'TECLADO INALAMBRICO LENOVO');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (415, '2025-01-17', 67, 1, 164, '8SSM50M39559MPV257LZ', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 5', 'SEBASTIAN DINAMARCA', 1, 'MOUSE INALAMBRICO LENOVO CON PILAS');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (416, '2025-04-15', 69, 1, 165, '8SSM50M39559MPV257MG', 1, 'ALAMEDA PISO 4 BODEGA', 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'SEBASTIAN DINAMARCA', 1, 'MOUSE INALAMBRICO LENOVO');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (417, '2025-04-15', 71, 1, 166, '8SSM50M39559MPV257MK', 1, 'ALAMEDA PISO 4 BODEGA', 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'SEBASTIAN DINAMARCA', 1, 'MOUSE INALAMBRICO LENOVO');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (418, '2025-04-28', 72, 1, 167, '8SSM50M39559MPV257MP', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'MOUSE INALAMBRICO LENOVO');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (419, '2025-03-19', 47, 7, 218, 'HYY7M76R65', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'IPAD AIR');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (420, '2025-03-13', 14, 7, 231, 'KCX1XH94X3', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'IPAD AIR DEVUELTO 27/05/2025');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (421, '2025-06-06', 79, 7, 183, 'CFN63FPNW5', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'JUAN DUJISIN', 1, 'IPAD PRO 11 CON CARCASA ');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (422, '2025-06-02', 12, 7, 198, 'FHW79M7WVM', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'IPAD PRO 11 REALIZANDO PRUEBAS');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (423, '2025-04-14', 12, 7, 205, 'GGK3QLCXRD', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'IPAD PRO 11');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (424, '2025-01-30', 12, 6, 233, 'KF556S40IB-32', 2, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 8', 'SEBASTIAN DINAMARCA', 1, 'MEMORIA RAM KNF 32 GB 5600MHz DDR5 SODIMM FURY ');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (425, '2025-04-06', 89, 7, 237, 'L24P4T04CL', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'IPAD PRO 11 CON CARCASA SIN TAPA');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (426, '2025-04-06', 89, 7, 239, 'L7CQY3P7NV', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'IPAD PRO 11');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (427, '2025-02-18', 90, 2, 267, 'MP2A69WF - 71757', 1, 'ALAMEDA PISO 4 BODEGA', 'CHILLAN LIBERTAD #418', 'JUAN DUJISIN', 1, 'LENOVO NEO 50A CON TECLADO Y MOUSE');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (428, '2025-01-13', 91, 2, 580, 'MP2A69WZ', 1, 'ALAMEDA PISO 4 BODEGA', 'SANTO DOMINGO TEATINOS #601', 'SEBASTIAN DINAMARCA', 1, 'EQUIPO AIO NEO50A CON ACCESORIOS ($1.000,000) ');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (429, '2025-01-13', 93, 2, 269, 'MP2A69XF', 1, 'ALAMEDA PISO 4 BODEGA', 'SANTO DOMINGO TEATINOS #601', 'SEBASTIAN DINAMARCA', 1, 'EQUIPO AIO NEO50A CON ACCESORIOS ($1.000,000) ');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (430, '2025-01-16', 96, 2, 270, 'MP2A71NC', 1, 'ALAMEDA PISO 4 BODEGA', 'HUERFANOS PISO 2', 'JUAN DUJISIN', 1, 'EQUIPO AIO NEO50A CON ACCESORIOS ($1.000,000) ');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (431, '2025-01-16', 97, 2, 274, 'MP2AC8LN', 1, 'ALAMEDA PISO 4 BODEGA', 'HUERFANOS PISO 2', 'SEBASTIAN DINAMARCA', 1, 'EQUIPO AIO NEO50A CON ACCESORIOS ($1.000,000) ');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (432, '2025-01-16', 99, 2, 277, 'MP2ACB04', 1, 'ALAMEDA PISO 4 BODEGA', 'HUERFANOS PISO 2', 'JUAN DUJISIN', 1, 'EQUIPO AIO NEO50A CON ACCESORIOS ($1.000,000) ');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (433, '2025-01-21', 100, 2, 278, 'MP2ACFGC', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 6', 'SEBASTIAN DINAMARCA', 1, 'EQUIPO AIO NEO50A CON ACCESORIOS ($1.000,000) ');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (434, '2025-01-17', 102, 2, 279, 'MP2ACHSM', 1, 'ALAMEDA PISO 4 BODEGA', 'SAN FERNANDO AV. MANUEL RODRIGUEZ #595', 'JUAN DUJISIN', 1, 'AIO NEO50A');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (435, '2024-12-18', 100, 2, 283, 'MP2AELBX', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'EQUIPO AIO NEO50A ($1.000,000)');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (436, '2025-04-14', 106, 7, 268, 'MXHVQW6LLQ', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA', 'MICHEL SILVA', 1, 'IPAD PRO 11');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (437, '2025-04-23', 113, 1, 289, 'PC0QRW9R', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 3', 'SEBASTIAN DINAMARCA', 1, 'TECLADO EXTERNO LENOVO USB');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (438, '2025-04-23', 114, 1, 290, 'PC0QRW9T', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 3', 'SEBASTIAN DINAMARCA', 1, 'TECLADO EXTERNO LENOVO USB');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (439, '2025-04-15', 116, 1, 291, 'PC0QRW9V', 1, 'ALAMEDA PISO 4 BODEGA', 'ÑUÑOA AV. JOSE PEDRO ALESSANDRI #211', 'SEBASTIAN DINAMARCA', 1, 'TECLADO EXTERNO LENOVO USB');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (440, '2025-04-23', 117, 1, 292, 'PC0QRW9W', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 3', 'SEBASTIAN DINAMARCA', 1, 'TECLADO EXTERNO LENOVO USB');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (441, '2025-05-29', 119, 4, 307, 'PF3BQVB5', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'LENOVO V15 CON SUS ACCESORIOS MOCHILA, MOUSE, CANDADO');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (442, '2024-05-30', 131, 4, 317, 'PF4JQ0R7', 1, 'ALAMEDA PISO 4 BODEGA', 'VALDIVIA YUNGAY #550 ', 'SEBASTIAN DINAMARCA', 1, 'NOTEBOOK X1 CARBON ($1,200,000)CON ACCESORIOS');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (443, '2024-03-04', 136, 4, 319, 'PF4JR41C', 1, 'ALAMEDA PISO 4 BODEGA', 'COPIAPO ATACAMA #443 PRIMER PISO', 'SEBASTIAN DINAMARCA', 1, 'NOTEBOOK X1 CARBON ($1,200,000)');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (444, '2024-03-26', 3, 4, 323, 'PF4JRK3V', 1, 'ALAMEDA PISO 4 BODEGA', 'CHILLAN LIBERTAD #418', 'SEBASTIAN DINAMARCA', 1, 'NOTEBOOK X1 CARBON ($1,200,000)');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (445, '2024-03-04', 141, 4, 324, 'PF4JRLQ2', 1, 'ALAMEDA PISO 4 BODEGA', 'COPIAPO ATACAMA #443 PRIMER PISO', 'SEBASTIAN DINAMARCA', 1, 'NOTEBOOK X1 CARBON ($1,200,000)');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (446, '2025-03-26', 142, 4, 325, 'PF4JRLR6', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 6', 'SEBASTIAN DINAMARCA', 1, 'LENOVO X1');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (447, '2024-03-04', 145, 4, 326, 'PF4JRPQD', 1, 'ALAMEDA PISO 4 BODEGA', 'CALDERA ANGEL SCOLA #593', 'ADOLFO ACEVEDO', 1, 'NOTEBOOK X1 CARBON ($1,200,000)');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (448, '2024-03-04', 146, 4, 327, 'PF4JRPQP', 1, 'ALAMEDA PISO 4 BODEGA', 'COPIAPO ATACAMA #443 PRIMER PISO', 'SEBASTIAN DINAMARCA', 1, 'NOTEBOOK X1 CARBON ($1,200,000)');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (449, '2024-11-25', 147, 4, 331, 'PF4Z1R7H', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 6', 'SEBASTIAN DINAMARCA', 1, 'NOTEBOOK X1 CARBON ($1,200,000) CON ACCCESORIOS ');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (450, '2024-10-12', 11, 4, 332, 'PF5E410V', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'NOTEBOOK LENOVO NTB P16 I9 PRO WI11');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (451, '2025-10-02', 13, 4, 332, 'PF5E410V', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'LENOVO NTB P16 CON ADAPTADOR DE RED');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (452, '2024-12-16', 150, 4, 333, 'PF5E411J', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'NOTEBOOK LENOVO NTB P16 I9 PRO WI11');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (453, '2025-04-14', 153, 7, 288, 'PM94Y3JVX1', 1, 'ALAMEDA PISO 4 BODEGA', 'SANTO DOMINGO TEATINOS #601', 'MICHEL SILVA', 1, 'IPAD PRO 11');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (454, '2025-08-02', 155, 1, 336, 'PV23364803159', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'HUB USB HD4005 MAC');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (455, '2025-04-14', 157, 1, 337, 'PV23364804338', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'HUB HD4005 HYPER (PRESTAMO DIA JUVES)');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (456, '2025-03-06', 158, 7, 334, 'PWGHG34497', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'IPAD PRO 11 ');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (457, '2025-03-13', 12, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'ADAPTADOR DISPLAY PORT A HDMI');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (458, '2025-04-30', 13, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'JUAN DUJISIN', 1, 'ADAPTADOR ETHERNET');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (459, '2025-03-04', 171, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'ALZA NOTEBOOK KENSINGTON');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (460, '2025-03-04', 172, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'ALZA NOTEBOOK KENSINGTON');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (461, '2025-03-04', 173, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'ALZA NOTEBOOK KENSINGTON');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (462, '2025-03-04', 174, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'ALZA NOTEBOOK KENSINGTON');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (463, '2025-03-04', 78, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'ALZA NOTEBOOK KENSINGTON');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (464, '2025-04-17', 175, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA', 'SEBASTIAN DINAMARCA', 1, 'AOWEIXUN HDMI');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (465, '2025-04-23', 79, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'JUAN DUJISIN', 1, 'AOWEIXUN HDMI');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (466, '2025-04-15', 127, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'COYHAIQUE PRAT #580', 'JUAN DUJISIN', 1, 'AUDIFONOS CON MICROFONO JABRA');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (467, '2025-05-03', 80, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'JUAN DUJISIN', 1, 'CANDADO LENOVO V15');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (468, '2025-05-03', 176, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'JUAN DUJISIN', 1, 'CANDADO LENOVO V15');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (469, '2025-05-03', 78, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'JUAN DUJISIN', 1, 'CANDADO LENOVO V15');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (470, '2025-05-03', 177, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'JUAN DUJISIN', 1, 'CANDADO LENOVO V15');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (471, '2025-06-03', 172, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'JUAN DUJISIN', 1, 'CANDADO LENOVO V15');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (472, '2025-03-14', NULL, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 8', 'ADOLFO ACEVEDO', 1, 'CANDADO LENOVO V15');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (473, '2025-01-03', 173, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'CANDADO NANO X1 CARBÓN');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (474, '2025-03-25', 176, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'CANDADO NANO X1 CARBÓN');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (475, '2025-03-25', 80, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'CANDADO NANO X1 CARBÓN');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (476, '2025-03-25', 172, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'CANDADO NANO X1 CARBÓN');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (477, '2025-03-27', 78, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'CANDADO NANO X1 CARBÓN');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (478, '2025-04-22', 178, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'HUERFANOS PISO 4', 'JUAN DUJISIN', 1, 'CANDADO NANO X1 CARBÓN');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (479, '2025-03-13', 14, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'CARCASA IPAD AIR');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (480, '2025-05-20', 34, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'JUAN DUJISIN', 1, 'CARCASA IPAD');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (481, '2025-02-18', 179, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 6', 'JUAN DUJISIN', 1, 'CABLE HDMI XTECH EN CONJUNTO CON MONITOR');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (482, '2025-05-26', 180, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'HUERFANOS PISO 9', 'SEBASTIAN DINAMARCA', 1, 'CABLE HDMI XTECH');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (483, '2025-02-27', 46, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'HUERFANOS', 'JUAN DUJISIN', 1, 'HUB  ');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (484, '2025-03-14', 14, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'HUB  ');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (485, '2025-06-05', 181, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'SAN CARLOS MAIPU #743', 'JUAN DUJISIN', 1, 'HUB ');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (486, '2025-05-22', 182, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'LA CALERA JOSE JOAQUIN PEREZ #595, LOCAL 2', 'JUAN DUJISIN', 1, 'HUB ');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (487, '2025-07-05', 47, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'COFRE MINISOPURU SUPERIOR SPEED 40GBPS M.2 NVME SSD ENCLOSURE');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (488, '2025-03-24', 20, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'MOCHILA GRANDE NEGRA');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (489, '2025-03-06', 148, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 8', 'SEBASTIAN DINAMARCA', 1, 'MOCHILA GRIS');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (490, '2025-02-18', 34, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'JUAN DUJISIN', 1, 'ENTREGA A TECNICO MDA');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (491, '2025-02-26', 20, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'JUAN DUJISIN', 1, 'MOCHILA NEGRA');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (492, '2025-04-30', 183, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'RAUL GALLARDO', 1, 'MOCHILA NEGRA CHICA');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (493, '2025-05-23', 13, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'ADOLFO ACEVEDO', 1, 'MOCHILA NEGRA CHICA');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (494, '2024-01-07', 184, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'SANTO DOMINGO TEATINOS #601', 'SEBASTIAN DINAMARCA', 1, 'PENCIL');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (495, '2024-08-07', 27, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'PENCIL');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (496, '2024-08-07', 12, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'PENCIL');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (497, '2024-07-24', 11, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'PENCIL');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (498, '2024-02-08', 185, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA', 'SEBASTIAN DINAMARCA', 1, 'PENCIL');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (499, '2025-07-02', 188, 1, 361, 'SE20E12927', 1, 'ALAMEDA PISO 4 BODEGA', 'TOME SERRANO #1111 LOCAL 5', 'JUAN DUJISIN', 1, 'LECTOR BIOMETRICO -HUELLERO FONASA ($80.000)');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (500, '2025-07-02', 189, 1, 363, 'SE20E12929', 1, 'ALAMEDA PISO 4 BODEGA', 'COLINA AV. GENERAL SAN MARTIN #105, LOCAL 16', 'JUAN DUJISIN', 1, 'LECTOR BIOMETRICO -HUELLERO FONASA ($80.000)');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (501, '2025-07-02', 189, 1, 364, 'SE20E12930', 1, 'ALAMEDA PISO 4 BODEGA', 'COLINA AV. GENERAL SAN MARTIN #105, LOCAL 16', 'JUAN DUJISIN', 1, 'LECTOR BIOMETRICO -HUELLERO FONASA ($80.000)');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (502, '2025-07-02', 189, 1, 365, 'SE20E12931', 1, 'ALAMEDA PISO 4 BODEGA', 'COLINA AV. GENERAL SAN MARTIN #105, LOCAL 16', 'JUAN DUJISIN', 1, 'LECTOR BIOMETRICO -HUELLERO FONASA ($80.000)');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (503, '2025-01-28', 11, 4, 394, 'SHPL9H4Q4TD', 1, 'ALAMEDA PISO 4 BODEGA', 'HUERFANOS PISO 4', 'SEBASTIAN DINAMARCA', 1, 'APPLE MACBOOK PRO / APPLE M3 MAX / 1TB MAS TECLADO Y MOUSE');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (504, '2024-06-27', 193, 4, 432, 'SPF4JR91', 1, 'ALAMEDA PISO 4 BODEGA', 'TEMUCO MATTA #62 ,1º PISO', 'YANARA CABRERA', 1, 'NOTEBOOK X1 CARBON ($1,200,000)');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (505, '2024-12-16', 198, 3, 573, 'U63885M3N922745', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'JUAN DUJISIN', 1, 'IMPRESORA BROTHER DCP/2540DW (850.000) CON TONER');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (506, '2024-05-12', 200, 5, 540, 'V90DD2G8 ', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'MONITOR LENOVO C24-40');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (507, '2024-10-12', 24, 5, 541, 'V90DD2GA', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (508, '2024-11-12', 201, 5, 542, 'V90DD2GD', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 8', 'JUAN DUJISIN', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (509, '2024-11-10', 67, 5, 543, 'V90DD2GL', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'MARCO FLORES', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (510, '2024-11-10', 202, 5, 544, 'V90DD2GR', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'MARCO FLORES', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (511, '2024-11-10', 203, 5, 545, 'V90DD2GX', 1, 'ALAMEDA PISO 4 BODEGA', 'CENTRO HUERFANOS', 'MARCO FLORES', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (512, '2024-10-12', 53, 5, 546, 'V90DD2GZ', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (513, '2025-07-02', 204, 5, 547, 'V90DD2H0', 1, 'ALAMEDA PISO 4 BODEGA', 'HUERFANOS PISO 10', 'SEBASTIAN DINAMARCA', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (514, '2024-10-23', 205, 5, 548, 'V90DD2H1', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'ADOLFO ACEVEDO', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (515, '2025-07-01', 206, 5, 549, 'V90DD2H4', 1, 'ALAMEDA PISO 4 BODEGA', 'HUERFANOS PISO 10', 'JORGE', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (516, '2025-07-01', 9, 5, 550, 'V90DD2H4 ', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 8', 'ADOLFO ACEVEDO', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (517, '2024-10-12', 56, 5, 551, 'V90DD2H5', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (518, '2024-12-31', 207, 5, 552, 'V90DD2H6', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (519, '2024-10-12', 55, 5, 553, 'V90DD2H7', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (520, '2024-10-12', 54, 5, 554, 'V90DD2HA', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (521, '2024-11-12', 58, 5, 555, 'V90DD2HC', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 8', 'JUAN DUJISIN', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (522, '2024-12-19', 208, 5, 556, 'V90DD2HF', 1, 'ALAMEDA PISO 4 BODEGA', 'HUERFANOS PISO 7', 'JUAN DUJISIN', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (523, '2024-12-17', 209, 5, 557, 'V90DD2HG', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'JUAN DUJISIN', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (524, '2025-07-02', 210, 5, 558, 'V90DD2HK', 1, 'ALAMEDA PISO 4 BODEGA', 'HUERFANOS PISO 10', 'ALEX PEREZ', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (525, '2024-10-10', 211, 5, 559, 'V90DD2HM', 1, 'ALAMEDA PISO 4 BODEGA', 'CENTRO HUERFANOS', 'MARCO FLORES', 1, 'PANTALLA EXTERNA LENOVO 24');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (526, '2025-12-03', 11, 7, 560, 'WNMGG63HPV', 1, 'ALAMEDA PISO 4 BODEGA', 'HUERFANOS PISO 4', 'JUAN DUJISIN', 1, 'IPAD PRO 11');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (527, '2025-05-20', 34, 7, 565, 'Y4W6V4CXXN', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'JUAN DUJISIN', 1, 'IPAD PRO 11 ');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (528, '2025-10-06', 120, 1, 569, 'PV23364803712', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'HUB HD4005 HYPER');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (529, '2025-10-06', 12, 1, 568, 'PV23364803707', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'SEBASTIAN DINAMARCA', 1, 'HUB HD4005 HYPER');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (530, '2025-11-06', 214, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'JUAN DUJISIN', 1, 'HDMI XTECH');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (531, '2025-12-06', 215, 1, 578, 'F0T3492RG6HJKP3AP', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 6', 'SEBASTIAN DINAMARCA', 1, 'TECLADO MAGIC MAC NUMERICO');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (532, '2025-05-16', 216, 4, 575, 'C4T4VYJMG6', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'JUAN DUJISIN', 1, 'MacBook Pro M3');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (533, '2025-12-06', 11, 1, 348, 'S/N', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 4', 'JUAN DUJISIN', 1, 'CANDADO NANO X1 CARBÓN');
INSERT INTO public.despacho_producto (id, fecha, destinatario_id, tipo_producto_id, producto_id, serie_id, cantidad, origen_equipo, destino_despacho, despacho_realizado, estado_entrega_id, observacion) VALUES (534, '2025-06-17', 220, 4, 567, 'K7YP3QTW79', 1, 'ALAMEDA PISO 4 BODEGA', 'ALAMEDA PISO 5', 'MICHEL SILVA', 1, 'MacBook Pro M3');


--
-- TOC entry 5000 (class 0 OID 16887)
-- Dependencies: 242
-- Data for Name: estado_entrega; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.estado_entrega (id_estado, nombre) VALUES (1, 'ENTREGADO');
INSERT INTO public.estado_entrega (id_estado, nombre) VALUES (2, 'PENDIENTE');


--
-- TOC entry 4996 (class 0 OID 16854)
-- Dependencies: 238
-- Data for Name: ingreso_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (1, '2024-12-11', 'ACCESORIO', 'SOPORTE MONITOR DINON', 'DINON', '9064', 2, 'TICSERVICES', 'Av. Libertador Bernardo O''Higgins N° 1367', 'COMPRA CHILEATIENDE', 'CORREOS', 'SOPORTE UNIVERSAL FIJO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (2, '2024-10-22', 'ACCESORIO', 'CABLE TIPO 8', 'MAGIC', '35792', 10, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA  S.A', 'CABLE MAGIC TIPO 8(U) CABLE DE PODER', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (3, '2024-06-11', 'ACCESORIO', 'ADAPTADOR ETHERNET TIPO C HYPER', 'HYPER ', '35965', 9, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'ASAPTADOR DE RED USB-C ($294,030)', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (4, '2025-04-23', 'ACCESORIO', 'MOCHILA KAMET MAC', 'APPLE', '36784', 7, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'MOCHILA KAMET MAC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (5, '2025-09-01', 'ACCESORIO', 'MOUSE INALAMBRICO LOGITECH', 'LOGITECH', '52786', 12, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'BODEGA PISO 4', 'MOUSE LOGITECH BLUETOOTH M240 SILENT', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (6, '2025-05-13', 'ACCESORIO', 'MOCHILA NEGRA', 'LENOVO', '266698', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'MOCHILA NEGRA', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (7, '2025-05-13', 'ACCESORIO', 'MOCHILA NEGRA', 'LENOVO', '266699', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'MOCHILA NEGRA', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (8, '2025-05-13', 'ACCESORIO', 'MOCHILA NEGRA', 'LENOVO', '266700', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'MOCHILA NEGRA', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (9, '2025-05-13', 'ACCESORIO', 'MOCHILA NEGRA', 'LENOVO', '266701', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'MOCHILA NEGRA', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (10, '2025-05-13', 'ACCESORIO', 'MOCHILA NEGRA', 'LENOVO', '266702', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'MOCHILA NEGRA', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (11, '2025-05-13', 'ACCESORIO', 'MOCHILA NEGRA', 'LENOVO', '266703', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'MOCHILA NEGRA', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (12, '2025-05-13', 'ACCESORIO', 'CANDADO NANO X1 CARBÓN', 'LENOVO', '266780', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'CANDADO NANO X1 CARBÓN', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (13, '2025-05-13', 'ACCESORIO', 'CANDADO NANO X1 CARBÓN', 'LENOVO', '266783', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'CANDADO NANO X1 CARBÓN', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (14, '2025-05-13', 'ACCESORIO', 'CANDADO NANO X1 CARBÓN', 'LENOVO', '266784', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'CANDADO NANO X1 CARBÓN', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (15, '2025-05-13', 'ACCESORIO', 'CANDADO NANO X1 CARBÓN', 'LENOVO', '266785', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'CANDADO NANO X1 CARBÓN', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (16, '2025-05-13', 'ACCESORIO', 'CANDADO NANO X1 CARBÓN', 'LENOVO', '266871', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'CANDADO NANO X1 CARBÓN', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (17, '2025-05-13', 'ACCESORIO', 'CANDADO NANO X1 CARBÓN', 'LENOVO', '266872', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'CANDADO NANO X1 CARBÓN', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (18, '2024-03-12', 'ACCESORIO', 'PUNTERO LASER', 'WIRELESS PRESENTER', '10900306', 6, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PUNTERO LASER PRESENTADOR POWER POINT', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (19, '2025-05-06', 'SMART TV', 'TCL 55 PULGADAS', 'TCL', '12006819', 1, 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'COMPRA', 'PERSONAL DE IPS', 'ENTREGA DE SMART TV 55 PULGADAS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (20, '2025-05-06', 'SMART TV', 'TCL 55 PULGADAS', 'TCL', '12006820', 1, 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'COMPRA', 'PERSONAL DE IPS', 'ENTREGA DE SMART TV 55 PULGADAS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (21, '2025-05-06', 'SMART TV', 'TCL 55 PULGADAS', 'TCL', '12006821', 1, 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'COMPRA', 'PERSONAL DE IPS', 'ENTREGA DE SMART TV 55 PULGADAS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (22, '2025-05-06', 'SMART TV', 'TCL 55 PULGADAS', 'TCL', '12006822', 1, 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'COMPRA', 'PERSONAL DE IPS', 'ENTREGA DE SMART TV 55 PULGADAS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (23, '2025-05-06', 'SMART TV', 'TCL 55 PULGADAS', 'TCL', '12006823', 1, 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'COMPRA', 'PERSONAL DE IPS', 'ENTREGA DE SMART TV 55 PULGADAS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (24, '2025-05-06', 'SMART TV', 'TCL 55 PULGADAS', 'TCL', '12006824', 1, 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'COMPRA', 'PERSONAL DE IPS', 'ENTREGA DE SMART TV 55 PULGADAS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (25, '2025-06-02', 'ACCESORIO', 'CARCASA IPAD PRO', 'MARCA CHINA', '100001080', 85, 'CAMINO AGRICOLA 1697', 'CAMINO AGRICOLA', 'IPS', 'PERSONAL DE IPS', 'FUNDA PARA IPAD PRO 11', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (26, '2024-12-10', 'ACCESORIO', 'Airpods', 'APPLE', '100101380', 20, 'TICSERVICES', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'TIC-SERVICE', 'Airpods', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (27, '2024-10-10', 'ACCESORIO', 'CANDADO DE MAC', 'KENSINGTON', '100106019', 15, 'TICSERVICES', 'AV. DEL PARQUE # 4928 OF. 224', 'TECNODATA  S.A', 'TECNODATA', 'CANDADO KENSINGTON', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (28, '2024-03-12', 'ACCESORIO', 'ADAPTADOR USB-C A DISPLAYPORT', 'P', '100109070', 2, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'CABLE USB-C A DISPLAYPORT 1,4 8K', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (29, '2024-03-12', 'ACCESORIO', 'ADAPTADOR USB-C A HDMI', 'TYPE-C', '100109071', 2, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'CABLE USB-C A HDMI 4K 60HZ 2MTS REFORZADO PARA IPAD MACBOOK', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (30, '2024-10-10', 'ACCESORIO', 'HUB HD4005 HYPER', 'PAS THRU', '100309042', 10, 'TICSERVICES', 'AV. DEL PARQUE # 4928 OF. 224', 'TECNODATA  S.A', 'TECNODATA', 'HUB USB-C', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (31, '2025-04-14', 'TABLET', 'IPAD AIR', 'APPLE', 'C1KXFVMW29', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD AIR', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (32, '2025-06-02', 'ACCESORIO', 'ADAPTADOR DISPLAY PORT A HDMI', 'SPEKTRA', '20220306440', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'ADAPTADOR DISPLAYPORT A HDMI SPEKTRA', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (33, '2025-06-02', 'ACCESORIO', 'ADAPTADOR DISPLAY PORT A HDMI', 'SPEKTRA', '20220306441', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'ADAPTADOR DISPLAYPORT A HDMI SPEKTRA', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (34, '2025-06-02', 'ACCESORIO', 'ADAPTADOR DISPLAY PORT A HDMI', 'SPEKTRA', '20220306442', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'ADAPTADOR DISPLAYPORT A HDMI SPEKTRA', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (35, '2025-06-02', 'ACCESORIO', 'ADAPTADOR DISPLAY PORT A HDMI', 'SPEKTRA', '20220306448', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'ADAPTADOR DISPLAYPORT A HDMI SPEKTRA', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (36, '2025-03-17', 'ACCESORIO', 'CARGADOR TIPO C LENOVO X1', 'LENOVO', ' 8SSA10R16922C2TJ', 1, 'TECNODATA ', 'TECNODATA ', 'TECNODATA', 'PERSONAL DE TECNODATA', 'CARGADOR LENOVO TIPO C', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (37, NULL, 'NOTEBOOK', 'LENOVO X1', 'LENOVO', ' PF4JRLQA', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (38, '2025-03-31', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', ' PF4Z04MT / 72096', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'TECNODATA', 'ADOLFO ACEVEDO', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (39, '2024-10-12', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', ' V90DD2GK', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (40, '2025-03-01', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', ' V90DD2HB', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (41, '2025-01-21', 'PANTALLA', 'MONITOR 49P SAMSUNG', 'SAMSUNG', '07YTHNFM500131M', 1, 'HUERFANOS', 'HUERFANOS # 886', 'TOTALPACK', 'CORREOS', 'MONITOR SAMSUNG 49 PULGADAS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (42, '2025-04-02', 'UNIDAD DE MEMORIA', 'PENDRIVE 256GB KINGSTON', 'KINGSTON', '0L672', 2, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (43, '2024-10-10', 'ACCESORIO', 'CARCASA SSD NVME 2.40GBPS', 'MINISOPURU', '100119017-E', 5, 'TICSERVICES', 'AV. DEL PARQUE # 4928 OF. 224', 'COMPRA', 'PERSONAL DE TIC-SERVICES', 'MINISOPURU SUPERIOR SPEED 40GBPS M.2 NVME SSD ENCLOSURE ', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (44, '2025-05-13', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '1SGX30K79401Z14VH1JA', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'MOUSE INALAMBRICO LENOVO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (45, '2025-05-13', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '1SGX30K79401Z14VH1TP', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'MOUSE INALAMBRICO LENOVO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (46, '2025-05-13', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '1SGX30K79401Z14VH1V2', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'MOUSE INALAMBRICO LENOVO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (47, '2025-05-13', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '1SGX30K79401Z14VH1V4', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'MOUSE INALAMBRICO LENOVO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (48, '2025-05-13', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '1SGX30K79401Z14VH1V6', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'MOUSE INALAMBRICO LENOVO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (49, '2025-05-13', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '1SGX30K79401Z14VH1V7', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'MOUSE INALAMBRICO LENOVO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (50, '2025-01-31', 'ACCESORIO', 'TECLADO INALAMBRICO LOGITECH', 'LOGITEC', '2420SC109EH9', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'TECLADO INALAMBRICO LOGITEC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (51, '2025-01-15', 'ACCESORIO', 'TECLADO INALAMBRICO LOGITECH', 'LOGITEC', '2420SC109EK9', 1, 'ALAMEDA PISO 4', 'TIC SERVICES', 'COMPRA', 'PERSONAL DE TICSERVICES', 'TECLADO INALAMBRICO LOGITEC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (52, '2025-01-15', 'ACCESORIO', 'TECLADO INALAMBRICO LOGITECH', 'LOGITEC', '2420SC109EL9', 1, 'ALAMEDA PISO 4', 'TIC SERVICES', 'COMPRA', 'PERSONAL DE TICSERVICES', 'TECLADO INALAMBRICO LOGITEC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (53, '2025-01-15', 'ACCESORIO', 'TECLADO INALAMBRICO LOGITECH', 'LOGITEC', '2420SC109EM9', 1, 'ALAMEDA PISO 4', 'TIC SERVICES', 'COMPRA', 'PERSONAL DE TICSERVICES', 'TECLADO INALAMBRICO LOGITEC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (54, '2025-01-15', 'ACCESORIO', 'TECLADO INALAMBRICO LOGITECH', 'LOGITEC', '2420SC109JK9', 1, 'ALAMEDA PISO 4', 'TIC SERVICES', 'COMPRA', 'PERSONAL DE TICSERVICES', 'TECLADO INALAMBRICO LOGITEC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (55, '2025-01-15', 'ACCESORIO', 'TECLADO INALAMBRICO LOGITECH', 'LOGITEC', '2420SC109KH9', 1, 'ALAMEDA PISO 4', 'TIC SERVICES', 'COMPRA', 'PERSONAL DE TICSERVICES', 'TECLADO INALAMBRICO LOGITEC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (56, '2025-01-15', 'ACCESORIO', 'TECLADO INALAMBRICO LOGITECH', 'LOGITEC', '2420SC109TH9', 1, 'ALAMEDA PISO 4', 'TIC SERVICES', 'COMPRA', 'PERSONAL DE TICSERVICES', 'TECLADO INALAMBRICO LOGITEC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (57, '2025-01-15', 'ACCESORIO', 'TECLADO INALAMBRICO LOGITECH', 'LOGITEC', '2420SC109TJ9', 1, 'ALAMEDA PISO 4', 'TIC SERVICES', 'COMPRA', 'PERSONAL DE TICSERVICES', 'TECLADO INALAMBRICO LOGITEC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (58, '2024-10-30', 'ACCESORIO', 'TECLADO INALAMBRICO MAC', 'APPLE', '25095/MQ052E/A', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA  S.A', 'MAGIC KEYBOARD CON KEYPAD NUMERICO APPLE ESPAÑOL', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (59, '2025-03-02', 'ACCESORIO', 'MOUSEPAD ULTRATECHNOLOGY', 'ULTRA TECHNOLOGY', '29UPM-00100', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'MOUSE PAD ULTRA TECHNOLOGY', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (60, '2024-10-30', 'ACCESORIO', 'HUB HD4005 HYPER', 'HYPERDRIVE', '34565/HD4005GL', 9, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA  S.A', 'HUB USB-C10 EN 1 HYPERDRIVE NEXT 10 HYPER NEGRO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (61, '2025-09-01', 'ACCESORIO', 'TECLADO INALAMBRICO LENOVO', 'LENOVO', '4X30M39482KPV257M8', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA   ', 'BODEGA PISO 4', 'TECLADO INALAMBRICO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (62, '2024-11-14', 'ACCESORIO', 'LENOVO ADAPTADOR ETHERNET TIPO C', 'LENOVO', '4X90S91830DLD014MF', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'COMPRA CHILEATIENDE', 'TECNODATA', 'ADAPTADOR ETHERNET USB 3,0', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (63, '2024-10-29', 'IMPRESORA', 'IMPRESORA HP OFFICE JET 200', 'HP', '50493/ TH0CA950RY', 1, 'LOTA CAUPOLICAN #545', 'CAUPOLOCAN # 5', 'CHILEATIENDE', 'ROSALBA GONZALEZ MORAGA', 'IMPRESORA HP OFFICE JET ', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (64, '2025-04-30', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', '5D11K27112', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'SEBASTIAN DINAMARCA', 'MONITOR 24P LENOVO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (65, '2025-04-17', 'AIO', 'LENOVO NEO 50A', 'LENOVO', '71621 - MP2A71MX', 1, 'SAN MIGUEL', 'SAN MIGUEL', 'TECNODATA', 'SOPORTE NIVEL 2', 'LENOVO NEO 50A', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (66, '2025-08-01', 'ACCESORIO', 'TECLADO INALAMBRICO LENOVO', 'LENOVO', '8CCD50M39532KPV257MC', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA   ', 'BODEGA PISO 4', 'TECLADO LENOVO INALAMBRICO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (67, '2025-08-01', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8CCM50M39559MPV257MC', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA   ', 'BODEGA PISO 4', 'MOUSE INALAMBRICO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (68, '2025-05-15', 'ACCESORIO', 'CARGADOR V15', 'LENOVO', '8SSA10M42740L1C406L - SPF3BQV8F', 1, 'OPCIONES', 'PROVIDENCIA 1208, OF 1409', 'ARRIENDO', 'JUAN DUJISIN', 'CARGADOR V15', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (69, '2025-03-19', 'ACCESORIO', 'CARGADOR TIPO C LENOVO X1', 'LENOVO', '8SSA10R16872L1CZ', 1, 'TECNODATA ', 'TECNODATA ', 'TECNODATA', 'PERSONAL DE TECNODATA', 'CARGADOR LENOVO TIPO C', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (70, '2025-01-17', 'ACCESORIO', 'TECLADO INALAMBRICO LENOVO', 'LENOVO', '8SSD50M3948KPV257LZ', 1, 'ALAMEDA PISO 4', 'TIC SERVICES', 'COMPRA', 'PERSONAL DE TICSERVICES', 'TECLADO INALAMBRICO LENOVO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (71, '2025-04-15', 'ACCESORIO', 'TECLADO INALAMBRICO LENOVO', 'LENOVO', '8SSD50M39532KPV257MG', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 227', 'COMPRA', 'SOPORTE NIVEL 2', 'TECLADO INALAMBRICO LENOVO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (72, '2025-04-15', 'ACCESORIO', 'TECLADO INALAMBRICO LENOVO', 'LENOVO', '8SSD50M39532KPV257MK', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 225', 'COMPRA', 'SOPORTE NIVEL 2', 'TECLADO INALAMBRICO LENOVO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (73, '2025-04-28', 'ACCESORIO', 'TECLADO INALAMBRICO LENOVO', 'LENOVO', '8SSD50M39532KPV257MP', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'TECLADO INALAMBRICO LENOVO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (74, '2025-01-17', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M39559MPV257LZ', 1, 'ALAMEDA PISO 4', 'TIC SERVICES', 'COMPRA', 'PERSONAL DE TICSERVICES', 'MOUSE INALAMBRICO LENOVO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (75, '2025-04-15', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M39559MPV257MG', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 228', 'COMPRA', 'SOPORTE NIVEL 2', 'MOUSE LENOVO INALAMBRICO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (76, '2025-04-15', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M39559MPV257MK', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 226', 'COMPRA', 'SOPORTE NIVEL 2', 'MOUSE LENOVO INALAMBRICO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (77, '2025-04-28', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M39559MPV257MP', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'MOUSE LENOVO INALAMBRICO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (78, '2025-06-02', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A4A', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'MOUSE INALAMBRICO LENOVO MORFKHO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (79, '2025-04-21', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A4A', 1, 'MOUSE INALAMBRICO LENOVO', 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'COMPRA', NULL, 'MOUSE INALAMBRICO LENOVO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (80, '2025-06-02', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A4D', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'MOUSE INALAMBRICO LENOVO MORFKHO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (81, '2025-04-21', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A4D', 1, 'MOUSE INALAMBRICO LENOVO', 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'COMPRA', NULL, 'MOUSE INALAMBRICO LENOVO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (82, '2025-06-02', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A4P', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'MOUSE INALAMBRICO LENOVO MORFKHO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (83, '2025-04-21', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A4P', 1, 'MOUSE INALAMBRICO LENOVO', 'Recuperando datos. Espere unos segundos e intente cortar o copiar de nuevo.', NULL, NULL, 'MOUSE INALAMBRICO LENOVO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (84, '2025-06-02', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A4R', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'MOUSE INALAMBRICO LENOVO MORFKHO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (85, '2025-04-21', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A4R', 1, 'MOUSE INALAMBRICO LENOVO', 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'COMPRA', NULL, 'MOUSE INALAMBRICO LENOVO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (86, '2025-06-02', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A4S', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'MOUSE INALAMBRICO LENOVO MORFKHO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (87, '2025-04-21', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A4S', 1, 'MOUSE INALAMBRICO LENOVO', 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'COMPRA', NULL, 'MOUSE INALAMBRICO LENOVO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (88, '2025-06-02', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A53', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'MOUSE INALAMBRICO LENOVO MORFKHO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (89, '2025-04-21', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A53', 1, 'MOUSE INALAMBRICO LENOVO', 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'COMPRA', NULL, 'MOUSE INALAMBRICO LENOVO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (90, '2025-06-02', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A5W', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'MOUSE INALAMBRICO LENOVO MORFKHO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (91, '2025-04-21', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A5W', 1, 'MOUSE INALAMBRICO LENOVO', 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'COMPRA', NULL, 'MOUSE INALAMBRICO LENOVO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (92, '2024-09-12', 'ACCESORIO', 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV37VNP', 12, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'MOUSE LENOVO INALAMBRICO WIRLESS 4X30M56887', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (93, '2024-03-12', 'ACCESORIO', 'MICROFONO INALAMBRICO', 'WIRELESSME', '900100122 -IS0246422', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'MICROFONO INALAMBRICO WIRELESSME ME RODE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (94, '2025-03-04', 'ACCESORIO', 'ALZA NOTEBOOK KENSINGTON', 'KENSINGTON', '9528-5 / 100000190', 30, 'ALTO HOSPICIO AV. LA PAMPA #3117', 'AV. ESCUELA CAMINO AGRICOLA N° 1697', 'COMPRA', 'SEBASTIAN DINAMARCA   ', 'ALZA NOTEBOOK KENSINGTON', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (95, '2024-11-25', 'ACCESORIO', 'GRABADORA DVD ', 'LENOVO', '988G67634', 1, 'CONSTITUCIÓN PORTALES #80', 'CONSTITUCION # 50', 'TECNODATA  S.A', 'CORREOS', 'GRABADOR DVD SIN CABLE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (96, '2025-03-02', 'ACCESORIO', 'HUB PRO ADAM', 'ADAMS', 'AAPADHUBPROBK', 2, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'HUB USB ADAM 11 IN 1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (97, '2025-06-02', 'ACCESORIO', 'HUB PRO ADAM', 'ADAM ELEMENTS', 'AAPADHUBPROBK', 2, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'HUB USB 11 EN 1 ADAM ELEMENTS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (98, '2025-04-14', 'TABLET', 'IPAD AIR', 'APPLE', 'C426YXPGDX', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD AIR', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (99, '2024-08-20', 'ACCESORIO', 'CAJA MACBOOK PRO', 'MACBOOK ', 'C2QT6PVXKD', 1, 'ALAMEDA PISO 8', 'Av. Libertador Bernardo O''Higgins N° 1367', 'TECNODATA S.A', 'TECNODATA', 'CAJA VACIA', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (100, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'C93JJP6XL6', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (101, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'CFN63FPNW5', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (102, '2025-04-23', 'ACCESORIO', 'MOUSE INALAMBRICO APPLE', 'APPLE', 'CC2313206YA17YDA8', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'JUAN DUJISIN', 'MOUSE INALAMBRICO APPLE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (103, '2025-04-14', 'TABLET', 'IPAD AIR', 'APPLE', 'D277QR1PVF', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD AIR', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (104, '2025-04-23', 'NOTEBOOK', 'MacBook AIR APPLE M3', 'APPLE', 'CVVY4WQK9M', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'JUAN DUJISIN', 'MacBook AIR APPLE M3 CON CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (105, '2025-04-23', 'ACCESORIO', 'CANDADO DE MAC', 'APPLE', 'D22234A', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'JUAN DUJISIN', 'CANDADO DE MAC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (106, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'DDQTDW6D40', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (107, '2025-04-14', 'TABLET', 'IPAD AIR', 'APPLE', 'DTQ73Q41DX', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD AIR', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (108, '2025-03-13', 'ACCESORIO', 'HUB D-LINK', 'D-LINK', 'DL4E3H8000386', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'HUB D-LINK', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (109, '2025-03-13', 'ACCESORIO', 'HUB D-LINK', 'D-LINK', 'DL4E3H8000401', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'HUB D-LINK', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (110, '2025-03-13', 'ACCESORIO', 'HUB D-LINK', 'D-LINK', 'DL4E3H8000409', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'HUB D-LINK', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (111, '2025-04-14', 'TABLET', 'IPAD AIR', 'APPLE', 'F4T4003HKK', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD AIR', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (112, '2025-03-02', 'UNIDAD DE MEMORIA', 'DISCO DURO PORTABLE SSD KINGSTON XS2000', 'KINGSTON', 'F0535', 3, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'DISCO DURO PORTABLE SSD KINGSTON', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (113, '2025-04-23', 'ACCESORIO', 'TECLADO MAGIC MAC', 'APPLE', 'F0T2453RJH5JKP3AE', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'JUAN DUJISIN', 'TECLADO MAGIC MAC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (114, '2025-04-14', 'TABLET', 'IPAD AIR', 'APPLE', 'F54XKRFW53', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD AIR', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (115, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'F6MQPWFVGJ', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (116, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'FHW79M7WVM', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'RAUL GALLARDO');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (117, '2025-04-14', 'TABLET', 'IPAD AIR', 'APPLE', 'FKX2T4WP9J', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD AIR', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (118, '2025-04-14', 'TABLET', 'IPAD AIR', 'APPLE', 'FW73DMG6GD', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD AIR', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (119, '2025-04-14', 'TABLET', 'IPAD AIR', 'APPLE', 'FXHW4G9G9F', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD AIR', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (120, '2025-04-14', 'TABLET', 'IPAD AIR', 'APPLE', 'G3R9TWK24F', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD AIR', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (121, '2025-04-14', 'TABLET', 'IPAD AIR', 'APPLE', 'G572H667Y4', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD AIR', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (122, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'GG7GP9X3XX', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (123, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'GGK3QLCXRD', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO 11', 'RAUL GALLARDO');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (124, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'GHRWJ6WGJJ', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (125, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'GQ2JKGGM2W', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (126, '2025-04-14', 'TABLET', 'IPAD AIR', 'APPLE', 'GW0XM54HDQ', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD AIR', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (127, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'H0FVKJ3YVG', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (128, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'H1FJWLXMJK', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (129, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'H1W1QWP2Q9', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (130, '2025-04-14', 'TABLET', 'IPAD AIR', 'APPLE', 'H39W2V4XLG', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD AIR', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (131, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'H76VX65Q6T', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (132, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'HC346HGY22', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (133, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'HHPXDV6Y9K', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (134, '2025-04-14', 'TABLET', 'IPAD AIR', 'APPLE', 'HQC2PVWTXJ', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD AIR', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (135, '2025-04-14', 'TABLET', 'IPAD AIR', 'APPLE', 'HXKTXYQCL2', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD AIR', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (136, '2025-03-19', 'TABLET', 'IPAD AIR', 'APPLE', 'HYY7M76R65', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'SEBASTIAN', 'IPAD AIR', 'ADOLFO ACEVEDO');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (137, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'JCNKF0YHHJ', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (138, '2025-04-28', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'ID 71531 -MP2ACFKS', 1, 'PUENTE ALTO SANTO DOMINGO #481', 'PUENTE ALTO', 'TECNODATA  S.A', 'SEBASTIAN DINAMARCA', 'AIO NEO 50 LO UTILIZABA PAULA CANTILLANA', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (139, '2025-04-28', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'ID 72154 - MP2ACB04', 1, 'HUERFANOS PISO 2', 'HUERFANOS PISO 2', 'TECNODATA  S.A', 'JUAN DUJISIN', 'AIO NEO 50 LO UTILIZABA RENATO HENRIQUEZ', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (140, '2025-04-30', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'ID:70577-PF4JR6A8 ', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'SEBASTIAN DINAMARCA', 'LENOVO X1 + MOCHILA, ADAPTADOR, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (141, '2025-04-30', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'ID:71877 - PF4JQ5AF', 1, 'ALAMEDA PISO 6', 'ALAMEDA PISO 6', 'TECNODATA  S.A', 'SEBASTIAN DINAMARCA', 'NOTEBOOK X1 CARBON VPRO SIN ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (142, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'JTVH00DMYY', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (143, '2024-06-26', 'AIO', 'LENOVO M820Z', 'LENOVO', 'JMJ07RP1', 1, 'ILLAPEL CONSTITUCION #50', 'CONSTITUCION # 50', 'TECNODTA S.A ID', 'PAULA  BURROWS', 'EQUIPO M820Z CON SUS ACCESORIOS ( SIN DETALLE)', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (144, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'K6J9J6W5DJ', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (145, '2024-11-19', 'ACCESORIO', 'TECLADO FUNDA MAC', 'GENERICO', 'JWAF21114/140000018', 20, 'TICSERVICES', 'AV. DEL PARQUE # 4928 OF. 224', 'COMPRA CHILEATIENDE', 'CORREOS', 'FUNDA TECLADO PARA IPAD AIR M2', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (146, '2025-06-02', 'ACCESORIO', 'SOPORTE MONITOR KENSINGTON', 'KENSINGTON', 'K52797WW', 30, 'CAMINO AGRICOLA 1697', 'CAMINO AGRICOLA', 'IPS', 'PERSONAL DE IPS', 'SOPORTE DE ALTURA PARA MONITOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (147, '2025-08-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'K6N14V0NQW', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (148, '2025-04-14', 'TABLET', 'IPAD AIR', 'APPLE', 'K9MXM75NHF', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD AIR', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (149, '2025-04-14', 'TABLET', 'IPAD AIR', 'APPLE', 'KCX1XH94X3', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD AIR', 'HANS OELCKERS');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (150, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'KFPJ2VX4RY', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (151, '2025-05-27', 'TABLET', 'IPAD AIR', 'APPLE', 'KCX1XH94X3', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'HANS OELCKERS', 'IPAD AIR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (152, '2025-09-01', 'UNIDAD DE MEMORIA', 'MEMORIA RAM KNF 32 GB', 'KINGSTON', 'KF556S40IB-32', 4, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'BODEGA PISO 4', 'MEMORIA RAM KINGSTON 32 GB', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (153, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'KQ6HC2TXHK', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (154, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'KQ7YJPLW74', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (155, '2025-04-14', 'TABLET', 'IPAD AIR', 'APPLE', 'KXF9NW67TM', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD AIR', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (156, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'L24P4T04CL', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'HANS OELCKERS');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (157, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'L67W64164Q', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (158, '2025-05-27', 'TABLET', 'IPAD PRO 11', 'APPLE', 'L24P4T04CL', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'HANS OELCKERS', 'IPAD PRO 11', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (159, '2025-05-06', 'TABLET', 'IPAD PRO 11', 'APPLE', 'L24P4T04CL', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'JOSE CRUCES', 'ENTREGA DE IPAD PRO MAS CARCASA SIN TAPA ( ACORDARSE RECUPERAR CARGADOR DE IPAD LO TIENE HASS)', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (160, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'L7CQY3P7NV', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'JOSE CRUCES pruebas de videoconferencia.');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (161, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'LQVQHQGPPV', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (162, '2025-04-14', 'TABLET', 'IPAD AIR', 'APPLE', 'LWVW3T6QR0', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD AIR', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (163, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'MVKH67L7C4', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (164, '2024-05-08', 'AIO', 'LENOVO M810Z', 'LENOVO', 'MJ06710G', 1, 'HUERFANOS', 'HUERFANOS # 886', 'TECNODATA S.A', 'HUERFANOS', 'AIO M810', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (165, '2024-08-22', 'AIO', 'LENOVO M810Z', 'LENOVO', 'MJ0671A9', 1, 'ALAMEDA PISO 4', 'Av. Libertador Bernardo O''Higgins N° 1367', 'TECNODATA S.A', 'JURIDICA', 'SOLO AIO SIN CABLE DE PODER', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (166, '2024-11-28', 'AIO', 'LENOVO M810Z', 'LENOVO', 'MJ0671DA', 1, 'HUERFANOS', 'ALAMEDA PISO 4', 'TECNODATA  S.A', 'JOSE MIGUEL RUIZ', 'AIO SIN CABLE DE PODER Y SIN ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (167, '2024-11-28', 'AIO', 'LENOVO M810Z', 'LENOVO', 'MJ0671EZ', 1, 'HUERFANOS', 'ALAMEDA PISO 5', 'TECNODATA  S.A', 'JOSE MIGUEL RUIZ', 'AIO SIN CABLE DE PODER Y SIN ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (168, '2024-04-19', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RS11', 1, 'POZO ALMONTE ALDUNATE #310', 'ALDUNATE # 310', 'TECNODATA S.A  ID', 'HERIBERTO CARRASCO', 'EQUIPO FUE RETIRADO SIN MOUSE, TECLADO, MOUSE DE SUCURSAL LAS CONDES', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (169, '2024-02-08', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RS59', 1, 'ALAMEDA PISO 6', 'Av. Libertador Bernardo O''Higgins N° 1367', 'TECNODATA S.A', 'SUCURSAL VIRTUAL', 'EQUIPO M820Z CON SUS ACCESORIOS ( SIN DETALLE)', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (170, '2024-03-06', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RS5P', 1, 'CURICO MEMBRILLAR ESQ. VILLOTA', 'Membrillar esquina Villota s/n', 'TECNODATA S.A  ID', 'LEONARDO GAJARDO', 'EQUIPO M820Z CON SUS ACCESORIOS ( SIN DETALLE)', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (171, '2024-11-25', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RS5U', 1, 'CONSTITUCIÓN PORTALES #80', 'CONSTITUCION # 50', 'TECNODATA  S.A', 'CORREOS', 'AIO M820Z CON PANTALLA DAÑADA CON SUS ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (172, '2024-03-21', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RS7D', 1, 'COPIAPO ATACAMA #443 PRIMER PISO', 'ATACAMA #443', 'TECNODATA S.A  ID 40473', 'MARIO OLIVARES', 'EQUIPO VIENE CON TECLADO SIN CABLE DE PODER , MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (173, '2024-04-24', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RS7M', 1, 'ALAMEDA CALLCENTER PISO 6', 'Av. Lib. Bernardo O’Higgins 1367', 'TECNODATA S.A  ID 40889', 'SOPORTE NIVEL 2', 'EQUIPO M820Z CON SUS ACCESORIOS ( SIN DETALLE)', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (174, '2024-03-21', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RSBC', 1, 'COPIAPO ATACAMA #443 PRIMER PISO', 'ATACAMA #443', 'TECNODATA S.A  ID', 'DISSA CASTELLANI MARTINEZ', 'EQUIPO VIENE CON CABLE DE PODER SIN MOUSE, TECLADO ( CON MASCARA LEVANTADA DE PC )', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (175, '2024-05-08', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RSDM', 1, 'TOLTEN LOS COPIHUES S/N', 'Avenida Los Copihues s/n, Nueva Toltén, Toltén, Araucanía', 'TECNODATA S.A', 'JULIO OYARZO CARDENAS', 'AIO M810Z EQUIPO CON PANTALLA MALA Y ABIERTO EN PARLANTE DE EQUIPO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (176, '2024-04-19', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RSJX', 1, 'POZO ALMONTE ALDUNATE #310', 'ALDUNATE # 310', 'TECNODATA S.A  ID', 'HERIBERTO CARRASCO', 'EQUIPO FUE RETIRADO SIN MOUSE, TECLADO, MOUSE DE SUCURSAL LAS CONDES', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (177, '2024-08-23', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RSM2', 1, 'VILLARRICA FCO. BILBAO #795', 'FRANCISCO BILBAO  # 795', 'TECNODATA S.A', 'IVAN ORREGO DUFFNER', 'AIO M820Z CON PANTALLA DAÑADA CON ACCESORIOS SIN PEDESTAL TRASERO DE PANTALLA', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (178, '2024-07-08', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RSP0', 1, 'RANCAGUA PLAZA DE LOS HÉROES #389', 'Plaza de Los Héroes 389', 'TECNODATA S.A', 'CRISTIAN MASSA (MARIA ALVARADO)', 'AIO M820Z CON PANTALLA DAÑADA CON SUS ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (179, '2025-03-17', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RT93', 1, 'CHILLAN LIBERTAD #418', 'CHILLAN LIBERTAD #418', 'TECNODATA', 'MABEL SOLIS MARTINEZ', 'LENOVO M820Z', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (180, '2024-11-25', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RTBV', 1, 'CONSTITUCIÓN PORTALES #80', 'CONSTITUCION # 50', 'TECNODATA  S.A', 'CORREOS', 'AIO M820Z CON SUS ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (181, '2024-11-25', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RTC6', 1, 'CONSTITUCIÓN PORTALES #80', 'CONSTITUCION # 50', 'TECNODATA  S.A', 'CORREOS', 'AIO M820Z SIN CABLE DE PODER SIN BASE DE RESPALDO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (182, '2024-03-06', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RTHG', 1, 'CURICO MEMBRILLAR ESQ. VILLOTA', 'Membrillar esquina Villota s/n', 'TECNODATA S.A  ID', 'LEONARDO GAJARDO', 'EQUIPO M820Z CON SUS ACCESORIOS ( SIN DETALLE)', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (183, '2024-01-08', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RTUB', 1, 'LO PRADO SAN PABLO #5849', 'SAN PABLO # 5849', 'TECNODATA S.A', 'ADOLFO ACEVEDO', 'AIO M820Z ', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (184, '2024-02-08', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RTUB', 1, 'ALAMEDA PISO 6', 'Av. Libertador Bernardo O''Higgins N° 1367', 'TECNODATA S.A', 'SUCURSAL VIRTUAL', 'EQUIPO M820Z CON SUS ACCESORIOS ( SIN DETALLE)', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (185, '2024-04-19', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RTVU', 1, 'POZO ALMONTE ALDUNATE #310', 'ALDUNATE # 310', 'TECNODATA S.A  ID', 'HERIBERTO CARRASCO', 'EQUIPO COMPLETO CON ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (186, '2024-05-11', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RTXD', 1, 'TECNODATA ', 'SUCURSAL DE PUENTE ALTO', 'TECNODATA  S.A', 'ADOLFO ACEVEDO', 'AIO EQUIPO M820Z SIN CABLE DE PODER NI ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (187, '2024-02-08', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RTZD', 1, 'LO PRADO SAN PABLO #5849', 'SAN PABLO # 5849', 'TECNODATA S.A', 'TECNODATA', 'AIO M820Z ', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (188, '2024-03-06', 'AIO', 'LENOVO M820Z', 'LENOVO', 'MJ07RU24', 1, 'TEMUCO MATTA #62 ,1º PISO', 'Matta 62. Primer piso', 'TECNODATA S.A  ID', 'JULIO OYARZO CARDENAS', 'EQUIPO M820Z CON SUS ACCESORIOS ( SIN DETALLE)', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (189, '2024-12-02', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'MP2A69WF - 71757', 1, 'VILCUN FREIRE #295', 'FREIRE #295', 'TECNODATA S.A', 'JULIO OYARZO', 'AIO NEO50', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (190, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'MXHVQW6LLQ', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'MICHEL SILVA (SUC. ALAMEDA)');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (191, '2025-10-01', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'MP2A69XF', 1, 'LOTA CAUPOLICAN #545', 'CAUPOLICÁN 545', 'TECNODATA S.A ID', 'CAROL GARCES VILLALOBOS', 'EQUIPO AIO NEO50A CON ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (192, '2025-01-13', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'MP2A71NC', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'EQUIPO AIO NEO50A CON ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (193, '2025-05-06', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'MP2A71NC - 72153', 1, 'HUERFANOS PISO 2', 'HUERFANOS', 'TECNODATA  S.A', 'JUAN DUJESIN', 'EQUIPO AIO CON TODO SUS ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (194, '2025-01-29', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'MP2A71QF', 1, 'ALAMEDA PISO 8', 'ALAMEDA PSIO 8', 'TECNODATA S.A', 'SEBASTIAN DINAMARCA DE PISO 8', 'EQUIPO AIO NEO50A CON ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (195, '2025-06-06', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'MP2A75M4 - 72067', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'AIO NEO 50 QUEDA EN CALL VALENTIN LETELIER', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (196, '2025-01-13', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'MP2AC8LN', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'EQUIPO AIO NEO50A CON ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (197, '2025-01-13', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'MP2AC8LN', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'EQUIPO AIO NEO50A CON ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (198, '2025-05-06', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'MP2AC8LN - 72155', 1, 'HUERFANOS PISO 2', 'HUERFANOS', 'TECNODATA  S.A', 'SEBASTIAN DINAMARCA', 'EQUIPO AIO CON TODO SUS ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (199, '2025-02-13', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'MP2AC8MM - 71500', 1, 'CHILLAN LIBERTAD #418', 'CHILLAN LIBERTAD #418', 'TECNODATA  S.A', 'PERSONAL DE CHILLAN', 'AIO CON ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (200, '2025-01-13', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'MP2ACB04', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'EQUIPO AIO NEO50A CON ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (201, '2025-01-17', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'MP2ACFGC', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'PERSONAL DE TECNODATA', 'EQUIPO AIO NEO50A CON ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (202, '2025-01-17', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'MP2ACHSM', 1, 'ALAMEDA CALLCENTER PISO 6', 'CALLCENTER ALAMEDA PISO 6', 'TECNODATA S.A', 'JUAN DUJISIN', 'EQUIPO AIO NEO50A CON ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (203, '2024-06-23', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'MP2ACHVK', 1, 'TALCA DOS SUR #1196', '2 SUR 1196 PISO PISO 1', 'TECNODATA S.A ID ', 'TECNODATA', 'EQUIPO M820Z ', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (204, '2025-02-02', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'MP2ACL57/71233', 1, 'PEÑALOLEN LAS TORRES #5555', 'ALAMEDA', 'TECNODATA', 'ALEX PEREZ', NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (205, '2024-05-08', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'MP2AEJ4A', 1, 'TEMUCO MATTA #62 ,1º PISO', 'Matta 62', 'TECNODATA S.A', 'JULIO OYARZO CARDENAS', 'AIO NEO 50A SIN CABLE DE PODER, MOUSE, TECLADO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (206, '2024-12-18', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'MP2AELBX', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO AIO NEO50A CON ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (207, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'MXQQJMXGX1', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (208, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'NLXN6C397K', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (209, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'NQN6RM4H97', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (210, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'PJYTDXKWWF', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (211, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'PM94Y3JVX1', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'MICHEL SILVA (SUC. SANTO DOMINGO)');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (212, '2025-04-23', 'ACCESORIO', 'TECLADO USB LENOVO', 'LENOVO', 'PC0QRW9R', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'TECNODATA', 'SEBASTIAN DINAMARCA', 'TECLADO LENOVO CON USB', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (213, '2025-04-23', 'ACCESORIO', 'TECLADO USB LENOVO', 'LENOVO', 'PC0QRW9T', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'TECNODATA', 'SEBASTIAN DINAMARCA', 'TECLADO LENOVO CON USB', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (214, '2024-08-05', 'ACCESORIO', 'TECLADO USB LENOVO', 'LENOVO', 'PC0QRW9V', 1, 'TECNODATA', 'TECNODATA ', 'TECNODATA', 'SOPORTE NIVEL 2', 'TECLADO USB LENOVO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (215, '2025-04-23', 'ACCESORIO', 'TECLADO USB LENOVO', 'LENOVO', 'PC0QRW9W', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'TECNODATA', 'SEBASTIAN DINAMARCA', 'TECLADO LENOVO CON USB', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (216, '2025-02-14', 'ACCESORIO', 'TECLADO USB LENOVO', 'LENOVO', 'PC0QRW9Z', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'TECLADO LENOVO USB', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (217, '2024-03-21', 'NOTEBOOK', 'LENOVO T470S ', 'LENOVO', 'PCOR21KY', 1, 'COPIAPO ATACAMA #443 PRIMER PISO', 'ATACAMA #443', 'TECNODATA S.A   ID 35062', 'MARIO OLIVARES', 'EQUIPO VIENE CON DOS CARGADOS ', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (218, '2024-11-26', 'NOTEBOOK', 'LENOVO T480S', 'LENOVO', 'PF1GX5ZD', 1, 'ALAMEDA PISO 5', 'ALAMEDA PISO 4', 'TECNODATA  S.A', 'PIETRA GIANNINA SALVATORI LAZO', 'NOTEBOOK T480 MAS CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (219, '2024-11-29', 'NOTEBOOK', 'LENOVO T480S', 'LENOVO', 'PF-1GX6HD', 1, 'ALAMEDA PISO 5', 'ALAMEDA PISO 4', 'TECNODATA S.A', 'FELIPE BRAVO', 'NOTEBOOK + CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (220, '2024-11-26', 'NOTEBOOK', 'LENOVO T480S', 'LENOVO', 'PF1GX6K9', 1, 'ALAMEDA PISO 5', 'ALAMEDA PISO 4', 'TECNODATA  S.A', 'PIETRA GIANNINA SALVATORI LAZO', 'NOTEBOOK T480 MAS CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (221, '2024-05-30', 'NOTEBOOK', 'LENOVO T480S', 'LENOVO', 'PF1GX6KL', 1, 'VALPARAISO AV. BRASIL #1265', ' Avenida Brasil 1265 ', 'TECNODATA S.A ID 757', 'GABRIELA JIMENEZ MEDINA', 'NOTEBOOK T480 CON CARGADOR Y MOCHILA SIN MEMORIA', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (222, '2024-05-30', 'NOTEBOOK', 'LENOVO T480S', 'LENOVO', 'PF1GX8KL', 1, 'VALPARAISO AV. BRASIL #1268', ' Avenida Brasil 1265 ', 'TECNODATA S.A ID 40249', 'GABRIELA JIMENEZ MEDINA', 'NOTEBOOK T480 SIN CARGADORY SIN MOCHILA', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (223, '2024-12-07', 'NOTEBOOK', 'LENOVO T480S', 'LENOVO', 'PF1GX8YC', 1, 'TEMUCO MATTA #62 ,1º PISO', 'Matta 62. Primer piso', 'TECNODATA S.A  ID', 'JULIO OYARZO CARDENAS', 'NOTEBOOK T480 CON CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (224, '2024-05-29', 'NOTEBOOK', 'LENOVO T480S', 'LENOVO', 'PF1H7THD', 1, 'ALAMEDA PISO 8', 'Av. Lib. Bernardo O’Higgins 1367', 'TECNODATA S.A  ID', 'RAUL GALLARDO', 'ENTREGA DE NOTEBOOK T480 SIN CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (225, '2024-05-30', 'NOTEBOOK', 'LENOVO T480S', 'LENOVO', 'PF1H837R', 1, 'VALPARAISO AV. BRASIL #1267', ' Avenida Brasil 1265 ', 'TECNODATA S.A ID 40268', 'GABRIELA JIMENEZ MEDINA', 'NOTEBOOK T480 CON CARGADOR Y MOCHILA', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (226, '2024-10-24', 'NOTEBOOK', 'LENOVO T480S', 'LENOVO', 'PF1H83AZ', 1, 'PUENTE ALTO SANTO DOMINGO #481', 'SANTO DOMINGO # 481', 'TECNODATA  S.A', 'SUCURSAL PUENTE ALTO', 'NOTEBOOK T480 CON CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (227, '2024-11-26', 'NOTEBOOK', 'LENOVO T480S', 'LENOVO', 'PF1H8YA3', 1, 'ALAMEDA PISO 5', 'ALAMEDA PISO 4', 'TECNODATA  S.A', 'PIETRA GIANNINA SALVATORI LAZO', 'NOTEBOOK T480 MAS CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (228, '2024-07-29', 'NOTEBOOK', 'LENOVO T480S', 'LENOVO', 'PF1HDP0Q', 1, 'YUMBEL FREIRE #565', 'FREIRE N°565', 'TECNODATA  S.A', 'LESLIE VANESSA RAMIREZ VARGAS', 'NOTEBOOK T480 CON CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (229, '2024-05-30', 'NOTEBOOK', 'LENOVO T480S', 'LENOVO', 'PF1HDP2A', 1, 'VALPARAISO AV. BRASIL #1266', ' Avenida Brasil 1265 ', 'TECNODATA S.A ID 40685', 'GABRIELA JIMENEZ MEDINA', 'NOTEBOOK T480 CON CARGADOR Y MOCHILA BICEL DE PANTALLA  UNDIDO DAÑADO PANTALLA FUNCIONA', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (230, '2025-05-29', 'NOTEBOOK', 'LENOVO V15', 'LENOVO', 'PF3BQVB5', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'FCOM', 'SEBASTIAN DINAMARCA', 'LENOVO V15 CON SUS ACCESORIOS MOCHILA, MOUSE, CANDADO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (231, '2025-04-30', 'NOTEBOOK', 'LENOVO V15', 'LENOVO', 'PF3BQZWK', 1, 'D.R RANCAGUA', 'D.R. RANCAGUA', 'FCOM', 'MARIO SANCHEZ CASTRO', 'LENOVO V15', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (232, '2025-05-28', 'NOTEBOOK', 'LENOVO V15', 'LENOVO', 'PF3BR4HD', 1, 'CAPRI SALAMANCA', 'MANUEL BULNES # 214.', 'FCOM', 'LORENA CAMPOS CARRASCO', 'EQUIPO V15 CON CARGADOR Y MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (233, '2025-05-30', 'NOTEBOOK', 'LENOVO V15', 'LENOVO', 'PF3BR4HD', 1, 'CAPRI YUNGAY', '
ANGAMOS # 268', 'FCOM', 'PERSONAL DESPACHO', 'LENOVO V15 CON SOLO SU MOCHILA', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (234, '2025-05-06', 'NOTEBOOK', 'LENOVO V15', 'LENOVO', 'PF3BXBGG', 1, 'ALAMEDA PISO 8', 'ALAMEDA PISO 4', 'FCOM', 'PERSONAL DE OPCIONES', 'LENOVO V15 CON SU CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (235, '2025-05-29', 'NOTEBOOK', 'LENOVO V15', 'LENOVO', 'PF3BXBNG', 1, 'CAPRI LINARES', 'INDEPENDENCIA #667', 'FCOM', 'LUZ RETAMAL', 'LENOVO V15', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (236, '2025-01-21', 'NOTEBOOK', 'LENOVO V15', 'LENOVO', 'PF3BXJ9Y', 1, 'BULNES BIANCHI S/N EDIFICIOS PUBLICOS', 'BULNES', 'FCOM', 'SUCURSAL ', 'NOTEBOOK V15 G2 ITL SIN CARGADOR ', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (237, '2023-07-22', 'NOTEBOOK', 'LENOVO V15', 'LENOVO', 'PF3BY3FV', 1, 'CONCEPCIÓN CASTELLON #435 PISO 6', 'CASTELLON # 435 PISO 6', 'FCOM', 'RONY CORREA', 'NOTEBOOK V15 CON CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (238, '2024-05-29', 'NOTEBOOK', 'LENOVO V15', 'LENOVO', 'PF3CL6T1', 1, 'QUIRIHUE JOSE JOAQUIN PEREZ #311', 'JOSÉ JOAQUÍN PÉREZ 311', 'FCOM', 'PAMELA FERNANDEZ RAILEN', 'EQUIPO V15 CON CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (239, '2025-03-06', 'NOTEBOOK', 'LENOVO V15', 'LENOVO', 'PF3CVGQ6', 1, 'ALAMEDA PISO 8', 'ALAMEDA PISO 4', 'FCOM', 'SEBASTIAN DINAMARCA', 'LENOVO V15 CON SU CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (240, '2024-11-18', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'PF4 JQ31H', 1, 'TECNODATA ', 'Av. Libertador Bernardo O''Higgins N° 1367', 'TECNODATA  S.A', 'MICHELLE SILVA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (241, NULL, 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'PF4JQ0R7', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (242, '2025-10-02', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'PF4JQ0ST', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'TECNODATA', 'MAXIMILIANO SALAZAR', 'NOTEBOOK X1 CARBON ADPATADOR DE RED', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (243, NULL, 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'PF4JR41C', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (244, '2025-06-17', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'PF4JRAWY - 71925', 1, 'ALAMEDA PISO 4', 'HUERFANOS', 'TECNODATA', 'MICHEL SILVA', 'NOTEBOOK X1 CARBON CON CARGADOR', 'EX EQUIPO DE JORGE FARAH, SE ENCUENTRA EN BODEGA');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (245, '2025-04-17', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'PF4JRF7J', 1, 'ALAMEDA PISO 6', 'ALAMEDA PISO 6', 'TECNODATA', 'SOPORTE NIVEL 2', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS SIN MOCHILA', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (246, '2025-10-04', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'PF4JRFB2 / 70980', 1, 'ALAMEDA PISO 8', 'ALAMEDA PISO 8', 'TECNODATA', 'JUAN DUJISIN', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (247, NULL, 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'PF4JRK3V', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (248, NULL, 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'PF4JRLQ2', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (249, '2025-03-13', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'PF4JRLR6', 1, 'LOTA CAUPOLICAN #545', 'LOTA CAUPOLICAN #545', 'TECNODATA  S.A', 'ROSALBA GONZALEZ MORAGA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (250, NULL, 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'PF4JRPQD', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (251, NULL, 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'PF4JRPQP', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (252, '2025-01-13', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'PF4Z06X6', 1, 'ALAMEDA PISO 5', 'ALAMEDA PISO 4', 'TECNODATA S.A', 'SEBASTIAN DINAMARCA DE PISO 5', 'EQUIPO X1 CARBON MAS CARGADOR ', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (253, '2025-08-05', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'PF4Z06XF', 1, 'TECNODATA', 'TECNODATA', 'COMPRA', 'JUAN DUJISIN', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (254, '2025-01-03', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'PF4Z1NYY / 72106', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'TECNODATA', 'ADOLFO ACEVEDO', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (255, '2024-10-10', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'PF4Z1R7H', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (256, '2025-03-26', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'PF4Z1R7H', 1, 'ALAMEDA PISO 6', 'ALAMEDA PISO 6', 'TECNODATA', 'SEBASTIAN', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (257, '2025-10-02', 'NOTEBOOK', 'LENOVO P16', 'LENOVO', 'PF5E410V', 1, 'HUERFANOS PISO 4', 'HUERFANOS PISO 4', 'COMPRA', 'RAUL GALLARDO', 'NOTEBOOK LENOVO NTB P16 I9 PRO WI11', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (258, '2025-02-05', 'NOTEBOOK', 'LENOVO P16', 'LENOVO', 'PF5E410V', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'SEBASTIAN DINAMARCA', 'LENOVO NTB P16 CON ADAPTADOR DE RED', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (259, '2024-09-12', 'NOTEBOOK', 'LENOVO P17', 'LENOVO', 'PF5E410V', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'THINKPAD LENOVO NTB P16 I9-13950 W11 PRO 64GB SSD1TB CON CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (260, '2024-09-12', 'NOTEBOOK', 'LENOVO P18', 'LENOVO', 'PF5E411J', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'THINKPAD LENOVO NTB P16 I9-13950 W11 PRO 64GB SSD1TB CON CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (261, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'PWGHG34497', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'CHRISTIAN SEGURA (PRESTAMO)');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (262, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'PYKYT7XDVW', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (263, '2025-12-02', 'ACCESORIO', 'HUB HD4005 HYPER', 'HYPER', 'PV23364803159', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'HUB USB HD4005 MAC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (264, '2025-12-02', 'ACCESORIO', 'HUB HD4005 HYPER', 'HYPERDRIVE', 'PV23364803159', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'TECNODATA  S.A', 'FELIX  AGUIRRE', 'HUB USB-C10 EN 1 HYPERDRIVE NEXT 10 HYPER NEGRO', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (265, '2025-04-14', 'ACCESORIO', 'HUB HD4005 HYPER', 'HYPER', 'PV23364804338', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'HUB HD4005 HYPER', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (266, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'Q26PH4G2WN', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (267, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'QGPKJTJYFK', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (268, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'QJM6JRYQ3V', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (269, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'QQYQ3KT40X', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (270, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'R14WH37G7Q', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (271, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'RM916F261H', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (272, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'RQ03WMKTX7', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (273, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'RYP3KQ1W1Y', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (274, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'T4NQWTYFM0', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (275, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'TM25QDF26Y', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (276, '2025-02-13', 'ACCESORIO', 'AOWEIXUN HDMI', 'AOWEIXUN', 'S/N', 8, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (277, '2025-03-13', 'ACCESORIO', 'CANDADO NANO X1 CARBÓN', 'ITAB', 'S/N', 10, 'TICSERVICES', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'PERSONAL DE TICSERVICES', 'CANDADO NANO X1 CARBON ITAB SP-CL703', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (278, '2025-02-14', 'ACCESORIO', 'HUB  ', NULL, 'S/N', 7, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'SEBASTIAN ', 'ASIGNADOS A EQUIPOS DE MDA POR MAXIMILIANO SALAZAR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (279, '2025-06-05', 'ACCESORIO', 'MOCHILA KAMET MAC', 'APPLE', 'S/N', 1, 'TECNODATA', 'TECNODATA', 'COMPRA', 'JUAN DUJISIN', 'MOCHILA KAMET MAC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (280, '2025-06-05', 'ACCESORIO', 'MOCHILA KAMET MAC', 'APPLE', 'S/N', 1, 'TECNODATA', 'TECNODATA', 'COMPRA', 'JUAN DUJISIN', 'MOCHILA KAMET MAC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (281, '2025-06-02', 'ACCESORIO', 'MOUSEPAD TECMASTER', 'TECMASTER', 'S/N', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'MOUSE PAD TM-GEL05-BK', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (282, '2025-06-02', 'ACCESORIO', 'MOUSEPAD ULTRATECHNOLOGY', 'ULTRA TECHNOLOGY', 'S/N', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'MOUSE PAD 29UPM-00100 ULTRA TECHNOLOGY', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (283, '2024-04-10', 'UNIDAD DE MEMORIA', 'PENDRIVE 256GB KINGSTON', 'KINGSTON', 'S/N', 25, 'TICSERVICES', 'TIC SERVICES', 'COMPRA', 'PERSONAL DE TIC SERVICES', 'PENDRIVE KINGSTON 256GB', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (284, '2024-12-11', 'ACCESORIO', 'SOPORTE MONITOR MOVIBLE', 'BRASFORMA', 'SBRP1440', 7, 'TICSERVICES', 'Av. Libertador Bernardo O''Higgins N° 1367', 'COMPRA CHILEATIENDE', 'CORREOS', 'SOPORTE  ARTICULADO FULL MOTION', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (285, '2024-10-10', 'ACCESORIO', 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SCC2344305PG27CGA9', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'MOUSE DE APPLE MAC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (286, '2024-10-10', 'ACCESORIO', 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SCC2344305QR27CGAX', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'MOUSE DE APPLE MAC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (287, '2024-10-10', 'ACCESORIO', 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SCC2344306XC27CGAN', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'MOUSE DE APPLE MAC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (288, '2024-10-10', 'ACCESORIO', 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SCC234440A9T27CGA0', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'MOUSE DE APPLE MAC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (289, '2024-10-10', 'ACCESORIO', 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SCC234440C0D27CGA5', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'MOUSE DE APPLE MAC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (290, '2024-10-10', 'ACCESORIO', 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SCC234450CGE27CGAP', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'MOUSE DE APPLE MAC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (291, '2024-10-10', 'ACCESORIO', 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SCC234450FVS27CGA3', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'MOUSE DE APPLE MAC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (292, '2024-10-10', 'ACCESORIO', 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SCC234450GRW27CGAA', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'MOUSE DE APPLE MAC', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (293, '2025-04-30', 'NOTEBOOK', 'MacBook Pro M4', 'LENOVO', 'SCKJX412FFM', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'COMPRA', 'SEBASTIAN DINAMARCA', 'MacBook Pro M4', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (294, '2025-04-23', 'NOTEBOOK', 'MacBook AIR APPLE M3', 'APPLE', 'SDXW2G5X6NP', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'MacBook AIR APPLE M3', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (295, '2024-04-11', 'ACCESORIO', 'HUELLERO 4500GFINGER', 'HID', 'SE20E12926', 1, 'TICSERVICES', 'Av. Libertador Bernardo O''Higgins N° 1367', 'COMPRA CHILEATIENDE', 'TIC-SERVICE', 'LECTOR BIOMETRICO -HUELLERO FONASA ($80.000)', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (338, '2025-04-23', 'ACCESORIO', 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SJ84HAZ038QA0000539', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'MOUSE INALAMBRICO APPLE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (296, '2024-04-11', 'ACCESORIO', 'HUELLERO 4500GFINGER', 'HID', 'SE20E12927', 1, 'TICSERVICES', 'Av. Libertador Bernardo O''Higgins N° 1367', 'COMPRA CHILEATIENDE', 'TIC-SERVICE', 'LECTOR BIOMETRICO -HUELLERO FONASA ($80.000)', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (297, '2024-04-11', 'ACCESORIO', 'HUELLERO 4500GFINGER', 'HID', 'SE20E12928', 1, 'TICSERVICES', 'Av. Libertador Bernardo O''Higgins N° 1367', 'COMPRA CHILEATIENDE', 'TIC-SERVICE', 'LECTOR BIOMETRICO -HUELLERO FONASA ($80.000)', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (298, '2024-04-11', 'ACCESORIO', 'HUELLERO 4500GFINGER', 'HID', 'SE20E12929', 1, 'TICSERVICES', 'Av. Libertador Bernardo O''Higgins N° 1367', 'COMPRA CHILEATIENDE', 'TIC-SERVICE', 'LECTOR BIOMETRICO -HUELLERO FONASA ($80.000)', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (299, '2024-04-11', 'ACCESORIO', 'HUELLERO 4500GFINGER', 'HID', 'SE20E12930', 1, 'TICSERVICES', 'Av. Libertador Bernardo O''Higgins N° 1367', 'COMPRA CHILEATIENDE', 'TIC-SERVICE', 'LECTOR BIOMETRICO -HUELLERO FONASA ($80.000)', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (300, '2024-04-11', 'ACCESORIO', 'HUELLERO 4500GFINGER', 'HID', 'SE20E12931', 1, 'TICSERVICES', 'Av. Libertador Bernardo O''Higgins N° 1367', 'COMPRA CHILEATIENDE', 'TIC-SERVICE', 'LECTOR BIOMETRICO -HUELLERO FONASA ($80.000)', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (301, '2024-04-11', 'ACCESORIO', 'HUELLERO 4500GFINGER', 'HID', 'SE20E12932', 1, 'TICSERVICES', 'Av. Libertador Bernardo O''Higgins N° 1367', 'COMPRA CHILEATIENDE', 'TIC-SERVICE', 'LECTOR BIOMETRICO -HUELLERO FONASA ($80.000)', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (302, '2024-04-11', 'ACCESORIO', 'HUELLERO 4500GFINGER', 'HID', 'SE20E12933', 1, 'TICSERVICES', 'Av. Libertador Bernardo O''Higgins N° 1367', 'COMPRA CHILEATIENDE', 'TIC-SERVICE', 'LECTOR BIOMETRICO -HUELLERO FONASA ($80.000)', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (303, '2024-04-11', 'ACCESORIO', 'HUELLERO 4500GFINGER', 'HID', 'SE20E12934', 1, 'TICSERVICES', 'Av. Libertador Bernardo O''Higgins N° 1367', 'COMPRA CHILEATIENDE', 'TIC-SERVICE', 'LECTOR BIOMETRICO -HUELLERO FONASA ($80.000)', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (304, '2024-04-11', 'ACCESORIO', 'HUELLERO 4500GFINGER', 'HID', 'SE20E12935', 1, 'TICSERVICES', 'Av. Libertador Bernardo O''Higgins N° 1367', 'COMPRA CHILEATIENDE', 'TIC-SERVICE', 'LECTOR BIOMETRICO -HUELLERO FONASA ($80.000)', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (305, '2024-10-10', 'ACCESORIO', 'TECLADO MAGIK MAC', 'APPLE ESPAÑOL', 'SF0T3493RKUJJKP3AL', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'TECLADO MAC APPLE ESPAÑOL', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (306, '2024-10-10', 'ACCESORIO', 'TECLADO MAGIK MAC', 'APPLE ESPAÑOL', 'SF0T3493RL16JKP3AA', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'TECLADO MAC APPLE ESPAÑOL', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (307, '2024-10-10', 'ACCESORIO', 'TECLADO MAGIK MAC', 'APPLE ESPAÑOL', 'SF0T3513RGCFJKP3AV', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'TECLADO MAC APPLE ESPAÑOL', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (308, '2024-10-10', 'ACCESORIO', 'TECLADO MAGIK MAC', 'APPLE ESPAÑOL', 'SF0T3513RGF9JKP3AS', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'TECLADO MAC APPLE ESPAÑOL', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (309, '2024-10-10', 'ACCESORIO', 'TECLADO MAGIK MAC', 'APPLE ESPAÑOL', 'SF0T3513RGQ5JKP3A3', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'TECLADO MAC APPLE ESPAÑOL', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (310, '2024-10-10', 'ACCESORIO', 'TECLADO MAGIK MAC', 'APPLE ESPAÑOL', 'SF0T3513RGRXJKP3A8', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'TECLADO MAC APPLE ESPAÑOL', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (311, '2024-10-10', 'ACCESORIO', 'TECLADO MAGIK MAC', 'APPLE ESPAÑOL', 'SF0T3513RGS2JKP3A0', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'TECLADO MAC APPLE ESPAÑOL', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (312, '2024-10-10', 'ACCESORIO', 'TECLADO MAGIK MAC', 'APPLE ESPAÑOL', 'SF0T4153RF6BJKP3EV', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'TECLADO MAC APPLE ESPAÑOL', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (313, '2025-04-23', 'ACCESORIO', 'TECLADO MAGIC MAC TOUCH', 'APPLE', 'SF0T4337RGW41G5VBL', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'TECLADO MAGIC MAC TOUCH', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (314, '2025-04-23', 'ACCESORIO', 'TECLADO MAGIC MAC TOUCH', 'APPLE', 'SF0T4337RGX31G5VBJ', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'TECLADO MAGIC MAC TOUCH', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (315, '2025-06-05', 'ACCESORIO', 'TECLADO MAGIC MAC TOUCH', 'APPLE', 'SF0T4337RGZT1G5VBN', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'TECLADO MAGIC MAC TOUCH', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (316, '2025-06-05', 'ACCESORIO', 'TECLADO MAGIC MAC TOUCH', 'APPLE', 'SF0T4337RH021G5VB9', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'TECLADO MAGIC MAC TOUCH', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (317, '2025-04-23', 'ACCESORIO', 'TECLADO MAGIC MAC TOUCH', 'APPLE', 'SF0T4337RH0L1G5VBR', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'TECLADO MAGIC MAC TOUCH', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (318, '2025-04-23', 'ACCESORIO', 'TECLADO MAGIC MAC TOUCH', 'APPLE', 'SF0T4337RH0R1G5VBL', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'TECLADO MAGIC MAC TOUCH', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (319, '2025-04-23', 'ACCESORIO', 'TECLADO MAGIC MAC TOUCH', 'APPLE', 'SF0T4337RH0S1G5VBK', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'TECLADO MAGIC MAC TOUCH', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (320, '2025-04-23', 'ACCESORIO', 'TECLADO MAGIC MAC TOUCH', 'APPLE', 'SF0T4337RH151G5VB3', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'TECLADO MAGIC MAC TOUCH', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (321, '2025-04-23', 'ACCESORIO', 'TECLADO MAGIC MAC TOUCH', 'APPLE', 'SF0T4337RH1B1G5VBX', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'TECLADO MAGIC MAC TOUCH', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (322, '2024-10-10', 'NOTEBOOK', 'MacBook Pro M3', 'MACBOOK ', 'SFF7NQM9DRH', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK MAC CON CARGADOR ', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (323, '2025-04-23', 'NOTEBOOK', 'MacBook AIR APPLE M3', 'APPLE', 'SFK96NLFGV9', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'MacBook AIR APPLE M3', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (324, '2025-04-30', 'NOTEBOOK', 'MacBook Pro M4', 'LENOVO', 'SGTH2P4QV93', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'COMPRA', 'SEBASTIAN DINAMARCA', 'MacBook Pro M4', 'IGNACIO ANDRES ROJAS');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (325, '2025-04-23', 'NOTEBOOK', 'MacBook AIR APPLE M3', 'APPLE', 'SGX91P75QQX', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'MacBook AIR APPLE M3', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (326, '2025-04-23', 'NOTEBOOK', 'MacBook AIR APPLE M3', 'APPLE', 'SHDC6TT9WNX', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'MacBook AIR APPLE M3', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (327, '2024-10-10', 'NOTEBOOK', 'MacBook Pro M3', 'MACBOOK ', 'SHKF74CC6CJ', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK MAC CON CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (328, '2024-10-10', 'NOTEBOOK', 'MacBook Pro M3', 'MACBOOK ', 'SHKXX69RXY5', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK MAC CON CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (329, '2025-10-01', 'NOTEBOOK', 'MacBook AIR APPLE M2', 'APPLE', 'SHPL9H4Q4TD', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'COMPRA CHILEATIENDE', 'PERSONAL DE TECNODATA', 'APPLE MACBOOK PRO / APPLE M3 MAX / 1TB', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (330, '2025-06-05', 'ACCESORIO', 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SJ84HAY039TA0000539', 1, 'TECNODATA', 'TECNODATA', 'COMPRA', 'JUAN DUJISIN', 'MOUSE INALAMBRICO APPLE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (331, '2025-06-05', 'ACCESORIO', 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SJ84HAZ0144A0000539', 1, 'TECNODATA', 'TECNODATA', 'COMPRA', 'JUAN DUJISIN', 'MOUSE INALAMBRICO APPLE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (332, '2025-04-23', 'ACCESORIO', 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SJ84HAZ01KFA0000539', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'MOUSE INALAMBRICO APPLE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (333, '2025-04-23', 'ACCESORIO', 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SJ84HAZ01PCA0000539', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'MOUSE INALAMBRICO APPLE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (334, '2025-04-23', 'ACCESORIO', 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SJ84HAZ01PZA0000539', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'MOUSE INALAMBRICO APPLE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (335, '2025-04-23', 'ACCESORIO', 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SJ84HAZ021DA0000539', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'MOUSE INALAMBRICO APPLE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (336, '2025-04-23', 'ACCESORIO', 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SJ84HAZ030XA0000539', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'MOUSE INALAMBRICO APPLE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (337, '2025-04-23', 'ACCESORIO', 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SJ84HAZ038DA0000539', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'MOUSE INALAMBRICO APPLE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (339, '2024-10-10', 'NOTEBOOK', 'MacBook Pro M3', 'MACBOOK ', 'SJQ71QYJ5Y2', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK MAC CON CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (340, '2025-04-23', 'NOTEBOOK', 'MacBook AIR APPLE M3', 'APPLE', 'SLCXHCD7KM1', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'MacBook AIR APPLE M3', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (341, '2025-04-23', 'NOTEBOOK', 'MacBook AIR APPLE M3', 'APPLE', 'SLDF7563XCC', 1, 'TECNODATA', 'TECNODATA ', 'COMPRA', 'JUAN DUJISIN', 'MacBook AIR APPLE M3', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (342, '2024-10-10', 'NOTEBOOK', 'MacBook Pro M3', 'MACBOOK ', 'SLJ6H6JDWND', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK MAC CON CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (343, '2024-10-10', 'NOTEBOOK', 'MacBook Pro M3', 'MACBOOK ', 'SM3H72X006H', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK MAC CON CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (344, '2025-01-13', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'SMP2A71NC', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'EQUIPO AIO NEO50A CON ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (345, '2025-01-13', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'SMP2ACB04', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'EQUIPO AIO NEO50A CON ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (346, '2024-10-10', 'NOTEBOOK', 'MacBook Pro M3', 'MACBOOK ', 'SMYC99JX9KP', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK MAC CON CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (347, '2025-04-02', 'UNIDAD DE MEMORIA', 'DISCO SSD EXTERNO KINGSTON 4TB/3500MB', 'KINGSTON', 'SNV2S/4000G', 1, 'ALAMEDA PISO 5', 'TIC SERVICES', 'COMPRA', 'PERSONAL DE TIC-SERVICES', 'UNIDAD  ESTADO SOLIDO KINGSTON 4TB/3500MB', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (348, '2024-03-06', 'NOTEBOOK', 'LENOVO T470S ', 'LENOVO', 'SPC0R21LV', 1, 'TEMUCO MATTA #62 ,1º PISO', 'Matta 62. Primer piso', 'TECNODATA S.A  ID', 'JULIO OYARZO CARDENAS', 'ENTREGA DE NOTEBOOK T470 CON CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (349, '2024-11-25', 'NOTEBOOK', 'LENOVO T470S ', 'LENOVO', 'SPC0R21M', 1, 'CONSTITUCIÓN PORTALES #80', 'CONSTITUCION # 50', 'TECNODATA  S.A', 'CORREOS', 'NOTEBOOK SIN CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (350, '2024-12-09', 'NOTEBOOK', 'LENOVO T480S', 'LENOVO', 'SPF1GX78P', 1, 'CONCEPCIÓN CASTELLON #435 PISO 6', 'CASTELLÓN # 435 PISO 6', 'TECNODATA S.A', 'JUAN PABLO BONILLA', 'NOTEBOOK T480 MAS CARGADOR Y MOCHILA', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (351, '2024-09-16', 'NOTEBOOK', 'LENOVO T480S', 'LENOVO', 'SPF1GX8V1', 1, 'PUERTO MONTT URMENETA #509 2º PISO', 'URMENETA #509 PSIO 2', 'TECNODATA  S.A', 'HECTOR QUIROZ COFRE', 'NOTEBOOK T480 CON CARGADOR ', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (352, '2024-09-16', 'NOTEBOOK', 'LENOVO T480S', 'LENOVO', 'SPF1HDR3W', 1, 'PUERTO MONTT URMENETA #509 2º PISO', 'URMENETA #509 PSIO 2', 'TECNODATA  S.A', 'HECTOR QUIROZ COFRE', 'NOTEBOOK T480 CON CARGADOR ', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (353, '2024-09-16', 'NOTEBOOK', 'LENOVO V15', 'LENOVO', 'SPF3CTWDF', 1, 'PUERTO MONTT URMENETA #509 2º PISO', 'URMENETA #509 PSIO 2', 'TECNODATA  S.A', 'HECTOR QUIROZ COFRE', 'NOTEBOOK V15 CON CARGADOR (EQUIPO NO PRENDE)', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (354, '2024-10-10', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF406WQ', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (355, '2024-04-12', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JQ57W', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'NOTEBOOK X1CARBÓN CON CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (356, '2024-08-26', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JQ584', 1, 'ALAMEDA PISO 8', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (357, '2024-08-26', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JQ7KJ', 1, 'ALAMEDA PISO 8', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (358, '2024-08-26', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JR692', 1, 'ALAMEDA PISO 8', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (359, '2024-08-26', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JR69R', 1, 'ALAMEDA PISO 8', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (360, '2024-08-26', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JR6AX', 1, 'ALAMEDA PISO 8', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (361, '2024-08-26', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JR6CL', 1, 'ALAMEDA PISO 8', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (362, '2024-08-26', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JR8J9', 1, 'ALAMEDA PISO 8', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (363, '2024-08-26', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JR8JH', 1, 'ALAMEDA PISO 8', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (364, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'V2DH2VM2QJ', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (365, '2024-04-12', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JR8LS', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'NOTEBOOK X1CARBÓN CON CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (366, '2024-04-12', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JR8M5', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'NOTEBOOK X1CARBÓN CON CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (367, '2024-05-12', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JR91', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (368, '2024-04-12', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JRAV4', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'NOTEBOOK X1CARBÓN CON CARGADOR', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (369, '2024-08-26', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JRAW1', 1, 'ALAMEDA PISO 8', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (370, '2024-08-26', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JRD2Y', 1, 'ALAMEDA PISO 8', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (371, '2024-08-26', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JRF7P', 1, 'ALAMEDA PISO 8', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (372, '2024-08-26', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JRK0V', 1, 'ALAMEDA PISO 8', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (373, '2024-08-26', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JRK3M', 1, 'ALAMEDA PISO 8', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (374, '2024-08-26', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JRLR6', 1, 'ALAMEDA PISO 8', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (375, '2024-08-26', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JRNCX', 1, 'ALAMEDA PISO 8', 'VICTOR MANUEL # 1672', 'TECNODATA S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (376, '2024-10-10', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4Z04MT', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (377, '2024-10-10', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4Z04N0', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (378, '2024-10-10', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4Z06TF', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (379, '2024-10-10', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4Z06V5', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (380, '2024-10-17', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4Z06X3', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (381, '2024-10-10', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4Z06X6', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (382, '2024-10-17', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4Z0945', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (383, '2024-10-17', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4Z0979', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (384, '2024-10-17', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4Z1NYB', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (385, '2024-10-10', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4Z1NYY', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (386, '2024-10-10', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4Z1P09', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (387, '2024-10-17', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4Z1R5A', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (388, '2024-10-17', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4Z1R5R', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (389, '2024-10-17', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4Z1R6R', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (390, '2024-10-10', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4Z1R97', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (391, '2024-10-10', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4Z1TE7', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK X1 CARBON Y SUS ACCESORIOS, MOCHILA,ADAPTADOR DE RED, CANDADO, MOUSE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (392, '2025-05-02', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5AX2YG - 72141', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'NOTEBOOK X1 CARBON G12 INTEL CORE ULTRA 7 CON SU ADAPTADOR DE RED', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (393, '2025-05-02', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5AX6M8 -72140', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'NOTEBOOK X1 CARBON G12 INTEL CORE ULTRA 7 CON SU ADAPTADOR DE RED', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (394, '2025-05-02', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5AX6NW - 72143', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'NOTEBOOK X1 CARBON G12 INTEL CORE ULTRA 7 CON SU ADAPTADOR DE RED', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (395, '2025-05-02', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5AX96D - 72138', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'NOTEBOOK X1 CARBON G12 INTEL CORE ULTRA 7 CON SU ADAPTADOR DE RED', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (396, '2025-05-02', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5AX96V -  72142', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'NOTEBOOK X1 CARBON G12 INTEL CORE ULTRA 7 CON SU ADAPTADOR DE RED', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (397, '2025-05-02', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5AX975 - 72139', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'NOTEBOOK X1 CARBON G12 INTEL CORE ULTRA 7 CON SU ADAPTADOR DE RED', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (398, '2025-05-13', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF5FFS14', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (399, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G33XF', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (400, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G33XT', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (401, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G33YN', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (402, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G364F', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (403, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3657', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (404, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G367V', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (405, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G38C9', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (406, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G38E8', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (407, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3AN5', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (408, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3AP2', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (409, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3APT', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (410, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3AQ7', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (411, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3CWW', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (412, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3CX8', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (413, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3CXR', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (414, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3CZL', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (415, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3CZZ', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (416, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3D0F', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (417, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6AB3', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (418, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6ABF', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (419, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6ABV', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (420, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6AC5', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (421, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6CH3', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (422, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6CJC', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (423, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6CJS', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (424, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6CL4', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (425, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6ERD', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (426, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6ES9', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (427, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6ESQ', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (428, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6ETK', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (429, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6ETZ', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (430, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6EVE', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (431, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6EW7', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (432, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6H2L', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (433, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6H3E', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (434, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6H3T', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (435, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6H4E', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (436, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6H4W', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (437, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6H5M', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (438, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6KAC', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (439, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6KAL', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (440, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6KB2', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (441, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6KBZ', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (442, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6KCD', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', 'CHRISTIAN ROJAS VILLAROEL');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (443, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6MJJ', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (444, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6MK2', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (445, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6MKF', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (446, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6MKZ', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (447, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6MLS', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (448, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6MM9', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', 'JORGE LEON AGUILUZ ALAMEDA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (449, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6MNG', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (450, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6MNX', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (451, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6PTC', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (452, '2025-05-13', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF5G6PX5', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'LENOVO X1', 'FELIPE BRAVO FERNANDEZ ALAMEDA PISO 8');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (453, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6PXG', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (454, '2025-05-13', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF5G6S3H', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (455, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6S3Y', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (456, '2025-05-13', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF5G6S4T', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (457, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6S5L', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (458, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6S6L', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (459, '2025-05-13', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF5G6ZVR', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (460, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6ZYW', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (461, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G724Z', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (462, '2025-05-13', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF5G728N', 1, 'IBM', 'PROVIDENCIA 655', 'ARRIENDO', 'JUAN DUJISIN', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (463, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G74D6', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (464, '2025-04-29', 'NOTEBOOK', 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G74GP', 1, 'TECNODATA', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'LENOVO X1', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (465, '2024-10-10', 'NOTEBOOK', 'MacBook Pro M3', 'MACBOOK ', 'STMGQJ1C601', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'TECNODATA', 'NOTEBOOK MAC CON CARGADOR', 'RAUL GAJARDO ALAMEDA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (466, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'V30HF0JY3R', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (467, '2025-01-31', 'IMPRESORA', 'IMPRESORA HP OFFICE JET 200', 'HP', 'TH46PCZ0MQ', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'RAUL GALLARDO', 'IMPRESORA HP OFFICE JET 200 MOBILE', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (468, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'V7N6TTFYDF', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (469, '2025-03-02', 'ACCESORIO', 'MOUSEPAD TECMASTER', 'TECMASTER', 'TM-GEL05-BK', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'RAUL GALLARDO', 'MOUSE PAD TECMASTER', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (470, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'VQX0JCR95V', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (471, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'VYYCWH10FR', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (472, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'W92YX3HN65', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (473, '2024-10-12', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD26W', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (474, '2024-10-12', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2G1', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (475, '2024-05-12', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2G8 ', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (476, '2024-10-12', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2GA', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (477, '2024-11-12', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2GD', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (478, '2024-11-20', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2GL', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (479, '2024-11-19', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2GR', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (480, '2024-11-10', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2GX', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (481, '2024-10-12', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2GZ', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (482, '2025-10-01', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2H0', 1, 'ALAMEDA PISO 4', 'TIC SERVICES', 'COMPRA', 'PERSONAL DE TICSERVICES', 'MONITOR LENOVO C24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (483, '2024-10-23', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2H1', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (484, '2025-07-01', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2H4', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (485, '2025-07-01', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2H4 ', 1, 'ALAMEDA PISO 4', 'TIC SERVICES', 'COMPRA', 'PERSONAL DE TICSERVICES', 'MONITOR LENOVO C24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (486, '2024-10-12', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2H5', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (487, '2024-12-31', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2H6', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (488, '2024-10-12', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2H7', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (489, '2024-10-12', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2HA', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (490, '2024-11-12', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2HC', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (491, '2024-12-19', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2HF', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (492, '2024-12-17', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2HG', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (493, '2025-10-01', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2HK', 1, 'ALAMEDA PISO 4', 'TIC SERVICES', 'COMPRA', 'PERSONAL DE TICSERVICES', 'MONITOR LENOVO C24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (494, '2024-10-10', 'PANTALLA', 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2HM', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'PANTALLA EXTERNA LENOVO 24', NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (495, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'WNMGG63HPV', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'ROY MACKENNEY');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (496, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'XHWDQN22VY', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (497, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'XQY7D6TNY0', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (498, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'XXH9G96TXN', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (499, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'Y232QG0655', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (500, '2025-03-19', 'TABLET', 'IPAD PRO 11', 'APPLE', 'Y4W6V4CXXN', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'SEBASTIAN', 'IPAD PRO 11', 'NICOLAS GALARCE');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (501, '2025-04-14', 'TABLET', 'IPAD PRO 11', 'APPLE', 'Y9CN4CGQHV', 1, 'HUECHURABA', 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'COMPRA', 'SOPORTE NIVEL 2', 'IPAD PRO V11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (502, '2025-09-06', 'NOTEBOOK', 'MacBook AIR APPLE M3', 'APPLE', 'K7YP3QTW79', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'MICHEL SILVA', 'MacBook AIR APPLE M3 EQUIPO LO TIENE MICHEL SILVA', 'DANIEL ITURRIAGA Piso 5');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (503, '2025-10-06', 'ACCESORIO', 'HUB HD4005 HYPER', 'HYPER', 'PV23364803707', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'SOPORTE NIVEL 2', 'HUB HD4005 HYPER', 'RAUL GALLARDO');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (504, '2025-10-06', 'ACCESORIO', 'HUB HD4005 HYPER', 'HYPER', 'PV23364803712', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'SOPORTE NIVEL 2', 'HUB HD4005 HYPER', 'ROBERTO SAAVEDRA');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (505, '2025-10-06', 'IMPRESORA', 'IMPRESORA BROTHER', 'BROTHER', '27000193', 1, 'LA PINTANA', 'BALDOMERO LILLO # 1966', 'COMPRA', 'SEBASTIAN DINAMARCA', 'IMPRESORA BROTHER CON CABLE DE ENERGIA SIN CLABLE USB', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (506, '2025-10-06', 'IMPRESORA', 'IMPRESORA BROTHER', 'BROTHER', '27000203', 1, 'LA PINTANA', 'BALDOMERO LILLO # 1966', 'COMPRA', 'SEBASTIAN DINAMARCA', 'IMPRESORA BROTHER CON CABLE DE ENERGIA SIN CLABLE USB', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (507, '2025-10-06', 'IMPRESORA', 'IMPRESORA BROTHER', 'BROTHER', '27000073', 1, 'LO PRADO', 'SAN PABLO # 5849', 'COMPRA', 'SEBASTIAN DINAMARCA', 'IMPRESORA BROTHER CON CABLE DE ENERGIA SIN CLABLE USB', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (508, '2025-10-06', 'IMPRESORA', 'IMPRESORA BROTHER', 'BROTHER', 'U63885M3N922745', 1, 'SUCURSAL SANTIAGO', 'SAN PABLO # 2471', 'COMPRA', 'SEBASTIAN DINAMARCA', 'IMPRESORA BROTHER CON CABLE DE ENERGIA SIN CLABLE USB', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (509, '2025-10-06', 'IMPRESORA', 'IMPRESORA BROTHER', 'BROTHER', 'U63885JN863115', 1, 'SUCURSAL QUILICURA', 'GUARDIAMARINA RIQUELME # 489', 'COMPRA', 'SEBASTIAN DINAMARCA', 'IMPRESORA BROTHER CON CABLE DE ENERGIA SIN CLABLE USB', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (510, '2025-11-06', 'TABLET', 'IPAD PRO 11', 'APPLE', 'L7CQY3P7NV', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'MICHEL SILVA', 'IPAD PRO 11', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (511, '2025-12-06', 'NOTEBOOK', 'MacBook Pro M3', 'APPLE', 'C4T4VYJMG6', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 4', 'COMPRA', 'IGNACIO ROJAS', 'MacBook Pro M3', 'RUBEN OLIVARES PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (512, '2024-03-12', 'TABLET', 'GALAXY S9 FE SAMSUNG', 'SAMSUNG', '100312132', 1, 'HUECHURABA AVENIDA DEL PARQUE #4928 OF 224', 'HUECHURABA', 'COMPRA CHILEATIENDE', 'PERSONAL DE TIC-SERVICE', 'TABLET SAMSUNG GALAXY TAB S9 FE 128GB 6GB', 'HANS OELCKERS');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (513, '2025-05-19', 'NOTEBOOK', 'LENOVO V15', 'LENOVO', 'PF3CVC5J', 1, 'ALAMEDA PISO 8', 'ALAMEDA PISO 8', 'FCOM', 'ALEX PEREZ', 'LENVO V15 G2 ITIL CON SU CARGADOR', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (514, '2025-12-06', 'ACCESORIO', 'TECLADO MAGIC MAC', 'APPLE', 'F0T3492RG6HJKP3AP', 1, 'ALAMEDA PISO 4', 'ALAMEDA PISO 6', 'COMPRA ', 'SEBASTIAN DINAMARCA', 'TECLADO MAGIC MAC NUMERICO', 'LORENA TORTELLA PISO 6');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (515, '2024-04-12', 'NOTEBOOK', 'LENOVO X1', 'LENOVO', 'SPF4JR8LE', 1, 'TECNODATA ', 'VICTOR MANUEL # 1672', 'TECNODATA  S.A', 'PERSONAL DE TECNODATA', 'NOTEBOOK X1CARBÓN CON CARGADOR', 'DANIELA PALMA (ALAMEDA PISO 8)');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (516, '2025-10-01', 'AIO', 'LENOVO NEO 50A', 'LENOVO', 'MP2A69WZ', 1, 'CONCEPCIÓN CASTELLON #435 PISO 1', 'CASTELLÓN 435 PISO 1', 'TECNODATA S.A ID', 'CAROL GARCES VILLALOBOS', 'EQUIPO AIO NEO50A CON ACCESORIOS', 'MARIA HIDALGO VILLA ALEMANA MATURANA #185');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (517, '2025-06-13', 'NOTEBOOK', 'LENOVO V15', 'LENOVO', 'PF3BSY5C', 1, 'ROSALBA GONZALEZ CAP LOTA', 'CAP LOTA', 'FCOM', 'ROSALBA GONZALEZ', 'LENOVO V15', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (518, '2025-06-17', 'NOTEBOOK', 'LENOVO V15', 'LENOVO', 'PF3BRFMY', 1, 'SOLANGE OLIVARES TALCAHUANO', 'TALCAHUANO SARGENTO ALDEA #230', 'FCOM', 'SOLANGE OLIVARES ASTUDILLO', 'LENOVO V15 CON CARGADOR', 'BODEGA PISO 4');
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (519, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (520, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (521, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (522, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (523, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (524, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (525, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (526, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (527, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (528, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (529, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (530, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (531, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (532, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (533, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (534, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (535, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (536, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (537, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (538, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (539, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (540, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (541, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (542, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (543, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (544, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (545, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (546, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (547, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (548, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (549, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (550, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (551, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (552, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (553, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (554, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (555, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (556, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (557, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (558, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (559, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (560, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (561, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingreso_producto (id, fecha, tipo_producto, producto, marca, serie_id, cantidad, lugar_origen, direccion_origen, equipo_arriendo_id, despacho_realizado, caja_vacia, donde_esta) VALUES (562, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 4990 (class 0 OID 16788)
-- Dependencies: 232
-- Data for Name: movimiento_tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4982 (class 0 OID 16746)
-- Dependencies: 224
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4998 (class 0 OID 16878)
-- Dependencies: 240
-- Data for Name: persona_destinatario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (1, 'ELIZABETH ROSANA CONEJEROS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (2, 'LEONARDO GAJARDO TELLO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (3, 'DANIELA ANDREA CESPEDES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (4, 'VERONICA SANTIBAÑEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (5, 'CLAUDIA DINAMARCA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (6, 'CLAUDIA MARTINEZ HIDALGO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (7, 'FRANCISCA RIQUELME');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (8, 'JOCELYN TRINA FIERRO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (9, 'DANIELA PALMA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (10, 'JUAN CARLOS FIGUEROA SILVA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (11, 'ROY MAC KENNEY');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (12, 'RAUL GALLARDO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (13, 'DANIEL TORO RODRIGUEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (14, 'HANS OELCKERS ARRIAGADA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (15, 'FELIPE VARAS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (16, 'MARCELA PEREIRA SAEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (17, 'ROSALVA GONZALEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (18, 'HERNAN GARRIDO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (19, 'VIVIANA ITUARTE');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (20, 'MICHEL SILVA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (21, 'LENIA SOLANGE PIZARRO SIERRA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (22, 'MARGOO ROGAZY CACERES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (23, 'SIMON ANDRES BRAVO VILLALOBOS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (24, 'CARLOS MOYA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (25, 'JAVIER HSIANG LEIVA HO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (26, 'DANIELA MESA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (27, 'HANS OELCKERS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (28, 'MARIA CONSUELO GARNICA RUIZ-TAGLE');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (29, 'FELIPE VARAS MUÑOZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (30, 'ALAN JESUS LAGOS KAUNE');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (31, 'DANIEL ROJAS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (32, 'ALEX PEREZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (33, 'JUAN DUJISIN');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (34, 'NICOLAS GALARCE');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (35, 'SEBASTIAN DINAMARCA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (36, 'MICHAEL JOSUE CARRERO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (37, 'PAMELA BEATRIZ VEGA GUTIERREZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (38, 'NICOLAS GALARCE ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (39, 'DANIEL ITURRIAGA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (40, 'IGNACIO PATRICIO HIGUERAS MEJIAS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (41, 'OSCAR ALEX CONEJEROS MUÑOZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (42, 'ROBERTO OSCAR SILVA BUSTAMANTE');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (43, 'SOLANGE MABEL GALLARDO MUÑOZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (44, 'JOSELYN GONZALEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (45, 'IGNACIO HIGUERA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (46, 'JORGE FARAH');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (47, 'ADOLFO ACEVEDO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (48, 'ROBERTO SILVA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (49, 'ALEX CONEJEROS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (50, 'SOLANGE GALLARDO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (51, 'IVONE VERGARA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (52, 'JAIME ROCHA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (53, 'JOSE CRUCES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (54, 'JOSMIR JAIMES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (55, 'LOREANA DEL VALLE MARIN CASTAÑEDA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (56, 'STEPHANIE ALEJANDRA SUAREZ CRUCES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (57, 'HUGO QUIDENAO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (58, 'NICOLAS VACHE');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (59, 'DANIELA ALEJANDRA PALMA ORDENES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (60, 'ELIANA RAQUEL LEPE ESPINOZA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (61, 'FELIPE IGNACIO BRAVO FERNANDEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (62, 'JAVIERA PAZ CESPEDES MOLLER');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (63, 'JESSICA NAVARRO AGUILERA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (64, 'JORGE AYALA VERGARA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (65, 'LUZ MARGARITA SOLOVERA MARQUEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (66, 'TATIANA NATALIA GALDAMES SANTIBAÑEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (67, 'JORGE ALEJANDRO PANTOJA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (68, 'CARLOS SALFATE');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (69, 'MARCELO VIDELA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (70, 'JUAN CARLOS VILLARROEL ANTEZANA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (71, 'MARCELO VIDELA ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (72, 'IVONNE JEANETE VERGARA PEREZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (73, 'JOCELYN GONZALEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (74, 'IVAN ORREGO DUFFNER');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (75, 'MAURICIO VERGARA COHN');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (76, 'PAULA BEATRIZ MANQUE DIAZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (77, 'LORENA MARGARITA TORTELLA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (78, 'ALEJANDRO ORELLANA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (79, 'JOSE RUBILAR');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (80, 'PAULA CORTES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (81, 'LILIAN ANDRADES ROJAS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (82, 'VICENTE CHAMORRO ALVAREZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (83, 'PETRONILA MIRANDA DIAZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (84, 'MACARENA GARMENDIA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (85, 'GUSTAVO AVILA PONCE');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (86, 'CAROL APABLAZA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (87, 'FRANCISCA CLAVERO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (88, 'CLAUDIA FLORES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (89, 'JOSE CRUCES AGUILERA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (90, 'MABEL SOLIS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (91, 'CAMILA URRUTIA URRTIA (PRACTICANTE)');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (92, 'MARIA ALEJANDRA HIDALGO MORALES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (93, 'NATALIA BERRIOS ESCOBEDO (PRACTICANTE)');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (94, 'KARLA ULLOA MONSALVES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (95, 'AYLINE PETERMANN FUENTES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (96, 'OSCAR VALDEBENITO ZUNIGA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (97, 'ROBERTO IGNACIO GAJARDO ALISTER');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (98, 'JOSE SALAS ROZAS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (99, 'RENATO HENRIQUEZ ARENAS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (100, 'ANGEL FUENTES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (101, 'PAULA CATALINA CANTILLANA ZUÑIGA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (102, 'LORENA PEREZ CERON');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (103, 'PAMELA QUEZADA VERGARA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (104, 'PAMELA DE LOURDES LARA MARTIN');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (105, 'CRISTINA BRAVO CASTRO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (106, 'MICHEL SILVA (ED. ALAMEDA SUCURSAL)');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (107, 'GLORIA ISABEL HOOD CANTILLANA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (108, 'JULIO CONTRERAS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (109, 'IVAN TRIVELLI');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (110, 'JOSE ROMERO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (111, 'GILBETH DOMINGUEZ RIVERA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (112, 'MARIO ALVARADO URTUBIA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (113, 'TATIANA PATINO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (114, 'CRISTIAN GUTIERREZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (115, 'OSCAR OSSIO SERRANO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (116, 'CLAUDIA FLORES(');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (117, 'ROSSANA SALINAS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (118, 'JAVIER RAULD VASQUEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (119, 'JORGE LUIS ALEJANDRO SALINAS CALBUL');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (120, 'ROBERTO SAAVEDRA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (121, 'CLAUDIA VILLA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (122, 'PAULA CATALAN OBREQUE');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (123, 'PAMELA FERNANDEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (124, 'ELENA GRACIELA CASTEX MUÑOZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (125, 'RONY CORREA CONCHA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (126, 'IGNACIO CORTES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (127, 'SOLEDAD JARA VARGAS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (128, 'LESLIE RAMIREZ VARGAS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (129, 'CATALINA PIMENTEL');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (130, 'PATRICIA GAETE ARAVENA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (131, 'CLAUDIA VILLA ALVAREZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (132, 'YERINA ROMO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (133, 'VERONICA BEBERLY CANDIA DURAN');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (134, 'CAMILA ARQUERO GARCIA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (135, 'BLADIMIR SILVA RIVERA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (136, 'CAROLINA VARAS SEPULVEDA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (137, 'ROBERTO IGANCIO GAJARDO ALISTER');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (138, 'JAVIERA PAZ CEPEDES MOLLER');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (139, 'PAOLA DONOSO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (140, 'MARCELA ELIZABETH POBLETE CACERES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (141, 'PAULA ORTIZ IRRAZABAL');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (142, 'VICTOR LEIVA VALLEJOS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (143, 'ROSALBA GONZALEZ MORAGA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (144, 'RENATO HERNANDEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (145, 'MARCIA ANDREA ROJO VALLADARES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (146, 'MARCIA ROJO VALLEDARES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (147, 'VICTOR LEIVA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (148, 'VALERIA REYES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (149, 'SAUL FERNANDO VASQUEZ MEJIAS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (150, 'HANS OELCKERS ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (151, 'PAULA OYANEDER');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (152, 'OSCAR VALDEBENITO ZUÑIGA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (153, 'MICHEL SILVA (ED. SANTO DOMINGO)');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (154, 'ALEXANDER WELSCH OPORTO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (155, 'FELIX AGUIRRE');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (156, 'CRISTIAN VERA SANDOVAL');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (157, 'MICHEL SILVA (PRESTAMO HASTA EL DIA JUEVES)');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (158, 'JOSE CRUCES ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (159, 'CLAUDIA BEAS ABARCA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (160, 'MYRIAM QUEZADA GATICA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (161, 'KARINA DURAN BECKER');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (162, 'ERICO PEREZ LARA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (163, 'MARCELA RIVAS MENDOZA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (164, 'CARLOS JERIA MARTINEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (165, 'DANIEL ALVIAL VERDEJO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (166, 'ROSA GALLARDO MUNDACA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (167, 'PAULINA OJEDA BARRIA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (168, 'MACARENA CASTELBLANCO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (169, 'YASNA BUSTAMANTE');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (170, 'JENNY DIAZ CRESPO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (171, 'MARIA FATIMA REQUENA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (172, 'CORALI RODRIGUEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (173, 'FELIPE MUÑOZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (174, 'IVAN ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (175, 'JENNIS OLIVARES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (176, 'PABLO MENDEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (177, 'JONATHAN BURGOS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (178, 'CLAUDIA FLORES (DANITSA GATICA)');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (179, 'LENIA PIZARRO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (180, 'WALDO ANTONIO LOAYZA BENAVIDES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (181, 'PEDRO PALMA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (182, 'GLADYS DONOSO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (183, 'CARLOS SALFATE TOLEDO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (184, 'MAURICIO MENDEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (185, 'MARIA TABITA GUTIERREZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (186, 'CLAUDIA CHANDIA LOPEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (187, 'CAROLINA CHANDIA LOPEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (188, 'CAROLINA AVERDAÑO BINIMELLIS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (189, 'HILDA MORENO ACOSTA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (190, 'JULIO CONTRERAS BARATELLA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (191, 'SILVIA ABARCA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (192, 'MANUEL GOMEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (193, 'GLADYS MOREIRA MOJICA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (194, 'VIVIANA ITUARTE VALDERRAMA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (195, 'HECTOR QUIROZ ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (196, 'HERIBERTO CARRASCO ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (197, 'MONICA HERRERA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (198, 'MIRNA BUSCH');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (199, 'RODRIGO BURGOS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (200, 'HENRY KIRBY MARCHANT ( MARCELO VIDELA)');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (201, 'GLORIA HOOD');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (202, 'FELIPE MAXIMILIANO PEREZ SOTO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (203, 'NIXY KUARTE SEGOVIA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (204, 'MAURICIO MANRIQUEZ CARRASCO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (205, 'MARIA ARANDA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (206, 'DANIELA PALMA ORDENES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (207, 'RODRIGO CACERES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (208, 'MANUEL JESUS ACEVEDO AGUILERA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (209, 'RODERICK RANGEL LANDINEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (210, 'JACQUELINE CACERES LUENGO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (211, 'YORKA CANDIA TORRES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (212, 'JOSE NICOLAS HERRERA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (213, 'IGNACIO ROJAS');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (214, 'RODRIGO PRIETO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (215, 'LORENA TORTELLA GONZALEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (216, 'RUBEN OLIVARES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (217, 'FELIPE BRAVO FERNANDEZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (218, 'LUIS CARDENAS BECERRA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (219, 'PATRICIO ORDENES ZUNIGA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (220, 'DANIEL ITURRIAGA MALDONADO');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (221, 'CINTHYA CASTILLO MERA');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (222, 'JORGE LEON AGUILUZ');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (223, 'CHRISTIAN ROJAS VILLAROEL');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (224, 'RODRIGO IVAN GALVEZ REYES');
INSERT INTO public.persona_destinatario (id_destinatario, nombre_completo) VALUES (225, 'INGRID SANTIBAÑEZ');


--
-- TOC entry 4986 (class 0 OID 16761)
-- Dependencies: 228
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (91, 'SOPORTE MONITOR DINON', 'DINON', '9064', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (92, 'CABLE TIPO 8', 'MAGIC', '35792', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (93, 'ADAPTADOR ETHERNET TIPO C HYPER', 'HYPER ', '35965', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (94, 'MOCHILA KAMET MAC', 'APPLE', '36784', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (95, 'MOUSE INALAMBRICO LOGITECH', 'LOGITECH', '52786', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (96, 'MOCHILA NEGRA', 'LENOVO', '266698', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (97, 'MOCHILA NEGRA', 'LENOVO', '266699', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (98, 'MOCHILA NEGRA', 'LENOVO', '266700', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (99, 'MOCHILA NEGRA', 'LENOVO', '266701', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (100, 'MOCHILA NEGRA', 'LENOVO', '266702', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (101, 'MOCHILA NEGRA', 'LENOVO', '266703', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (102, 'CANDADO NANO X1 CARBÓN', 'LENOVO', '266780', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (103, 'CANDADO NANO X1 CARBÓN', 'LENOVO', '266783', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (104, 'CANDADO NANO X1 CARBÓN', 'LENOVO', '266784', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (105, 'CANDADO NANO X1 CARBÓN', 'LENOVO', '266785', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (106, 'CANDADO NANO X1 CARBÓN', 'LENOVO', '266871', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (107, 'CANDADO NANO X1 CARBÓN', 'LENOVO', '266872', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (108, 'PUNTERO LASER', 'WIRELESS PRESENTER', '10900306', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (109, 'TCL 55 PULGADAS', 'TCL', '12006819', 'nuevo', NULL, NULL);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (110, 'TCL 55 PULGADAS', 'TCL', '12006820', 'nuevo', NULL, NULL);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (111, 'TCL 55 PULGADAS', 'TCL', '12006821', 'nuevo', NULL, NULL);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (112, 'TCL 55 PULGADAS', 'TCL', '12006822', 'nuevo', NULL, NULL);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (113, 'TCL 55 PULGADAS', 'TCL', '12006823', 'nuevo', NULL, NULL);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (114, 'TCL 55 PULGADAS', 'TCL', '12006824', 'nuevo', NULL, NULL);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (115, 'CARCASA IPAD PRO', 'MARCA CHINA', '100001080', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (116, 'Airpods', 'APPLE', '100101380', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (117, 'CANDADO DE MAC', 'KENSINGTON', '100106019', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (118, 'ADAPTADOR USB-C A DISPLAYPORT', 'P', '100109070', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (119, 'ADAPTADOR USB-C A HDMI', 'TYPE-C', '100109071', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (120, 'HUB HD4005 HYPER', 'PAS THRU', '100309042', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (121, 'IPAD AIR', 'APPLE', 'C1KXFVMW29', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (122, 'ADAPTADOR DISPLAY PORT A HDMI', 'SPEKTRA', '20220306440', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (123, 'ADAPTADOR DISPLAY PORT A HDMI', 'SPEKTRA', '20220306441', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (124, 'ADAPTADOR DISPLAY PORT A HDMI', 'SPEKTRA', '20220306442', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (125, 'ADAPTADOR DISPLAY PORT A HDMI', 'SPEKTRA', '20220306448', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (126, 'CARGADOR TIPO C LENOVO X1', 'LENOVO', ' 8SSA10R16922C2TJ', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (127, 'LENOVO X1', 'LENOVO', ' PF4JRLQA', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (128, 'LENOVO X1', 'LENOVO', ' PF4Z04MT / 72096', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (129, 'MONITOR 24P LENOVO', 'LENOVO', ' V90DD2GK', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (130, 'MONITOR 24P LENOVO', 'LENOVO', ' V90DD2HB', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (131, 'MONITOR 49P SAMSUNG', 'SAMSUNG', '07YTHNFM500131M', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (132, 'PENDRIVE 256GB KINGSTON', 'KINGSTON', '0L672', 'nuevo', NULL, 6);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (133, 'CARCASA SSD NVME 2.40GBPS', 'MINISOPURU', '100119017-E', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (134, 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '1SGX30K79401Z14VH1JA', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (135, 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '1SGX30K79401Z14VH1TP', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (136, 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '1SGX30K79401Z14VH1V2', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (137, 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '1SGX30K79401Z14VH1V4', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (138, 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '1SGX30K79401Z14VH1V6', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (139, 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '1SGX30K79401Z14VH1V7', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (140, 'TECLADO INALAMBRICO LOGITECH', 'LOGITEC', '2420SC109EH9', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (141, 'TECLADO INALAMBRICO LOGITECH', 'LOGITEC', '2420SC109EK9', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (142, 'TECLADO INALAMBRICO LOGITECH', 'LOGITEC', '2420SC109EL9', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (143, 'TECLADO INALAMBRICO LOGITECH', 'LOGITEC', '2420SC109EM9', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (144, 'TECLADO INALAMBRICO LOGITECH', 'LOGITEC', '2420SC109JK9', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (145, 'TECLADO INALAMBRICO LOGITECH', 'LOGITEC', '2420SC109KH9', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (146, 'TECLADO INALAMBRICO LOGITECH', 'LOGITEC', '2420SC109TH9', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (147, 'TECLADO INALAMBRICO LOGITECH', 'LOGITEC', '2420SC109TJ9', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (148, 'TECLADO INALAMBRICO MAC', 'APPLE', '25095/MQ052E/A', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (149, 'MOUSEPAD ULTRATECHNOLOGY', 'ULTRA TECHNOLOGY', '29UPM-00100', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (150, 'HUB HD4005 HYPER', 'HYPERDRIVE', '34565/HD4005GL', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (151, 'TECLADO INALAMBRICO LENOVO', 'LENOVO', '4X30M39482KPV257M8', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (152, 'LENOVO ADAPTADOR ETHERNET TIPO C', 'LENOVO', '4X90S91830DLD014MF', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (153, 'IMPRESORA HP OFFICE JET 200', 'HP', '50493/ TH0CA950RY', 'nuevo', NULL, 3);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (154, 'MONITOR 24P LENOVO', 'LENOVO', '5D11K27112', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (155, 'LENOVO NEO 50A', 'LENOVO', '71621 - MP2A71MX', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (156, 'TECLADO INALAMBRICO LENOVO', 'LENOVO', '8CCD50M39532KPV257MC', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (157, 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8CCM50M39559MPV257MC', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (158, 'CARGADOR V15', 'LENOVO', '8SSA10M42740L1C406L - SPF3BQV8F', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (159, 'CARGADOR TIPO C LENOVO X1', 'LENOVO', '8SSA10R16872L1CZ', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (160, 'TECLADO INALAMBRICO LENOVO', 'LENOVO', '8SSD50M3948KPV257LZ', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (161, 'TECLADO INALAMBRICO LENOVO', 'LENOVO', '8SSD50M39532KPV257MG', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (162, 'TECLADO INALAMBRICO LENOVO', 'LENOVO', '8SSD50M39532KPV257MK', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (163, 'TECLADO INALAMBRICO LENOVO', 'LENOVO', '8SSD50M39532KPV257MP', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (164, 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M39559MPV257LZ', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (165, 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M39559MPV257MG', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (166, 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M39559MPV257MK', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (167, 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M39559MPV257MP', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (168, 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A4A', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (169, 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A4D', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (170, 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A4P', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (171, 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A4R', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (172, 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A4S', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (173, 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A53', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (174, 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV20A5W', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (175, 'MOUSE INALAMBRICO LENOVO', 'LENOVO', '8SSM50M60128MPV37VNP', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (176, 'MICROFONO INALAMBRICO', 'WIRELESSME', '900100122 -IS0246422', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (177, 'ALZA NOTEBOOK KENSINGTON', 'KENSINGTON', '9528-5 / 100000190', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (178, 'GRABADORA DVD ', 'LENOVO', '988G67634', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (179, 'HUB PRO ADAM', 'ADAMS', 'AAPADHUBPROBK', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (180, 'IPAD AIR', 'APPLE', 'C426YXPGDX', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (181, 'CAJA MACBOOK PRO', 'MACBOOK ', 'C2QT6PVXKD', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (182, 'IPAD PRO 11', 'APPLE', 'C93JJP6XL6', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (183, 'IPAD PRO 11', 'APPLE', 'CFN63FPNW5', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (184, 'MOUSE INALAMBRICO APPLE', 'APPLE', 'CC2313206YA17YDA8', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (185, 'IPAD AIR', 'APPLE', 'D277QR1PVF', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (186, 'MacBook AIR APPLE M3', 'APPLE', 'CVVY4WQK9M', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (187, 'CANDADO DE MAC', 'APPLE', 'D22234A', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (188, 'IPAD PRO 11', 'APPLE', 'DDQTDW6D40', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (189, 'IPAD AIR', 'APPLE', 'DTQ73Q41DX', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (190, 'HUB D-LINK', 'D-LINK', 'DL4E3H8000386', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (191, 'HUB D-LINK', 'D-LINK', 'DL4E3H8000401', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (192, 'HUB D-LINK', 'D-LINK', 'DL4E3H8000409', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (193, 'IPAD AIR', 'APPLE', 'F4T4003HKK', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (194, 'DISCO DURO PORTABLE SSD KINGSTON XS2000', 'KINGSTON', 'F0535', 'nuevo', NULL, 6);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (195, 'TECLADO MAGIC MAC', 'APPLE', 'F0T2453RJH5JKP3AE', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (196, 'IPAD AIR', 'APPLE', 'F54XKRFW53', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (197, 'IPAD PRO 11', 'APPLE', 'F6MQPWFVGJ', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (198, 'IPAD PRO 11', 'APPLE', 'FHW79M7WVM', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (199, 'IPAD AIR', 'APPLE', 'FKX2T4WP9J', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (200, 'IPAD AIR', 'APPLE', 'FW73DMG6GD', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (201, 'IPAD AIR', 'APPLE', 'FXHW4G9G9F', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (202, 'IPAD AIR', 'APPLE', 'G3R9TWK24F', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (203, 'IPAD AIR', 'APPLE', 'G572H667Y4', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (204, 'IPAD PRO 11', 'APPLE', 'GG7GP9X3XX', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (205, 'IPAD PRO 11', 'APPLE', 'GGK3QLCXRD', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (206, 'IPAD PRO 11', 'APPLE', 'GHRWJ6WGJJ', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (207, 'IPAD PRO 11', 'APPLE', 'GQ2JKGGM2W', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (208, 'IPAD AIR', 'APPLE', 'GW0XM54HDQ', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (209, 'IPAD PRO 11', 'APPLE', 'H0FVKJ3YVG', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (210, 'IPAD PRO 11', 'APPLE', 'H1FJWLXMJK', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (211, 'IPAD PRO 11', 'APPLE', 'H1W1QWP2Q9', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (212, 'IPAD AIR', 'APPLE', 'H39W2V4XLG', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (213, 'IPAD PRO 11', 'APPLE', 'H76VX65Q6T', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (214, 'IPAD PRO 11', 'APPLE', 'HC346HGY22', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (215, 'IPAD PRO 11', 'APPLE', 'HHPXDV6Y9K', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (216, 'IPAD AIR', 'APPLE', 'HQC2PVWTXJ', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (217, 'IPAD AIR', 'APPLE', 'HXKTXYQCL2', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (218, 'IPAD AIR', 'APPLE', 'HYY7M76R65', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (219, 'IPAD PRO 11', 'APPLE', 'JCNKF0YHHJ', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (220, 'LENOVO NEO 50A', 'LENOVO', 'ID 71531 -MP2ACFKS', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (221, 'LENOVO NEO 50A', 'LENOVO', 'ID 72154 - MP2ACB04', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (222, 'LENOVO X1', 'LENOVO', 'ID:70577-PF4JR6A8 ', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (223, 'LENOVO X1', 'LENOVO', 'ID:71877 - PF4JQ5AF', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (224, 'IPAD PRO 11', 'APPLE', 'JTVH00DMYY', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (225, 'LENOVO M820Z', 'LENOVO', 'JMJ07RP1', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (226, 'IPAD PRO 11', 'APPLE', 'K6J9J6W5DJ', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (227, 'TECLADO FUNDA MAC', 'GENERICO', 'JWAF21114/140000018', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (228, 'SOPORTE MONITOR KENSINGTON', 'KENSINGTON', 'K52797WW', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (229, 'IPAD PRO 11', 'APPLE', 'K6N14V0NQW', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (230, 'IPAD AIR', 'APPLE', 'K9MXM75NHF', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (231, 'IPAD AIR', 'APPLE', 'KCX1XH94X3', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (232, 'IPAD PRO 11', 'APPLE', 'KFPJ2VX4RY', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (233, 'MEMORIA RAM KNF 32 GB', 'KINGSTON', 'KF556S40IB-32', 'nuevo', NULL, 6);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (234, 'IPAD PRO 11', 'APPLE', 'KQ6HC2TXHK', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (235, 'IPAD PRO 11', 'APPLE', 'KQ7YJPLW74', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (236, 'IPAD AIR', 'APPLE', 'KXF9NW67TM', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (237, 'IPAD PRO 11', 'APPLE', 'L24P4T04CL', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (238, 'IPAD PRO 11', 'APPLE', 'L67W64164Q', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (239, 'IPAD PRO 11', 'APPLE', 'L7CQY3P7NV', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (240, 'IPAD PRO 11', 'APPLE', 'LQVQHQGPPV', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (241, 'IPAD AIR', 'APPLE', 'LWVW3T6QR0', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (242, 'IPAD PRO 11', 'APPLE', 'MVKH67L7C4', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (243, 'LENOVO M810Z', 'LENOVO', 'MJ06710G', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (244, 'LENOVO M810Z', 'LENOVO', 'MJ0671A9', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (245, 'LENOVO M810Z', 'LENOVO', 'MJ0671DA', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (246, 'LENOVO M810Z', 'LENOVO', 'MJ0671EZ', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (247, 'LENOVO M820Z', 'LENOVO', 'MJ07RS11', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (248, 'LENOVO M820Z', 'LENOVO', 'MJ07RS59', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (249, 'LENOVO M820Z', 'LENOVO', 'MJ07RS5P', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (250, 'LENOVO M820Z', 'LENOVO', 'MJ07RS5U', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (251, 'LENOVO M820Z', 'LENOVO', 'MJ07RS7D', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (252, 'LENOVO M820Z', 'LENOVO', 'MJ07RS7M', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (253, 'LENOVO M820Z', 'LENOVO', 'MJ07RSBC', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (254, 'LENOVO M820Z', 'LENOVO', 'MJ07RSDM', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (255, 'LENOVO M820Z', 'LENOVO', 'MJ07RSJX', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (256, 'LENOVO M820Z', 'LENOVO', 'MJ07RSM2', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (257, 'LENOVO M820Z', 'LENOVO', 'MJ07RSP0', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (258, 'LENOVO M820Z', 'LENOVO', 'MJ07RT93', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (259, 'LENOVO M820Z', 'LENOVO', 'MJ07RTBV', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (260, 'LENOVO M820Z', 'LENOVO', 'MJ07RTC6', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (261, 'LENOVO M820Z', 'LENOVO', 'MJ07RTHG', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (262, 'LENOVO M820Z', 'LENOVO', 'MJ07RTUB', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (263, 'LENOVO M820Z', 'LENOVO', 'MJ07RTVU', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (264, 'LENOVO M820Z', 'LENOVO', 'MJ07RTXD', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (265, 'LENOVO M820Z', 'LENOVO', 'MJ07RTZD', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (266, 'LENOVO M820Z', 'LENOVO', 'MJ07RU24', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (267, 'LENOVO NEO 50A', 'LENOVO', 'MP2A69WF - 71757', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (268, 'IPAD PRO 11', 'APPLE', 'MXHVQW6LLQ', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (269, 'LENOVO NEO 50A', 'LENOVO', 'MP2A69XF', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (270, 'LENOVO NEO 50A', 'LENOVO', 'MP2A71NC', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (271, 'LENOVO NEO 50A', 'LENOVO', 'MP2A71NC - 72153', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (272, 'LENOVO NEO 50A', 'LENOVO', 'MP2A71QF', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (273, 'LENOVO NEO 50A', 'LENOVO', 'MP2A75M4 - 72067', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (274, 'LENOVO NEO 50A', 'LENOVO', 'MP2AC8LN', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (275, 'LENOVO NEO 50A', 'LENOVO', 'MP2AC8LN - 72155', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (276, 'LENOVO NEO 50A', 'LENOVO', 'MP2AC8MM - 71500', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (277, 'LENOVO NEO 50A', 'LENOVO', 'MP2ACB04', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (278, 'LENOVO NEO 50A', 'LENOVO', 'MP2ACFGC', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (279, 'LENOVO NEO 50A', 'LENOVO', 'MP2ACHSM', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (280, 'LENOVO NEO 50A', 'LENOVO', 'MP2ACHVK', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (281, 'LENOVO NEO 50A', 'LENOVO', 'MP2ACL57/71233', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (282, 'LENOVO NEO 50A', 'LENOVO', 'MP2AEJ4A', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (283, 'LENOVO NEO 50A', 'LENOVO', 'MP2AELBX', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (284, 'IPAD PRO 11', 'APPLE', 'MXQQJMXGX1', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (285, 'IPAD PRO 11', 'APPLE', 'NLXN6C397K', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (286, 'IPAD PRO 11', 'APPLE', 'NQN6RM4H97', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (287, 'IPAD PRO 11', 'APPLE', 'PJYTDXKWWF', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (288, 'IPAD PRO 11', 'APPLE', 'PM94Y3JVX1', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (289, 'TECLADO USB LENOVO', 'LENOVO', 'PC0QRW9R', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (290, 'TECLADO USB LENOVO', 'LENOVO', 'PC0QRW9T', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (291, 'TECLADO USB LENOVO', 'LENOVO', 'PC0QRW9V', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (292, 'TECLADO USB LENOVO', 'LENOVO', 'PC0QRW9W', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (293, 'TECLADO USB LENOVO', 'LENOVO', 'PC0QRW9Z', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (294, 'LENOVO T470S ', 'LENOVO', 'PCOR21KY', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (295, 'LENOVO T480S', 'LENOVO', 'PF1GX5ZD', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (296, 'LENOVO T480S', 'LENOVO', 'PF-1GX6HD', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (297, 'LENOVO T480S', 'LENOVO', 'PF1GX6K9', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (298, 'LENOVO T480S', 'LENOVO', 'PF1GX6KL', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (299, 'LENOVO T480S', 'LENOVO', 'PF1GX8KL', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (300, 'LENOVO T480S', 'LENOVO', 'PF1GX8YC', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (301, 'LENOVO T480S', 'LENOVO', 'PF1H7THD', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (302, 'LENOVO T480S', 'LENOVO', 'PF1H837R', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (303, 'LENOVO T480S', 'LENOVO', 'PF1H83AZ', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (304, 'LENOVO T480S', 'LENOVO', 'PF1H8YA3', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (305, 'LENOVO T480S', 'LENOVO', 'PF1HDP0Q', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (306, 'LENOVO T480S', 'LENOVO', 'PF1HDP2A', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (307, 'LENOVO V15', 'LENOVO', 'PF3BQVB5', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (308, 'LENOVO V15', 'LENOVO', 'PF3BQZWK', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (309, 'LENOVO V15', 'LENOVO', 'PF3BR4HD', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (310, 'LENOVO V15', 'LENOVO', 'PF3BXBGG', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (311, 'LENOVO V15', 'LENOVO', 'PF3BXBNG', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (312, 'LENOVO V15', 'LENOVO', 'PF3BXJ9Y', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (313, 'LENOVO V15', 'LENOVO', 'PF3BY3FV', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (314, 'LENOVO V15', 'LENOVO', 'PF3CL6T1', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (315, 'LENOVO V15', 'LENOVO', 'PF3CVGQ6', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (316, 'LENOVO X1', 'LENOVO', 'PF4 JQ31H', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (317, 'LENOVO X1', 'LENOVO', 'PF4JQ0R7', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (318, 'LENOVO X1', 'LENOVO', 'PF4JQ0ST', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (319, 'LENOVO X1', 'LENOVO', 'PF4JR41C', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (320, 'LENOVO X1', 'LENOVO', 'PF4JRAWY - 71925', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (321, 'LENOVO X1', 'LENOVO', 'PF4JRF7J', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (322, 'LENOVO X1', 'LENOVO', 'PF4JRFB2 / 70980', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (323, 'LENOVO X1', 'LENOVO', 'PF4JRK3V', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (324, 'LENOVO X1', 'LENOVO', 'PF4JRLQ2', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (325, 'LENOVO X1', 'LENOVO', 'PF4JRLR6', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (326, 'LENOVO X1', 'LENOVO', 'PF4JRPQD', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (327, 'LENOVO X1', 'LENOVO', 'PF4JRPQP', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (328, 'LENOVO X1', 'LENOVO', 'PF4Z06X6', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (329, 'LENOVO X1', 'LENOVO', 'PF4Z06XF', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (330, 'LENOVO X1', 'LENOVO', 'PF4Z1NYY / 72106', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (331, 'LENOVO X1', 'LENOVO', 'PF4Z1R7H', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (332, 'LENOVO P16', 'LENOVO', 'PF5E410V', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (333, 'LENOVO P18', 'LENOVO', 'PF5E411J', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (334, 'IPAD PRO 11', 'APPLE', 'PWGHG34497', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (335, 'IPAD PRO 11', 'APPLE', 'PYKYT7XDVW', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (336, 'HUB HD4005 HYPER', 'HYPER', 'PV23364803159', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (337, 'HUB HD4005 HYPER', 'HYPER', 'PV23364804338', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (338, 'IPAD PRO 11', 'APPLE', 'Q26PH4G2WN', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (339, 'IPAD PRO 11', 'APPLE', 'QGPKJTJYFK', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (340, 'IPAD PRO 11', 'APPLE', 'QJM6JRYQ3V', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (341, 'IPAD PRO 11', 'APPLE', 'QQYQ3KT40X', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (342, 'IPAD PRO 11', 'APPLE', 'R14WH37G7Q', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (343, 'IPAD PRO 11', 'APPLE', 'RM916F261H', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (344, 'IPAD PRO 11', 'APPLE', 'RQ03WMKTX7', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (345, 'IPAD PRO 11', 'APPLE', 'RYP3KQ1W1Y', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (346, 'IPAD PRO 11', 'APPLE', 'T4NQWTYFM0', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (347, 'IPAD PRO 11', 'APPLE', 'TM25QDF26Y', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (348, 'AOWEIXUN HDMI', 'AOWEIXUN', 'S/N', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (349, 'SOPORTE MONITOR MOVIBLE', 'BRASFORMA', 'SBRP1440', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (350, 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SCC2344305PG27CGA9', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (351, 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SCC2344305QR27CGAX', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (352, 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SCC2344306XC27CGAN', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (353, 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SCC234440A9T27CGA0', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (354, 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SCC234440C0D27CGA5', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (355, 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SCC234450CGE27CGAP', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (356, 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SCC234450FVS27CGA3', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (357, 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SCC234450GRW27CGAA', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (358, 'MacBook Pro M4', 'LENOVO', 'SCKJX412FFM', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (359, 'MacBook AIR APPLE M3', 'APPLE', 'SDXW2G5X6NP', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (360, 'HUELLERO 4500GFINGER', 'HID', 'SE20E12926', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (361, 'HUELLERO 4500GFINGER', 'HID', 'SE20E12927', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (362, 'HUELLERO 4500GFINGER', 'HID', 'SE20E12928', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (363, 'HUELLERO 4500GFINGER', 'HID', 'SE20E12929', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (364, 'HUELLERO 4500GFINGER', 'HID', 'SE20E12930', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (365, 'HUELLERO 4500GFINGER', 'HID', 'SE20E12931', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (366, 'HUELLERO 4500GFINGER', 'HID', 'SE20E12932', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (367, 'HUELLERO 4500GFINGER', 'HID', 'SE20E12933', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (368, 'HUELLERO 4500GFINGER', 'HID', 'SE20E12934', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (369, 'HUELLERO 4500GFINGER', 'HID', 'SE20E12935', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (370, 'TECLADO MAGIK MAC', 'APPLE ESPAÑOL', 'SF0T3493RKUJJKP3AL', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (371, 'TECLADO MAGIK MAC', 'APPLE ESPAÑOL', 'SF0T3493RL16JKP3AA', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (372, 'TECLADO MAGIK MAC', 'APPLE ESPAÑOL', 'SF0T3513RGCFJKP3AV', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (373, 'TECLADO MAGIK MAC', 'APPLE ESPAÑOL', 'SF0T3513RGF9JKP3AS', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (374, 'TECLADO MAGIK MAC', 'APPLE ESPAÑOL', 'SF0T3513RGQ5JKP3A3', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (375, 'TECLADO MAGIK MAC', 'APPLE ESPAÑOL', 'SF0T3513RGRXJKP3A8', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (376, 'TECLADO MAGIK MAC', 'APPLE ESPAÑOL', 'SF0T3513RGS2JKP3A0', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (377, 'TECLADO MAGIK MAC', 'APPLE ESPAÑOL', 'SF0T4153RF6BJKP3EV', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (378, 'TECLADO MAGIC MAC TOUCH', 'APPLE', 'SF0T4337RGW41G5VBL', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (379, 'TECLADO MAGIC MAC TOUCH', 'APPLE', 'SF0T4337RGX31G5VBJ', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (380, 'TECLADO MAGIC MAC TOUCH', 'APPLE', 'SF0T4337RGZT1G5VBN', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (381, 'TECLADO MAGIC MAC TOUCH', 'APPLE', 'SF0T4337RH021G5VB9', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (382, 'TECLADO MAGIC MAC TOUCH', 'APPLE', 'SF0T4337RH0L1G5VBR', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (383, 'TECLADO MAGIC MAC TOUCH', 'APPLE', 'SF0T4337RH0R1G5VBL', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (384, 'TECLADO MAGIC MAC TOUCH', 'APPLE', 'SF0T4337RH0S1G5VBK', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (385, 'TECLADO MAGIC MAC TOUCH', 'APPLE', 'SF0T4337RH151G5VB3', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (386, 'TECLADO MAGIC MAC TOUCH', 'APPLE', 'SF0T4337RH1B1G5VBX', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (387, 'MacBook Pro M3', 'MACBOOK ', 'SFF7NQM9DRH', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (388, 'MacBook AIR APPLE M3', 'APPLE', 'SFK96NLFGV9', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (389, 'MacBook Pro M4', 'LENOVO', 'SGTH2P4QV93', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (390, 'MacBook AIR APPLE M3', 'APPLE', 'SGX91P75QQX', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (391, 'MacBook AIR APPLE M3', 'APPLE', 'SHDC6TT9WNX', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (392, 'MacBook Pro M3', 'MACBOOK ', 'SHKF74CC6CJ', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (393, 'MacBook Pro M3', 'MACBOOK ', 'SHKXX69RXY5', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (394, 'MacBook AIR APPLE M2', 'APPLE', 'SHPL9H4Q4TD', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (395, 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SJ84HAY039TA0000539', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (396, 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SJ84HAZ0144A0000539', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (397, 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SJ84HAZ01KFA0000539', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (398, 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SJ84HAZ01PCA0000539', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (399, 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SJ84HAZ01PZA0000539', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (400, 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SJ84HAZ021DA0000539', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (401, 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SJ84HAZ030XA0000539', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (402, 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SJ84HAZ038DA0000539', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (403, 'MOUSE INALAMBRICO APPLE', 'APPLE', 'SJ84HAZ038QA0000539', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (404, 'MacBook Pro M3', 'MACBOOK ', 'SJQ71QYJ5Y2', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (405, 'MacBook AIR APPLE M3', 'APPLE', 'SLCXHCD7KM1', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (406, 'MacBook AIR APPLE M3', 'APPLE', 'SLDF7563XCC', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (407, 'MacBook Pro M3', 'MACBOOK ', 'SLJ6H6JDWND', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (408, 'MacBook Pro M3', 'MACBOOK ', 'SM3H72X006H', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (409, 'LENOVO NEO 50A', 'LENOVO', 'SMP2A71NC', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (410, 'LENOVO NEO 50A', 'LENOVO', 'SMP2ACB04', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (411, 'MacBook Pro M3', 'MACBOOK ', 'SMYC99JX9KP', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (412, 'DISCO SSD EXTERNO KINGSTON 4TB/3500MB', 'KINGSTON', 'SNV2S/4000G', 'nuevo', NULL, 6);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (413, 'LENOVO T470S ', 'LENOVO', 'SPC0R21LV', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (414, 'LENOVO T470S ', 'LENOVO', 'SPC0R21M', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (415, 'LENOVO T480S', 'LENOVO', 'SPF1GX78P', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (416, 'LENOVO T480S', 'LENOVO', 'SPF1GX8V1', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (417, 'LENOVO T480S', 'LENOVO', 'SPF1HDR3W', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (418, 'LENOVO V15', 'LENOVO', 'SPF3CTWDF', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (419, 'LENOVO X1', 'LENOVO', 'SPF406WQ', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (420, 'LENOVO X1', 'LENOVO', 'SPF4JQ57W', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (421, 'LENOVO X1', 'LENOVO', 'SPF4JQ584', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (422, 'LENOVO X1', 'LENOVO', 'SPF4JQ7KJ', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (423, 'LENOVO X1', 'LENOVO', 'SPF4JR692', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (424, 'LENOVO X1', 'LENOVO', 'SPF4JR69R', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (425, 'LENOVO X1', 'LENOVO', 'SPF4JR6AX', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (426, 'LENOVO X1', 'LENOVO', 'SPF4JR6CL', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (427, 'LENOVO X1', 'LENOVO', 'SPF4JR8J9', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (428, 'LENOVO X1', 'LENOVO', 'SPF4JR8JH', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (429, 'IPAD PRO 11', 'APPLE', 'V2DH2VM2QJ', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (430, 'LENOVO X1', 'LENOVO', 'SPF4JR8LS', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (431, 'LENOVO X1', 'LENOVO', 'SPF4JR8M5', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (432, 'LENOVO X1', 'LENOVO', 'SPF4JR91', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (433, 'LENOVO X1', 'LENOVO', 'SPF4JRAV4', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (434, 'LENOVO X1', 'LENOVO', 'SPF4JRAW1', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (435, 'LENOVO X1', 'LENOVO', 'SPF4JRD2Y', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (436, 'LENOVO X1', 'LENOVO', 'SPF4JRF7P', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (437, 'LENOVO X1', 'LENOVO', 'SPF4JRK0V', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (438, 'LENOVO X1', 'LENOVO', 'SPF4JRK3M', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (439, 'LENOVO X1', 'LENOVO', 'SPF4JRLR6', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (440, 'LENOVO X1', 'LENOVO', 'SPF4JRNCX', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (441, 'LENOVO X1', 'LENOVO', 'SPF4Z04MT', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (442, 'LENOVO X1', 'LENOVO', 'SPF4Z04N0', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (443, 'LENOVO X1', 'LENOVO', 'SPF4Z06TF', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (444, 'LENOVO X1', 'LENOVO', 'SPF4Z06V5', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (445, 'LENOVO X1', 'LENOVO', 'SPF4Z06X3', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (446, 'LENOVO X1', 'LENOVO', 'SPF4Z06X6', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (447, 'LENOVO X1', 'LENOVO', 'SPF4Z0945', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (448, 'LENOVO X1', 'LENOVO', 'SPF4Z0979', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (449, 'LENOVO X1', 'LENOVO', 'SPF4Z1NYB', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (450, 'LENOVO X1', 'LENOVO', 'SPF4Z1NYY', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (451, 'LENOVO X1', 'LENOVO', 'SPF4Z1P09', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (452, 'LENOVO X1', 'LENOVO', 'SPF4Z1R5A', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (453, 'LENOVO X1', 'LENOVO', 'SPF4Z1R5R', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (454, 'LENOVO X1', 'LENOVO', 'SPF4Z1R6R', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (455, 'LENOVO X1', 'LENOVO', 'SPF4Z1R97', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (456, 'LENOVO X1', 'LENOVO', 'SPF4Z1TE7', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (457, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5AX2YG - 72141', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (458, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5AX6M8 -72140', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (459, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5AX6NW - 72143', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (460, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5AX96D - 72138', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (461, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5AX96V -  72142', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (462, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5AX975 - 72139', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (463, 'LENOVO X1', 'LENOVO', 'SPF5FFS14', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (464, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G33XF', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (465, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G33XT', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (466, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G33YN', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (467, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G364F', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (468, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3657', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (469, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G367V', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (470, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G38C9', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (471, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G38E8', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (472, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3AN5', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (473, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3AP2', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (474, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3APT', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (475, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3AQ7', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (476, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3CWW', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (477, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3CX8', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (478, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3CXR', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (479, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3CZL', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (480, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3CZZ', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (481, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G3D0F', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (482, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6AB3', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (483, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6ABF', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (484, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6ABV', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (485, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6AC5', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (486, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6CH3', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (487, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6CJC', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (488, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6CJS', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (489, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6CL4', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (490, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6ERD', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (491, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6ES9', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (492, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6ESQ', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (493, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6ETK', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (494, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6ETZ', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (495, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6EVE', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (496, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6EW7', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (497, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6H2L', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (498, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6H3E', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (499, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6H3T', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (500, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6H4E', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (501, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6H4W', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (502, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6H5M', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (503, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6KAC', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (504, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6KAL', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (505, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6KB2', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (506, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6KBZ', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (507, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6KCD', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (508, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6MJJ', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (509, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6MK2', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (510, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6MKF', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (511, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6MKZ', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (512, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6MLS', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (513, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6MM9', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (514, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6MNG', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (515, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6MNX', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (516, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6PTC', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (517, 'LENOVO X1', 'LENOVO', 'SPF5G6PX5', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (518, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6PXG', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (519, 'LENOVO X1', 'LENOVO', 'SPF5G6S3H', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (520, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6S3Y', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (521, 'LENOVO X1', 'LENOVO', 'SPF5G6S4T', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (522, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6S5L', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (523, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6S6L', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (524, 'LENOVO X1', 'LENOVO', 'SPF5G6ZVR', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (525, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G6ZYW', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (526, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G724Z', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (527, 'LENOVO X1', 'LENOVO', 'SPF5G728N', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (528, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G74D6', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (529, 'LENOVO X1 TOUCH', 'LENOVO', 'SPF5G74GP', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (530, 'MacBook Pro M3', 'MACBOOK ', 'STMGQJ1C601', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (531, 'IPAD PRO 11', 'APPLE', 'V30HF0JY3R', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (532, 'IMPRESORA HP OFFICE JET 200', 'HP', 'TH46PCZ0MQ', 'nuevo', NULL, 3);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (533, 'IPAD PRO 11', 'APPLE', 'V7N6TTFYDF', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (534, 'MOUSEPAD TECMASTER', 'TECMASTER', 'TM-GEL05-BK', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (535, 'IPAD PRO 11', 'APPLE', 'VQX0JCR95V', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (536, 'IPAD PRO 11', 'APPLE', 'VYYCWH10FR', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (537, 'IPAD PRO 11', 'APPLE', 'W92YX3HN65', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (538, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD26W', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (539, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2G1', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (540, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2G8 ', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (541, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2GA', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (542, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2GD', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (543, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2GL', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (544, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2GR', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (545, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2GX', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (546, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2GZ', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (547, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2H0', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (548, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2H1', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (549, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2H4', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (550, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2H4 ', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (551, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2H5', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (552, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2H6', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (553, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2H7', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (554, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2HA', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (555, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2HC', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (556, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2HF', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (557, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2HG', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (558, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2HK', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (559, 'MONITOR 24P LENOVO', 'LENOVO', 'V90DD2HM', 'nuevo', NULL, 5);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (560, 'IPAD PRO 11', 'APPLE', 'WNMGG63HPV', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (561, 'IPAD PRO 11', 'APPLE', 'XHWDQN22VY', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (562, 'IPAD PRO 11', 'APPLE', 'XQY7D6TNY0', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (563, 'IPAD PRO 11', 'APPLE', 'XXH9G96TXN', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (564, 'IPAD PRO 11', 'APPLE', 'Y232QG0655', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (565, 'IPAD PRO 11', 'APPLE', 'Y4W6V4CXXN', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (566, 'IPAD PRO 11', 'APPLE', 'Y9CN4CGQHV', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (567, 'MacBook AIR APPLE M3', 'APPLE', 'K7YP3QTW79', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (568, 'HUB HD4005 HYPER', 'HYPER', 'PV23364803707', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (569, 'HUB HD4005 HYPER', 'HYPER', 'PV23364803712', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (570, 'IMPRESORA BROTHER', 'BROTHER', '27000193', 'nuevo', NULL, 3);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (571, 'IMPRESORA BROTHER', 'BROTHER', '27000203', 'nuevo', NULL, 3);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (572, 'IMPRESORA BROTHER', 'BROTHER', '27000073', 'nuevo', NULL, 3);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (573, 'IMPRESORA BROTHER', 'BROTHER', 'U63885M3N922745', 'nuevo', NULL, 3);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (574, 'IMPRESORA BROTHER', 'BROTHER', 'U63885JN863115', 'nuevo', NULL, 3);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (575, 'MacBook Pro M3', 'APPLE', 'C4T4VYJMG6', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (576, 'GALAXY S9 FE SAMSUNG', 'SAMSUNG', '100312132', 'nuevo', NULL, 7);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (577, 'LENOVO V15', 'LENOVO', 'PF3CVC5J', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (578, 'TECLADO MAGIC MAC', 'APPLE', 'F0T3492RG6HJKP3AP', 'nuevo', NULL, 1);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (579, 'LENOVO X1', 'LENOVO', 'SPF4JR8LE', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (580, 'LENOVO NEO 50A', 'LENOVO', 'MP2A69WZ', 'nuevo', NULL, 2);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (581, 'LENOVO V15', 'LENOVO', 'PF3BSY5C', 'nuevo', NULL, 4);
INSERT INTO public.producto (id_producto, modelo, marca, serie_id, estado, fecha_ingreso, id_tipo_producto) VALUES (582, 'LENOVO V15', 'LENOVO', 'PF3BRFMY', 'nuevo', NULL, 4);


--
-- TOC entry 4978 (class 0 OID 16717)
-- Dependencies: 220
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4994 (class 0 OID 16814)
-- Dependencies: 236
-- Data for Name: registro_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4992 (class 0 OID 16797)
-- Dependencies: 234
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4984 (class 0 OID 16754)
-- Dependencies: 226
-- Data for Name: tipo_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_producto (id_tipo_producto, nombre) VALUES (1, 'ACCESORIO');
INSERT INTO public.tipo_producto (id_tipo_producto, nombre) VALUES (2, 'AIO');
INSERT INTO public.tipo_producto (id_tipo_producto, nombre) VALUES (3, 'IMPRESORA');
INSERT INTO public.tipo_producto (id_tipo_producto, nombre) VALUES (4, 'NOTEBOOK');
INSERT INTO public.tipo_producto (id_tipo_producto, nombre) VALUES (5, 'PANTALLA');
INSERT INTO public.tipo_producto (id_tipo_producto, nombre) VALUES (6, 'UNIDAD DE MEMORIA');
INSERT INTO public.tipo_producto (id_tipo_producto, nombre) VALUES (7, 'TABLET');


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 229
-- Name: bodega_id_bodega_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bodega_id_bodega_seq', 1, false);


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 221
-- Name: cities_id_city_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_city_seq', 1, false);


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 217
-- Name: countries_id_country_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_country_seq', 1, false);


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 243
-- Name: despacho_producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.despacho_producto_id_seq', 534, true);


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 241
-- Name: estado_entrega_id_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estado_entrega_id_estado_seq', 2, true);


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 237
-- Name: ingreso_producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingreso_producto_id_seq', 562, true);


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 231
-- Name: movimiento_tipo_id_tipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movimiento_tipo_id_tipo_seq', 1, false);


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 239
-- Name: persona_destinatario_id_destinatario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persona_destinatario_id_destinatario_seq', 225, true);


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 223
-- Name: persona_id_persona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persona_id_persona_seq', 1, false);


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 227
-- Name: producto_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_id_producto_seq', 582, true);


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 219
-- Name: regions_id_region_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regions_id_region_seq', 1, false);


--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 235
-- Name: registro_producto_id_registro_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.registro_producto_id_registro_producto_seq', 1, false);


--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 233
-- Name: stock_id_stock_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_id_stock_seq', 1, false);


--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 225
-- Name: tipo_producto_id_tipo_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_producto_id_tipo_producto_seq', 7, true);


--
-- TOC entry 4792 (class 2606 OID 16781)
-- Name: bodega bodega_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bodega
    ADD CONSTRAINT bodega_pkey PRIMARY KEY (id_bodega);


--
-- TOC entry 4782 (class 2606 OID 16734)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id_city);


--
-- TOC entry 4778 (class 2606 OID 16715)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id_country);


--
-- TOC entry 4812 (class 2606 OID 16904)
-- Name: despacho_producto despacho_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.despacho_producto
    ADD CONSTRAINT despacho_producto_pkey PRIMARY KEY (id);


--
-- TOC entry 4808 (class 2606 OID 16894)
-- Name: estado_entrega estado_entrega_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_entrega
    ADD CONSTRAINT estado_entrega_nombre_key UNIQUE (nombre);


--
-- TOC entry 4810 (class 2606 OID 16892)
-- Name: estado_entrega estado_entrega_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_entrega
    ADD CONSTRAINT estado_entrega_pkey PRIMARY KEY (id_estado);


--
-- TOC entry 4802 (class 2606 OID 16861)
-- Name: ingreso_producto ingreso_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingreso_producto
    ADD CONSTRAINT ingreso_producto_pkey PRIMARY KEY (id);


--
-- TOC entry 4794 (class 2606 OID 16795)
-- Name: movimiento_tipo movimiento_tipo_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimiento_tipo
    ADD CONSTRAINT movimiento_tipo_nombre_key UNIQUE (nombre);


--
-- TOC entry 4796 (class 2606 OID 16793)
-- Name: movimiento_tipo movimiento_tipo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimiento_tipo
    ADD CONSTRAINT movimiento_tipo_pkey PRIMARY KEY (id_tipo);


--
-- TOC entry 4804 (class 2606 OID 16885)
-- Name: persona_destinatario persona_destinatario_nombre_completo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona_destinatario
    ADD CONSTRAINT persona_destinatario_nombre_completo_key UNIQUE (nombre_completo);


--
-- TOC entry 4806 (class 2606 OID 16883)
-- Name: persona_destinatario persona_destinatario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona_destinatario
    ADD CONSTRAINT persona_destinatario_pkey PRIMARY KEY (id_destinatario);


--
-- TOC entry 4784 (class 2606 OID 16752)
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id_persona);


--
-- TOC entry 4788 (class 2606 OID 16767)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id_producto);


--
-- TOC entry 4790 (class 2606 OID 16769)
-- Name: producto producto_serie_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_serie_id_key UNIQUE (serie_id);


--
-- TOC entry 4780 (class 2606 OID 16722)
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id_region);


--
-- TOC entry 4800 (class 2606 OID 16822)
-- Name: registro_producto registro_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro_producto
    ADD CONSTRAINT registro_producto_pkey PRIMARY KEY (id_registro_producto);


--
-- TOC entry 4798 (class 2606 OID 16802)
-- Name: stock stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (id_stock);


--
-- TOC entry 4786 (class 2606 OID 16759)
-- Name: tipo_producto tipo_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_producto
    ADD CONSTRAINT tipo_producto_pkey PRIMARY KEY (id_tipo_producto);


--
-- TOC entry 4826 (class 2606 OID 16905)
-- Name: despacho_producto despacho_producto_destinatario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.despacho_producto
    ADD CONSTRAINT despacho_producto_destinatario_id_fkey FOREIGN KEY (destinatario_id) REFERENCES public.persona_destinatario(id_destinatario);


--
-- TOC entry 4827 (class 2606 OID 16920)
-- Name: despacho_producto despacho_producto_estado_entrega_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.despacho_producto
    ADD CONSTRAINT despacho_producto_estado_entrega_id_fkey FOREIGN KEY (estado_entrega_id) REFERENCES public.estado_entrega(id_estado);


--
-- TOC entry 4828 (class 2606 OID 16915)
-- Name: despacho_producto despacho_producto_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.despacho_producto
    ADD CONSTRAINT despacho_producto_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.producto(id_producto);


--
-- TOC entry 4829 (class 2606 OID 16910)
-- Name: despacho_producto despacho_producto_tipo_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.despacho_producto
    ADD CONSTRAINT despacho_producto_tipo_producto_id_fkey FOREIGN KEY (tipo_producto_id) REFERENCES public.tipo_producto(id_tipo_producto);


--
-- TOC entry 4817 (class 2606 OID 16782)
-- Name: bodega fk_bodega_encargado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bodega
    ADD CONSTRAINT fk_bodega_encargado FOREIGN KEY (encargado_id) REFERENCES public.persona(id_persona);


--
-- TOC entry 4814 (class 2606 OID 16740)
-- Name: cities fk_city_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT fk_city_country FOREIGN KEY (country_id) REFERENCES public.countries(id_country);


--
-- TOC entry 4815 (class 2606 OID 16735)
-- Name: cities fk_city_region; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT fk_city_region FOREIGN KEY (region_id) REFERENCES public.regions(id_region);


--
-- TOC entry 4816 (class 2606 OID 16770)
-- Name: producto fk_producto_tipo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT fk_producto_tipo FOREIGN KEY (id_tipo_producto) REFERENCES public.tipo_producto(id_tipo_producto);


--
-- TOC entry 4813 (class 2606 OID 16723)
-- Name: regions fk_region_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT fk_region_country FOREIGN KEY (country_id) REFERENCES public.countries(id_country);


--
-- TOC entry 4820 (class 2606 OID 16828)
-- Name: registro_producto fk_registro_bodega; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro_producto
    ADD CONSTRAINT fk_registro_bodega FOREIGN KEY (bodega_origen_id) REFERENCES public.bodega(id_bodega);


--
-- TOC entry 4821 (class 2606 OID 16833)
-- Name: registro_producto fk_registro_despacha; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro_producto
    ADD CONSTRAINT fk_registro_despacha FOREIGN KEY (id_persona_despacha) REFERENCES public.persona(id_persona);


--
-- TOC entry 4822 (class 2606 OID 16848)
-- Name: registro_producto fk_registro_movimiento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro_producto
    ADD CONSTRAINT fk_registro_movimiento FOREIGN KEY (tipo_movimiento_id) REFERENCES public.movimiento_tipo(id_tipo);


--
-- TOC entry 4823 (class 2606 OID 16823)
-- Name: registro_producto fk_registro_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro_producto
    ADD CONSTRAINT fk_registro_producto FOREIGN KEY (producto_id) REFERENCES public.producto(id_producto);


--
-- TOC entry 4824 (class 2606 OID 16838)
-- Name: registro_producto fk_registro_recibe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro_producto
    ADD CONSTRAINT fk_registro_recibe FOREIGN KEY (persona_recibe_id) REFERENCES public.persona(id_persona);


--
-- TOC entry 4825 (class 2606 OID 16843)
-- Name: registro_producto fk_registro_registra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro_producto
    ADD CONSTRAINT fk_registro_registra FOREIGN KEY (usuario_registra_id) REFERENCES public.persona(id_persona);


--
-- TOC entry 4818 (class 2606 OID 16808)
-- Name: stock fk_stock_bodega; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT fk_stock_bodega FOREIGN KEY (id_bodega) REFERENCES public.bodega(id_bodega);


--
-- TOC entry 4819 (class 2606 OID 16803)
-- Name: stock fk_stock_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT fk_stock_producto FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto);


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 5008
-- Name: DATABASE inventario_app; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE inventario_app TO root;


-- Completed on 2025-06-23 01:45:45

--
-- PostgreSQL database dump complete
--

