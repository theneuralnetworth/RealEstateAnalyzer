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

### Loading the knowledge base

The knowledge base is composed of 2 files: `properties.json` and `locations.json`. The locations of these files needs to be specified in the following environment variables:

* `KNOWLEDGE_BASE_PROPERTIES_FILE`
* `KNOWLEDGE_BASE_LOCATIONS_FILE`
