--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17
-- Dumped by pg_dump version 17.0

-- Started on 2025-09-22 21:06:46 CEST

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 16664)
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    id integer NOT NULL,
    name character varying(20),
    surname character varying(20),
    description character varying(200),
    photo character varying(20)
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16667)
-- Name: admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_id_seq OWNER TO postgres;

--
-- TOC entry 3704 (class 0 OID 0)
-- Dependencies: 210
-- Name: admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;


--
-- TOC entry 211 (class 1259 OID 16668)
-- Name: holiday_packages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.holiday_packages (
    id integer NOT NULL,
    destination character varying(25),
    price double precision,
    departure date,
    info character varying(200),
    days integer,
    photo character varying(200)
);


ALTER TABLE public.holiday_packages OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16671)
-- Name: holiday_packages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.holiday_packages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.holiday_packages_id_seq OWNER TO postgres;

--
-- TOC entry 3705 (class 0 OID 0)
-- Dependencies: 212
-- Name: holiday_packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.holiday_packages_id_seq OWNED BY public.holiday_packages.id;


--
-- TOC entry 213 (class 1259 OID 16676)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    username character varying(20) NOT NULL,
    password character varying(20),
    name character varying(50),
    surname character varying(50),
    email character varying(50),
    city character varying(25),
    fav_city character varying(25),
    photo character varying(200),
    age integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3546 (class 2604 OID 16679)
-- Name: admin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);


--
-- TOC entry 3547 (class 2604 OID 16680)
-- Name: holiday_packages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holiday_packages ALTER COLUMN id SET DEFAULT nextval('public.holiday_packages_id_seq'::regclass);


--
-- TOC entry 3693 (class 0 OID 16664)
-- Dependencies: 209
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (id, name, surname, description, photo) FROM stdin;
1	Diego	Serra	Appassionato Apple da sempre: se non è della mela, non lo guarda nemmeno. Il suo sogno? Fare colazione con Tim Cook.	diego.png
2	Giulia	Cannata	Esperta di make-up e outfit impeccabili. Riesce a coordinare rossetto e CSS con una precisione disarmante.	giulia.png
3	Michele	Chillotti	Lazza nel cuore, cuffie sempre in testa. Se non lo trovi al computer, è perché sta imparando a memoria ogni barra del suo idolo.	michele.png
4	Matteo	Manai	Ama i motori più del caffè. Se sente un rombo in lontananza, lascia anche una riunione Zoom pur di guardare che macchina è.	matteo.png
\.


--
-- TOC entry 3695 (class 0 OID 16668)
-- Dependencies: 211
-- Data for Name: holiday_packages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.holiday_packages (id, destination, price, departure, info, days, photo) FROM stdin;
1	New York City	1499	2025-09-15	Metropoli vivace e cosmopolita, famosa per grattacieli iconici, Times Square, Central Park e una scena culturale e artistica che la rende la “città che non dorme mai”	5	nyc.png
2	Roma	899.99	2022-10-02	Capitale d’Italia, ricca di storia e arte, con il Colosseo, il Vaticano e la Fontana di Trevi. Unisce passato e presente in un’atmosfera unica	7	rome.png
3	Tokyo	1340.5	2024-11-10	Capitale del Giappone che fonde tradizione e modernità, tra templi antichi, grattacieli futuristici, cucina rinomata e cultura pop vivace	15	tokyo.png
5	Sydney	1190.75	2026-01-05	Città australiana famosa per l’Opera House, il Sydney Harbour Bridge e le sue splendide spiagge, unendo natura, cultura e vita urbana	10	sydney.png
4	Città del Messico	980	2025-12-01	Cuore coloniale dell’America Latina, unisce storia azteca e coloniale a musei di fama mondiale, mercati vivaci e una ricca cultura artistica piena di colori e tradizioni	13	mexcity.png
\.


--
-- TOC entry 3697 (class 0 OID 16676)
-- Dependencies: 213
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (username, password, name, surname, email, city, fav_city, photo, age) FROM stdin;
serra	66505	Diego	Serra	d.serra126@studenti.unica.it	Cagliari	New York City	diego.png	20
chillotti	66441	Michele	Chillotti	m.chillotti22@studenti.unica.it	Sinnai	Tokyo	michele.png	21
cannata	66464	Giulia	Cannata	g.cannata4@studenti.unica.it	Quartu S.E.	Verona	giulia.png	20
manai	66438	Matteo	Manai	m.manai22@studenti.unica.it	Quartu S.E.	Barcellona	matteo.png	20
\.


--
-- TOC entry 3706 (class 0 OID 0)
-- Dependencies: 210
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_id_seq', 4, true);


--
-- TOC entry 3707 (class 0 OID 0)
-- Dependencies: 212
-- Name: holiday_packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.holiday_packages_id_seq', 10, true);


--
-- TOC entry 3549 (class 2606 OID 16683)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- TOC entry 3551 (class 2606 OID 16685)
-- Name: holiday_packages holiday_packages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holiday_packages
    ADD CONSTRAINT holiday_packages_pkey PRIMARY KEY (id);


--
-- TOC entry 3553 (class 2606 OID 16689)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- TOC entry 3703 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2025-09-22 21:06:46 CEST

--
-- PostgreSQL database dump complete
--

