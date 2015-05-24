# Mapping conflicts of interest in Montenegro

> This repository is a result of the [2015 POINT conference datathon](http://point.zastone.ba/en/data-academy-datathon/). The project is a continuation of the [Data Academy workshop in Podgorica](http://zastone.ba/en/da-training-in-montenegro-making-public-data-more-accessible/) in April 2015.

##Introduction
Montenegro public officials self-declare their assets every year. The government website [konfliktinteresa.me](http://www.konfliktinteresa.me/new/index.php?lang=me) provides public access to these asset declarations: however, the information can be accessed only one declaration at a time, which makes it virtually impossible to do meaningful analysis of the information, like average salaries, or disaggregations by gender, age, political party etc. 

In addition, public official fill in their declarations _narratively_: for example, there are no hard rules around how to insert salary information. This means public officials sometimes fill in the annual amount, and other times their monthly salaries, in text form. This loose structure of information makes it hard to analyse properly, because almost every asset declaration needs some amount of manual checking. 

Some key questions that we would like to be able to answer, but can't, are:

- How rich are public officials?
- What is their average salary?
- How did their income change in the last decade?
- Which families are the most influential in Montenegro?
- What are their connections with private corporations?
- What loans do they have?

___

##So. What does this project do?
This project is an attempt to scrape and clean part of the information, to prove that a clean, well-defined database, content type definition and methodology would greatly improve the ability to anylse the information. This in turn would give researchers, journalists and the government itself power to make meaning out of this data, make more informed choices and better monitor corruption, nepotism and other irregularities.

##Main output

We created **three .csv files** containing the main information fields (defined below), scraped and cleaned, ready for analysis. The .csv files are:

```data/raw/company-ownership.csv``` has the following fields:
- c.company_ID
- company_name
- company_city
- p.person-id
- person_name
- year
- shares
- nominal_value
- obtained_through

```data/raw/company-ownership-unparsed.csv``` has about 130 rows that were too dirty to be parsed as above, and need manual work to be integrated with the file above.

```data/raw/job.csv``` has the folowing fields:

>to be completed



##Links

- Original website sample entry: [http://www.konfliktinteresa.me/new/evid_funkc/funkcioneri/EvidFunPrijavePrikaz.php?ID=Oz4-MjU-OCY6Pz43Ow,,&Godina=2014&Rbr=1](http://www.konfliktinteresa.me/new/evid_funkc/funkcioneri/EvidFunPrijavePrikaz.php?ID=Oz4-MjU-OCY6Pz43Ow,,&Godina=2014&Rbr=1)
- SQL schema: in the doc/ subfolder

## Project parts

```scraper``` - A Python scraper to download the data
```bin/ingest```  - A script to load the json data to the database
```db``` - the database files.

##Bootstrapping

Since the data is already in the repo there is no need to run the scraper.

##The database
Check out all the field types in ```db/schema.sql```.

##Workflow

The .csv files are already created: if you want to re-create the .csv files (because you perhaps want to change the fields that get pulled from the database), do the following: 

```cd``` 

to the working directory. Then, run:

```sh bin/regenerate_db.sh```

- creates the database
- outputs lots of stuff

Then, to create the CSV files, run: 

```sh bin/export-tables.sh```

This will re-create the three .csv files inside

```data/raw```

Have fun!

The raw comments are in this [google
doc](https://docs.google.com/document/d/1dQkW0dJyh2BMNrJS_DjPElNIVjy36ih8vpdOAi_fyBQ/edit#heading=h.l0ljwpnglhrp)
