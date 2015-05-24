#!/bin/bash

set -eu
cd $(dirname $0)

sqlite3 ../db/report_contents.db << EOF
.mode csv
.headers on
.output ../data/raw/company-ownership.csv
SELECT
c.company_id,company_name,company_city,p.person_id,person_name,year,shares,nominal_value,obtained_through
FROM ownership JOIN (SELECT person_name,person_id from person) AS p ON
p.person_id = ownership.person_id JOIN (SELECT
company_id,company_name,company_city FROM company) AS c ON c.company_id =
ownership.company_id;
EOF

sqlite3 ../db/report_contents.db << EOF
.mode csv
.headers on
.output ../data/raw/company-ownership-unparsed.csv
SELECT p.person_id,person_name,year,ownership FROM unparsed_ownership JOIN
(select person_id,person_name FROM person) AS p ON p.person_id =
unparsed_ownership.person_id;
EOF
