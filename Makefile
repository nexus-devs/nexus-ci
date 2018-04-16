all:

images:
	cd docker/nginx; make image
	cd docker/nginx-ci; make image
