CREATE USER 'cs363'@'%1' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT DROP, CREATE, DELETE, INSERT, DROP ON project.* TO 'cs363'@'%1';
