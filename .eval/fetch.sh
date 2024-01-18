cd $1/$2 
if [ `eval git log --pretty="oneline" | wc -l` -ge 1 ] 
then 
  cd ../.. 
  git clone $1/$2 $3
  cd $3 
  sed -i "1s/^.*$/#Read user input and checks whether it's even or odd/" check_number.py 
  sed -i '3s/^.*$/num = int(input("Enter a number: "))/' check_number.py 
  git commit -am "updated code to read user input" > /dev/null 2>&1 
  git push origin master
  cd ..
fi