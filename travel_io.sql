--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17
-- Dumped by pg_dump version 17.0

-- Started on 2025-08-01 13:57:35 CEST

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3706 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16505)
-- Name: holiday_packages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.holiday_packages (
    id integer NOT NULL,
    price double precision,
    departure timestamp without time zone,
    info character varying(200),
    photo character varying(200),
    destination character varying(25)
);


ALTER TABLE public.holiday_packages OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16544)
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
-- TOC entry 3708 (class 0 OID 0)
-- Dependencies: 213
-- Name: holiday_packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.holiday_packages_id_seq OWNED BY public.holiday_packages.id;


--
-- TOC entry 212 (class 1259 OID 16513)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    stars integer,
    comment character varying(200),
    data timestamp without time zone,
    user_id character varying(20),
    holiday_id integer
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16512)
-- Name: recensioni_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recensioni_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recensioni_id_seq OWNER TO postgres;

--
-- TOC entry 3709 (class 0 OID 0)
-- Dependencies: 211
-- Name: recensioni_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recensioni_id_seq OWNED BY public.reviews.id;


--
-- TOC entry 209 (class 1259 OID 16502)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    username character varying(20) NOT NULL,
    password character varying(20),
    name character varying(50),
    surname character varying(50),
    email character varying(50),
    city character varying(25),
    photo character varying(200),
    fav_city character varying(25)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3546 (class 2604 OID 16545)
-- Name: holiday_packages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holiday_packages ALTER COLUMN id SET DEFAULT nextval('public.holiday_packages_id_seq'::regclass);


--
-- TOC entry 3547 (class 2604 OID 16516)
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.recensioni_id_seq'::regclass);


--
-- TOC entry 3697 (class 0 OID 16505)
-- Dependencies: 210
-- Data for Name: holiday_packages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.holiday_packages (id, price, departure, info, photo, destination) FROM stdin;
1   1499	2025-09-15 00:00:00	Scopri la città che non dorme mai con questo pacchetto di 5 giorni	NewYork.png	New York
2   899.99	2022-10-02 00:00:00	Passeggia tra le meraviglie storiche della capitale italiana	Roma.png	Roma
3   1340.5	2024-11-10 00:00:00	Vivi l’atmosfera cosmopolita tra grattacieli e templi moderni	Tokyo.png	Tokyo
4   980	2025-12-01 00:00:00	Esplora il cuore coloniale dell’America Latina tra cultura e colori	mc.png	Città del Messico
5   1190.75	2026-01-05 00:00:00	Goditi il sole, le spiagge dorate e i ritmi rilassati dell’oceano	sidney.png	Sydney
\.


--
-- TOC entry 3699 (class 0 OID 16513)
-- Dependencies: 212
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, stars, comment, data, user_id, holiday_id) FROM stdin;
1   5	Vacanza indimenticabile a New York! Tutto perfetto.	2025-08-01 00:00:00	diiegoserra	1
2	4	Roma è stupenda, ma il pacchetto includeva troppe visite guidate.	2025-08-02 00:00:00	_giuliacannata	2
3	5	Esperienza a Tokyo davvero ben organizzata e ricca di sorprese.	2025-08-03 00:00:00	micheleechillotti	3
4	3	Sydney bella, ma il volo lunghissimo ha rovinato un po’ il mood.	2025-08-03 00:00:00	matte.manai	5
5	4	Buon servizio e assistenza clienti molto efficiente.	2025-08-04 00:00:00	diiegoserra	4
\.


--
-- TOC entry 3696 (class 0 OID 16502)
-- Dependencies: 209
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (username, password, name, surname, email, city, photo, fav_city) FROM stdin;
diiegoserra	ogeid	Diego	Serra	diego.serra@falliti.com	Cagliari	diego.png	New York City
_giuliacannata	ailuig	Giulia	Cannata	giulia.cannata@falliti.com	Cagliari	giulia.png	Verona
micheleechillotti	elehcim	Michele	Chillotti	michele.chillotti@falliti.com	Sinnai	michele.png	Tokyo
matte.manai	oettam	Matteo	Manai	matteo.manai@falliti.com	Cagliari	matteo.png	Barcellona
\.


--
-- TOC entry 3710 (class 0 OID 0)
-- Dependencies: 213
-- Name: holiday_packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.holiday_packages_id_seq', 5, true);


--
-- TOC entry 3711 (class 0 OID 0)
-- Dependencies: 211
-- Name: recensioni_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recensioni_id_seq', 5, true);


--
-- TOC entry 3551 (class 2606 OID 16547)
-- Name: holiday_packages holiday_packages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holiday_packages
    ADD CONSTRAINT holiday_packages_pkey PRIMARY KEY (id);


--
-- TOC entry 3553 (class 2606 OID 16523)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 3549 (class 2606 OID 16509)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- TOC entry 3554 (class 2606 OID 16552)
-- Name: reviews reviews_holiday_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_holiday_id_fkey FOREIGN KEY (holiday_id) REFERENCES public.holiday_packages(id);


--
-- TOC entry 3555 (class 2606 OID 16517)
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(username);


--
-- TOC entry 3556 (class 2606 OID 16539)
-- Name: reviews reviews_user_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey1 FOREIGN KEY (user_id) REFERENCES public.users(username);


--
-- TOC entry 3707 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2025-08-01 13:57:36 CEST

--
-- PostgreSQL database dump complete
--

