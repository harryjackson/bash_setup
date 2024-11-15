# Lets get brew installed

Open the basic terminal that already is installed, using Cmd+Space 
then type "terminal". Follow instruction [to install brew found here](https://brew.sh/)


# XCode Command Line Tools

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

# Homebrew

Intall homebrew, check website for current method

```bash
brew install vim iterm2 keychain 
brew install ntp wget nmap httpie 
brew install okta bash ca-certificates
brew install cloc sloccount consul docker docker-compose docker-completion
brew install flux git go maven gradle jq 
brew install k9s kubecfg kubernetest-cli
brew install k6 grafana prometheus loki vault
brew install lua node perl python3
brew install lz4 lzo 
brew install libyaml tree 
brew install saml2aws
```

# Synthetic.conf

```bash
vim /etc/synthetic.conf
mkdir $USER/git
```

add the following text, tab is very important, use a real tab not "\t"

```
git\t/Users/$USERNAME_HERE
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

Install lastpass

## Chrome Passwords

You can export passwords using the password manager. Always delete the csv file
it creates.

# Intellij

The ultimate license is based on your Jetbrains account, Download it and login
to get the license. Do this after chrome password import so it can find the 
password and save some time.

# Docker Desktop




