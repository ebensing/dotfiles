#!/bin/bash

set -e

cd /vagrant/migration
mvn initialize flyway:clean
curl 'http://{username}:{password}@10.43.1.14/repository/download/Mark43Serv_Database_CreateDatabaseArtifact/lastSuccessful/mark43.dump.gz' > mark43.dump.gz
gzip -dc < mark43.dump.gz | mysql -h 127.0.0.1 -u mark43 -p{password}
mvn initialize flyway:migrate
