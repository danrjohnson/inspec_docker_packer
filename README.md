inspec_docker_packer
---------------------

Build and testing patten for Packer images via reusable container.

This is designed to be run against cloud providers such as AWS.

## Why

Running this in an isolated environment enables this pattern to be deployed anywhere Docker is installed.  This should be easily deployable to any CI/CD pipeline.

## Pattern

For a full example, see the example project in `example/`.

Projects that use this pattern should have two main components:
1. An inspec profile that defines the test suites to run against the ami
2. Packer configuration for how to build and provision the AMI

For information about inspec profiles, check out the [official documentation](https://www.inspec.io/docs/reference/profiles/)

For information about the inspec provisioner in Packer, check out the [official documentation](https://www.packer.io/docs/provisioners/inspec.html)

## Testing the Docker image

To run the tests for the Docker image:
```
make test
```

## Limitations

Because this runs in a container, the `vagrant` provisioner probably won't work without signficant effort.
