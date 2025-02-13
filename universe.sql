--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(255) NOT NULL,
    size integer NOT NULL,
    distance numeric,
    has_life boolean NOT NULL,
    CONSTRAINT galaxy_name_not_null CHECK ((name IS NOT NULL))
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_facts; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_facts (
    galaxy_id integer NOT NULL,
    fun_facts text NOT NULL,
    galaxy_facts_id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.galaxy_facts OWNER TO freecodecamp;

--
-- Name: galaxy_facts_fact_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_facts_fact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_facts_fact_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_facts_fact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_facts_fact_id_seq OWNED BY public.galaxy_facts.galaxy_facts_id;


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
    name character varying(255) NOT NULL,
    planet_id integer,
    orbital_period integer NOT NULL,
    diameter numeric,
    is_inhabited boolean NOT NULL,
    CONSTRAINT moon_name_not_null CHECK ((name IS NOT NULL))
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
    name character varying(255) NOT NULL,
    star_id integer,
    mass integer NOT NULL,
    radius integer,
    has_rings boolean NOT NULL,
    CONSTRAINT planet_name_not_null CHECK ((name IS NOT NULL))
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
    name character varying(255) NOT NULL,
    galaxy_id integer,
    temperature integer,
    luminosity numeric,
    is_supernova boolean NOT NULL,
    CONSTRAINT star_name_not_null CHECK ((name IS NOT NULL))
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_facts galaxy_facts_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_facts ALTER COLUMN galaxy_facts_id SET DEFAULT nextval('public.galaxy_facts_fact_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 0, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 200000, 2200000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 50000, 3000000, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 120000, 3100000, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 90000, 2800000, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 110000, 3000000, true);


--
-- Data for Name: galaxy_facts; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_facts VALUES (1, 'Our home galalxy the milky way contains over 100 billion start and is part of the local group of galalxies', 1, NULL);
INSERT INTO public.galaxy_facts VALUES (2, 'the andromedea galalxy is the closest large galalxy to the milky way and is ona  collison course with our galaxy', 2, NULL);
INSERT INTO public.galaxy_facts VALUES (3, 'the triangulum galaxy is the thurd largest gallay in the local group and is located arond 3 million light years away', 3, NULL);
INSERT INTO public.galaxy_facts VALUES (4, 'the whirlpool galaxy M51 is famous for its distinctive spiral arms and insteracting with a smaller galalxy', 4, NULL);
INSERT INTO public.galaxy_facts VALUES (5, 'the sombrero galalxy is names for its appearance resembling a wide brimmed hat with a bridgt central bulge', 5, NULL);
INSERT INTO public.galaxy_facts VALUES (6, 'the pinwheel galaxy is a grand design spiral galaxy known for its well defined spiral arms.', 6, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 27, 3475, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 0, 22.4, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 1, 12.4, false);
INSERT INTO public.moon VALUES (4, 'Europa', 4, 4, 3121, true);
INSERT INTO public.moon VALUES (5, 'Titan', 5, 16, 5150, true);
INSERT INTO public.moon VALUES (6, 'Rhea', 5, 5, 1528, false);
INSERT INTO public.moon VALUES (7, 'Oberon', 6, 14, 1522, false);
INSERT INTO public.moon VALUES (8, 'Titania', 6, 9, 1578, true);
INSERT INTO public.moon VALUES (9, 'Miranda', 6, 1, 471.6, false);
INSERT INTO public.moon VALUES (10, 'Triton', 7, 6, 2706, true);
INSERT INTO public.moon VALUES (11, 'Io', 4, 2, 3643, true);
INSERT INTO public.moon VALUES (12, 'Callisto', 4, 17, 4821, false);
INSERT INTO public.moon VALUES (13, 'Ganymede', 4, 7, 5268, true);
INSERT INTO public.moon VALUES (14, 'Mimas', 5, 1, 396.0, false);
INSERT INTO public.moon VALUES (15, 'Enceladus', 5, 1, 504.0, true);
INSERT INTO public.moon VALUES (16, 'Iapetus', 5, 79, 1469, false);
INSERT INTO public.moon VALUES (17, 'Phoebe', 5, 550, 213, false);
INSERT INTO public.moon VALUES (18, 'Charon', 9, 6, 1207, true);
INSERT INTO public.moon VALUES (19, 'Leda', 6, 7, 14.5, false);
INSERT INTO public.moon VALUES (20, 'Hyperion', 5, 21, 270, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 5973, 6371, false);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 641, 3389, false);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 4868, 6051, false);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, 1898200, 69911, true);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, 568460, 58232, true);
INSERT INTO public.planet VALUES (6, 'Uranus', 1, 86810, 25362, true);
INSERT INTO public.planet VALUES (7, 'Neptune', 1, 102410, 24622, true);
INSERT INTO public.planet VALUES (8, 'Mercury', 1, 330, 2439, false);
INSERT INTO public.planet VALUES (9, 'Gliese 581g', 2, 5, 16000, false);
INSERT INTO public.planet VALUES (10, 'Kepler 22b', 3, 3, 14000, false);
INSERT INTO public.planet VALUES (11, 'Proxima b', 3, 1, 11600, false);
INSERT INTO public.planet VALUES (12, 'Trappist-1e', 3, 1, 12100, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, 1.0, false);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940, 25.0, false);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 5790, 1.5, false);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, 3500, 100000.0, true);
INSERT INTO public.star VALUES (5, 'Rigel', 2, 12000, 10000.0, false);
INSERT INTO public.star VALUES (6, 'Vega', 3, 9600, 40.0, false);


--
-- Name: galaxy_facts_fact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_facts_fact_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_facts galaxy_facts_fun_facts_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_facts
    ADD CONSTRAINT galaxy_facts_fun_facts_key UNIQUE (fun_facts);


--
-- Name: galaxy_facts galaxy_facts_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_facts
    ADD CONSTRAINT galaxy_facts_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy_facts galaxy_facts_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_facts
    ADD CONSTRAINT galaxy_facts_pkey PRIMARY KEY (galaxy_facts_id);


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
-- Name: galaxy_facts galaxy_facts_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_facts
    ADD CONSTRAINT galaxy_facts_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

