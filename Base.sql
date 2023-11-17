--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-11-17 02:31:19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 236 (class 1259 OID 16836)
-- Name: Alimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Alimento" (
    "idAlimento" integer NOT NULL,
    nombre character varying(50) NOT NULL,
    proteinas double precision,
    carbohidratos double precision,
    kcal integer,
    grasas double precision,
    "unidadMedida" character varying(50)
);


ALTER TABLE public."Alimento" OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16996)
-- Name: Alimento_idAlimento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Alimento" ALTER COLUMN "idAlimento" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Alimento_idAlimento_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16764)
-- Name: AsesoradosPorAsesor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AsesoradosPorAsesor" (
    "idUsuarioAsesor" integer NOT NULL,
    "idUsuarioAsesorado" integer NOT NULL,
    estatus integer,
    "fechaInicio" date
);


ALTER TABLE public."AsesoradosPorAsesor" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16759)
-- Name: Certificados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Certificados" (
    "idCertificado" integer NOT NULL,
    "idAsesor" integer NOT NULL,
    documento character varying(100)
);


ALTER TABLE public."Certificados" OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16983)
-- Name: Certificados_idCertificado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Certificados" ALTER COLUMN "idCertificado" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Certificados_idCertificado_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 235 (class 1259 OID 16833)
-- Name: ContieneAlimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ContieneAlimento" (
    "idPlatillo" integer NOT NULL,
    "idAlimento" integer NOT NULL,
    cantidad integer NOT NULL,
    porcion double precision NOT NULL
);


ALTER TABLE public."ContieneAlimento" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16810)
-- Name: ContieneEjercicios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ContieneEjercicios" (
    "idRutina" integer NOT NULL,
    "idEjercicio" integer NOT NULL,
    series integer,
    repeticiones integer,
    tiempo integer,
    descanso integer
);


ALTER TABLE public."ContieneEjercicios" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16823)
-- Name: ContienePlatillo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ContienePlatillo" (
    "idPlatillo" integer NOT NULL,
    "idPlanAlimenticio" integer NOT NULL,
    tiempo integer NOT NULL,
    dia date,
    checado boolean
);


ALTER TABLE public."ContienePlatillo" OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16994)
-- Name: ContienePlatillo_idPlatillo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."ContienePlatillo" ALTER COLUMN "idPlatillo" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ContienePlatillo_idPlatillo_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 16802)
-- Name: ContieneRutinas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ContieneRutinas" (
    "idPlanFisico" integer NOT NULL,
    "idRutina" integer NOT NULL
);


ALTER TABLE public."ContieneRutinas" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16781)
-- Name: DatosCorporales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DatosCorporales" (
    "idDatosCorporales" integer NOT NULL,
    "idUsuarioAsesorado" integer NOT NULL,
    peso double precision,
    talla double precision,
    imc double precision,
    "circunferenciaCintura" integer,
    "circunferecnciaCadera" integer,
    icc integer,
    grasa integer,
    "musculoEsqueletico" integer,
    "grasaVisceral" integer,
    "fechaMedicion" date
);


ALTER TABLE public."DatosCorporales" OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16988)
-- Name: DatosCorporales_idDatosCorporales_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."DatosCorporales" ALTER COLUMN "idDatosCorporales" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."DatosCorporales_idDatosCorporales_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 231 (class 1259 OID 16813)
-- Name: Ejercicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ejercicio" (
    "idEjercicio" integer NOT NULL,
    nombre character varying(50) NOT NULL,
    "activacionMuscular" character varying(50),
    tipo integer
);


ALTER TABLE public."Ejercicio" OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 16989)
-- Name: Ejercicio_idEjercicio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Ejercicio" ALTER COLUMN "idEjercicio" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Ejercicio_idEjercicio_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 16749)
-- Name: Estatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Estatus" (
    "idEstatus" integer NOT NULL,
    estatus character varying(30)
);


ALTER TABLE public."Estatus" OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16982)
-- Name: Estatus_idEstatus_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Estatus" ALTER COLUMN "idEstatus" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Estatus_idEstatus_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 16769)
-- Name: InvitacionEnviada; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InvitacionEnviada" (
    "idInvitacion" integer NOT NULL,
    "idUsuarioAsesor" integer NOT NULL,
    "idUsuarioAsesorado" integer NOT NULL,
    estatus integer NOT NULL,
    "fechaEnvio" date
);


ALTER TABLE public."InvitacionEnviada" OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16984)
-- Name: InvitacionEnviada_idInvitacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."InvitacionEnviada" ALTER COLUMN "idInvitacion" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."InvitacionEnviada_idInvitacion_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16786)
-- Name: ObjetivosCorporales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ObjetivosCorporales" (
    "idDatosCorporales" integer NOT NULL,
    "pesoObjetivo" double precision,
    "iccObjetivo" double precision,
    "imcObjetivo" double precision,
    "grasaObjetivo" integer,
    "musculoObjetivo" integer,
    "grasaVisceralObjetivo" integer,
    "fechaLimite" date
);


ALTER TABLE public."ObjetivosCorporales" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16797)
-- Name: PlanAlimenticio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PlanAlimenticio" (
    "idPlanAlimenticio" integer NOT NULL,
    "fechaInicio" date NOT NULL,
    "fechaTermino" date NOT NULL,
    estatus integer NOT NULL
);


ALTER TABLE public."PlanAlimenticio" OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 16993)
-- Name: PlanAlimenticio_idPlanAlimenticio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."PlanAlimenticio" ALTER COLUMN "idPlanAlimenticio" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."PlanAlimenticio_idPlanAlimenticio_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16792)
-- Name: PlanFisico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PlanFisico" (
    "idPlanFisico" integer NOT NULL,
    "fechaInicio" date NOT NULL,
    "fechaTermino" date NOT NULL,
    estatus integer NOT NULL
);


ALTER TABLE public."PlanFisico" OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16992)
-- Name: PlanFisico_idPlanFisico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."PlanFisico" ALTER COLUMN "idPlanFisico" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."PlanFisico_idPlanFisico_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16774)
-- Name: RegistrarDatos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RegistrarDatos" (
    "idRegistro" integer NOT NULL,
    "idUsuarioAsesor" integer NOT NULL,
    "idUsuarioAsesorado" integer NOT NULL
);


ALTER TABLE public."RegistrarDatos" OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16987)
-- Name: RegistrarDatos_idRegistro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."RegistrarDatos" ALTER COLUMN "idRegistro" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."RegistrarDatos_idRegistro_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 16744)
-- Name: Rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Rol" (
    "idRol" integer NOT NULL,
    rol character varying(30)
);


ALTER TABLE public."Rol" OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16985)
-- Name: Rol_idRol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Rol" ALTER COLUMN "idRol" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Rol_idRol_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 229 (class 1259 OID 16805)
-- Name: Rutinas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Rutinas" (
    "idRutina" integer NOT NULL,
    "fechaInicio" date NOT NULL,
    "fechaTermino" date NOT NULL
);


ALTER TABLE public."Rutinas" OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 16991)
-- Name: Rutinas_idRutina_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Rutinas" ALTER COLUMN "idRutina" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Rutinas_idRutina_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 16828)
-- Name: TiempoComida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TiempoComida" (
    "idTiempoComida" integer NOT NULL,
    tiempo character varying(30)
);


ALTER TABLE public."TiempoComida" OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 16995)
-- Name: TiempoComida_idTiempoComida_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."TiempoComida" ALTER COLUMN "idTiempoComida" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."TiempoComida_idTiempoComida_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 16789)
-- Name: TienePlanes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TienePlanes" (
    "idUsuarioAsesorado" integer NOT NULL,
    "idPlanAlimenticio" integer,
    "idPlanFisico" integer,
    "idReporte" integer
);


ALTER TABLE public."TienePlanes" OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16818)
-- Name: TipoEjercicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TipoEjercicio" (
    "idTipoEjercicio" integer NOT NULL,
    tipo character varying(30)
);


ALTER TABLE public."TipoEjercicio" OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16990)
-- Name: TipoEjercicio_idTipoEjercicio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."TipoEjercicio" ALTER COLUMN "idTipoEjercicio" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."TipoEjercicio_idTipoEjercicio_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 16739)
-- Name: Usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuario" (
    "idUsuario" integer NOT NULL,
    nombre character varying(50) NOT NULL,
    "primerApellido" character varying(50) NOT NULL,
    "segundoApellido" character varying(50) NOT NULL,
    "fechaNacimiento" date NOT NULL,
    "correoElectronico" character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    rol integer NOT NULL
);


ALTER TABLE public."Usuario" OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16986)
-- Name: Usuario_idUsuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Usuario" ALTER COLUMN "idUsuario" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Usuario_idUsuario_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 16754)
-- Name: Valida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Valida" (
    "idAdministrador" integer NOT NULL,
    "idAsesor" integer NOT NULL,
    certificado integer,
    estatus integer
);


ALTER TABLE public."Valida" OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 17032)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 17031)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 261 (class 1259 OID 17040)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 17039)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 257 (class 1259 OID 17026)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 17025)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 263 (class 1259 OID 17046)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 17054)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 17053)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 262 (class 1259 OID 17045)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 267 (class 1259 OID 17060)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 17059)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 269 (class 1259 OID 17118)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 17117)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 255 (class 1259 OID 17018)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 17017)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 253 (class 1259 OID 17010)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 17009)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 270 (class 1259 OID 17146)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 5066 (class 0 OID 16836)
-- Dependencies: 236
-- Data for Name: Alimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Alimento" OVERRIDING SYSTEM VALUE VALUES (1, 'Pollo asado', 25, 0, 150, 5, 'g');
INSERT INTO public."Alimento" OVERRIDING SYSTEM VALUE VALUES (2, 'Arroz Integral', 5, 30, 200, 2, 'g');
INSERT INTO public."Alimento" OVERRIDING SYSTEM VALUE VALUES (3, 'Manzana', 1, 15, 80, 0.5, 'unidad');
INSERT INTO public."Alimento" OVERRIDING SYSTEM VALUE VALUES (4, 'Aceite de oliva', 0, 0, 120, 14, 'ml');
INSERT INTO public."Alimento" OVERRIDING SYSTEM VALUE VALUES (5, 'Leche Entera', 8, 12, 90, 0.5, 'ml');


--
-- TOC entry 5050 (class 0 OID 16764)
-- Dependencies: 220
-- Data for Name: AsesoradosPorAsesor; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5049 (class 0 OID 16759)
-- Dependencies: 219
-- Data for Name: Certificados; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5065 (class 0 OID 16833)
-- Dependencies: 235
-- Data for Name: ContieneAlimento; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5060 (class 0 OID 16810)
-- Dependencies: 230
-- Data for Name: ContieneEjercicios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5063 (class 0 OID 16823)
-- Dependencies: 233
-- Data for Name: ContienePlatillo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5058 (class 0 OID 16802)
-- Dependencies: 228
-- Data for Name: ContieneRutinas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5053 (class 0 OID 16781)
-- Dependencies: 223
-- Data for Name: DatosCorporales; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5061 (class 0 OID 16813)
-- Dependencies: 231
-- Data for Name: Ejercicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Ejercicio" OVERRIDING SYSTEM VALUE VALUES (1, 'Correr', 'Piernas', 1);
INSERT INTO public."Ejercicio" OVERRIDING SYSTEM VALUE VALUES (2, 'Sentadillas', 'Piernas', 2);
INSERT INTO public."Ejercicio" OVERRIDING SYSTEM VALUE VALUES (3, 'Flexiones de Brazos', 'Pecho', 2);
INSERT INTO public."Ejercicio" OVERRIDING SYSTEM VALUE VALUES (4, 'Plancha Abdominal', 'Abdomen', 2);
INSERT INTO public."Ejercicio" OVERRIDING SYSTEM VALUE VALUES (5, 'Natacion', 'Cuerpo Completo', 1);
INSERT INTO public."Ejercicio" OVERRIDING SYSTEM VALUE VALUES (6, 'Abdominales', 'Abdomen', 2);


--
-- TOC entry 5047 (class 0 OID 16749)
-- Dependencies: 217
-- Data for Name: Estatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Estatus" OVERRIDING SYSTEM VALUE VALUES (4, 'Cancelado');
INSERT INTO public."Estatus" OVERRIDING SYSTEM VALUE VALUES (1, 'En proceso');
INSERT INTO public."Estatus" OVERRIDING SYSTEM VALUE VALUES (2, 'Completado');
INSERT INTO public."Estatus" OVERRIDING SYSTEM VALUE VALUES (3, 'Pendiente');


--
-- TOC entry 5051 (class 0 OID 16769)
-- Dependencies: 221
-- Data for Name: InvitacionEnviada; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5054 (class 0 OID 16786)
-- Dependencies: 224
-- Data for Name: ObjetivosCorporales; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5057 (class 0 OID 16797)
-- Dependencies: 227
-- Data for Name: PlanAlimenticio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5056 (class 0 OID 16792)
-- Dependencies: 226
-- Data for Name: PlanFisico; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5052 (class 0 OID 16774)
-- Dependencies: 222
-- Data for Name: RegistrarDatos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5046 (class 0 OID 16744)
-- Dependencies: 216
-- Data for Name: Rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Rol" OVERRIDING SYSTEM VALUE VALUES (1, 'Administrador');
INSERT INTO public."Rol" OVERRIDING SYSTEM VALUE VALUES (2, 'Asesor');
INSERT INTO public."Rol" OVERRIDING SYSTEM VALUE VALUES (3, 'Asesorado');


--
-- TOC entry 5059 (class 0 OID 16805)
-- Dependencies: 229
-- Data for Name: Rutinas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5064 (class 0 OID 16828)
-- Dependencies: 234
-- Data for Name: TiempoComida; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."TiempoComida" OVERRIDING SYSTEM VALUE VALUES (1, 'Desayuno');
INSERT INTO public."TiempoComida" OVERRIDING SYSTEM VALUE VALUES (2, 'Colacion 1');
INSERT INTO public."TiempoComida" OVERRIDING SYSTEM VALUE VALUES (3, 'Comida');
INSERT INTO public."TiempoComida" OVERRIDING SYSTEM VALUE VALUES (4, 'Colacion 2');
INSERT INTO public."TiempoComida" OVERRIDING SYSTEM VALUE VALUES (5, 'Cena');


--
-- TOC entry 5055 (class 0 OID 16789)
-- Dependencies: 225
-- Data for Name: TienePlanes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5062 (class 0 OID 16818)
-- Dependencies: 232
-- Data for Name: TipoEjercicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."TipoEjercicio" OVERRIDING SYSTEM VALUE VALUES (1, 'Cardio');
INSERT INTO public."TipoEjercicio" OVERRIDING SYSTEM VALUE VALUES (2, 'Fuerza');
INSERT INTO public."TipoEjercicio" OVERRIDING SYSTEM VALUE VALUES (3, 'Flexibilidad');
INSERT INTO public."TipoEjercicio" OVERRIDING SYSTEM VALUE VALUES (4, 'Equilibrio');


--
-- TOC entry 5045 (class 0 OID 16739)
-- Dependencies: 215
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Usuario" OVERRIDING SYSTEM VALUE VALUES (2, 'Rachel', 'Ruvalcaba', 'Casillas', '1996-02-03', 'email@prueba.com', 'password', 3);
INSERT INTO public."Usuario" OVERRIDING SYSTEM VALUE VALUES (1, 'Jorge', 'Martinez', 'Buenrostro', '1996-05-09', 'correo@prueba.com', 'contraseña', 3);


--
-- TOC entry 5048 (class 0 OID 16754)
-- Dependencies: 218
-- Data for Name: Valida; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5089 (class 0 OID 17032)
-- Dependencies: 259
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5091 (class 0 OID 17040)
-- Dependencies: 261
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5087 (class 0 OID 17026)
-- Dependencies: 257
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_permission VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO public.auth_permission VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO public.auth_permission VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO public.auth_permission VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO public.auth_permission VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO public.auth_permission VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO public.auth_permission VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO public.auth_permission VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO public.auth_permission VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO public.auth_permission VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO public.auth_permission VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO public.auth_permission VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO public.auth_permission VALUES (25, 'Can add rol', 7, 'add_rol');
INSERT INTO public.auth_permission VALUES (26, 'Can change rol', 7, 'change_rol');
INSERT INTO public.auth_permission VALUES (27, 'Can delete rol', 7, 'delete_rol');
INSERT INTO public.auth_permission VALUES (28, 'Can view rol', 7, 'view_rol');
INSERT INTO public.auth_permission VALUES (29, 'Can add usuario', 8, 'add_usuario');
INSERT INTO public.auth_permission VALUES (30, 'Can change usuario', 8, 'change_usuario');
INSERT INTO public.auth_permission VALUES (31, 'Can delete usuario', 8, 'delete_usuario');
INSERT INTO public.auth_permission VALUES (32, 'Can view usuario', 8, 'view_usuario');
INSERT INTO public.auth_permission VALUES (33, 'Can add estatus', 9, 'add_estatus');
INSERT INTO public.auth_permission VALUES (34, 'Can change estatus', 9, 'change_estatus');
INSERT INTO public.auth_permission VALUES (35, 'Can delete estatus', 9, 'delete_estatus');
INSERT INTO public.auth_permission VALUES (36, 'Can view estatus', 9, 'view_estatus');
INSERT INTO public.auth_permission VALUES (37, 'Can add certificados', 10, 'add_certificados');
INSERT INTO public.auth_permission VALUES (38, 'Can change certificados', 10, 'change_certificados');
INSERT INTO public.auth_permission VALUES (39, 'Can delete certificados', 10, 'delete_certificados');
INSERT INTO public.auth_permission VALUES (40, 'Can view certificados', 10, 'view_certificados');
INSERT INTO public.auth_permission VALUES (41, 'Can add prueba', 11, 'add_prueba');
INSERT INTO public.auth_permission VALUES (42, 'Can change prueba', 11, 'change_prueba');
INSERT INTO public.auth_permission VALUES (43, 'Can delete prueba', 11, 'delete_prueba');
INSERT INTO public.auth_permission VALUES (44, 'Can view prueba', 11, 'view_prueba');
INSERT INTO public.auth_permission VALUES (45, 'Can add datos corporales', 12, 'add_datoscorporales');
INSERT INTO public.auth_permission VALUES (46, 'Can change datos corporales', 12, 'change_datoscorporales');
INSERT INTO public.auth_permission VALUES (47, 'Can delete datos corporales', 12, 'delete_datoscorporales');
INSERT INTO public.auth_permission VALUES (48, 'Can view datos corporales', 12, 'view_datoscorporales');
INSERT INTO public.auth_permission VALUES (49, 'Can add valida', 13, 'add_valida');
INSERT INTO public.auth_permission VALUES (50, 'Can change valida', 13, 'change_valida');
INSERT INTO public.auth_permission VALUES (51, 'Can delete valida', 13, 'delete_valida');
INSERT INTO public.auth_permission VALUES (52, 'Can view valida', 13, 'view_valida');
INSERT INTO public.auth_permission VALUES (53, 'Can add invitacion enviada', 14, 'add_invitacionenviada');
INSERT INTO public.auth_permission VALUES (54, 'Can change invitacion enviada', 14, 'change_invitacionenviada');
INSERT INTO public.auth_permission VALUES (55, 'Can delete invitacion enviada', 14, 'delete_invitacionenviada');
INSERT INTO public.auth_permission VALUES (56, 'Can view invitacion enviada', 14, 'view_invitacionenviada');
INSERT INTO public.auth_permission VALUES (57, 'Can add registrar datos', 15, 'add_registrardatos');
INSERT INTO public.auth_permission VALUES (58, 'Can change registrar datos', 15, 'change_registrardatos');
INSERT INTO public.auth_permission VALUES (59, 'Can delete registrar datos', 15, 'delete_registrardatos');
INSERT INTO public.auth_permission VALUES (60, 'Can view registrar datos', 15, 'view_registrardatos');
INSERT INTO public.auth_permission VALUES (61, 'Can add asesorados por asesor', 16, 'add_asesoradosporasesor');
INSERT INTO public.auth_permission VALUES (62, 'Can change asesorados por asesor', 16, 'change_asesoradosporasesor');
INSERT INTO public.auth_permission VALUES (63, 'Can delete asesorados por asesor', 16, 'delete_asesoradosporasesor');
INSERT INTO public.auth_permission VALUES (64, 'Can view asesorados por asesor', 16, 'view_asesoradosporasesor');
INSERT INTO public.auth_permission VALUES (65, 'Can add plan fisico', 17, 'add_planfisico');
INSERT INTO public.auth_permission VALUES (66, 'Can change plan fisico', 17, 'change_planfisico');
INSERT INTO public.auth_permission VALUES (67, 'Can delete plan fisico', 17, 'delete_planfisico');
INSERT INTO public.auth_permission VALUES (68, 'Can view plan fisico', 17, 'view_planfisico');
INSERT INTO public.auth_permission VALUES (69, 'Can add tiene planes', 18, 'add_tieneplanes');
INSERT INTO public.auth_permission VALUES (70, 'Can change tiene planes', 18, 'change_tieneplanes');
INSERT INTO public.auth_permission VALUES (71, 'Can delete tiene planes', 18, 'delete_tieneplanes');
INSERT INTO public.auth_permission VALUES (72, 'Can view tiene planes', 18, 'view_tieneplanes');
INSERT INTO public.auth_permission VALUES (73, 'Can add plan alimenticio', 19, 'add_planalimenticio');
INSERT INTO public.auth_permission VALUES (74, 'Can change plan alimenticio', 19, 'change_planalimenticio');
INSERT INTO public.auth_permission VALUES (75, 'Can delete plan alimenticio', 19, 'delete_planalimenticio');
INSERT INTO public.auth_permission VALUES (76, 'Can view plan alimenticio', 19, 'view_planalimenticio');
INSERT INTO public.auth_permission VALUES (77, 'Can add alimento', 20, 'add_alimento');
INSERT INTO public.auth_permission VALUES (78, 'Can change alimento', 20, 'change_alimento');
INSERT INTO public.auth_permission VALUES (79, 'Can delete alimento', 20, 'delete_alimento');
INSERT INTO public.auth_permission VALUES (80, 'Can view alimento', 20, 'view_alimento');
INSERT INTO public.auth_permission VALUES (81, 'Can add auth group', 21, 'add_authgroup');
INSERT INTO public.auth_permission VALUES (82, 'Can change auth group', 21, 'change_authgroup');
INSERT INTO public.auth_permission VALUES (83, 'Can delete auth group', 21, 'delete_authgroup');
INSERT INTO public.auth_permission VALUES (84, 'Can view auth group', 21, 'view_authgroup');
INSERT INTO public.auth_permission VALUES (85, 'Can add auth group permissions', 22, 'add_authgrouppermissions');
INSERT INTO public.auth_permission VALUES (86, 'Can change auth group permissions', 22, 'change_authgrouppermissions');
INSERT INTO public.auth_permission VALUES (87, 'Can delete auth group permissions', 22, 'delete_authgrouppermissions');
INSERT INTO public.auth_permission VALUES (88, 'Can view auth group permissions', 22, 'view_authgrouppermissions');
INSERT INTO public.auth_permission VALUES (89, 'Can add auth permission', 23, 'add_authpermission');
INSERT INTO public.auth_permission VALUES (90, 'Can change auth permission', 23, 'change_authpermission');
INSERT INTO public.auth_permission VALUES (91, 'Can delete auth permission', 23, 'delete_authpermission');
INSERT INTO public.auth_permission VALUES (92, 'Can view auth permission', 23, 'view_authpermission');
INSERT INTO public.auth_permission VALUES (93, 'Can add auth user', 24, 'add_authuser');
INSERT INTO public.auth_permission VALUES (94, 'Can change auth user', 24, 'change_authuser');
INSERT INTO public.auth_permission VALUES (95, 'Can delete auth user', 24, 'delete_authuser');
INSERT INTO public.auth_permission VALUES (96, 'Can view auth user', 24, 'view_authuser');
INSERT INTO public.auth_permission VALUES (97, 'Can add auth user groups', 25, 'add_authusergroups');
INSERT INTO public.auth_permission VALUES (98, 'Can change auth user groups', 25, 'change_authusergroups');
INSERT INTO public.auth_permission VALUES (99, 'Can delete auth user groups', 25, 'delete_authusergroups');
INSERT INTO public.auth_permission VALUES (100, 'Can view auth user groups', 25, 'view_authusergroups');
INSERT INTO public.auth_permission VALUES (101, 'Can add auth user user permissions', 26, 'add_authuseruserpermissions');
INSERT INTO public.auth_permission VALUES (102, 'Can change auth user user permissions', 26, 'change_authuseruserpermissions');
INSERT INTO public.auth_permission VALUES (103, 'Can delete auth user user permissions', 26, 'delete_authuseruserpermissions');
INSERT INTO public.auth_permission VALUES (104, 'Can view auth user user permissions', 26, 'view_authuseruserpermissions');
INSERT INTO public.auth_permission VALUES (105, 'Can add contienealimento', 27, 'add_contienealimento');
INSERT INTO public.auth_permission VALUES (106, 'Can change contienealimento', 27, 'change_contienealimento');
INSERT INTO public.auth_permission VALUES (107, 'Can delete contienealimento', 27, 'delete_contienealimento');
INSERT INTO public.auth_permission VALUES (108, 'Can view contienealimento', 27, 'view_contienealimento');
INSERT INTO public.auth_permission VALUES (109, 'Can add contieneejercicios', 28, 'add_contieneejercicios');
INSERT INTO public.auth_permission VALUES (110, 'Can change contieneejercicios', 28, 'change_contieneejercicios');
INSERT INTO public.auth_permission VALUES (111, 'Can delete contieneejercicios', 28, 'delete_contieneejercicios');
INSERT INTO public.auth_permission VALUES (112, 'Can view contieneejercicios', 28, 'view_contieneejercicios');
INSERT INTO public.auth_permission VALUES (113, 'Can add contieneplatillo', 29, 'add_contieneplatillo');
INSERT INTO public.auth_permission VALUES (114, 'Can change contieneplatillo', 29, 'change_contieneplatillo');
INSERT INTO public.auth_permission VALUES (115, 'Can delete contieneplatillo', 29, 'delete_contieneplatillo');
INSERT INTO public.auth_permission VALUES (116, 'Can view contieneplatillo', 29, 'view_contieneplatillo');
INSERT INTO public.auth_permission VALUES (117, 'Can add contienerutinas', 30, 'add_contienerutinas');
INSERT INTO public.auth_permission VALUES (118, 'Can change contienerutinas', 30, 'change_contienerutinas');
INSERT INTO public.auth_permission VALUES (119, 'Can delete contienerutinas', 30, 'delete_contienerutinas');
INSERT INTO public.auth_permission VALUES (120, 'Can view contienerutinas', 30, 'view_contienerutinas');
INSERT INTO public.auth_permission VALUES (121, 'Can add django admin log', 31, 'add_djangoadminlog');
INSERT INTO public.auth_permission VALUES (122, 'Can change django admin log', 31, 'change_djangoadminlog');
INSERT INTO public.auth_permission VALUES (123, 'Can delete django admin log', 31, 'delete_djangoadminlog');
INSERT INTO public.auth_permission VALUES (124, 'Can view django admin log', 31, 'view_djangoadminlog');
INSERT INTO public.auth_permission VALUES (125, 'Can add django content type', 32, 'add_djangocontenttype');
INSERT INTO public.auth_permission VALUES (126, 'Can change django content type', 32, 'change_djangocontenttype');
INSERT INTO public.auth_permission VALUES (127, 'Can delete django content type', 32, 'delete_djangocontenttype');
INSERT INTO public.auth_permission VALUES (128, 'Can view django content type', 32, 'view_djangocontenttype');
INSERT INTO public.auth_permission VALUES (129, 'Can add django migrations', 33, 'add_djangomigrations');
INSERT INTO public.auth_permission VALUES (130, 'Can change django migrations', 33, 'change_djangomigrations');
INSERT INTO public.auth_permission VALUES (131, 'Can delete django migrations', 33, 'delete_djangomigrations');
INSERT INTO public.auth_permission VALUES (132, 'Can view django migrations', 33, 'view_djangomigrations');
INSERT INTO public.auth_permission VALUES (133, 'Can add django session', 34, 'add_djangosession');
INSERT INTO public.auth_permission VALUES (134, 'Can change django session', 34, 'change_djangosession');
INSERT INTO public.auth_permission VALUES (135, 'Can delete django session', 34, 'delete_djangosession');
INSERT INTO public.auth_permission VALUES (136, 'Can view django session', 34, 'view_djangosession');
INSERT INTO public.auth_permission VALUES (137, 'Can add ejercicio', 35, 'add_ejercicio');
INSERT INTO public.auth_permission VALUES (138, 'Can change ejercicio', 35, 'change_ejercicio');
INSERT INTO public.auth_permission VALUES (139, 'Can delete ejercicio', 35, 'delete_ejercicio');
INSERT INTO public.auth_permission VALUES (140, 'Can view ejercicio', 35, 'view_ejercicio');
INSERT INTO public.auth_permission VALUES (141, 'Can add objetivoscorporales', 36, 'add_objetivoscorporales');
INSERT INTO public.auth_permission VALUES (142, 'Can change objetivoscorporales', 36, 'change_objetivoscorporales');
INSERT INTO public.auth_permission VALUES (143, 'Can delete objetivoscorporales', 36, 'delete_objetivoscorporales');
INSERT INTO public.auth_permission VALUES (144, 'Can view objetivoscorporales', 36, 'view_objetivoscorporales');
INSERT INTO public.auth_permission VALUES (145, 'Can add rutinas', 37, 'add_rutinas');
INSERT INTO public.auth_permission VALUES (146, 'Can change rutinas', 37, 'change_rutinas');
INSERT INTO public.auth_permission VALUES (147, 'Can delete rutinas', 37, 'delete_rutinas');
INSERT INTO public.auth_permission VALUES (148, 'Can view rutinas', 37, 'view_rutinas');
INSERT INTO public.auth_permission VALUES (149, 'Can add tiempocomida', 38, 'add_tiempocomida');
INSERT INTO public.auth_permission VALUES (150, 'Can change tiempocomida', 38, 'change_tiempocomida');
INSERT INTO public.auth_permission VALUES (151, 'Can delete tiempocomida', 38, 'delete_tiempocomida');
INSERT INTO public.auth_permission VALUES (152, 'Can view tiempocomida', 38, 'view_tiempocomida');
INSERT INTO public.auth_permission VALUES (153, 'Can add tipoejercicio', 39, 'add_tipoejercicio');
INSERT INTO public.auth_permission VALUES (154, 'Can change tipoejercicio', 39, 'change_tipoejercicio');
INSERT INTO public.auth_permission VALUES (155, 'Can delete tipoejercicio', 39, 'delete_tipoejercicio');
INSERT INTO public.auth_permission VALUES (156, 'Can view tipoejercicio', 39, 'view_tipoejercicio');


--
-- TOC entry 5093 (class 0 OID 17046)
-- Dependencies: 263
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5095 (class 0 OID 17054)
-- Dependencies: 265
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5097 (class 0 OID 17060)
-- Dependencies: 267
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5099 (class 0 OID 17118)
-- Dependencies: 269
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5085 (class 0 OID 17018)
-- Dependencies: 255
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_content_type VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type VALUES (4, 'auth', 'user');
INSERT INTO public.django_content_type VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type VALUES (6, 'sessions', 'session');
INSERT INTO public.django_content_type VALUES (7, 'aplicacion', 'rol');
INSERT INTO public.django_content_type VALUES (8, 'aplicacion', 'usuario');
INSERT INTO public.django_content_type VALUES (9, 'aplicacion', 'estatus');
INSERT INTO public.django_content_type VALUES (10, 'aplicacion', 'certificados');
INSERT INTO public.django_content_type VALUES (11, 'aplicacion', 'prueba');
INSERT INTO public.django_content_type VALUES (12, 'aplicacion', 'datoscorporales');
INSERT INTO public.django_content_type VALUES (13, 'aplicacion', 'valida');
INSERT INTO public.django_content_type VALUES (14, 'aplicacion', 'invitacionenviada');
INSERT INTO public.django_content_type VALUES (15, 'aplicacion', 'registrardatos');
INSERT INTO public.django_content_type VALUES (16, 'aplicacion', 'asesoradosporasesor');
INSERT INTO public.django_content_type VALUES (17, 'aplicacion', 'planfisico');
INSERT INTO public.django_content_type VALUES (18, 'aplicacion', 'tieneplanes');
INSERT INTO public.django_content_type VALUES (19, 'aplicacion', 'planalimenticio');
INSERT INTO public.django_content_type VALUES (20, 'aplicacion', 'alimento');
INSERT INTO public.django_content_type VALUES (21, 'aplicacion', 'authgroup');
INSERT INTO public.django_content_type VALUES (22, 'aplicacion', 'authgrouppermissions');
INSERT INTO public.django_content_type VALUES (23, 'aplicacion', 'authpermission');
INSERT INTO public.django_content_type VALUES (24, 'aplicacion', 'authuser');
INSERT INTO public.django_content_type VALUES (25, 'aplicacion', 'authusergroups');
INSERT INTO public.django_content_type VALUES (26, 'aplicacion', 'authuseruserpermissions');
INSERT INTO public.django_content_type VALUES (27, 'aplicacion', 'contienealimento');
INSERT INTO public.django_content_type VALUES (28, 'aplicacion', 'contieneejercicios');
INSERT INTO public.django_content_type VALUES (29, 'aplicacion', 'contieneplatillo');
INSERT INTO public.django_content_type VALUES (30, 'aplicacion', 'contienerutinas');
INSERT INTO public.django_content_type VALUES (31, 'aplicacion', 'djangoadminlog');
INSERT INTO public.django_content_type VALUES (32, 'aplicacion', 'djangocontenttype');
INSERT INTO public.django_content_type VALUES (33, 'aplicacion', 'djangomigrations');
INSERT INTO public.django_content_type VALUES (34, 'aplicacion', 'djangosession');
INSERT INTO public.django_content_type VALUES (35, 'aplicacion', 'ejercicio');
INSERT INTO public.django_content_type VALUES (36, 'aplicacion', 'objetivoscorporales');
INSERT INTO public.django_content_type VALUES (37, 'aplicacion', 'rutinas');
INSERT INTO public.django_content_type VALUES (38, 'aplicacion', 'tiempocomida');
INSERT INTO public.django_content_type VALUES (39, 'aplicacion', 'tipoejercicio');


--
-- TOC entry 5083 (class 0 OID 17010)
-- Dependencies: 253
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_migrations VALUES (1, 'contenttypes', '0001_initial', '2023-11-16 18:06:15.894514-06');
INSERT INTO public.django_migrations VALUES (2, 'auth', '0001_initial', '2023-11-16 18:06:16.637659-06');
INSERT INTO public.django_migrations VALUES (3, 'admin', '0001_initial', '2023-11-16 18:06:16.787486-06');
INSERT INTO public.django_migrations VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2023-11-16 18:06:16.794487-06');
INSERT INTO public.django_migrations VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-16 18:06:16.800488-06');
INSERT INTO public.django_migrations VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2023-11-16 18:06:16.81349-06');
INSERT INTO public.django_migrations VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2023-11-16 18:06:16.820493-06');
INSERT INTO public.django_migrations VALUES (8, 'auth', '0003_alter_user_email_max_length', '2023-11-16 18:06:16.826494-06');
INSERT INTO public.django_migrations VALUES (9, 'auth', '0004_alter_user_username_opts', '2023-11-16 18:06:16.832495-06');
INSERT INTO public.django_migrations VALUES (10, 'auth', '0005_alter_user_last_login_null', '2023-11-16 18:06:16.839497-06');
INSERT INTO public.django_migrations VALUES (11, 'auth', '0006_require_contenttypes_0002', '2023-11-16 18:06:16.841498-06');
INSERT INTO public.django_migrations VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2023-11-16 18:06:16.847499-06');
INSERT INTO public.django_migrations VALUES (13, 'auth', '0008_alter_user_username_max_length', '2023-11-16 18:06:16.888515-06');
INSERT INTO public.django_migrations VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2023-11-16 18:06:16.894516-06');
INSERT INTO public.django_migrations VALUES (15, 'auth', '0010_alter_group_name_max_length', '2023-11-16 18:06:16.902518-06');
INSERT INTO public.django_migrations VALUES (16, 'auth', '0011_update_proxy_permissions', '2023-11-16 18:06:16.907519-06');
INSERT INTO public.django_migrations VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2023-11-16 18:06:16.91352-06');
INSERT INTO public.django_migrations VALUES (18, 'sessions', '0001_initial', '2023-11-16 18:06:17.033709-06');
INSERT INTO public.django_migrations VALUES (19, 'aplicacion', '0001_initial', '2023-11-16 18:56:29.386058-06');
INSERT INTO public.django_migrations VALUES (20, 'aplicacion', '0002_estatus_certificados', '2023-11-16 18:56:29.48308-06');
INSERT INTO public.django_migrations VALUES (21, 'aplicacion', '0003_prueba_rename_idcertificados_certificados_id_and_more', '2023-11-16 18:56:29.541778-06');
INSERT INTO public.django_migrations VALUES (22, 'aplicacion', '0004_asesoradosporasesor_datoscorporales_and_more', '2023-11-16 19:26:24.357197-06');
INSERT INTO public.django_migrations VALUES (23, 'aplicacion', '0005_planalimenticio_planfisico_tieneplanes_delete_prueba', '2023-11-16 19:34:16.203603-06');
INSERT INTO public.django_migrations VALUES (24, 'aplicacion', '0006_alimento_authgroup_authgrouppermissions_and_more', '2023-11-16 21:19:20.481589-06');


--
-- TOC entry 5100 (class 0 OID 17146)
-- Dependencies: 270
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 251
-- Name: Alimento_idAlimento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Alimento_idAlimento_seq"', 5, true);


--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 238
-- Name: Certificados_idCertificado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Certificados_idCertificado_seq"', 1, false);


--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 249
-- Name: ContienePlatillo_idPlatillo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ContienePlatillo_idPlatillo_seq"', 1, false);


--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 243
-- Name: DatosCorporales_idDatosCorporales_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DatosCorporales_idDatosCorporales_seq"', 1, false);


--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 244
-- Name: Ejercicio_idEjercicio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ejercicio_idEjercicio_seq"', 6, true);


--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 237
-- Name: Estatus_idEstatus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Estatus_idEstatus_seq"', 4, true);


--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 239
-- Name: InvitacionEnviada_idInvitacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."InvitacionEnviada_idInvitacion_seq"', 1, false);


--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 248
-- Name: PlanAlimenticio_idPlanAlimenticio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PlanAlimenticio_idPlanAlimenticio_seq"', 1, false);


--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 247
-- Name: PlanFisico_idPlanFisico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PlanFisico_idPlanFisico_seq"', 1, false);


--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 242
-- Name: RegistrarDatos_idRegistro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RegistrarDatos_idRegistro_seq"', 1, false);


--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 240
-- Name: Rol_idRol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Rol_idRol_seq"', 3, true);


--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 246
-- Name: Rutinas_idRutina_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Rutinas_idRutina_seq"', 1, false);


--
-- TOC entry 5118 (class 0 OID 0)
-- Dependencies: 250
-- Name: TiempoComida_idTiempoComida_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."TiempoComida_idTiempoComida_seq"', 5, true);


--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 245
-- Name: TipoEjercicio_idTipoEjercicio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."TipoEjercicio_idTipoEjercicio_seq"', 4, true);


--
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 241
-- Name: Usuario_idUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Usuario_idUsuario_seq"', 8, true);


--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 258
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 260
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 256
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 156, true);


--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 264
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 262
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 266
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 268
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 254
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 39, true);


--
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 252
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- TOC entry 4817 (class 2606 OID 16840)
-- Name: Alimento Alimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Alimento"
    ADD CONSTRAINT "Alimento_pkey" PRIMARY KEY ("idAlimento");


--
-- TOC entry 4793 (class 2606 OID 16768)
-- Name: AsesoradosPorAsesor AsesoradosPorAsesor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AsesoradosPorAsesor"
    ADD CONSTRAINT "AsesoradosPorAsesor_pkey" PRIMARY KEY ("idUsuarioAsesorado");


--
-- TOC entry 4791 (class 2606 OID 16763)
-- Name: Certificados Certificados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Certificados"
    ADD CONSTRAINT "Certificados_pkey" PRIMARY KEY ("idCertificado");


--
-- TOC entry 4813 (class 2606 OID 16827)
-- Name: ContienePlatillo ContienePlatillo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContienePlatillo"
    ADD CONSTRAINT "ContienePlatillo_pkey" PRIMARY KEY ("idPlatillo");


--
-- TOC entry 4801 (class 2606 OID 16785)
-- Name: DatosCorporales DatosCorporales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DatosCorporales"
    ADD CONSTRAINT "DatosCorporales_pkey" PRIMARY KEY ("idDatosCorporales");


--
-- TOC entry 4809 (class 2606 OID 16817)
-- Name: Ejercicio Ejercicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ejercicio"
    ADD CONSTRAINT "Ejercicio_pkey" PRIMARY KEY ("idEjercicio");


--
-- TOC entry 4787 (class 2606 OID 16753)
-- Name: Estatus Estatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Estatus"
    ADD CONSTRAINT "Estatus_pkey" PRIMARY KEY ("idEstatus");


--
-- TOC entry 4795 (class 2606 OID 16773)
-- Name: InvitacionEnviada InvitacionEnviada_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InvitacionEnviada"
    ADD CONSTRAINT "InvitacionEnviada_pkey" PRIMARY KEY ("idInvitacion");


--
-- TOC entry 4805 (class 2606 OID 16801)
-- Name: PlanAlimenticio PlanAlimenticio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PlanAlimenticio"
    ADD CONSTRAINT "PlanAlimenticio_pkey" PRIMARY KEY ("idPlanAlimenticio");


--
-- TOC entry 4803 (class 2606 OID 16796)
-- Name: PlanFisico PlanFisico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PlanFisico"
    ADD CONSTRAINT "PlanFisico_pkey" PRIMARY KEY ("idPlanFisico");


--
-- TOC entry 4797 (class 2606 OID 16778)
-- Name: RegistrarDatos RegistrarDatos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RegistrarDatos"
    ADD CONSTRAINT "RegistrarDatos_pkey" PRIMARY KEY ("idRegistro");


--
-- TOC entry 4785 (class 2606 OID 16748)
-- Name: Rol Rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol"
    ADD CONSTRAINT "Rol_pkey" PRIMARY KEY ("idRol");


--
-- TOC entry 4807 (class 2606 OID 16809)
-- Name: Rutinas Rutinas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rutinas"
    ADD CONSTRAINT "Rutinas_pkey" PRIMARY KEY ("idRutina");


--
-- TOC entry 4815 (class 2606 OID 16832)
-- Name: TiempoComida TiempoComida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TiempoComida"
    ADD CONSTRAINT "TiempoComida_pkey" PRIMARY KEY ("idTiempoComida");


--
-- TOC entry 4811 (class 2606 OID 16822)
-- Name: TipoEjercicio TipoEjercicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TipoEjercicio"
    ADD CONSTRAINT "TipoEjercicio_pkey" PRIMARY KEY ("idTipoEjercicio");


--
-- TOC entry 4783 (class 2606 OID 16743)
-- Name: Usuario Usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("idUsuario");


--
-- TOC entry 4789 (class 2606 OID 16758)
-- Name: Valida Valida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Valida"
    ADD CONSTRAINT "Valida_pkey" PRIMARY KEY ("idAdministrador", "idAsesor");


--
-- TOC entry 4831 (class 2606 OID 17144)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 4836 (class 2606 OID 17075)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 4839 (class 2606 OID 17044)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4833 (class 2606 OID 17036)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 4826 (class 2606 OID 17066)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 4828 (class 2606 OID 17030)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 4847 (class 2606 OID 17058)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4850 (class 2606 OID 17090)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 4841 (class 2606 OID 17050)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 4853 (class 2606 OID 17064)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4856 (class 2606 OID 17104)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 4844 (class 2606 OID 17139)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 4859 (class 2606 OID 17125)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 4821 (class 2606 OID 17024)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 4823 (class 2606 OID 17022)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4819 (class 2606 OID 17016)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4863 (class 2606 OID 17152)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 4799 (class 2606 OID 16780)
-- Name: RegistrarDatos idUsuarioAsesorado_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RegistrarDatos"
    ADD CONSTRAINT "idUsuarioAsesorado_unique" UNIQUE ("idUsuarioAsesorado");


--
-- TOC entry 4829 (class 1259 OID 17145)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 4834 (class 1259 OID 17086)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 4837 (class 1259 OID 17087)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 4824 (class 1259 OID 17072)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 4845 (class 1259 OID 17102)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 4848 (class 1259 OID 17101)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 4851 (class 1259 OID 17116)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 4854 (class 1259 OID 17115)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 4842 (class 1259 OID 17140)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 4857 (class 1259 OID 17136)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 4860 (class 1259 OID 17137)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 4861 (class 1259 OID 17154)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 4864 (class 1259 OID 17153)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 4865 (class 2606 OID 16841)
-- Name: Usuario Usuario_rol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_rol_fkey" FOREIGN KEY (rol) REFERENCES public."Rol"("idRol") NOT VALID;


--
-- TOC entry 4894 (class 2606 OID 17081)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4895 (class 2606 OID 17076)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4893 (class 2606 OID 17067)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4896 (class 2606 OID 17096)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4897 (class 2606 OID 17091)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4898 (class 2606 OID 17110)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4899 (class 2606 OID 17105)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4900 (class 2606 OID 17126)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4901 (class 2606 OID 17131)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4866 (class 2606 OID 16861)
-- Name: Valida fk_admin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Valida"
    ADD CONSTRAINT fk_admin FOREIGN KEY ("idAdministrador") REFERENCES public."Usuario"("idUsuario") NOT VALID;


--
-- TOC entry 4891 (class 2606 OID 16971)
-- Name: ContieneAlimento fk_alimento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContieneAlimento"
    ADD CONSTRAINT fk_alimento FOREIGN KEY ("idAlimento") REFERENCES public."Alimento"("idAlimento") NOT VALID;


--
-- TOC entry 4867 (class 2606 OID 16856)
-- Name: Valida fk_asesor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Valida"
    ADD CONSTRAINT fk_asesor FOREIGN KEY ("idAsesor") REFERENCES public."Usuario"("idUsuario") NOT VALID;


--
-- TOC entry 4870 (class 2606 OID 16866)
-- Name: Certificados fk_asesor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Certificados"
    ADD CONSTRAINT fk_asesor FOREIGN KEY ("idAsesor") REFERENCES public."Usuario"("idUsuario") NOT VALID;


--
-- TOC entry 4871 (class 2606 OID 16871)
-- Name: AsesoradosPorAsesor fk_asesor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AsesoradosPorAsesor"
    ADD CONSTRAINT fk_asesor FOREIGN KEY ("idUsuarioAsesor") REFERENCES public."Usuario"("idUsuario") NOT VALID;


--
-- TOC entry 4873 (class 2606 OID 16886)
-- Name: InvitacionEnviada fk_asesor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InvitacionEnviada"
    ADD CONSTRAINT fk_asesor FOREIGN KEY ("idUsuarioAsesor") REFERENCES public."Usuario"("idUsuario") NOT VALID;


--
-- TOC entry 4874 (class 2606 OID 16891)
-- Name: InvitacionEnviada fk_asesorado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InvitacionEnviada"
    ADD CONSTRAINT fk_asesorado FOREIGN KEY ("idUsuarioAsesorado") REFERENCES public."Usuario"("idUsuario") NOT VALID;


--
-- TOC entry 4876 (class 2606 OID 16896)
-- Name: RegistrarDatos fk_asesorado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RegistrarDatos"
    ADD CONSTRAINT fk_asesorado FOREIGN KEY ("idUsuarioAsesorado") REFERENCES public."AsesoradosPorAsesor"("idUsuarioAsesorado") NOT VALID;


--
-- TOC entry 4877 (class 2606 OID 16901)
-- Name: DatosCorporales fk_asesorado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DatosCorporales"
    ADD CONSTRAINT fk_asesorado FOREIGN KEY ("idUsuarioAsesorado") REFERENCES public."RegistrarDatos"("idUsuarioAsesorado") NOT VALID;


--
-- TOC entry 4879 (class 2606 OID 16911)
-- Name: TienePlanes fk_asesorado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TienePlanes"
    ADD CONSTRAINT fk_asesorado FOREIGN KEY ("idUsuarioAsesorado") REFERENCES public."Usuario"("idUsuario") NOT VALID;


--
-- TOC entry 4868 (class 2606 OID 16846)
-- Name: Valida fk_certificados; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Valida"
    ADD CONSTRAINT fk_certificados FOREIGN KEY (certificado) REFERENCES public."Certificados"("idCertificado") NOT VALID;


--
-- TOC entry 4878 (class 2606 OID 16906)
-- Name: ObjetivosCorporales fk_datos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ObjetivosCorporales"
    ADD CONSTRAINT fk_datos FOREIGN KEY ("idDatosCorporales") REFERENCES public."DatosCorporales"("idDatosCorporales") NOT VALID;


--
-- TOC entry 4886 (class 2606 OID 16951)
-- Name: ContieneEjercicios fk_ejercicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContieneEjercicios"
    ADD CONSTRAINT fk_ejercicio FOREIGN KEY ("idEjercicio") REFERENCES public."Ejercicio"("idEjercicio") NOT VALID;


--
-- TOC entry 4869 (class 2606 OID 16851)
-- Name: Valida fk_estatus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Valida"
    ADD CONSTRAINT fk_estatus FOREIGN KEY (estatus) REFERENCES public."Estatus"("idEstatus") NOT VALID;


--
-- TOC entry 4872 (class 2606 OID 16876)
-- Name: AsesoradosPorAsesor fk_estatus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AsesoradosPorAsesor"
    ADD CONSTRAINT fk_estatus FOREIGN KEY (estatus) REFERENCES public."Estatus"("idEstatus") NOT VALID;


--
-- TOC entry 4875 (class 2606 OID 16881)
-- Name: InvitacionEnviada fk_estatus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InvitacionEnviada"
    ADD CONSTRAINT fk_estatus FOREIGN KEY (estatus) REFERENCES public."Estatus"("idEstatus") NOT VALID;


--
-- TOC entry 4882 (class 2606 OID 16926)
-- Name: PlanFisico fk_estatus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PlanFisico"
    ADD CONSTRAINT fk_estatus FOREIGN KEY (estatus) REFERENCES public."Estatus"("idEstatus") NOT VALID;


--
-- TOC entry 4883 (class 2606 OID 16931)
-- Name: PlanAlimenticio fk_estatus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PlanAlimenticio"
    ADD CONSTRAINT fk_estatus FOREIGN KEY (estatus) REFERENCES public."Estatus"("idEstatus") NOT VALID;


--
-- TOC entry 4884 (class 2606 OID 16941)
-- Name: ContieneRutinas fk_plan; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContieneRutinas"
    ADD CONSTRAINT fk_plan FOREIGN KEY ("idPlanFisico") REFERENCES public."PlanFisico"("idPlanFisico") NOT VALID;


--
-- TOC entry 4889 (class 2606 OID 16961)
-- Name: ContienePlatillo fk_planAlimenticio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContienePlatillo"
    ADD CONSTRAINT "fk_planAlimenticio" FOREIGN KEY ("idPlanAlimenticio") REFERENCES public."PlanAlimenticio"("idPlanAlimenticio") NOT VALID;


--
-- TOC entry 4880 (class 2606 OID 16916)
-- Name: TienePlanes fk_planalimenticio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TienePlanes"
    ADD CONSTRAINT fk_planalimenticio FOREIGN KEY ("idPlanAlimenticio") REFERENCES public."PlanAlimenticio"("idPlanAlimenticio") NOT VALID;


--
-- TOC entry 4881 (class 2606 OID 16921)
-- Name: TienePlanes fk_planfisico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TienePlanes"
    ADD CONSTRAINT fk_planfisico FOREIGN KEY ("idPlanFisico") REFERENCES public."PlanFisico"("idPlanFisico") NOT VALID;


--
-- TOC entry 4892 (class 2606 OID 16976)
-- Name: ContieneAlimento fk_platillo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContieneAlimento"
    ADD CONSTRAINT fk_platillo FOREIGN KEY ("idPlatillo") REFERENCES public."ContienePlatillo"("idPlatillo") NOT VALID;


--
-- TOC entry 4887 (class 2606 OID 16946)
-- Name: ContieneEjercicios fk_rutina; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContieneEjercicios"
    ADD CONSTRAINT fk_rutina FOREIGN KEY ("idRutina") REFERENCES public."Rutinas"("idRutina") NOT VALID;


--
-- TOC entry 4885 (class 2606 OID 16936)
-- Name: ContieneRutinas fk_rutinas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContieneRutinas"
    ADD CONSTRAINT fk_rutinas FOREIGN KEY ("idRutina") REFERENCES public."Rutinas"("idRutina") NOT VALID;


--
-- TOC entry 4890 (class 2606 OID 16966)
-- Name: ContienePlatillo fk_tiempo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContienePlatillo"
    ADD CONSTRAINT fk_tiempo FOREIGN KEY (tiempo) REFERENCES public."TiempoComida"("idTiempoComida") NOT VALID;


--
-- TOC entry 4888 (class 2606 OID 16956)
-- Name: Ejercicio fk_tipo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ejercicio"
    ADD CONSTRAINT fk_tipo FOREIGN KEY (tipo) REFERENCES public."TipoEjercicio"("idTipoEjercicio") NOT VALID;


-- Completed on 2023-11-17 02:31:19

--
-- PostgreSQL database dump complete
--

