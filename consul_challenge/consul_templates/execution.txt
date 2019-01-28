root@ubnt_vm01:~#
root@ubnt_vm01:~# pwd
/root
root@ubnt_vm01:~# consul-template -template "/home/jason/domains.tpl:/root/domains" -once
root@ubnt_vm01:~# consul-template -template "/home/jason/whitelist.tpl:/root/whitelist" -once
root@ubnt_vm01:~# ls
domains  whitelist
root@ubnt_vm01:~# cat domains

#domain1 app01-vm-prd.mt.local
#domain2 app02-vm-prd.mt.local
root@ubnt_vm01:~#
root@ubnt_vm01:~# cat whitelist


#app01-vm-prd.mt.local:
  - whitelist:
     - permit 10.0.0.1;
     - permit 10.0.1.1;
     - permit 10.0.2.1;



#app02-vm-prd.mt.local:
  - whitelist:
     - permit 192.168.0.1;
     - permit 192.168.1.1;
     - permit 192.168.2.1;


root@ubnt_vm01:~# exit
logout
