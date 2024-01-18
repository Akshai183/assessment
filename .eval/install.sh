#!/bin/bash
created=0
[ -d $1 ] && created=1 || mkdir $1
[ -d $1/$2 ] && created=2 || mkdir $1/$2
if [ $created -lt 2 ]
then
  cd $1/$2
  git init --bare > /dev/null 2>&1
  cd ../..
fi
mkdir $3
if [ -d $3 ]
then
  cd $3
  git init > /dev/null 2>&1
  git remote add origin ../$1/$2
  echo "# check whether 4 is even">check_number.py  
  echo "">>check_number.py 
  echo "num = 4">>check_number.py  
  echo "if (num % 2) == 0:">>check_number.py  
  echo '   print("{0} is Even".format(num))'>>check_number.py  
  git add .  
  git commit -m "initial commit" > /dev/null 2>&1
  git push origin master
  cd ..  
fi
