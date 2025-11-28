/*vybrat pouze jedno označení diagnózy - 'ZN prsu (C50) u zen' v tabulce incidence i mortalita
*/  
CREATE OR REPLACE TEMPORARY TABLE "incidence_cancer_diagnoza" AS
SELECT *
FROM "incidence_rakoviny_prsu"
WHERE "diagnoza" LIKE 'ZN prsu (C50) u zen'
;

CREATE OR REPLACE TEMPORARY TABLE "mortalita_cancer_diagnoza" AS
SELECT *
FROM "mortalita_rakovina_prsu"
WHERE "diagnoza" LIKE 'ZN prsu (C50) u zen'
;

/* spojení INNER JOIN tabulky incidence a mortalita rakoviny prsu a přejmenování sloupců z tabulky mortalita, protože měly stejné názvy jako v tabulce incidence
*/
CREATE OR REPLACE TABLE "JOIN_incidence_mortalita_rakoviny_prsu" AS
SELECT ICD.*
      , MCD."celkem_absolutni_pocet" AS "mortalita_celkem_abs_pocet"
      , MCD."vek_0_19" AS "mor_vek_0_19"
      , MCD."vek_20_39" AS "mor_vek_20_39"
      , MCD."vek_40_49" AS "mor_vek_40_49"
      , MCD."vek_50_59" AS "mor_vek_50_59"
      , MCD."vek_60_69" AS "mor_vek_60_69"
      , MCD."vek_70_79" AS "mor_vek_70_79"
      , MCD."vek_80_a_vice" AS "mor_vek_80_a_vice"
      , MCD."celkem_pocet_na_100000_obyvatel" AS "mortalita_celkem_na_100000"
      , MCD."vek_0_19_pno" AS "mor_vek_0_19_pno"
      , MCD."vek_20_30_pno" AS "mor_vek_20_39_pno"
      , MCD."vek_40_49_pno" AS "mor_vek_40_49_pno"
      , MCD."vek_50_59_pno" AS "mor_vek_50_59_pno"
      , MCD. "vek_60_69_pno" AS "mor_vek_60_69_pno"
      , MCD."vek_70_79_pno" AS "mor_vek_70_79_pno"
      , MCD."vek_80_a_vice_pno" AS "mor_vek_80_a_vice_pno"
      , MCD."ASR_na_vekovou_strukturu_populace_CR_2023" AS "mortal_ASR_na_vekovou_strukturu_populace_CR_2023"
      , MCD."ASR_na_Evropsky_vekovy_standard_1976" AS "mortal_ASR_na_Evropsky_vekovy_standard_1976"
      , MCD."ASR_na_Evropsky_vekovy_standard_2013" AS "mortal_ASR_na_Evropsky_vekovy_standard_2013"
      , MCD."ASR_na_svetovy_vekovy_standard" AS "mortal_ASR_na_svetovy_vekovy_standard"
FROM "incidence_cancer_diagnoza" AS ICD
INNER JOIN "mortalita_cancer_diagnoza" AS MCD ON MCD."rok" = ICD."rok" AND MCD."kraj_nuts_kod" = ICD."kraj_nuts_kod"
;

/* vybrat pouze jedno označení diagnózy - 'ZN prostaty (C61)' v tabulce incidence i mortalita
*/
CREATE OR REPLACE TEMPORARY TABLE "incidence_cancer" AS
SELECT *
FROM "incidence_rakoviny_prostaty"
WHERE "diagnoza" LIKE 'ZN prostaty (C61)'
;

CREATE OR REPLACE TEMPORARY TABLE "mortalita_cancer" AS
SELECT *
FROM "mortalita_rakovina_prostaty"
WHERE "diagnoza" LIKE 'ZN prostaty (C61)'
;

/* spojení INNER JOIN tabulky incidence a mortalita rakoviny prostaty a přejmenování sloupců z tabulky mortalita, protože měly stejné názvy jako v tabulce incidence
*/
CREATE OR REPLACE TABLE "JOIN_incidence_mortalita_rakovina_prostaty" AS
SELECT IC.*
      , MC."celkem_absolutni_pocet" AS "mortalita_celkem_abs_pocet"
      , MC."vek_0_19" AS "mor_vek_0_19"
      , MC."vek_20_39" AS "mor_vek_20_39"
      , MC."vek_40_49" AS "mor_vek_40_49"
      , MC."vek_50_59" AS "mor_vek_50_59"
      , MC."vek_60_69" AS "mor_vek_60_69"
      , MC."vek_70_79" AS "mor_vek_70_79"
      , MC."vek_80_a_vice" AS "mor_vek_80_a_vice"
      , MC."celkem_pocet_na_100000_obyvatel" AS "mortalita_celkem_na_100000"
      , MC."vek_0_19_pno" AS "mor_vek_0_19_pno"
      , MC."vek_20_30_pno" AS "mor_vek_20_39_pno"
      , MC."vek_40_49_pno" AS "mor_vek_40_49_pno"
      , MC."vek_50_59_pno" AS "mor_vek_50_59_pno"
      , MC. "vek_60_69_pno" AS "mor_vek_60_69_pno"
      , MC."vek_70_79_pno" AS "mor_vek_70_79_pno"
      , MC."vek_80_a_vice_pno" AS "mor_vek_80_a_vice_pno"
      , MC."ASR_na_vekovou_strukturu_populace_CR_2023" AS "mortal_ASR_na_vekovou_strukturu_populace_CR_2023"
      , MC."ASR_na_Evropsky_vekovy_standard_1976" AS "mortal_ASR_na_Evropsky_vekovy_standard_1976"
      , MC."ASR_na_Evropsky_vekovy_standard_2013" AS "mortal_ASR_na_Evropsky_vekovy_standard_2013"
      , MC."ASR_na_svetovy_vekovy_standard" AS "mortal_ASR_na_svetovy_vekovy_standard"
FROM "incidence_cancer" AS IC
INNER JOIN "mortalita_cancer" AS MC ON MC."rok" = IC."rok" AND MC."kraj_nuts_kod" = IC."kraj_nuts_kod"
;
