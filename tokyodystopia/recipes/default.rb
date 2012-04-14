#
# Cookbook Name:: tokyocabinet
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

require_recipe "build-essential"
require_recipe "tokyocabinet"

script "install tokyodystopia" do
  not_if do
    File.exists?("/usr/local/lib/libtokyodystopia.so")
  end
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  wget "http://fallabs.com/tokyodystopia/tokyodystopia-0.9.15.tar.gz"
  tar xzf tokyodystopia-0.9.15.tar.gz
  cd tokyodystopia-0.9.15
  ./configure
  make
  make install
  EOH
end
