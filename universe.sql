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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_discovered integer,
    meaning character varying(50) NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    meaning text NOT NULL,
    is_visible_to_naked_eye boolean NOT NULL,
    near_galaxies character varying(30),
    constellation_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_discovered integer,
    diameter_in_km integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    orbital_period_in_years numeric(7,2) NOT NULL,
    rotation_period_in_years numeric(5,2),
    has_moon boolean NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_in_light_years numeric(5,2) NOT NULL,
    brightness_of_star numeric(3,2) NOT NULL,
    approval_date date,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Aquarius', NULL, 'los mejores', 10);
INSERT INTO public.constellation VALUES (2, 'Virgo', NULL, 'los que no la ponen', 8);
INSERT INTO public.constellation VALUES (3, 'Libra', NULL, 'los laburantes', 10);
INSERT INTO public.constellation VALUES (4, 'Taurus', NULL, 'patadelana', 8);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'andromeda', 'diosa de la perdición', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'via lactea', 'diosa de la leche', true, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'feromon', 'diosa de los pokemones', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Docker', 'dios de las buenas practicas', true, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Este curso', 'Dios de las buenas practicas sin ayudarte mucho', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'hola', 'chau', true, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'saturnbarz', 'gorillaz', true, 'tu señora', 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Pandora', 1877, 23, 1);
INSERT INTO public.moon VALUES (2, 'Lucuma', 2877, 2333, 2);
INSERT INTO public.moon VALUES (3, 'Fobal', 22877, 23333, 4);
INSERT INTO public.moon VALUES (5, 'Fifal', 1997, 22222, 5);
INSERT INTO public.moon VALUES (6, 'Calamitano', 1997, 22222, 12);
INSERT INTO public.moon VALUES (7, 'Calamitano1', 19972, 22225, 14);
INSERT INTO public.moon VALUES (8, 'o93egt', 2003, 22125, 13);
INSERT INTO public.moon VALUES (9, 'o93eg2t', 20043, 221225, 16);
INSERT INTO public.moon VALUES (10, 'o93eg22t', 210043, 221225, 15);
INSERT INTO public.moon VALUES (11, 'o93eg22ht', 2210043, 2221225, 8);
INSERT INTO public.moon VALUES (14, 'o93eg22hhfgdffgt', 23210043, 24221225, 5);
INSERT INTO public.moon VALUES (15, 'o93eg22hhgfgdffgt', 232100413, 242213225, 5);
INSERT INTO public.moon VALUES (16, 'o93eg22hhgfgdf2fgt', 2132100413, 2443225, 14);
INSERT INTO public.moon VALUES (18, 'o93eg22hhgfgfdf2fgt', 2413, 2225, 14);
INSERT INTO public.moon VALUES (19, 'o93eg22hhgfg54', 241333, 22225, 14);
INSERT INTO public.moon VALUES (20, 'o93eg22hhgfg5fgdgdg4', 2413133, 222325, 6);
INSERT INTO public.moon VALUES (22, 'o93sfsf4', 241332, 22234, 10);
INSERT INTO public.moon VALUES (24, 'o93sdfsf4', 241332, 22234, 13);
INSERT INTO public.moon VALUES (25, 'o93sdfsfsf4', 241332, 222334, 13);
INSERT INTO public.moon VALUES (26, 'o93sdfsfsf4d', 241332, 222334, 14);
INSERT INTO public.moon VALUES (27, 'o93sdfsfsfd4d', 241332, 222334, 2);
INSERT INTO public.moon VALUES (28, 'o93sdfsfsfdf4d', 241332, 222334, 4);
INSERT INTO public.moon VALUES (29, 'o93sdfsfsfdf4dd', 2413432, 2422334, 4);
INSERT INTO public.moon VALUES (30, 'o93sdfsfsfdf4dsdfsfsdd', 24134322, 24223334, 7);
INSERT INTO public.moon VALUES (31, 'o93sdfsfsfdf4dsdfsfsdfd', 24134322, 242233534, 10);
INSERT INTO public.moon VALUES (32, 'o93sdfsfsfdf4dsdfsfsdffd', 241334322, 224224, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.24, 58.65, false, 13);
INSERT INTO public.planet VALUES (2, 'Venus', 1.11, 23.43, true, 9);
INSERT INTO public.planet VALUES (4, 'Earth', 1.60, 243.80, true, 7);
INSERT INTO public.planet VALUES (5, 'Mars', 12.60, 223.80, true, 10);
INSERT INTO public.planet VALUES (6, 'Jupiter', 2.60, 223.80, false, 10);
INSERT INTO public.planet VALUES (7, 'Saturn', 0.51, 456.80, true, 8);
INSERT INTO public.planet VALUES (8, 'Uranus', 4.23, 46.25, false, 9);
INSERT INTO public.planet VALUES (10, 'Neptuno', 5.54, 80.93, true, 12);
INSERT INTO public.planet VALUES (11, 'Pluton', 15.54, 820.93, true, 12);
INSERT INTO public.planet VALUES (12, 'Pluto', 15.54, 820.93, false, 7);
INSERT INTO public.planet VALUES (13, 'Ceres', 35.24, 20.13, false, 7);
INSERT INTO public.planet VALUES (14, 'Orcus', 10.24, 23.13, false, 7);
INSERT INTO public.planet VALUES (15, 'Sorka', 20.15, 12.57, true, 10);
INSERT INTO public.planet VALUES (16, 'Lumen', 35.26, 14.38, false, 13);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'DADASpD', 29.99, 9.99, '1992-02-20', NULL);
INSERT INTO public.star VALUES (8, 'SDApDSA', 28.88, 2.90, '1992-02-21', NULL);
INSERT INTO public.star VALUES (9, 'asdapd', 19.87, 8.34, '1993-02-22', NULL);
INSERT INTO public.star VALUES (10, 'adaspda', 29.20, 2.82, '1995-02-23', NULL);
INSERT INTO public.star VALUES (11, 'asdadaps', 19.20, 3.22, '1994-02-25', NULL);
INSERT INTO public.star VALUES (12, 'pasdad', 20.70, 2.28, '1997-09-02', NULL);
INSERT INTO public.star VALUES (13, 'saddd', 23.23, 3.22, '1997-03-24', NULL);
INSERT INTO public.star VALUES (14, 'ASDAD', 30.02, 3.83, '1992-02-20', 4);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 32, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 14, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: constellation constellation_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
