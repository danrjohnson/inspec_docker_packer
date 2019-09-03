example
-------

This is a naive example of using the inspec_docker_packer container to build and test AMIs.

This sets up a very simple AMI with just nginx installed and runs minimal tests to ensure functionality.

## Building the example image

You'll need to do a couple of things before you can run this example.

1. Create an AWS IAM account with appropriate permissions.  Consult the [packer documentation](https://www.packer.io/docs/builders/amazon.html#static-credentials) for how to do this.  This example assumes using static credentials.  This example assumes you created an account named `packerbuilder`.
2. Create an AWS ssh keypair.  This example assumes you created a keypair named `packerbuilder` and that you put the generated SSH private key in `~/.ssh/packerbuilder.pem`
3. Setup your VPC such that you can create images with public IP address. If have a VPN link and can route traffic to the subnets you choose to build the AMI in, you can just remove the `associate_public_ip_address` block from `packer/example.json`.  At a minimum, you'll need a `subnet_id` that you'll build the image in and a `security_group_id` that allows for SSH access.

To fully build and test, run the following:
```
docker run -v $HOME/.ssh/packerbuilder.pem:/root/packerbuilder  -v $(pwd)/inspec_tests:/inspec -v $(pwd)/packer:/packer packer_inspec_testing:latest packer build -var "aws_access_key=$AWS_ACCESS_KEY" -var "aws_secret_key=$AWS_SECRET_KEY" -var "subnet_id=$SUBNET_ID" -var "security_group_id=$SG_ID" /packer/example.json
```

This should produce output like the following that validates tests were successfully run
```
    amazon-ebs: Profile: tests for the example project in inspec_docker_packer (example tests)
    amazon-ebs: Version: 1.0.0
    amazon-ebs: Target:  ssh://root@127.0.0.1:33915
    amazon-ebs:
    amazon-ebs:   ✔  nginx: System Package nginx
    amazon-ebs:      ✔  System Package nginx should be installed
    amazon-ebs:      ✔  Service nginx should be running
    amazon-ebs:      ✔  Service nginx should be enabled
    amazon-ebs:      ✔  HTTP GET on http://localhost/ status should cmp == 200
    amazon-ebs:
    amazon-ebs:
    amazon-ebs: Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
    amazon-ebs: Test Summary: 4 successful, 0 failures, 0 skipped
```
