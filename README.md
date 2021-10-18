# Dotfiles

Config files used for arch setup 

The blocklets used for i3blocks are taken from the public repos and modified by me. 
 If you'd like my customized versions, feel free to use them. 


 # Setup & Installation

 The config files are very easy to setup if you have [stow](https://www.gnu.org/software/stow/) which shouldn't be too difficult to setup on most popular distros. 

 To setup the config files, simply clone the repo and enter it, then run the following command:

``` bash
stow <DIRECTORY_OF_CONFIG>
```

 For example if you wanted to configure `nvim`, you would run:

 ```bash
 stow nvim
 ```

 This, of course, is taking into consideration that your `$XDG_HOME_CONFIG` points to `$HOME/.config`.


TODO: 

- Document arch install file in ORG mode
