drop table if exists appusers;
create table appusers
(
login_name varchar(255),
pwd varchar(255),
priviledge varchar(255),
primary key(login_name)
);

insert into appusers values('Pak',sha1('hello'), 'readonly');
insert into appusers values('Riley',sha1('hello'), 'all');
insert into appusers values('Ty',sha1('hello'), 'all');
insert into appusers values('Joe',sha1('hello'), 'all');
set @pwd='hello';
select * from appusers where login_name='Pak' and pwd=sha1('hello');
select * from appusers;
