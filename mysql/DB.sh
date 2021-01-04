#sleep 2000
rc default
#touch /run/openrc/softlevel
/etc/init.d/mariadb setup
#openrc mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
/etc/init.d/mariadb start
echo "create database db;" | mysql
echo "grant all on *.* to admin@'%' identified by 'admin' with grant option; flush privileges;" | mysql
/etc/init.d/mariadb stop
exec /usr/bin/mysqld_safe

#echo \
#"CREATE DATABASE DB; \
#CREATE USER 'root' IDENTIFIED BY '1234'; \
#GRANT ALL ON DB.* TO 'root'@'%'; \
#FLUSH PRIVILEGES;" | mysql