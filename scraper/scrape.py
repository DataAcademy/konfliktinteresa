import sqlite3
import lxml.html
import urllib2
import re
import json


base = "http://www.konfliktinteresa.me"

start = "http://www.konfliktinteresa.me/new/evid_funkc/funkcioneri/EvidencijaFun.php?txtNaziv=&VR_FUN=%s"

listpages = "/new/evid_funkc/funkcioneri/EvidencijaFun.php?pageNum_Recordset1=%s&totalRows_Recordset1=54&txtNaziv=&VR_FUN=%s"

funcs = [3,2]

def get_root(u):
    print u
    return lxml.html.fromstring(urllib2.urlopen(u).read())

def get_person_page(fun,i):
    r = get_root("%s%s"%(base,listpages%(i,fun)))
    return r.xpath("//font[@size='2']/a/@href")
    
def get_persons(fun):
    r = get_root(start%fun)
    nextlink = r.xpath("//img[@src='Next.gif']/../@href")[0]
    totalrows = int(re.match(".*totalRows_Recordset1=([0-9]+).*?"
                             ,nextlink).group(1))
    return reduce(lambda x,y: x+y, 
        [get_person_page(fun,i) for i in range(0,totalrows/50+1)],
        [])

def dotable(r):
    return dict([[i.text_content() for i in j.xpath(".//td[not(@colspan)]")] for j in
            r.xpath(".//tr") if len(j) > 1 ])
    
def process_entry(l):
    r = get_root("%s/new/evid_funkc/funkcioneri/%s"%(base,l))
    data = {"link": "%s/new/evid_funkc/funkcioneri/%s"%(base,l)}
    bitable = r.xpath("//table[@class='table']")[0]
    data['info'] = dotable(bitable)
    dtables = r.xpath(".//table[@class='t2 table-striped2']")
    data['tables'] = [dict(dotable(i)) for i in
    dtables]
    with open("data/%s-%s.json"%re.match(
        ".*?ID=(.*),.*?Godina=([0-9]+).*?",l).groups(),"wb") as f:
        json.dump(data,f,ensure_ascii=True,encoding="UTF-8")

def process_person(l):
    r = get_root("%s/new/evid_funkc/funkcioneri/%s"%(base,l))
    entries = r.xpath(".//font[@size='2']/a/@href")
    for e in entries:
        process_entry(e)

if __name__=="__main__":
    for f in funcs:
        for p in get_persons(f):
            process_person(p)
