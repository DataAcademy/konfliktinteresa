# Mapping conflicts of interest in Montenegro

> This repository is a result of the [2015 POINT conference datathon](http://point.zastone.ba/en/data-academy-datathon/). The project is a continuation of the [Data Academy workshop in Podgorica](http://zastone.ba/en/da-training-in-montenegro-making-public-data-more-accessible/) in April 2015.

Montenegro public officials self-declare their assets every year. The government website [konfliktinteresa.me](http://www.konfliktinteresa.me/new/index.php?lang=me) provides public access to these asset declarations: however, the information can be accessed only one declaration at a time, which makes it virtually impossible to do meaningful analysis of the information, like average salaries, or disaggregations by gender, age, political party etc. 

In addition, public official fill in their declarations _narratively_: for example, there are no hard rules around how to insert salary information. This means public officials sometimes fill in the annual amount, and other times their monthly salaries, in text form. This loose structure of information makes it hard to analyse properly, because almost every asset declaration needs some amount of manual checking. 

This project is an attempt to scrape and clean part of the information, to prove that a clean, well-defined database, content type definition and methodology would greatly improve the ability to anylse the information. This in turn would give researchers, journalists and the government itself power to make meaning out of this data, make more informed choices and better monitor corruption, nepotism and other irregularities.

##Key questions for the project

- How rich are public officials?
- Which families are the most influential in Montenegro?
- What loans do they have?

##Main output

We created a .csv file containing the main information fields (defined below), scraped and cleaned, ready for analysis.

###Fields
```TO BE COMPLETED```

- Name
- Function
- Employer
- Salary
- Ownership of private companies

##Links

- Original website sample entry: [http://www.konfliktinteresa.me/new/evid_funkc/funkcioneri/EvidFunPrijavePrikaz.php?ID=Oz4-MjU-OCY6Pz43Ow,,&Godina=2014&Rbr=1](http://www.konfliktinteresa.me/new/evid_funkc/funkcioneri/EvidFunPrijavePrikaz.php?ID=Oz4-MjU-OCY6Pz43Ow,,&Godina=2014&Rbr=1)
- SQL schema: in the doc/ subfolder

## Project parts

```scraper``` - A Python scraper to download the data
```bin/ingest```  - A script to load the json data to the database
```db``` - the database files.

## Bootstrapping

Since the data is already in the repo there is no need to run the scraper.

1) Create the database 


```
db/generate_db
```

2) Populate the Database

```
bin/ingest
```

Have fun!

The raw comments are in this [google
doc](https://docs.google.com/document/d/1dQkW0dJyh2BMNrJS_DjPElNIVjy36ih8vpdOAi_fyBQ/edit#heading=h.l0ljwpnglhrp)
