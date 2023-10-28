create user smartcity password 'nb1234';
create database apigw owner smartcity;
create database security_admin owner smartcity;
create database security_user owner smartcity;
create database datacore owner smartcity;
create database ingest owner smartcity;

ALTER DATABASE security_admin OWNER TO smartcity;
GRANT ALL ON DATABASE security_admin TO smartcity WITH GRANT OPTION;
ALTER DATABASE security_user OWNER TO smartcity;
GRANT ALL ON DATABASE security_user TO smartcity WITH GRANT OPTION;

ALTER DATABASE apigw OWNER TO smartcity;
GRANT ALL PRIVILEGES ON DATABASE apigw TO smartcity WITH GRANT OPTION;
ALTER DATABASE datacore OWNER TO smartcity;
GRANT ALL PRIVILEGES ON DATABASE datacore TO smartcity WITH GRANT OPTION;
ALTER DATABASE ingest OWNER TO smartcity;
GRANT ALL PRIVILEGES ON DATABASE ingest TO smartcity WITH GRANT OPTION;

alter user smartcity with superuser;

\c datacore
create extension postgis;
