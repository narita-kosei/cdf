# cdf
Change directory like finder

![Demostration](https://raw.githubusercontent.com/narita-kosei/cdf/images/cdf.gif)

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

```
cdf [-a] [-h] [path]
```

### Options

- `-a`: Display all directories including hidden directory.
- `-h`: Show help.
- `path`: Start with given path. If omitted, current path is used.

|Key|Action|
|-|-|
|Left (ctrl-h)|Move to parent directory|
|Right (ctrl-l, space)|Move to directory at cursor position|
|Up (ctrl-k)|Move cursor up|
|Down (ctrl-j, tab)|Move cursor down|
|Enter|Quit after move to directory at cursor position|
|Esc|Quit at current directory|
