# cdf
Change directory like finder

# Installation
This command is compatible with only bash and zsh.

**NOTE:** Please install fzf (https://github.com/junegunn/fzf) before install this command.

```
git clone https://github.com/narita-kosei/cdf.git
cd cdf
./install.sh

# If using bash
source ~/.bashrc

# If using zsh
source ~/.zshrc
```

# Usage
Use arrow key to change directory

![Demostration](https://raw.githubusercontent.com/narita-kosei/cdf/blob/images/cdf.gifcdf.gif)

|Key|Action|
|-|-|
|Left (ctrl-h)|Move to parent directory|
|Right (ctrl-l, space)|Move to directory at cursor position|
|Up (ctrl-k)|Move cursor up|
|Down (ctrl-j, tab)|Move cursor down|
|Enter|Quit after move to directory at cursor position|
|Esc|Quit at current directory|
