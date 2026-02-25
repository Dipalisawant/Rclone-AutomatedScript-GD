sudo apt upadate -y
sudo apt update -y
sudo apt install rclone
rclone --version
rclone config
echo "rclone test" > test.txt
rclone copy test.txt gdrive:Backups
rclone ls gdrive:
rclone config file
ubuntu@ip-172-31-10-32:~$ cd my-github-project
mkdir -p ~/backups/logs
mkdir ~/backup_project
cd ~/backup_project
nano backup_script.sh
cd
ls
cd my-github-project/
echo "hello backup" > file1.txt
mkdir src
touch src/app.py
ls
cd
ls
cd backup_project/
ls
./backup_script.sh 
sudo apt update
sudo apt install zip -y
zip -v
./backup_script.sh 
ls ~/backups/MyProject/daily
ls ~/backups/MyProject/weekly
ls ~/backups/MyProject/monthly
ls
cd backup_project/
ls ~/backups/MyProject/daily
ls ~/backups/MyProject/weekly
ls ~/backups/MyProject/monthly
~/backups/MyProject/YYYY/MM/DD/
ls
nano backup_script.sh 
cat backup_script.sh 
nano backup_script.sh 
./backup_script.sh 
ls ~/backups/MyProject/daily
ls ~/backups/MyProject/weekly
ls ~/backups/MyProject/monthly
rclone lsd gdrive:Backups/MyProject
crontab -e
cd
git init
git config --global user.name"Dipalisawant"
git config --global user.email"dipalisawant9686@gmail.com"
git add .
git status
git commit -m "my commit"
git branch -M master
git remote add origin https://github.com/Dipalisawant/my-github-project.git
git push -u origin master
git rm --cached .config/rclone/rclone.conf
nano .gitignore
git add .gitignore
git commit -m "chore: ignore rclone config with secrets"
git reset --soft HEAD~1
git commit -m "Initial commit without secrets"
sudo apt install git-filter-repo -y
git filter-repo --path .config/rclone/rclone.conf --invert-paths
git push -u origin master 
git rm --cached -r .config/rclone
git ls-files | grep rclone
git rm --cached --ignore-unmatch .config/rclone/rclone.conf
home/ubuntu/.config/rclone/rclone.conf
git rm --cached --ignore-unmatch home/ubuntu/.config/rclone/rclone.conf
nano .gitignore
git commit --amend -m "Remove secrets and add gitignore"
git push origin master
ls
cd ~/my-github-project
pwd
git log --all -- .config/rclone/rclone.conf
git filter-branch --force   --index-filter   "git rm --cached --ignore-unmatch .config/rclone/rclone.conf"   --prune-empty   --tag-name-filter cat   -- --all
nano .gitignore
git add .gitignore
git commit -m "Ignore rclone config and secrets"
git push origin master 

git add .gitignore
git commit -m "Ignore rclone config and secrets1"
git push origin master 
git status
git add .
git status
git commit -m "Ignore rclone config and secrets2"
git remote add origin https://github.com/Dipalisawant/my-github-project.git
git push origin master 
git push origin master --force
git status
git add .gitignore
git commit -m "Ignore rclone config"
git filter-branch --force   --index-filter   "git rm --cached --ignore-unmatch .config/rclone/rclone.conf"   --prune-empty   --tag-name-filter cat   -- --all
rm -rf .git/refs/original/
git reflog expire --expire=now --all
git gc --prune=now --aggressive
git push origin master --force
ls
cd backups
ls
cd MyProject/
ls
cd
ls
cd backup_project/
ls
nano config
nano config_script.sh 
ls
cd my-github-project/
ls
cd ..
cd backup_project/
ls
nano backup_script.sh 
nano config_script.sh
ls
