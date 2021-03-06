
Boxes
=====
OpenSimian uses the  Hashicorp  Packer utility to simplify the installation of osMonoDev.  We do our best to make sure that the Vagrant recipes we release are reliable, repeatable, and insure you can keep your configurations  up to date.

Currently we only provide images built for the VitualBox provider of Packer.   The list below should reflect a mostly current catalog of the Opensimian boxes used in our osMonoDev package.



### Ubuntu
#### [dz0/vivid32srv](https://atlas.hashicorp.com/dz0/boxes/vivid32srv)      

* VirtualBox Guest Additions 5.0.4
* mySQL (Ver 14.14 Distrib 5.6.25) (server / client) 
* Avahi (daemon / dnsconfd / discover / utils)
* nmap

| Ingredients   | URL                                                                                                                                                                                                                                                                                                                                                                                                             |
| ------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Ubuntu        | [ubuntu-15.04-server-1386.iso](http://releases.ubuntu.com/15.04/ubuntu-15.04-server-i386.iso) [SHA256SUM](http://releases.ubuntu.com/15.04/SHA256SUMS)                                                                                                                                                                                                                                                                                                                                                                           |
| VirtualBox     |                                                                                                                                                                                                                                                                                                                                                                                                                  
| MySQL          | [ubuntu-15.04-server-amd64_vmware.box](http://dev.mysql.com/downloads/file.php?id=458863) [SHA256SUM](https://s3.eu-central-1.amazonaws.com/ffuenf-vagrantboxes/ubuntu/ubuntu-15.04-server-amd64_vmware_SHA256SUM) [SHA512SUM](https://s3.eu-central-1.amazonaws.com/ffuenf-vagrantboxes/ubuntu/ubuntu-15.04-server-amd64_vmware_SHA512SUM)                 |

---

#### Ubuntu Utopic Unicorn 14.10 Server x86_64

* open-vm-tools 2:8.8.0+2012.05.21-724730-1+nmu2+deb7u1
* VirtualBox Guest Additions 5.0.0
* Chef 12.4.1-1
* Ruby 1.9.3.194-8.1ubuntu2.1
* Rubygems 2.4.8

| Provider      | URL                                                                                                                                                                                                                                                                                                                                                                                                             |
| ------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Atlas         | [ffuenf/ubuntu-14.10-server-amd64](https://atlas.hashicorp.com/ffuenf/ubuntu-14.10-server-amd64)                                                                                                                                                                                                                                                                                                                |
| Virtualbox    | [ubuntu-14.10-server-amd64_virtualbox.box](https://s3.eu-central-1.amazonaws.com/ffuenf-vagrantboxes/ubuntu/ubuntu-14.10-server-amd64_virtualbox.box) [SHA256SUM](https://s3.eu-central-1.amazonaws.com/ffuenf-vagrantboxes/ubuntu/ubuntu-14.10-server-amd64_virtualbox_SHA256SUM) [SHA512SUM](https://s3.eu-central-1.amazonaws.com/ffuenf-vagrantboxes/ubuntu/ubuntu-14.10-server-amd64_virtualbox_SHA512SUM) |
| VMWare Fusion | [ubuntu-14.10-server-amd64_vmware.box](https://s3.eu-central-1.amazonaws.com/ffuenf-vagrantboxes/ubuntu/ubuntu-14.10-server-amd64_vmware.box) [SHA256SUM](https://s3.eu-central-1.amazonaws.com/ffuenf-vagrantboxes/ubuntu/ubuntu-14.10-server-amd64_vmware_SHA256SUM) [SHA512SUM](https://s3.eu-central-1.amazonaws.com/ffuenf-vagrantboxes/ubuntu/ubuntu-14.10-server-amd64_vmware_SHA512SUM)                 |

---

#### Ubuntu Trusty Tahr 14.04.3 Server x86_64

* open-vm-tools 2:8.8.0+2012.05.21-724730-1+nmu2+deb7u1
* VirtualBox Guest Additions 5.0.0
* Chef 12.4.1-1
* Ruby 1.9.3.484-2
* Rubygems 2.4.8

| Provider      | URL                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Atlas         | [ffuenf/ubuntu-14.04.3-server-amd64](https://atlas.hashicorp.com/ffuenf/ubuntu-14.04.3-server-amd64)                                                                                                                                                                                                                                                                                                                    |
| Virtualbox    | [ubuntu-14.04.3-server-amd64_virtualbox.box](https://s3.eu-central-1.amazonaws.com/ffuenf-vagrantboxes/ubuntu/ubuntu-14.04.3-server-amd64_virtualbox.box) [SHA256SUM](https://s3.eu-central-1.amazonaws.com/ffuenf-vagrantboxes/ubuntu/ubuntu-14.04.3-server-amd64_virtualbox_SHA256SUM) [SHA512SUM](https://s3.eu-central-1.amazonaws.com/ffuenf-vagrantboxes/ubuntu/ubuntu-14.04.3-server-amd64_virtualbox_SHA512SUM) |
| VMWare Fusion | [ubuntu-14.04.3-server-amd64_vmware.box](https://s3.eu-central-1.amazonaws.com/ffuenf-vagrantboxes/ubuntu/ubuntu-14.04.3-server-amd64_vmware.box) [SHA256SUM](https://s3.eu-central-1.amazonaws.com/ffuenf-vagrantboxes/ubuntu/ubuntu-14.04.3-server-amd64_vmware_SHA256SUM) [SHA512SUM](https://s3.eu-central-1.amazonaws.com/ffuenf-vagrantboxes/ubuntu/ubuntu-14.04.3-server-amd64_vmware_SHA512SUM)                 |

---

### Debian
#### Debian Jessie 8.x


License and Author
------------------

- Author:: Achim Rosenhagen (<a.rosenhagen@ffuenf.de>)
- Copyright:: 2015, ffuenf

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
