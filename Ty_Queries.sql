/* Q15 */
DROP PROCEDURE IF EXISTS Q15;
DELIMITER //
CREATE PROCEDURE Q15(subcat varchar(500), posted_month varchar(10), posted_year varchar(10))
BEGIN
select users.screen_name, users.ofstate, urlused.url
from users join tweet on users.screen_name = tweet.posting_user join contained on contained.tid = tweet.tid join urlused on urlused.url = contained.url
where users.sub_category = subcat and MONTH(tweet.posted) = posted_month and YEAR(tweet.posted) = posted_year;
END //
DELIMITER ;
/* Q18 */
/* Q11 */
DROP PROCEDURE IF EXISTS Q11;
DELIMITER //
CREATE PROCEDURE Q11(k integer, state varchar(500), hashtag varchar(500), pmonth varchar(10), pyear varchar(10))
BEGIN
select tweet.text_body as tweet_text, includes.hashtagname as hashtag_text, users.screen_name as screen_name, users.sub_category as subcategory
from tweet 
join users on users.screen_name = tweet.posting_user 
join includes on includes.tid = tweet.tid 
where users.ofstate = state and MONTH(tweet.posted) = pmonth and YEAR(tweet.posted) = pyear and includes.hashtagname = hashtag
limit k;
END //
DELIMITER ;
/* Q9 */
DROP PROCEDURE IF EXISTS Q9
DELIMITER //
CREATE PROCEDURE Q9(k integer,category varchar(500))
BEGIN
select users.screen_name, users.sub_category, users.numFollowers
from users where users.sub_category = category
order by users.numFollowers desc
limit 5;
END //
DELIMITER ;
/* Q6 */

SET @tmp = 'GOPDebate,DemDebate';
SET @k = '2';
prepare stmtq6 FROM
'
select users.screen_name, users.ofstate
from users 
join tweet on tweet.posting_user = users.screen_name
join includes on includes.tid = tweet.tid
where find_in_set(includes.hashtagname, ?)
group by users.screen_name
order by users.numFollowers desc
limit ?;
';
EXECUTE stmtq6 using @tmp, @k;
deallocate prepare stmtq6;

/* Q3 */
DROP PROCEDURE IF EXISTS Q3;
DELIMITER //
CREATE PROCEDURE Q3(k integer, pyear varchar(10))
BEGIN
SELECT COUNT() as numofstates, group_concat(DISTINCT users.ofstate)
FROM users 
JOIN tweet on users.screen_name = tweet.posting_user
JOIN includes on tweet.tid = includes.tid
WHERE YEAR(tweet.posted) = pyear
WHERE includes.hashtagname = (SELECT COUNT(*) as countoftag, includes.hashtagname as p FROM 
tweet join includes on tweet.tid = includes.tid
where YEAR(tweet.posted) = '2016'
GROUP BY includes.hashtagname
ORDER BY countoftag desc LIMIT 1) as p
END//

