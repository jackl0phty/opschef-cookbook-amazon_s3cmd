#
# Cookbook Name:: amazon_s3cmd
# Recipe:: env_var
#
# Copyright 2013, Gerald L. Hevener Jr., M.S.
#

# Deploys S3 creds as environment variables.
# Add files to /etc/profile.d.
%w(amazon_key amazon_secret).each do |var|
  magic_shell_environment var.upcase do
    value node[var]
  end
end
