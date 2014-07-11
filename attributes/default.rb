#
# Cookbook Name:: amazon_s3cmd
# Recipe:: default
#
# Copyright 2012, Gerald L. Hevener Jr., M.S.
#

# Install user.
node.default['amazon_s3cmd']['install_user'] = 'root'

# User using s3cmd.
node.default['amazon_s3cmd']['user'] = 'root'

# Group using s3cmd.
node.default['amazon_s3cmd']['group'] = 'root'

# Install python-magic library.
node.default['amazon_s3cmd']['install_python_magic'] = 'yes'

# Location of s3cmd config.
#node.set['amazon_s3cmd']['s3cfg'] = "#{node['amazon_s3cmd']['user']}/.s3cfg"

# Amazon S3 Key.
node.default['amazon_s3cmd']['amazon_key'] = ''

# Amazon secret.
node.default['amazon_s3cmd']['amazon_secret'] = ''

# Encrypted data bag secret file.
node.default['amazon_s3cmd']['data_bag_secret'] = '/etc/chef/encrypted_data_bag_secret'

# Encrypted data bag name.
node.default['amazon_s3cmd']['encrypted_data_bag_name'] = 's3cmd'

# Encrypted data bag item.
node.default['amazon_s3cmd']['encrypted_data_bag_item'] = 's3cfg'

# Set to yes to also deploy s3 creds as environment variables.
# Will be written to /etc/profile.d/
node.default['amazon_s3cmd']['deploy_creds_as_env_vars'] = 'no'

##########Attributes for amazon_s3cmd::source recipe#################
# list of users that will have the s3cmd configuration
node.default['amazon_s3cmd']['users'] = [:root]
node.default['amazon_s3cmd']['version'] = "v1.1.0-beta3"
node.default['amazon_s3cmd']['install_prefix_root'] = "/usr/local"
#####################################################################
