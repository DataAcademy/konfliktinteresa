from sqlite3 import dbapi2 as sqlite


def populate_person():
    db = sqlite.connect('db/report_contents.db')
    c = db.cursor()

    sql_string = """insert into person (person_name) select subject_name from report"""
    c.execute(sql_string)

    db.commit()


