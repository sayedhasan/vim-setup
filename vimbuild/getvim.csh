#!/bin/csh -fx

setenv LANG C
unsetenv INTEL_LICENSE_FILE
unsetenv LM_LICENSE_FILE

setenv SSH_SOCKS_SERVER "socks://proxy-socks.jf.intel.com:1080"
setenv http_proxy http://proxy.fm.intel.com:911
setenv https_proxy http://proxy.fm.intel.com:911
setenv ftp_proxy http://proxy.fm.intel.com:911

hg clone http://vim.googlecode.com/hg/ vim.latest
tar --exclude-vcs -jcvf vim.latest.tar.bz2 vim.latest/
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2

