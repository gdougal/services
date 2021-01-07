rc default
/etc/init.d/mariadb setup
/etc/init.d/mariadb start

mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE DB;
CREATE USER 'admin'@localhost IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON DB.* TO 'admin'@localhost;
FLUSH PRIVILEGES;
MYSQL_SCRIPT

/etc/init.d/mariadb stop
exec /usr/bin/mysqld_safe