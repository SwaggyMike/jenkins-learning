# Jenkins Learning

This repository is a personal learning project aimed at understanding how to automate the deployment of a Jenkins container and set up parameterized jobs without using job DSL seeder jobs or SCM. The focus is on manually copying pipeline scripts into the Jenkins container and executing them by name, which is particularly useful for offline and/or air-gapped environments.

## Purpose

The primary goal of this project is to provide myself with a hands-on learning experience in:

- Deploying and configuring a Jenkins container.
- Setting up and running Jenkins pipeline jobs manually without relying on SCM or job DSL seeder jobs.
- Managing Jenkins in environments with limited or no internet access.

## Repository Structure

- **Jenkinsfiles**: Contains pipeline scripts that can be manually copied into the Jenkins container. These scripts are designed to run independently without the need for SCM integration.
- **Scripts**: Includes supporting scripts to help automate the deployment and configuration of the Jenkins container.
- **Configurations**: Holds example configuration files, such as environment variables and Jenkins settings, that are necessary for the Jenkins setup.

## Getting Started

1. **Clone the repository:**

    ```bash
    git clone https://github.com/SwaggyMike/jenkins-learning.git
    cd jenkins-learning
    ```

2. **Set up the Jenkins container:**

   - Use the provided scripts or manually deploy a Jenkins container. Ensure that the container is configured correctly and is running.

3. **Copy Pipeline Scripts:**

   - Manually copy the desired `Jenkinsfile` or pipeline script from this repository into the Jenkins container.
   - These scripts can be executed by name within Jenkins jobs, without requiring SCM or job DSL.

4. **Run and Test Pipelines:**

   - Configure Jenkins jobs to call the pipeline scripts by name. Adjust parameters as needed to fit your specific environment.

## Use Cases

- **Offline Jenkins Deployments:** Ideal for environments where internet access is limited or unavailable, allowing full control over Jenkins jobs without relying on external repositories.
- **Personal Learning:** This project serves as a practical resource for me to learn Jenkins pipeline scripting, container deployment, and manual job configuration.
- **Custom Jenkins Setups:** Provides the flexibility to set up Jenkins exactly as needed, without the constraints of automated seeder jobs or SCM.
