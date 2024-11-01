# rdt
Use `rdt` if you tired of typing `nohup command &> /dev/null &` to run command detached from shell
## Example
```shell
rdt python3 -m http.server 8888 # start simple http server on port 8888
```
now you can close the terminal and command will keep running
## Explanation
This script is simple as heck, it basically run command in a subshell.
`stdout` and `stderr` are discarded.
## Installation
```shell
git clone --depth=1 --filter=blob:none https://github.com/RayJameson/rdt && cd rdt

# by default install to /usr/local/bin, should be run with sudo
sudo bash ./install.sh # check the script to make sure I'm not installing crypto miner on your PC

# if you have some user dir with binaries which is included in $PATH you can specify it as argument
bash ./install.sh ~/.local/bin
```
## Uninstallation
```shell
# default location
sudo rm -c /usr/bin/rdt
# or if you used user dir
rm -c $(which rdt)

rm -c ~/.zfunc/_rdt
```
## Completion
I made this script for myself, so currently only zsh completion is supported  
and it basically uses completion of passed command.

I have no interest implementing completion for other shells because it's unbearable.
