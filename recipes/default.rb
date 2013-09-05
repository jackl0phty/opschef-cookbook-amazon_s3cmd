#
# Cookbook Name:: amazon_s3cmd
# Recipe:: default
#
# Copyright 2013, Gerald L. Hevener Jr., M.S.
#

# Install Amazon S3 client.
case node['platform_family']
 
  when "debian"
    %w{ python-magic s3cmd }.each do |pkg|
    package pkg
  end

  when "redhat"
    %w{ s3cmd }.each do |pkg|
    package pkg
  end

# No package for suse.
#  when "suse"
#    %w{ s3cmd }.each do |pkg|
#    package pkg
#  end

# mount_virtualbox_shared_folder error.
#  when "bsd"
#    %w{ s3cmd }.each do |pkg|
#    package pkg
#  end

  when "arch"
    %w{ s3cmd }.each do |pkg|
    package pkg
  end

when "gentoo"
    %w{ s3cmd }.each do |pkg|
    package pkg
  end

end

# Make sure data bag secret exists.
if File.exists?("#{node['amazon_s3cmd']['data_bag_secret']}") then

  # Set up encrypted data bag.
  data_bag_secret = "#{node['amazon_s3cmd']['data_bag_secret']}"
  s3_secret = Chef::EncryptedDataBagItem.load_secret(data_bag_secret)
  s3_creds = Chef::EncryptedDataBagItem.load("#{node['amazonZ_s3cmd']['encrypted_data_bag_name']}", "#{node['amazonZ_s3cmd']['encrypted_data_bag_item']}", s3_secret)

  # Save Amazon key & secret to variables.
  s3_key = s3_creds["s3_access_key"] 
  s3_secret = s3_creds["s3_secret_key"] 

  # Save creds to node.
  node.set['amazon_key'] = s3_key
  node.set['amazon_secret'] = s3_secret

  else
  
    # Inform user to create data bag & item.
    Chef::Log.info("WARNING: You must create encrypted data bag named s3cmd & item named s3cfg
                    with data bag secret copied to /etc/chef/encrypted_data_bag_secret on your node
                    in order to use the amazon_s3cmd cookbook or override via role!! ")
end

# Deploy config file for s3cmd.
template "#{node['amazon_s3cmd']['s3cfg']}" do
  source "s3cfg.erb"
  owner "#{node['amazon_s3cmd']['user']}"
  group "#{node['amazon_s3cmd']['group']}"
  mode "0644"
  variables(
    :s3_access_key => s3_key,
    :s3_secret => s3_secret)
end

# Add files to /etc/profile.d.
%w(amazon_key amazon_secret).each do |var|
  magic_shell_environment var.upcase do
    value node[var]
  end
end
