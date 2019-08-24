--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2019-08-22 03:06:06

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

SET default_with_oids = false;

--
-- TOC entry 246 (class 1259 OID 26070)
-- Name: app_classtype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_classtype (
    id integer NOT NULL,
    name_uz character varying(255) NOT NULL,
    name_ru character varying(255) NOT NULL
);


ALTER TABLE public.app_classtype OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 26068)
-- Name: app_classtype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_classtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_classtype_id_seq OWNER TO postgres;

--
-- TOC entry 3209 (class 0 OID 0)
-- Dependencies: 245
-- Name: app_classtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_classtype_id_seq OWNED BY public.app_classtype.id;


--
-- TOC entry 244 (class 1259 OID 25974)
-- Name: app_operator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_operator (
    id integer NOT NULL,
    institution_id integer,
    user_id integer
);


ALTER TABLE public.app_operator OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 25972)
-- Name: app_operator_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_operator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_operator_id_seq OWNER TO postgres;

--
-- TOC entry 3210 (class 0 OID 0)
-- Dependencies: 243
-- Name: app_operator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_operator_id_seq OWNED BY public.app_operator.id;


--
-- TOC entry 250 (class 1259 OID 26118)
-- Name: app_staffoperator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_staffoperator (
    id integer NOT NULL,
    city_id integer,
    user_id integer
);


ALTER TABLE public.app_staffoperator OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 26116)
-- Name: app_staffoperator_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_staffoperator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_staffoperator_id_seq OWNER TO postgres;

--
-- TOC entry 3211 (class 0 OID 0)
-- Dependencies: 249
-- Name: app_staffoperator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_staffoperator_id_seq OWNED BY public.app_staffoperator.id;


--
-- TOC entry 203 (class 1259 OID 16695)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16693)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3212 (class 0 OID 0)
-- Dependencies: 202
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 205 (class 1259 OID 16705)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16703)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3213 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 201 (class 1259 OID 16687)
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
-- TOC entry 200 (class 1259 OID 16685)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3214 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 207 (class 1259 OID 16713)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16723)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16721)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 206 (class 1259 OID 16711)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 211 (class 1259 OID 16731)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16729)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 215 (class 1259 OID 16815)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name_ru character varying(255) NOT NULL,
    name_uz character varying(255) NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16823)
-- Name: districts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.districts (
    id integer NOT NULL,
    name_ru character varying(255) NOT NULL,
    city_id integer NOT NULL,
    name_uz character varying(255) NOT NULL
);


ALTER TABLE public.districts OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16791)
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
-- TOC entry 212 (class 1259 OID 16789)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 212
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 199 (class 1259 OID 16677)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16675)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3219 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 197 (class 1259 OID 16666)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16664)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 242 (class 1259 OID 17039)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16896)
-- Name: doctor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor (
    id integer NOT NULL,
    full_name character varying(255),
    passport_image character varying(100),
    passport_serial character varying(255),
    birth_year integer,
    gender integer,
    nationality character varying(10),
    self_image character varying(100),
    work_place_id integer,
    email character varying(255),
    phone character varying(255),
    created timestamp with time zone NOT NULL
);


ALTER TABLE public.doctor OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16964)
-- Name: doctor_function; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor_function (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    year integer,
    doctor_id integer NOT NULL
);


ALTER TABLE public.doctor_function OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16962)
-- Name: doctor_function_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_function_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_function_id_seq OWNER TO postgres;

--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 240
-- Name: doctor_function_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_function_id_seq OWNED BY public.doctor_function.id;


--
-- TOC entry 226 (class 1259 OID 16894)
-- Name: doctor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_id_seq OWNER TO postgres;

--
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 226
-- Name: doctor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_id_seq OWNED BY public.doctor.id;


--
-- TOC entry 239 (class 1259 OID 16956)
-- Name: doctor_knowledge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor_knowledge (
    id integer NOT NULL,
    year integer,
    doctor_id integer NOT NULL,
    faculty_id integer NOT NULL,
    university_id integer
);


ALTER TABLE public.doctor_knowledge OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16954)
-- Name: doctor_knowledge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_knowledge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_knowledge_id_seq OWNER TO postgres;

--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 238
-- Name: doctor_knowledge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_knowledge_id_seq OWNED BY public.doctor_knowledge.id;


--
-- TOC entry 237 (class 1259 OID 16948)
-- Name: doctor_medical_candidate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor_medical_candidate (
    id integer NOT NULL,
    name character varying(255),
    year integer,
    doctor_id integer NOT NULL
);


ALTER TABLE public.doctor_medical_candidate OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16946)
-- Name: doctor_medical_candidate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_medical_candidate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_medical_candidate_id_seq OWNER TO postgres;

--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 236
-- Name: doctor_medical_candidate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_medical_candidate_id_seq OWNED BY public.doctor_medical_candidate.id;


--
-- TOC entry 235 (class 1259 OID 16937)
-- Name: doctor_specialization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor_specialization (
    id integer NOT NULL,
    year text,
    doctor_id integer NOT NULL,
    speciality_id integer NOT NULL
);


ALTER TABLE public.doctor_specialization OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16935)
-- Name: doctor_specialization_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_specialization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_specialization_id_seq OWNER TO postgres;

--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 234
-- Name: doctor_specialization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_specialization_id_seq OWNED BY public.doctor_specialization.id;


--
-- TOC entry 233 (class 1259 OID 16929)
-- Name: doctor_training; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor_training (
    id integer NOT NULL,
    year integer,
    hours integer,
    doctor_id integer NOT NULL,
    speciality_id integer NOT NULL
);


ALTER TABLE public.doctor_training OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16927)
-- Name: doctor_training_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_training_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_training_id_seq OWNER TO postgres;

--
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 232
-- Name: doctor_training_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_training_id_seq OWNED BY public.doctor_training.id;


--
-- TOC entry 231 (class 1259 OID 16918)
-- Name: doctor_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor_type (
    id integer NOT NULL,
    type_id integer,
    doctor_id integer NOT NULL,
    name_id integer,
    year text
);


ALTER TABLE public.doctor_type OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16916)
-- Name: doctor_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_type_id_seq OWNER TO postgres;

--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 230
-- Name: doctor_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_type_id_seq OWNED BY public.doctor_type.id;


--
-- TOC entry 225 (class 1259 OID 16859)
-- Name: institution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institution (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(255),
    district_id integer,
    type_id integer,
    user_id integer
);


ALTER TABLE public.institution OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16857)
-- Name: institution_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.institution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.institution_id_seq OWNER TO postgres;

--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 224
-- Name: institution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.institution_id_seq OWNED BY public.institution.id;


--
-- TOC entry 221 (class 1259 OID 16841)
-- Name: institution_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institution_type (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.institution_type OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16839)
-- Name: institution_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.institution_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.institution_type_id_seq OWNER TO postgres;

--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 220
-- Name: institution_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.institution_type_id_seq OWNED BY public.institution_type.id;


--
-- TOC entry 214 (class 1259 OID 16813)
-- Name: region_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.region_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.region_city_id_seq OWNER TO postgres;

--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 214
-- Name: region_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.region_city_id_seq OWNED BY public.cities.id;


--
-- TOC entry 216 (class 1259 OID 16821)
-- Name: region_district_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.region_district_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.region_district_id_seq OWNER TO postgres;

--
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 216
-- Name: region_district_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.region_district_id_seq OWNED BY public.districts.id;


--
-- TOC entry 229 (class 1259 OID 16907)
-- Name: speciality; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.speciality (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.speciality OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16905)
-- Name: speciality_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.speciality_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.speciality_id_seq OWNER TO postgres;

--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 228
-- Name: speciality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.speciality_id_seq OWNED BY public.speciality.id;


--
-- TOC entry 248 (class 1259 OID 26101)
-- Name: templates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.templates (
    id integer NOT NULL,
    text text NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.templates OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 26099)
-- Name: templates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.templates_id_seq OWNER TO postgres;

--
-- TOC entry 3233 (class 0 OID 0)
-- Dependencies: 247
-- Name: templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.templates_id_seq OWNED BY public.templates.id;


--
-- TOC entry 219 (class 1259 OID 16831)
-- Name: university_faculty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.university_faculty (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.university_faculty OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16829)
-- Name: university_faculty_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.university_faculty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.university_faculty_id_seq OWNER TO postgres;

--
-- TOC entry 3234 (class 0 OID 0)
-- Dependencies: 218
-- Name: university_faculty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.university_faculty_id_seq OWNED BY public.university_faculty.id;


--
-- TOC entry 223 (class 1259 OID 16849)
-- Name: university_university; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.university_university (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.university_university OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16847)
-- Name: university_university_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.university_university_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.university_university_id_seq OWNER TO postgres;

--
-- TOC entry 3235 (class 0 OID 0)
-- Dependencies: 222
-- Name: university_university_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.university_university_id_seq OWNED BY public.university_university.id;


--
-- TOC entry 2883 (class 2604 OID 26073)
-- Name: app_classtype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_classtype ALTER COLUMN id SET DEFAULT nextval('public.app_classtype_id_seq'::regclass);


--
-- TOC entry 2882 (class 2604 OID 25977)
-- Name: app_operator id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_operator ALTER COLUMN id SET DEFAULT nextval('public.app_operator_id_seq'::regclass);


--
-- TOC entry 2885 (class 2604 OID 26121)
-- Name: app_staffoperator id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_staffoperator ALTER COLUMN id SET DEFAULT nextval('public.app_staffoperator_id_seq'::regclass);


--
-- TOC entry 2861 (class 2604 OID 16698)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2862 (class 2604 OID 16708)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2860 (class 2604 OID 16690)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2863 (class 2604 OID 16716)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2864 (class 2604 OID 16726)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2865 (class 2604 OID 16734)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2868 (class 2604 OID 16818)
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.region_city_id_seq'::regclass);


--
-- TOC entry 2869 (class 2604 OID 16826)
-- Name: districts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.districts ALTER COLUMN id SET DEFAULT nextval('public.region_district_id_seq'::regclass);


--
-- TOC entry 2866 (class 2604 OID 16794)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2859 (class 2604 OID 16680)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2858 (class 2604 OID 16669)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2874 (class 2604 OID 16899)
-- Name: doctor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor ALTER COLUMN id SET DEFAULT nextval('public.doctor_id_seq'::regclass);


--
-- TOC entry 2881 (class 2604 OID 16967)
-- Name: doctor_function id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_function ALTER COLUMN id SET DEFAULT nextval('public.doctor_function_id_seq'::regclass);


--
-- TOC entry 2880 (class 2604 OID 16959)
-- Name: doctor_knowledge id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_knowledge ALTER COLUMN id SET DEFAULT nextval('public.doctor_knowledge_id_seq'::regclass);


--
-- TOC entry 2879 (class 2604 OID 16951)
-- Name: doctor_medical_candidate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_medical_candidate ALTER COLUMN id SET DEFAULT nextval('public.doctor_medical_candidate_id_seq'::regclass);


--
-- TOC entry 2878 (class 2604 OID 16940)
-- Name: doctor_specialization id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_specialization ALTER COLUMN id SET DEFAULT nextval('public.doctor_specialization_id_seq'::regclass);


--
-- TOC entry 2877 (class 2604 OID 16932)
-- Name: doctor_training id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_training ALTER COLUMN id SET DEFAULT nextval('public.doctor_training_id_seq'::regclass);


--
-- TOC entry 2876 (class 2604 OID 16921)
-- Name: doctor_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_type ALTER COLUMN id SET DEFAULT nextval('public.doctor_type_id_seq'::regclass);


--
-- TOC entry 2873 (class 2604 OID 16862)
-- Name: institution id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institution ALTER COLUMN id SET DEFAULT nextval('public.institution_id_seq'::regclass);


--
-- TOC entry 2871 (class 2604 OID 16844)
-- Name: institution_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institution_type ALTER COLUMN id SET DEFAULT nextval('public.institution_type_id_seq'::regclass);


--
-- TOC entry 2875 (class 2604 OID 16910)
-- Name: speciality id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.speciality ALTER COLUMN id SET DEFAULT nextval('public.speciality_id_seq'::regclass);


--
-- TOC entry 2884 (class 2604 OID 26104)
-- Name: templates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.templates ALTER COLUMN id SET DEFAULT nextval('public.templates_id_seq'::regclass);


--
-- TOC entry 2870 (class 2604 OID 16834)
-- Name: university_faculty id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_faculty ALTER COLUMN id SET DEFAULT nextval('public.university_faculty_id_seq'::regclass);


--
-- TOC entry 2872 (class 2604 OID 16852)
-- Name: university_university id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_university ALTER COLUMN id SET DEFAULT nextval('public.university_university_id_seq'::regclass);


--
-- TOC entry 3199 (class 0 OID 26070)
-- Dependencies: 246
-- Data for Name: app_classtype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_classtype (id, name_uz, name_ru) FROM stdin;
1	ttttttttt	ttttttttt
\.


--
-- TOC entry 3197 (class 0 OID 25974)
-- Dependencies: 244
-- Data for Name: app_operator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_operator (id, institution_id, user_id) FROM stdin;
10	3	2
11	\N	11
12	\N	12
13	4	13
14	5	14
15	\N	15
16	6	16
\.


--
-- TOC entry 3203 (class 0 OID 26118)
-- Dependencies: 250
-- Data for Name: app_staffoperator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_staffoperator (id, city_id, user_id) FROM stdin;
1	1	11
3	11	13
2	12	12
4	\N	14
5	5	15
6	\N	16
\.


--
-- TOC entry 3156 (class 0 OID 16695)
-- Dependencies: 203
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 16705)
-- Dependencies: 205
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 16687)
-- Dependencies: 201
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add City	7	add_city
26	Can change City	7	change_city
27	Can delete City	7	delete_city
28	Can view City	7	view_city
29	Can add District	8	add_district
30	Can change District	8	change_district
31	Can delete District	8	delete_district
32	Can view District	8	view_district
33	Can add faculty	9	add_faculty
34	Can change faculty	9	change_faculty
35	Can delete faculty	9	delete_faculty
36	Can view faculty	9	view_faculty
37	Can add institution type	10	add_institutiontype
38	Can change institution type	10	change_institutiontype
39	Can delete institution type	10	delete_institutiontype
40	Can view institution type	10	view_institutiontype
41	Can add university	11	add_university
42	Can change university	11	change_university
43	Can delete university	11	delete_university
44	Can view university	11	view_university
45	Can add institution	12	add_institution
46	Can change institution	12	change_institution
47	Can delete institution	12	delete_institution
48	Can view institution	12	view_institution
49	Can add doctor	13	add_doctor
50	Can change doctor	13	change_doctor
51	Can delete doctor	13	delete_doctor
52	Can view doctor	13	view_doctor
53	Can add speciality	14	add_speciality
54	Can change speciality	14	change_speciality
55	Can delete speciality	14	delete_speciality
56	Can view speciality	14	view_speciality
57	Can add type	15	add_type
58	Can change type	15	change_type
59	Can delete type	15	delete_type
60	Can view type	15	view_type
61	Can add training	16	add_training
62	Can change training	16	change_training
63	Can delete training	16	delete_training
64	Can view training	16	view_training
65	Can add specialization	17	add_specialization
66	Can change specialization	17	change_specialization
67	Can delete specialization	17	delete_specialization
68	Can view specialization	17	view_specialization
69	Can add medical candidate	18	add_medicalcandidate
70	Can change medical candidate	18	change_medicalcandidate
71	Can delete medical candidate	18	delete_medicalcandidate
72	Can view medical candidate	18	view_medicalcandidate
73	Can add knowledge	19	add_knowledge
74	Can change knowledge	19	change_knowledge
75	Can delete knowledge	19	delete_knowledge
76	Can view knowledge	19	view_knowledge
77	Can add function	20	add_function
78	Can change function	20	change_function
79	Can delete function	20	delete_function
80	Can view function	20	view_function
81	Can add operator	21	add_operator
82	Can change operator	21	change_operator
83	Can delete operator	21	delete_operator
84	Can view operator	21	view_operator
85	Can add class type	22	add_classtype
86	Can change class type	22	change_classtype
87	Can delete class type	22	delete_classtype
88	Can view class type	22	view_classtype
89	Can add message template	23	add_messagetemplate
90	Can change message template	23	change_messagetemplate
91	Can delete message template	23	delete_messagetemplate
92	Can view message template	23	view_messagetemplate
93	Can add staff operator	24	add_staffoperator
94	Can change staff operator	24	change_staffoperator
95	Can delete staff operator	24	delete_staffoperator
96	Can view staff operator	24	view_staffoperator
\.


--
-- TOC entry 3160 (class 0 OID 16713)
-- Dependencies: 207
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$150000$Dj9sds47PnTX$OGFUCf5u85O3hOCet+BtunMJ8HqIauHXwpmkZcXmC/c=	2019-08-21 23:21:35.365993-07	f	op1				f	t	2019-08-18 00:43:38.682076-07
1	pbkdf2_sha256$150000$5cx1GfJ61MVU$c1jV2/UWxS5H+IHO5ND9V+K54ga6zpn8lcoo+RzibFA=	2019-08-21 23:24:49.519887-07	t	root				t	t	2019-08-12 03:10:05.583266-07
4	pbkdf2_sha256$150000$n9TQ9kJDiPhb$W6PeYZkTcTKXcDL7qtm21p1P2jzzoGNUWCgpTcoMcBM=	\N	f	op23	fio1			f	t	2019-08-18 02:33:11.526905-07
5	pbkdf2_sha256$150000$jeJf9zZLh0oi$cA+eqRpeO4M5qx76w8LErofbBVzj5yvlvpLcuxp0riM=	\N	f	op234	fio1			f	t	2019-08-18 02:33:51.062918-07
6	pbkdf2_sha256$150000$igw0kWsm6Ily$E89FNCk5s+kShcwvcZgKszCe2s3ADHOWlDQEDPHhe6I=	\N	f	op2344	fio1			f	t	2019-08-18 02:34:37.243656-07
7	pbkdf2_sha256$150000$37Jbu4fFZtQz$MYgxvaAkS3swg71rqQ0yPYYK5uEK8Z1e9E3fvKCDxNo=	\N	f	op23445	fio1			f	t	2019-08-18 02:35:39.711079-07
8	pbkdf2_sha256$150000$S6Rx4cCITgDl$gMHZYGtTnLVScj3Ym4I/98XwNSLH94ZvsGeEai5ImS0=	\N	f	op2344567	fio1			f	t	2019-08-18 02:35:56.084145-07
9	pbkdf2_sha256$150000$V0BVtNRVZFZ5$7Y/IGZq2XPQbJ1JzHuIfPrLn8VfnxVRsDZ3t3FfLqqU=	\N	f	op23445676	fio1			f	t	2019-08-18 02:38:14.47886-07
10	pbkdf2_sha256$150000$cTmwLzvLuKrn$J9h2UH2wz+0jD4YxLI1D1GnBTKhgtO8MdEAEn2dVNq8=	\N	f	op234456762	fio1			f	t	2019-08-18 02:40:58.114731-07
13	pbkdf2_sha256$150000$wVIw8dU1kNfR$YPVJKY+nEErfWuDzwPe3Ek1mck1JGzSiwI9dt9A0DBY=	\N	f	gulOp1	Teeeeeeest			f	t	2019-08-21 21:14:51.994672-07
3	pbkdf2_sha256$150000$UZRE33yIDhsq$FEF81UwmgXq7cflWpNts4Fx+cN1bXGen1Ljor/eMY0Y=	2019-08-20 03:55:57.450955-07	f	op2	fio1			f	t	2019-08-18 02:32:05.631302-07
15	pbkdf2_sha256$150000$wkM0lzo07x4V$X4quu0WrgzF0XqQS1iEql02u27/O0NXuKH3hNPRGnx8=	2019-08-21 21:53:33.970211-07	f	farrukh	Farrux			t	t	2019-08-21 21:51:37.586578-07
16	pbkdf2_sha256$150000$T1Xf8URVaGgl$LoTrvQwUlQMGWgrwRacbc6FHjfiGiglKDrherTGm3Vc=	2019-08-21 21:59:46.856364-07	f	porij	xxxxxxx			f	t	2019-08-21 21:53:48.347583-07
12	pbkdf2_sha256$150000$J9GTnmtdmVPK$ugEaQMruNZUg3aYpeJt5k4A4Od6UjwteYa6PVqhvaN4=	2019-08-21 23:20:54.985019-07	f	regOp2	TestOp			t	t	2019-08-21 21:12:53.246181-07
14	pbkdf2_sha256$150000$bxWidfHPRKFp$hhy+L2mUTBR65GKkXCkiDCYNYyrkxG2VISB6nNe4JhU=	2019-08-21 23:21:10.001617-07	f	uchkupirop1	zxc			f	t	2019-08-21 21:30:17.875208-07
11	pbkdf2_sha256$150000$GmaJJgPe438b$635qbqhY9KLdneQ64op8XFdot0k+g/1laRAqM5eQMhk=	2019-08-21 23:21:18.9757-07	f	regOp1				t	t	2019-08-21 20:06:42.032046-07
\.


--
-- TOC entry 3162 (class 0 OID 16723)
-- Dependencies: 209
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 16731)
-- Dependencies: 211
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 16815)
-- Dependencies: 215
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name_ru, name_uz) FROM stdin;
3	Каракалпакстан	Qoraqolpoqiston
4	Андижанская обл.	Andijon vil.
5	Джизакская обл.	Jizzax vil.
6	Кашкадарьинская обл.	Qashqadaryo vil.
7	Наваинйская обл.	Navoiy vil.
8	Наманганская обл.	Namangan vil.
9	Самаркандская обл.	Samarqand vil.
10	Сурхандарьинская обл.	Surxondaryo vil.
11	Сырдарьинская обл.	Sirdaryo vil.
12	Ферганская обл.	Farg`ona vil.
13	Хорезмская обл.	Xorazm vil.
14	Бухарская обл.	Buxoro vil.
1	Ташкент	Toshkent sh.
2	Ташкентская обл.	Toshkent vil.
\.


--
-- TOC entry 3170 (class 0 OID 16823)
-- Dependencies: 217
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.districts (id, name_ru, city_id, name_uz) FROM stdin;
1	Сергелийский район	1	
2	Мирзо-Улугбекский район	1	
3	Мирабадский район	1	
4	Бектемирский район	1	
5	Сабир-Рахимовский район	1	
6	Яшнабадский район	1	
7	Юнусабадский район	1	
8	Учтепинский район	1	
9	Шайхантахурский район	1	
10	Чиланзарский район	1	
11	Яккасарайский район	1	
12	город Алмалык	2	
13	город Ангрен	2	
14	город Бекабад	2	
15	город Чирчик	2	
16	Аккурганский район	2	
17	Ахангаранский район	2	
18	Бекабадский район	2	
19	Бостанлыкский район	2	
20	Букинский район	2	
21	Кибрайский район	2	
22	Куйичирчикский район	2	
23	Паркентский район	2	
24	Пскентский район	2	
25	Зангиатинский район	2	
26	Уртачирчикский район	2	
27	Чиназский район	2	
28	Юкоричирчикский район	2	
29	Янгиюльский район	2	
30	город Нукус	3	
31	Амударьинский район	3	
32	Берунийский район	3	
33	Канлыкульский район	3	
34	Караузякский район	3	
35	Кегейлийский район	3	
36	Кунградский район	3	
37	Муйнакский район	3	
38	Нукусский район	3	
39	Тахтакупырский район	3	
40	Турткульский район	3	
41	Ходжейлийский район	3	
42	Чимбайский район	3	
43	Шуманайский район	3	
44	Элликкалинский район	3	
45	город Андижан	4	
46	город Ханабад	4	
47	Алтынкульский район	4	
48	Андижанский район	4	
49	Асакинский район	4	
50	Балыкчинский район	4	
51	Бозский район	4	
52	Булакбашинский район	4	
53	Джалалкудукский район	4	
54	Избасканский район	4	
55	Кургантепинский район	4	
56	Мархаматский район	4	
57	Пахтаабадский район	4	
58	Улугнорский район	4	
59	Ходжаабадский район	4	
60	Шахриханский район	4	
61	город Джизак	5	
62	Арнасайский район	5	
63	Бахмальский район	5	
64	Галляаральский район	5	
65	Джизакский район	5	
66	Дустликский район	5	
67	Зааминский район	5	
68	Зарбдарский район	5	
69	Зафарабадский район	5	
70	Мирзачульский район	5	
71	Пахтакорский район	5	
72	Фаришский район	5	
73	Янгиабадский район	5	
74	город Карши	6	
75	Гузарский район	6	
76	Дехканабадский район	6	
77	Камашинский район	6	
78	Каршинский район	6	
79	Касанский район	6	
80	Касбийский район	6	
81	Китабский район	6	
82	Миришкорский район	6	
83	Мубарекский район	6	
84	Нишанский район	7	
85	Чиракчинский район	6	
86	Шахрисабзский район	6	
87	Яккабагский район	6	
88	город Зарафшан	7	
90	Канимехский район	7	
91	Карманинский район	7	
92	Кызылтепинский район	7	
93	Навбахорский район	7	
94	Нуратинский район	7	
95	Тамдынский район	7	
96	Учкудукский район	7	
97	Хатырчинский район	7	
98	город Наманган	8	
99	Касансайский район	8	
100	Мингбулакский район	8	
101	Наманганский район	8	
102	Нарынский район	8	
103	Папский район	8	
104	Туракурганский район	8	
105	Уйчинский район	8	
106	Учкурганский район	8	
107	Чартакский район	8	
108	Чустский район	8	
109	Янгикурганский район	8	
110	город Каттакурган	9	
111	город Самарканд	9	
112	Акдарьинский район	9	
113	Булунгурский район	9	
114	Джамбайский район	9	
115	Иштыханский район	9	
116	Каттакурганский район	9	
117	Кошрабадский район	9	
118	Нарпайский район	9	
119	Нурабадский район	9	
120	Пайарыкский район	9	
121	Пастдаргомский район	9	
122	Пахтачийский район	9	
123	Самаркандский район	9	
124	Тайлакский район	9	
125	Ургутский район	9	
126	город Термез	10	
127	Алтынсайский район‎	10	
128	Ангорский район‎	10	
129	Байсунский район‎	10	
130	Денауский район‎	10	
131	Джаркурганский район‎	10	
132	Кизирикский район‎	10	
133	Кумкурганский район‎	10	
134	Музрабадский район‎	10	
135	Сариасийский район‎	10	
136	Термезский район‎	10	
137	Узунский район‎	10	
138	Шерабадский район	10	
139	Шурчинский район‎	10	
140	город Гулистан	11	
141	город Ширин	11	
142	город Янгиер	11	
143	Акалтынский район	11	
144	Баяутский район	11	
145	Гулистанский район	11	
146	Мирзаабадский район	11	
147	Сайхунабадский район	11	
148	Сардобинский район	11	
149	Сырдарьинский район	11	
150	Хавастский район	11	
151	город Коканд	12	
152	город Кувасай	12	
153	город Маргилан	12	
154	город Фергана	12	
155	Алтыарыкский район	12	
156	Багдадский район	12	
157	Бешарыкский район	12	
158	Бувайдинский район	12	
159	Дангаринский район	12	
160	Кувинский район	12	
161	Куштепинский район	12	
162	Риштанский район	12	
163	Сохский район	12	
164	Ташлакский район	12	
165	Узбекистанский район	12	
166	Учкуприкский район	12	
167	Ферганский район	12	
168	Фуркатский район	12	
169	Язъяванский район	12	
170	город Ургенч	13	
171	Багатский район	13	
172	Гурленский район	13	
173	Кошкупырский район	13	
174	Ургенчский район	13	
175	Хазараспский район	13	
176	Ханкинский район	13	
177	Хивинский район	13	
178	Шаватский район	13	
179	Янгиарыкский район	13	
180	Янгибазарский район	13	
181	город Бухара	14	
182	город Каган	14	
183	Пешкунский район‎	14	
184	Шафирканский район‎	14	
185	Алатский район	14	
186	Бухарский район	14	
187	Вабкентский район	14	
188	Гиждуванский район	14	
189	Жондорский район	14	
190	Каганский район	14	
191	Каракульский район	14	
192	Караулбазарский район	14	
193	Ромитанский район	14	
89	город Навои	7	
194	Алмазарский район	1	
196	город Шахрисабз	6	
\.


--
-- TOC entry 3166 (class 0 OID 16791)
-- Dependencies: 213
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-08-12 04:48:17.821763-07	1	fio_test	1	[{"added": {}}]	13	1
2	2019-08-18 13:04:31.924464-07	1	1	1	[{"added": {}}]	14	1
3	2019-08-18 13:05:05.642529-07	2	2	1	[{"added": {}}]	14	1
4	2019-08-18 13:05:08.207321-07	3	3	1	[{"added": {}}]	14	1
5	2019-08-19 20:42:53.770512-07	2	test	1	[{"added": {}}]	12	1
6	2019-08-19 20:43:08.472439-07	10	Murodillo Urakov	2	[{"changed": {"fields": ["gender", "work_place"]}}]	13	1
7	2019-08-19 20:44:25.911607-07	9	wtffffffffffffffffffff	2	[{"changed": {"fields": ["gender", "work_place"]}}]	13	1
8	2019-08-19 21:30:41.348589-07	3	teeeee	1	[{"added": {}}]	12	1
9	2019-08-19 21:30:51.458178-07	3	teeeee	2	[{"changed": {"fields": ["user"]}}]	12	1
10	2019-08-19 21:31:01.684147-07	8	wtffffffffffffffffffff	2	[{"changed": {"fields": ["gender", "work_place"]}}]	13	1
11	2019-08-19 23:48:25.384883-07	1	ClassType object (1)	1	[{"added": {}}]	22	1
12	2019-08-21 19:59:12.124895-07	10	Operator object (10)	1	[{"added": {}}]	21	1
13	2019-08-21 20:27:12.378174-07	1	StaffOperator object (1)	1	[{"added": {}}]	24	1
14	2019-08-21 21:23:14.860989-07	3	StaffOperator object (3)	2	[{"changed": {"fields": ["city"]}}]	24	1
15	2019-08-21 21:23:35.542056-07	2	StaffOperator object (2)	2	[{"changed": {"fields": ["city"]}}]	24	1
\.


--
-- TOC entry 3152 (class 0 OID 16677)
-- Dependencies: 199
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	app	city
8	app	district
9	app	faculty
10	app	institutiontype
11	app	university
12	app	institution
13	app	doctor
14	app	speciality
15	app	type
16	app	training
17	app	specialization
18	app	medicalcandidate
19	app	knowledge
20	app	function
21	app	operator
22	app	classtype
23	app	messagetemplate
24	app	staffoperator
\.


--
-- TOC entry 3150 (class 0 OID 16666)
-- Dependencies: 197
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-08-12 01:58:26.161491-07
2	auth	0001_initial	2019-08-12 01:58:26.231304-07
3	admin	0001_initial	2019-08-12 01:58:26.336242-07
4	admin	0002_logentry_remove_auto_add	2019-08-12 01:58:26.359387-07
5	admin	0003_logentry_add_action_flag_choices	2019-08-12 01:58:26.367384-07
6	app	0001_initial	2019-08-12 01:58:26.459273-07
7	app	0002_doctor_function_knowledge_medicalcandidate_speciality_specialization_training_type	2019-08-12 01:58:26.640688-07
8	contenttypes	0002_remove_content_type_name	2019-08-12 01:58:26.737294-07
9	auth	0002_alter_permission_name_max_length	2019-08-12 01:58:26.742281-07
10	auth	0003_alter_user_email_max_length	2019-08-12 01:58:26.751256-07
11	auth	0004_alter_user_username_opts	2019-08-12 01:58:26.760266-07
12	auth	0005_alter_user_last_login_null	2019-08-12 01:58:26.769795-07
13	auth	0006_require_contenttypes_0002	2019-08-12 01:58:26.770792-07
14	auth	0007_alter_validators_add_error_messages	2019-08-12 01:58:26.78435-07
15	auth	0008_alter_user_username_max_length	2019-08-12 01:58:26.802302-07
16	auth	0009_alter_user_last_name_max_length	2019-08-12 01:58:26.81028-07
17	auth	0010_alter_group_name_max_length	2019-08-12 01:58:26.819287-07
18	auth	0011_update_proxy_permissions	2019-08-12 01:58:26.83322-07
19	sessions	0001_initial	2019-08-12 01:58:26.849881-07
20	app	0003_operator	2019-08-18 02:21:13.367406-07
21	app	0004_doctor_self_image	2019-08-18 06:08:32.832952-07
22	app	0005_auto_20190819_0444	2019-08-19 04:44:41.326368-07
23	app	0006_auto_20190819_0448	2019-08-19 04:48:16.648768-07
26	app	0007_doctor_work_place	2019-08-19 20:33:41.719857-07
27	app	0008_auto_20190819_2032	2019-08-19 20:33:41.785681-07
28	app	0009_auto_20190819_2216	2019-08-19 22:20:39.249819-07
29	app	0010_auto_20190819_2222	2019-08-19 22:22:56.137891-07
30	app	0011_auto_20190819_2339	2019-08-19 23:39:17.66207-07
31	app	0012_messagetemplate	2019-08-21 02:24:03.134531-07
32	app	0013_auto_20190821_0229	2019-08-21 02:29:09.264119-07
33	app	0014_auto_20190821_0230	2019-08-21 02:30:26.981549-07
34	app	0015_auto_20190821_1929	2019-08-21 19:30:13.46041-07
35	app	0016_auto_20190821_1939	2019-08-21 19:40:13.974762-07
36	app	0017_auto_20190821_2025	2019-08-21 20:26:20.77721-07
\.


--
-- TOC entry 3195 (class 0 OID 17039)
-- Dependencies: 242
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
1uagvf1ikeoc5bqbbe3n3skpqqfb6gfp	NTBlNzhlYmU1YmIwOGVjMDQ3MzZkM2VmYmVhNzRkMTVhODA5ODgyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YTQ1NmYwZjA0ZTlkZTY5NzNkMjAzZDdhZDMzNzU4OGQyZmE0OTUwIn0=	2019-08-26 03:10:10.003464-07
8rzesob91lnu8rm556fs16vlnhvgkh8f	NTBlNzhlYmU1YmIwOGVjMDQ3MzZkM2VmYmVhNzRkMTVhODA5ODgyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YTQ1NmYwZjA0ZTlkZTY5NzNkMjAzZDdhZDMzNzU4OGQyZmE0OTUwIn0=	2019-09-04 23:24:49.52191-07
7ux9jwzxng0aauqxtd1absoow36rvjzx	NTBlNzhlYmU1YmIwOGVjMDQ3MzZkM2VmYmVhNzRkMTVhODA5ODgyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YTQ1NmYwZjA0ZTlkZTY5NzNkMjAzZDdhZDMzNzU4OGQyZmE0OTUwIn0=	2019-08-31 04:29:55.600439-07
4f6dzd1mlx5s34rwx64vt9rur3gt66y8	NTBlNzhlYmU1YmIwOGVjMDQ3MzZkM2VmYmVhNzRkMTVhODA5ODgyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YTQ1NmYwZjA0ZTlkZTY5NzNkMjAzZDdhZDMzNzU4OGQyZmE0OTUwIn0=	2019-09-01 07:00:52.431373-07
yezf02ya6oqdsm19vsaq2ld7272hgc6k	NTBlNzhlYmU1YmIwOGVjMDQ3MzZkM2VmYmVhNzRkMTVhODA5ODgyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YTQ1NmYwZjA0ZTlkZTY5NzNkMjAzZDdhZDMzNzU4OGQyZmE0OTUwIn0=	2019-09-02 02:18:22.845184-07
\.


--
-- TOC entry 3180 (class 0 OID 16896)
-- Dependencies: 227
-- Data for Name: doctor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor (id, full_name, passport_image, passport_serial, birth_year, gender, nationality, self_image, work_place_id, email, phone, created) FROM stdin;
1	fio_test	thNCFTZRVV.jpg	AA 2131231	1994	0	uz	\N	\N	\N	\N	2019-08-21 19:40:13.89534-07
11	qqqqqqqqqqqqqq	332332_jgyQKw6.jpg	wwwwwwwwwww	22222	0	1	x6hnZOD_bMYYFOw.png	\N	\N	\N	2019-08-21 19:40:13.89534-07
12	fio_test	332332_NAOSohA.jpg	CK 1234567	1994	0	1	x6hnZOD_tMmTmtu.png	2	\N	\N	2019-08-21 19:40:13.89534-07
13	zxc		\N	\N	\N	\N		6			2019-08-21 22:02:06.42593-07
10	Murodillo Urakov	332332_60Hns7c.jpg	CB 1234567	1996	0	1	x6hnZOD_ZZ4DcWK.png	2	ergash1994@gmail.com	+998-97-735-3935	2019-08-21 19:40:13.89534-07
3	asd	332332_tuQJ76P.jpg	1111111111	1111	\N	1	x6hnZOD.png	\N	\N	\N	2019-08-21 19:40:13.89534-07
2	asdasd	332332.jpg	1111111111	1111	\N	\N		\N	\N	\N	2019-08-21 19:40:13.89534-07
9	test	332332_M1c0NpB.jpg	AA 2131231	1111	0	1	x6hnZOD_ZOEV1o2.png	2	\N	\N	2019-08-21 19:40:13.89534-07
8	qwe	332332_XAEmaN4.jpg	1111111111	1111	0	1	x6hnZOD_I9Y4BCd.png	3	\N	\N	2019-08-21 19:40:13.89534-07
7	zxc	332332_WFiLf61.jpg	1111111111	1111	\N	1	x6hnZOD_xRC45ZA.png	\N	\N	\N	2019-08-21 19:40:13.89534-07
6	asd	332332_AW3FbC1.jpg	1111111111	1111	\N	1	x6hnZOD_QIw5atc.png	\N	\N	\N	2019-08-21 19:40:13.89534-07
5	asd	332332_3Fc3yOK.jpg	1111111111	1111	\N	1	x6hnZOD_4Wm4CEs.png	\N	\N	\N	2019-08-21 19:40:13.89534-07
4	zxczxc	332332_kIWKpCJ.jpg	1111111111	1111	\N	1	x6hnZOD_H4J70mf.png	\N	\N	\N	2019-08-21 19:40:13.89534-07
\.


--
-- TOC entry 3194 (class 0 OID 16964)
-- Dependencies: 241
-- Data for Name: doctor_function; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_function (id, name, year, doctor_id) FROM stdin;
1	asd	123	5
2	asd	123	6
3	asd	123	7
4	asd	123	8
7	aaaaaaa	2222	11
5	asd	1231	9
8	test	1212	12
6	test	2222	10
\.


--
-- TOC entry 3192 (class 0 OID 16956)
-- Dependencies: 239
-- Data for Name: doctor_knowledge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_knowledge (id, year, doctor_id, faculty_id, university_id) FROM stdin;
3	111	5	1	1
4	111	6	1	1
5	111	7	1	1
6	111	8	1	1
9	2222	11	1	1
7	1111	9	1	1
10	1212	12	1	1
8	2222	10	1	1
\.


--
-- TOC entry 3190 (class 0 OID 16948)
-- Dependencies: 237
-- Data for Name: doctor_medical_candidate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_medical_candidate (id, name, year, doctor_id) FROM stdin;
1	\N	\N	2
2	qwe	123	3
3	qwe	123	4
4	qwe	123	5
5	qwe	123	6
6	qwe	123	7
7	qwe	123	8
10	qwe	2333	11
8	qwe	1231	9
11	testnom	1212	12
9	testnom	2222	10
\.


--
-- TOC entry 3188 (class 0 OID 16937)
-- Dependencies: 235
-- Data for Name: doctor_specialization; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_specialization (id, year, doctor_id, speciality_id) FROM stdin;
4	2222	11	3
2	1231	9	3
5	1212	12	3
3	2222	10	4
\.


--
-- TOC entry 3186 (class 0 OID 16929)
-- Dependencies: 233
-- Data for Name: doctor_training; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_training (id, year, hours, doctor_id, speciality_id) FROM stdin;
3	123123	123	8	1
6	2222	32	11	3
4	1231	123	9	1
7	1212	12	12	1
5	2222	22	10	1
\.


--
-- TOC entry 3184 (class 0 OID 16918)
-- Dependencies: 231
-- Data for Name: doctor_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_type (id, type_id, doctor_id, name_id, year) FROM stdin;
7	1	11	3	2222
8	1	12	2	1212
9	1	10	2	1231
10	1	9	3	1111
\.


--
-- TOC entry 3178 (class 0 OID 16859)
-- Dependencies: 225
-- Data for Name: institution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.institution (id, name, address, district_id, type_id, user_id) FROM stdin;
2	test	testt	4	1	2
3	teeeee	teeeeeeeeeeeeee	6	1	7
4	wwwwwwwwwwwwwwwwwwwwwww	aaaaaaaaaaaaaaaaaaaaaaa	145	1	\N
5	aaaaaaazzzzzzzzzzzzzzzzzzzz	xxxxxxxxxxxxxxxxxxxxx	166	1	\N
6	zzzzzzzzzzzzzzzzzzzzzzzz	ssssssssssssss	72	1	\N
\.


--
-- TOC entry 3174 (class 0 OID 16841)
-- Dependencies: 221
-- Data for Name: institution_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.institution_type (id, name) FROM stdin;
1	type1
\.


--
-- TOC entry 3182 (class 0 OID 16907)
-- Dependencies: 229
-- Data for Name: speciality; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.speciality (id, name) FROM stdin;
1	1
2	2
3	3
4	qqq
\.


--
-- TOC entry 3201 (class 0 OID 26101)
-- Dependencies: 248
-- Data for Name: templates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.templates (id, text, title) FROM stdin;
1	<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>	zxc
\.


--
-- TOC entry 3172 (class 0 OID 16831)
-- Dependencies: 219
-- Data for Name: university_faculty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.university_faculty (id, name) FROM stdin;
1	testFaculty
\.


--
-- TOC entry 3176 (class 0 OID 16849)
-- Dependencies: 223
-- Data for Name: university_university; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.university_university (id, name) FROM stdin;
1	WTF
\.


--
-- TOC entry 3236 (class 0 OID 0)
-- Dependencies: 245
-- Name: app_classtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_classtype_id_seq', 1, true);


--
-- TOC entry 3237 (class 0 OID 0)
-- Dependencies: 243
-- Name: app_operator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_operator_id_seq', 16, true);


--
-- TOC entry 3238 (class 0 OID 0)
-- Dependencies: 249
-- Name: app_staffoperator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_staffoperator_id_seq', 6, true);


--
-- TOC entry 3239 (class 0 OID 0)
-- Dependencies: 202
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3240 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3241 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 96, true);


--
-- TOC entry 3242 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3243 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 16, true);


--
-- TOC entry 3244 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3245 (class 0 OID 0)
-- Dependencies: 212
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 15, true);


--
-- TOC entry 3246 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 24, true);


--
-- TOC entry 3247 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 36, true);


--
-- TOC entry 3248 (class 0 OID 0)
-- Dependencies: 240
-- Name: doctor_function_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_function_id_seq', 8, true);


--
-- TOC entry 3249 (class 0 OID 0)
-- Dependencies: 226
-- Name: doctor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_id_seq', 13, true);


--
-- TOC entry 3250 (class 0 OID 0)
-- Dependencies: 238
-- Name: doctor_knowledge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_knowledge_id_seq', 10, true);


--
-- TOC entry 3251 (class 0 OID 0)
-- Dependencies: 236
-- Name: doctor_medical_candidate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_medical_candidate_id_seq', 11, true);


--
-- TOC entry 3252 (class 0 OID 0)
-- Dependencies: 234
-- Name: doctor_specialization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_specialization_id_seq', 5, true);


--
-- TOC entry 3253 (class 0 OID 0)
-- Dependencies: 232
-- Name: doctor_training_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_training_id_seq', 7, true);


--
-- TOC entry 3254 (class 0 OID 0)
-- Dependencies: 230
-- Name: doctor_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_type_id_seq', 10, true);


--
-- TOC entry 3255 (class 0 OID 0)
-- Dependencies: 224
-- Name: institution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.institution_id_seq', 6, true);


--
-- TOC entry 3256 (class 0 OID 0)
-- Dependencies: 220
-- Name: institution_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.institution_type_id_seq', 1, true);


--
-- TOC entry 3257 (class 0 OID 0)
-- Dependencies: 214
-- Name: region_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.region_city_id_seq', 1, true);


--
-- TOC entry 3258 (class 0 OID 0)
-- Dependencies: 216
-- Name: region_district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.region_district_id_seq', 1, true);


--
-- TOC entry 3259 (class 0 OID 0)
-- Dependencies: 228
-- Name: speciality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.speciality_id_seq', 4, true);


--
-- TOC entry 3260 (class 0 OID 0)
-- Dependencies: 247
-- Name: templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.templates_id_seq', 1, true);


--
-- TOC entry 3261 (class 0 OID 0)
-- Dependencies: 218
-- Name: university_faculty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.university_faculty_id_seq', 1, true);


--
-- TOC entry 3262 (class 0 OID 0)
-- Dependencies: 222
-- Name: university_university_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.university_university_id_seq', 1, true);


--
-- TOC entry 2990 (class 2606 OID 26078)
-- Name: app_classtype app_classtype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_classtype
    ADD CONSTRAINT app_classtype_pkey PRIMARY KEY (id);


--
-- TOC entry 2986 (class 2606 OID 25979)
-- Name: app_operator app_operator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_operator
    ADD CONSTRAINT app_operator_pkey PRIMARY KEY (id);


--
-- TOC entry 2988 (class 2606 OID 25981)
-- Name: app_operator app_operator_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_operator
    ADD CONSTRAINT app_operator_user_id_key UNIQUE (user_id);


--
-- TOC entry 2995 (class 2606 OID 26123)
-- Name: app_staffoperator app_staffoperator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_staffoperator
    ADD CONSTRAINT app_staffoperator_pkey PRIMARY KEY (id);


--
-- TOC entry 2997 (class 2606 OID 26125)
-- Name: app_staffoperator app_staffoperator_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_staffoperator
    ADD CONSTRAINT app_staffoperator_user_id_key UNIQUE (user_id);


--
-- TOC entry 2899 (class 2606 OID 17037)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2904 (class 2606 OID 16757)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2907 (class 2606 OID 16710)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 16700)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2894 (class 2606 OID 16743)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2896 (class 2606 OID 16692)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2915 (class 2606 OID 16728)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2918 (class 2606 OID 16772)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2909 (class 2606 OID 16718)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2921 (class 2606 OID 16736)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2924 (class 2606 OID 16786)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2912 (class 2606 OID 17031)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2927 (class 2606 OID 16800)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2889 (class 2606 OID 16684)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2891 (class 2606 OID 16682)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 16674)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2982 (class 2606 OID 17046)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2979 (class 2606 OID 16969)
-- Name: doctor_function doctor_function_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_function
    ADD CONSTRAINT doctor_function_pkey PRIMARY KEY (id);


--
-- TOC entry 2975 (class 2606 OID 16961)
-- Name: doctor_knowledge doctor_knowledge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_knowledge
    ADD CONSTRAINT doctor_knowledge_pkey PRIMARY KEY (id);


--
-- TOC entry 2971 (class 2606 OID 16953)
-- Name: doctor_medical_candidate doctor_medical_candidate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_medical_candidate
    ADD CONSTRAINT doctor_medical_candidate_pkey PRIMARY KEY (id);


--
-- TOC entry 2952 (class 2606 OID 16904)
-- Name: doctor doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (id);


--
-- TOC entry 2967 (class 2606 OID 16945)
-- Name: doctor_specialization doctor_specialization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_specialization
    ADD CONSTRAINT doctor_specialization_pkey PRIMARY KEY (id);


--
-- TOC entry 2963 (class 2606 OID 16934)
-- Name: doctor_training doctor_training_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_training
    ADD CONSTRAINT doctor_training_pkey PRIMARY KEY (id);


--
-- TOC entry 2959 (class 2606 OID 16926)
-- Name: doctor_type doctor_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_type
    ADD CONSTRAINT doctor_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2948 (class 2606 OID 16867)
-- Name: institution institution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institution
    ADD CONSTRAINT institution_pkey PRIMARY KEY (id);


--
-- TOC entry 2940 (class 2606 OID 16846)
-- Name: institution_type institution_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institution_type
    ADD CONSTRAINT institution_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2930 (class 2606 OID 16820)
-- Name: cities region_city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT region_city_pkey PRIMARY KEY (id);


--
-- TOC entry 2933 (class 2606 OID 16828)
-- Name: districts region_district_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT region_district_pkey PRIMARY KEY (id);


--
-- TOC entry 2955 (class 2606 OID 16915)
-- Name: speciality speciality_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.speciality
    ADD CONSTRAINT speciality_pkey PRIMARY KEY (id);


--
-- TOC entry 2992 (class 2606 OID 26106)
-- Name: templates templates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.templates
    ADD CONSTRAINT templates_pkey PRIMARY KEY (id);


--
-- TOC entry 2936 (class 2606 OID 16838)
-- Name: university_faculty university_faculty_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_faculty
    ADD CONSTRAINT university_faculty_name_key UNIQUE (name);


--
-- TOC entry 2938 (class 2606 OID 16836)
-- Name: university_faculty university_faculty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_faculty
    ADD CONSTRAINT university_faculty_pkey PRIMARY KEY (id);


--
-- TOC entry 2943 (class 2606 OID 16856)
-- Name: university_university university_university_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_university
    ADD CONSTRAINT university_university_name_key UNIQUE (name);


--
-- TOC entry 2945 (class 2606 OID 16854)
-- Name: university_university university_university_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_university
    ADD CONSTRAINT university_university_pkey PRIMARY KEY (id);


--
-- TOC entry 2984 (class 1259 OID 25992)
-- Name: app_operator_institution_id_70581e32; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_operator_institution_id_70581e32 ON public.app_operator USING btree (institution_id);


--
-- TOC entry 2993 (class 1259 OID 26136)
-- Name: app_staffoperator_city_id_90aa04c2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_staffoperator_city_id_90aa04c2 ON public.app_staffoperator USING btree (city_id);


--
-- TOC entry 2897 (class 1259 OID 17038)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2902 (class 1259 OID 16758)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2905 (class 1259 OID 16759)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2892 (class 1259 OID 16744)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2913 (class 1259 OID 16774)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2916 (class 1259 OID 16773)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2919 (class 1259 OID 16788)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2922 (class 1259 OID 16787)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2910 (class 1259 OID 17032)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2925 (class 1259 OID 16811)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2928 (class 1259 OID 16812)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2980 (class 1259 OID 17048)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2983 (class 1259 OID 17047)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2977 (class 1259 OID 17029)
-- Name: doctor_function_doctor_id_37c54d48; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX doctor_function_doctor_id_37c54d48 ON public.doctor_function USING btree (doctor_id);


--
-- TOC entry 2972 (class 1259 OID 17021)
-- Name: doctor_knowledge_doctor_id_8f8d6f1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX doctor_knowledge_doctor_id_8f8d6f1b ON public.doctor_knowledge USING btree (doctor_id);


--
-- TOC entry 2973 (class 1259 OID 17022)
-- Name: doctor_knowledge_faculty_id_0f7501f2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX doctor_knowledge_faculty_id_0f7501f2 ON public.doctor_knowledge USING btree (faculty_id);


--
-- TOC entry 2976 (class 1259 OID 17023)
-- Name: doctor_knowledge_university_id_baae4801; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX doctor_knowledge_university_id_baae4801 ON public.doctor_knowledge USING btree (university_id);


--
-- TOC entry 2969 (class 1259 OID 17005)
-- Name: doctor_medical_candidate_doctor_id_79ae27f2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX doctor_medical_candidate_doctor_id_79ae27f2 ON public.doctor_medical_candidate USING btree (doctor_id);


--
-- TOC entry 2965 (class 1259 OID 16998)
-- Name: doctor_specialization_doctor_id_8afc867f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX doctor_specialization_doctor_id_8afc867f ON public.doctor_specialization USING btree (doctor_id);


--
-- TOC entry 2968 (class 1259 OID 16999)
-- Name: doctor_specialization_speciality_id_03da8505; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX doctor_specialization_speciality_id_03da8505 ON public.doctor_specialization USING btree (speciality_id);


--
-- TOC entry 2961 (class 1259 OID 16986)
-- Name: doctor_training_doctor_id_5a7cb80f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX doctor_training_doctor_id_5a7cb80f ON public.doctor_training USING btree (doctor_id);


--
-- TOC entry 2964 (class 1259 OID 16987)
-- Name: doctor_training_speciality_id_8ed9a2a9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX doctor_training_speciality_id_8ed9a2a9 ON public.doctor_training USING btree (speciality_id);


--
-- TOC entry 2956 (class 1259 OID 16975)
-- Name: doctor_type_doctor_id_83680c5f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX doctor_type_doctor_id_83680c5f ON public.doctor_type USING btree (doctor_id);


--
-- TOC entry 2957 (class 1259 OID 26093)
-- Name: doctor_type_name_id_0ae07973; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX doctor_type_name_id_0ae07973 ON public.doctor_type USING btree (name_id);


--
-- TOC entry 2960 (class 1259 OID 26087)
-- Name: doctor_type_type_id_16da7264; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX doctor_type_type_id_16da7264 ON public.doctor_type USING btree (type_id);


--
-- TOC entry 2953 (class 1259 OID 26015)
-- Name: doctor_work_place_id_68951303; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX doctor_work_place_id_68951303 ON public.doctor USING btree (work_place_id);


--
-- TOC entry 2946 (class 1259 OID 16891)
-- Name: institution_district_id_66fe9be1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX institution_district_id_66fe9be1 ON public.institution USING btree (district_id);


--
-- TOC entry 2949 (class 1259 OID 16892)
-- Name: institution_type_id_60ae8689; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX institution_type_id_60ae8689 ON public.institution USING btree (type_id);


--
-- TOC entry 2950 (class 1259 OID 16893)
-- Name: institution_user_id_9d99b7ce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX institution_user_id_9d99b7ce ON public.institution USING btree (user_id);


--
-- TOC entry 2931 (class 1259 OID 16873)
-- Name: region_district_city_id_8282fc2d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX region_district_city_id_8282fc2d ON public.districts USING btree (city_id);


--
-- TOC entry 2934 (class 1259 OID 16874)
-- Name: university_faculty_name_f1009798_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX university_faculty_name_f1009798_like ON public.university_faculty USING btree (name varchar_pattern_ops);


--
-- TOC entry 2941 (class 1259 OID 16875)
-- Name: university_university_name_da8a077f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX university_university_name_da8a077f_like ON public.university_university USING btree (name varchar_pattern_ops);


--
-- TOC entry 3024 (class 2606 OID 25982)
-- Name: app_operator app_operator_institution_id_70581e32_fk_institution_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_operator
    ADD CONSTRAINT app_operator_institution_id_70581e32_fk_institution_id FOREIGN KEY (institution_id) REFERENCES public.institution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3025 (class 2606 OID 25987)
-- Name: app_operator app_operator_user_id_0bb446cd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_operator
    ADD CONSTRAINT app_operator_user_id_0bb446cd_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3026 (class 2606 OID 26126)
-- Name: app_staffoperator app_staffoperator_city_id_90aa04c2_fk_cities_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_staffoperator
    ADD CONSTRAINT app_staffoperator_city_id_90aa04c2_fk_cities_id FOREIGN KEY (city_id) REFERENCES public.cities(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3027 (class 2606 OID 26131)
-- Name: app_staffoperator app_staffoperator_user_id_edae59d6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_staffoperator
    ADD CONSTRAINT app_staffoperator_user_id_edae59d6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3000 (class 2606 OID 16751)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2999 (class 2606 OID 16746)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2998 (class 2606 OID 16737)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3002 (class 2606 OID 16766)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3001 (class 2606 OID 16761)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3004 (class 2606 OID 16780)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3003 (class 2606 OID 16775)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3005 (class 2606 OID 16801)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3006 (class 2606 OID 16806)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3023 (class 2606 OID 17024)
-- Name: doctor_function doctor_function_doctor_id_37c54d48_fk_doctor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_function
    ADD CONSTRAINT doctor_function_doctor_id_37c54d48_fk_doctor_id FOREIGN KEY (doctor_id) REFERENCES public.doctor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3020 (class 2606 OID 17006)
-- Name: doctor_knowledge doctor_knowledge_doctor_id_8f8d6f1b_fk_doctor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_knowledge
    ADD CONSTRAINT doctor_knowledge_doctor_id_8f8d6f1b_fk_doctor_id FOREIGN KEY (doctor_id) REFERENCES public.doctor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3021 (class 2606 OID 17011)
-- Name: doctor_knowledge doctor_knowledge_faculty_id_0f7501f2_fk_university_faculty_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_knowledge
    ADD CONSTRAINT doctor_knowledge_faculty_id_0f7501f2_fk_university_faculty_id FOREIGN KEY (faculty_id) REFERENCES public.university_faculty(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3022 (class 2606 OID 17016)
-- Name: doctor_knowledge doctor_knowledge_university_id_baae4801_fk_universit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_knowledge
    ADD CONSTRAINT doctor_knowledge_university_id_baae4801_fk_universit FOREIGN KEY (university_id) REFERENCES public.university_university(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3019 (class 2606 OID 17000)
-- Name: doctor_medical_candidate doctor_medical_candidate_doctor_id_79ae27f2_fk_doctor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_medical_candidate
    ADD CONSTRAINT doctor_medical_candidate_doctor_id_79ae27f2_fk_doctor_id FOREIGN KEY (doctor_id) REFERENCES public.doctor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3017 (class 2606 OID 16988)
-- Name: doctor_specialization doctor_specialization_doctor_id_8afc867f_fk_doctor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_specialization
    ADD CONSTRAINT doctor_specialization_doctor_id_8afc867f_fk_doctor_id FOREIGN KEY (doctor_id) REFERENCES public.doctor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3018 (class 2606 OID 16993)
-- Name: doctor_specialization doctor_specialization_speciality_id_03da8505_fk_speciality_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_specialization
    ADD CONSTRAINT doctor_specialization_speciality_id_03da8505_fk_speciality_id FOREIGN KEY (speciality_id) REFERENCES public.speciality(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3015 (class 2606 OID 16976)
-- Name: doctor_training doctor_training_doctor_id_5a7cb80f_fk_doctor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_training
    ADD CONSTRAINT doctor_training_doctor_id_5a7cb80f_fk_doctor_id FOREIGN KEY (doctor_id) REFERENCES public.doctor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3016 (class 2606 OID 16981)
-- Name: doctor_training doctor_training_speciality_id_8ed9a2a9_fk_speciality_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_training
    ADD CONSTRAINT doctor_training_speciality_id_8ed9a2a9_fk_speciality_id FOREIGN KEY (speciality_id) REFERENCES public.speciality(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3012 (class 2606 OID 16970)
-- Name: doctor_type doctor_type_doctor_id_83680c5f_fk_doctor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_type
    ADD CONSTRAINT doctor_type_doctor_id_83680c5f_fk_doctor_id FOREIGN KEY (doctor_id) REFERENCES public.doctor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3014 (class 2606 OID 26094)
-- Name: doctor_type doctor_type_name_id_0ae07973_fk_speciality_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_type
    ADD CONSTRAINT doctor_type_name_id_0ae07973_fk_speciality_id FOREIGN KEY (name_id) REFERENCES public.speciality(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3013 (class 2606 OID 26088)
-- Name: doctor_type doctor_type_type_id_16da7264_fk_app_classtype_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_type
    ADD CONSTRAINT doctor_type_type_id_16da7264_fk_app_classtype_id FOREIGN KEY (type_id) REFERENCES public.app_classtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3011 (class 2606 OID 26021)
-- Name: doctor doctor_work_place_id_68951303_fk_institution_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_work_place_id_68951303_fk_institution_id FOREIGN KEY (work_place_id) REFERENCES public.institution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3008 (class 2606 OID 16876)
-- Name: institution institution_district_id_66fe9be1_fk_region_district_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institution
    ADD CONSTRAINT institution_district_id_66fe9be1_fk_region_district_id FOREIGN KEY (district_id) REFERENCES public.districts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3009 (class 2606 OID 16881)
-- Name: institution institution_type_id_60ae8689_fk_institution_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institution
    ADD CONSTRAINT institution_type_id_60ae8689_fk_institution_type_id FOREIGN KEY (type_id) REFERENCES public.institution_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3010 (class 2606 OID 16886)
-- Name: institution institution_user_id_9d99b7ce_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institution
    ADD CONSTRAINT institution_user_id_9d99b7ce_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3007 (class 2606 OID 16868)
-- Name: districts region_district_city_id_8282fc2d_fk_region_city_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT region_district_city_id_8282fc2d_fk_region_city_id FOREIGN KEY (city_id) REFERENCES public.cities(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2019-08-22 03:06:07

--
-- PostgreSQL database dump complete
--

