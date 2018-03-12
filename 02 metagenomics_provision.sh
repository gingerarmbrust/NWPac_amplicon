# metagenomics_provision.sh

# shell script for installing necessary tools for metagenomics analysis
# Jamie Collins, Armbrust Lab, University of Washington; james.r.collins@aya.yale.edu

# assumes we are setting up from scratch on a Ubuntu machine image
# *** if using AWS: also assumes we've allowed SSH traffic in the security group we used to set up our machine image

# ----------------------------------------------------
# install, set up necessary packages (if not yet installed)
# ----------------------------------------------------

# mothur

# install dependencies, if required

# mac requires that boost first be installed; haven't verified this is necessary yet on Ubuntu
brew install boost
brew install boost-python

# install mothur itself and add installation directory to path

# option 1: direct download latest compiled release from the Github repo (no compilation necessary)
export VERSION=$(curl -s "https://github.com/mothur/mothur/releases/latest" | grep -o 'tag/[v.0-9]*' | awk -F/ '{print $2}')
# linux
curl -L https://github.com//mothur/mothur/releases/download/$VERSION/Mothur.linux_64.zip | tar -xz
# mac
curl -L https://github.com//mothur/mothur/releases/download/$VERSION/Mothur.mac_64.OSX-10.12.zip | tar -xz
cd mothur
export PATH=$PATH:$(pwd)

# # option 2: download latest zipball, then compile
# curl -L https://api.github.com/repos/mothur/mothur/zipball > mothur-latest.tar.gz
# mkdir mothur-latest
# tar -xzf mothur-latest.tar.gz -C mothur-latest
# cd mothur-latest/*/
# make
# export PATH=$PATH:$(pwd)

# # PEAR (if desired)
# # N.B. that this snippet here will load a much older version of the code still hanging out on GitHub

# git clone https://github.com/tseemann/PEAR.git ~/Code/PEAR
# cd ~/Code/PEAR
# make
# sudo make install

# # it seems that the latest version of PEAR is now available here via some convoluted download service:
# # http://www.exelixis-lab.org/web/software/pear
# # *** this makes it difficult to source and install using any sort of script

