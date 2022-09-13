#!/bin/bash

## Create a python 3.8 conda environment

find_in_conda_env(){
    /opt/conda/bin/conda env list | grep "${@}" >/dev/null
}

if find_in_conda_env "py38" ; then
   echo "py38 already exists."
else
   echo "creating new python 3.8 environment"
   su -c "/opt/conda/bin/conda create -n py38 python=3.8 -y" jupyter
fi

## Set git-credential store as the default git-credential helper
su -c "git config --global credential.helper store" jupyter

## Install git-lfs
apt install -y git-lfs
su -c "git lfs install" jupyter

## Setup idle shutdown

# Reference
# https://stackoverflow.com/questions/30556920/how-can-i-automatically-kill-idle-gce-instances-based-on-cpu-usage

apt install -y bc 

threshold=0.7
wait_minutes=15

count=0
while true
do

  load=$(uptime | sed -e 's/.*load average: //g' | awk '{ print $2 }') # Average load in the last 5 minutes.
  load=${load::-1} # Stripping the comma at the end.
  res=$(echo $load'<'$threshold | bc -l)
  if (( $res ))
  then
    echo "Machine idle, increasing idle minutes count."
    ((count+=1))
  else
    echo "Machine in use, resetting counter to zero."
    count=0 # Resetting counter to zero if CPU load reaches threshold.
  fi
  echo "Idle minutes count = $count"

  if (( count>wait_minutes ))
  then
    echo "Shutting down."
    # wait 5 minutes more before actually pulling the plug
    sleep 300
    sudo poweroff
  fi

  sleep 60

done