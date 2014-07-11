#
# Cookbook Name:: amazon_s3cmd
# Recipe:: databag_and_config
#
# Copyright 2013, Gerald L. Hevener Jr., M.S.
#

# Make sure data bag secret exists.
if File.exists?(node['amazon_s3cmd']['data_bag_secret']) then

  # Set up encrypted data bag.
  data_bag_secret = node['amazon_s3cmd']['data_bag_secret']
  s3_secret = Chef::EncryptedDataBagItem.load_secret(data_bag_secret)
  s3_creds = Chef::EncryptedDataBagItem.load(node['amazon_s3cmd']['encrypted_data_bag_name'], node['amazon_s3cmd']['encrypted_data_bag_item'], s3_secret)

  # Save Amazon key & secret to variables.
  s3_key = s3_creds["s3_access_key"]
  s3_secret = s3_creds["s3_secret_key"]

  else

    # Inform user to create data bag & item.
    Chef::Log.info("WARNING: You must create encrypted data bag named s3cmd & item named s3cfg
                    with data bag secret copied to /etc/chef/encrypted_data_bag_secret on your node
                    in order to use the amazon_s3cmd cookbook or override via role!! ")
end

# Deploy config file for s3cmd.
if node.default['amazon_s3cmd']['user'] == 'root'

  template "/#{node['amazon_s3cmd']['user']}/.s3cfg" do
    source "s3cfg.erb"
    owner node['amazon_s3cmd']['user']
    group node['amazon_s3cmd']['group']
    mode "0644"
    variables(
      :s3_access_key => s3_key,
      :s3_secret => s3_secret)
    not_if "ohai platform |grep -i freebsd"
    only_if { node['amazon_s3cmd']['user'] == 'root' }
  end

   template "/#{node['amazon_s3cmd']['user']}/.s3cfg" do
    source "s3cfg.erb"
    owner node['amazon_s3cmd']['user']
    group "wheel"
    mode "0644"
    variables(
      :s3_access_key => s3_key,
      :s3_secret => s3_secret)
    only_if "ohai platform |grep -i freebsd"
  end

end

if node.default['amazon_s3cmd']['user'] != 'root'

   template "/home/#{node['amazon_s3cmd']['user']}/.s3cfg" do
    source "s3cfg.erb"
    owner node['amazon_s3cmd']['user']
    group node['amazon_s3cmd']['group']
    mode "0644"
    variables(
      :s3_access_key => s3_key,
      :s3_secret => s3_secret)
    not_if "ohai platform |grep -i freebsd"
  end

  template "/home/#{node['amazon_s3cmd']['user']}/.s3cfg" do
    source "s3cfg.erb"
    owner node['amazon_s3cmd']['user']
    group "wheel"
    mode "0644"
    variables(
      :s3_access_key => s3_key,
      :s3_secret => s3_secret)
    only_if "ohai platform |grep -i freebsd"
  end

end

# Deploy creds as ENV VARS to /etc/profile.d.
if node.default['amazon_s3cmd']['deploy_creds_as_env_vars'] = 'yes'

  include_recipe 'amazon_s3cmd::env_var'

end
