# ssh

## login by ssh

```bash
$ ssh root@[ip]
```

## set hostname in ubuntu

1. 

```bash
$ hostnamectl set-hostname [domain-name]
```

2. 

```bash
$ vim /etc/hosts
> [ip] [domain-name]
```

## add user in ubuntu

1. create new user

```bash
adduser [username]
```

2. let user can login in remote machine by ssh

```bash
adduser [username] sudo
```


## create ssh key

1. 

```bash
$ ssh-keygen -b 4096
```

2. copy public key to remote server

```bash
scp ~/.ssh/rsa_id.pub root@[ip]:~/.ssh/authorized_keys
```

3. set remote .ssh folder permissions

700 => read, write, exec

600 => read, write

```bash
sudo chmod 700 ~/.ssh/
```

```bash
sudo chmod 600 ~/.ssh/*
```

```bash
sudo chmod 775 ./django-project
```


## disallow login with password in ubuntu

```bash
$ sudo vim /etc/ssh/sshd_config
```

PermitRootLogin yes => no

PasswordAuthentication yes => no

> restart systemctl

```bash
$ sudo systemctl restart sshd
```


## install ufw(uncomplicated firewall) in ubuntu

```bash
sudo apt-get install ufw
```

> change rule

```bash
$ sudo ufw default allow outgoing
$ sudo ufw default deny incoming // 拒絕封包連線進入(但要記得允許下一步的 ssh)
$ sudo ufw allow ssh
$ sudo ufw allow 8000 // allow 8000 port for testing
$ sudo ufw enable // apply new rules for ufw
$ sudo ufw status // check firewall status
```

備註

```bash
$ sudo ufw delete allow 8000 // 測試後刪除該 port
$ sudo ufw allow http/tcp // 允許 nginx 等等連線
```


## copy folder to remote server

```bash
$ scp -r ./django-project root@[ip]:~/app
```



