#!/bin/bash

# this is a file for installing pip on ubunutu

ST="ez_setup.py"
PIP="get-pip.py"

sti=`which easy_install`

if [ ! $sti ]; then
  curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py > $ST

  sudo python $ST
  rm -f $ST
fi

pipi=`which pip`

if [ ! $pipi ]; then
  curl https://raw.github.com/pypa/pip/master/contrib/get-pip.py > $PIP

  sudo python $PIP

  rm -f $PIP
fi

