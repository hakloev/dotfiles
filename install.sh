dir="$HOME/git"
mkdir -p $dir
cd $dir
mkdir -p internal
cd internal
git clone --recursive https://github.com/hakloev/unix-dot.git
cd unix-dot
bash bootstrap.sh
