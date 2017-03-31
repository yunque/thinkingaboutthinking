SVN NOTES
# based on book "Version Control by Example" aka Mona Lisa

1. create
$ mkdir repos
$ svnadmin create repos/lottery
$ svnserve -d --root=/Users/sally/repos

2. checkout, add, status, commit
$ svn checkout svn://server.futilisoft.com/lottery

$ svn add lottery.c

$ svn commit
or
$ svn commit -m "initial implementation"

# branch
svn cp svn+ssh://URL -m "Commit message"
