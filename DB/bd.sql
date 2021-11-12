------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.usuario
(
    id_usuario integer NOT NULL DEFAULT nextval('usuario_id_usuario_seq'::regclass),
    id_rol integer NOT NULL,
    nombre character varying(30) COLLATE pg_catalog."default" NOT NULL,
    apellido character varying(30) COLLATE pg_catalog."default" NOT NULL,
    edad integer NOT NULL,
    email character varying(180) COLLATE pg_catalog."default" NOT NULL,
    password character varying(100) COLLATE pg_catalog."default" NOT NULL,
    telefono character varying(30) COLLATE pg_catalog."default" NOT NULL,
    token character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario),
    CONSTRAINT usuario_email_key UNIQUE (email),
    CONSTRAINT usuario_telefono_key UNIQUE (telefono),
    CONSTRAINT usuario_id_rol_fkey FOREIGN KEY (id_rol)
        REFERENCES public.rol (id_rol) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.usuario
    OWNER to postgres;

-------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.turista
(
    id_turista integer NOT NULL DEFAULT nextval('turista_id_turista_seq'::regclass),
    id_usuario integer NOT NULL,
    CONSTRAINT turista_pkey PRIMARY KEY (id_turista)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.turista
    OWNER to postgres;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.transporte
(
    id_transporte integer NOT NULL DEFAULT nextval('transporte_id_transporte_seq'::regclass),
    id_usuario integer NOT NULL,
    descripcion character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT transporte_pkey PRIMARY KEY (id_transporte),
    CONSTRAINT transporte_id_usuario_fkey FOREIGN KEY (id_usuario)
        REFERENCES public.usuario (id_usuario) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.transporte
    OWNER to postgres;
-----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.tipo_actividad
(
    id_tipo integer NOT NULL DEFAULT nextval('tipo_actividad_id_tipo_seq'::regclass),
    descripcion character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tipo_actividad_pkey PRIMARY KEY (id_tipo),
    CONSTRAINT tipo_actividad_descripcion_key UNIQUE (descripcion)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.tipo_actividad
    OWNER to postgres;

--------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.rol
(
    id_rol integer NOT NULL DEFAULT nextval('rol_id_rol_seq'::regclass),
    descripcion character(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT rol_pkey PRIMARY KEY (id_rol),
    CONSTRAINT rol_descripcion_key UNIQUE (descripcion)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.rol
    OWNER to postgres;
--------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.reserva
(
    id_reserva integer NOT NULL DEFAULT nextval('reserva_id_reserva_seq'::regclass),
    id_actividad integer NOT NULL,
    precio money NOT NULL,
    id_guia integer NOT NULL,
    fecha date NOT NULL,
    id_turista integer NOT NULL,
    id_trasnporte integer NOT NULL,
    estado_reserva boolean NOT NULL,
    CONSTRAINT reserva_pkey PRIMARY KEY (id_reserva),
    CONSTRAINT reserva_id_actividad_fkey FOREIGN KEY (id_actividad)
        REFERENCES public."Actividad" (id_actividad) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT reserva_id_guia_fkey FOREIGN KEY (id_guia)
        REFERENCES public.guia (id_guia) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT reserva_id_trasnporte_fkey FOREIGN KEY (id_trasnporte)
        REFERENCES public.transporte (id_transporte) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT reserva_id_turista_fkey FOREIGN KEY (id_turista)
        REFERENCES public.turista (id_turista) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.reserva
    OWNER to postgres;

----------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.municipio
(
    id_municipio integer NOT NULL DEFAULT nextval('municipio_id_municipio_seq'::regclass),
    nombre_municipio character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT municipio_pkey PRIMARY KEY (id_municipio),
    CONSTRAINT municipio_nombre_municipio_key UNIQUE (nombre_municipio)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.municipio
    OWNER to postgres;
-------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE IF NOT EXISTS public.guia
(
    id_guia integer NOT NULL DEFAULT nextval('guia_id_guia_seq'::regclass),
    id_usuario integer NOT NULL,
    descripcion character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT guia_pkey PRIMARY KEY (id_guia),
    CONSTRAINT guia_id_usuario_fkey FOREIGN KEY (id_usuario)
        REFERENCES public.usuario (id_usuario) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.guia
    OWNER to postgres;
---------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE IF NOT EXISTS public."Actividad"
(
    id_actividad integer NOT NULL DEFAULT nextval('"Actividad_id_actividad_seq"'::regclass),
    id_tipo integer NOT NULL,
    id_municipio integer NOT NULL,
    descripcion character varying(255) COLLATE pg_catalog."default" NOT NULL,
    precio money NOT NULL,
    imagenes character varying(200) COLLATE pg_catalog."default" NOT NULL,
    nombre_actividad character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Actividad_pkey" PRIMARY KEY (id_actividad),
    CONSTRAINT "Actividad_id_municipio_fkey" FOREIGN KEY (id_municipio)
        REFERENCES public.municipio (id_municipio) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Actividad_id_tipo_fkey" FOREIGN KEY (id_tipo)
        REFERENCES public.tipo_actividad (id_tipo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Actividad"
    OWNER to postgres;

--------------------------------------------------------------------------------------------------------------------------------------------------