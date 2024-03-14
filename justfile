# justfile docs here: https://just.systems/man/en/

program_name := `basename $(pwd)`

[private]
default:
	@just --list --unsorted 

# init vcpkg
init:
    git submodule add https://github.com/Microsoft/vcpkg.git
    git submodule update --init --recursive

# bootstraps vcpkg, installs deps
bootstrap:
	@vcpkg/bootstrap-vcpkg.sh
	@brew install --quiet autoconf-archive automake autoconf #for ICU

# reset the build directory
clean:
	rm -rf build && mkdir build

# configure the build
configure:
	@cmake -S . -B build -G Ninja

# build the project
build:
	@cmake --build build

# clean & configure
reconfigure: clean configure

# clean the ninja build files and rebuild
rebuild: build
	rm -f build/.ninja*

# build using docker
docker-build:
	docker build -t {{program_name}} .
