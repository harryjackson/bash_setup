# Lets get brew installed

Open the basic terminal that already is installed, using Cmd+Space 
then type "terminal". Follow instruction [to install brew found here](https://brew.sh/)


# XCode Command Line Tools

Brew normally installs these anyway so if you have brew installed then you're likely fine.

Before doing anything lets get XCode command line tools installed

```bash
xcode-select --install
```

# Rsync 

If using rsync make sure that "Remote Login" is enabled. It can be found
under General - > Sharing - Remote Login. Click on the information icon to 
the right of the Remote Login button and enable full disk access or rsync 
will fail.

# Bookmarks

On chrome open bookmark manager from the three dots menu, export as html then 
import on new machine 

# Development Setup


## Basics using Homebrew

Intall basic packages for development

```bash
brew install vim iterm2 keychain 
brew install ntp wget nmap httpie 
brew install okta bash ca-certificates
brew install cloc sloccount consul docker docker-compose docker-completion
brew install git go maven gradle jq
brew install lua node perl python3
brew install lz4 lzo 
brew install libyaml tree
```


## Other Development items, optional

```bash
# brew install k9s kubecfg kubernetest-cli
# brew install k6 grafana prometheus loki vault
# brew install saml2aws flux
```

# Create TLD /git using Synthetic.conf

This is a preference I have always had for using a top level directory for all things git related. This allows me to use 

/$HOME/git
or
/git

in scripts and it works the same but when I'm typing I don't need to use $HOME or "cd" first, yes I know I could use an alias.

```bash
vim /etc/synthetic.conf
mkdir $USER/git
```

add the following text, tab is very important, use a real tab not "\t"

```
git\t/Users/$USERNAME_HERE/git
```

then reboot machine. If the /git directory does not appear under / then check that
the tab is indeed in the file.

```bash
od -c /etc/synthetic.conf
```

and that the /Users/$USER/git directory exists


# SDKMAN

```bash
curl -s "https://get.sdkman.io" | bash
```

# Chrome

## Lastpass

Install lastpass in Chrome. Most companies have something they're using so install that as well.

## Chrome Passwords

You can export passwords using the password manager. Always delete the csv file
it creates.

# Intellij

The ultimate license is based on your Jetbrains account, Download it and login
to get the license. Do this after chrome password import so it can find the 
password and save some time.

# Docker Desktop




