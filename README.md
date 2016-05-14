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
  
2. `vagrant up` from project root (might take a while)

3. Navigate to `192.168.99.43:4502` to access AEM

  *You can now safely remove the `jar` and `license.properties` placed from step 2*

4. :question: :question: :question:

5. Profit :rocket:

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
