test:
	docker build -t packer_inspec_testing:latest .
	docker run -it -v $(shell pwd)/inspec_tests:/inspec packer_inspec_testing:latest inspec exec --chef-license=accept /inspec/
