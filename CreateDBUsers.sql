DROP USER 'cs363'@'%1';
CREATE USER 'cs363'@'%1' IDENTIFIED WITH mysql_native_password BY 'onehundredpercent';
GRANT ALL PRIVILEGES ON project.* TO 'cs363'@'%1';
