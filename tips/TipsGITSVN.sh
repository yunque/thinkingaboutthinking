'GIT SVN'

# basic commands
$ git svn clone -rHEAD <URL>

> [working-copy]
$ git add
> [staging-area]
$ git commit
> [repo]

# make a branch (from the master)
git checkout -b dev/mybranchname

#return to the master/root-of-branch
git checkout master

#merge branch to master
git merge dev/branchname '???'

git add -p ['hunk' aka line]

git diff --cached '=> diff staging area vs repo'

# Remove .svn files
find . -iname ".svn" -print0 | xargs -0 rm -r
#...or...
find . -name .svn -exec rm -r -f {} +
