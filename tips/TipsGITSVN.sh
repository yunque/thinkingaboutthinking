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

# show all branches (asterisk marks current branch)
git branch

#merge branch to master
git merge dev/branchname '???'

git add -p ['hunk' aka line]

git diff --cached '=> diff staging area vs repo'

# Remove .svn files
find . -iname ".svn" -print0 | xargs -0 rm -r
#...or...
find . -name .svn -exec rm -r -f {} +

# Tree visualisation of repo branches
git log --graph --oneline --decorate --all

# SYNCING A FORK
# c.f. https://help.github.com/articles/syncing-a-fork/
# 0.0. Configure a remote for a fork
# 0.1. Check what remotes are configured (if any)
git remote -v
# 0.2. Designate a new upstream repo to sync with
git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPO.git
# 0.3 Verify new configuration
git remote -v
# 1.0 Go to working directory
? cd /go/to/the/working/dir
# 1.1 Fetch the original up-to-date repo, save in "upstream/master" branch
git fetch upstream
# 1.2 Check out my own fork's local master branch
git checkout master
# 1.3 Merge the upstream branch with my local master branch
git merge upstream/master
