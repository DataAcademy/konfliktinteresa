
create table report (
  report_id integer primary key,
  subject_name text not null,
  report_year integer not null,
  report_link text not null,
  report_type_of_function text not null,
  report_name text not null
);

create table stanza (
  stanza_id integer primary key
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