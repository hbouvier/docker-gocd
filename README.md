# godc

## Install ssh keys

Copy the public/privat keys in post-run/.ssh/ as id_rsa and id_rsa.pub

##

```bash
$ docker-compose up -d
```

## Restore
```bash
sudo docker run --rm --volumes-from dockergocd_go-server-data_1 -v /home/ubuntu:/backup busybox /bin/sh -c 'mkdir -p /var/lib/go-server/artifacts/serverBackups/ /var/lib/go-server/db/h2db /var/lib/go-server/db/config.git /etc/go && cd / && tar xvjf /backup/gocd-backup.tar.bz2 && cd /var/lib/go-server/db/h2db && unzip /var/lib/go-server/artifacts/serverBackups/backup_20160509-220757/db && cd ../config.git && unzip /var/lib/go-server/artifacts/serverBackups/backup_20160509-220757/config-repo.zip && cd /etc/go && unzip  /var/lib/go-server/artifacts/serverBackups/backup_20160509-220757/config-dir.zip && chmod -R 777 /etc/go /var/lib/go-server'
```

## upload the backup to couchdb
```bash
$ tar cvjf /tmp/backup_20160518-023411.tar.bz2  /var/lib/go-server/artifacts/serverBackups/backup_20160518-023411
$ curl -u admin:admin http://couchdb.automat.ruggedcode.com:5984/bucket/go-server
$ curl -vu admin:admin http://couchdb.automat.ruggedcode.com:5984/bucket/go-server/backup_20160518-023411.tar.bz2?rev=1-2a23a293f924c61f32149ba467831384 -H "Content-Type: application/bz2" -X PUT --data-binary @/tmp/backup_20160518-023411.tar.bz2
```
