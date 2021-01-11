rc default
/etc/init.d/mariadb setup
/etc/init.d/mariadb start

mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE DB;
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON DB.* TO 'admin';
FLUSH PRIVILEGES;
CREATE USER 'user1'@'%' IDENTIFIED BY 'neadmin';
CREATE USER 'user2'@'%' IDENTIFIED BY 'neadmin';
CREATE USER 'user3'@'%' IDENTIFIED BY 'neadmin';
CREATE USER 'user4'@'%' IDENTIFIED BY 'neadmin';
MYSQL_SCRIPT

/etc/init.d/mariadb stop
exec /usr/bin/mysqld_safe