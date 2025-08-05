--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17
-- Dumped by pg_dump version 17.0

-- Started on 2025-08-04 22:21:54 CEST

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

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3716 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16607)
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
-- TOC entry 214 (class 1259 OID 16606)
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
-- TOC entry 3718 (class 0 OID 0)
-- Dependencies: 214
-- Name: admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;


--
-- TOC entry 209 (class 1259 OID 16572)
-- Name: holiday_packages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.holiday_packages (
    id integer NOT NULL,
    destination character varying(25),
    price double precision,
    departure timestamp without time zone,
    info character varying(200),
    days integer,
    photo character varying(200)
);


ALTER TABLE public.holiday_packages OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16575)
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
-- TOC entry 3719 (class 0 OID 0)
-- Dependencies: 210
-- Name: holiday_packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.holiday_packages_id_seq OWNED BY public.holiday_packages.id;


--
-- TOC entry 211 (class 1259 OID 16576)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    title character varying(25),
    comment character varying(200),
    stars integer,
    data timestamp without time zone,
    user_id character varying(20),
    holiday_id integer
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16579)
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO postgres;

--
-- TOC entry 3720 (class 0 OID 0)
-- Dependencies: 212
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- TOC entry 213 (class 1259 OID 16580)
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
    photo character varying(200)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3553 (class 2604 OID 16610)
-- Name: admin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);


--
-- TOC entry 3551 (class 2604 OID 16583)
-- Name: holiday_packages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holiday_packages ALTER COLUMN id SET DEFAULT nextval('public.holiday_packages_id_seq'::regclass);


--
-- TOC entry 3552 (class 2604 OID 16584)
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- TOC entry 3710 (class 0 OID 16607)
-- Dependencies: 215
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (id, name, surname, description, photo) FROM stdin;
1	Diego	Serra	Appassionato Apple da sempre: se non è della mela, non lo guarda nemmeno. Il suo sogno? Fare colazione con Tim Cook.	diego.png
2	Giulia	Cannata	Esperta di make-up e outfit impeccabili. Riesce a coordinare rossetto e CSS con una precisione disarmante.	giulia.png
3	Michele	Chillotti	Lazza nel cuore, cuffie sempre in testa. Se non lo trovi al computer, è perché sta imparando a memoria ogni barra del suo idolo.	chillo.png
4	Matteo	Manai	Ama i motori più del caffè. Se sente un rombo in lontananza, lascia anche una riunione Zoom pur di guardare che macchina è.	matte.png
\.


--
-- TOC entry 3704 (class 0 OID 16572)
-- Dependencies: 209
-- Data for Name: holiday_packages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.holiday_packages (id, destination, price, departure, info, days, photo) FROM stdin;
1	New York City	1499	2025-09-15 00:00:00	Scopri la città che non dorme mai con questo pacchetto di 5 giorni	5	NewYork.png
2	Roma	899.99	2022-10-02 00:00:00	Passeggia tra le meraviglie storiche della capitale italiana	7	Roma.png
3	Tokyo	1340.5	2024-11-10 00:00:00	Vivi l’atmosfera cosmopolita tra grattacieli e templi moderni	15	Tokyo.png
5	Sydney	1190.75	2026-01-05 00:00:00	Goditi il sole, le spiagge dorate e i ritmi rilassati dell’oceano	10	sidney.png
4	Città del Messico	980	2025-12-01 00:00:00	Esplora il cuore coloniale dell’America Latina tra cultura e colori	13	mc.png
\.


--
-- TOC entry 3706 (class 0 OID 16576)
-- Dependencies: 211
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, title, comment, stars, data, user_id, holiday_id) FROM stdin;
1	New York da sogno	Vacanza indimenticabile a New York! Tutto perfetto.	5	2025-08-01 00:00:00	diiegoserra	1
2	Roma intensa	Roma è stupenda, ma il pacchetto includeva troppe visite guidate.	4	2025-08-02 00:00:00	_giuliacannata	2
3	Tokyo indimenticabile	Esperienza a Tokyo davvero ben organizzata e ricca di sorprese.	5	2025-08-03 00:00:00	micheleechillotti	3
4	Sydney lontana	Sydney bella, ma il volo lunghissimo ha rovinato un po’ il mood.	3	2025-08-03 00:00:00	matte.manai	5
5	Servizio eccellente	Buon servizio e assistenza clienti molto efficiente.	4	2025-08-04 00:00:00	diiegoserra	4
\.


--
-- TOC entry 3708 (class 0 OID 16580)
-- Dependencies: 213
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (username, password, name, surname, email, city, fav_city, photo) FROM stdin;
diiegoserra	ogeid	Diego	Serra	diego.serra@falliti.com	Cagliari	New York City	diego.png
micheleechillotti	elehcim	Michele	Chillotti	michele.chillotti@falliti.com	Sinnai	Tokyo	michele.png
_giuliacannata	ailuig	Giulia	Cannata	giulia.cannata@falliti.com	Quartu S.E.	Verona	giulia.png
matte.manai	oettam	Matteo	Manai	matteo.manai@falliti.com	Quartu S.E.	Barcellona	matteo.png
\.


--
-- TOC entry 3721 (class 0 OID 0)
-- Dependencies: 214
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_id_seq', 4, true);


--
-- TOC entry 3722 (class 0 OID 0)
-- Dependencies: 210
-- Name: holiday_packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.holiday_packages_id_seq', 10, true);


--
-- TOC entry 3723 (class 0 OID 0)
-- Dependencies: 212
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 5, true);


--
-- TOC entry 3561 (class 2606 OID 16612)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- TOC entry 3555 (class 2606 OID 16586)
-- Name: holiday_packages holiday_packages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holiday_packages
    ADD CONSTRAINT holiday_packages_pkey PRIMARY KEY (id);


--
-- TOC entry 3557 (class 2606 OID 16588)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 3559 (class 2606 OID 16590)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- TOC entry 3562 (class 2606 OID 16591)
-- Name: reviews reviews_holiday_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_holiday_id_fkey FOREIGN KEY (holiday_id) REFERENCES public.holiday_packages(id);


--
-- TOC entry 3563 (class 2606 OID 16596)
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(username);


--
-- TOC entry 3564 (class 2606 OID 16601)
-- Name: reviews reviews_user_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey1 FOREIGN KEY (user_id) REFERENCES public.users(username);


--
-- TOC entry 3717 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2025-08-04 22:21:54 CEST

--
-- PostgreSQL database dump complete
--

