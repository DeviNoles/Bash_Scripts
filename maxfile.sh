#/bin/bash
rt=$1
max_size=0
cd $1
rt=$PWD
function mf
{
for dir in $(ls -A)
do
    echo "$dir" in $PWD
    if [[ -d $dir ]]; then
     echo "$dir is a DIRECTORY"
     cd $dir
     mf
    elif [[ -f $dir ]]; then
     #echo "$dir is a FILE"
     current_size=`du -k "$dir" | cut -f1`
     if (($current_size>$max_size)); then
      dr=$PWD
      fl=$dir
      max_size=$current_size
     fi
   elif [[ -L "$file" && -d "$file" ]]; then
    # echo "$dir is a SYMLINK"
     cd $dir
     mf
fi
cd $rt
done
}
mf
echo Largest file: $fl with a size of $max_size Kb located in $dr
