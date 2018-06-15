# Float division
echo "2/3" | bc -l

# Edit a string with sed
sed 's/_/ /g' <<< 'el_stringo'
# >> O/P: 'el stringo'
<

# Remove constant string of x # of digits
string='remove_123_digits'
echo $string | sed 's/_[0-9][0-9][0-9]_/_/g'
echo $string | sed 's/_[0-9]{3}_/_/g'
>> remove_digits

# Replace newline with space
tr '\n' ' ' < file.ext

# Read nth column of file (e.g. 2nd & 3rd cols)
awk '{ print $2,$3 }' file.ext

# Count # lines in file
wc -l $file

# sed edit file in place; add prefix to beginning of each line
sed -i -e 's/^/prefix2add/' file

# sed create new file
sed -i -e 's/^/prefix2add/' oldfile > newfile

# Delete lines in a file which contain a certain string
sed -i.bak '/string2snipe/d' ./file2clean

# Logical OR
if [ $a == 0 ] || [ $a == 1 ]; then echo $a; fi

# number of line in file, saved into a variable
numlines=$(wc -l < file )

# Remove first $n chars from a string $s
${s:$n:${#s}}

# Remove last $n chars from a string $s
${s:0:${#s}-$n}

# Find evaluation metric in files and order
zgrep <evaluation_metric> `find . -name 'filenames*.ext'` | grep <filter_string> | perl -ane 'm/([0-9.]+) %/; print "$1 $_"' | sort -n | less

# Symlink file with a whitespace (treat as string)
ln -s "/path/White Space.ext" .

# Find files from a given date
date=1999-12-31
for f in *ext; do if stat -c %y $f | grep $date; then echo $f; fi; done

# Date in YYYY-MM-DD format
date +%Y-%m-%d

# Trim end of string
x=remove_last_word
echo ${x%_*}
>> remove_last

# Count # of ocurrences of a string in a file
needles=`grep 'needle' $haystack | wc -l`;
echo $needles $haystack;

# Watch output of command change over time (-n1 => every second)
watch -n1 "date"

# Watch/follow the tail of a log file
tail -f -n40 <log>

# Count number of empty and non-empty text files (by line count)
cnt_empty=0;
cnt_nonempty=0;
for d in *; do
for f in $d/*evt; do
  nlines=$(wc -l < $f);
  if [ $nlines -eq 0 ]; then
    cnt_empty=$((cnt_empty+1));
  else
    cnt_nonempty=$((cnt_nonempty+1));
  fi;
done;
done;
echo $cnt_empty;
echo $cnt_nonempty
# one-liner:
cnt_empty=0; cnt_nonempty=0; for d in *; do for f in $d/*evt; do   nlines=$(wc -l < $f);   if [ $nlines -eq 0 ]; then     cnt_empty=$((cnt_empty+1));   else     cnt_nonempty=$((cnt_nonempty+1));   fi; done; done; echo $cnt_empty; echo $cnt_nonempty

# Rename files with index in name (e.g. abc_000005_doremi)
rename s/_00000[0-9]_/_/g $f

# Unique values in 3rd field
for f in *ext; do cat $f | awk '{print $3}'; done | sort -u

# List all files without an extension
ls --ignore='*.*'

# Get destination path of symbolic link
readlink $symlink

# Copy symlink, not destination of symlink
cp -P $symlink .
cp -d $symlink .

# Parse string by a delimiter and store in array
IFS='/' read -ra ARR <<< "$str"
echo ${ARR[-1]}

# Follow symlinks down the rabbit hole and return
# unique directories which contain the original files
for f in *; do
	while [[ -L $f ]]; do
		f=$(readlink $f);
	done;
	dirname $f;
done | sort -u;

# Kill all threads running 'badprocess'
ps -ef | grep badprocess | awk '{print $2}' | for f in `xargs $1`; do kill $f; done
# ...or...
for pid in $(ps -ef | awk '/badprocess/ {print $2}'); do kill -9 $pid; done

# Find all unique filetypes in a directory
for f in *; do echo $f | rev | cut -d'.' -f1 | rev; done | sort -u

# Replace space with underscore in filenames
find -name "* *" -type f | rename 's/ /_/g'

# Search for a string in files of a certain format (e.g. .py)
grep -rn "string" --include \*.py

# See where tabs are in a script, cf. http://stackoverflow.com/a/8634745/5098023
cat -A script.py

# Diff contents of dirs
diff -qr dir1 dir2 | sort

# Power off external drive for safe removal
iudiskctl power-off -b </dev/sdb1>

# Search command history
Ctrl+R
# Keep searching
Ctrl+R

# Directory structure
tree
# ...limited to N levels
tree -L N
# ...w file size
tree -hs

# Human-readable filesize (MB)
ls -l --block-size=MB <file>

# Install .deb package
sudo dpkg -i <.deb>

# Search for Ubuntu package
apt-cache search <keyword>

# Uncompress a gzipped tarball
tar xvzf <file>.tar.gz
# x = extract
# v = verbose, list all files
# z = uncompress
# f = file

# Unique entries in a CSV column
cut -d',' -f$X <file>.csv | sort -u
# (where $X=column index)

# Tokenize a string
string="abc 123 doremi"
IFS=' ' tokens=($string)
# Return all tokens
echo ${tokens[*]}
# Return last token
echo ${tokens[-1]}

# List unique characters in a string
for (( i=0; i<${#string}; i++ )); do
  # Expand the substring starting from position $i, for one character (1)
  echo "${string:$i:1}"; 
done | sort -u

# List unique non-alphanumeric characters in a string
for (( i=0; i<${#string}; i++ )); do
  # Remove alphanumeric characters
  nonalpha=`sed 's/[A-Z|a-z|0-9]//g' <<< $string`;
  # Expand the substring starting from position $i, for one character (1)
  echo "${nonalpha:$i:1}"; 
done | sort -u

# Extract dirname, filename and extension from a filepath
# NB. "" handles spaces
dirname=`dirname "$f"`
ext=`basename ${f##*.}`
fname=`basename "$f" .$ext`

# Read file line-by-line
i=1
while read line; do
  echo $line
  ((i++))
done < $file

# Append to same line of file (-n excludes newline)
echo -n "text" >> $file

# Find files created/edited in the last 24 hours
find . -maxdepth 3 -mtime -1 -type f

# Time a function
echo "Starting @" `date`;
tic=$SECONDS;
sleep 1;
toc=$SECONDS;
echo "Ending @ " `date`;
echo "Time elapsed:" $((toc-tic)) "secs"

# Write stdout and stderr to log file (and print to std out)
script.sh 2>&1 | tee -a log.txt

# Print file ignoring header (start reading from line 2)
tail -n +2 $file

# Delete lines from a text file
sed -i.bak '/pattern to match/d' $f

# Add a header to a file
sed -i i1'Header,Text' $f

# Remove carriage return (^M)
sed -i 's/\r//g' $f

# View a CSV file in tab-separated table format
column -s, -t < file.csv | less -#2 -N -S

# JSON inspection with colouring
cat file.json | jq ''
# NB. (requires the jq package [Linux])

# Syntax colour a file preview (similar to cat, with colour)
pygmentize -g file.json
# NB. (requires the pygments package [Python])

# Path of directory containing script being run
$(dirname $(realpath $0))

# See hostname (aka name of machine)
uname -n
# or
hostname

# Change hostname
hostnamectl set-hostname <new_hostname>

# Change directory ownership
sudo chown -R username:group directory

# List all users
getent passwd | cut -d':' -f1
# or
cat /etc/passwd | cut -d: -f1

# Get user's id and groups
id <user>
# Groups
id -G <user>

# List all system groups
groups
# List all system groups that <user> belongs to
groups <user>
# List all users in <group>
getent group <group>

# Add <user> to <group>
usermod -G <group> <user>

# Rename a user
# cf. https://unix.stackexchange.com/a/230426/188678
groupadd <newuser>
usermod -d /home/<newuser> -m -g <newuser> -l <newuser> <olduser>

# Set file access control list (user privileges for a file or dir)
sudo su
setfacl -m u:<user>:rwx <file/dir>

# Exit code of last executed command (e.g. to check fsck error code)
echo $?
