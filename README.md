# xc_challenge

Hi, 

This is just a Private Project I've been assigned to accomplish as part of a challenge. 

Some parts of the code are not my own, yet I have modified as required but didn't change their name for recognition purposes.

----

***Challenge details***

## Task 1

Use VirtualBox or VMWare to create a Consul cluster with 2 nodes.

In Consul key/value store create a folder ‘domains’ with keys that have the values
‘app01-vm-prd.mt.local’ and ‘app02-vm-prd.mt.local’

Example:

	domains\domain1 = app01-vm-prd.mt.local
	domains\domain2 = app02-vm-prd.mt.local

Create another folder named ‘whitelist’ with subfolders ‘app01-vm-prd.mt.local’
and ‘app02-vm-prd.mt.local’ having a few keys with names and values of preference

Example:

	whitelist\app01-vm-prd.mt.local\whitelist-1 = 10.0.0.8
	whitelist\app01-vm-prd.mt.local\whitelist-2 = 10.1.8.3
	whitelist\app01-vm-prd.mt.local\whitelist-3 = 10.5.2.4
	whitelist\app02-vm-prd.mt.local\whitelist-1 = 192.168.20.9
	whitelist\app02-vm-prd.mt.local\whitelist-2 = 192.168.50.7
	whitelist\app02-vm-prd.mt.local\whitelist-3 = 192.168.20.5

Using Consul template generate a file ‘/root/domains’ for each domain

Example:
	#domain name
	#domain name

Using Consul template generate a file ‘/root/whitelist’

Example:

	#domain_name:
	 - whitelist:
	 - permit $IP ;
	 - permit $IP ;
	   ...
	   ...
	   ...


Where the variable $IP is the value which matches the corresponding key
Use both folders 'domains' and 'whitelist' - where 'domains' should provide list of domains
that will be used when querying 'whitelist' for the actual IP address. Also, create a Consul
template file.

## Deliverables:

	Consul template file
	Consul configs

----

## Task 2

Use any of the tools below to build a VirtualBox image which contains configuration of Nginx running with 2 virtual hosts.

Packer, Bash, Salt, Ansible.

The logs for each virtual hosts should be stored as follows;
	/var/log/nginx/$vhost_name_access.log and _error.log

The names of the domains app01-vm-prd.mt.local and app02-vm-prd.mt.local need
to be passed either from a script, during build or during provisioning – as long as these can be
changed before running the build.

----
