# -*- coding=utf-8

import os
from sqlite3 import dbapi2 as sqlite

def get_db_handle():
    path = os.path.join(os.path.dirname(__file__), "..", "db",
    "report_contents.db")
    return sqlite.connect(path)

