#!/usr/bin/env python
# -*- coding=utf-8

from sqlite3 import dbapi2 as sqlite

import os
from database import *

def populate_person():
    db = get_db_handle()
    c = db.cursor()

    sql_string = """insert into person (person_name) select subject_name from report"""
    c.execute(sql_string)

    db.commit()


if __name__ == '__main__':
    populate_person()

