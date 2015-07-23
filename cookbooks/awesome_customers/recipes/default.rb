# Our default recipe

# Update apt
include_recipe 'apt::default'

# User recipe
include_recipe 'awesome_customers::user'

# Firewall
include_recipe 'firewall::default'

# Web server
include_recipe 'awesome_customers::webserver'

# Mysql
include_recipe 'awesome_customers::database'