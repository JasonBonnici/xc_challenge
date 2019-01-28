Challenge has been accomplished using the following tools;

- Packer
- Ansible
- Vagrant
- VirtualBox 
- Bash

-----

Once a box has been created, this can be imported to any other VirtualBox as follows;

$ vagrant box add JB-Challenge VirtualBox-JB-Challenge.box
$ vagrant init JB-Challenge
$ vagrant up

You'll be able to login to the new box using the following credentials:

Username: vagrant
Password: vagrant
Root Password: Password1

-----

One should be able to curl to the TCP\80 using the following domains as soon as the box is running;

- http://app01-vm-prd.mt.local
- http://app01-vm-prd.mt.local


Notes: 
 * Domain names are stored as variables within 'ansible/main.yml'. These can be changed before build process as required. 
 * Some additional networking changes (template is closed within a NAT as soon as it online) and hosts file / DNS changes might be required in order to be able to reach the above domains.  

-----

The Following is the audit log of the box building process.

[jason@fvm01-finlab-local project]$ packer build packer.json
virtualbox-iso output will be in this color.

==> virtualbox-iso: Retrieving Guest additions
    virtualbox-iso: Using file in-place: file:///usr/share/virtualbox/VBoxGuestAdditions.iso
==> virtualbox-iso: Retrieving ISO
    virtualbox-iso: Found already downloaded, initial checksum matched, no download needed: http://centos.mirror.garr.it/centos/6.10/isos/x86_64/CentOS-6.10-x86_64-minimal.iso
==> virtualbox-iso: Starting HTTP server on port 8392
==> virtualbox-iso: Creating virtual machine...
==> virtualbox-iso: Creating hard drive...
==> virtualbox-iso: Creating forwarded port mapping for communicator (SSH, WinRM, etc) (host port 3815)
==> virtualbox-iso: Executing custom VBoxManage commands...
    virtualbox-iso: Executing: modifyvm JB-Challenge --memory 512
    virtualbox-iso: Executing: modifyvm JB-Challenge --cpus 2
==> virtualbox-iso: Starting the virtual machine...
    virtualbox-iso: The VM will be run headless, without a GUI. If you want to
    virtualbox-iso: view the screen of the VM, connect via VRDP without a password to
    virtualbox-iso: rdp://127.0.0.1:5922
==> virtualbox-iso: Waiting 10s for boot...
==> virtualbox-iso: Typing the boot command...
==> virtualbox-iso: Using ssh communicator to connect: 127.0.0.1
==> virtualbox-iso: Waiting for SSH to become available...
==> virtualbox-iso: Connected to SSH!
==> virtualbox-iso: Uploading VirtualBox version info (6.0.2)
==> virtualbox-iso: Uploading VirtualBox guest additions ISO...
==> virtualbox-iso: Provisioning with shell script: scripts/ansible.sh
    virtualbox-iso: warning: /var/tmp/rpm-tmp.R5OzJD: Header V3 RSA/SHA256 Signature, key ID 0608b895: NOKEY
    virtualbox-iso: Retrieving http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
    virtualbox-iso: Preparing...                ##################################################
    virtualbox-iso: epel-release                ##################################################
    virtualbox-iso: Loaded plugins: fastestmirror
    virtualbox-iso: Setting up Install Process
    virtualbox-iso: Resolving Dependencies
    virtualbox-iso: --> Running transaction check
    virtualbox-iso: ---> Package ansible.noarch 0:2.6.8-1.el6 will be installed
    virtualbox-iso: --> Processing Dependency: PyYAML for package: ansible-2.6.8-1.el6.noarch
    virtualbox-iso: --> Processing Dependency: python-crypto for package: ansible-2.6.8-1.el6.noarch
    virtualbox-iso: --> Processing Dependency: python-crypto2.6 for package: ansible-2.6.8-1.el6.noarch
    virtualbox-iso: --> Processing Dependency: python-httplib2 for package: ansible-2.6.8-1.el6.noarch
    virtualbox-iso: --> Processing Dependency: python-jinja2-26 for package: ansible-2.6.8-1.el6.noarch
    virtualbox-iso: --> Processing Dependency: python-keyczar for package: ansible-2.6.8-1.el6.noarch
    virtualbox-iso: --> Processing Dependency: python-paramiko for package: ansible-2.6.8-1.el6.noarch
    virtualbox-iso: --> Processing Dependency: python-setuptools for package: ansible-2.6.8-1.el6.noarch
    virtualbox-iso: --> Processing Dependency: python-simplejson for package: ansible-2.6.8-1.el6.noarch
    virtualbox-iso: --> Processing Dependency: python-six for package: ansible-2.6.8-1.el6.noarch
    virtualbox-iso: --> Processing Dependency: sshpass for package: ansible-2.6.8-1.el6.noarch
    virtualbox-iso: --> Running transaction check
    virtualbox-iso: ---> Package PyYAML.x86_64 0:3.10-3.1.el6 will be installed
    virtualbox-iso: --> Processing Dependency: libyaml-0.so.2()(64bit) for package: PyYAML-3.10-3.1.el6.x86_64
    virtualbox-iso: ---> Package python-crypto.x86_64 0:2.0.1-22.el6 will be installed
    virtualbox-iso: ---> Package python-crypto2.6.x86_64 0:2.6.1-2.el6 will be installed
    virtualbox-iso: ---> Package python-httplib2.noarch 0:0.7.7-1.el6 will be installed
    virtualbox-iso: ---> Package python-jinja2-26.noarch 0:2.6-3.el6 will be installed
    virtualbox-iso: --> Processing Dependency: python-babel >= 0.8 for package: python-jinja2-26-2.6-3.el6.noarch
    virtualbox-iso: --> Processing Dependency: python-markupsafe for package: python-jinja2-26-2.6-3.el6.noarch
    virtualbox-iso: ---> Package python-keyczar.noarch 0:0.71c-1.el6 will be installed
    virtualbox-iso: --> Processing Dependency: python-pyasn1 for package: python-keyczar-0.71c-1.el6.noarch
    virtualbox-iso: ---> Package python-paramiko.noarch 0:1.7.5-5.el6_10 will be installed
    virtualbox-iso: ---> Package python-setuptools.noarch 0:0.6.10-4.el6_9 will be installed
    virtualbox-iso: ---> Package python-simplejson.x86_64 0:2.0.9-3.1.el6 will be installed
    virtualbox-iso: ---> Package python-six.noarch 0:1.9.0-2.el6 will be installed
    virtualbox-iso: ---> Package sshpass.x86_64 0:1.06-1.el6 will be installed
    virtualbox-iso: --> Running transaction check
    virtualbox-iso: ---> Package libyaml.x86_64 0:0.1.3-4.el6_6 will be installed
    virtualbox-iso: ---> Package python-babel.noarch 0:0.9.4-5.1.el6 will be installed
    virtualbox-iso: ---> Package python-markupsafe.x86_64 0:0.9.2-4.el6 will be installed
    virtualbox-iso: ---> Package python-pyasn1.noarch 0:0.0.12a-1.el6 will be installed
    virtualbox-iso: --> Finished Dependency Resolution
    virtualbox-iso:
    virtualbox-iso: Dependencies Resolved
    virtualbox-iso:
    virtualbox-iso: ================================================================================
    virtualbox-iso:  Package                 Arch         Version               Repository     Size
    virtualbox-iso: ================================================================================
    virtualbox-iso: Installing:
    virtualbox-iso:  ansible                 noarch       2.6.8-1.el6           epel           10 M
    virtualbox-iso: Installing for dependencies:
    virtualbox-iso:  PyYAML                  x86_64       3.10-3.1.el6          base          157 k
    virtualbox-iso:  libyaml                 x86_64       0.1.3-4.el6_6         base           52 k
    virtualbox-iso:  python-babel            noarch       0.9.4-5.1.el6         base          1.4 M
    virtualbox-iso:  python-crypto           x86_64       2.0.1-22.el6          base          159 k
    virtualbox-iso:  python-crypto2.6        x86_64       2.6.1-2.el6           epel          513 k
    virtualbox-iso:  python-httplib2         noarch       0.7.7-1.el6           epel           70 k
    virtualbox-iso:  python-jinja2-26        noarch       2.6-3.el6             epel          527 k
    virtualbox-iso:  python-keyczar          noarch       0.71c-1.el6           epel          219 k
    virtualbox-iso:  python-markupsafe       x86_64       0.9.2-4.el6           base           22 k
    virtualbox-iso:  python-paramiko         noarch       1.7.5-5.el6_10        updates       729 k
    virtualbox-iso:  python-pyasn1           noarch       0.0.12a-1.el6         base           70 k
    virtualbox-iso:  python-setuptools       noarch       0.6.10-4.el6_9        base          336 k
    virtualbox-iso:  python-simplejson       x86_64       2.0.9-3.1.el6         base          126 k
    virtualbox-iso:  python-six              noarch       1.9.0-2.el6           base           28 k
    virtualbox-iso:  sshpass                 x86_64       1.06-1.el6            epel           20 k
    virtualbox-iso:
    virtualbox-iso: Transaction Summary
    virtualbox-iso: ================================================================================
    virtualbox-iso: Install      16 Package(s)
    virtualbox-iso:
    virtualbox-iso: Total download size: 15 M
    virtualbox-iso: Installed size: 74 M
    virtualbox-iso: Downloading Packages:
    virtualbox-iso: --------------------------------------------------------------------------------
    virtualbox-iso: Total                                           1.7 MB/s |  15 MB     00:08
    virtualbox-iso: warning: rpmts_HdrFromFdno: Header V3 RSA/SHA1 Signature, key ID c105b9de: NOKEY
    virtualbox-iso: Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
    virtualbox-iso: Importing GPG key 0xC105B9DE:
    virtualbox-iso:  Userid : CentOS-6 Key (CentOS 6 Official Signing Key) <centos-6-key@centos.org>
    virtualbox-iso:  Package: centos-release-6-10.el6.centos.12.3.x86_64 (@anaconda-CentOS-201806291108.x86_64/6.10)
    virtualbox-iso:  From   : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
    virtualbox-iso: warning: rpmts_HdrFromFdno: Header V3 RSA/SHA256 Signature, key ID 0608b895: NOKEY
    virtualbox-iso: Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
    virtualbox-iso: Importing GPG key 0x0608B895:
    virtualbox-iso:  Userid : EPEL (6) <epel@fedoraproject.org>
    virtualbox-iso:  Package: epel-release-6-8.noarch (installed)
    virtualbox-iso:  From   : /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
    virtualbox-iso: Running rpm_check_debug
    virtualbox-iso: Running Transaction Test
    virtualbox-iso: Transaction Test Succeeded
    virtualbox-iso: Running Transaction
    virtualbox-iso: Warning: RPMDB altered outside of yum.
    virtualbox-iso:   Installing : python-crypto-2.0.1-22.el6.x86_64                           1/16
    virtualbox-iso:   Installing : python-paramiko-1.7.5-5.el6_10.noarch                       2/16
    virtualbox-iso:   Installing : python-markupsafe-0.9.2-4.el6.x86_64                        3/16
    virtualbox-iso:   Installing : python-pyasn1-0.0.12a-1.el6.noarch                          4/16
    virtualbox-iso:   Installing : python-keyczar-0.71c-1.el6.noarch                           5/16
    virtualbox-iso:   Installing : python-crypto2.6-2.6.1-2.el6.x86_64                         6/16
    virtualbox-iso:   Installing : python-six-1.9.0-2.el6.noarch                               7/16
    virtualbox-iso:   Installing : python-setuptools-0.6.10-4.el6_9.noarch                     8/16
    virtualbox-iso:   Installing : python-httplib2-0.7.7-1.el6.noarch                          9/16
    virtualbox-iso:   Installing : libyaml-0.1.3-4.el6_6.x86_64                               10/16
    virtualbox-iso:   Installing : PyYAML-3.10-3.1.el6.x86_64                                 11/16
    virtualbox-iso:   Installing : sshpass-1.06-1.el6.x86_64                                  12/16
    virtualbox-iso:   Installing : python-simplejson-2.0.9-3.1.el6.x86_64                     13/16
    virtualbox-iso:   Installing : python-babel-0.9.4-5.1.el6.noarch                          14/16
    virtualbox-iso:   Installing : python-jinja2-26-2.6-3.el6.noarch                          15/16
    virtualbox-iso:   Installing : ansible-2.6.8-1.el6.noarch                                 16/16
    virtualbox-iso:   Verifying  : PyYAML-3.10-3.1.el6.x86_64                                  1/16
    virtualbox-iso:   Verifying  : python-babel-0.9.4-5.1.el6.noarch                           2/16
    virtualbox-iso:   Verifying  : python-simplejson-2.0.9-3.1.el6.x86_64                      3/16
    virtualbox-iso:   Verifying  : sshpass-1.06-1.el6.x86_64                                   4/16
    virtualbox-iso:   Verifying  : python-keyczar-0.71c-1.el6.noarch                           5/16
    virtualbox-iso:   Verifying  : libyaml-0.1.3-4.el6_6.x86_64                                6/16
    virtualbox-iso:   Verifying  : python-httplib2-0.7.7-1.el6.noarch                          7/16
    virtualbox-iso:   Verifying  : python-paramiko-1.7.5-5.el6_10.noarch                       8/16
    virtualbox-iso:   Verifying  : python-setuptools-0.6.10-4.el6_9.noarch                     9/16
    virtualbox-iso:   Verifying  : python-six-1.9.0-2.el6.noarch                              10/16
    virtualbox-iso:   Verifying  : ansible-2.6.8-1.el6.noarch                                 11/16
    virtualbox-iso:   Verifying  : python-crypto-2.0.1-22.el6.x86_64                          12/16
    virtualbox-iso:   Verifying  : python-jinja2-26-2.6-3.el6.noarch                          13/16
    virtualbox-iso:   Verifying  : python-crypto2.6-2.6.1-2.el6.x86_64                        14/16
    virtualbox-iso:   Verifying  : python-pyasn1-0.0.12a-1.el6.noarch                         15/16
    virtualbox-iso:   Verifying  : python-markupsafe-0.9.2-4.el6.x86_64                       16/16
    virtualbox-iso:
    virtualbox-iso: Installed:
    virtualbox-iso:   ansible.noarch 0:2.6.8-1.el6
    virtualbox-iso:
    virtualbox-iso: Dependency Installed:
    virtualbox-iso:   PyYAML.x86_64 0:3.10-3.1.el6
    virtualbox-iso:   libyaml.x86_64 0:0.1.3-4.el6_6
    virtualbox-iso:   python-babel.noarch 0:0.9.4-5.1.el6
    virtualbox-iso:   python-crypto.x86_64 0:2.0.1-22.el6
    virtualbox-iso:   python-crypto2.6.x86_64 0:2.6.1-2.el6
    virtualbox-iso:   python-httplib2.noarch 0:0.7.7-1.el6
    virtualbox-iso:   python-jinja2-26.noarch 0:2.6-3.el6
    virtualbox-iso:   python-keyczar.noarch 0:0.71c-1.el6
    virtualbox-iso:   python-markupsafe.x86_64 0:0.9.2-4.el6
    virtualbox-iso:   python-paramiko.noarch 0:1.7.5-5.el6_10
    virtualbox-iso:   python-pyasn1.noarch 0:0.0.12a-1.el6
    virtualbox-iso:   python-setuptools.noarch 0:0.6.10-4.el6_9
    virtualbox-iso:   python-simplejson.x86_64 0:2.0.9-3.1.el6
    virtualbox-iso:   python-six.noarch 0:1.9.0-2.el6
    virtualbox-iso:   sshpass.x86_64 0:1.06-1.el6
    virtualbox-iso:
    virtualbox-iso: Complete!
==> virtualbox-iso: Provisioning with Ansible...
    virtualbox-iso: Creating Ansible staging directory...
    virtualbox-iso: Creating directory: /tmp/packer-provisioner-ansible-local/5c4ee53e-a424-d889-9780-6e85c86c6a62
    virtualbox-iso: Uploading main Playbook file...
    virtualbox-iso: Uploading inventory file...
    virtualbox-iso: Uploading role directories...
    virtualbox-iso: Creating directory: /tmp/packer-provisioner-ansible-local/5c4ee53e-a424-d889-9780-6e85c86c6a62/roles/geerlingguy.packer-rhel
    virtualbox-iso: Executing Ansible: cd /tmp/packer-provisioner-ansible-local/5c4ee53e-a424-d889-9780-6e85c86c6a62 && ANSIBLE_FORCE_COLOR=1 PYTHONUNBUFFERED=1 ansible-playbook /tmp/packer-provisioner-ansible-local/5c4ee53e-a424-d889-9780-6e85c86c6a62/main.yml --extra-vars "packer_build_name=virtualbox-iso packer_builder_type=virtualbox-iso packer_http_addr=10.0.2.2:8392"  -c local -i /tmp/packer-provisioner-ansible-local/5c4ee53e-a424-d889-9780-6e85c86c6a62/packer-provisioner-ansible-local507408397
    virtualbox-iso: [DEPRECATION WARNING]: Instead of sudo/sudo_user, use become/become_user and 
    virtualbox-iso: make sure become_method is 'sudo' (default). This feature will be removed in 
    virtualbox-iso: version 2.6. Deprecation warnings can be disabled by setting 
    virtualbox-iso: deprecation_warnings=False in ansible.cfg.
    virtualbox-iso:
    virtualbox-iso: PLAY [all] *********************************************************************
    virtualbox-iso:
    virtualbox-iso: TASK [Gathering Facts] *********************************************************
    virtualbox-iso: ok: [127.0.0.1]
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Get the current kernel release.] ***************
    virtualbox-iso: ok: [127.0.0.1]
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Ensure necessary packages are installed.] ******
    virtualbox-iso: changed: [127.0.0.1] => (item=[u'wget', u'perl', u'cpp', u'gcc', u'make', u'bzip2', u'nginx', u'kernel-headers', u'kernel-devel', u'kernel-devel-2.6.32-754.el6.x86_64', u'libselinux-python', u'cifs-utils'])
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Fix slow DNS (adapted from Bento).] ************
    virtualbox-iso: changed: [127.0.0.1]
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Restart network service (explicitly).] *********
    virtualbox-iso: changed: [127.0.0.1]
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Configure SSH daemon.] *************************
    virtualbox-iso: changed: [127.0.0.1] => (item={u'regexp': u'^UseDNS', u'line': u'UseDNS no'})
    virtualbox-iso: changed: [127.0.0.1] => (item={u'regexp': u'^GSSAPIAuthentication', u'line': u'GSSAPIAuthentication no'})
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Create a login user] ***************************
    virtualbox-iso: changed: [127.0.0.1]
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Configure Vagrant .ssh directory.] *************
    virtualbox-iso: changed: [127.0.0.1]
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Get Vagrant's public key.] *********************
    virtualbox-iso: changed: [127.0.0.1]
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Check if VirtualBox is running the guest VM.] ***
    virtualbox-iso: ok: [127.0.0.1]
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : include_tasks] *********************************
    virtualbox-iso: skipping: [127.0.0.1]
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Check if VMWare is running the guest VM.] ******
    virtualbox-iso: ok: [127.0.0.1]
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : include_tasks] *********************************
    virtualbox-iso: skipping: [127.0.0.1]
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Create root dir for app01-vm-prd.mt.local] *****
    virtualbox-iso: changed: [127.0.0.1]
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Create root dir for app02-vm-prd.mt.local] *****
    virtualbox-iso: changed: [127.0.0.1]
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Nginx app01-vm-prd.mt.local vhosts] ************
    virtualbox-iso: changed: [127.0.0.1]
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Nginx app01-vm-prd.mt.local populate index] ****
    virtualbox-iso: changed: [127.0.0.1]
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Nginx app02-vm-prd.mt.local vhosts] ************
    virtualbox-iso: changed: [127.0.0.1]
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Nginx app02-vm-prd.mt.local populate index] ****
    virtualbox-iso: changed: [127.0.0.1]
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Reload service nginx, in all cases] ************
    virtualbox-iso: changed: [127.0.0.1]
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Enable service nginx, and not touch the state] ***
    virtualbox-iso: changed: [127.0.0.1]
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Remove unneeded packages.] *********************
    virtualbox-iso: changed: [127.0.0.1] => (item=[u'cpp', u'kernel-devel', u'kernel-headers'])
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Clean up yum.] *********************************
    virtualbox-iso:  [WARNING]: Consider using the yum module rather than running yum.  If you need
    virtualbox-iso: changed: [127.0.0.1]
    virtualbox-iso: to use command because yum is insufficient you can add warn=False to this
    virtualbox-iso: command task or set command_warnings=False in ansible.cfg to get rid of this
    virtualbox-iso: message.
    virtualbox-iso: 
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Remove any remnants of VirtualBox ISOs.] *******
    virtualbox-iso: changed: [127.0.0.1]
    virtualbox-iso:  [WARNING]: Consider using the file module with state=absent rather than
    virtualbox-iso: running rm.  If you need to use command because file is insufficient you can
    virtualbox-iso: add warn=False to this command task or set command_warnings=False in
    virtualbox-iso: ansible.cfg to get rid of this message.
    virtualbox-iso: 
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Remove RedHat interface persistence (step 1).] ***
    virtualbox-iso: changed: [127.0.0.1]
    virtualbox-iso:
    virtualbox-iso: TASK [geerlingguy.packer-rhel : Remove RedHat interface persistence (step 2).] ***
    virtualbox-iso: changed: [127.0.0.1] => (item=^HWADDR)
    virtualbox-iso: changed: [127.0.0.1] => (item=^UUID)
    virtualbox-iso:
    virtualbox-iso: PLAY RECAP *********************************************************************
    virtualbox-iso: 127.0.0.1                  : ok=24   changed=20   unreachable=0    failed=0
    virtualbox-iso:
==> virtualbox-iso: Provisioning with shell script: scripts/cleanup.sh
    virtualbox-iso: dd: writing `/EMPTY': No space left on device
    virtualbox-iso: 3522+0 records in
    virtualbox-iso: 3521+0 records out
    virtualbox-iso: 3692662784 bytes (3.7 GB) copied, 23.6684 s, 156 MB/s
==> virtualbox-iso: Gracefully halting virtual machine...
==> virtualbox-iso: Preparing to export machine...
    virtualbox-iso: Deleting forwarded port mapping for the communicator (SSH, WinRM, etc) (host port 3815)
==> virtualbox-iso: Exporting virtual machine...
    virtualbox-iso: Executing: export JB-Challenge --output output-virtualbox-iso/JB-Challenge.ovf
==> virtualbox-iso: Deregistering and deleting VM...
==> virtualbox-iso: Running post-processor: vagrant
==> virtualbox-iso (vagrant): Creating Vagrant box for 'virtualbox' provider
    virtualbox-iso (vagrant): Copying from artifact: output-virtualbox-iso/JB-Challenge-disk001.vmdk
    virtualbox-iso (vagrant): Copying from artifact: output-virtualbox-iso/JB-Challenge.ovf
    virtualbox-iso (vagrant): Renaming the OVF to box.ovf...
    virtualbox-iso (vagrant): Compressing: JB-Challenge-disk001.vmdk
    virtualbox-iso (vagrant): Compressing: Vagrantfile
    virtualbox-iso (vagrant): Compressing: box.ovf
    virtualbox-iso (vagrant): Compressing: metadata.json
Build 'virtualbox-iso' finished.

==> Builds finished. The artifacts of successful builds are:
--> virtualbox-iso: 'virtualbox' provider box: builds/VirtualBox-JB-Challenge.box
[jason@fvm01-finlab-local project]$ 

----------------------------------------------------------------------------------------------------------------------
