--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6
-- Dumped by pg_dump version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)

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
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: main
--

COPY public.admin (id, username, roles, password) FROM stdin;
1	admin	["ROLE_ADMIN"]	$argon2id$v=19$m=65536,t=4,p=1$usBNow16SOnbIDBFjLXTrw$OY1FDz5g3cD5I8XlXvVXcknYfMQd4g5eep8QgsPZTB0
\.


--
-- Data for Name: conference; Type: TABLE DATA; Schema: public; Owner: main
--

COPY public.conference (id, city, year, is_international, slug) FROM stdin;
1	Amsterdam	2019	t	amsterdam2019
2	Paris	2020	f	paris2020
\.


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: main
--

COPY public.comment (id, conference_id, author, text, email, created_at, photo_filename, state) FROM stdin;
1	1	Fabien	This was a great conference.	fabien@example.com	2021-04-13 21:52:05	\N	published
2	1	Lucas	I think this one is going to be moderated.	lucas@example.com	2021-04-13 21:52:05	\N	submitted
\.


--
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: main
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20210323143952	2021-04-13 21:52:00	37
DoctrineMigrations\\Version20210328150011	2021-04-13 21:52:00	10
DoctrineMigrations\\Version20210328151840	2021-04-13 21:52:00	6
DoctrineMigrations\\Version20210329144145	2021-04-13 21:52:01	19
DoctrineMigrations\\Version20210413133155	2021-04-13 21:52:01	5
\.


--
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: main
--

SELECT pg_catalog.setval('public.admin_id_seq', 1, true);


--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: main
--

SELECT pg_catalog.setval('public.comment_id_seq', 2, true);


--
-- Name: conference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: main
--

SELECT pg_catalog.setval('public.conference_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

