create database if not exists energy;
use energy;
select * from table1;
select * from table2;
select * from table3;

alter table table2 rename column date to date_table2;
alter table table3 rename column Load_Type to Load_Type_Table3;


create table table_join as
(select *
from table1
right join table2 
on table1.date=table2.date_table2
group by table1.date)
; 
select * from table_join;
alter table table_join drop column date_table2;

create table table_join2 as
(select * from table_join
left join table3
on table_join.Load_Type=table3.Load_Type_Table3
group by table_join.date);

alter table table_join2 drop column Load_Type_Table3; 
select * from table_join2;

select * from table4;
alter table table4 rename column date to sate_table4;

create table join_table3 as
(select * from table_join2
left join table4
on table_join2.date=table4.sate_table4
group by table_join2.date);

alter table join_table3 drop column sate_table4;
select * from join_table3;

select date, max(Usage_kWh) from join_table3
group by date
order by max(Usage_kWh) desc;

select Day_of_week, avg(Usage_kWh) from join_table3
group by Day_of_week
order by Usage_kWh desc;

select WeekStatus, avg(Usage_kWh) from join_table3
group by WeekStatus
order by Usage_kWh desc;
