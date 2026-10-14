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