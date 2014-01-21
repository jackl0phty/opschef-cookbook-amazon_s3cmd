#
# Cookbook Name:: amazon_s3cmd
# Recipe:: default
#
# Copyright 2012, Gerald L. Hevener Jr., M.S.
#

# Install user.
default['amazon_s3cmd']['install_user'] = 'root'

# User using s3cmd.
default['amazon_s3cmd']['user'] = 'root'

# Group using s3cmd.
default['amazon_s3cmd']['group'] = 'root'

# Install python-magic library.
default['amazon_s3cmd']['install_python_magic'] = 'yes'

# Location of s3cmd config.
#node.set['amazon_s3cmd']['s3cfg'] = "#{node['amazon_s3cmd']['user']}/.s3cfg"

# Amazon S3 Key.
default['amazon_s3cmd']['amazon_key'] = ''

# Amazon secret.
default['amazon_s3cmd']['amazon_secret'] = ''

# Encrypted data bag secret file.
default['amazon_s3cmd']['data_bag_secret'] = '/etc/chef/encrypted_data_bag_secret'

# Encrypted data bag name.
default['amazonZ_s3cmd']['encrypted_data_bag_name'] = 's3cmd'

# Encrypted data bag item.
defualt['amazonZ_s3cmd']['encrypted_data_bag_item'] = 's3cfg'

##########Attributes for amazon_s3cmd::source recipe#################
# list of users that will have the s3cmd configuration 
default['amazon_s3cmd']['users'] = [:root]

# S3 credentials
#default[:s3cmd][:aws_access_key_id] = ""
#default[:s3cmd][:aws_secret_access_key] = ""

default['amazon_s3cmd']['version'] = "v1.1.0-beta3"
default['amazon_s3cmd']['install_prefix_root'] = "/usr/local"
