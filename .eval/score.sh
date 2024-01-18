#!/bin/bash
user_score=0
if [ -d $4 ]
then
  if [ -d $6 ]
  then
    user_score=`expr $user_score + 1`
    cd $2
    [ `eval git log --pretty="oneline" | wc -l` -ge 3 ] && user_score=`expr $user_score + 1`
    git checkout master > /dev/null 2>&1
    [ `eval cat check_number.py | grep "#Read user input" | wc -l` -ge 1 ] && user_score=`expr $user_score + 1`
    cd ..
  fi
  if [ -d $1/$2 ]
  then
    user_score=`expr $user_score + 1`
    cd $1
    git clone $2 $3 > /dev/null 2>&1
    cd $3
    [ `eval git log --pretty="oneline" | wc -l` -ge 3 ] && user_score=`expr $user_score + 1`
    git checkout master > /dev/null 2>&1
    [ `eval cat check_number.py | grep "#Read user input" | wc -l` -ge 1 ] && user_score=`expr $user_score + 1`
    cd ../..
    rm -rf $1/$3
  fi
fi
percent_score=$(( user_score * 100 / 6 ))
echo "Points scored: $user_score/6"
echo "FS_SCORE:$percent_score%"
