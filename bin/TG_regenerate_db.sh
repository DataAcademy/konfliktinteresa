#!/usr/bin/env bash

# Drop, regenerate the DB and ingest the data
# Tin here: Duplicated the sh file and added direct paths to files, cause original kept failing. Opened issue #1

test -f "../db/report_contents.db" && rm "${db_dir}/report_contents.db"
eval "../db/generate_db"
eval "../bin/ingest"
eval "../bin/populate_person.py"
eval "../bin/populate_company_ownership.py"
eval "${bin_dir}/populate_job.py"

echo "Regenerated the DB"
