#!/usr/bin/env bash

# Drop, regenerate the DB and ingest the data
bin_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
db_dir=$( cd "${bin_dir}/../db" && pwd )

test -f "${db_dir}/report_contents.db" && rm "${db_dir}/report_contents.db"
eval "${db_dir}/generate_db"
eval "${bin_dir}/ingest"
eval "${bin_dir}/populate_person.py"
eval "${bin_dir}/populate_company_ownership.py"

echo "Regenerated the DB"
