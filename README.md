
# Lufi Docker Setup

## Configuration

We only linked the default Lufi config template, it's recommended to make the following changes:

 - `secrets`: change the string
 - `upload_dir => '/var/lufi',` (a docker volume)
 - `dbtype => 'postgresql',` (postgres is running on another docker container)
   - `pgdb.host`: `sql`
   - `pgdb.user`: `lufi`
   - `pgdb.pwd`: change this in lufi.conf and the docker-compose.yml
 - `htpasswd => '/etc/lufi/lufi.passwd',` (file is mounted from this dir)

Change the passwd for the `default` user or create a new password file:

```shell
# change passwd
cp lufi.passwd.template lufi.passwd && htpasswd lufi.passwd default

# new passwd file:
htpasswd -c lufi.passwd <username>
```
