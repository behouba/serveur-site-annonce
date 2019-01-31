--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

-- Started on 2019-01-31 01:58:52

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3222 (class 0 OID 16763)
-- Dependencies: 202
-- Data for Name: account_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_state (account_state_id, description) FROM stdin;
1	activated
2	activation-required
3	disabled
\.


--
-- TOC entry 3224 (class 0 OID 16771)
-- Dependencies: 204
-- Data for Name: account_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_type (account_type_id, description) FROM stdin;
1	regular
2	pro
\.


--
-- TOC entry 3239 (class 0 OID 16916)
-- Dependencies: 219
-- Data for Name: advert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.advert (advert_id, title, description, advertiser_id, category_id, condition_id, city_id, advert_state_id, advert_type_id, price, created_at, map_position, pictures_urls, attribute, thumbnails_urls) FROM stdin;
8	htc one e8	i sell my phone htc one e8 	30	13	\N	1	1	1	15000	2019-01-28 11:23:35.663795	\N	[{"URL":"http://localhost:8080/files/640x480/7480413214088189610.jpg","thumbnailURL":"http://localhost:8080/files/240x180/7480413214088189610.jpg"},{"URL":"http://localhost:8080/files/640x480/7640814767034722870.jpg","thumbnailURL":"http://localhost:8080/files/240x180/7640814767034722870.jpg"},{"URL":"http://localhost:8080/files/640x480/7469376937874642991.jpg","thumbnailURL":"http://localhost:8080/files/240x180/7469376937874642991.jpg"}]	{}	{http://localhost:8080/files/240x180/7480413214088189610.jpg,http://localhost:8080/files/240x180/7640814767034722870.jpg,http://localhost:8080/files/240x180/7469376937874642991.jpg}
9	Mercedes benz	en vente un belle mercedes benz	30	19	\N	2	1	1	4500168	2019-01-28 11:39:37.62955	\N	[{"URL":"http://localhost:8080/files/640x480/2772250950626686904.png","thumbnailURL":"http://localhost:8080/files/240x180/2772250950626686904.png"},{"URL":"http://localhost:8080/files/640x480/1860555432612131242.jpg","thumbnailURL":"http://localhost:8080/files/240x180/1860555432612131242.jpg"}]	{"carKm": "1500000", "carYear": 2003, "carBrand": "MB"}	{http://localhost:8080/files/240x180/2772250950626686904.png,http://localhost:8080/files/240x180/1860555432612131242.jpg}
10	T-shirt adidas	vente de t-shirt adidas femmes	30	30	\N	4	1	1	1500	2019-01-28 11:51:33.800729	\N	[{"URL":"http://localhost:8080/files/640x480/440316385027279878.jpg","thumbnailURL":"http://localhost:8080/files/240x180/440316385027279878.jpg"},{"URL":"http://localhost:8080/files/640x480/16014637013971081696.jpg","thumbnailURL":"http://localhost:8080/files/240x180/16014637013971081696.jpg"}]	{"genderId": 1}	{http://localhost:8080/files/240x180/440316385027279878.jpg,http://localhost:8080/files/240x180/16014637013971081696.jpg}
11	T-shirt adidas	recherche un t-shirt adidas	30	30	\N	39	1	2	0	2019-01-28 11:53:17.601692	\N	[{"URL":"http://localhost:8080/files/640x480/12589534048301244192.jpg","thumbnailURL":"http://localhost:8080/files/240x180/12589534048301244192.jpg"}]	{}	{http://localhost:8080/files/240x180/12589534048301244192.jpg}
12	Audi a3 neuve	T-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidas	30	19	\N	26	1	1	40000000	2019-01-28 11:56:52.057788	\N	[{"URL":"http://localhost:8080/files/640x480/2143126443797261843.jpg","thumbnailURL":"http://localhost:8080/files/240x180/2143126443797261843.jpg"},{"URL":"http://localhost:8080/files/640x480/14489785586377914241.jpg","thumbnailURL":"http://localhost:8080/files/240x180/14489785586377914241.jpg"}]	{"carKm": "48500", "carYear": 2019, "carBrand": "AUDI"}	{http://localhost:8080/files/240x180/2143126443797261843.jpg,http://localhost:8080/files/240x180/14489785586377914241.jpg}
13	Ford focus 	T-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidas	30	19	\N	46	1	1	78000	2019-01-28 11:58:51.071692	\N	[{"URL":"http://localhost:8080/files/640x480/2143126443797261843.jpg","thumbnailURL":"http://localhost:8080/files/240x180/2143126443797261843.jpg"},{"URL":"http://localhost:8080/files/640x480/14489785586377914241.jpg","thumbnailURL":"http://localhost:8080/files/240x180/14489785586377914241.jpg"}]	{"carKm": "78520000", "carYear": 1995, "carBrand": "FORD"}	{http://localhost:8080/files/240x180/2143126443797261843.jpg,http://localhost:8080/files/240x180/14489785586377914241.jpg}
14	Ford fiesta	T-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasvvvv	30	19	\N	34	1	1	4500000	2019-01-28 12:01:35.127915	\N	[{"URL":"http://localhost:8080/files/640x480/3855095553371761356.jpg","thumbnailURL":"http://localhost:8080/files/240x180/3855095553371761356.jpg"},{"URL":"http://localhost:8080/files/640x480/15094578976759072176.jpg","thumbnailURL":"http://localhost:8080/files/240x180/15094578976759072176.jpg"}]	{"carKm": "450000", "carYear": 2003, "carBrand": "FORD"}	{http://localhost:8080/files/240x180/3855095553371761356.jpg,http://localhost:8080/files/240x180/15094578976759072176.jpg}
15	Audi car to sell	T-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasvvvv	30	19	\N	11	1	1	7800000	2019-01-28 12:03:59.148829	\N	[{"URL":"http://localhost:8080/files/640x480/16477134501520466746.jpg","thumbnailURL":"http://localhost:8080/files/240x180/16477134501520466746.jpg"},{"URL":"http://localhost:8080/files/640x480/15094578976759072176.jpg","thumbnailURL":"http://localhost:8080/files/240x180/15094578976759072176.jpg"}]	{"carKm": "785000", "carYear": 2008, "carBrand": "AUDI"}	{http://localhost:8080/files/240x180/16477134501520466746.jpg,http://localhost:8080/files/240x180/15094578976759072176.jpg}
16	samsung galaxy note 	T-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasvvvv	30	13	\N	20	1	1	40000	2019-01-28 12:07:42.773934	\N	[{"URL":"http://localhost:8080/files/640x480/3829156176175377070.jpg","thumbnailURL":"http://localhost:8080/files/240x180/3829156176175377070.jpg"},{"URL":"http://localhost:8080/files/640x480/18081676385789534663.jpg","thumbnailURL":"http://localhost:8080/files/240x180/18081676385789534663.jpg"}]	{}	{http://localhost:8080/files/240x180/3829156176175377070.jpg,http://localhost:8080/files/240x180/18081676385789534663.jpg}
64	htc one m7	je veux faire un troc avec iphone 7	30	13	\N	1	1	3	100000	2019-01-29 07:10:01.991025	\N	[{"URL":"http://localhost:8080/files/640x480/8580997037698167581.png","thumbnailURL":"http://localhost:8080/files/240x180/8580997037698167581.png"},{"URL":"http://localhost:8080/files/640x480/17572661708830334022.jpg","thumbnailURL":"http://localhost:8080/files/240x180/17572661708830334022.jpg"}]	{}	{http://localhost:8080/files/240x180/8580997037698167581.png,http://localhost:8080/files/240x180/17572661708830334022.jpg}
17	samsung galaxy	T-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasT-shirt adidasvvvv	30	13	\N	18	1	1	35000	2019-01-28 12:10:16.008228	\N	[{"URL":"http://localhost:8080/files/640x480/18081676385789534663.jpg","thumbnailURL":"http://localhost:8080/files/240x180/18081676385789534663.jpg"},{"URL":"http://localhost:8080/files/640x480/3829156176175377070.jpg","thumbnailURL":"http://localhost:8080/files/240x180/3829156176175377070.jpg"}]	{}	{http://localhost:8080/files/240x180/18081676385789534663.jpg,http://localhost:8080/files/240x180/3829156176175377070.jpg}
18	asus rog 450	asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450	30	11	\N	14	1	1	500000	2019-01-28 12:13:51.676936	\N	[{"URL":"http://localhost:8080/files/640x480/17627493558245744602.jpg","thumbnailURL":"http://localhost:8080/files/240x180/17627493558245744602.jpg"},{"URL":"http://localhost:8080/files/640x480/5317211526770565100.jpg","thumbnailURL":"http://localhost:8080/files/240x180/5317211526770565100.jpg"}]	{}	{http://localhost:8080/files/240x180/17627493558245744602.jpg,http://localhost:8080/files/240x180/5317211526770565100.jpg}
19	Asus ordinateur portable 	asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450asus rog 450vvv	30	11	\N	4	1	1	150000	2019-01-28 12:15:11.070282	\N	[{"URL":"http://localhost:8080/files/640x480/5317211526770565100.jpg","thumbnailURL":"http://localhost:8080/files/240x180/5317211526770565100.jpg"},{"URL":"http://localhost:8080/files/640x480/9965287171978122157.jpg","thumbnailURL":"http://localhost:8080/files/240x180/9965287171978122157.jpg"}]	{}	{http://localhost:8080/files/240x180/5317211526770565100.jpg,http://localhost:8080/files/240x180/9965287171978122157.jpg}
36	Toyota 	ELECTRONIQUE ET MULTIMÉDIA\nOrdinateurs de bureaux\nOrdinateurs portables\nMatériels et accessoires informatiques\nTéléphones\nTablettes et livres électroniques\nJeux vidéos, consoles et logiciels\nTélévision\nAudio et vidéo\nAppareils photo et caméra\nVEHICULES\nVoitures\nMotos\nVélos\nCamions et équipements spéciaux\nPièces et accessoires\nMAISON ET JARDIN\nMeubles\nDécorations\nElectroménager\nBricolage\nJardin et outils de jardinage\nUstensiles et équipements de cuisine\nHABILLEMENT ET BIEN-ETRE\nVêtements\nChaussures\nMontres et bijoux\nSacs et accessoires\nProduits cosmetiques\nÉquipements pour enfants et bébés\nSERVICES\nÉVÉNEMENTS\nConcerts et spectacles\nFêtes et soirées\nConventions et séminaires\nExpositions, visites\nAutres evènements\nPromotions\nEMPLOIS\nOffre d’emploi\nDemande d’emploi\nOffre de stage\nDemande de stage\nLOISIRS ET DIVERTISSEMENTS\nLivres, revues et magazines\nInstruments de musique\nSports et loisirs\nVins et gastronomies\nCd, dvd, films\nIMMOBILIER\nVentes immobilières\nLocations immobilières\nColocations\nBureaux et commercesELECTRONIQUE ET MULTIMÉDIA\nOrdinateurs de bureaux\nOrdinateurs portables\nMatériels et accessoires informatiques\nTéléphones\nTablettes et livres électroniques\nJeux vidéos, consoles et logiciels\nTélévision\nAudio et vidéo\nAppareils photo et caméra\nVEHICULES\nVoitures\nMotos\nVélos\nCamions et équipements spéciaux\nPièces et accessoires\nMAISON ET JARDIN\nMeubles\nDécorations\nElectroménager\nBricolage\nJardin et outils de jardinage\nUstensiles et équipements de cuisine\nHABILLEMENT ET BIEN-ETRE\nVêtements\nChaussures\nMontres et bijoux\nSacs et accessoires\nProduits cosmetiques\nÉquipements pour enfants et bébés\nSERVICES\nÉVÉNEMENTS\nConcerts et spectacles\nFêtes et soirées\nConventions et séminaires\nExpositions, visites\nAutres evènements\nPromotions\nEMPLOIS\nOffre d’emploi\nDemande d’emploi\nOffre de stage\nDemande de stage\nLOISIRS ET DIVERTISSEMENTS\nLivres, revues et magazines\nInstruments de musique\nSports et loisirs\nVins et gastronomies\nCd, dvd, films\nIMMOBILIER\nVentes immobilières\nLocations immobilières\nColocations\nBureaux et commercesELECTRONIQUE ET MULTIMÉDIA\nOrdinateurs de bureaux\nOrdinateurs portables\nMatériels et accessoires informatiques\nTéléphones\nTablettes et livres électroniques\nJeux vidéos, consoles et logiciels\nTélévision\nAudio et vidéo\nAppareils photo et caméra\nVEHICULES\nVoitures\nMotos\nVélos\nCamions et équipements spéciaux\nPièces et accessoires\nMAISON ET JARDIN\nMeubles\nDécorations\nElectroménager\nBricolage\nJardin et outils de jardinage\nUstensiles et équipements de cuisine\nHABILLEMENT ET BIEN-ETRE\nVêtements\nChaussures\nMontres et bijoux\nSacs et accessoires\nProduits cosmetiques\nÉquipements pour enfants et bébés\nSERVICES\nÉVÉNEMENTS\nConcerts et spectacles\nFêtes et soirées\nConventions et séminaires\nExpositions, visites\nAutres evènements\nPromotions\nEMPLOIS\nOffre d’emploi\nDemande d’emploi\nOffre de stage\nDemande de stage\nLOISIRS ET DIVERTISSEMENTS\nLivres, revues et magazines\nInstruments de musique\nSports et loisirs\nVins et gastronomies\nCd, dvd, films\nIMMOBILIER\nVentes immobilières\nLocations immobilières\nColocations\nBureaux et commerces	30	19	\N	39	1	1	7000000	2019-01-28 13:53:20.774367	\N	[{"URL":"http://localhost:8080/files/640x480/3855095553371761356.jpg","thumbnailURL":"http://localhost:8080/files/240x180/3855095553371761356.jpg"},{"URL":"http://localhost:8080/files/640x480/15094578976759072176.jpg","thumbnailURL":"http://localhost:8080/files/240x180/15094578976759072176.jpg"}]	{"carKm": "1500000", "carYear": 2008, "carBrand": "TOYOTA"}	{http://localhost:8080/files/240x180/3855095553371761356.jpg,http://localhost:8080/files/240x180/15094578976759072176.jpg}
37	Nintendo switch noir	ELECTRONIQUE ET MULTIMÉDIA\nOrdinateurs de bureaux\nOrdinateurs portables\nMatériels et accessoires informatiques\nTéléphones\nTablettes et livres électroniques\nJeux vidéos, consoles et logiciels\nTélévision\nAudio et vidéo\nAppareils photo et caméra\nVEHICULES\nVoitures\nMotos\nVélos\nCamions et équipements spéciaux\nPièces et accessoires\nMAISON ET JARDIN\nMeubles\nDécorations\nElectroménager\nBricolage\nJardin et outils de jardinage\nUstensiles et équipements de cuisine\nHABILLEMENT ET BIEN-ETRE\nVêtements\nChaussures\nMontres et bijoux\nSacs et accessoires\nProduits cosmetiques\nÉquipements pour enfants et bébés\nSERVICES\nÉVÉNEMENTS\nConcerts et spectacles\nFêtes et soirées\nConventions et séminaires\nExpositions, visites\nAutres evènements\nPromotions\nEMPLOIS\nOffre d’emploi\nDemande d’emploi\nOffre de stage\nDemande de stage\nLOISIRS ET DIVERTISSEMENTS\nLivres, revues et magazines\nInstruments de musique\nSports et loisirs\nVins et gastronomies\nCd, dvd, films\nIMMOBILIER\nVentes immobilières\nLocations immobilières\nColocations\nBureaux et commerces	30	15	\N	40	1	1	145000	2019-01-28 14:14:28.292886	\N	[{"URL":"http://localhost:8080/files/640x480/4800087505029243655.jpg","thumbnailURL":"http://localhost:8080/files/240x180/4800087505029243655.jpg"},{"URL":"http://localhost:8080/files/640x480/7331437523571010535.jpg","thumbnailURL":"http://localhost:8080/files/240x180/7331437523571010535.jpg"}]	{}	{http://localhost:8080/files/240x180/4800087505029243655.jpg,http://localhost:8080/files/240x180/7331437523571010535.jpg}
38	Moto noir	ELECTRONIQUE ET MULTIMÉDIA\nOrdinateurs de bureaux\nOrdinateurs portables\nMatériels et accessoires informatiques\nTéléphones\nTablettes et livres électroniques\nJeux vidéos, consoles et logiciels\nTélévision\nAudio et vidéo\nAppareils photo et caméra\nVEHICULES\nVoitures\nMotos\nVélos\nCamions et équipements spéciaux\nPièces et accessoires\nMAISON ET JARDIN\nMeubles\nDécorations\nElectroménager\nBricolage\nJardin et outils de jardinage\nUstensiles et équipements de cuisine\nHABILLEMENT ET BIEN-ETRE\nVêtements\nChaussures\nMontres et bijoux\nSacs et accessoires\nProduits cosmetiques\nÉquipements pour enfants et bébés\nSERVICES\nÉVÉNEMENTS\nConcerts et spectacles\nFêtes et soirées\nConventions et séminaires\nExpositions, visites\nAutres evènements\nPromotions\nEMPLOIS\nOffre d’emploi\nDemande d’emploi\nOffre de stage\nDemande de stage\nLOISIRS ET DIVERTISSEMENTS\nLivres, revues et magazines\nInstruments de musique\nSports et loisirs\nVins et gastronomies\nCd, dvd, films\nIMMOBILIER\nVentes immobilières\nLocations immobilières\nColocations\nBureaux et commerces	30	20	\N	14	1	1	200000	2019-01-28 14:15:52.825447	\N	[{"URL":"http://localhost:8080/files/640x480/3686343370331643169.jpg","thumbnailURL":"http://localhost:8080/files/240x180/3686343370331643169.jpg"},{"URL":"http://localhost:8080/files/640x480/4291418235689623120.jpg","thumbnailURL":"http://localhost:8080/files/240x180/4291418235689623120.jpg"},{"URL":"http://localhost:8080/files/640x480/3293485500522539699.jpg","thumbnailURL":"http://localhost:8080/files/240x180/3293485500522539699.jpg"}]	{"motoKm": "150000", "motoYear": 1983}	{http://localhost:8080/files/240x180/3686343370331643169.jpg,http://localhost:8080/files/240x180/4291418235689623120.jpg,http://localhost:8080/files/240x180/3293485500522539699.jpg}
40	Xbox one noir	ELECTRONIQUE ET MULTIMÉDIA\nOrdinateurs de bureaux\nOrdinateurs portables\nMatériels et accessoires informatiques\nTéléphones\nTablettes et livres électroniques\nJeux vidéos, consoles et logiciels\nTélévision\nAudio et vidéo\nAppareils photo et caméra\nVEHICULES\nVoitures\nMotos\nVélos\nCamions et équipements spéciaux\nPièces et accessoires\nMAISON ET JARDIN\nMeubles\nDécorations\nElectroménager\nBricolage\nJardin et outils de jardinage\nUstensiles et équipements de cuisine\nHABILLEMENT ET BIEN-ETRE\nVêtements\nChaussures\nMontres et bijoux\nSacs et accessoires\nProduits cosmetiques\nÉquipements pour enfants et bébés\nSERVICES\nÉVÉNEMENTS\nConcerts et spectacles\nFêtes et soirées\nConventions et séminaires\nExpositions, visites\nAutres evènements\nPromotions\nEMPLOIS\nOffre d’emploi\nDemande d’emploi\nOffre de stage\nDemande de stage\nLOISIRS ET DIVERTISSEMENTS\nLivres, revues et magazines\nInstruments de musique\nSports et loisirs\nVins et gastronomies\nCd, dvd, films\nIMMOBILIER\nVentes immobilières\nLocations immobilières\nColocations\nBureaux et commerces	30	15	\N	24	1	1	140000	2019-01-28 14:24:56.693499	\N	[{"URL":"http://localhost:8080/files/640x480/2759922131032413934.jpg","thumbnailURL":"http://localhost:8080/files/240x180/2759922131032413934.jpg"},{"URL":"http://localhost:8080/files/640x480/12528362640303819285.jpg","thumbnailURL":"http://localhost:8080/files/240x180/12528362640303819285.jpg"}]	{}	{http://localhost:8080/files/240x180/2759922131032413934.jpg,http://localhost:8080/files/240x180/12528362640303819285.jpg}
39	Nintendo switch rouge	ELECTRONIQUE ET MULTIMÉDIA\nOrdinateurs de bureaux\nOrdinateurs portables\nMatériels et accessoires informatiques\nTéléphones\nTablettes et livres électroniques\nJeux vidéos, consoles et logiciels\nTélévision\nAudio et vidéo\nAppareils photo et caméra\nVEHICULES\nVoitures\nMotos\nVélos\nCamions et équipements spéciaux\nPièces et accessoires\nMAISON ET JARDIN\nMeubles\nDécorations\nElectroménager\nBricolage\nJardin et outils de jardinage\nUstensiles et équipements de cuisine\nHABILLEMENT ET BIEN-ETRE\nVêtements\nChaussures\nMontres et bijoux\nSacs et accessoires\nProduits cosmetiques\nÉquipements pour enfants et bébés\nSERVICES\nÉVÉNEMENTS\nConcerts et spectacles\nFêtes et soirées\nConventions et séminaires\nExpositions, visites\nAutres evènements\nPromotions\nEMPLOIS\nOffre d’emploi\nDemande d’emploi\nOffre de stage\nDemande de stage\nLOISIRS ET DIVERTISSEMENTS\nLivres, revues et magazines\nInstruments de musique\nSports et loisirs\nVins et gastronomies\nCd, dvd, films\nIMMOBILIER\nVentes immobilières\nLocations immobilières\nColocations\nBureaux et commerces	30	15	\N	20	1	1	154000	2019-01-28 14:16:57.288103	\N	[{"URL":"http://localhost:8080/files/640x480/5291272149574180814.jpg","thumbnailURL":"http://localhost:8080/files/240x180/5291272149574180814.jpg"},{"URL":"http://localhost:8080/files/640x480/7331437523571010535.jpg","thumbnailURL":"http://localhost:8080/files/240x180/7331437523571010535.jpg"}]	{}	{http://localhost:8080/files/240x180/5291272149574180814.jpg,http://localhost:8080/files/240x180/7331437523571010535.jpg}
42	Depannage installation materiels	ELECTRONIQUE ET MULTIMÉDIA\nOrdinateurs de bureaux\nOrdinateurs portables\nMatériels et accessoires informatiques\nTéléphones\nTablettes et livres électroniques\nJeux vidéos, consoles et logiciels\nTélévision\nAudio et vidéo\nAppareils photo et caméra\nVEHICULES\nVoitures\nMotos\nVélos\nCamions et équipements spéciaux\nPièces et accessoires\nMAISON ET JARDIN\nMeubles\nDécorations\nElectroménager\nBricolage\nJardin et outils de jardinage\nUstensiles et équipements de cuisine\nHABILLEMENT ET BIEN-ETRE\nVêtements\nChaussures\nMontres et bijoux\nSacs et accessoires\nProduits cosmetiques\nÉquipements pour enfants et bébés\nSERVICES\nÉVÉNEMENTS\nConcerts et spectacles\nFêtes et soirées\nConventions et séminaires\nExpositions, visites\nAutres evènements\nPromotions\nEMPLOIS\nOffre d’emploi\nDemande d’emploi\nOffre de stage\nDemande de stage\nLOISIRS ET DIVERTISSEMENTS\nLivres, revues et magazines\nInstruments de musique\nSports et loisirs\nVins et gastronomies\nCd, dvd, films\nIMMOBILIER\nVentes immobilières\nLocations immobilières\nColocations\nBureaux et commerces	30	5	\N	11	1	\N	175000	2019-01-28 14:40:35.263726	\N	[]	{"serviceId": 1}	\N
43	Camions et équipements spéciaux	ELECTRONIQUE ET MULTIMÉDIA\nOrdinateurs de bureaux\nOrdinateurs portables\nMatériels et accessoires informatiques\nTéléphones\nTablettes et livres électroniques\nJeux vidéos, consoles et logiciels\nTélévision\nAudio et vidéo\nAppareils photo et caméra\nVEHICULES\nVoitures\nMotos\nVélos\n\nPièces et accessoires\nMAISON ET JARDIN\nMeubles\nDécorations\nElectroménager\nBricolage\nJardin et outils de jardinage\nUstensiles et équipements de cuisine\nHABILLEMENT ET BIEN-ETRE\nVêtements\nChaussures\nMontres et bijoux\nSacs et accessoires\nProduits cosmetiques\nÉquipements pour enfants et bébés\nSERVICES\nÉVÉNEMENTS\nConcerts et spectacles\nFêtes et soirées\nConventions et séminaires\nExpositions, visites\nAutres evènements\nPromotions\nEMPLOIS\nOffre d’emploi\nDemande d’emploi\nOffre de stage\nDemande de stage\nLOISIRS ET DIVERTISSEMENTS\nLivres, revues et magazines\nInstruments de musique\nSports et loisirs\nVins et gastronomies\nCd, dvd, films\nIMMOBILIER\nVentes immobilières\nLocations immobilières\nColocations\nBureaux et commerces	30	5	\N	11	1	\N	175000	2019-01-28 15:18:54.630953	\N	[]	{"serviceId": 1}	\N
44	Matériels et accessoires informatiques	ELECTRONIQUE ET MULTIMÉDIA\nOrdinateurs de bureaux\nOrdinateurs portables\n\nTéléphones\nTablettes et livres électroniques\nJeux vidéos, consoles et logiciels\nTélévision\nAudio et vidéo\nAppareils photo et caméra\nVEHICULES\nVoitures\nMotos\nVélos\n\nPièces et accessoires\nMAISON ET JARDIN\nMeubles\nDécorations\nElectroménager\nBricolage\nJardin et outils de jardinage\nUstensiles et équipements de cuisine\nHABILLEMENT ET BIEN-ETRE\nVêtements\nChaussures\nMontres et bijoux\nSacs et accessoires\nProduits cosmetiques\nÉquipements pour enfants et bébés\nSERVICES\nÉVÉNEMENTS\nConcerts et spectacles\nFêtes et soirées\nConventions et séminaires\nExpositions, visites\nAutres evènements\nPromotions\nEMPLOIS\nOffre d’emploi\nDemande d’emploi\nOffre de stage\nDemande de stage\nLOISIRS ET DIVERTISSEMENTS\nLivres, revues et magazines\nInstruments de musique\nSports et loisirs\nVins et gastronomies\nCd, dvd, films\nIMMOBILIER\nVentes immobilières\nLocations immobilières\nColocations\nBureaux et commerces	30	5	\N	11	1	\N	175000	2019-01-28 15:19:14.834925	\N	[]	{"serviceId": 1}	\N
45	Matériels et accessoires informatiques	ELECTRONIQUE ET MULTIMÉDIA\nOrdinateurs de bureaux\nOrdinateurs portables\n\nTéléphones\nTablettes et livres électroniques\nJeux vidéos, consoles et logiciels\nTélévision\nAudio et vidéo\nAppareils photo et caméra\nVEHICULES\nVoitures\nMotos\nVélos\n\nPièces et accessoires\nMAISON ET JARDIN\nMeubles\nDécorations\nElectroménager\nBricolage\nJardin et outils de jardinage\nUstensiles et équipements de cuisine\nHABILLEMENT ET BIEN-ETRE\nVêtements\nChaussures\nMontres et bijoux\nSacs et accessoires\nProduits cosmetiques\nÉquipements pour enfants et bébés\nSERVICES\nÉVÉNEMENTS\nConcerts et spectacles\nFêtes et soirées\nConventions et séminaires\nExpositions, visites\nAutres evènements\nPromotions\nEMPLOIS\nOffre d’emploi\nDemande d’emploi\nOffre de stage\nDemande de stage\nLOISIRS ET DIVERTISSEMENTS\nLivres, revues et magazines\nInstruments de musique\nSports et loisirs\nVins et gastronomies\nCd, dvd, films\nIMMOBILIER\nVentes immobilières\nLocations immobilières\nColocations\nBureaux et commerces	30	5	\N	11	1	\N	175000	2019-01-28 15:38:47.030361	\N	[{"URL":"http://localhost:8080/files/640x480/9965287171978122157.jpg","thumbnailURL":"http://localhost:8080/files/240x180/9965287171978122157.jpg"}]	{"serviceId": 1}	{http://localhost:8080/files/240x180/9965287171978122157.jpg}
46	Matériels et accessoires informatiques	ELECTRONIQUE ET MULTIMÉDIA\nOrdinateurs de bureaux\nOrdinateurs portables\n\nTéléphones\nTablettes et livres électroniques\nJeux vidéos, consoles et logiciels\nTélévision\nAudio et vidéo\nAppareils photo et caméra\nVEHICULES\nVoitures\nMotos\nVélos\n\nPièces et accessoires\nMAISON ET JARDIN\nMeubles\nDécorations\nElectroménager\nBricolage\nJardin et outils de jardinage\nUstensiles et équipements de cuisine\nHABILLEMENT ET BIEN-ETRE\nVêtements\nChaussures\nMontres et bijoux\nSacs et accessoires\nProduits cosmetiques\nÉquipements pour enfants et bébés\nSERVICES\nÉVÉNEMENTS\nConcerts et spectacles\nFêtes et soirées\nConventions et séminaires\nExpositions, visites\nAutres evènements\nPromotions\nEMPLOIS\nOffre d’emploi\nDemande d’emploi\nOffre de stage\nDemande de stage\nLOISIRS ET DIVERTISSEMENTS\nLivres, revues et magazines\nInstruments de musique\nSports et loisirs\nVins et gastronomies\nCd, dvd, films\nIMMOBILIER\nVentes immobilières\nLocations immobilières\nColocations\nBureaux et commerces	30	5	\N	11	1	\N	175000	2019-01-28 16:51:03.375859	\N	[{"URL":"http://localhost:8080/files/640x480/9965287171978122157.jpg","thumbnailURL":"http://localhost:8080/files/240x180/9965287171978122157.jpg"}]	{"serviceId": 1}	{http://localhost:8080/files/240x180/9965287171978122157.jpg}
47	Matériels et accessoires informatiques	ELECTRONIQUE ET MULTIMÉDIA\nOrdinateurs de bureaux\nOrdinateurs portables\n\nTéléphones\nTablettes et livres électroniques\nJeux vidéos, consoles et logiciels\nTélévision\nAudio et vidéo\nAppareils photo et caméra\nVEHICULES\nVoitures\nMotos\nVélos\n\nPièces et accessoires\nMAISON ET JARDIN\nMeubles\nDécorations\nElectroménager\nBricolage\nJardin et outils de jardinage\nUstensiles et équipements de cuisine\nHABILLEMENT ET BIEN-ETRE\nVêtements\nChaussures\nMontres et bijoux\nSacs et accessoires\nProduits cosmetiques\nÉquipements pour enfants et bébés\nSERVICES\nÉVÉNEMENTS\nConcerts et spectacles\nFêtes et soirées\nConventions et séminaires\nExpositions, visites\nAutres evènements\nPromotions\nEMPLOIS\nOffre d’emploi\nDemande d’emploi\nOffre de stage\nDemande de stage\nLOISIRS ET DIVERTISSEMENTS\nLivres, revues et magazines\nInstruments de musique\nSports et loisirs\nVins et gastronomies\nCd, dvd, films\nIMMOBILIER\nVentes immobilières\nLocations immobilières\nColocations\nBureaux et commerces	30	5	\N	11	1	\N	175000	2019-01-28 17:36:44.237844	\N	[{"URL":"http://localhost:8080/files/640x480/9965287171978122157.jpg","thumbnailURL":"http://localhost:8080/files/240x180/9965287171978122157.jpg"}]	{"serviceId": 7}	{http://localhost:8080/files/240x180/9965287171978122157.jpg}
49	Location studio	je recherche un motorola pomelo green	30	67	\N	19	1	2	0	2019-01-28 17:50:42.670713	\N	[{"URL":"http://localhost:8080/files/640x480/3686343370331643169.jpg","thumbnailURL":"http://localhost:8080/files/240x180/3686343370331643169.jpg"}]	{"housingTypeId": 1, "housingRoomNumber": "2"}	{http://localhost:8080/files/240x180/3686343370331643169.jpg}
51	Location maison	location studio a cocody	30	68	\N	5	1	8	75000	2019-01-28 18:07:54.694049	\N	[{"URL":"http://localhost:8080/files/640x480/6703022467480637906.png","thumbnailURL":"http://localhost:8080/files/240x180/6703022467480637906.png"}]	{"housingTypeId": 1, "housingRoomNumber": "5"}	{http://localhost:8080/files/240x180/6703022467480637906.png}
52	Location maison	location studio a cocody	30	68	\N	5	1	8	75000	2019-01-28 18:08:26.975839	\N	[{"URL":"http://localhost:8080/files/640x480/6703022467480637906.png","thumbnailURL":"http://localhost:8080/files/240x180/6703022467480637906.png"}]	{"housingTypeId": 1, "housingRoomNumber": "5"}	{http://localhost:8080/files/240x180/6703022467480637906.png}
53	Location nintendo switch	location studio a cocody	30	5	\N	5	1	5	1000	2019-01-28 18:09:22.068446	\N	[{"URL":"http://localhost:8080/files/640x480/6703022467480637906.png","thumbnailURL":"http://localhost:8080/files/240x180/6703022467480637906.png"}]	{"serviceId": 14}	{http://localhost:8080/files/240x180/6703022467480637906.png}
54	Coursier a moto	événemen tsévénementsé vénementsévé nementsévé  nements	30	58	\N	13	1	6	100000	2019-01-28 18:10:53.870394	\N	[]	{}	\N
55	Agent de sécurité	événemen tsévénementsé vénementsévé nementsévé  nements	30	58	\N	4	1	6	300000	2019-01-28 18:14:31.754303	\N	[]	{}	\N
56	Rolex neuve	Montre rolex toute neuve	30	32	\N	5	1	1	140000	2019-01-28 22:41:49.889271	\N	[{"URL":"http://localhost:8080/files/640x480/2656516523663886015.jpg","thumbnailURL":"http://localhost:8080/files/240x180/2656516523663886015.jpg"},{"URL":"http://localhost:8080/files/640x480/17616718788487935768.jpg","thumbnailURL":"http://localhost:8080/files/240x180/17616718788487935768.jpg"}]	{"genderId": 1}	{http://localhost:8080/files/240x180/2656516523663886015.jpg,http://localhost:8080/files/240x180/17616718788487935768.jpg}
57	Montre homme	Montre homme	30	32	\N	5	1	1	50000	2019-01-28 22:42:53.596576	\N	[]	{"genderId": 2}	\N
58	Montre de luxe	Montre homme	30	32	\N	5	1	1	50000	2019-01-28 22:43:14.42441	\N	[{"URL":"http://localhost:8080/files/640x480/17616718788487935768.jpg","thumbnailURL":"http://localhost:8080/files/240x180/17616718788487935768.jpg"},{"URL":"http://localhost:8080/files/640x480/2656516523663886015.jpg","thumbnailURL":"http://localhost:8080/files/240x180/2656516523663886015.jpg"}]	{"genderId": 2}	{http://localhost:8080/files/240x180/17616718788487935768.jpg,http://localhost:8080/files/240x180/2656516523663886015.jpg}
59	Liseuse kindle	Liseuse kindle en excellent etat	30	14	\N	8	1	1	70000	2019-01-28 22:44:14.527135	\N	[{"URL":"http://localhost:8080/files/640x480/6375527449506005986.jpg","thumbnailURL":"http://localhost:8080/files/240x180/6375527449506005986.jpg"},{"URL":"http://localhost:8080/files/640x480/13964337125384998921.jpg","thumbnailURL":"http://localhost:8080/files/240x180/13964337125384998921.jpg"}]	{}	{http://localhost:8080/files/240x180/6375527449506005986.jpg,http://localhost:8080/files/240x180/13964337125384998921.jpg}
60	Liveuse kobo	Liseuse kindle en excellent etat	30	14	\N	8	1	1	70000	2019-01-28 22:44:38.648571	\N	[{"URL":"http://localhost:8080/files/640x480/6375527449506005986.jpg","thumbnailURL":"http://localhost:8080/files/240x180/6375527449506005986.jpg"},{"URL":"http://localhost:8080/files/640x480/13964337125384998921.jpg","thumbnailURL":"http://localhost:8080/files/240x180/13964337125384998921.jpg"}]	{}	{http://localhost:8080/files/240x180/6375527449506005986.jpg,http://localhost:8080/files/240x180/13964337125384998921.jpg}
61	Location villa	Location villa 7 pices	30	68	\N	19	1	8	400000	2019-01-28 22:46:04.53672	\N	[{"URL":"http://localhost:8080/files/640x480/1342368545980499035.jpg","thumbnailURL":"http://localhost:8080/files/240x180/1342368545980499035.jpg"}]	{"housingTypeId": 1, "housingRoomNumber": "7"}	{http://localhost:8080/files/240x180/1342368545980499035.jpg}
62	Vente d'immeuble	Vente d'un immeuble 	30	67	\N	4	1	8	100000000	2019-01-28 22:47:40.650796	\N	[{"URL":"http://localhost:8080/files/640x480/12528886103206857652.jpg","thumbnailURL":"http://localhost:8080/files/240x180/12528886103206857652.jpg"},{"URL":"http://localhost:8080/files/640x480/1342368545980499035.jpg","thumbnailURL":"http://localhost:8080/files/240x180/1342368545980499035.jpg"}]	{"housingTypeId": 1, "housingRoomNumber": "9"}	{http://localhost:8080/files/240x180/12528886103206857652.jpg,http://localhost:8080/files/240x180/1342368545980499035.jpg}
63	htc one 	je vend un htc one 	30	13	\N	1	1	1	78500	2019-01-29 07:03:54.659731	\N	[{"URL":"http://localhost:8080/files/640x480/17572661708830334022.jpg","thumbnailURL":"http://localhost:8080/files/240x180/17572661708830334022.jpg"},{"URL":"http://localhost:8080/files/640x480/8580997037698167581.png","thumbnailURL":"http://localhost:8080/files/240x180/8580997037698167581.png"}]	{}	{http://localhost:8080/files/240x180/17572661708830334022.jpg,http://localhost:8080/files/240x180/8580997037698167581.png}
\.


--
-- TOC entry 3237 (class 0 OID 16902)
-- Dependencies: 217
-- Data for Name: advert_condition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.advert_condition (condition_id, name) FROM stdin;
1	new
2	used
\.


--
-- TOC entry 3247 (class 0 OID 17015)
-- Dependencies: 227
-- Data for Name: advert_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.advert_state (advert_state_id, name) FROM stdin;
1	online
2	offline
3	deleted
\.


--
-- TOC entry 3245 (class 0 OID 17006)
-- Dependencies: 225
-- Data for Name: advert_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.advert_type (advert_type_id, name) FROM stdin;
4	Don
3	Troc
1	Offre
2	Demande
5	services
6	emplois
7	événements
8	immobilier
\.


--
-- TOC entry 3258 (class 0 OID 17154)
-- Dependencies: 238
-- Data for Name: alert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alert (alert_id, owner_id, key_word, category_id, min_price, max_price, advert_type_id, is_active) FROM stdin;
\.


--
-- TOC entry 3220 (class 0 OID 16743)
-- Dependencies: 200
-- Data for Name: auth_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_type (auth_type_id, name) FROM stdin;
1	email
2	google
3	facebook
\.


--
-- TOC entry 3268 (class 0 OID 41401)
-- Dependencies: 248
-- Data for Name: car_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.car_attribute (advert_id, brand_id, year_id, mileage) FROM stdin;
\.


--
-- TOC entry 3269 (class 0 OID 41414)
-- Dependencies: 249
-- Data for Name: car_brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.car_brand (car_brand_id, brand_name) FROM stdin;
1	Acura
2	Alfa Romeo
3	AMC
4	Aston Martin
5	Audi
6	Avanti
7	Bentley
8	BMW
9	Buick
10	Cadillac
11	Chevrolet
12	Chrysler
13	Daewoo
14	Daihatsu
15	Datsun
16	DeLorean
17	Dodge
18	Eagle
19	Ferrari
20	FIAT
21	Fisker
22	Ford
23	Freightliner
24	Geo
25	GMC
26	Honda
27	HUMMER
28	Hyundai
29	Infiniti
30	Isuzu
31	Jaguar
32	Jeep
33	Kia
34	Lamborghini
35	Lancia
36	Land Rover
37	Lexus
38	Lincoln
39	Lotus
40	Maserati
41	Maybach
42	Mazda
43	McLaren
44	Mercedes-Benz
45	Mercury
46	Merkur
47	MINI
48	Mitsubishi
49	Nissan
50	Oldsmobile
51	Peugeot
52	Plymouth
53	Pontiac
54	Porsche
55	RAM
56	Renault
57	Rolls-Royce
58	Saab
59	Saturn
60	Scion
61	smart
62	SRT
63	Sterling
64	Subaru
65	Suzuki
66	Tesla
67	Toyota
68	Triumph
69	Volkswagen
70	Volvo
71	Yugo
\.


--
-- TOC entry 3233 (class 0 OID 16868)
-- Dependencies: 213
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (parent_id, category_id, name, path_name, fields) FROM stdin;
7	58	Offre d’emploi	offre_demploi	\N
3	25	Décorations	decorations	\N
3	26	Electroménager	electromenager	\N
3	27	Bricolage	bricolage	\N
3	28	Jardin et outils de jardinage	jardin_et_outils_de_jardinage	\N
8	64	Sports et loisirs	sports_et_loisirs	\N
4	30	Vêtements	vetements	\N
4	31	Chaussures	chaussures	\N
\N	2	VEHICULES	vehicules	\N
4	32	Montres et bijoux	montres_et_bijoux	\N
5	51	Cours particulier	cours_particulier	\N
6	56	Expositions, visites	expositions_visites	\N
1	17	Audio et vidéo	audio_et_video	\N
1	14	Tablettes et livres électroniques	tablettes_et_livres_electroniques	\N
1	15	Jeux vidéos, consoles et logiciels	jeux_videos_consoles_et_logiciels	\N
1	18	Appareils photo et caméra	appareils_photo_et_camera	\N
1	12	Matériels et accessoires informatiques	materiels_et_accessoires_informatiques	\N
3	29	Ustensiles et équipements de cuisine	ustensiles_et_equipements_de_cuisine	\N
8	63	Instruments de musique	instruments_de_musique	\N
8	65	Vins et gastronomies	vins_et_gastronomies	\N
8	66	Cd, dvd, films	cd_dvd_films	\N
9	67	Ventes immobilières	ventes_immobilieres	\N
9	68	Locations immobilières	locations_immobilieres	\N
5	40	Restauration	restauration	\N
5	48	Réparation	reparation	\N
5	45	Entretien, nettoyage et services domestiques	entretien_nettoyage_et_services_domestiques	\N
4	34	Produits cosmetiques	produits_cosmetiques	\N
5	35	Traduction	traduction	\N
5	36	Organisation d’evènements	organisation_devenements	\N
5	37	Services immobiliers	services_immobiliers	\N
5	38	Informatiques	informatiques	\N
5	39	Dépannage auto	depannage_auto	\N
5	41	Sécurité	securite	\N
5	44	Beauté, santé	beaute_sante	\N
8	62	Livres, revues et magazines	livres_revues_et_magazines	\N
5	50	Transports	transports	\N
6	55	Conventions et séminaires	conventions_et_seminaires	\N
6	53	Concerts et spectacles	concerts_et_spectacles	\N
6	54	Fêtes et soirées	fetes_et_soirees	\N
4	33	Sacs et accessoires	sacs_et_accessoires	\N
5	42	Associations, bénévolat	associations_benevolat	\N
5	43	Livraison, déménagement	livraison_demenagement	\N
5	46	Formation, cours	formation_cours	\N
5	47	Publicité	publicite	\N
6	57	Autres evènements	autres_evenements	\N
6	134	Promotions	promotions	\N
9	69	Recherches immobilières	colocations	\N
\N	9	IMMOBILIER	immobilier	\N
1	10	Ordinateurs de bureaux	ordinateurs_de_bureaux	\N
1	11	Ordinateurs portables	ordinateurs_portables	\N
1	13	Téléphones	telephones	\N
1	16	Télévision	television	\N
3	24	Meubles	meubles	\N
2	19	Voitures	voitures	\N
2	22	Camions et équipements spéciaux	camions_et_equipements_speciaux	\N
2	20	Motos	motos	\N
2	21	Vélos	velos	\N
2	23	Pièces et accessoires	pieces_et_accessoires	\N
5	49	Autres services	autres_services	\N
5	132	Entretien et nettoyage	entretien_et_nettoyage	\N
5	133	Installation de matériel	installation_de_materiel	\N
\N	6	ÉVÉNEMENTS	evenements	\N
\N	3	MAISON ET JARDIN	maison_et_jardin	\N
\N	7	EMPLOIS	emplois	\N
\N	5	SERVICES	services	\N
\N	8	LOISIRS ET DIVERTISSEMENTS	loisirs_et_divertissements	\N
\N	1	ELECTRONIQUE ET MULTIMÉDIA	electronique_et_multimedia	\N
4	131	Équipements pour enfants et bébés	equipements_pour_enfants_et_bebes	\N
\N	4	MODE ET BIEN-ETRE	habillement_et_bien_etre	\N
\N	143	AUTRES CATÉGORIES	autres_categories	\N
\.


--
-- TOC entry 3266 (class 0 OID 33139)
-- Dependencies: 246
-- Data for Name: category_field; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category_field (category_id, form_field_id) FROM stdin;
\.


--
-- TOC entry 3229 (class 0 OID 16800)
-- Dependencies: 209
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat (chat_id, advertiser_id, guest_id, chat_state_id) FROM stdin;
\.


--
-- TOC entry 3255 (class 0 OID 17104)
-- Dependencies: 235
-- Data for Name: chat_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_state (chat_state_id, name) FROM stdin;
1	active
2	deleted
\.


--
-- TOC entry 3251 (class 0 OID 17037)
-- Dependencies: 231
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (city_id, city_name, district_id, path_name) FROM stdin;
1	Abidjan	1	abidjan
2	Sassandra	2	sassandra
3	Soubré	2	soubre
4	San-Pédro	2	san_pedro
5	Abengourou	3	abengourou
6	Aboisso	3	aboisso
7	Odienné	4	odienne
8	Minignan	4	minignan
9	Gagnoa	5	gagnoa
10	Divo	5	divo
12	Daoukro	6	daoukro
13	Bongouanou	6	bongouanou
14	Dimbokro	6	dimbokro
15	Toumodi	6	toumodi
16	Agboville	7	agboville
17	Dabou	7	dabou
18	Adzopé	7	adzope
19	Guiglo	8	guiglo
20	Duékoué	8	duekoue
21	Man	8	man
22	Daloa	9	daloa
23	Bouaflé	9	bouafle
24	Boundiali	10	boundiali
25	Korhogo	10	korhogo
26	Ferkessédougou	10	ferkessedougou
27	Bouaké	11	bouake
28	Katiola	11	katiola
29	Mankono	12	mankono
30	Touba	12	touba
31	Séguéla	12	seguela
11	Yamoussoukro	13	yamoussoukro
32	Bouna	14	bouna
33	Bondoukou	14	bondoukou
34	Tiassalé	7	tiassale
36	Anyama	7	anyama
37	Grand-Bassam	3	grand_bassam
38	Issia	9	issia
39	Bingerville	7	bingerville
40	Oumé	5	oume
41	Lakota	5	lakota
42	Sinfra	9	sinfra
44	Danané	9	danane
45	Tingréla	10	tingrela
46	Agnibilékrou	3	agnibilekrou
47	Vavoua	9	vavoua
48	Zuénoula	9	zuenoula
50	Toute la Côte d’Ivoire	\N	all
\.


--
-- TOC entry 3270 (class 0 OID 41427)
-- Dependencies: 250
-- Data for Name: clothing_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clothing_attribute (advert_id, gender_id) FROM stdin;
\.


--
-- TOC entry 3281 (class 0 OID 41481)
-- Dependencies: 261
-- Data for Name: clothing_size; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clothing_size (size_id, fashion_gender_id, size_name) FROM stdin;
1	1	32 (XXS)
2	1	34 (XS)
3	1	36 (S)
4	1	38 (M)
5	1	40 (L)
6	1	42 (XL)
7	1	44 (XXL)
8	1	46 (XXXL)
9	1	48 (4XL)
10	1	50 et + (5XL)
11	2	XS
12	2	S
13	2	M
14	2	L
15	2	XL
16	2	XXL
17	2	XXXL et +
18	3	2-4 ans
19	3	4-6 ans
20	3	6-8 ans
21	3	8-10 ans
22	3	10-12 ans
23	3	12-14 ans
24	3	14-16 ans
25	4	2-4 ans
26	4	4-6 ans
27	4	6-8 ans
28	4	8-10 ans
29	4	10-12 ans
30	4	12-14 ans
31	4	14-16 ans
\.


--
-- TOC entry 3283 (class 0 OID 41497)
-- Dependencies: 263
-- Data for Name: clothing_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clothing_type (clothing_type_id, clothing_name, gender_id) FROM stdin;
1	Pantalons	1
2	Vêtements d'extérieur	1
3	Jeans	1
4	Maillots de bain	1
5	Sous-vêtement	1
6	Blazers et costumes	1
7	Robes et jupes	1
8	Chemises et chemisiers	1
9	Robes de mariée	1
10	Polo et t-shirts	1
12	Pantalons	2
13	Jeans	2
14	Blazers et costumes	2
15	Chemises	2
16	Polo et t-shirts	2
11	Bonnets et chapeaux	1
18	Bonnets et chapeaux	2
19	Pantalons et jeans	3
20	Maillots de bain	3
21	Sous-vêtement	3
22	Robes et jupes	3
23	Chemises et chemisiers	3
24	Polos et T-shirts	3
25	Bonnets et chapeaux	3
26	Pantalons et jeans	4
27	Blazers et costumes	4
28	Chemises et chemisiers	4
29	Polos et T-shirts	4
30	Bonnets et chapeaux	4
\.


--
-- TOC entry 3249 (class 0 OID 17026)
-- Dependencies: 229
-- Data for Name: district; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.district (district_id, name) FROM stdin;
1	Abidjan 
2	Bas-Sassandra
3	Comoé
4	Denguélé
5	Gôh-Djiboua
6	Lacs
7	Lagunes
8	Montagnes
9	Sassandra-Marahoué
10	Savanes
11	Vallée du Bandama
12	Woroba
13	Yamoussoukro
14	Zanzan
\.


--
-- TOC entry 3257 (class 0 OID 17132)
-- Dependencies: 237
-- Data for Name: evaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evaluation (advertiser_id, guest_id, rating_id, comment, evaluation_id) FROM stdin;
\.


--
-- TOC entry 3279 (class 0 OID 41465)
-- Dependencies: 259
-- Data for Name: fashion_gender; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fashion_gender (gender_id, gender_name) FROM stdin;
1	Femmes
2	Hommes
4	Enfants (Garçons)
3	Enfants (Filles)
5	Bébés
\.


--
-- TOC entry 3256 (class 0 OID 17118)
-- Dependencies: 236
-- Data for Name: favorite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorite (user_id, advert_id, created_at) FROM stdin;
\.


--
-- TOC entry 3227 (class 0 OID 16785)
-- Dependencies: 207
-- Data for Name: follow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.follow (user_id, follower_id) FROM stdin;
\.


--
-- TOC entry 3267 (class 0 OID 33191)
-- Dependencies: 247
-- Data for Name: form_field; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.form_field (form_field_id, content) FROM stdin;
1	{"showAdTypes":false,"optionT1":[{"id":1,"label":"Vente"},{"id":2,"label":"Recherche"},{"id":3,"label":"Troc"},{"id":4,"label":"Don"}],"optionT2":[{"id":1,"label":"Vente"},{"id":2,"label":"Recherche"}],"typesOptions":[{"id":1,"label":"Vente"},{"id":2,"label":"Recherche"},{"id":3,"label":"Troc"},{"id":4,"label":"Don"}],"titleLabel":"Titre de l'annonce","description":"","showPrice":true,"priceLabel":"Prix","showHousingRoom":false,"clothingTypes":[{"id":1,"label":"Femmes"},{"id":2,"label":"Hommes"},{"id":3,"label":"Enfants"}],"clothingSizes":[],"shoesTypes":[{"id":1,"label":"Femmes"},{"id":2,"label":"Hommes"},{"id":3,"label":"Enfants"}],"shoesSizes":[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,"50 et plus"],"genders":[{"id":1,"label":"Feminin"},{"id":2,"label":"Masculin"}],"menClothingSizes":["XS","S","M","L","XL","XXL","XXXL et plus"],"womenClothingSizes":[32,34,36,38,40,42,44,46,48,"50 et plus"],"childClothingSizes":["3 ans","4 ans","5 ans","6 ans","8 ans","10 ans","12 ans","14 ans","16 ans"],"services":[{"id":1,"label":"Informatique, Internet, télécom"},{"id":2,"label":"Décoration, art"},{"id":3,"label":"Services ménagers"},{"id":5,"label":"Beauté, santé"},{"id":6,"label":"Batiment, contruction"},{"id":7,"label":"Transport, déménagement"},{"id":8,"label":"Sécurité"},{"id":9,"label":"Publicité"},{"id":10,"label":"Beauté, santé"},{"id":11,"label":"Formation, Cours à domicile, cours particuliers"},{"id":12,"label":"Reparation, depannage, maintenance"},{"id":13,"label":"Service traiteur"},{"id":14,"label":"Autres"}],"carsYears":[2019,2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000,1999,1998,1997,1996,1995,1994,1993,1992,1991,1990,1989,1988,1987,1986,1985,1984,1983,1982,1981,1980,1979,1978,1977,1976,1975,1974,1973,1972,1971,1970,1969,1968,1967,1966,1965,1964,1963,1962,1961,"avant 1960"],"carsBrands":[{"value":"ACURA","label":"Acura"},{"value":"ALFA","label":"Alfa Romeo"},{"value":"AMC","label":"AMC"},{"value":"ASTON","label":"Aston Martin"},{"value":"AUDI","label":"Audi"},{"value":"AVANTI","label":"Avanti"},{"value":"BENTL","label":"Bentley"},{"value":"BMW","label":"BMW"},{"value":"BUICK","label":"Buick"},{"value":"CAD","label":"Cadillac"},{"value":"CHEV","label":"Chevrolet"},{"value":"CHRY","label":"Chrysler"},{"value":"DAEW","label":"Daewoo"},{"value":"DAIHAT","label":"Daihatsu"},{"value":"DATSUN","label":"Datsun"},{"value":"DELOREAN","label":"DeLorean"},{"value":"DODGE","label":"Dodge"},{"value":"EAGLE","label":"Eagle"},{"value":"FER","label":"Ferrari"},{"value":"FIAT","label":"FIAT"},{"value":"FISK","label":"Fisker"},{"value":"FORD","label":"Ford"},{"value":"FREIGHT","label":"Freightliner"},{"value":"GEO","label":"Geo"},{"value":"GMC","label":"GMC"},{"value":"HONDA","label":"Honda"},{"value":"AMGEN","label":"HUMMER"},{"value":"HYUND","label":"Hyundai"},{"value":"INFIN","label":"Infiniti"},{"value":"ISU","label":"Isuzu"},{"value":"JAG","label":"Jaguar"},{"value":"JEEP","label":"Jeep"},{"value":"KIA","label":"Kia"},{"value":"LAM","label":"Lamborghini"},{"value":"LAN","label":"Lancia"},{"value":"ROV","label":"Land Rover"},{"value":"LEXUS","label":"Lexus"},{"value":"LINC","label":"Lincoln"},{"value":"LOTUS","label":"Lotus"},{"value":"MAS","label":"Maserati"},{"value":"MAYBACH","label":"Maybach"},{"value":"MAZDA","label":"Mazda"},{"value":"MCLAREN","label":"McLaren"},{"value":"MB","label":"Mercedes-Benz"},{"value":"MERC","label":"Mercury"},{"value":"MERKUR","label":"Merkur"},{"value":"MINI","label":"MINI"},{"value":"MIT","label":"Mitsubishi"},{"value":"NISSAN","label":"Nissan"},{"value":"OLDS","label":"Oldsmobile"},{"value":"PEUG","label":"Peugeot"},{"value":"PLYM","label":"Plymouth"},{"value":"PONT","label":"Pontiac"},{"value":"POR","label":"Porsche"},{"value":"RAM","label":"RAM"},{"value":"REN","label":"Renault"},{"value":"RR","label":"Rolls-Royce"},{"value":"SAAB","label":"Saab"},{"value":"SATURN","label":"Saturn"},{"value":"SCION","label":"Scion"},{"value":"SMART","label":"smart"},{"value":"SRT","label":"SRT"},{"value":"STERL","label":"Sterling"},{"value":"SUB","label":"Subaru"},{"value":"SUZUKI","label":"Suzuki"},{"value":"TESLA","label":"Tesla"},{"value":"TOYOTA","label":"Toyota"},{"value":"TRI","label":"Triumph"},{"value":"VOLKS","label":"Volkswagen"},{"value":"VOLVO","label":"Volvo"},{"value":"YUGO","label":"Yugo"}],"housingTypes":[{"id":1,"label":"Maison"},{"id":2,"label":"Appartement"},{"id":3,"label":"Terrain"}]}
\.


--
-- TOC entry 3272 (class 0 OID 41438)
-- Dependencies: 252
-- Data for Name: job_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_attribute (advert_id, job_domain_id, job_type_id) FROM stdin;
\.


--
-- TOC entry 3287 (class 0 OID 41540)
-- Dependencies: 267
-- Data for Name: job_field; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_field (field_id, field_name) FROM stdin;
1	Agriculture / Agroalimentaire / Environnement
2	Banques / Assurances / Finance
3	Commerce / Distribution
4	Communication / Publicité / Média
5	Conseil / Consulting
6	Construction / BTP / Immobilier
7	Transport / Logistique
8	Tourisme / Hôtellerie / Restauration / Loisirs
9	Services aux entreprises
10	Santé / Social
11	Informatique - Télécom
12	Industries
13	Enseignement / Formation / Cours particuliers
14	Réparation / Maintenance
15	Restauration / Services traiteurs
16	Sécurité / Gardiennage
17	Art, décoration
18	Services ménagers / Personnel De Maison / Domestique
\.


--
-- TOC entry 3231 (class 0 OID 16820)
-- Dependencies: 211
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.message (message_id, chat_id, body, "time", is_read, user_id, message_type_id) FROM stdin;
\.


--
-- TOC entry 3235 (class 0 OID 16883)
-- Dependencies: 215
-- Data for Name: message_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.message_type (message_type_id, name) FROM stdin;
1	text
2	picture
3	file
\.


--
-- TOC entry 3218 (class 0 OID 16733)
-- Dependencies: 198
-- Data for Name: phone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phone (user_id, phone_number) FROM stdin;
\.


--
-- TOC entry 3273 (class 0 OID 41441)
-- Dependencies: 253
-- Data for Name: phone_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phone_attribute (advert_id, phone_brand_id) FROM stdin;
\.


--
-- TOC entry 3271 (class 0 OID 41435)
-- Dependencies: 251
-- Data for Name: real_estate_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.real_estate_attribute (advert_id, type_id, area, room_number) FROM stdin;
\.


--
-- TOC entry 3289 (class 0 OID 41552)
-- Dependencies: 269
-- Data for Name: real_estate_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.real_estate_type (type_id, name, category_id) FROM stdin;
1	Studios et appartements	67
2	Maisons & Villas	67
3	Terrains	67
4	Parkings	67
5	Bureaux et commerces	67
6	Studios et appartements	68
7	Maisons & Villas	68
8	Colocations	68
9	Terrains	68
10	Parkings	68
11	Chambres d'hôtels	68
12	Bureaux et commerces	68
13	Studios et appartements	69
14	Maisons & Villas	69
15	Colocations	69
16	Terrains	69
17	Parkings	69
18	Chambres d'hôtels	69
19	Bureaux et commerces	69
\.


--
-- TOC entry 3241 (class 0 OID 16928)
-- Dependencies: 221
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report (report_id, advert_id, created_at, report_message, report_type_id, user_id, user_email) FROM stdin;
\.


--
-- TOC entry 3243 (class 0 OID 16940)
-- Dependencies: 223
-- Data for Name: report_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_type (report_type_id, title) FROM stdin;
1	Annonce mensongère et trompeuse
2	L’annonceur est malhonnête
3	L’annonce ne correspond pas aux images
4	L’annonce enfreint les règles de site
5	L’annonce se trouve dans la mauvaise catégorie
6	Autres raisons
\.


--
-- TOC entry 3265 (class 0 OID 17213)
-- Dependencies: 245
-- Data for Name: search; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.search (query, "time", user_id, is_success, category_id) FROM stdin;
\.


--
-- TOC entry 3274 (class 0 OID 41444)
-- Dependencies: 254
-- Data for Name: service_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_attribute (advert_id, service_domain_id) FROM stdin;
\.


--
-- TOC entry 3226 (class 0 OID 16779)
-- Dependencies: 206
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.session (session_id, user_id, created_at, last_activity_time, access_token) FROM stdin;
46	30	2019-01-29 07:48:54.719975	\N	8b30f6dc-9d39-4c02-9026-1004500157e7
\.


--
-- TOC entry 3260 (class 0 OID 17172)
-- Dependencies: 240
-- Data for Name: share; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.share (advert_id, guest_id, social_media_id, shared_at) FROM stdin;
\.


--
-- TOC entry 3285 (class 0 OID 41513)
-- Dependencies: 265
-- Data for Name: shoe_size; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shoe_size (size_id, size_value) FROM stdin;
1	16
2	17
3	18
4	19
5	20
6	21
7	22
8	23
9	24
10	25
11	26
12	27
13	28
14	29
15	30
16	31
17	32
18	33
19	34
20	35
21	36
22	37
23	38
24	39
25	40
26	41
27	42
28	43
29	44
30	45
31	46
32	47
33	48
34	49
35	50
\.


--
-- TOC entry 3262 (class 0 OID 17188)
-- Dependencies: 242
-- Data for Name: social_media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_media (social_media_id, name) FROM stdin;
1	facebook
2	whatsapp
3	twitter
\.


--
-- TOC entry 3253 (class 0 OID 17075)
-- Dependencies: 233
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store (store_id, brand_name, owner_id, slogan, profile_picture_url, background_picture_url, store_path) FROM stdin;
1	NIKE	30	\N	\N	\N	nike
2	ADIDAS	31	\N	\N	\N	adidas
\.


--
-- TOC entry 3217 (class 0 OID 16724)
-- Dependencies: 197
-- Data for Name: user_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_account (user_id, name, email, profile_picture, password, auth_type_id, city_id, account_type_id) FROM stdin;
30	behouba	behouba@gmail.com	https://cache3.youla.io/files/images/80_80/5b/e6/5be6f5f3cf2045d381310d1e.jpg	$2a$14$QCg4qbv9Xu6tfkiZvMMan.NnnPoaNeCPmcrY2Zsqdu2cJlf7IO/iW	1	\N	1
31	behouba2	behouba@yandex.ru	https://cache3.youla.io/files/images/80_80/5b/e6/5be6f5f3cf2045d381310d1e.jpg	$2a$14$ZCSo0DC2JALqReXYH8RTN.DVGo0cCV14.CR7VEd6pWVUCwO2XpLZq	1	\N	1
\.


--
-- TOC entry 3264 (class 0 OID 17201)
-- Dependencies: 244
-- Data for Name: verified_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.verified_user (user_id, firstname, lastname, id_card_no, id_card_url) FROM stdin;
\.


--
-- TOC entry 3259 (class 0 OID 17168)
-- Dependencies: 239
-- Data for Name: view; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.view (advert_id, guest_id, viewed_at) FROM stdin;
\.


--
-- TOC entry 3277 (class 0 OID 41452)
-- Dependencies: 257
-- Data for Name: year; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.year (car_year_id, year) FROM stdin;
1	1960
2	1961
3	1962
4	1963
5	1964
6	1965
7	1966
8	1967
9	1968
10	1969
11	1970
12	1971
13	1972
14	1973
15	1974
16	1975
17	1976
18	1977
19	1978
20	1979
21	1980
22	1981
23	1982
24	1983
25	1984
26	1985
27	1986
28	1987
29	1988
30	1989
31	1990
32	1991
33	1992
34	1993
35	1994
36	1995
37	1996
38	1997
39	1998
40	1999
41	2000
42	2001
43	2002
44	2003
45	2004
46	2005
47	2006
48	2007
49	2008
50	2009
51	2010
52	2011
53	2012
54	2013
55	2014
56	2015
57	2016
58	2017
59	2018
60	2019
\.


--
-- TOC entry 3340 (class 0 OID 0)
-- Dependencies: 201
-- Name: account_state_account_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_state_account_state_id_seq', 3, true);


--
-- TOC entry 3341 (class 0 OID 0)
-- Dependencies: 203
-- Name: account_type_account_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_type_account_type_id_seq', 2, true);


--
-- TOC entry 3342 (class 0 OID 0)
-- Dependencies: 218
-- Name: advert_advert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.advert_advert_id_seq', 65, true);


--
-- TOC entry 3343 (class 0 OID 0)
-- Dependencies: 226
-- Name: advert_state_advert_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.advert_state_advert_state_id_seq', 3, true);


--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 224
-- Name: advert_type_advert_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.advert_type_advert_type_id_seq', 5, true);


--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_type_auth_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_type_auth_type_id_seq', 3, true);


--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 255
-- Name: car_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.car_brand_id_seq', 71, true);


--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 256
-- Name: car_year_car_year_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.car_year_car_year_id_seq', 60, true);


--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 212
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_category_id_seq', 143, true);


--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 208
-- Name: chat_chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_chat_id_seq', 1, false);


--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 234
-- Name: chat_state_chat_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_state_chat_state_id_seq', 2, true);


--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 230
-- Name: city_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_city_id_seq', 50, true);


--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 262
-- Name: clothing_type_clothing_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clothing_type_clothing_type_id_seq', 31, true);


--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 216
-- Name: condition_condition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.condition_condition_id_seq', 2, true);


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 258
-- Name: fashion_gender_gender_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fashion_gender_gender_id_seq', 5, true);


--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 260
-- Name: fashion_size_size_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fashion_size_size_id_seq', 31, true);


--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 268
-- Name: housing_type_housing_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.housing_type_housing_type_id_seq', 19, true);


--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 266
-- Name: job_field_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_field_field_id_seq', 18, true);


--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 210
-- Name: message_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.message_message_id_seq', 1, false);


--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 214
-- Name: message_type_table_message_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.message_type_table_message_type_id_seq', 3, true);


--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 228
-- Name: region_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.region_region_id_seq', 14, true);


--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 220
-- Name: report_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_report_id_seq', 1, false);


--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 222
-- Name: report_type_report_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_type_report_type_id_seq', 6, true);


--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 205
-- Name: session_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.session_session_id_seq', 46, true);


--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 264
-- Name: shoe_size_size_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shoe_size_size_id_seq', 35, true);


--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 241
-- Name: social_media_social_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_media_social_media_id_seq', 3, true);


--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 232
-- Name: store_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_store_id_seq', 2, true);


--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 196
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_user_id_seq', 31, true);


--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 243
-- Name: verified_user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.verified_user_user_id_seq', 1, false);


-- Completed on 2019-01-31 01:58:59

--
-- PostgreSQL database dump complete
--

