Shell script to download, compile, and package ruby.

The build_ruby.sh script should be run on an ubuntu 12.04 or 14.04 vm. Or, build the docker image and run it.

#Docker#
Build the Dockerfile and then run it like this:
```
docker build -t ruby_packager:1.0 .
mkdir /tmp/ruby
docker run --rm -v /tmp/ruby:/tmp/stg -e RUBY_VER=2.3.1 -e ITERATOR=2 -e PKG_NAME=my_ruby -e MAINTAINER=you@yourdomain.com ruby_packager:1.0
```

When the compile and packaging complete you'll have a shiny new debian package in /tmp/ruby.

##Note on Ubuntu 12 vs 14, etc##
Because GCC and libs change between 12 and 14, you'll need to tweak the Dockerfile to use the Ubuntu:12.04 base image if you want to make a ruby package that's compatible with Ubuntu 12.04. By default it produces a package for Ubuntu 14.04.



