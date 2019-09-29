#/bin/bash
rt=$PWD
max_size=0
function mf
{
count=0
for dir in $(ls -A)
do
    if [[ -d $dir ]]; then
     echo "$dir is a DIRECTORY"
     cd $dir
     count=$(($count+1))
     mf
    elif [[ -f $dir ]]; then
     echo "$dir is a FILE"
     current_size=`du -k "$dir" | cut -f1`
     if (($current_size>$max_size)); then
      dr=$PWD
      fl=$dir
      max_size=$current_size
    fi
   else
     echo $dir
     cd $rt

fi

done
}
mf
echo Largest file is: $fl with a size of $max_size Kb located in $dr
