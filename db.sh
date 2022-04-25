mkdir db/mysql
mkdir db/psql
docker exec -it  postgres su postgres bash -c 'pg_dump --format p --inserts arborist_db > /tmp/arborist_db.sql'
docker exec -it  postgres su postgres bash -c 'pg_dump --format p --inserts fence_db > /tmp/fence_db.sql'
docker exec -it  postgres su postgres bash -c 'pg_dump --format p --inserts indexd_db > /tmp/indexd_db.sql'
docker exec -it  postgres su postgres bash -c 'pg_dump --format p --inserts metadata > /tmp/metadata.sql'
docker exec -it  postgres su postgres bash -c 'pg_dump --format p --inserts metadata_db > /tmp/metadata_db.sql'

docker cp postgres:/tmp/arborist_db.sql db/psql/arborist_db.sql
docker cp postgres:/tmp/fence_db.sql db/psql/fence_db.sql
docker cp postgres:/tmp/indexd_db.sql db/psql/indexd_db.sql
docker cp postgres:/tmp/metadata.sql db/psql/metadata.sql
docker cp postgres:/tmp/metadata_db.sql db/psql/metadata_db.sql


sudo apt install php7.4-cli -y
cd db
wget http://www.lightbox.ca/pg2mysql/pg2mysql-1.9.tar.bz2
tar -xjvf pg2mysql-1.9.tar.bz2
php pg2mysql-1.9/pg2mysql_cli.php psql/arborist_db.sql mysql/arborist_db.sql InnoDB
php pg2mysql-1.9/pg2mysql_cli.php psql/fence_db.sql mysql/fence_db.sql InnoDB
php pg2mysql-1.9/pg2mysql_cli.php psql/indexd_db.sql mysql/indexd_db.sql InnoDB
php pg2mysql-1.9/pg2mysql_cli.php psql/metadata.sql mysql/metadata.sql InnoDB
php pg2mysql-1.9/pg2mysql_cli.php psql/metadata_db.sql mysql/metadata_db.sql InnoDB





