#/bin/bash
#echo $1
#echo $2
count=1
check=$2.$count
done=0
if [ -f "$2" ]; then
 while [ $done==0 ]; do
  if [ -f "$check" ]; then
   #echo $check
   count=$(($count+1))
   check=$2.$count
  else
   mv $1 $check
   done=1
   break
  fi
 done
fi
