# From the workstation

# Init the project
chef generate repo chef-repo

# Create the cookbook
chef generate cookbook cookbooks/wordpress

# Create the node
knife bootstrap '172.28.128.3' --bootstrap-version '12.5.0'  --ssh-user 'vagrant' --ssh-password 'vagrant' --sudo --use-sudo-password --node-name node1 --run-list 'recipe[learn_chef_apache2]'
knife bootstrap '172.28.128.3' --bootstrap-version '12.5.0' --ssh-user 'vagrant' --ssh-password 'vagrant' --sudo --use-sudo-password --node-name web_app_ubuntu --run-list 'recipe[awesome_customers]'
knife bootstrap '172.28.128.6' --bootstrap-version '12.4.1' --ssh-user 'vagrant' --ssh-password 'vagrant' --sudo --use-sudo-password --node-name wordpress --run-list 'recipe[wordpress]'

# Update the cookbook
knife cookbook upload learn_chef_apache2

# Run the cookbook on the node
knife ssh '172.28.128.3' 'sudo chef-client' --manual-list --ssh-user 'vagrant' --ssh-password 'vagrant'
knife ssh '172.28.128.6' 'sudo chef-client' --manual-list --ssh-user 'vagrant' --ssh-password 'vagrant'

# Get a cookbook version
knife cookbook site show mysql | grep latest_version

# Berks -> Upload metadata dependency
berks install
berks update
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

# Kitchen
# Create machine
kitchen create
# List the machine
kitchen list
# Apply cookbook to the machine
kitchen converge