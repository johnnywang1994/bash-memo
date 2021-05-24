# Bash basic

## Commands

### echo

print content

```bash
echo "Hello World"
```

### read

get user input

```bash
read userinput
echo $userinput
```

- p : with prompt

```bash
read -p "Username: " username
echo $username
```

with default value

```bash
read -p "Username []: " username
username=${username=-"Johnny Wang"}
echo $username
```

### cat << EOF >>

define & cat a template text with variables

```bash
cat << EOF
Username is $username...
EOF
```

escape some content start with `$` by adding `\` before it

```bash
cat << EOF
Username is $username...
Other not bash variable \$password...
EOF
```

### create uuid

```bash
uuid=$(uuidgen)
echo $uuid
```

### create random number

```bash
random=$((1 + RANDOM % 10))
echo $random
```


### print folder filelist to json

```bash
ls | awk '{print $0","}' | xargs | awk '{print "["$0"]"}' > index
```