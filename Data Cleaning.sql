Create database Road_accident_2020;
use Road_accident_2020;
select * from df;
desc df;

alter table df modify column count int; #dosent work bcoz of whitespaces

select * from (select *, row_number() over()rn from df)abc
where rn=7057; # looking for values at row where it gives error

select * from df 
where count=""; 

update df set count = null where count=""; #conve

select * from df 
where count is null; 
#AS ONLY 3 NULL VALUES WE CAN DELETE THEM

delete from df where count is null;

select * from df 
where count is null; # no null value

alter table df modify column count int; #changing datatype

select * from df;

select distinct `Cause category`from df; #unique cause category
select distinct `Cause Subcategory` from df; #unique cause subcategory
select distinct `Million Plus Cities` as City from df; #unique cities
select distinct `Outcome of Incident` as City from df; #unique Outcome of Incident
select count(distinct `Million Plus Cities`)Cities from df; #there is data of 50 cities

select `Million Plus Cities`cities , sum(count)`Total accidents(Millions)`, dense_rank() over(order by sum(count) desc)`Rank` from df
group by cities; #rank of cities according to accident

select cities,`Total accidents(Millions)` from(select `Million Plus Cities`cities , sum(count)`Total accidents(Millions)`, dense_rank() over(order by sum(count) desc)`Rank` from df
group by cities)abc
where `Rank`<=5; #top 5 cities according to accident

select cities,`Total accidents(Millions)` from(select `Million Plus Cities`cities , sum(count)`Total accidents(Millions)`, dense_rank() over(order by sum(count))`Rank` from df
group by cities)abc
where `Rank`<=5; #bottom 5 cities by total accidents

select `Cause category`,`cause subcategory`,sum(count)`Total accidents`from df
group by `Cause category`,`cause subcategory`
order by `Total accidents` desc; #total accident by categgory and subactegory
