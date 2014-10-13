unix-dot
========

### Installation

Clone the repo to your machine. The repo must be placed in `~/git/unix-dot`. 
To execute the bootstrap-script run the following command: 

```bash
./deployAll.sh
```

This will install homebrew, oh-my-zsh, and symlink all dotfiles. For OSX it will also configurate systemwide settings (see the file `osx_config` for details).

#### Only dotfiles

```bash
./deployDot.sh
```
