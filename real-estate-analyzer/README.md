## Getting Started

In order to get started with developing in this project, follow these steps:

1. Install [asdf](https://asdf-vm.com/) (optional, but highly recommended)
2. Run asdf install in the root of the project to installthe correct versions of maven and java:
    ```bash
    asdf install # installs maven and java
    ```
3. Compile the project:
    ```
    mvn clean install
    ```
4. Edit your rules in `rules.drl` and test

Note: Everytime you edit `rules.drl` you have to rebuild the project with `mvn clean install`
