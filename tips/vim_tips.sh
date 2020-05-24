# Undo/redo
u
Ctrl+r

# CUT/PASTE
# yank (copy) a line
yy
# yank to end of line
y$
# cut "
d$
# cut 2 lines
2dd
# put (paste) after/before cursor
p
P

# SEARCH/REPLACE
# forward/backward search
/pattern
?pattern
# forward/backward search continue (next)
n
N
# replace all <old> with <new> in file
:%s/<old>/<new>/g
# replace all <old> with <new> in file, with confirmation
:%s/<old>/<new>/gc


# VISUAL MODE (MARKING TEXT)
# mark characters/lines by advancing cursor
v
V
# visual block
Ctrl + v
# shift marked text right/left
>
<
# " by shiftwidth (set in ~/.vimrc)
>>
<<
# Indent 10 lines
10>>
# Comment a visual block (after selecting with Ctrl+V)
s/^/#

# Write on multiple lines at once
(cursor at column to insert into)
Ctrl+V (enter Visual Block mode)
3j (highlight bottom 3 lines), or arrows
Shift+i, or capital I
(enter text)
Esc Esc (twice)
