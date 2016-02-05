#!/bin/bash

chown -R git.git /home/git/.ssh /home/git/repositories /home/git/.gitolite /home/git/*
chmod 775 /home/git/.ssh /home/git/repositories /home/git/.gitolite
mkdir /home/git/.gitolite/logs; chown -R git.git /home/git/.gitolite/logs
if [ ! -f /home/git/.ssh/authorized_keys ];then
#cd /home/git; su git -c "gitolite/install -ln"
cd /home/git; su git -c "bin/gitolite setup -pk admin.pub"
fi

# handle the gitolite.rc
if [  -f "/home/git/repositories/gitolite.rc" ]; then
  echo 'import rc file'
  su git -c "cp /home/git/repositories/gitolite.rc /home/git/.gitolite.rc"
else
  echo 'export rc file'
  su git -c "cp /home/git/.gitolite.rc /home/git/repositories/gitolite.rc"
fi

if [ -f /home/git/repositories/gitolite-configured ]; then
  su git -c "/home/git/bin/gitolite setup"
else
su git -c "touch /home/git/repositories/gitolite-configured"
fi

/usr/sbin/sshd -D

