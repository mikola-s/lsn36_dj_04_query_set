--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO "mikola-s";

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO "mikola-s";

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO "mikola-s";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO "mikola-s";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO "mikola-s";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO "mikola-s";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: blog_author; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.blog_author (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    birth_date date,
    create_date_time timestamp with time zone NOT NULL
);


ALTER TABLE public.blog_author OWNER TO "mikola-s";

--
-- Name: blog_author_groups; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.blog_author_groups (
    id integer NOT NULL,
    author_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.blog_author_groups OWNER TO "mikola-s";

--
-- Name: blog_author_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.blog_author_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_author_groups_id_seq OWNER TO "mikola-s";

--
-- Name: blog_author_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.blog_author_groups_id_seq OWNED BY public.blog_author_groups.id;


--
-- Name: blog_author_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.blog_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_author_id_seq OWNER TO "mikola-s";

--
-- Name: blog_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.blog_author_id_seq OWNED BY public.blog_author.id;


--
-- Name: blog_author_user_permissions; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.blog_author_user_permissions (
    id integer NOT NULL,
    author_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.blog_author_user_permissions OWNER TO "mikola-s";

--
-- Name: blog_author_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.blog_author_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_author_user_permissions_id_seq OWNER TO "mikola-s";

--
-- Name: blog_author_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.blog_author_user_permissions_id_seq OWNED BY public.blog_author_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO "mikola-s";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO "mikola-s";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO "mikola-s";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO "mikola-s";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO "mikola-s";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO "mikola-s";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO "mikola-s";

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: blog_author id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.blog_author ALTER COLUMN id SET DEFAULT nextval('public.blog_author_id_seq'::regclass);


--
-- Name: blog_author_groups id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.blog_author_groups ALTER COLUMN id SET DEFAULT nextval('public.blog_author_groups_id_seq'::regclass);


--
-- Name: blog_author_user_permissions id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.blog_author_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.blog_author_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add user	1	add_author
2	Can change user	1	change_author
3	Can delete user	1	delete_author
4	Can view user	1	view_author
5	Can add log entry	2	add_logentry
6	Can change log entry	2	change_logentry
7	Can delete log entry	2	delete_logentry
8	Can view log entry	2	view_logentry
9	Can add permission	3	add_permission
10	Can change permission	3	change_permission
11	Can delete permission	3	delete_permission
12	Can view permission	3	view_permission
13	Can add group	4	add_group
14	Can change group	4	change_group
15	Can delete group	4	delete_group
16	Can view group	4	view_group
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
\.


--
-- Data for Name: blog_author; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.blog_author (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, birth_date, create_date_time) FROM stdin;
1	pbkdf2_sha256$150000$1tX0pQnvAANH$8CTq21t74psphZP0fDBZY9nnSV9uXSHt0FrMgxZ92cg=	2019-12-29 20:01:49.237499+00	t	mikola-s			test@test.com	t	t	2019-12-29 20:01:17.548439+00	\N	2019-12-29 20:01:17.657183+00
\.


--
-- Data for Name: blog_author_groups; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.blog_author_groups (id, author_id, group_id) FROM stdin;
\.


--
-- Data for Name: blog_author_user_permissions; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.blog_author_user_permissions (id, author_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	blog	author
2	admin	logentry
3	auth	permission
4	auth	group
5	contenttypes	contenttype
6	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-12-29 19:57:10.269075+00
2	contenttypes	0002_remove_content_type_name	2019-12-29 19:57:10.29299+00
3	auth	0001_initial	2019-12-29 19:57:10.40771+00
4	auth	0002_alter_permission_name_max_length	2019-12-29 19:57:10.552065+00
5	auth	0003_alter_user_email_max_length	2019-12-29 19:57:10.58662+00
6	auth	0004_alter_user_username_opts	2019-12-29 19:57:10.603846+00
7	auth	0005_alter_user_last_login_null	2019-12-29 19:57:10.622291+00
8	auth	0006_require_contenttypes_0002	2019-12-29 19:57:10.633645+00
9	auth	0007_alter_validators_add_error_messages	2019-12-29 19:57:10.650346+00
10	auth	0008_alter_user_username_max_length	2019-12-29 19:57:10.668738+00
11	auth	0009_alter_user_last_name_max_length	2019-12-29 19:57:10.686941+00
12	auth	0010_alter_group_name_max_length	2019-12-29 19:57:10.706917+00
13	auth	0011_update_proxy_permissions	2019-12-29 19:57:10.725248+00
14	blog	0001_initial	2019-12-29 19:57:10.871021+00
15	admin	0001_initial	2019-12-29 19:57:11.085793+00
16	admin	0002_logentry_remove_auto_add	2019-12-29 19:57:11.157402+00
17	admin	0003_logentry_add_action_flag_choices	2019-12-29 19:57:11.17868+00
18	sessions	0001_initial	2019-12-29 19:57:11.237205+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
vi8uk0od3vkz3x3k6i90c61a7qo8gdhh	MmMxMTA0ZWI3NjRhMWJiNzE1NjIzNTYxNjFlZjMzMjhlNTJhYzBmNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNzMzOGEyNDkxNjE0Y2I1ZDA5Yzg4YmVmOTdhMGJiOWMwNWE1M2FjIn0=	2020-01-12 20:01:49.260444+00
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 24, true);


--
-- Name: blog_author_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.blog_author_groups_id_seq', 1, false);


--
-- Name: blog_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.blog_author_id_seq', 1, true);


--
-- Name: blog_author_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.blog_author_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 6, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: blog_author_groups blog_author_groups_author_id_group_id_7ae6db32_uniq; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.blog_author_groups
    ADD CONSTRAINT blog_author_groups_author_id_group_id_7ae6db32_uniq UNIQUE (author_id, group_id);


--
-- Name: blog_author_groups blog_author_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.blog_author_groups
    ADD CONSTRAINT blog_author_groups_pkey PRIMARY KEY (id);


--
-- Name: blog_author blog_author_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.blog_author
    ADD CONSTRAINT blog_author_pkey PRIMARY KEY (id);


--
-- Name: blog_author_user_permissions blog_author_user_permiss_author_id_permission_id_fb95b13e_uniq; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.blog_author_user_permissions
    ADD CONSTRAINT blog_author_user_permiss_author_id_permission_id_fb95b13e_uniq UNIQUE (author_id, permission_id);


--
-- Name: blog_author_user_permissions blog_author_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.blog_author_user_permissions
    ADD CONSTRAINT blog_author_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: blog_author blog_author_username_key; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.blog_author
    ADD CONSTRAINT blog_author_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: blog_author_groups_author_id_642e0776; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX blog_author_groups_author_id_642e0776 ON public.blog_author_groups USING btree (author_id);


--
-- Name: blog_author_groups_group_id_1f298c93; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX blog_author_groups_group_id_1f298c93 ON public.blog_author_groups USING btree (group_id);


--
-- Name: blog_author_user_permissions_author_id_ef01c45a; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX blog_author_user_permissions_author_id_ef01c45a ON public.blog_author_user_permissions USING btree (author_id);


--
-- Name: blog_author_user_permissions_permission_id_801f8ebe; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX blog_author_user_permissions_permission_id_801f8ebe ON public.blog_author_user_permissions USING btree (permission_id);


--
-- Name: blog_author_username_76bab662_like; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX blog_author_username_76bab662_like ON public.blog_author USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_author_groups blog_author_groups_author_id_642e0776_fk_blog_author_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.blog_author_groups
    ADD CONSTRAINT blog_author_groups_author_id_642e0776_fk_blog_author_id FOREIGN KEY (author_id) REFERENCES public.blog_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_author_groups blog_author_groups_group_id_1f298c93_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.blog_author_groups
    ADD CONSTRAINT blog_author_groups_group_id_1f298c93_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_author_user_permissions blog_author_user_per_author_id_ef01c45a_fk_blog_auth; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.blog_author_user_permissions
    ADD CONSTRAINT blog_author_user_per_author_id_ef01c45a_fk_blog_auth FOREIGN KEY (author_id) REFERENCES public.blog_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_author_user_permissions blog_author_user_per_permission_id_801f8ebe_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.blog_author_user_permissions
    ADD CONSTRAINT blog_author_user_per_permission_id_801f8ebe_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_blog_author_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_blog_author_id FOREIGN KEY (user_id) REFERENCES public.blog_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

