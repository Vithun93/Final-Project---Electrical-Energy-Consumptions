Create database if not exists energy_consumptions;
use energy_consumptions;
select * from `descriptions of load types`;
alter table `descriptions of load types` rename column Load_Type to Load_Type1;
select * from `electrical consumptions`;
select * from load_types;
alter table load_types rename column date to date_2;
select * from `day_of weeks`;
alter table `day_of weeks` rename column date to date_3;

Create table joined_electrical_consmptions as (
select * from `electrical consumptions`
join load_types on `electrical consumptions`.date = load_types.date_2
join `day_of weeks` on `day_of weeks`.date_3 =load_types.date_2
join `descriptions of load types`on `descriptions of load types`.Load_Type1=load_types.Load_Type
group by `electrical consumptions`.date);

alter table joined_electrical_consmptions drop column date_2;
alter table joined_electrical_consmptions drop column date_3;
alter table joined_electrical_consmptions drop column Load_Type1;

select Day_of_week,  avg(Usage_kWh), avg(`Lagging_Current_Reactive.Power_kVarh`), avg(Lagging_Current_Power_Factor) 
from joined_electrical_consmptions
group by Day_of_week;

