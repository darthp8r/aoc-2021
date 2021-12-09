# Running in macOS

Strange that `homebrew` needs to be installed by an `admin`-carrying user.
I login as a regular user, only elevating to an admin-having account when
necessary. But `homebrew` want to be root at the `/opt/homebrew` folder,
owned by a privileged user, not me, and that manifests after I've installed
`rvm` and am attempting to download and install new rubies.

First, `rvm install 2.7` wanted to find `homebrew` in `/usr/local`, not `/opt`.

Second, the whole _idea_ of `rvm` is ro provide virtual ruby environments for
regular users, _not_ admin-capable accounts.

## Highly-localized homebrew Environment

Fortunately, you can place an `rvm` in your `HOME` directory by setting only
two environment variables before proceeding:

```sh
# ~/.zshrc
export HOMEBREW_PREFIX=${HOME}/unsupported/homebrew
export PATH=${PATH}:${HOMEBREW_PREFIX}/bin
```

```sh
% mkdir -p ~/unsupported && cd ~/unsupported
% git clone https://github.com/Homebrew/brew homebrew
% source ~/.zshrc
% which brew
/Users/payter/unsupported/homebrew/bin/brew
% brew update
```

## Install rvm

```sh
% rvm list known
:
% rvm install 2.7
```

export PATH="$PATH:$HOME/.rvm/bin"
