packer validate -var-file=variables.json centos76_to_78.json
packer build -var-file=variables.json centos76_to_78.json
