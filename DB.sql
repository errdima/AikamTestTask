--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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

--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1251' LC_CTYPE = 'English_United States.1251';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    price integer NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: purchase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase (
    id integer NOT NULL,
    "customer_ID" integer NOT NULL,
    "product_ID" integer NOT NULL,
    date date NOT NULL
);


ALTER TABLE public.purchase OWNER TO postgres;

--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customers VALUES (1, 'Lydia', 'Uridge');
INSERT INTO public.customers VALUES (2, 'Hadria', 'Kupis');
INSERT INTO public.customers VALUES (3, 'Burk', 'Crutchley');
INSERT INTO public.customers VALUES (4, 'Boigie', 'Darbey');
INSERT INTO public.customers VALUES (5, 'Barclay', 'Kupis');
INSERT INTO public.customers VALUES (6, 'Gabriela', 'Dilleway');
INSERT INTO public.customers VALUES (7, 'Fidelio', 'Villa');
INSERT INTO public.customers VALUES (8, 'Flint', 'Swinyard');
INSERT INTO public.customers VALUES (9, 'Juliane', 'Devenish');
INSERT INTO public.customers VALUES (10, 'Scot', 'Palk');
INSERT INTO public.customers VALUES (11, 'Lora', 'Dorkin');
INSERT INTO public.customers VALUES (12, 'Wilhelmine', 'Le Provest');
INSERT INTO public.customers VALUES (13, 'Kelbee', 'Dickerson');
INSERT INTO public.customers VALUES (14, 'Serge', 'Manston');
INSERT INTO public.customers VALUES (15, 'Rhea', 'Kupis');
INSERT INTO public.customers VALUES (16, 'Ebeneser', 'Jakubovski');
INSERT INTO public.customers VALUES (17, 'Concordia', 'Acutt');
INSERT INTO public.customers VALUES (18, 'Maybelle', 'Gurling');
INSERT INTO public.customers VALUES (19, 'Minette', 'Pleming');
INSERT INTO public.customers VALUES (20, 'Dorri', 'Solleme');
INSERT INTO public.customers VALUES (21, 'Cam', 'Berntssen');
INSERT INTO public.customers VALUES (22, 'Janelle', 'Abarough');
INSERT INTO public.customers VALUES (23, 'Niels', 'Livingstone');
INSERT INTO public.customers VALUES (24, 'Rafael', 'Berndsen');
INSERT INTO public.customers VALUES (25, 'Mart', 'Mc Menamin');
INSERT INTO public.customers VALUES (26, 'Garik', 'Follan');
INSERT INTO public.customers VALUES (27, 'Durward', 'Solleme');
INSERT INTO public.customers VALUES (28, 'Nani', 'Askie');
INSERT INTO public.customers VALUES (29, 'Analise', 'Piell');
INSERT INTO public.customers VALUES (30, 'Hadrian', 'Travers');
INSERT INTO public.customers VALUES (31, 'Maddi', 'Walton');
INSERT INTO public.customers VALUES (32, 'Emmalyn', 'Lingner');
INSERT INTO public.customers VALUES (33, 'Otes', 'Kupis');
INSERT INTO public.customers VALUES (34, 'Rolf', 'Solleme');
INSERT INTO public.customers VALUES (35, 'Jewel', 'Rich');
INSERT INTO public.customers VALUES (36, 'Deirdre', 'Kinghorne');
INSERT INTO public.customers VALUES (37, 'Laurie', 'Collyns');
INSERT INTO public.customers VALUES (38, 'Mariya', 'Bent');
INSERT INTO public.customers VALUES (39, 'Melonie', 'Gyford');
INSERT INTO public.customers VALUES (40, 'Bengt', 'Rehm');
INSERT INTO public.customers VALUES (41, 'Umberto', 'Ostridge');
INSERT INTO public.customers VALUES (42, 'Gloriane', 'Gobert');
INSERT INTO public.customers VALUES (43, 'Nariko', 'Orman');
INSERT INTO public.customers VALUES (44, 'Kennith', 'Donovan');
INSERT INTO public.customers VALUES (45, 'Godard', 'McGuiney');
INSERT INTO public.customers VALUES (46, 'Alric', 'Leipoldt');
INSERT INTO public.customers VALUES (47, 'Ulysses', 'Pott');
INSERT INTO public.customers VALUES (48, 'Vinnie', 'Giorgioni');
INSERT INTO public.customers VALUES (49, 'Worthy', 'Gorler');
INSERT INTO public.customers VALUES (50, 'Chance', 'Tommeo');


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products VALUES (1, 'Pepper - Cubanelle', 96);
INSERT INTO public.products VALUES (2, 'Compound - Passion Fruit', 75);
INSERT INTO public.products VALUES (3, 'Coffee - Hazelnut Cream', 99);
INSERT INTO public.products VALUES (4, 'Icecream Bar - Del Monte', 78);
INSERT INTO public.products VALUES (5, 'External Supplier', 75);
INSERT INTO public.products VALUES (6, 'Chicken - Whole', 78);
INSERT INTO public.products VALUES (7, 'Milkettes - 2%', 67);
INSERT INTO public.products VALUES (8, 'Ginger - Pickled', 55);
INSERT INTO public.products VALUES (9, 'Cheese Cloth No 100', 55);
INSERT INTO public.products VALUES (10, 'Wine - Red, Colio Cabernet', 95);
INSERT INTO public.products VALUES (11, 'Compound - Mocha', 56);
INSERT INTO public.products VALUES (12, 'Rice - Basmati', 72);
INSERT INTO public.products VALUES (13, 'Sour Cream', 100);
INSERT INTO public.products VALUES (14, 'Pesto - Primerba, Paste', 72);
INSERT INTO public.products VALUES (15, 'Juice - Tomato, 10 Oz', 59);
INSERT INTO public.products VALUES (16, 'Mace', 71);
INSERT INTO public.products VALUES (17, 'Juice - Apple, 341 Ml', 81);
INSERT INTO public.products VALUES (18, 'Apple - Delicious, Golden', 54);
INSERT INTO public.products VALUES (19, 'Bread - Rolls, Rye', 67);
INSERT INTO public.products VALUES (20, 'Cassis', 57);
INSERT INTO public.products VALUES (21, 'Avocado', 81);
INSERT INTO public.products VALUES (22, 'Beans - Yellow', 54);
INSERT INTO public.products VALUES (23, 'Taro Leaves', 72);
INSERT INTO public.products VALUES (24, 'Spinach - Spinach Leaf', 59);
INSERT INTO public.products VALUES (25, 'Nescafe - Frothy French Vanilla', 81);
INSERT INTO public.products VALUES (26, 'Foam Cup 6 Oz', 78);
INSERT INTO public.products VALUES (27, 'Calypso - Lemonade', 60);
INSERT INTO public.products VALUES (28, 'Melon - Cantaloupe', 57);
INSERT INTO public.products VALUES (29, 'Pimento - Canned', 74);
INSERT INTO public.products VALUES (30, 'Split Peas - Yellow, Dry', 82);
INSERT INTO public.products VALUES (31, 'Pie Filling - Apple', 63);
INSERT INTO public.products VALUES (32, 'Wine - Baron De Rothschild', 88);
INSERT INTO public.products VALUES (33, 'Tea - Camomele', 82);
INSERT INTO public.products VALUES (34, 'Hand Towel', 86);
INSERT INTO public.products VALUES (35, 'Wine - Taylors Reserve', 85);
INSERT INTO public.products VALUES (36, 'Stock - Veal, Brown', 61);
INSERT INTO public.products VALUES (37, 'Chinese Lemon Pork', 50);
INSERT INTO public.products VALUES (38, 'Cabbage - Red', 73);
INSERT INTO public.products VALUES (39, 'Sea Urchin', 56);
INSERT INTO public.products VALUES (40, 'Wine - White Cab Sauv.on', 87);
INSERT INTO public.products VALUES (41, 'Oil - Safflower', 61);
INSERT INTO public.products VALUES (42, 'Poppy Seed', 65);
INSERT INTO public.products VALUES (43, 'Remy Red Berry Infusion', 62);
INSERT INTO public.products VALUES (44, 'Wine - Wyndham Estate Bin 777', 83);
INSERT INTO public.products VALUES (45, 'Vaccum Bag 10x13', 100);
INSERT INTO public.products VALUES (46, 'Sauce Bbq Smokey', 60);
INSERT INTO public.products VALUES (47, 'Tilapia - Fillets', 67);
INSERT INTO public.products VALUES (48, 'Cheese - Swiss Sliced', 79);
INSERT INTO public.products VALUES (49, 'Banana Turning', 70);
INSERT INTO public.products VALUES (50, 'Red Cod Fillets - 225g', 74);


--
-- Data for Name: purchase; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.purchase VALUES (1, 13, 39, '2020-05-12');
INSERT INTO public.purchase VALUES (2, 44, 49, '2020-05-08');
INSERT INTO public.purchase VALUES (3, 28, 15, '2020-05-12');
INSERT INTO public.purchase VALUES (4, 42, 20, '2020-05-18');
INSERT INTO public.purchase VALUES (5, 34, 16, '2020-05-15');
INSERT INTO public.purchase VALUES (6, 37, 40, '2020-05-30');
INSERT INTO public.purchase VALUES (7, 10, 36, '2020-05-08');
INSERT INTO public.purchase VALUES (9, 11, 45, '2020-05-28');
INSERT INTO public.purchase VALUES (10, 27, 27, '2020-05-24');
INSERT INTO public.purchase VALUES (11, 38, 1, '2020-05-06');
INSERT INTO public.purchase VALUES (12, 48, 23, '2020-05-28');
INSERT INTO public.purchase VALUES (13, 12, 25, '2020-05-24');
INSERT INTO public.purchase VALUES (14, 44, 33, '2020-05-22');
INSERT INTO public.purchase VALUES (15, 30, 33, '2020-05-11');
INSERT INTO public.purchase VALUES (17, 33, 4, '2020-05-26');
INSERT INTO public.purchase VALUES (18, 48, 42, '2020-05-09');
INSERT INTO public.purchase VALUES (19, 41, 21, '2020-05-11');
INSERT INTO public.purchase VALUES (20, 50, 45, '2020-05-26');
INSERT INTO public.purchase VALUES (21, 42, 41, '2020-05-05');
INSERT INTO public.purchase VALUES (22, 33, 7, '2020-05-22');
INSERT INTO public.purchase VALUES (23, 12, 6, '2020-05-09');
INSERT INTO public.purchase VALUES (24, 18, 45, '2020-05-11');
INSERT INTO public.purchase VALUES (25, 33, 12, '2020-05-15');
INSERT INTO public.purchase VALUES (26, 26, 1, '2020-05-11');
INSERT INTO public.purchase VALUES (27, 6, 45, '2020-05-16');
INSERT INTO public.purchase VALUES (28, 38, 29, '2020-05-10');
INSERT INTO public.purchase VALUES (29, 26, 24, '2020-05-03');
INSERT INTO public.purchase VALUES (30, 23, 8, '2020-05-29');
INSERT INTO public.purchase VALUES (31, 40, 26, '2020-05-08');
INSERT INTO public.purchase VALUES (32, 49, 40, '2020-05-16');
INSERT INTO public.purchase VALUES (33, 43, 44, '2020-05-20');
INSERT INTO public.purchase VALUES (34, 32, 34, '2020-05-09');
INSERT INTO public.purchase VALUES (35, 46, 9, '2020-05-29');
INSERT INTO public.purchase VALUES (36, 29, 20, '2020-05-15');
INSERT INTO public.purchase VALUES (37, 39, 23, '2020-05-24');
INSERT INTO public.purchase VALUES (38, 3, 27, '2020-05-08');
INSERT INTO public.purchase VALUES (39, 30, 11, '2020-05-04');
INSERT INTO public.purchase VALUES (40, 9, 10, '2020-05-03');
INSERT INTO public.purchase VALUES (41, 12, 1, '2020-05-11');
INSERT INTO public.purchase VALUES (42, 44, 38, '2020-05-19');
INSERT INTO public.purchase VALUES (43, 26, 7, '2020-05-13');
INSERT INTO public.purchase VALUES (44, 46, 15, '2020-05-18');
INSERT INTO public.purchase VALUES (45, 19, 50, '2020-05-04');
INSERT INTO public.purchase VALUES (46, 3, 36, '2020-05-17');
INSERT INTO public.purchase VALUES (47, 49, 24, '2020-05-08');
INSERT INTO public.purchase VALUES (48, 15, 32, '2020-05-04');
INSERT INTO public.purchase VALUES (49, 48, 41, '2020-05-15');
INSERT INTO public.purchase VALUES (50, 33, 36, '2020-05-03');
INSERT INTO public.purchase VALUES (16, 12, 25, '2020-05-24');
INSERT INTO public.purchase VALUES (8, 12, 25, '2020-05-29');


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
-- Name: customers customers_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_id_key UNIQUE (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: purchase id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- Name: products products_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_id_key UNIQUE (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: purchase customer_ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT "customer_ID" FOREIGN KEY ("customer_ID") REFERENCES public.customers(id);


--
-- Name: purchase product_ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT "product_ID" FOREIGN KEY ("product_ID") REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--

