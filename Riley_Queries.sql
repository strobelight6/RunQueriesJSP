-- Query 1
select t.retweet_count, t.text_body, u.screen_name, u.category, u.sub_category
from tweet t inner join users u on t.posting_user = u.screen_name
where month(t.posted) = 1 and year(t.posted) = 2016
order by t.retweet_count desc
limit 5;

-- Query 3
select count(distinct u.ofstate), group_concat(distinct u.ofstate), h.hashtagname
from users u inner join tweet t on t.posting_user = u.screen_name
inner join includes i on i.tid = t.tid
inner join tagged h on h.hashtagname = i.hashtagname
where year(t.posted) = 2016 and not u.ofstate = 'na'
group by h.hashtagname
order by count(distinct u.ofstate) desc
limit 5;

-- Query 10
select distinct h.hashtagname, u.ofstate
from tagged h inner join includes i on h.hashtagname = i.hashtagname
inner join tweet t on i.tid = t.tid
inner join users u on t.posting_user = u.screen_name
where u.ofstate in ('Alaska', 'Ohio', 'Alabama')
	and month(t.posted) = 1 and year(t.posted) = 2016
order by h.hashtagname asc;

-- Query 18
select utwo.screen_name, utwo.ofstate, group_concat(distinct u.screen_name)
from users u inner join tweet t on t.posting_user = u.screen_name
inner join mentioned m on m.tid = t.tid
inner join users utwo on utwo.screen_name = m.screen_name
where u.sub_category = 'GOP' and month(t.posted) = 1 and year(t.posted) = 2016
group by utwo.screen_name
order by count(t.tid) desc
limit 5;

-- Query 23
select h.hashtagname,  count(t.tid)
from tagged h inner join includes i on h.hashtagname = i.hashtagname
inner join tweet t on i.tid = t.tid
inner join users u on t.posting_user = u.screen_name
where u.sub_category = 'GOP' and month(t.posted) in (1, 2, 3) and year(t.posted) = 2016
group by h.hashtagname
order by count(t.tid) desc
limit 5;
