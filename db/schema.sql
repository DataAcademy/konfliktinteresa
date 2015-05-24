
-- There are two parts to the database
--
-- The first part is a fairly faithful representation of the dataset, as
-- extracted from the documents on the official website

-- The second part of the database repeats this data, but organises it
-- according to natural relationships, independent of how the original
-- documents were organised


-- Document-oriented tables:

create table report (
  report_id integer primary key,
  subject_name text not null,
  subject_id text not null,
  report_year integer not null,
  report_link text not null,
  report_type_of_function text not null,
  report_name text not null,
  unique(subject_id,report_name,report_year)
);

create table stanza (
  stanza_id integer primary key,
  pointless text
);

create table report_line_item (
  stanza_id integer not null,
  line_key text not null,
  line_value text,
  unique(stanza_id, line_key),
  foreign key(stanza_id) references stanza(stanza_id)
);

create table report_stanza (
  report_id integer not null,
  stanza_id integer not null,
  unique(report_id, stanza_id),
  foreign key(report_id) references report(report_id),
  foreign key(stanza_id) references stanza(stanza_id)
);


create view document_line as
select * from report 
  left join report_stanza using (report_id) 
  left join stanza using (stanza_id) 
  left join report_line_item using (stanza_id);

-- Natural tables:

create table person (
  person_id integer primary key,
  person_name text not null,
  person_original_id text not null,
  unique(person_original_id,person_name)
);

create table job (
  job_id integer primary key,
  job_name text not null,
  person_id integer not null,
  monthly_salary text,
  monthly_salary_fixed int,
  foreign key(person_id) references person(person_id)
);

create table company (
    company_id integer primary key,
    company_name text,
    company_city, text,
    unique(company_name,company_city)
    );

create table ownership (
    company_id int,
    person_id int,
    year int,
    shares text,
    nominal_value text,
    obtained_through text,
    foreign key(person_id) references person(person_id),
    foreign key(company_id) references company(company_id),
    unique(company_id,person_id,year)
    );

create table unparsed_ownership (
    person_id int,
    ownership text,
    year int,
    foreign key(person_id) references person(person_id)
    );
