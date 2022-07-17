--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_name character varying(40) NOT NULL,
    games integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('2', 1, 15);
INSERT INTO public.users VALUES ('cucu', 6, 4);
INSERT INTO public.users VALUES ('user_1658043963002', 2, 789);
INSERT INTO public.users VALUES ('user_1658044253899', 2, 469);
INSERT INTO public.users VALUES ('user_1658043691547', 2, 6);
INSERT INTO public.users VALUES ('user_1658043963003', 5, 412);
INSERT INTO public.users VALUES ('user_1658044526094', 2, 124);
INSERT INTO public.users VALUES ('user_1658043691548', 5, 6);
INSERT INTO public.users VALUES ('user_1658044253900', 5, 276);
INSERT INTO public.users VALUES ('user_1658044011777', 2, 728);
INSERT INTO public.users VALUES ('user_1658043759529', 2, 6);
INSERT INTO public.users VALUES ('user_1658044526095', 5, 188);
INSERT INTO public.users VALUES ('user_1658043759530', 5, 6);
INSERT INTO public.users VALUES ('user_1658044011778', 5, 36);
INSERT INTO public.users VALUES ('user_1658044266449', 2, 565);
INSERT INTO public.users VALUES ('user_1658043786408', 2, 276);
INSERT INTO public.users VALUES ('user_1658044266450', 5, 227);
INSERT INTO public.users VALUES ('user_1658044027104', 2, 13);
INSERT INTO public.users VALUES ('user_1658043786409', 5, 75);
INSERT INTO public.users VALUES ('user_1658044027105', 5, 121);
INSERT INTO public.users VALUES ('user_1658044358787', 2, 691);
INSERT INTO public.users VALUES ('user_1658044168040', 2, 185);
INSERT INTO public.users VALUES ('user_1658044358788', 5, 86);
INSERT INTO public.users VALUES ('user_1658044168041', 5, 226);
INSERT INTO public.users VALUES ('user_1658044413719', 2, 137);
INSERT INTO public.users VALUES ('user_1658044413720', 5, 162);
INSERT INTO public.users VALUES ('user_1658044421021', 2, 551);
INSERT INTO public.users VALUES ('user_1658044421022', 5, 316);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_name);


--
-- PostgreSQL database dump complete
--


