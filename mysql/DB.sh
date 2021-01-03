openrc default
openrc mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
rc-service mysql start

mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE DB;
CREATE USER 'root'@localhost IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON DB.* TO 'root'@localhost;
FLUSH PRIVILEGES;
MYSQL_SCRIPT

rc-service mysql stop
exec /usr/bin/mysqld --user=root --console