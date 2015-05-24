#!/usr/bin/env python
# -*- coding=utf-8

from database import *

def populate_person():
    db = get_db_handle()
    c = db.cursor()

    sql_string = """INSERT INTO person (person_original_id,person_name) 
                      SELECT subject_id,subject_name FROM report;
                 """
    c.execute(sql_string)
    db.commit()


if __name__ == '__main__':
    populate_person()

