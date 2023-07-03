#!/bin/sh
repo=https://raw.github.com/rcmdnk/gmail_filter_manager/master
scripts=($repo/bin/gfm_extract $repo/bin/gfm_make)
if [ x"$prefix" = x ];then
  prefix=/usr/local
fi

prefix=$(echo $prefix|sed 's|--prefix=||'|sed "s|^~|$HOME|"|sed "s|^\.|$(pwd)|")

echo
echo "###############################################"
echo "Install to $prefix/bin"
echo "###############################################"
echo
sudo=""
if [ -d "$prefix/bin" ];then
  touch "$prefix/bin/.install.test" >& /dev/null
  if [ $? -ne 0 ];then
    sudo=sudo
  else
    rm -f "$prefix/bin/.install.test"
  fi
else
  mkdir -p $prefix/bin>&  /dev/null
  if [ $? -ne 0 ];then
    sudo mkdir -p $prefix/bin
    sudo=sudo
  fi
fi

for s in "${scripts[@]}";do
  sname=`basename "$s"`
  echo "Intalling ${sname}..."
  $sudo curl -fsSL -o "$prefix/bin/$sname" "$s"
  $sudo chmod 755 "$prefix/bin/$sname"
done

pip3 install ruamel.yaml
