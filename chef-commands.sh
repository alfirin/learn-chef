# From the workstation

# Create the node
knife bootstrap '172.28.128.3' --bootstrap-version '12.5.0'  --ssh-user 'vagrant' --ssh-password 'vagrant' --sudo --use-sudo-password --node-name node1 --run-list 'recipe[learn_chef_apache2]'
knife bootstrap '172.28.128.3' --bootstrap-version '12.5.0' --ssh-user 'vagrant' --ssh-password 'vagrant' --sudo --use-sudo-password --node-name web_app_ubuntu --run-list 'recipe[awesome_customers]'

# Update the cookbook
knife cookbook upload learn_chef_apache2

# Run the cookbook on the node
knife ssh '172.28.128.3' 'sudo chef-client' --manual-list --ssh-user 'vagrant' --ssh-password 'vagrant'

# Get a cookbook version
knife cookbook site show mysql | grep latest_version

# Berks -> Upload metadata dependency
berks install
berks upload

# Data bag
# Create data
knife data bag create passwords
# Upload data
knife data bag from file passwords sql_server_root_password.json --secret-file /tmp/encrypted_data_bag_secret
# Show data bag
knife data bag show passwords sql_server_root_password
# Show and decrypt data bag
knife data bag show passwords sql_server_root_password --secret-file /tmp/encrypted_data_bag_secret

# Generate
# Recipe
chef generate recipe cookbooks/awesome_customers database