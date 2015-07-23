# See https://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "jgrand"
client_key               "#{current_dir}/jgrand.pem"
validation_client_name   "orp-validator"
validation_key           "#{current_dir}/orp-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/orp"
cookbook_path            ["#{current_dir}/../cookbooks"]
