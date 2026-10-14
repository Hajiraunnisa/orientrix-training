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
