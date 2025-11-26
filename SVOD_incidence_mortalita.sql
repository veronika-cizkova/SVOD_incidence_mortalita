/* vybrat z kompletní SVOD tabulky incidence/mortalita pouze diagnózu rakoviny prsu, která se označuje jako C50. Přidat do tabulky územní kód a nuts kraje - využité v propojování s dalšími tabulkami v budoucnu 
(nemusíme se spoléhat, že všechny názvy jsou napsané stejně, využijeme kód, který je vždy stejný)
*/
CREATE OR REPLACE TABLE "incidence_rakoviny_prsu" AS
SELECT *,
      CASE
      WHEN "kraj" ILIKE 'Czechia' THEN '100'
      WHEN "kraj" ILIKE 'Kralovehradecky%' THEN '3085'
      WHEN "kraj" ILIKE 'Liberecky%' THEN '3077'
      WHEN "kraj" ILIKE 'Stredocesky%' THEN '3026'
      WHEN "kraj" ILIKE 'Hlavni mesto%' THEN '3018'
      WHEN "kraj" ILIKE 'Jihocesky%' THEN '3034'
      WHEN "kraj" ILIKE 'Plze%' THEN '3042'
      WHEN "kraj" ILIKE 'Karlovarsky%' THEN '3051'
      WHEN "kraj" ILIKE 'Ustecky%' THEN '3069'
      WHEN "kraj" ILIKE 'Jihomoravsky%' THEN '3115'
      WHEN "kraj" ILIKE 'Pardubicky%' THEN '3093'
      WHEN "kraj" ILIKE '%Vysocina%' THEN '3107'
      WHEN "kraj" ILIKE 'Morav%' THEN '3140'
      WHEN "kraj" ILIKE 'Olomoucky%' THEN '3123'
      WHEN "kraj" ILIKE 'Zlinsky%' THEN '3131'
      ELSE 'nic'
      END AS "uzemni_kod"
    ,CASE
      WHEN "kraj" ILIKE 'Czechia' THEN '100'
      WHEN "kraj" ILIKE 'Kralovehradecky%' THEN 'CZ052'
      WHEN "kraj" ILIKE 'Liberecky%' THEN 'CZ051'
      WHEN "kraj" ILIKE 'Stredocesky%' THEN 'CZ020'
      WHEN "kraj" ILIKE 'Hlavni mesto%' THEN 'CZ010'
      WHEN "kraj" ILIKE 'Jihocesky%' THEN 'CZ031'
      WHEN "kraj" ILIKE 'Plze%' THEN 'CZ032'
      WHEN "kraj" ILIKE 'Karlovarsky%' THEN 'CZ041'
      WHEN "kraj" ILIKE 'Ustecky%' THEN 'CZ042'
      WHEN "kraj" ILIKE 'Jihomoravsky%' THEN 'CZ064'
      WHEN "kraj" ILIKE 'Pardubicky%' THEN 'CZ053'
      WHEN "kraj" ILIKE '%Vysocina%' THEN 'CZ063'
      WHEN "kraj" ILIKE 'Morav%' THEN 'CZ080'
      WHEN "kraj" ILIKE 'Olomoucky%' THEN 'CZ071'
      WHEN "kraj" ILIKE 'Zlinsky%' THEN 'CZ072'
      ELSE 'nic'
      END AS "kraj_nuts_kod"
FROM "SVOD_datovy_souhr"
WHERE "diagnoza" ILIKE '%C50%'
;

CREATE OR REPLACE TABLE "mortalita_rakovina_prsu" AS
SELECT *,
      CASE
      WHEN "kraj" ILIKE 'Ceska republika%' THEN '100'
      WHEN "kraj" ILIKE 'Kralovehradecky%' THEN '3085'
      WHEN "kraj" ILIKE 'Liberecky%' THEN '3077'
      WHEN "kraj" ILIKE 'Stredocesky%' THEN '3026'
      WHEN "kraj" ILIKE 'Hlavni mesto%' THEN '3018'
      WHEN "kraj" ILIKE 'Jihocesky%' THEN '3034'
      WHEN "kraj" ILIKE 'Plzensky%' THEN '3042'
      WHEN "kraj" ILIKE 'Karlovarsky%' THEN '3051'
      WHEN "kraj" ILIKE 'Ustecky%' THEN '3069'
      WHEN "kraj" ILIKE 'Jihomoravsky%' THEN '3115'
      WHEN "kraj" ILIKE 'Pardubicky%' THEN '3093'
      WHEN "kraj" ILIKE '%Vysocina%' THEN '3107'
      WHEN "kraj" ILIKE 'Morav%' THEN '3140'
      WHEN "kraj" ILIKE 'Olomoucky%' THEN '3123'
      WHEN "kraj" ILIKE 'Zlinsky%' THEN '3131'
      ELSE 'nic'
      END AS "uzemni_kod"
    ,CASE
      WHEN "kraj" ILIKE 'Ceska%' THEN '100'
      WHEN "kraj" ILIKE 'Kralovehradecky%' THEN 'CZ052'
      WHEN "kraj" ILIKE 'Liberecky%' THEN 'CZ051'
      WHEN "kraj" ILIKE 'Stredocesky%' THEN 'CZ020'
      WHEN "kraj" ILIKE 'Hlavni mesto%' THEN 'CZ010'
      WHEN "kraj" ILIKE 'Jihocesky%' THEN 'CZ031'
      WHEN "kraj" ILIKE 'Plzensky%' THEN 'CZ032'
      WHEN "kraj" ILIKE 'Karlovarsky%' THEN 'CZ041'
      WHEN "kraj" ILIKE 'Ustecky%' THEN 'CZ042'
      WHEN "kraj" ILIKE 'Jihomoravsky%' THEN 'CZ064'
      WHEN "kraj" ILIKE 'Pardubicky%' THEN 'CZ053'
      WHEN "kraj" ILIKE '%Vysocina%' THEN 'CZ063'
      WHEN "kraj" ILIKE 'Morav%' THEN 'CZ080'
      WHEN "kraj" ILIKE 'Olomoucky%' THEN 'CZ071'
      WHEN "kraj" ILIKE 'Zlinsky%' THEN 'CZ072'
      ELSE 'nic'
      END AS "kraj_nuts_kod"
FROM "SVOD_mortalita"
WHERE "diagnoza" ILIKE '%C50%'
;

/* vybrat z kompletní SVOD tabulky incidence/mortalita pouze diagnózu rakoviny prostaty, která se označuje jako C61. Přidat do tabulky územní kód a nuts kraje - využité v propojování s dalšími tabulkami v budoucnu 
(nemusíme se spoléhat, že všechny názvy jsou napsané stejně, využijeme kód, který je vždy stejný)
*/
CREATE OR REPLACE TABLE "incidence_rakoviny_prostaty" AS
SELECT *,
   CASE
      WHEN "kraj" ILIKE 'Czechia' THEN '100'
      WHEN "kraj" ILIKE 'Kralovehradecky%' THEN '3085'
      WHEN "kraj" ILIKE 'Liberecky%' THEN '3077'
      WHEN "kraj" ILIKE 'Stredocesky%' THEN '3026'
      WHEN "kraj" ILIKE 'Hlavni mesto%' THEN '3018'
      WHEN "kraj" ILIKE 'Jihocesky%' THEN '3034'
      WHEN "kraj" ILIKE 'Plze%' THEN '3042'
      WHEN "kraj" ILIKE 'Karlovarsky%' THEN '3051'
      WHEN "kraj" ILIKE 'Ustecky%' THEN '3069'
      WHEN "kraj" ILIKE 'Jihomoravsky%' THEN '3115'
      WHEN "kraj" ILIKE 'Pardubicky%' THEN '3093'
      WHEN "kraj" ILIKE '%Vysocina%' THEN '3107'
      WHEN "kraj" ILIKE 'Morav%' THEN '3140'
      WHEN "kraj" ILIKE 'Olomoucky%' THEN '3123'
      WHEN "kraj" ILIKE 'Zlinsky%' THEN '3131'
      ELSE 'nic'
      END AS "uzemni_kod"
    ,CASE
      WHEN "kraj" ILIKE 'Czechia' THEN '100'
      WHEN "kraj" ILIKE 'Kralovehradecky%' THEN 'CZ052'
      WHEN "kraj" ILIKE 'Liberecky%' THEN 'CZ051'
      WHEN "kraj" ILIKE 'Stredocesky%' THEN 'CZ020'
      WHEN "kraj" ILIKE 'Hlavni mesto%' THEN 'CZ010'
      WHEN "kraj" ILIKE 'Jihocesky%' THEN 'CZ031'
      WHEN "kraj" ILIKE 'Plze%' THEN 'CZ032'
      WHEN "kraj" ILIKE 'Karlovarsky%' THEN 'CZ041'
      WHEN "kraj" ILIKE 'Ustecky%' THEN 'CZ042'
      WHEN "kraj" ILIKE 'Jihomoravsky%' THEN 'CZ064'
      WHEN "kraj" ILIKE 'Pardubicky%' THEN 'CZ053'
      WHEN "kraj" ILIKE '%Vysocina%' THEN 'CZ063'
      WHEN "kraj" ILIKE 'Morav%' THEN 'CZ080'
      WHEN "kraj" ILIKE 'Olomoucky%' THEN 'CZ071'
      WHEN "kraj" ILIKE 'Zlinsky%' THEN 'CZ072'
      ELSE 'nic'
      END AS "kraj_nuts_kod"
FROM "SVOD_datovy_souhr"
WHERE "diagnoza" ILIKE '%C61%'
;

CREATE OR REPLACE TABLE "mortalita_rakovina_prostaty" AS
SELECT *,
   CASE
      WHEN "kraj" ILIKE 'Ceska republika%' THEN '100'
      WHEN "kraj" ILIKE 'Kralovehradecky%' THEN '3085'
      WHEN "kraj" ILIKE 'Liberecky%' THEN '3077'
      WHEN "kraj" ILIKE 'Stredocesky%' THEN '3026'
      WHEN "kraj" ILIKE 'Hlavni mesto%' THEN '3018'
      WHEN "kraj" ILIKE 'Jihocesky%' THEN '3034'
      WHEN "kraj" ILIKE 'Plzensky%' THEN '3042'
      WHEN "kraj" ILIKE 'Karlovarsky%' THEN '3051'
      WHEN "kraj" ILIKE 'Ustecky%' THEN '3069'
      WHEN "kraj" ILIKE 'Jihomoravsky%' THEN '3115'
      WHEN "kraj" ILIKE 'Pardubicky%' THEN '3093'
      WHEN "kraj" ILIKE '%Vysocina%' THEN '3107'
      WHEN "kraj" ILIKE 'Morav%' THEN '3140'
      WHEN "kraj" ILIKE 'Olomoucky%' THEN '3123'
      WHEN "kraj" ILIKE 'Zlinsky%' THEN '3131'
      ELSE 'nic'
      END AS "uzemni_kod"
    ,CASE
      WHEN "kraj" ILIKE 'Ceska republika%' THEN '100'
      WHEN "kraj" ILIKE 'Kralovehradecky%' THEN 'CZ052'
      WHEN "kraj" ILIKE 'Liberecky%' THEN 'CZ051'
      WHEN "kraj" ILIKE 'Stredocesky%' THEN 'CZ020'
      WHEN "kraj" ILIKE 'Hlavni mesto%' THEN 'CZ010'
      WHEN "kraj" ILIKE 'Jihocesky%' THEN 'CZ031'
      WHEN "kraj" ILIKE 'Plzensky%' THEN 'CZ032'
      WHEN "kraj" ILIKE 'Karlovarsky%' THEN 'CZ041'
      WHEN "kraj" ILIKE 'Ustecky%' THEN 'CZ042'
      WHEN "kraj" ILIKE 'Jihomoravsky%' THEN 'CZ064'
      WHEN "kraj" ILIKE 'Pardubicky%' THEN 'CZ053'
      WHEN "kraj" ILIKE '%Vysocina%' THEN 'CZ063'
      WHEN "kraj" ILIKE 'Morav%' THEN 'CZ080'
      WHEN "kraj" ILIKE 'Olomoucky%' THEN 'CZ071'
      WHEN "kraj" ILIKE 'Zlinsky%' THEN 'CZ072'
      ELSE 'nic'
      END AS "kraj_nuts_kod"
FROM "SVOD_mortalita"
WHERE "diagnoza" ILIKE '%C61%'
;
