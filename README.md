# Mapping conflicts of Interest in Montenegro

Montenegro public officials report their conflict of interests yearly. The
database lists a lot of information. The published reports do not allow any
kind of analysis on the data contained. This is an attempt to create a
database that supports the kind of analysis we plan to do.

## Project parts

```scraper``` - A Python scraper to download the data
```bin/ingest```  - A script to load the json data to the database
```db``` - the database files.

## Bootstrapping

Since the data is already in the repo there is no need to run the scraper.

1. Create the database 


```
db/generate_db
```

2. Populate the Database

```
bin/ingest
```

Have fun!

You might want to check out the following [google
doc](https://docs.google.com/document/d/1dQkW0dJyh2BMNrJS_DjPElNIVjy36ih8vpdOAi_fyBQ/edit#heading=h.l0ljwpnglhrp)
