# AEM-Devbox
Vagrantfile and resources to make a development instance of AEM in Virtualbox

## Requirements

* `vagrant 1.8.1` or higher [Installig Vagrant](https://www.vagrantup.com/docs/installation/)
  
* `Ansible 2.0.1.0` or higher  [Installing Ansible](http://docs.ansible.com/ansible/intro_installation.html)

## Setup

1. Place your `aem-author-4502.jar` and `license.properties` inside `/aem_install_files/`

2. Content packs will be installed in alphabetical order inside `/aem_install_files/packages_to_install/`

3. Packages that require restart should be placed inside `/aem_install_files/packages_to_install/servicepacks/`

  Folder structure should look like this(The readme.md is already in the repo):
  ```
  ├── LICENSE
  ├── README.md
  ├── Vagrantfile
  ├── aem_install_files
  │   ├── aem-author-4502.jar
  │   ├── license.properties
  │   ├── packages_to_install
  │   │   ├── content
  │   │   │   ├── example-content-pack.zip
  │   │   └── servicepacks
  │   │       ├── README.md
  │   │       ├── acs-aem-commons-content-xxx.zip
  │   │       ├── aem-service-pkg-wrapper-xxx.zip
  │   └── readme.md
  ├── playbook.yml
  └── resources
  ```
  
2. `vagrant up` from project root (might take a while)

3. Navigate to `localhost:4502` to access AEM

  *You can now safely remove the `jar` and `license.properties` placed from step 2*

4. :question::question::question:

5. Profit :rocket:

## Options

Changing of JVM/AEM parameters can be done in `resources/aem.service` using an `Environment directive`. 

[Getting started with Fedora Unit files](https://fedoramagazine.org/systemd-getting-a-grip-on-units/)

Learn more about [systemctl](https://www.freedesktop.org/software/systemd/man/systemctl.html)

Starting and stopping of the AEM service from inside the VB can be done using `systemctl start aem` or `systemctl stop aem` (Don't forget to sudo)

## License

The MIT License (MIT)

Copyright (c) 2016 Jose Miguel Mendez

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
