########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory

# list of files/folders to symlink in homedi
files=".alias .bash_profile .bashrc .exports .functions .git-completion.bash .gitattributes .gitconfig .gitignore .prompt"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "Completed"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "Completed"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv ~/$file ~/dotfiles_old/
  echo "Creating symlink to $file in home directory."
  ln -sv $dir/$file ~
done

source ~/.bashrc
