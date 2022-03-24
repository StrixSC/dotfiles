# Dotfiles

## Setup & Installation

 The config files are very easy to setup if you have [stow](https://www.gnu.org/software/stow/) which is already on most popular distros. 

 To setup the config files, clone the repo and enter it, then run the following command:

``` bash
stow <DIRECTORY>
```

 For example if you wanted to configure `nvim`, you would run:

 ```bash
 stow nvim
 ```

Make sure that your `$XDG_HOME_CONFIG` points to `$HOME/.config`.
