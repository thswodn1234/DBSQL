create table R (
번호 char(3),
이름 varchar(10));

create table S (
번호 char(3),
이름 varchar(10));

insert into R values('100','정소화');
insert into R values('200','김선우');
insert into R values('300','고영석');

insert into S values('100','정소화');
insert into S values('101','채광주');
insert into S values('102','김수진');

select 번호, 이름 from R
union
select 번호,이름 from S;


select 번호,이름 from s
except
select 번호,이름 from r;


-- 곱집합
select s.번호,s.이름,r.번호,r.이름 from r,s;학생주소