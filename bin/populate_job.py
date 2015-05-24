#!/usr/bin/env python
# -*- coding=utf-8

from database import *

def populate_job():
    db = get_db_handle()
    c = db.cursor()

    sql_string = """INSERT INTO job (person_id, report_year, job_name, monthly_salary)
                SELECT p.person_id, r.report_year, rli.line_value, rli2.line_value
                FROM report r, report_line_item rli, report_line_item rli2, report_stanza rs, report_stanza rs2,
                person p WHERE
                r.report_id = rs.report_id AND rli.stanza_id = rs.stanza_id AND rli.line_key = 'Javna funkcija'
                AND rli2.stanza_id = rs2.stanza_id AND rs2.report_id = r.report_id AND
                rli2.line_key = 'Mjeseèna plata' and p.person_original_id = r.subject_id;
                """
    c.execute(sql_string)

    db.commit()


if __name__ == '__main__':
    populate_job()
