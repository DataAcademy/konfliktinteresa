#/usr/bin/env python
# -*- coding=utf-8

import sqlite3
from database import *

class Company():
    def __init__(self,o):
        self.name = None
        self.city = None
        self.id = None
        self.parse(o)

    def parse(self,o):
        values = o.split("-")
        if len(values) < 2:
            raise ValueError
        (self.name,self.city) = [i.strip() for i in values[0:2]]

    def save(self):
        db = get_db_handle()
        c = db.cursor()
        
        # Only instert companies if not exist - else get id

        c.execute("""SELECT company_id FROM company WHERE company_name = ?
        AND company_city = ?""",(self.name,self.city))
        r = c.fetchone()

        if  r is None:
            sql = """ INSERT INTO company (company_name, company_city)
                VALUES (?,?);"""
            c.execute(sql, (self.name, self.city))
            c.execute("""SELECT last_insert_rowid();""")
            self.id = c.fetchone()[0]
            db.commit()
        else:
            self.id = r[0]

    def __str__(self):
        return "Company: %s (%s)" % (self.name.encode("utf-8"),self.city.encode("utf-8"))

class Ownership():
    def __init__(self,o,v):
        try:
            self.company = Company(o)
            self.company.save()
        except ValueError as e:
            self.company = None
            print "Could not Parse %s"%e
        self.person_id = v["person_id"]
        self.year = v["year"]
        self.dict = {}
        self.parse(o)
    
    def parse(self,o):
        values = o.split("-")
        try:
            self.dict = dict([[i.strip() for i in j.split(":",2)] for j in values[2:]])
        except ValueError as e:
            print "Could not Parse Ownership %s"%e
        print self.dict

    def save(self):
        if not self.company:    
            return
        db = get_db_handle()
        c = db.cursor()
        
        try:
            c.execute("""INSERT INTO ownership 
                (company_id,person_id,year,shares, nominal_value, obtained_through)
                VALUES (?,?,?,?,?,?)""",
                (self.company.id,self.person_id,self.year,self.dict.get("udio"),
                 self.dict.get("Nominalna vrijednost"),
                self.dict.get("Prenos prava")))
            db.commit()
        except sqlite3.IntegrityError:
            print "Relation already in DB"

    def __str__(self):
        if self.company:
            return u"Ownership: %s - %s (%s)"%(self.person_id, self.company.id,self.year)
        else:
            return u"Company failed to parse"

def get_ownerships(db):
    c = db.cursor()

    sql = """
    SELECT person_id,report_year,line_value from person JOIN 
        (SELECT report_year,subject_id,report.report_id,line_value FROM 
         report JOIN (SELECT report_id,line_value from report_stanza JOIN 
         (select stanza_id, line_key, line_value from report_line_item where line_key = 
         "Vlasništvo u privrednim društvima" AND line_value not NULL) 
         AS rl ON rl.stanza_id = report_stanza.stanza_id) 
         AS rs ON rs.report_id = report.report_id) AS
    rp ON rp.subject_id = person.person_original_id;
    """

    c.execute(sql)
    return [dict(zip(["person_id","year","value"],i)) for i in c.fetchall()]
   
def process_ownerships(o,db):
    companies = o["value"].split(";")
    print o["person_id"],companies;
    for c in companies:
       osh = Ownership(c,o)
       osh.save()
       print osh

def run():
    db = get_db_handle()
    ownerships = get_ownerships(db)
    for o in ownerships:
        process_ownerships(o,db)


    #return ownerships


if __name__ == '__main__':
    run()

