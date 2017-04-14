'GIT SVN'

# Basic commands
$ git svn clone -rHEAD <URL>

> [working-copy]
$ git add
> [staging-area]
$ git commit
> [repo]

# Make a branch (from the master)
git checkout -b dev/mybranchname

# Return to the master/root-of-branch
git checkout master

# Show all branches (asterisk marks current branch)
git branch

# Merge branch to master
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

# See SVN URL for a git-svn repo
less .git/config

# See git-svn remote refs
less .git/svn/refs/remotes/git-svn/

# Make new folder in SVN repo
svn mkdir <URL_of_existing_SVN_repo>/new_folder

# Push a local branch to the remote origin (& track it)
git push -u origin <branch>

# Update only one file from a different branch
git checkout <other_branch> -- <file_to_update.py>

# Remove all files that have been deleted with "rm" rather than "git rm"
git ls-files --deleted -z | xargs -0 git rm

# Rename a branch locally and push to remote w new name (deleting old name)
git checkout <old_name> 
git branch -m <new_name>	# m => move
git push origin :<old_name>	# delete old branch prepending with ':'
git push origin <new_name>:refs/heads/<new_name>
# ...and reset the upstream branch name
git branch --unset-upstream
git branch --set-upstream-to=origin/<new_name>

# Clone git repo on a remote server
ssh user@remote
# Generate new keypair for user on remote
ssh-keygen -t rsa -b 4096 -C "<email>"
# Add private key to ssh-agent (first start agent in background, then add)
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
# [ Copy public key to git/bitbucket settings
#   cf. https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/ ]
# Clone via SSH (not HTTPS)
git clone git@bitbucket.org:<repo_owner>/<repo_name>.git

# Get info about remote repo
git remote show origin

# Search for deleted file in git history
git log --all --full-history -- **/file.*	# if path unknown
git log --all --full-history -- /path/to/file	# if path known

# Garbage collection
git gc
