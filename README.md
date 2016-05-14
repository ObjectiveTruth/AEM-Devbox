# AEM-Devbox
Vagrantfile and resources to make a development instance of AEM in Virtualbox

## Requirements

* `vagrant 1.8.1` or higher

  `vagrant --version`
  
* `Ansible 2.0.1.0` or higher 

  `ansible --version`

## Usage

1. Place your `aem-author-4502.jar` and `license.properties` inside `/aem_install_files/`

  Folder structure should look like this:
  ```
  ├── LICENSE
  ├── Vagrantfile
  ├── aem_install_files
  │   ├── aem-author-4502.jar
  │   ├── license.properties
  │   └── readme.md
  └── resources
  ```
  
  *can be removed after step 2*
  
2. `vagrant up` from project root (might take a while)

3. Navigate to `192.168.99.43:4502` to access AEM

4. :question: :question: :question:

5. Profit :rocket:
