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

**Make /etc/init.d/ script start on boot.**

`update-rc.d myscript defaults`

**Postgres Upsert (9.5)**

`INSERT INTO users (id, level) VALUES (1, 0) ON CONFLICT (id) DO UPDATE SET level = users.level + 1;`

**Basic iptables firewall rules**
`sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT`
`sudo iptables -A INPUT -i lo -j ACCEPT`
`sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT`
`sudo iptables -A INPUT -j DROP`
