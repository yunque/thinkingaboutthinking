# ceil division @ awk
echo "$1 $2" | awk '{print ($1+$2-1)/$2}'

# floor division @ awk
echo "$1 $2" | awk '{print int($1/$2)}'

# edit a string with sed
sed 's/_/ /g' <<< "el_stringo"
# >> O/P: "el stringo"
