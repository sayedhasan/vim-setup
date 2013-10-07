#!/bin/csh -f

setenv PATH /usr/intel/pkgs/python/2.7.2/bin:$PATH
setenv PATH /usr/intel/pkgs/gcc/4.7.2/bin:$PATH
setenv PATH /usr/intel/pkgs/python/3.3.1/bin:$PATH
setenv PATH /usr/intel/pkgs/ruby/2.0.0-p0/bin:$PATH
setenv PKG_CONFIG_PATH /usr/intel/pkgs/gtk+/2.24.11/lib/pkgconfig
setenv LDFLAGS "-L/usr/intel/pkgs/gtk+/2.24.11/lib -liconv -Wl,-rpath,/usr/intel/pkgs/gtk+/2.24.11/lib"

  #--prefix=/nfs/pdx/home/shasan/usr/pkgs/vim/7.4 \

./configure \
  --prefix=/tmp/$USER/vim/7.4 \
  --enable-luainterp=no \
  --enable-mzschemeinterp=no \
  --enable-perlinterp=yes \
  --enable-pythoninterp=yes \
  --enable-python3interp=yes \
  --with-features=huge \
  --with-compiledby="shasan" \
  --with-tlib=ncurses \
  --enable-fontset \
  --enable-gui=gtk2 \
  --enable-multibyte \
  --enable-gtk2-check \
  --enable-gnome-check \
  --enable-motif-check \
  --enable-athena-check \
  --enable-nextaw-check \
  --enable-carbon-check \
  --enable-tclinterp \
  --enable-cscope \
  --enable-xim \
  --with-x \
  --enable-fail-if-missing 
