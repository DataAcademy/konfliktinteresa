#!/usr/bin/env bash

# Drop, regenerate the DB and ingest the data
# bin_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
# db_dir=$( cd "${bin_dir}/../db" && pwd )

test -f "../db/report_contents.db" && rm "${db_dir}/report_contents.db"
eval "../db/generate_db"
eval "../bin/ingest"
eval "../bin/populate_person.py"
eval "../bin/populate_company_ownership.py"

echo "Regenerated the DB"
