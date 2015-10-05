Notes UNIX

ls -l | wc -l
ls | less
find filename.wav	# find a file (grep finds a string in a .txt)

ssh server ('exit' to disconnect)

# extract unique labels
cat *.lab | sed -e 's/.*\s//g' | sort | uniq -c | less
cat file.blah | sed 's/old/new/g' > new.file.blah

# read a txt file line-by-line (1)
cat trn.lst | while read line; do
	echo $line
done

# read a txt file line-by-line (2)
for automobile in `cat cars.lst`; do
	echo $automobile
done


# rotate screen
xrandr --output VBOX1 --rotate right
## !!!! gives error...... xrandr: output VBOX1 cannot use rotation "right" reflection "none"
## > internet says:
Adding the RandRRotation option in the Screen section of /etc/X11/xorg.conf allows rotation on my nvidia card.
Section "Screen"
    ...
    Option "RandRRotation" "True"
    ....



# EER results by eye
grep Error `find . -name 'DET-*.txt'` | grep nontar | perl -ane 'm/([0-9.]+) %/; print "$1 $_"' | sort -n | less


# Firefox restore window form maximised
Alt + Space + [select] # cf. http://www.shortcutworld.com/en/win/Firefox.html#link_8
also, cf. http://askubuntu.com/questions/210962/window-controls-missing-cannot-maximise-or-minimize-applications
& https://www.google.co.uk/search?channel=fs&q=ubuntu+firefox+window+size+can%27t+restore&cad=cbv&sei=qiS2VebUBoWnNom5gMgI

# Ubuntu toolbar on side
set toolbar on top by using GNOME Classic, instead of Ubuntu, @ log-in screen

# tree structure of directories
tree -hs -L 2
du /* -h

# PPA, cf. http://stackoverflow.com/questions/32350262/cmake-update-version-not-found
# System Load Indicator application/widget
@ https://launchpad.net/~indicator-multiload/+archive/ubuntu/stable-daily
sudo apt-get repository ppa:indicator-multiload/stable-daily
sudo apt-get update
sudo apt-get install # [ stable-daily ///// indicator-multiload ] ???


# Search command history
Ctrl+R
# Keep searching
Ctrl+R

# Get length of string in bash
len=${#string}

# Read file line-by-line
while read line; do echo $line; done <file.lst 



# GDB
# basix @ http://www.thegeekstuff.com/2010/03/debug-c-program-using-gdb/
# 1. Call a program with $ "gdb /path/to/program.c"
# 2. Set breakpoints
# 3. Run program with command line arguments w/ $ "run -m /path/to/model.bsm" etc

# step into
s

# next
n

# set breakpoint
b filename.ext:line#

# delete breakpoint, cf. http://www.delorie.com/gnu/docs/gdb/gdb_32.html
clear filename.ext:line#

# print variable value
p VAR

# examine contents of address
x 0x7FFFFFF

# show current breakpoints
info breakpoints
