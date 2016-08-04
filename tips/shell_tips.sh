# ceil division @ awk
echo "$1 $2" | awk '{print ($1+$2-1)/$2}'

# floor division @ awk
echo "$1 $2" | awk '{print int($1/$2)}'

# edit a string with sed
sed 's/_/ /g' <<< "el_stringo"
# >> O/P: "el stringo"

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

# find evaluation metric in files and order
zgrep <evaluation_metric> `find . -name 'filenames*.ext'` | grep <filter_string> | perl -ane 'm/([0-9.]+) %/; print "$1 $_"' | sort -n | less

# symlink file with a whitespace
ln -s "/path/White Space.ext" .

# find files from a given date
date=1999-12-31
for f in *ext; do if stat -c %y $f | grep $date; then echo $f; fi; done
