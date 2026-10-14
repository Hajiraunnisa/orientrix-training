# Git And Github 
Git is open source version control system and github is where you host your application,store repository and Collabrate with teams working on same project.

**Different Commands-**
1. clone - To copy existing github repository on local machine
2. commit - To save checkpoint
3. add-   command used to move changes from the working directory to the staging area
4. push- It uploads our commits to a remote repository.
5. Pull- Downloads and merges changes from the remote repository into your local machine.

New-Item -ItemType Directory -Force notes 
This Command Creates a New directory. if you want to create file just replace directory with file and notes with the filename with markdown .md extension.
"#" is used for main haeding.
After Writing some content you have to save.cntrl+s. 

git add notes/day-01.md   

git commit -m "Add day 01 learning notes" 

git push origin main 

If you track commit changes on github,you will see red colour (represents lines which you deleted.) and green colour(lines which added).

One Git repository normally has one .git folder, and that folder tracks changes for the entire repository.

git config --global user.email hajiraunnisa333@gmail.com ---> it records in git meta data who made the changes or author of commits.

When you write push command it need authentication. A way of Confirming Your identity. I used HTTPS to communicate with github server. In windows you have a Git Credential Manager that opens a browser where i need to sign in with github account.Github authorises the tool,accept/reject the action and store the credential.Git reuse it in future without asking us to enter password every time.

## SSH 
I will have private key and github will have corresponding public key.With SSH i prove that i'm the only one who have private key corresponding  to  public key registered at github.

ssh-keygen -t ed25519 -C "hajiraunnisa333@gmail.com"  
This is the command to generate key value pair.After that My generated public key is SHA256:GtLGEQKW1tB6XBXdSVMYqTRMrl6EJAEMCqoRKSR+ct0 which should be added to github SSH keys.  
git remote set-url origin git@github.com:Hajiraunnisa/orientrix-training.git This command is used to switch your existing repository to SSH.  

![alt text](image.png)
git push -u origin master(here u stands for upstream) -u Makes the origin master default you dont need to write again and again master default.  
If you are working on Github. You dont need to add/push. just commit changes it will host whereas if files were creayed locally you need to add,commit,push and if you dont have the permission to push directly first you pull the owner will review your work and then give you access to push.

# Branching
A branch is a separate line of work inside the same project.Without branches, everyone edits the same files at the same time — chaos.A branch is not a copy of your project. It's a label pointing to a specific commit.

**Main-Branch** = It is the Actual Main branch from your Repository. **Feature Branch** = it is a specific task/feature where you can experiment safely.Any changes made to feature branch doesn't effect main branch.vice-versa.
First, I created a new branch called new-branch using git checkout -b new-branch and confirmed I was on it with git branch. On this branch, I edited index.html, staged it with git add index.html, and committed with git commit -m "Adding new line on branch". I then made one more edit and committed again with git commit -m "Adding one more". 
<img width="907" height="540" alt="image" src="https://github.com/user-attachments/assets/1f26dbc3-4d8a-40ab-af2f-c8db03bba91a" />

Running git log --oneline --graph --all
<img width="837" height="267" alt="image" src="https://github.com/user-attachments/assets/d14bac4c-1420-4df7-8a42-ef26c57ba444" />
main stayed at commit aa1f086 (New file) while new-branch moved ahead to f22fd9a. I switched to main using git checkout main and saw my new lines disappear, then switched back with git checkout new-branch and the changes reappeared. This confirmed that branches keep work isolated. 
git diff shows changes you made but haven't staged (added) yet.
<img width="652" height="322" alt="image" src="https://github.com/user-attachments/assets/5859893a-52d0-496e-b730-f69a10ef6164" />
It is clearly showing the difference between our main branch and new branch.
Now,To push a new branch on github command is git push -u origin new-branch. 
push	"Upload my commits to the remote"
-u	--set-upstream — link this local branch to the remote branch
origin	The nickname for your GitHub repo URL
new-branch	The branch you're uploading (because Git doesn't yet know where new-branch should go on GitHub.)
After pushing your branch to GitHub you need to merge- There are 2 ways 
* Open your repo on GitHub — you'll see a "Compare & pull request" button for your branch.
  Click it, add a title/description, then click "Create pull request".
  Click "Merge pull request" → "Confirm merge".
* Using Local Computer git pull origin new-branch enter this command.
Once the Branch is merged its job is done so delete the branch you have created initially using git branch -d branch name.
git commit -am "New update to learn" - This adds and commit both at once.Its a shortcut works only for modified file.
commit before switching branches. uncommitted changes travel with you when you switch, which can cause conflicts or mess up the wrong branch. Committing keeps your work safe and tied to the right branch.
git log provides the meta data of whatever changes made from start to end.
git reset — moves your branch pointer back, changing commit history (uncommit / unstage).
git restore — only touches files, discards or unstages changes (never moves commits).
HEAD — pointer to your current commit; HEAD~1 = one commit back, HEAD~3 = three back.
