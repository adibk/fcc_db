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
-- Name: element; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.element (
    element_id integer NOT NULL,
    name character varying(30) NOT NULL,
    atomic_nb integer,
    is_solid boolean
);


ALTER TABLE public.element OWNER TO freecodecamp;

--
-- Name: elements_element_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.elements_element_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elements_element_id_seq OWNER TO freecodecamp;

--
-- Name: elements_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.elements_element_id_seq OWNED BY public.element.element_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text NOT NULL,
    "position" integer,
    wieght integer,
    diameter integer
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
-- Name: has_element; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.has_element (
    planet_id integer NOT NULL,
    element_id integer,
    name character varying(30),
    has_element_id text GENERATED ALWAYS AS (((planet_id)::text || (element_id)::text)) STORED NOT NULL
);


ALTER TABLE public.has_element OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer DEFAULT nextval('public.moon_moon_id_seq'::regclass) NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    description text,
    diameter integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter integer,
    revolution_speed numeric(10,2),
    has_life boolean,
    star_id integer
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
    galaxy_id integer,
    description text,
    weight integer
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
-- Name: element element_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element ALTER COLUMN element_id SET DEFAULT nextval('public.elements_element_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: element; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.element VALUES (1, 'oxygen', 3, false);
INSERT INTO public.element VALUES (2, 'water', 4, false);
INSERT INTO public.element VALUES (3, 'carbon', 10, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 'our galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy (M31)', 'nearest spiral galaxy to the Milky Way', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Sombrero Galaxy (M104)', 'bright and large central bulge', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy (M51)', 'classic spiral galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy (M33)', 'third largest of the local groupe', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Magellanic Clouds ', 'magnellanic clouds', NULL, NULL, NULL);


--
-- Data for Name: has_element; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.has_element VALUES (1, 1, NULL, DEFAULT);
INSERT INTO public.has_element VALUES (1, 2, NULL, DEFAULT);
INSERT INTO public.has_element VALUES (1, 3, NULL, DEFAULT);
INSERT INTO public.has_element VALUES (2, 2, NULL, DEFAULT);
INSERT INTO public.has_element VALUES (4, 2, NULL, DEFAULT);
INSERT INTO public.has_element VALUES (6, 1, NULL, DEFAULT);
INSERT INTO public.has_element VALUES (6, 2, NULL, DEFAULT);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon (Luna)', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Io', 2, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Titan', 2, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Europa', 2, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Ganymede', 2, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Phobas', 2, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 2, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Triton', 3, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Charon', 4, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Oberon', 5, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Titania', 6, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Rhea', 7, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Iapetus', 8, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Dione', 9, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Tethys', 10, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Enceladus', 11, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Mimas', 12, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Miranda', 2, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Ariel', 3, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Umbriel', 4, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Proteus', 5, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 12742, 107000.20, true, 1);
INSERT INTO public.planet VALUES (2, 'Proxima Centauri b', 15742, 157300.20, false, 2);
INSERT INTO public.planet VALUES (3, 'Hypothetical Planet', 32399, 1230.19, false, 3);
INSERT INTO public.planet VALUES (4, 'Alpha Centauri A - Planet', 23093, 139393.00, false, 4);
INSERT INTO public.planet VALUES (5, ' Alpha Centauri Bb', 29383, 2039.20, false, 5);
INSERT INTO public.planet VALUES (6, 'Betelgeuse - Hypothetical', 203393, 0.00, false, 6);
INSERT INTO public.planet VALUES (7, 'Sirius Planet X', 12500, 2500.50, false, 2);
INSERT INTO public.planet VALUES (8, 'Sirius Planet Y', 15789, 3001.10, false, 2);
INSERT INTO public.planet VALUES (9, 'Alpha Centauri A - Exo', 11200, 1000.30, false, 4);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri B - Gas Giant', 45000, 2200.60, false, 5);
INSERT INTO public.planet VALUES (11, 'Betelgeuse - Outlier', 50000, 1.00, false, 6);
INSERT INTO public.planet VALUES (12, 'Betelgeuse - Rogue', 32000, 100.00, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Sirius', 1, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Alpha centauri', 1, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Arcturus', 2, NULL, NULL);


--
-- Name: elements_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.elements_element_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: element element_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_name_unique UNIQUE (name);


--
-- Name: element elements_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT elements_pkey PRIMARY KEY (element_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: has_element has_element_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.has_element
    ADD CONSTRAINT has_element_name_unique UNIQUE (name);


--
-- Name: has_element has_element_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.has_element
    ADD CONSTRAINT has_element_pkey PRIMARY KEY (has_element_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: has_element fk_element_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.has_element
    ADD CONSTRAINT fk_element_id FOREIGN KEY (element_id) REFERENCES public.element(element_id) ON DELETE CASCADE;


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: has_element fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.has_element
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


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

