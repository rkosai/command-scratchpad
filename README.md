**Log into remote postgres server**

`psql -h <hostname> -U <username> <dbname>`

**Dump postgres database from server to development**

`
ssh <hostname>
    "PGPASSWORD='<password>' pg_dump -h <hostname> -U <username> <dbname> | gzip" 
    | gunzip | PGPASSWORD='<local-password>' psql -h localhost -U <localuser> <dbname>
`

**Rsync files from development to server**

`rsync -rpltv release remote-server:/path/to/containing/directory`

**Apache mods for setting up balancer proxy**

`sudo a2enmod proxy proxy_http proxy_balancer slotmem_shm lbmethod_byrequests`

**Apache Bench**

`ab -n <count> -c <concurrent requests> "<url>"`

**Convert**

`convert src.jpg -resize 64x64 dest.jpg`

**Generate random words**

`shuf -n3 /usr/share/dict/words`
