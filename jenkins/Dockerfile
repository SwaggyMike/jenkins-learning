FROM jenkins/jenkins:lts

# Disable Jenkins setup wizard
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false"

# Install necessary plugins
RUN jenkins-plugin-cli --plugins \
    credentials-binding \
    timestamper \
    workflow-aggregator \
    pipeline-stage-view \
    git \
    matrix-auth \
    job-dsl \
    cloudbees-folder \
    github-branch-source \
    pipeline-github-lib \
    email-ext \
    configuration-as-code

# Add JCasC configuration file
COPY jenkins.yaml /var/jenkins_home/casc_configs/jenkins.yaml

# Copy parameterized job configuration file as job.yaml
COPY job.yaml /var/jenkins_home/casc_configs/job.yaml

# Set JCasC configuration path
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc_configs/jenkins.yaml

