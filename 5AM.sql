--creating a schema
create schema prudence;

set search_path to prudence;

--creating tables
create table prudence.morning_class(
students varchar,
age numeric,
gender varchar,
height_met integer
);
