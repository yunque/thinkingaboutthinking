# ceil division @ awk
echo "$1 $2" | awk '{print ($1+$2-1)/$2}'

# floor division @ awk
echo "$1 $2" | awk '{print int($1/$2)}'

# edit a string with sed
sed 's/_/ /g' <<< "el_stringo"
# >> O/P: "el stringo"

# remove constant string of x # of digits
string='remove_123_digits'
echo $string | sed 's/_[0-9][0-9][0-9]_/_/g'
echo $string | sed 's/_[0-9]{3}_/_/g'
>> remove_digits

# replace newline with space
tr '\n' ' ' < file.ext

# read nth column of file (e.g. 2nd & 3rd cols)
awk '{ print $2,$3 }' file.ext

# count # lines in file
wc -l $file

# sed edit file in place; add prefix to beginning of each line
sed -i -e 's/^/prefix2add/' file

# sed create new file
sed -i -e 's/^/prefix2add/' oldfile > newfile

# delete lines in a file which contain a certain string
sed -i.bak '/string2snipe/d' ./file2clean

# logical OR
if [ $a == 0 ] || [ $a == 1 ]; then echo $a; fi

# number of line in file, saved into a variable
numlines=$(wc -l < file )

# remove first $n chars from a string $s
${s:$n:${#s}}

# remove last $n chars from a string $s
${s:0:${#s}-$n}

# find evaluation metric in files and order
zgrep <evaluation_metric> `find . -name 'filenames*.ext'` | grep <filter_string> | perl -ane 'm/([0-9.]+) %/; print "$1 $_"' | sort -n | less

# symlink file with a whitespace
ln -s "/path/White Space.ext" .

# find files from a given date
date=1999-12-31
for f in *ext; do if stat -c %y $f | grep $date; then echo $f; fi; done

# date in YYYY-MM-DD format
date +%Y-%m-%d

# trim end of string
x=remove_last_word
echo ${x%_*}
>> remove_last

# count # of ocurrences of a string in a file
needles=`grep 'needle' $haystack | wc -l`;
echo $needles $haystack;

# watch output of command change over time (-n1 => every second)
watch -n1 "date"

# count number of empty and non-empty text files (by line count)
cnt_empty=0;
cnt_nonempty=0;
for d in *; do
for f in $d/*evt; do
  nlines=$(wc -l < $f);
  if [ $nlines -eq 0 ]; then
    cnt_empty=$((cnt_empty+1));
  else $((cnt_nonempty+1));
  fi;
done;
done;
echo $cnt_empty;
echo $cnt_nonempty

# rename files with index in name (e.g. abc_000005_doremi)
rename s/_00000[0-9]_/_/g $f

# Unique values in 3rd field
for f in *ext; do cat $f | awk '{print $3}'; done | sort -u

# List all files without an extension
ls --ignore='*.*'

# Get destination path of symbolic link
readlink $symlink

# Copy symlink, not destination of symlink
cp -r $symlink .

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
