# Local git clone of svn repo
$ git svn clone -rHEAD <URL>

> [working-copy]
$ git add
> [staging-area]
$ git commit
> [repo]

# Amend commit message (if unpushed)
git commit --amend

# Remove file from staging area
git reset $file

# Make a branch (from the master)
git checkout -b dev/mybranchname

# Return to the master/root-of-branch
git checkout master

# Show all local branches (asterisk marks current branch)
git branch
# Show all remote branches
git branch -r

# Merge branch into master
git checkout master
git merge branch

# Merge no fast-forward (keeps branch after merging)
git merge --no-ff

git add -p ['hunk' aka line]

# Diff b/w staging area vs upstream repo
git diff --cached

# View log of commits not yet pushed upstream
git log origin/master..master

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
# Revert a specific file to a specific commit
git checkout <commit_hash> <file>
# Preview a file @ a specific commit (without checking it out)
git show <commit_hash>:<path/file>

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

# Search for all committed changes to a file
git log -- <file>		# commit msg only
git log --patch -- <file>	# commit msg and diff
git log --all -- <file>		# Across all branches

# See changes to file by commit/author/date
git blame <file>
# ...between specific lines
git blame -L <start>,<end> <file>
# ...withinn a specific function in the source
git blame -L:<function> <file>

# Verify validity and connectivity of objects
# (Shows dangling blobs and dangling commits)
git fsck

# Find garbage and see stats e.g. pack(s) size
git count-objects -v

# Garbage collection
git gc

# Prune loose garbage
git prune

# Remove untracked files from the working tree
git clean
# Remove untracked directories "
git clean -d

# Repack (pack == history), clearing garbage in the history
git repack -Ad

# Diff, only show file name, or also include diff-status
git diff --name-only
git diff --name-status

# See git stash without applying it
git stash show -p

# Reattach detached HEAD
# (First create a temporary branch onto which to attach the HEAD)
git checkout -b temp_branch
# (Then merge the temporary branch to the relevant existing branch)
git checkout -B target_branch temp_branch
# (Finally, optionally delete the temporary branch)
git branch -d temp_branch

# Exclude a file type (e.g. *.csv) from an operation (e.g. diff)
git diff -- . ':!*.csv'
# NB. this is called "pathspec magic"

# Conflict resolution: accept pulled version entirely, discard HEAD version
git checkout --theirs -- <filename>
# vice-versa
git checkout --ours -- <filename>

# Amend/edit a commit message
git commit --amend

# Fetch a new branch from upstream
git fetch --all
# NB. new branch will not show after `git branch`
git checkout new_branch

# See which branches have been merged onto the current branch
git branch --merged
# ...and which branches have not yet been merged
git branch --no-merged

# Compare file across branches
git diff branch1..branch2 -- file.ext

# See history of changes to a specific line number in a $file
git log -L110,110:$file
