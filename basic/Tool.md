# Process

## ps -ef, ps -e | head

## pgrep, pidof

## top, glances

## pkill, kill, killall
  - kill -9 `pid`
  - pkill `processname`

## nice, renice


# System

## last

## awk, sed, lsof
  - last | awk '{print $1 "\t" $6 "-" $4 "-" $5 }'

## head, tail

## find
  - find $HOME -name '*.mp3'
  - find /etc -iname 'Network'
  - find /var/log -iname '*.log' -type f (only file)
  - find /etc -iname 'apache2' -type d (only directory)
  - find /var -type f -size +50M (檔案大小超過 50MB)
  - find $HOME -type f -atime -7 (7 天內存取或修改過)
  - find $HOME -type f -amin -10 (10 分內...)
  - find /tmp -type f -atime +30 -print -exec rm -f '{}' \; (刪除 30 天以上未經存取過的暫存檔案)



# Network

## curl, wget
  - curl -o cat.jpg 'https://news.cgtn.com/news/77416a4e3145544d326b544d354d444d3355444f31457a6333566d54/img/37d598e5a04344da81c76621ba273915/37d598e5a04344da81c76621ba273915.jpg'

  - curl --trace-ascii debug.txt http://www.example.com/

## ssh

## netstat
  - apt-get install net-tools