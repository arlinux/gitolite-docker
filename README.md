####README####

Clone this gitolite-docker repo.

*Generate ssh keypair. This will generate a private key file named gitadmin and a public key file gitadmin.pub*

$ssh-keygen -t rsa -f gitadmin

###Build image###
$docker build -t gitolite-docker . 

###Start Container###
$sh start_container.sh

<p>
You will see 3 directories created. 
These are mounted when you stop/start container to maintain data permanently. 
<br>
<li>ssh - Contain authorized_file      
<li>gitolite  - Configs dir
<li>repos  - Very important - your code repositories are stored here.
</p>

###How to manage and work?###

####ADMIN####

<pre><code>
$ cat  /home/ashok/.ssh/config 
HOST 192.168.10.201
USER git
port 2222
IdentityFile /home/ashok/gitolite-docker/gitadmin
$ ssh -p 2222  git@192.168.10.201 info
hello admin, this is git@28a283388d4c running gitolite3 v3.6.4-19-g8de9b8d on git 1.9.1

 R W	gitolite-admin
 R W	testing

$ git clone git@192.168.10.201:gitolite-admin
$ cd gitolite-admin
<p><b>You will find conf and keydir - Update config, add your user keys and commit!</p>
</pre></code>
####E.g of another user####
<pre><code>
$ cat ~/.ssh/config 
HOST 192.168.10.201
USER git
port 2222
IdentityFile /home/swetha/swetha

$ ssh -i swetha -p 2222  git@192.168.10.201 info
hello swetha, this is git@28a283388d4c running gitolite3 v3.6.4-19-g8de9b8d on git 1.9.1

 R W	pip
 R W	testing
</pre></code>

