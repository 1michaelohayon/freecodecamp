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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size numeric,
    age numeric,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: keys; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.keys (
    keys_id integer NOT NULL,
    name character varying(30) NOT NULL,
    key_value character varying(24)
);


ALTER TABLE public.keys OWNER TO freecodecamp;

--
-- Name: keys_key_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.keys_key_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.keys_key_id_seq OWNER TO freecodecamp;

--
-- Name: keys_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.keys_key_id_seq OWNED BY public.keys.keys_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_planet integer,
    planet_id integer,
    weight numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_water boolean,
    star_id integer,
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    resources text,
    reachable boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: keys keys_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.keys ALTER COLUMN keys_id SET DEFAULT nextval('public.keys_key_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Blade', 53463463, 5376363, 'silvery in the shape of a blade');
INSERT INTO public.galaxy VALUES (2, 'Big Red', 99363267221, 543735, 'Biggest and fast expanding');
INSERT INTO public.galaxy VALUES (3, 'HDCE', 94367221, 43543735, 'Mostly gas and oil');
INSERT INTO public.galaxy VALUES (4, 'asFASF', 5465473, 758433, 'The entrance to the recursive Triangle');
INSERT INTO public.galaxy VALUES (5, 'Number Seven', 7777777, 9593432562, 'Unusual Size despite being the oldest galaxy some theorieze it to be the location of the mythtical ark');
INSERT INTO public.galaxy VALUES (6, 'Small hub', 3, 12, 'Artfical');


--
-- Data for Name: keys; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.keys VALUES (1, 'sadasd', NULL);
INSERT INTO public.keys VALUES (2, 'sadsa', NULL);
INSERT INTO public.keys VALUES (3, 'sadsadsadfg', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'sasada', NULL, 2, NULL);
INSERT INTO public.moon VALUES (2, 'dsadssadaa', NULL, 3, NULL);
INSERT INTO public.moon VALUES (3, 'dasadsd', NULL, 1, NULL);
INSERT INTO public.moon VALUES (4, 'asaddsafv', NULL, 1, NULL);
INSERT INTO public.moon VALUES (5, 'saadsdsadsad', NULL, 5, NULL);
INSERT INTO public.moon VALUES (6, '3dfaedsfse', NULL, 2, NULL);
INSERT INTO public.moon VALUES (7, 'sdafasasada', NULL, 2, NULL);
INSERT INTO public.moon VALUES (8, 'sadfdsadssadaa', NULL, 4, NULL);
INSERT INTO public.moon VALUES (9, 'sadasadsd', NULL, 3, NULL);
INSERT INTO public.moon VALUES (10, 'asdddsafv', NULL, 1, NULL);
INSERT INTO public.moon VALUES (11, 'sadaadsdsadsad', NULL, 7, NULL);
INSERT INTO public.moon VALUES (12, 'sad3dfaedsfse', NULL, 3, NULL);
INSERT INTO public.moon VALUES (13, 'sfgdb4afasasada', NULL, 2, NULL);
INSERT INTO public.moon VALUES (14, 'fgbdfdsadssadaa', NULL, 12, NULL);
INSERT INTO public.moon VALUES (15, 'sadadasadsd', NULL, 9, NULL);
INSERT INTO public.moon VALUES (16, 'dasfasdddsafv', NULL, 1, NULL);
INSERT INTO public.moon VALUES (17, 'saddaadsdsadsad', NULL, 6, NULL);
INSERT INTO public.moon VALUES (18, 'sadd3dfaedsfse', NULL, 8, NULL);
INSERT INTO public.moon VALUES (19, 'ghngdb4afasasada', NULL, 7, NULL);
INSERT INTO public.moon VALUES (20, 'hngdfdsadssadaa', NULL, 9, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'safa', NULL, 3, NULL);
INSERT INTO public.planet VALUES (2, 'sasada', NULL, 2, NULL);
INSERT INTO public.planet VALUES (3, 'sadsadsa', NULL, 3, NULL);
INSERT INTO public.planet VALUES (4, 'sadasd', NULL, 1, NULL);
INSERT INTO public.planet VALUES (5, 'sadsafv', NULL, 1, NULL);
INSERT INTO public.planet VALUES (6, 'sadsadsad', NULL, 5, NULL);
INSERT INTO public.planet VALUES (7, 'dsfaedsfse', NULL, 2, NULL);
INSERT INTO public.planet VALUES (8, 'sada', NULL, 2, NULL);
INSERT INTO public.planet VALUES (9, 'dsadsa', NULL, 3, NULL);
INSERT INTO public.planet VALUES (10, 'dasd', NULL, 1, NULL);
INSERT INTO public.planet VALUES (11, 'adsafv', NULL, 1, NULL);
INSERT INTO public.planet VALUES (12, 'sdsadsad', NULL, 5, NULL);
INSERT INTO public.planet VALUES (13, 'faedsfse', NULL, 2, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'zafon', NULL, NULL, NULL, 5);
INSERT INTO public.star VALUES (2, 'migdal', NULL, NULL, NULL, 3);
INSERT INTO public.star VALUES (3, 'sefach', NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (4, 'shen', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (5, 'chamania', NULL, NULL, NULL, 4);
INSERT INTO public.star VALUES (6, 'dgajifa', NULL, NULL, NULL, 3);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: keys_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.keys_key_id_seq', 3, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: keys keys_key_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.keys
    ADD CONSTRAINT keys_key_id_key UNIQUE (keys_id);


--
-- Name: keys keys_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.keys
    ADD CONSTRAINT keys_pkey PRIMARY KEY (keys_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

