#!/usr/bin/env python
# -*- coding=utf-8

from database import *

def populate_job():
    db = get_db_handle()
    c = db.cursor()

    sql_string = """INSERT INTO job (person_id, report_year, job_name)
                   SELECT report.subject_id, report.report_year, report_line_item.line_value
                   FROM report left join report_stanza on report_stanza.report_id = report.report_id
                   LEFT JOIN report_line_item on report_stanza.stanza_id = report_line_item.stanza_id
                   WHERE report_line_item.line_key = 'Javna funkcija' ;
                 """

    sql_string2 = """INSERT INTO job (person_id, report_year, job_name, monthly_salary)
                   SELECT r.subject_id, r.report_year, rli.line_value, rli2.line_value
                   FROM report r, report_line_item rli, report_line_item rli2, report_stanza rs, report_stanza rs2 WHERE
                    r.report_id = rs.report_id AND rli.stanza_id = rs.stanza_id AND rli.line_key = 'Javna funkcija'
                    AND rli2.stanza_id = rs2.stanza_id AND rs2.report_id = r.report_id AND
                    rli2.line_key = 'Mjeseèna plata';
                 """
    c.execute(sql_string2)

    update_string = """ UPDATE job SET monthly_salary = (SELECT report_line_item.line_value
                   FROM report left join report_stanza on report_stanza.report_id = report.report_id
                   LEFT JOIN report_line_item on report_stanza.stanza_id = report_line_item.stanza_id
                   WHERE report_line_item.line_key = 'Mjeseèna plata') WHERE job_id = """ + str(c.lastrowid) + """ ; """

    #c.execute(update_string)
    db.commit()


if __name__ == '__main__':
    populate_job()