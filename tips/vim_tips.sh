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
# shift marked text right/left
>
<
# " by shiftwidth
>>
<<
