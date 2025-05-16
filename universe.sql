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
-- Name: continent; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.continent (
    continent_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_cold boolean,
    size_in_km integer,
    description text
);


ALTER TABLE public.continent OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_size numeric,
    galaxy_type character varying(60),
    galaxy_distance_in_millions_light_years numeric,
    description text
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
    name character varying(30),
    moon_type character varying(30),
    discovery_year integer,
    radius_km numeric,
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
    name character varying(30),
    planet_type character varying(30),
    discovery_year integer,
    is_habitable boolean,
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
    name character varying(30),
    star_type character varying(60),
    discovery_year integer,
    is_dead boolean,
    galaxy_name text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_start_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_start_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_start_id_seq OWNER TO freecodecamp;

--
-- Name: star_start_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_start_id_seq OWNED BY public.star.star_id;


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

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_start_id_seq'::regclass);


--
-- Data for Name: continent; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.continent VALUES (1, 'Asia', false, 44579000, 'Largest continent, home to diverse climates and cultures');
INSERT INTO public.continent VALUES (2, 'Africa', false, 30370000, 'Rich in biodiversity and history, second largest continent');
INSERT INTO public.continent VALUES (3, 'North America', false, 24709000, 'Includes Canada, USA, and Mexico; varied landscapes');
INSERT INTO public.continent VALUES (4, 'South America', false, 17840000, 'Known for the Amazon rainforest and Andes mountains');
INSERT INTO public.continent VALUES (5, 'Antarctica', true, 14000000, 'Ice-covered, coldest continent, no permanent human residents');
INSERT INTO public.continent VALUES (6, 'Europe', true, 10180000, 'Small but densely populated, rich cultural heritage');
INSERT INTO public.continent VALUES (7, 'Australia', false, 8600000, 'Smallest continent, often considered a country-continent');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 'Barred spiral', 0, 'The galaxy that contains our Solar System');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 220000, 'Spiral', 2.5, 'The closest spiral galaxy to the Milky Way, on a collision course with it.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 60000, 'Spiral', 3, 'A small member of the Local Group, possibly gravitationally bound to Andromeda.');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 14000, 'Irregular', 0.16, 'A satellite galaxy of the Milky Way; actively forming stars.');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 7000, 'Irregular', 0.2, 'Another Milky Way satellite, rich in gas and undergoing star formation.');
INSERT INTO public.galaxy VALUES (6, 'Messier 87 (M87)', 120000, 'Elliptical', 53.5, 'A giant elliptical galaxy with a supermassive black hole at its center.');
INSERT INTO public.galaxy VALUES (7, 'Whirlpool Galaxy (M51)', 76000, 'Spiral', 31, 'Known for its well-defined spiral arms and interaction with a companion galaxy.');
INSERT INTO public.galaxy VALUES (8, 'Sombrero Galaxy (M104)', 50000, 'Lenticular', 31, 'Recognizable by its bright nucleus and large central bulge.');
INSERT INTO public.galaxy VALUES (9, 'Centaurus A', 60000, 'Elliptical/Seyfert', 12, 'A peculiar galaxy with strong radio emissions and dust lanes.');
INSERT INTO public.galaxy VALUES (10, 'Messier 81 (M81)', 90000, 'Spiral', 12, 'A large spiral galaxy in Ursa Major, often studied for its structure.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Europa', 'Icy', 1610, 1560, 3);
INSERT INTO public.moon VALUES (2, 'Titan', 'Gas giant moon', 1655, 2575, 8);
INSERT INTO public.moon VALUES (3, 'Ganymede', 'Icy', 1610, 2634, 3);
INSERT INTO public.moon VALUES (4, 'Phobos', 'Irregular', 1877, 11.3, 2);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Icy', 1610, 2410, 3);
INSERT INTO public.moon VALUES (6, 'Enceladus', 'Icy', 1789, 252, 8);
INSERT INTO public.moon VALUES (7, 'Triton', 'Icy', 1846, 1353, 10);
INSERT INTO public.moon VALUES (8, 'Io', 'Volcanic', 1610, 1821, 3);
INSERT INTO public.moon VALUES (9, 'Charon', 'Icy', 1978, 606, 12);
INSERT INTO public.moon VALUES (10, 'Miranda', 'Icy', 1948, 235, 11);
INSERT INTO public.moon VALUES (11, 'Moon', 'Rocky', NULL, 1737, 1);
INSERT INTO public.moon VALUES (12, 'Oberon', 'Icy', 1787, 761, 11);
INSERT INTO public.moon VALUES (13, 'Ariel', 'Icy', 1851, 579, 11);
INSERT INTO public.moon VALUES (14, 'Dione', 'Icy', 1684, 561, 8);
INSERT INTO public.moon VALUES (15, 'Rhea', 'Icy', 1672, 764, 8);
INSERT INTO public.moon VALUES (16, 'Tethys', 'Icy', 1684, 531, 8);
INSERT INTO public.moon VALUES (17, 'Hyperion', 'Irregular', 1848, 135, 8);
INSERT INTO public.moon VALUES (18, 'Iapetus', 'Icy', 1671, 734, 8);
INSERT INTO public.moon VALUES (19, 'Deimos', 'Irregular', 1877, 6.2, 2);
INSERT INTO public.moon VALUES (20, 'Nereid', 'Icy', 1949, 170, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', NULL, true, 12);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', NULL, true, 12);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas giant', NULL, false, 12);
INSERT INTO public.planet VALUES (4, 'Kepler-22b', 'Super-Earth', 2011, true, 13);
INSERT INTO public.planet VALUES (5, 'Proxima Centauri b', 'Terrestrial', 2016, true, 14);
INSERT INTO public.planet VALUES (6, 'TRAPPIST-1e', 'Terrestrial', 2017, true, 15);
INSERT INTO public.planet VALUES (7, 'HD 209458 b', 'Hot Jupiter', 1999, false, 16);
INSERT INTO public.planet VALUES (8, 'WASP-12b', 'Hot Jupiter', 2008, false, 17);
INSERT INTO public.planet VALUES (9, 'Gliese 581c', 'Super-Earth', 2007, true, 18);
INSERT INTO public.planet VALUES (10, 'PSR B1257+12 B', 'Pulsar planet', 1992, false, 19);
INSERT INTO public.planet VALUES (11, 'OGLE-2005-BLG-390Lb', 'Ice giant', 2005, false, 20);
INSERT INTO public.planet VALUES (12, 'Kapteyn b', 'Super-Earth', 2014, true, 21);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'UY Scuti', 'Red supergiant', 1860, false, 'Milky Way', 1);
INSERT INTO public.star VALUES (2, 'VY Canis Majoris', 'Red hypergiant', 1801, false, 'Milky Way', 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant', NULL, false, 'Milky Way', 1);
INSERT INTO public.star VALUES (4, 'R136a1', 'Wolf–Rayet star', 1996, false, 'Large Magellanic Cloud', 4);
INSERT INTO public.star VALUES (5, 'Sanduleak -69 202', 'Blue supergiant', 1970, true, 'Large Magellanic Cloud', 4);
INSERT INTO public.star VALUES (6, 'SMC WR2', 'Wolf–Rayet star', 1985, false, 'Small Magellanic Cloud', 5);
INSERT INTO public.star VALUES (7, 'SN 1994D Progenitor', 'White dwarf', 1994, true, 'Messier 87 (M87)', 6);
INSERT INTO public.star VALUES (8, 'S Andromedae', 'Supernova', 1885, true, 'Andromeda Galaxy', 2);
INSERT INTO public.star VALUES (9, 'ULAS J0015+01', 'Red giant', 2014, false, 'Triangulum Galaxy', 3);
INSERT INTO public.star VALUES (10, 'SN 2001ig progenitor', 'Blue supergiant', 2001, true, 'Whirlpool Galaxy (M51)', 7);
INSERT INTO public.star VALUES (11, 'SN 2016gkg progenitor', 'Yellow supergiant', 2016, true, 'Messier 81 (M81)', 10);
INSERT INTO public.star VALUES (12, 'Sun', 'G-type main-sequence star', NULL, false, 'Milky Way', 1);
INSERT INTO public.star VALUES (13, 'Kepler-22', 'G-type main-sequence', 2009, false, 'Milky Way', 1);
INSERT INTO public.star VALUES (14, 'Proxima Centauri', 'Red dwarf', 1915, false, 'Milky Way', 1);
INSERT INTO public.star VALUES (15, 'TRAPPIST-1', 'Ultra-cool dwarf', 1999, false, 'Milky Way', 1);
INSERT INTO public.star VALUES (16, 'HD 209458', 'G-type main-sequence', 1997, false, 'Milky Way', 1);
INSERT INTO public.star VALUES (17, 'WASP-12', 'F-type main-sequence', 2008, false, 'Milky Way', 1);
INSERT INTO public.star VALUES (18, 'Gliese 581', 'Red dwarf', 1957, false, 'Milky Way', 1);
INSERT INTO public.star VALUES (19, 'PSR B1257+12', 'Pulsar', 1990, true, 'Milky Way', 1);
INSERT INTO public.star VALUES (20, 'MOA-2005-BLG-390L', 'Red dwarf', 2005, false, 'Milky Way', 1);
INSERT INTO public.star VALUES (21, 'Kapteyn''s Star', 'Red subdwarf', 1897, false, 'Milky Way', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_start_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_start_id_seq', 21, true);


--
-- Name: continent continent_continent_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continent_continent_id_key UNIQUE (continent_id);


--
-- Name: continent continent_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continent_name_key UNIQUE (name);


--
-- Name: continent continent_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continent_pk PRIMARY KEY (continent_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);

--
-- PostgreSQL database dump complete
--

