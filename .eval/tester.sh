#!/bin/bash
if [ -d $4 ]
then
  if [ -d $6 ]
  then
    user_score=0
    user_score=`expr $user_score + 1`
    if [ $user_score -eq 1 ]
    then
      echo 'Preliminary local directory checks in local repository... Pass'
    else
      echo 'Preliminary local directory checks in local repository... Fail'
    fi
    cd $2
    [ `eval git log --pretty="oneline" | wc -l` -ge 3 ] && echo 'Commits check on master... Pass' || echo 'Commits check on master... Fail'
    git checkout master > /dev/null 2>&1
    [ `eval cat check_number.py | grep "#Read user input" | wc -l` -ge 1 ] && echo 'file check... Pass' || echo 'file check... Fail'
    cd ..
  else
    echo 'No local directory found...'
  fi

  if [ -d $1/$2 ]
  then
    user_score=0
    user_score=`expr $user_score + 1`
    cd $1
    git clone $2 $3 > /dev/null 2>&1
    if [ $user_score -eq 1 ]
    then
      echo 'Preliminary remote directory checks in local repository... Pass'
    else
      echo 'Preliminary remote directory checks in local repository... Fail'
    fi
    cd $3
    [ `eval git log --pretty="oneline" | wc -l` -ge 3 ] && echo 'Commits check on master... Pass' || echo 'Commits check on master... Fail'
    git checkout master > /dev/null 2>&1
    [ `eval cat check_number.py | grep "#Read user input" | wc -l` -ge 1 ] && echo 'file check... Pass' || echo 'file check... Fail'
    cd ../..
    rm -rf $1/$3
  else
    echo 'No remote directory found...'
  fi
else
  echo 'No git found in the local directory'
fi
