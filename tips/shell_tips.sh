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