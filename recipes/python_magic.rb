#
# Cookbook Name:: amazon_s3cmd
# Recipe:: python_magic 
#
# Copyright 2013, Gerald L. Hevener Jr., M.S.
#

# Install python-magic.
case node['platform_family']

  when "debian"
    %w{ python-magic }.each do |pkg|
    package pkg
  end

  when "redhat"
    %w{ python-magic }.each do |pkg|
    package pkg
  end

  when "suse"
    %w{ python-magic }.each do |pkg|
    package pkg
  end

end
