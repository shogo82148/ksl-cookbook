#
# Cookbook Name:: tokyocabinet
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

require_recipe "build-essential"

package "bzip2-devel" do
  :install
end

script "install tokyocabinet" do
  not_if do
    File.exists?("/usr/local/lib/libtokyocabinet.so")
  end
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  wget "http://fallabs.com/tokyocabinet/tokyocabinet-1.4.47.tar.gz"
  tar xzf tokyocabinet-1.4.47.tar.gz
  cd tokyocabinet-1.4.47
  ./configure
  make
  make install
  EOH
end
