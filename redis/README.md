# Redis basic

fast, in-memory, flexible, 


## Install

```bash
$ apt-get install redis-server
```

## GET/SET key [value]

```bash
$ SET foo 10
```

```bash
$ GET foo
# 10
```

## MSET key value ...[key value]

set multiple data

## INCR/DECR key

```bash
$ INCR foo
# 11
```

```bash
$ DECR foo
# 10
```

## EXISTS/DEL key

```bash
$ EXISTS foo
# 1
```

```bash
$ DEL foo
$ EXISTS foo
# 0
```

## FLUSHALL

clear everything

```bash
$ FLUSHALL
```

## EXPIRE key [countdown-time]

set key with expired countdown time

## TTL key

check key for it's countdown time

  - `-1` means the key is persist
  - `-2` means the key is outdated with value (nil) now

## SETEX key [countdown-time] value

set key with value & expired countdown time

## PERSIST key

set a key to become persist


## APPEND key [append_value]

append value into existed key value

```bash
$ GET msg
# hello
$ APPEND msg ' world'
$ GET msg
# hello world
```


## RENAME key [new_keyname]

rename keyname, but the value is the same

```bash
$ RENAME foo bar
$ GET foo
# (nil)
```


## LPUSH/RPUSH arrayname value

add data from front/back of array

```bash
$ LPUSH people 'Johnny'
$ LPUSH people 'Jen'
$ LPUSH people 'Tom'
$ LRANGE people 0 -1 # all data
# 1) Johnny
# 2) Jen
# 3) Tom
```

## LLEN array

get list length

```bash
LLEN people
# 3
```
