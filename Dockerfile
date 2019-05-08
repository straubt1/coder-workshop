FROM codercom/code-server
ARG TERRAFORM_VERSION=0.11.13

RUN sudo apt-get install -y unzip python

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install Terraform
RUN wget --quiet https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && sudo mv terraform /usr/bin \
  && sudo rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

ENTRYPOINT ["dumb-init", "code-server"]
