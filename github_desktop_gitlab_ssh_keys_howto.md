# How to use Gitlab repo with SSH keys in Github desktop

#### Create ssh keys for Git (Bash)
https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

#### Create ```config``` file for ssh
```
Host <gitlab hostname>
RSAAuthentication yes
IdentityFile ~/.ssh/id_rsa
User <user gitlab email>
```
#### Add these files to both C:\User\<UserName>\.ssh and H:\.ssh?
- config
- id_rsa
- id_rsa.pub

#### Clone repo
```git clone git@<gitlab hostname>:<repo name>.git```

#### See also 
http://stackoverflow.com/a/38654613
