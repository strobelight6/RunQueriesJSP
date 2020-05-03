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

-- Query 6
select users.screen_name, users.ofstate
from users 
join tweet on tweet.posting_user = users.screen_name
join includes on includes.tid = tweet.tid
where includes.hashtagname in ('GOPDebate','DemDebate')
group by users.screen_name
order by users.numFollowers desc
limit 5;

-- Query 9
select users.screen_name, users.sub_category, users.numFollowers
from users where users.sub_category = 'GOP'
order by users.numFollowers desc
limit 5;

-- Query 10
select distinct h.hashtagname, u.ofstate
from tagged h inner join includes i on h.hashtagname = i.hashtagname
inner join tweet t on i.tid = t.tid
inner join users u on t.posting_user = u.screen_name
where u.ofstate in ('Alaska', 'Ohio', 'Alabama')
	and month(t.posted) = 1 and year(t.posted) = 2016
order by h.hashtagname asc;

-- Query 11
select tweet.text_body as tweet_text, includes.hashtagname as hashtag_text, users.screen_name as screen_name, users.sub_category as subcategory
from tweet 
join users on users.screen_name = tweet.posting_user 
join includes on includes.tid = tweet.tid 
where users.ofstate = 'Ohio' and MONTH(tweet.posted) = 1 and YEAR(tweet.posted) = 2016 and includes.hashtagname = 'Ohio'
limit 5;

-- Query 15
select users.screen_name, users.ofstate, group_concat(distinct urlused.url)
from users join tweet on users.screen_name = tweet.posting_user join contained on contained.tid = tweet.tid join urlused on urlused.url = contained.url
where users.sub_category = 'GOP' and MONTH(tweet.posted) = 1 and YEAR(tweet.posted) = 2016
group by users.screen_name;

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
