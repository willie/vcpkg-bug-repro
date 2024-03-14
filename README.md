# vcpkg-bug-repro

Run both of these on an Mac with Apple Silicon.

## build for mac (works)
```
% ./vcpkg/bootstrap-vcpkg.sh
% cmake -S . -B build -G Ninja
% cmake --build build
```

## build for Linux arm64 (fails)
```
% docker build -t vcpkg-bug-repro .
```

# this is the error I get
```
% docker build -t vcpkg-bug-repro .
[+] Building 216.0s (12/15)                                                                 docker:orbstack
 => [internal] load build definition from Dockerfile                                                   0.0s
 => => transferring dockerfile: 1.24kB                                                                 0.0s
 => [internal] load metadata for docker.io/library/ubuntu:22.04                                        0.7s
 => [internal] load .dockerignore                                                                      0.0s
 => => transferring context: 2B                                                                        0.0s
 => CACHED [ 1/11] FROM docker.io/library/ubuntu:22.04@sha256:77906da86b60585ce12215807090eb327e7386c  0.0s
 => [internal] load build context                                                                      0.7s
 => => transferring context: 3.01MB                                                                    0.7s
 => [ 2/11] RUN apt-get -y update && apt-get install -y  build-essential  git  ninja-build  curl      35.5s
 => [ 3/11] RUN echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kit  5.2s 
 => [ 4/11] WORKDIR /example                                                                           0.0s 
 => [ 5/11] RUN apt-get -y update && apt-get install -y autoconf automake autoconf-archive             3.3s 
 => [ 6/11] RUN apt-get -y update && apt-get install -y zip unzip tar linux-libc-dev pkg-config pyth  71.0s 
 => [ 7/11] COPY vcpkg.json .                                                                          0.0s 
 => ERROR [ 8/11] RUN ./vcpkg/vcpkg install --debug --x-install-root="./build/vcpkg_installed/"      100.0s 
------                                                                                                      
 > [ 8/11] RUN ./vcpkg/vcpkg install --debug --x-install-root="./build/vcpkg_installed/":                   
0.071 [DEBUG] To include the environment variables in debug output, pass --debug-env                        
0.071 [DEBUG] Trying to load bundleconfig from /example/vcpkg/vcpkg-bundle.json                             
0.071 [DEBUG] Failed to open: /example/vcpkg/vcpkg-bundle.json                                              
0.071 [DEBUG] Bundle config: readonly=false, usegitregistry=false, embeddedsha=nullopt, deployment=Git, vsversion=nullopt
0.071 [DEBUG] Metrics enabled.
0.071 [DEBUG] Feature flag 'binarycaching' unset
0.071 [DEBUG] Feature flag 'compilertracking' unset
0.071 [DEBUG] Feature flag 'registries' unset
0.071 [DEBUG] Feature flag 'versions' unset
0.071 [DEBUG] Feature flag 'dependencygraph' unset
0.071 [DEBUG] Using scripts-root: /example/vcpkg/scripts
0.071 [DEBUG] Using builtin-ports: /example/vcpkg/ports
0.071 [DEBUG] Using installed-root: /example/build/vcpkg_installed/
0.071 [DEBUG] Using buildtrees-root: /example/vcpkg/buildtrees
0.071 [DEBUG] Using packages-root: /example/vcpkg/packages
0.071 [DEBUG] Using manifest-root: /example
0.072 [DEBUG] Using vcpkg-root: /example/vcpkg
0.072 [DEBUG] Using scripts-root: /example/vcpkg/scripts
0.072 [DEBUG] Using builtin-registry: /example/vcpkg/versions
0.072 [DEBUG] Using downloads-root: /example/vcpkg/downloads
0.073 [DEBUG] Found path: /usr/bin/git
0.073 [DEBUG] Found path: /bin/git
0.073 [DEBUG] 1000: execute_process(/usr/bin/git --git-dir=/example/vcpkg/.git --work-tree=/example/vcpkg/.git -c core.autocrlf=false show e38b936343030e167a207ee4eddc3c6086caec56:versions/baseline.json)
0.079 [DEBUG] 1000: cmd_execute_and_stream_data() returned 0 after     6446 us
0.098 [DEBUG] 1001: execute_process(GIT_INDEX_FILE=/example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41_7.index  /usr/bin/git --git-dir=/example/vcpkg/.git --work-tree=/example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41_7.tmp -c core.autocrlf=false read-tree -m -u ce86a5562b977fb3e02bd15d96d2de7c771aed41)
0.101 [DEBUG] 1001: cmd_execute_and_stream_data() returned 0 after     2610 us
0.101 [DEBUG] Loading dep info for: zlib:arm64-linux openssl:arm64-linux sqlite3:arm64-linux libuuid:arm64-linux liblzma:arm64-linux vcpkg-msbuild:arm64-linux libiconv:arm64-linux gettext:arm64-linux libffi:arm64-linux expat:arm64-linux bzip2:arm64-linux python3:arm64-linux
0.101 [DEBUG] Found path: /usr/bin/cmake
0.101 [DEBUG] Found path: /bin/cmake
0.101 [DEBUG] 1002: execute_process(/usr/bin/cmake -DVCPKG_ROOT_DIR=/example/vcpkg -DPACKAGES_DIR=/example/vcpkg/packages -DBUILDTREES_DIR=/example/vcpkg/buildtrees -D_VCPKG_INSTALLED_DIR=/example/build/vcpkg_installed/ -DDOWNLOADS=/example/vcpkg/downloads -DVCPKG_MANIFEST_INSTALL=OFF -P /example/vcpkg/buildtrees/0.vcpkg_dep_info.cmake)
0.106 [DEBUG] 1002: cmd_execute_and_stream_data() returned 0 after     4532 us
0.106 [DEBUG] 1003: execute_process(GIT_INDEX_FILE=/example/vcpkg/buildtrees/versioning_/versions/bzip2/92e9a8bbf1abbd89872b48ad82fcf75852de1006_7.index  /usr/bin/git --git-dir=/example/vcpkg/.git --work-tree=/example/vcpkg/buildtrees/versioning_/versions/bzip2/92e9a8bbf1abbd89872b48ad82fcf75852de1006_7.tmp -c core.autocrlf=false read-tree -m -u 92e9a8bbf1abbd89872b48ad82fcf75852de1006)
0.107 [DEBUG] 1003: cmd_execute_and_stream_data() returned 0 after     1381 us
0.107 [DEBUG] 1004: execute_process(GIT_INDEX_FILE=/example/vcpkg/buildtrees/versioning_/versions/expat/324f8ee85bcf8dc7f2c8969d3d0f2af4d78be9a2_7.index  /usr/bin/git --git-dir=/example/vcpkg/.git --work-tree=/example/vcpkg/buildtrees/versioning_/versions/expat/324f8ee85bcf8dc7f2c8969d3d0f2af4d78be9a2_7.tmp -c core.autocrlf=false read-tree -m -u 324f8ee85bcf8dc7f2c8969d3d0f2af4d78be9a2)
0.108 [DEBUG] 1004: cmd_execute_and_stream_data() returned 0 after     1117 us
0.109 [DEBUG] 1005: execute_process(GIT_INDEX_FILE=/example/vcpkg/buildtrees/versioning_/versions/libffi/0ad381012102db5da196161ba7fc0a03a4dcb982_7.index  /usr/bin/git --git-dir=/example/vcpkg/.git --work-tree=/example/vcpkg/buildtrees/versioning_/versions/libffi/0ad381012102db5da196161ba7fc0a03a4dcb982_7.tmp -c core.autocrlf=false read-tree -m -u 0ad381012102db5da196161ba7fc0a03a4dcb982)
0.110 [DEBUG] 1005: cmd_execute_and_stream_data() returned 0 after     1269 us
0.110 [DEBUG] 1006: execute_process(GIT_INDEX_FILE=/example/vcpkg/buildtrees/versioning_/versions/liblzma/f285b7c4ffa2cc065c7c6fec4b61006f7fa2714e_7.index  /usr/bin/git --git-dir=/example/vcpkg/.git --work-tree=/example/vcpkg/buildtrees/versioning_/versions/liblzma/f285b7c4ffa2cc065c7c6fec4b61006f7fa2714e_7.tmp -c core.autocrlf=false read-tree -m -u f285b7c4ffa2cc065c7c6fec4b61006f7fa2714e)
0.112 [DEBUG] 1006: cmd_execute_and_stream_data() returned 0 after     1440 us
0.112 [DEBUG] 1007: execute_process(GIT_INDEX_FILE=/example/vcpkg/buildtrees/versioning_/versions/libuuid/09be6774f518692bc418aa03623cc9dbc19e6516_7.index  /usr/bin/git --git-dir=/example/vcpkg/.git --work-tree=/example/vcpkg/buildtrees/versioning_/versions/libuuid/09be6774f518692bc418aa03623cc9dbc19e6516_7.tmp -c core.autocrlf=false read-tree -m -u 09be6774f518692bc418aa03623cc9dbc19e6516)
0.113 [DEBUG] 1007: cmd_execute_and_stream_data() returned 0 after     1093 us
0.113 [DEBUG] 1008: execute_process(GIT_INDEX_FILE=/example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d_7.index  /usr/bin/git --git-dir=/example/vcpkg/.git --work-tree=/example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d_7.tmp -c core.autocrlf=false read-tree -m -u 53fb72a19981a3439cd569f58b722ca6cd26e23d)
0.115 [DEBUG] 1008: cmd_execute_and_stream_data() returned 0 after     1823 us
0.115 [DEBUG] 1009: execute_process(GIT_INDEX_FILE=/example/vcpkg/buildtrees/versioning_/versions/sqlite3/4e2ae6bc4849b52c6cd2e2d51c110f69ac3901d0_7.index  /usr/bin/git --git-dir=/example/vcpkg/.git --work-tree=/example/vcpkg/buildtrees/versioning_/versions/sqlite3/4e2ae6bc4849b52c6cd2e2d51c110f69ac3901d0_7.tmp -c core.autocrlf=false read-tree -m -u 4e2ae6bc4849b52c6cd2e2d51c110f69ac3901d0)
0.117 [DEBUG] 1009: cmd_execute_and_stream_data() returned 0 after     1436 us
0.117 [DEBUG] 1010: execute_process(GIT_INDEX_FILE=/example/vcpkg/buildtrees/versioning_/versions/zlib/3f05e04b9aededb96786a911a16193cdb711f0c9_7.index  /usr/bin/git --git-dir=/example/vcpkg/.git --work-tree=/example/vcpkg/buildtrees/versioning_/versions/zlib/3f05e04b9aededb96786a911a16193cdb711f0c9_7.tmp -c core.autocrlf=false read-tree -m -u 3f05e04b9aededb96786a911a16193cdb711f0c9)
0.118 [DEBUG] 1010: cmd_execute_and_stream_data() returned 0 after     1268 us
0.118 [DEBUG] 1011: execute_process(GIT_INDEX_FILE=/example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake/88a7058fc7fa73a9c4c99cfcae9d79e2abf87a5a_7.index  /usr/bin/git --git-dir=/example/vcpkg/.git --work-tree=/example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake/88a7058fc7fa73a9c4c99cfcae9d79e2abf87a5a_7.tmp -c core.autocrlf=false read-tree -m -u 88a7058fc7fa73a9c4c99cfcae9d79e2abf87a5a)
0.120 [DEBUG] 1011: cmd_execute_and_stream_data() returned 0 after     1356 us
0.120 [DEBUG] 1012: execute_process(GIT_INDEX_FILE=/example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake-config/8d54cc4f487d51b655abec5f9c9c3f86ca83311f_7.index  /usr/bin/git --git-dir=/example/vcpkg/.git --work-tree=/example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake-config/8d54cc4f487d51b655abec5f9c9c3f86ca83311f_7.tmp -c core.autocrlf=false read-tree -m -u 8d54cc4f487d51b655abec5f9c9c3f86ca83311f)
0.121 [DEBUG] 1012: cmd_execute_and_stream_data() returned 0 after     1248 us
0.121 [DEBUG] 1013: execute_process(GIT_INDEX_FILE=/example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake-get-vars/725c841810ceb8de33da68ea879eb8f0b4d6c94c_7.index  /usr/bin/git --git-dir=/example/vcpkg/.git --work-tree=/example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake-get-vars/725c841810ceb8de33da68ea879eb8f0b4d6c94c_7.tmp -c core.autocrlf=false read-tree -m -u 725c841810ceb8de33da68ea879eb8f0b4d6c94c)
0.123 [DEBUG] 1013: cmd_execute_and_stream_data() returned 0 after     1236 us
0.123 [DEBUG] Loading dep info for: vcpkg-cmake:arm64-linux
0.123 [DEBUG] 1014: execute_process(/usr/bin/cmake -DVCPKG_ROOT_DIR=/example/vcpkg -DPACKAGES_DIR=/example/vcpkg/packages -DBUILDTREES_DIR=/example/vcpkg/buildtrees -D_VCPKG_INSTALLED_DIR=/example/build/vcpkg_installed/ -DDOWNLOADS=/example/vcpkg/downloads -DVCPKG_MANIFEST_INSTALL=OFF -P /example/vcpkg/buildtrees/1.vcpkg_dep_info.cmake)
0.125 [DEBUG] 1014: cmd_execute_and_stream_data() returned 0 after     2119 us
0.125 [DEBUG] Loading dep info for: vcpkg-cmake-config:arm64-linux
0.125 [DEBUG] 1015: execute_process(/usr/bin/cmake -DVCPKG_ROOT_DIR=/example/vcpkg -DPACKAGES_DIR=/example/vcpkg/packages -DBUILDTREES_DIR=/example/vcpkg/buildtrees -D_VCPKG_INSTALLED_DIR=/example/build/vcpkg_installed/ -DDOWNLOADS=/example/vcpkg/downloads -DVCPKG_MANIFEST_INSTALL=OFF -P /example/vcpkg/buildtrees/2.vcpkg_dep_info.cmake)
0.127 [DEBUG] 1015: cmd_execute_and_stream_data() returned 0 after     1912 us
0.127 [DEBUG] Loading dep info for: vcpkg-cmake-get-vars:arm64-linux
0.127 [DEBUG] 1016: execute_process(/usr/bin/cmake -DVCPKG_ROOT_DIR=/example/vcpkg -DPACKAGES_DIR=/example/vcpkg/packages -DBUILDTREES_DIR=/example/vcpkg/buildtrees -D_VCPKG_INSTALLED_DIR=/example/build/vcpkg_installed/ -DDOWNLOADS=/example/vcpkg/downloads -DVCPKG_MANIFEST_INSTALL=OFF -P /example/vcpkg/buildtrees/3.vcpkg_dep_info.cmake)
0.129 [DEBUG] 1016: cmd_execute_and_stream_data() returned 0 after     1936 us
0.129 [DEBUG] 1017: execute_process(/usr/bin/cmake -DVCPKG_ROOT_DIR=/example/vcpkg -DPACKAGES_DIR=/example/vcpkg/packages -DBUILDTREES_DIR=/example/vcpkg/buildtrees -D_VCPKG_INSTALLED_DIR=/example/build/vcpkg_installed/ -DDOWNLOADS=/example/vcpkg/downloads -DVCPKG_MANIFEST_INSTALL=OFF -P /example/vcpkg/buildtrees/0.vcpkg_tags.cmake)
0.132 [DEBUG] 1017: cmd_execute_and_stream_data() returned 0 after     2690 us
0.132 [DEBUG] Trying to hash /example/vcpkg/scripts/toolchains/linux.cmake
0.132 [DEBUG] /example/vcpkg/scripts/toolchains/linux.cmake has hash 6a6f507940899e930a3464a83b1bca17ae1e41eb4cbad2f515d97b95b5508de0
0.132 [DEBUG] Trying to hash /example/vcpkg/triplets/community/arm64-linux.cmake
0.132 [DEBUG] /example/vcpkg/triplets/community/arm64-linux.cmake has hash d527954d09db3c078a2fd5dfa6c2f819966e0712b5d736aa53cacc0904618636
0.132 Detecting compiler hash for triplet arm64-linux...
0.132 [DEBUG] 1018: execute_process( /usr/bin/cmake -DCURRENT_PORT_DIR=/example/vcpkg/scripts/detect_compiler -DCURRENT_BUILDTREES_DIR=/example/vcpkg/buildtrees/detect_compiler -DCURRENT_PACKAGES_DIR=/example/vcpkg/packages/detect_compiler_arm64-linux -D_HOST_TRIPLET=arm64-linux -DCMD=BUILD -DDOWNLOADS=/example/vcpkg/downloads -DTARGET_TRIPLET=arm64-linux -DTARGET_TRIPLET_FILE=/example/vcpkg/triplets/community/arm64-linux.cmake -DVCPKG_BASE_VERSION=2999-12-31 -DVCPKG_CONCURRENCY=9 -DVCPKG_PLATFORM_TOOLSET=external -DGIT=/usr/bin/git -DVCPKG_ROOT_DIR=/example/vcpkg -DPACKAGES_DIR=/example/vcpkg/packages -DBUILDTREES_DIR=/example/vcpkg/buildtrees -D_VCPKG_INSTALLED_DIR=/example/build/vcpkg_installed/ -DDOWNLOADS=/example/vcpkg/downloads -DVCPKG_MANIFEST_INSTALL=OFF -P /example/vcpkg/scripts/ports.cmake)
0.142 [DEBUG] -- Configuring arm64-linux-rel
0.338 [DEBUG] -- Cross compiling arm64 on host aarch64, use cross compiler: aarch64-linux-gnu-g++/aarch64-linux-gnu-gcc
0.338 [DEBUG] -- The C compiler identification is GNU 11.4.0
0.338 [DEBUG] -- Detecting C compiler ABI info
0.338 [DEBUG] -- Detecting C compiler ABI info - done
0.338 [DEBUG] -- Check for working C compiler: /usr/bin/aarch64-linux-gnu-gcc - skipped
0.338 [DEBUG] -- Detecting C compile features
0.338 [DEBUG] -- Detecting C compile features - done
0.338 [DEBUG] -- The CXX compiler identification is GNU 11.4.0
0.338 [DEBUG] -- Detecting CXX compiler ABI info
0.338 [DEBUG] -- Detecting CXX compiler ABI info - done
0.338 [DEBUG] -- Check for working CXX compiler: /usr/bin/aarch64-linux-gnu-g++ - skipped
0.338 [DEBUG] -- Detecting CXX compile features
0.338 [DEBUG] -- Detecting CXX compile features - done
0.338 [DEBUG] -- Configuring done (0.2s)
0.338 [DEBUG] -- Generating done (0.0s)
0.338 [DEBUG] -- Build files have been written to: /example/vcpkg/buildtrees/detect_compiler/arm64-linux-rel
0.338 [DEBUG] 
0.338 [DEBUG] #COMPILER_HASH#1d43c82f51082f8427993d1dac28c7cb4e3749af
0.338 [DEBUG] #COMPILER_C_HASH#402eb561dcf112614cd6f8af38cdd719afcdd209
0.338 [DEBUG] #COMPILER_C_VERSION#11.4.0
0.338 [DEBUG] #COMPILER_C_ID#GNU
0.338 [DEBUG] #COMPILER_C_PATH#/usr/bin/aarch64-linux-gnu-gcc
0.338 [DEBUG] #COMPILER_CXX_HASH#9e33a1f8cdcbc29baf8597af0f59e7af14cf7b05
0.338 [DEBUG] #COMPILER_CXX_VERSION#11.4.0
0.338 [DEBUG] #COMPILER_CXX_ID#GNU
0.338 [DEBUG] #COMPILER_CXX_PATH#/usr/bin/aarch64-linux-gnu-g++
0.338 [DEBUG] CMake Warning:
0.338 [DEBUG]   Manually-specified variables were not used by the project:
0.338 [DEBUG] 
0.338 [DEBUG]     BUILD_SHARED_LIBS
0.339 [DEBUG]     CMAKE_INSTALL_BINDIR
0.339 [DEBUG]     CMAKE_INSTALL_LIBDIR
0.339 [DEBUG]     VCPKG_PLATFORM_TOOLSET
0.339 [DEBUG]     VCPKG_SET_CHARSET_FLAG
0.339 [DEBUG]     _VCPKG_ROOT_DIR
0.339 [DEBUG] 
0.339 [DEBUG] 
0.339 [DEBUG] 
0.339 [DEBUG] 1018: cmd_execute_and_stream_data() returned 0 after   206382 us
0.339 [DEBUG] Detected compiler hash for triplet arm64-linux: 1d43c82f51082f8427993d1dac28c7cb4e3749af
0.339 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake/88a7058fc7fa73a9c4c99cfcae9d79e2abf87a5a/vcpkg.json
0.339 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake/88a7058fc7fa73a9c4c99cfcae9d79e2abf87a5a/vcpkg.json has hash da35a89dcecb2b886316def78e6ed63ad1d5618e007a00bf00e318775499321d
0.339 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/compile_wrapper_consider_clang-cl.patch
0.339 [DEBUG] /example/vcpkg/scripts/cmake/compile_wrapper_consider_clang-cl.patch has hash 12dbcf92febc9400d782a3d7d073acee4b09a1417ce7d4d5e9be7c55aa177d36
0.339 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/execute_process.cmake
0.339 [DEBUG] /example/vcpkg/scripts/cmake/execute_process.cmake has hash 66a937b9c074422643135c319d1abadaa45484a664f1b160d4c163efb444a446
0.339 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_acquire_msys.cmake
0.340 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_acquire_msys.cmake has hash 5e0ce6582722fe72b99e80e22270778e88002b40bc43dfecf8b7936bb0790461
0.340 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_add_to_path.cmake
0.340 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_add_to_path.cmake has hash 5f5ae75cf37b2a58d1a8561ca96496b64cd91ec9a0afab0b976c3e5d59030bfe
0.340 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_apply_patches.cmake
0.340 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_apply_patches.cmake has hash 4c123ce6f9bf0c46adc8287b7bd6a40b5f5e8daa83623dd21bb8c568ad4421fc
0.340 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_backup_restore_env_vars.cmake
0.340 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_backup_restore_env_vars.cmake has hash 5621f3b6a9586ffc02d49a5032560a48ad291de1cce553b904588f0108648904
0.340 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_build_cmake.cmake
0.340 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_build_cmake.cmake has hash 5201d6149d85fff414f3fbbdc4c793e0b2aeeb6d249a5ae8cf15e39fef66b7e6
0.340 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_build_make.cmake
0.340 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_build_make.cmake has hash 427db21450afac6dc12c4ee8dbe2f93b64e9f474acb6e99511443874f1dab514
0.340 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_build_msbuild.cmake
0.340 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_build_msbuild.cmake has hash 9a8367ac19733fc51b8e7edc77968725d2efe1400aaf1fdd767bb329a7b04532
0.340 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_build_ninja.cmake
0.340 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_build_ninja.cmake has hash 9bafdd942fe41be20a868e0a41ea6f983895bacba2f257921b53d789c7ad8092
0.340 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_build_nmake.cmake
0.340 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_build_nmake.cmake has hash 918422e54a328b9dce1be8c06916d612de9cc24a18c65cc47f26d78e8c487440
0.340 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_build_qmake.cmake
0.340 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_build_qmake.cmake has hash cd00146eb665b004c527cf74986e392d2419610ace073bd6abb79d55a7912004
0.340 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_buildpath_length_warning.cmake
0.340 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_buildpath_length_warning.cmake has hash fa440f3734e34b462ef96f3e89f0a9c5a11b609110a15a162d24da9218693fd1
0.340 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_check_features.cmake
0.340 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_check_features.cmake has hash 943b217e0968d64cf2cb9c272608e6a0b497377e792034f819809a79e1502c2b
0.340 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_check_linkage.cmake
0.340 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_check_linkage.cmake has hash 2236edfea13af20524c17d73214e0e5111bf1c13a2fc46c7f2912a46abd0c1a8
0.340 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_clean_executables_in_bin.cmake
0.340 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_clean_executables_in_bin.cmake has hash 5f7427ddf120583cf1f429861989e937858ee7a8c4deb419dca6f3f2fee86a65
0.340 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_clean_msbuild.cmake
0.340 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_clean_msbuild.cmake has hash 67007e54dee8a38487b43228573d877ad270fc6bac7bf8849783d0c2a78ce501
0.340 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_common_definitions.cmake
0.341 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_common_definitions.cmake has hash ea01c5711c7da32d9037361edee123507cb3708fe43b40ab3ecbbd32872310e3
0.341 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_common_functions.cmake
0.341 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_common_functions.cmake has hash 5f07e6f6184a02dcd8fc058eed1747a6bb65ee4a8f524e717651674f0bd7904c
0.341 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_configure_cmake.cmake
0.341 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_configure_cmake.cmake has hash 9dfd362bd20613eaa83af55eb0f98c8cb50fd4826a65da74a0f1641da73497c2
0.341 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_configure_gn.cmake
0.341 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_configure_gn.cmake has hash c6637dbdb7c20b2e067c924eeb50605f7e3cc9e7c8c1434e53c9280134df11ba
0.341 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_configure_make.cmake
0.341 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_configure_make.cmake has hash f1cdd956184a6d1373f8b82421c20f4644b303c29888d30c0dfceb3f5ec2a261
0.341 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_configure_meson.cmake
0.342 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_configure_meson.cmake has hash 8c25e401a4dd5b0abdd3df5f66195cf008cbdd2ea4cb77c92bc8c7df77eb27ee
0.342 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_configure_qmake.cmake
0.342 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_configure_qmake.cmake has hash 9ca016171cbfafb9b056d9b4f6bbb4a59a928a7d72694997e6d3b6d4f951936c
0.342 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_copy_pdbs.cmake
0.342 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_copy_pdbs.cmake has hash d57e4f196c82dc562a9968c6155073094513c31e2de475694143d3aa47954b1c
0.342 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_copy_tool_dependencies.cmake
0.342 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_copy_tool_dependencies.cmake has hash 66eef4116a52fd8cba76d274f44904846df943a3fc52317871cf255733b2efc4
0.342 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_copy_tools.cmake
0.342 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_copy_tools.cmake has hash 3d45ff761bddbabe8923b52330168dc3abd295fa469d3f2e47cb14dce85332d5
0.342 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_download_distfile.cmake
0.342 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_download_distfile.cmake has hash 2d57e1336ae9daab2f04c0623217094b026080d19bdca3a92396d68ea3e729c7
0.342 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_download_sourceforge.cmake
0.342 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_download_sourceforge.cmake has hash d8a6ab3f2cd82c41cc9a9b9ea9a75f84d7b3a92ac7b3c5c9bb95d381bbae1233
0.342 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_execute_build_process.cmake
0.342 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_execute_build_process.cmake has hash 4976d00fc7d25ad07984f282490121a09aa44a49c5dae627ca68355affd929d0
0.342 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_execute_in_download_mode.cmake
0.342 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_execute_in_download_mode.cmake has hash 75a3cabe04d6bbaf1f73555516dd3c492edbed22cea204835c3620db5d948851
0.342 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_execute_required_process.cmake
0.342 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_execute_required_process.cmake has hash 0c6f52ca848715efd88acfec9bdb2ed3b5f38a650baa6a614bf23ccc3eec150a
0.342 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_execute_required_process_repeat.cmake
0.342 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_execute_required_process_repeat.cmake has hash 4863f71de8d0fd53ed799c6a5d15795156ae0606ecb61489b7636a050e029e2b
0.342 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_extract_archive.cmake
0.343 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_extract_archive.cmake has hash 5cde629f6d23b2979d13cc8188903eeb4087bb195b456bf9df6679f6bcd81e2f
0.343 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_extract_source_archive.cmake
0.343 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_extract_source_archive.cmake has hash 9c733832f8b58b05e6c329ae8b6ad1cfa858224fdc06d4a2d08b428e31de1a51
0.343 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_extract_source_archive_ex.cmake
0.343 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_extract_source_archive_ex.cmake has hash ab9f5bd71a8e1ca4a56d5c09f248c2bc10ff8df3b600c3efb6cca34cba9ec3b7
0.343 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_fail_port_install.cmake
0.343 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_fail_port_install.cmake has hash aef80df96f7c83d79e7b03d132161d8071228e0f1c9eb61ba8b16354f0c9496c
0.343 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(7Z).cmake
0.343 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(7Z).cmake has hash a24c511d7b4b73ea16462ad1867ece7287cd3ef780872a51e192714ea8164f8c
0.343 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(ARIA2).cmake
0.343 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(ARIA2).cmake has hash 948da78edc0b50c8ab8dd8acee7687d3fbbdc6f7c1df2ee8e2bf5fe673794fbe
0.343 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(BAZEL).cmake
0.343 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(BAZEL).cmake has hash 16409b8196d7bb13a7007ecaaaff81d204a8b1194747590136cb517c50547dc5
0.343 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(BISON).cmake
0.343 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(BISON).cmake has hash a5752ee142386cefe6ca66415a75bea5ad8b1af6069aa4c6b8a1a740c898eeac
0.343 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(CLANG).cmake
0.343 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(CLANG).cmake has hash bc9f8433d5ce5a51e45a79c7469cdd9fcad154488b33ff6353af3b29400af50d
0.343 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(DARK).cmake
0.343 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(DARK).cmake has hash 65a32f6f8a7707456a9e96143ea1e438fb44c82ebddf881ff0efc470754577b0
0.343 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(DOXYGEN).cmake
0.343 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(DOXYGEN).cmake has hash 8f4ac6c2f60e1e89e5b48a241098a63141e0d88f00d5fdc2d3c2846c9eaeb82b
0.343 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(FLEX).cmake
0.343 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(FLEX).cmake has hash 5126699579bda4fb2b605adedd8cfed7ac53430178931ffd20d8b007cc89f26f
0.343 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(GASPREPROCESSOR).cmake
0.343 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(GASPREPROCESSOR).cmake has hash 0ff31ab283d7b78bc7af20cdbd66b5adc0432f00f126f8111003245908398c88
0.343 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(GIT).cmake
0.344 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(GIT).cmake has hash bb3644b8863c1a03c3c76cf8b13047557e05b22f4be7a13cb4ad00e72d7ad6b6
0.344 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(GN).cmake
0.344 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(GN).cmake has hash 2df6666d24cc24c550f96d4fee8140656ff6739fdbc57c4a774f56c7d85ff2fa
0.344 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(GO).cmake
0.344 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(GO).cmake has hash 47999a9e8fc92fb7b45fcb1ac1f22d4b69a0b3fff83da2e8df8850fd824ad03f
0.344 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(GPERF).cmake
0.344 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(GPERF).cmake has hash 07129ac2ca1559ec4dc10e5e24efa25303e380e801049ef548b278a6944cd036
0.344 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(JOM).cmake
0.344 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(JOM).cmake has hash a3409f6506dcb4694592483964e680298244e26233900c6b6d95a9e18866b580
0.344 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(MESON).cmake
0.344 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(MESON).cmake has hash b39aa03a7f091406f39101eadd5ede4f893f01cc2a825422be9b7ad537e64a69
0.344 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(NASM).cmake
0.344 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(NASM).cmake has hash 71e81fc7dde7b2e8a0c1dc576d44b5898e64f7d6c92d49ce53bd37a4e6929207
0.344 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(NINJA).cmake
0.344 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(NINJA).cmake has hash 8692aff2f893a8afcabbb4395a8b91ad4f6dd228f410fa4fd050d99c2ec0f52c
0.344 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(NUGET).cmake
0.344 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(NUGET).cmake has hash 1123c7214f2942acaff8e024c492227d6ef264abc7e4e815517931cbf3796d1d
0.344 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(PATCHELF).cmake
0.344 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(PATCHELF).cmake has hash 981d8de1e133c226acf8f3ee2b3faa18aa3b9e502e2a547cdedea59498bcfdab
0.344 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(PERL).cmake
0.344 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(PERL).cmake has hash 74fb0163458bbc0133de10acbdc27137de6ac3cf15a39568b61a1d847e48ff68
0.344 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(PKGCONFIG).cmake
0.344 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(PKGCONFIG).cmake has hash ce850a1af6503582e642e1a134a103adeb5a7340fc0f6ef5d0966b3444f18409
0.344 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(PYTHON2).cmake
0.344 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(PYTHON2).cmake has hash ed078b84af22461e59694ab205a5ba9d0eb77d094ea64fc5754f7e19644b052e
0.344 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(PYTHON3).cmake
0.344 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(PYTHON3).cmake has hash 0befaba75a19d486f5713c0d59fc1c700bbeb4ef479ee9bfe62d7f6a37a5f7a1
0.344 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(RUBY).cmake
0.344 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(RUBY).cmake has hash 641f9c542a6b65ecdf7626d4a9dadee1c1ee6e8b92bbf8ec184969a514fbf28e
0.344 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(SCONS).cmake
0.344 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(SCONS).cmake has hash 93a09225c0260b4e993131d4e246b48c984bb9d582efc183f36dd71875d20714
0.344 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(SWIG).cmake
0.344 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(SWIG).cmake has hash 4b07ff329c995f4ecb6b4c325b690757f2b4ec6666ee7b2264d7083e218fd35c
0.344 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(YASM).cmake
0.344 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program(YASM).cmake has hash a0e60a6625d0b66f43405d8c438c6241154037c16358fbb14e66f834703710df
0.344 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program.cmake
0.345 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_acquire_program.cmake has hash 96d9ee675798a3bddb54340d404b814be45a35c624b2eab5465cd45eaf18b6d3
0.345 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_find_fortran.cmake
0.345 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_find_fortran.cmake has hash e5336d3e2c177a267d79dd3c84d92eed2dcb1d9731f90ac1ef4ad2ec3b43c0fd
0.345 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_fixup_cmake_targets.cmake
0.345 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_fixup_cmake_targets.cmake has hash 7f777f83ca76540ed573d986ee53d1b3da1e45f49f3856c44c0773fec71cb49f
0.345 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_fixup_pkgconfig.cmake
0.345 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_fixup_pkgconfig.cmake has hash 904e67c46ecbb67379911bc1d7222855c0cbfcf1129bf47783858bcf0cc44970
0.345 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_from_bitbucket.cmake
0.345 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_from_bitbucket.cmake has hash e875eb81fb8b06b08d0c97aed211b161dca3d1b7da8e562aa5ee8a8809e9e3d0
0.345 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_from_git.cmake
0.345 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_from_git.cmake has hash 96ed81968f76354c00096dd8cd4e63c6a235fa969334a11ab18d11c0c512ff58
0.345 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_from_github.cmake
0.345 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_from_github.cmake has hash b743742296a114ea1b18ae99672e02f142c4eb2bef7f57d36c038bedbfb0502f
0.345 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_from_gitlab.cmake
0.346 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_from_gitlab.cmake has hash 5bbb6c56a4be11c0d10d488d95af91a37b15f520eba862254a24c6665dd39588
0.346 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_from_sourceforge.cmake
0.346 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_from_sourceforge.cmake has hash 00cb7d5767d56fdd8a1715ebd3c159fccd44dc17653522e23d2e507bce44a4f8
0.346 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_get_program_files_platform_bitness.cmake
0.346 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_get_program_files_platform_bitness.cmake has hash 0c21ce7e9fcf7828f2e06f488f4675816b87942cfbf828c183f5bbcba8ae5fc7
0.346 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_get_windows_sdk.cmake
0.346 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_get_windows_sdk.cmake has hash 9fe97b3807d78c81b54b9512e920112baf68c2b4f5ce483b2764edada074b4ec
0.346 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_host_path_list.cmake
0.346 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_host_path_list.cmake has hash 1e8382b3a80fc7458293fce1659077dcacda9892eb63d911ae0330fdb1aedc2d
0.346 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_install_cmake.cmake
0.346 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_install_cmake.cmake has hash 6119891902c6ad9e9ed1d9b073eb9969159b553f9d6f5bee529cde91769355ff
0.346 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_install_copyright.cmake
0.346 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_install_copyright.cmake has hash ba6c169ab4e59fa05682e530cdeb883767de22c8391f023d4e6844a7ec5dd3d2
0.346 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_install_gn.cmake
0.346 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_install_gn.cmake has hash 18f1e80697fca670452e1ff181850e546764cc7c5fa8cb5d6442266523af9806
0.346 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_install_make.cmake
0.346 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_install_make.cmake has hash 8d8145837ce718ef60778b50fea1af272146c9efa42367ec2d7726332ef29ab5
0.346 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_install_meson.cmake
0.346 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_install_meson.cmake has hash 715cf59e78124dcc0823803544dc12ca4ced4f46ebc43681f4f6cd23d3e99d92
0.346 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_install_msbuild.cmake
0.346 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_install_msbuild.cmake has hash d770323312cc635d641183bfa4a0c073f919c8a37b7d9b3576700b1e934f8cd4
0.346 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_install_nmake.cmake
0.346 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_install_nmake.cmake has hash e5540f04f33bc8eee3417da64e2c9a9aa2bc3dee62031238d7eb795ec31cb0b7
0.346 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_install_qmake.cmake
0.346 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_install_qmake.cmake has hash e9eedf4e8a942dbae43e25d0f7a38a8c3afe7761c5d9e042d1a52017e3dcebe6
0.346 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_list.cmake
0.346 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_list.cmake has hash f5de3ebcbc40a4db90622ade9aca918e2cf404dc0d91342fcde457d730e6fa29
0.346 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_minimum_required.cmake
0.346 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_minimum_required.cmake has hash 4da8ab803b83c8f1c7b6272298108b9f62a7cd0618e563242c8e584692534171
0.346 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_replace_string.cmake
0.346 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_replace_string.cmake has hash d43c8699ce27e25d47367c970d1c546f6bc36b6df8fb0be0c3986eb5830bd4f1
0.346 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/vcpkg_test_cmake.cmake
0.346 [DEBUG] /example/vcpkg/scripts/cmake/vcpkg_test_cmake.cmake has hash 8117a509de7f30dd5c1f4c35134c1b3180c0825ea03480aa4625e98ddd5476e6
0.346 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/z_vcpkg_apply_patches.cmake
0.346 [DEBUG] /example/vcpkg/scripts/cmake/z_vcpkg_apply_patches.cmake has hash aed81b9cb2c44e2736e6e912445044a2f0512c041ecbb72ffb3154e44b0044ba
0.346 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/z_vcpkg_escape_regex_control_characters.cmake
0.347 [DEBUG] /example/vcpkg/scripts/cmake/z_vcpkg_escape_regex_control_characters.cmake has hash 439c52c6ea37cecad4474528fb3b8019f2538380b3771d986e3d7811d8e274b5
0.347 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/z_vcpkg_fixup_rpath.cmake
0.347 [DEBUG] /example/vcpkg/scripts/cmake/z_vcpkg_fixup_rpath.cmake has hash 42cb47e6afc7642a2b126fd9a5501c0330e69daf4bd1db3fc2ae3b67b4c55509
0.347 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/z_vcpkg_forward_output_variable.cmake
0.347 [DEBUG] /example/vcpkg/scripts/cmake/z_vcpkg_forward_output_variable.cmake has hash ae3440b77321516f29f0b51e26b8ecb05fd31f63d33949dc406a502c300b04ff
0.347 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/z_vcpkg_function_arguments.cmake
0.347 [DEBUG] /example/vcpkg/scripts/cmake/z_vcpkg_function_arguments.cmake has hash 11721a8a42a2aa2f6f285d485b21aed55834c2029140661bd8e2f0b709288d77
0.347 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/z_vcpkg_get_cmake_vars.cmake
0.347 [DEBUG] /example/vcpkg/scripts/cmake/z_vcpkg_get_cmake_vars.cmake has hash ce74da978727f15cc4eab6fa8a9c27023f0b51ef654cfbf7df8f3409fb950c43
0.347 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/z_vcpkg_prettify_command_line.cmake
0.347 [DEBUG] /example/vcpkg/scripts/cmake/z_vcpkg_prettify_command_line.cmake has hash 97e4e92ac6e9da544fc7b9a6695e0d491c2c095ec265d8c0a90bcb8168873ca3
0.347 [DEBUG] Trying to hash /example/vcpkg/scripts/cmake/z_vcpkg_setup_pkgconfig_path.cmake
0.347 [DEBUG] /example/vcpkg/scripts/cmake/z_vcpkg_setup_pkgconfig_path.cmake has hash caa64f70ada45af69e4d6fef4a13bf90fdb2fcf398afd5926ee8bb0835f944a5
0.348 [DEBUG] Trying to hash /example/vcpkg/scripts/ports.cmake
0.348 [DEBUG] /example/vcpkg/scripts/ports.cmake has hash 0500e9e2422fe0084c99bdd0c9de4c7069b76da14c8b58228a7e95ebac43058a
0.348 [DEBUG] <abientries for vcpkg-cmake:arm64-linux>
0.348 [DEBUG]   cmake|0
0.348 [DEBUG]   features|core
0.348 [DEBUG]   portfile.cmake|a711531b7f13b7da16fa1f25d7c5737a423d4a126465dc9e6689a0f043fcc1aa
0.348 [DEBUG]   ports.cmake|0500e9e2422fe0084c99bdd0c9de4c7069b76da14c8b58228a7e95ebac43058a
0.348 [DEBUG]   post_build_checks|2
0.348 [DEBUG]   triplet|arm64-linux
0.348 [DEBUG]   triplet_abi|d527954d09db3c078a2fd5dfa6c2f819966e0712b5d736aa53cacc0904618636-6a6f507940899e930a3464a83b1bca17ae1e41eb4cbad2f515d97b95b5508de0-1d43c82f51082f8427993d1dac28c7cb4e3749af
0.348 [DEBUG]   vcpkg-port-config.cmake|f0a30f77c8f5e3ac40436fe2518a61ad067f2955c7ef3be6d6a0ca4b81cd2a45
0.348 [DEBUG]   vcpkg.json|da35a89dcecb2b886316def78e6ed63ad1d5618e007a00bf00e318775499321d
0.348 [DEBUG]   vcpkg_add_to_path|5f5ae75cf37b2a58d1a8561ca96496b64cd91ec9a0afab0b976c3e5d59030bfe
0.348 [DEBUG]   vcpkg_cmake_build.cmake|6d1c27080fe3e768b5e7b968d6a28a37db154ebcb214297de25f10b6713511e1
0.348 [DEBUG]   vcpkg_cmake_configure.cmake|8aae610f5d431a163da08ceaf88c41e2f0046c12c614f186d4b4119663785736
0.348 [DEBUG]   vcpkg_cmake_install.cmake|3ae7886dc8434fac6f1e61190cc355fdec5fbd4f60758e2de20423cf49c91369
0.348 [DEBUG]   vcpkg_configure_cmake|9dfd362bd20613eaa83af55eb0f98c8cb50fd4826a65da74a0f1641da73497c2
0.348 [DEBUG]   vcpkg_execute_build_process|4976d00fc7d25ad07984f282490121a09aa44a49c5dae627ca68355affd929d0
0.348 [DEBUG]   vcpkg_execute_required_process|0c6f52ca848715efd88acfec9bdb2ed3b5f38a650baa6a614bf23ccc3eec150a
0.348 [DEBUG]   vcpkg_find_acquire_program|96d9ee675798a3bddb54340d404b814be45a35c624b2eab5465cd45eaf18b6d3
0.348 [DEBUG]   vcpkg_find_acquire_program(NINJA)|8692aff2f893a8afcabbb4395a8b91ad4f6dd228f410fa4fd050d99c2ec0f52c
0.348 [DEBUG]   vcpkg_list|f5de3ebcbc40a4db90622ade9aca918e2cf404dc0d91342fcde457d730e6fa29
0.348 [DEBUG] </abientries>
0.348 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/zlib/3f05e04b9aededb96786a911a16193cdb711f0c9/0001-Prevent-invalid-inclusions-when-HAVE_-is-set-to-0.patch
0.348 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/zlib/3f05e04b9aededb96786a911a16193cdb711f0c9/0001-Prevent-invalid-inclusions-when-HAVE_-is-set-to-0.patch has hash 750b9542cb55e6328cca01d3ca997f1373b9530afa95e04213168676936e7bfa
0.348 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/zlib/3f05e04b9aededb96786a911a16193cdb711f0c9/0002-build-static-or-shared-not-both.patch
0.348 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/zlib/3f05e04b9aededb96786a911a16193cdb711f0c9/0002-build-static-or-shared-not-both.patch has hash dd4945e8af55d9feb65af706cb0254a6925dc4ac12789586c0d28acf323ad075
0.348 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/zlib/3f05e04b9aededb96786a911a16193cdb711f0c9/0003-android-and-mingw-fixes.patch
0.348 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/zlib/3f05e04b9aededb96786a911a16193cdb711f0c9/0003-android-and-mingw-fixes.patch has hash 63e62c9bae3952b8cca832e01aa96ef3b2696b21976c5031d6d6d79937d8d54c
0.348 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/zlib/3f05e04b9aededb96786a911a16193cdb711f0c9/usage
0.348 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/zlib/3f05e04b9aededb96786a911a16193cdb711f0c9/usage has hash be22662327df993eebc437495add75acb365ab18d37c7e5de735d4ea4f5d3083
0.349 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/zlib/3f05e04b9aededb96786a911a16193cdb711f0c9/vcpkg.json
0.349 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/zlib/3f05e04b9aededb96786a911a16193cdb711f0c9/vcpkg.json has hash 8ad7072167e1bf56d2ed531e43ecc95026d5b305ed0393140d5ec78f5c6b6c00
0.349 [DEBUG] <abientries for zlib:arm64-linux>
0.349 [DEBUG]   0001-Prevent-invalid-inclusions-when-HAVE_-is-set-to-0.patch|750b9542cb55e6328cca01d3ca997f1373b9530afa95e04213168676936e7bfa
0.349 [DEBUG]   0002-build-static-or-shared-not-both.patch|dd4945e8af55d9feb65af706cb0254a6925dc4ac12789586c0d28acf323ad075
0.349 [DEBUG]   0003-android-and-mingw-fixes.patch|63e62c9bae3952b8cca832e01aa96ef3b2696b21976c5031d6d6d79937d8d54c
0.349 [DEBUG]   cmake|0
0.349 [DEBUG]   features|core
0.349 [DEBUG]   portfile.cmake|b14cee469c2da06e036e63293c0b6e6509924462e9b341b317986df46b281695
0.349 [DEBUG]   ports.cmake|0500e9e2422fe0084c99bdd0c9de4c7069b76da14c8b58228a7e95ebac43058a
0.349 [DEBUG]   post_build_checks|2
0.349 [DEBUG]   triplet|arm64-linux
0.349 [DEBUG]   triplet_abi|d527954d09db3c078a2fd5dfa6c2f819966e0712b5d736aa53cacc0904618636-6a6f507940899e930a3464a83b1bca17ae1e41eb4cbad2f515d97b95b5508de0-1d43c82f51082f8427993d1dac28c7cb4e3749af
0.349 [DEBUG]   usage|be22662327df993eebc437495add75acb365ab18d37c7e5de735d4ea4f5d3083
0.349 [DEBUG]   vcpkg-cmake|e0e943acf7034eae4eaec26ef94bd103dc8797a7e5b8b72d7fdeb853812b9d6f
0.349 [DEBUG]   vcpkg-cmake-wrapper.cmake|5d49ef2ee6448479c2aad0e5f732e2676eaba0411860f9bebabe6002d66f57d1
0.349 [DEBUG]   vcpkg.json|8ad7072167e1bf56d2ed531e43ecc95026d5b305ed0393140d5ec78f5c6b6c00
0.349 [DEBUG]   vcpkg_copy_pdbs|d57e4f196c82dc562a9968c6155073094513c31e2de475694143d3aa47954b1c
0.349 [DEBUG]   vcpkg_fixup_pkgconfig|904e67c46ecbb67379911bc1d7222855c0cbfcf1129bf47783858bcf0cc44970
0.349 [DEBUG]   vcpkg_from_git|96ed81968f76354c00096dd8cd4e63c6a235fa969334a11ab18d11c0c512ff58
0.349 [DEBUG]   vcpkg_from_github|b743742296a114ea1b18ae99672e02f142c4eb2bef7f57d36c038bedbfb0502f
0.349 [DEBUG]   vcpkg_replace_string|d43c8699ce27e25d47367c970d1c546f6bc36b6df8fb0be0c3986eb5830bd4f1
0.349 [DEBUG] </abientries>
0.349 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake-config/8d54cc4f487d51b655abec5f9c9c3f86ca83311f/copyright
0.349 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake-config/8d54cc4f487d51b655abec5f9c9c3f86ca83311f/copyright has hash 04b60f99a43bfd7fefdc8364b24aac704a2160cef969b75ba6a38b62dc4c4b70
0.349 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake-config/8d54cc4f487d51b655abec5f9c9c3f86ca83311f/vcpkg.json
0.349 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake-config/8d54cc4f487d51b655abec5f9c9c3f86ca83311f/vcpkg.json has hash 4ffbabc2feab69abd21267f57669ef5e404bcbfa5ab6d93234374d98f5ff1864
0.350 [DEBUG] <abientries for vcpkg-cmake-config:arm64-linux>
0.350 [DEBUG]   cmake|0
0.350 [DEBUG]   copyright|04b60f99a43bfd7fefdc8364b24aac704a2160cef969b75ba6a38b62dc4c4b70
0.350 [DEBUG]   features|core
0.350 [DEBUG]   portfile.cmake|832b34e63f5af41ad1b2e4aa79c5bfa507a005b120b51548e674accc706837d7
0.350 [DEBUG]   ports.cmake|0500e9e2422fe0084c99bdd0c9de4c7069b76da14c8b58228a7e95ebac43058a
0.350 [DEBUG]   post_build_checks|2
0.350 [DEBUG]   triplet|arm64-linux
0.350 [DEBUG]   triplet_abi|d527954d09db3c078a2fd5dfa6c2f819966e0712b5d736aa53cacc0904618636-6a6f507940899e930a3464a83b1bca17ae1e41eb4cbad2f515d97b95b5508de0-1d43c82f51082f8427993d1dac28c7cb4e3749af
0.350 [DEBUG]   vcpkg-port-config.cmake|72bc3093337e633bdd19fe5d4dd1f38ca1918def49608d676a9c98c686d38b1e
0.350 [DEBUG]   vcpkg.json|4ffbabc2feab69abd21267f57669ef5e404bcbfa5ab6d93234374d98f5ff1864
0.350 [DEBUG]   vcpkg_cmake_config_fixup.cmake|f92905382d90e37fa2addd96becce31f5075175196b117de6dd997a4ac1d6d06
0.350 [DEBUG]   vcpkg_list|f5de3ebcbc40a4db90622ade9aca918e2cf404dc0d91342fcde457d730e6fa29
0.350 [DEBUG] </abientries>
0.350 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/sqlite3/4e2ae6bc4849b52c6cd2e2d51c110f69ac3901d0/CMakeLists.txt
0.350 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/sqlite3/4e2ae6bc4849b52c6cd2e2d51c110f69ac3901d0/CMakeLists.txt has hash db133f80084dbbaccbc61c314d437412a5cc31b49378b19b7748f63269e3435a
0.350 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/sqlite3/4e2ae6bc4849b52c6cd2e2d51c110f69ac3901d0/add-config-include.patch
0.350 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/sqlite3/4e2ae6bc4849b52c6cd2e2d51c110f69ac3901d0/add-config-include.patch has hash 15a6fc0818d6407b468e3c869627445f1af09ef94ecf5c792eee71bc30ca7e68
0.350 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/sqlite3/4e2ae6bc4849b52c6cd2e2d51c110f69ac3901d0/fix-arm-uwp.patch
0.350 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/sqlite3/4e2ae6bc4849b52c6cd2e2d51c110f69ac3901d0/fix-arm-uwp.patch has hash f4397f84d931cccb44a038194c895e28c749f1825ab45db4b5dccd6e3b6b5967
0.350 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/sqlite3/4e2ae6bc4849b52c6cd2e2d51c110f69ac3901d0/sqlite3-vcpkg-config.h.in
0.351 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/sqlite3/4e2ae6bc4849b52c6cd2e2d51c110f69ac3901d0/sqlite3-vcpkg-config.h.in has hash 4d692836e018acaa517e666790b19bc77c6fa1b91cea2c55a9253211394a6288
0.351 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/sqlite3/4e2ae6bc4849b52c6cd2e2d51c110f69ac3901d0/sqlite3.pc.in
0.351 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/sqlite3/4e2ae6bc4849b52c6cd2e2d51c110f69ac3901d0/sqlite3.pc.in has hash 7d0eef3b49bc8c7fbb6a06b449855060ab5d9b4ab37d1781a0269dda8421a391
0.351 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/sqlite3/4e2ae6bc4849b52c6cd2e2d51c110f69ac3901d0/usage
0.351 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/sqlite3/4e2ae6bc4849b52c6cd2e2d51c110f69ac3901d0/usage has hash 1cd1a4fe57d9caf51321f363f1d395074ac7d0c14b7035a5d2c218670be4b5b3
0.351 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/sqlite3/4e2ae6bc4849b52c6cd2e2d51c110f69ac3901d0/vcpkg.json
0.351 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/sqlite3/4e2ae6bc4849b52c6cd2e2d51c110f69ac3901d0/vcpkg.json has hash 7e1d4eda6bb0dc668de6667832dab4a8b4655bd63adf44db6c0eaa07c436589c
0.351 [DEBUG] <abientries for sqlite3:arm64-linux>
0.351 [DEBUG]   CMakeLists.txt|db133f80084dbbaccbc61c314d437412a5cc31b49378b19b7748f63269e3435a
0.351 [DEBUG]   add-config-include.patch|15a6fc0818d6407b468e3c869627445f1af09ef94ecf5c792eee71bc30ca7e68
0.351 [DEBUG]   cmake|0
0.351 [DEBUG]   features|core;json1
0.351 [DEBUG]   fix-arm-uwp.patch|f4397f84d931cccb44a038194c895e28c749f1825ab45db4b5dccd6e3b6b5967
0.351 [DEBUG]   portfile.cmake|23e8848769d5e1b57f31a1f05656397c6acc784e6103c6e148e2353826fdf622
0.351 [DEBUG]   ports.cmake|0500e9e2422fe0084c99bdd0c9de4c7069b76da14c8b58228a7e95ebac43058a
0.351 [DEBUG]   post_build_checks|2
0.351 [DEBUG]   sqlite3-config.in.cmake|7a44f5805ced746c4dcb497055bce06e45eb3ecb3506465fcde4d442a2179d96
0.351 [DEBUG]   sqlite3-vcpkg-config.h.in|4d692836e018acaa517e666790b19bc77c6fa1b91cea2c55a9253211394a6288
0.351 [DEBUG]   sqlite3.pc.in|7d0eef3b49bc8c7fbb6a06b449855060ab5d9b4ab37d1781a0269dda8421a391
0.351 [DEBUG]   triplet|arm64-linux
0.351 [DEBUG]   triplet_abi|d527954d09db3c078a2fd5dfa6c2f819966e0712b5d736aa53cacc0904618636-6a6f507940899e930a3464a83b1bca17ae1e41eb4cbad2f515d97b95b5508de0-1d43c82f51082f8427993d1dac28c7cb4e3749af
0.351 [DEBUG]   usage|1cd1a4fe57d9caf51321f363f1d395074ac7d0c14b7035a5d2c218670be4b5b3
0.351 [DEBUG]   vcpkg-cmake|e0e943acf7034eae4eaec26ef94bd103dc8797a7e5b8b72d7fdeb853812b9d6f
0.351 [DEBUG]   vcpkg-cmake-config|bac60fd92d5d37c30a852f1f567cd94373ec0f08dd929bda9d4a8e50b400e8ad
0.351 [DEBUG]   vcpkg.json|7e1d4eda6bb0dc668de6667832dab4a8b4655bd63adf44db6c0eaa07c436589c
0.351 [DEBUG]   vcpkg_check_features|943b217e0968d64cf2cb9c272608e6a0b497377e792034f819809a79e1502c2b
0.351 [DEBUG]   vcpkg_copy_pdbs|d57e4f196c82dc562a9968c6155073094513c31e2de475694143d3aa47954b1c
0.351 [DEBUG]   vcpkg_copy_tools|3d45ff761bddbabe8923b52330168dc3abd295fa469d3f2e47cb14dce85332d5
0.351 [DEBUG]   vcpkg_download_distfile|2d57e1336ae9daab2f04c0623217094b026080d19bdca3a92396d68ea3e729c7
0.351 [DEBUG]   vcpkg_extract_source_archive|9c733832f8b58b05e6c329ae8b6ad1cfa858224fdc06d4a2d08b428e31de1a51
0.351 [DEBUG]   vcpkg_fixup_pkgconfig|904e67c46ecbb67379911bc1d7222855c0cbfcf1129bf47783858bcf0cc44970
0.351 [DEBUG] </abientries>
0.351 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake-get-vars/725c841810ceb8de33da68ea879eb8f0b4d6c94c/cmake_get_vars/CMakeLists.txt
0.351 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake-get-vars/725c841810ceb8de33da68ea879eb8f0b4d6c94c/cmake_get_vars/CMakeLists.txt has hash 75a1291434249775e2f82942e9e04b41efef3e8cded19c30a9940c691ad9148f
0.351 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake-get-vars/725c841810ceb8de33da68ea879eb8f0b4d6c94c/vcpkg.json
0.351 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake-get-vars/725c841810ceb8de33da68ea879eb8f0b4d6c94c/vcpkg.json has hash 90ff3bf8d338ffa039b69e800a1758c30f939085efcf1dfcee4d975871475a09
0.352 [DEBUG] <abientries for vcpkg-cmake-get-vars:arm64-linux>
0.352 [DEBUG]   cmake|0
0.352 [DEBUG]   cmake_get_vars/CMakeLists.txt|75a1291434249775e2f82942e9e04b41efef3e8cded19c30a9940c691ad9148f
0.352 [DEBUG]   features|core
0.352 [DEBUG]   portfile.cmake|bbcf9d6b88dd539617f4cfc1f76acbbe9a6e31fc373d79c1c626278768ea2e2a
0.352 [DEBUG]   ports.cmake|0500e9e2422fe0084c99bdd0c9de4c7069b76da14c8b58228a7e95ebac43058a
0.352 [DEBUG]   post_build_checks|2
0.352 [DEBUG]   triplet|arm64-linux
0.352 [DEBUG]   triplet_abi|d527954d09db3c078a2fd5dfa6c2f819966e0712b5d736aa53cacc0904618636-6a6f507940899e930a3464a83b1bca17ae1e41eb4cbad2f515d97b95b5508de0-1d43c82f51082f8427993d1dac28c7cb4e3749af
0.352 [DEBUG]   vcpkg-cmake|e0e943acf7034eae4eaec26ef94bd103dc8797a7e5b8b72d7fdeb853812b9d6f
0.352 [DEBUG]   vcpkg-port-config.cmake|4fd4c2e909bbdf069eb3c59b4b847b0b386cdb41840714e12b34b7eff41f9e22
0.352 [DEBUG]   vcpkg.json|90ff3bf8d338ffa039b69e800a1758c30f939085efcf1dfcee4d975871475a09
0.352 [DEBUG]   vcpkg_cmake_get_vars.cmake|da894e0dafa6ef0acdc641f12b02633f273322d86a6d2e7065dc56134478cea3
0.352 [DEBUG] </abientries>
0.352 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/openssl.pc.in
0.352 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/openssl.pc.in has hash add49223f08228831ced1bc35fc2c56a4ab0fe9741e1fb2bdc86c6d3da4b326a
0.352 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/script-prefix.patch
0.352 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/script-prefix.patch has hash a18b53acdea8180aa24c4abbe85c4269e4d092c6eba4f946d5feafa7ca2a163d
0.352 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/unix/android-cc.patch
0.352 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/unix/android-cc.patch has hash a3cde12ca3c7c7894e73d300e0ccf728de28b87afde13776e7d7267979c3ead2
0.352 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/unix/configure
0.352 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/unix/configure has hash 96ef16490c8a7c240a0c96de7e641c93843d0b78400b4de7dc2c7d2e500f3480
0.352 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/unix/move-openssldir.patch
0.352 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/unix/move-openssldir.patch has hash 9e62ad861f8421e5b732bf488b7199131ac17a57f295f50c697d2591f5845e0e
0.352 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/unix/no-empty-dirs.patch
0.352 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/unix/no-empty-dirs.patch has hash a03d46642c903c9eb09184eabc553ce1467e000c28a9e7d7e92d995970004a62
0.352 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/unix/no-static-libs-for-shared.patch
0.352 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/unix/no-static-libs-for-shared.patch has hash dc51d597ad7477fc56c2a394c84493c87a4de2b84898497dda2754dd0fd8cb53
0.352 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/usage
0.352 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/usage has hash a0bd98264517147f1c61a660a02628e8633b53933c2d35285af49e187081d9d5
0.352 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/vcpkg-cmake-wrapper.cmake.in
0.352 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/vcpkg-cmake-wrapper.cmake.in has hash b29a6ba88f6f26f03a70cf57c31beb6de58ba0306ce8f3028f52fef4b86aec13
0.352 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/vcpkg.json
0.352 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/vcpkg.json has hash a70d24e5a266a055d8fd1d95dde662445c829fb44f5d32d53b192edb581dcfdc
0.352 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/windows/install-layout.patch
0.352 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/windows/install-layout.patch has hash 06bf9d3f9d78a99d6472bd8a63442065a90cf413af5c4e2946348bece1ce50f2
0.352 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/windows/install-pdbs.patch
0.352 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d/windows/install-pdbs.patch has hash 5ad1f60ee8e967a079ba3d1eed3e6f368f39e5860dd33928594fd0dd58a5ba4d
0.353 [DEBUG] <abientries for openssl:arm64-linux>
0.353 [DEBUG]   cmake|0
0.353 [DEBUG]   execute_process|66a937b9c074422643135c319d1abadaa45484a664f1b160d4c163efb444a446
0.353 [DEBUG]   features|core
0.353 [DEBUG]   install-pc-files.cmake|001f4b55b3da7b4faa0910b906f9c587055abaa99edac9cfb3669a06b5387d44
0.353 [DEBUG]   openssl.pc.in|add49223f08228831ced1bc35fc2c56a4ab0fe9741e1fb2bdc86c6d3da4b326a
0.353 [DEBUG]   portfile.cmake|d4d9a32f09dc9b80abff0880a3874ebf0e87ff94c572bf8cd42c5bc8be68d7ee
0.353 [DEBUG]   ports.cmake|0500e9e2422fe0084c99bdd0c9de4c7069b76da14c8b58228a7e95ebac43058a
0.353 [DEBUG]   post_build_checks|2
0.353 [DEBUG]   script-prefix.patch|a18b53acdea8180aa24c4abbe85c4269e4d092c6eba4f946d5feafa7ca2a163d
0.353 [DEBUG]   triplet|arm64-linux
0.353 [DEBUG]   triplet_abi|d527954d09db3c078a2fd5dfa6c2f819966e0712b5d736aa53cacc0904618636-6a6f507940899e930a3464a83b1bca17ae1e41eb4cbad2f515d97b95b5508de0-1d43c82f51082f8427993d1dac28c7cb4e3749af
0.353 [DEBUG]   unix/android-cc.patch|a3cde12ca3c7c7894e73d300e0ccf728de28b87afde13776e7d7267979c3ead2
0.353 [DEBUG]   unix/configure|96ef16490c8a7c240a0c96de7e641c93843d0b78400b4de7dc2c7d2e500f3480
0.353 [DEBUG]   unix/move-openssldir.patch|9e62ad861f8421e5b732bf488b7199131ac17a57f295f50c697d2591f5845e0e
0.353 [DEBUG]   unix/no-empty-dirs.patch|a03d46642c903c9eb09184eabc553ce1467e000c28a9e7d7e92d995970004a62
0.353 [DEBUG]   unix/no-static-libs-for-shared.patch|dc51d597ad7477fc56c2a394c84493c87a4de2b84898497dda2754dd0fd8cb53
0.353 [DEBUG]   unix/portfile.cmake|3ca966fa7e9380cd5b8a428f2ee070654881daa291815cdcd5a700d0c5d73071
0.353 [DEBUG]   unix/remove-deps.cmake|6f9560155faa36f82e249d20b80d28edebd546c55db144b8dabbe0affea6ab14
0.353 [DEBUG]   usage|a0bd98264517147f1c61a660a02628e8633b53933c2d35285af49e187081d9d5
0.353 [DEBUG]   vcpkg-cmake|e0e943acf7034eae4eaec26ef94bd103dc8797a7e5b8b72d7fdeb853812b9d6f
0.353 [DEBUG]   vcpkg-cmake-config|bac60fd92d5d37c30a852f1f567cd94373ec0f08dd929bda9d4a8e50b400e8ad
0.353 [DEBUG]   vcpkg-cmake-get-vars|3d5562e6637d0053eb89fedc02a64c3ba8604a847674a031b7ed57a8a6c6c48f
0.353 [DEBUG]   vcpkg-cmake-wrapper.cmake.in|b29a6ba88f6f26f03a70cf57c31beb6de58ba0306ce8f3028f52fef4b86aec13
0.353 [DEBUG]   vcpkg.json|a70d24e5a266a055d8fd1d95dde662445c829fb44f5d32d53b192edb581dcfdc
0.353 [DEBUG]   vcpkg_acquire_msys|5e0ce6582722fe72b99e80e22270778e88002b40bc43dfecf8b7936bb0790461
0.353 [DEBUG]   vcpkg_add_to_path|5f5ae75cf37b2a58d1a8561ca96496b64cd91ec9a0afab0b976c3e5d59030bfe
0.353 [DEBUG]   vcpkg_build_nmake|918422e54a328b9dce1be8c06916d612de9cc24a18c65cc47f26d78e8c487440
0.353 [DEBUG]   vcpkg_check_linkage|2236edfea13af20524c17d73214e0e5111bf1c13a2fc46c7f2912a46abd0c1a8
0.353 [DEBUG]   vcpkg_configure_make|f1cdd956184a6d1373f8b82421c20f4644b303c29888d30c0dfceb3f5ec2a261
0.353 [DEBUG]   vcpkg_copy_pdbs|d57e4f196c82dc562a9968c6155073094513c31e2de475694143d3aa47954b1c
0.353 [DEBUG]   vcpkg_copy_tools|3d45ff761bddbabe8923b52330168dc3abd295fa469d3f2e47cb14dce85332d5
0.353 [DEBUG]   vcpkg_find_acquire_program|96d9ee675798a3bddb54340d404b814be45a35c624b2eab5465cd45eaf18b6d3
0.353 [DEBUG]   vcpkg_find_acquire_program(CLANG)|bc9f8433d5ce5a51e45a79c7469cdd9fcad154488b33ff6353af3b29400af50d
0.353 [DEBUG]   vcpkg_find_acquire_program(NASM)|71e81fc7dde7b2e8a0c1dc576d44b5898e64f7d6c92d49ce53bd37a4e6929207
0.353 [DEBUG]   vcpkg_find_acquire_program(PERL)|74fb0163458bbc0133de10acbdc27137de6ac3cf15a39568b61a1d847e48ff68
0.353 [DEBUG]   vcpkg_fixup_pkgconfig|904e67c46ecbb67379911bc1d7222855c0cbfcf1129bf47783858bcf0cc44970
0.353 [DEBUG]   vcpkg_from_git|96ed81968f76354c00096dd8cd4e63c6a235fa969334a11ab18d11c0c512ff58
0.353 [DEBUG]   vcpkg_from_github|b743742296a114ea1b18ae99672e02f142c4eb2bef7f57d36c038bedbfb0502f
0.353 [DEBUG]   vcpkg_host_path_list|1e8382b3a80fc7458293fce1659077dcacda9892eb63d911ae0330fdb1aedc2d
0.353 [DEBUG]   vcpkg_install_copyright|ba6c169ab4e59fa05682e530cdeb883767de22c8391f023d4e6844a7ec5dd3d2
0.353 [DEBUG]   vcpkg_install_make|8d8145837ce718ef60778b50fea1af272146c9efa42367ec2d7726332ef29ab5
0.353 [DEBUG]   vcpkg_list|f5de3ebcbc40a4db90622ade9aca918e2cf404dc0d91342fcde457d730e6fa29
0.353 [DEBUG]   windows/install-layout.patch|06bf9d3f9d78a99d6472bd8a63442065a90cf413af5c4e2946348bece1ce50f2
0.353 [DEBUG]   windows/install-pdbs.patch|5ad1f60ee8e967a079ba3d1eed3e6f368f39e5860dd33928594fd0dd58a5ba4d
0.353 [DEBUG]   windows/portfile.cmake|812a64310844bf52e31c3d4465ccf7c6045d707b9f830f7715dc7f26396a4482
0.353 [DEBUG] </abientries>
0.353 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/libuuid/09be6774f518692bc418aa03623cc9dbc19e6516/CMakeLists.txt
0.353 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/libuuid/09be6774f518692bc418aa03623cc9dbc19e6516/CMakeLists.txt has hash 42527e51f3438e4d8c9ee221c611ea50953babf439a3232ea46ba3d45b6b1e8b
0.353 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/libuuid/09be6774f518692bc418aa03623cc9dbc19e6516/config.linux.h
0.353 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/libuuid/09be6774f518692bc418aa03623cc9dbc19e6516/config.linux.h has hash 95b82bd74377635a7e67a95b1b96143b370443abc054fc42c728e5d5a4153297
0.353 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/libuuid/09be6774f518692bc418aa03623cc9dbc19e6516/unofficial-libuuid-config.cmake.in
0.353 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/libuuid/09be6774f518692bc418aa03623cc9dbc19e6516/unofficial-libuuid-config.cmake.in has hash d440b00400bed20ebc6c0e4ef9f646c558b8e752fa11f0a78ff0392a0653f584
0.353 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/libuuid/09be6774f518692bc418aa03623cc9dbc19e6516/vcpkg.json
0.354 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/libuuid/09be6774f518692bc418aa03623cc9dbc19e6516/vcpkg.json has hash aedb7a47da5ff01575f52a5e19e971d9fa0e5c7e994e8f89fc140888b0728b03
0.354 [DEBUG] <abientries for libuuid:arm64-linux>
0.354 [DEBUG]   CMakeLists.txt|42527e51f3438e4d8c9ee221c611ea50953babf439a3232ea46ba3d45b6b1e8b
0.354 [DEBUG]   cmake|0
0.354 [DEBUG]   config.linux.h|95b82bd74377635a7e67a95b1b96143b370443abc054fc42c728e5d5a4153297
0.354 [DEBUG]   features|core
0.354 [DEBUG]   portfile.cmake|b04be114cab9b5bcf98d29154c3a755c5398b0d2628f61ad78fe1c5fe9a8efec
0.354 [DEBUG]   ports.cmake|0500e9e2422fe0084c99bdd0c9de4c7069b76da14c8b58228a7e95ebac43058a
0.354 [DEBUG]   post_build_checks|2
0.354 [DEBUG]   triplet|arm64-linux
0.354 [DEBUG]   triplet_abi|d527954d09db3c078a2fd5dfa6c2f819966e0712b5d736aa53cacc0904618636-6a6f507940899e930a3464a83b1bca17ae1e41eb4cbad2f515d97b95b5508de0-1d43c82f51082f8427993d1dac28c7cb4e3749af
0.354 [DEBUG]   unofficial-libuuid-config.cmake.in|d440b00400bed20ebc6c0e4ef9f646c558b8e752fa11f0a78ff0392a0653f584
0.354 [DEBUG]   vcpkg-cmake|e0e943acf7034eae4eaec26ef94bd103dc8797a7e5b8b72d7fdeb853812b9d6f
0.354 [DEBUG]   vcpkg-cmake-config|bac60fd92d5d37c30a852f1f567cd94373ec0f08dd929bda9d4a8e50b400e8ad
0.354 [DEBUG]   vcpkg.json|aedb7a47da5ff01575f52a5e19e971d9fa0e5c7e994e8f89fc140888b0728b03
0.354 [DEBUG]   vcpkg_copy_pdbs|d57e4f196c82dc562a9968c6155073094513c31e2de475694143d3aa47954b1c
0.354 [DEBUG]   vcpkg_fixup_pkgconfig|904e67c46ecbb67379911bc1d7222855c0cbfcf1129bf47783858bcf0cc44970
0.354 [DEBUG]   vcpkg_from_sourceforge|00cb7d5767d56fdd8a1715ebd3c159fccd44dc17653522e23d2e507bce44a4f8
0.354 [DEBUG]   vcpkg_install_copyright|ba6c169ab4e59fa05682e530cdeb883767de22c8391f023d4e6844a7ec5dd3d2
0.354 [DEBUG] </abientries>
0.354 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/liblzma/f285b7c4ffa2cc065c7c6fec4b61006f7fa2714e/add_support_ios.patch
0.354 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/liblzma/f285b7c4ffa2cc065c7c6fec4b61006f7fa2714e/add_support_ios.patch has hash 25efebf8e0c5214934deed08e6cec31e0bab834dcc2931abd1ce5d149200e192
0.354 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/liblzma/f285b7c4ffa2cc065c7c6fec4b61006f7fa2714e/build-tools.patch
0.354 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/liblzma/f285b7c4ffa2cc065c7c6fec4b61006f7fa2714e/build-tools.patch has hash 7af1d8c78fd8f3daf47b496aed6e960d5ddc3e09e60b81577d849a8bd429c84d
0.354 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/liblzma/f285b7c4ffa2cc065c7c6fec4b61006f7fa2714e/fix_config_include.patch
0.354 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/liblzma/f285b7c4ffa2cc065c7c6fec4b61006f7fa2714e/fix_config_include.patch has hash dea669f8422905d81333b90a9169f124d1ff1658c5ac0e0f02d53e9f33f92421
0.354 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/liblzma/f285b7c4ffa2cc065c7c6fec4b61006f7fa2714e/usage
0.354 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/liblzma/f285b7c4ffa2cc065c7c6fec4b61006f7fa2714e/usage has hash 8e856626fcd7a0110736379543122b37484d658078c12a55596b0664f455286d
0.354 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/liblzma/f285b7c4ffa2cc065c7c6fec4b61006f7fa2714e/vcpkg.json
0.354 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/liblzma/f285b7c4ffa2cc065c7c6fec4b61006f7fa2714e/vcpkg.json has hash 8042406c35df405d5af871eddbb211793ffbd83cfeb5dde18a2c29ba07b36c6f
0.354 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/liblzma/f285b7c4ffa2cc065c7c6fec4b61006f7fa2714e/win_output_name.patch
0.354 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/liblzma/f285b7c4ffa2cc065c7c6fec4b61006f7fa2714e/win_output_name.patch has hash a60b5f555544ee7f1871c0a5397f76cd7d2cb42941391d717661e93edcfbd9c9
0.355 [DEBUG] <abientries for liblzma:arm64-linux>
0.355 [DEBUG]   add_support_ios.patch|25efebf8e0c5214934deed08e6cec31e0bab834dcc2931abd1ce5d149200e192
0.355 [DEBUG]   build-tools.patch|7af1d8c78fd8f3daf47b496aed6e960d5ddc3e09e60b81577d849a8bd429c84d
0.355 [DEBUG]   cmake|0
0.355 [DEBUG]   features|core
0.355 [DEBUG]   fix_config_include.patch|dea669f8422905d81333b90a9169f124d1ff1658c5ac0e0f02d53e9f33f92421
0.355 [DEBUG]   portfile.cmake|02e591827f5eca372f5c9354a5fa56b1460307d0651e53a375e0522f5c44f9a4
0.355 [DEBUG]   ports.cmake|0500e9e2422fe0084c99bdd0c9de4c7069b76da14c8b58228a7e95ebac43058a
0.355 [DEBUG]   post_build_checks|2
0.355 [DEBUG]   triplet|arm64-linux
0.355 [DEBUG]   triplet_abi|d527954d09db3c078a2fd5dfa6c2f819966e0712b5d736aa53cacc0904618636-6a6f507940899e930a3464a83b1bca17ae1e41eb4cbad2f515d97b95b5508de0-1d43c82f51082f8427993d1dac28c7cb4e3749af
0.355 [DEBUG]   usage|8e856626fcd7a0110736379543122b37484d658078c12a55596b0664f455286d
0.355 [DEBUG]   vcpkg-cmake|e0e943acf7034eae4eaec26ef94bd103dc8797a7e5b8b72d7fdeb853812b9d6f
0.355 [DEBUG]   vcpkg-cmake-config|bac60fd92d5d37c30a852f1f567cd94373ec0f08dd929bda9d4a8e50b400e8ad
0.355 [DEBUG]   vcpkg-cmake-wrapper.cmake|a4611673d837ec6e94f0f0f9a85a1859b85ef169e762b48a99946b9436647b39
0.355 [DEBUG]   vcpkg.json|8042406c35df405d5af871eddbb211793ffbd83cfeb5dde18a2c29ba07b36c6f
0.355 [DEBUG]   vcpkg_check_features|943b217e0968d64cf2cb9c272608e6a0b497377e792034f819809a79e1502c2b
0.355 [DEBUG]   vcpkg_copy_pdbs|d57e4f196c82dc562a9968c6155073094513c31e2de475694143d3aa47954b1c
0.355 [DEBUG]   vcpkg_copy_tools|3d45ff761bddbabe8923b52330168dc3abd295fa469d3f2e47cb14dce85332d5
0.355 [DEBUG]   vcpkg_fixup_pkgconfig|904e67c46ecbb67379911bc1d7222855c0cbfcf1129bf47783858bcf0cc44970
0.355 [DEBUG]   vcpkg_from_git|96ed81968f76354c00096dd8cd4e63c6a235fa969334a11ab18d11c0c512ff58
0.355 [DEBUG]   vcpkg_from_github|b743742296a114ea1b18ae99672e02f142c4eb2bef7f57d36c038bedbfb0502f
0.355 [DEBUG]   vcpkg_install_copyright|ba6c169ab4e59fa05682e530cdeb883767de22c8391f023d4e6844a7ec5dd3d2
0.355 [DEBUG]   vcpkg_replace_string|d43c8699ce27e25d47367c970d1c546f6bc36b6df8fb0be0c3986eb5830bd4f1
0.355 [DEBUG]   win_output_name.patch|a60b5f555544ee7f1871c0a5397f76cd7d2cb42941391d717661e93edcfbd9c9
0.355 [DEBUG] </abientries>
0.355 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/libffi/0ad381012102db5da196161ba7fc0a03a4dcb982/dll-bindir.diff
0.355 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/libffi/0ad381012102db5da196161ba7fc0a03a4dcb982/dll-bindir.diff has hash 97e9f11ca9f344820dc3b9cba548f4a8818231b1751c518d04ed3c733b8fa8b6
0.355 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/libffi/0ad381012102db5da196161ba7fc0a03a4dcb982/usage
0.355 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/libffi/0ad381012102db5da196161ba7fc0a03a4dcb982/usage has hash 38947206ff1c41dce2eedee93dc0bf3c002030fd13c9f4a2bcda912627974a59
0.355 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/libffi/0ad381012102db5da196161ba7fc0a03a4dcb982/vcpkg.json
0.355 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/libffi/0ad381012102db5da196161ba7fc0a03a4dcb982/vcpkg.json has hash 38f78630af752d852f9e4ca711454087e50bad815239437e8e679091b8972b12
0.355 [DEBUG] <abientries for libffi:arm64-linux>
0.355 [DEBUG]   cmake|0
0.355 [DEBUG]   dll-bindir.diff|97e9f11ca9f344820dc3b9cba548f4a8818231b1751c518d04ed3c733b8fa8b6
0.355 [DEBUG]   features|core
0.355 [DEBUG]   libffiConfig.cmake|6c7e382749df1b27db5995a21bdc6a6d71241d2fc1cea5cc138119bdd2534318
0.355 [DEBUG]   portfile.cmake|9810533bdc3965104e95a7494978373f7d7a4f27420aa0a6dc4903bc47a77026
0.355 [DEBUG]   ports.cmake|0500e9e2422fe0084c99bdd0c9de4c7069b76da14c8b58228a7e95ebac43058a
0.355 [DEBUG]   post_build_checks|2
0.355 [DEBUG]   triplet|arm64-linux
0.355 [DEBUG]   triplet_abi|d527954d09db3c078a2fd5dfa6c2f819966e0712b5d736aa53cacc0904618636-6a6f507940899e930a3464a83b1bca17ae1e41eb4cbad2f515d97b95b5508de0-1d43c82f51082f8427993d1dac28c7cb4e3749af
0.355 [DEBUG]   unofficial-libffi-config.cmake|c34a1f46f0cb6294e63f390dd0bd5bf68a76ede0f3ebaa2c1306c8aed78668bd
0.355 [DEBUG]   usage|38947206ff1c41dce2eedee93dc0bf3c002030fd13c9f4a2bcda912627974a59
0.355 [DEBUG]   vcpkg-cmake-get-vars|3d5562e6637d0053eb89fedc02a64c3ba8604a847674a031b7ed57a8a6c6c48f
0.355 [DEBUG]   vcpkg.json|38f78630af752d852f9e4ca711454087e50bad815239437e8e679091b8972b12
0.355 [DEBUG]   vcpkg_add_to_path|5f5ae75cf37b2a58d1a8561ca96496b64cd91ec9a0afab0b976c3e5d59030bfe
0.355 [DEBUG]   vcpkg_configure_make|f1cdd956184a6d1373f8b82421c20f4644b303c29888d30c0dfceb3f5ec2a261
0.355 [DEBUG]   vcpkg_copy_pdbs|d57e4f196c82dc562a9968c6155073094513c31e2de475694143d3aa47954b1c
0.355 [DEBUG]   vcpkg_download_distfile|2d57e1336ae9daab2f04c0623217094b026080d19bdca3a92396d68ea3e729c7
0.355 [DEBUG]   vcpkg_extract_source_archive|9c733832f8b58b05e6c329ae8b6ad1cfa858224fdc06d4a2d08b428e31de1a51
0.355 [DEBUG]   vcpkg_fixup_pkgconfig|904e67c46ecbb67379911bc1d7222855c0cbfcf1129bf47783858bcf0cc44970
0.355 [DEBUG]   vcpkg_install_copyright|ba6c169ab4e59fa05682e530cdeb883767de22c8391f023d4e6844a7ec5dd3d2
0.355 [DEBUG]   vcpkg_install_make|8d8145837ce718ef60778b50fea1af272146c9efa42367ec2d7726332ef29ab5
0.355 [DEBUG]   vcpkg_list|f5de3ebcbc40a4db90622ade9aca918e2cf404dc0d91342fcde457d730e6fa29
0.355 [DEBUG]   vcpkg_replace_string|d43c8699ce27e25d47367c970d1c546f6bc36b6df8fb0be0c3986eb5830bd4f1
0.355 [DEBUG] </abientries>
0.355 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/expat/324f8ee85bcf8dc7f2c8969d3d0f2af4d78be9a2/vcpkg.json
0.355 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/expat/324f8ee85bcf8dc7f2c8969d3d0f2af4d78be9a2/vcpkg.json has hash 24f48baa7e32b3278948c5c4d4d93ce8c3964bbb5c21347c96b0fe0c0763aeeb
0.356 [DEBUG] <abientries for expat:arm64-linux>
0.356 [DEBUG]   cmake|0
0.356 [DEBUG]   features|core
0.356 [DEBUG]   portfile.cmake|5d67738724feb2f7df9025022da5f816269a44571e54c0c791f8777fa332fffa
0.356 [DEBUG]   ports.cmake|0500e9e2422fe0084c99bdd0c9de4c7069b76da14c8b58228a7e95ebac43058a
0.356 [DEBUG]   post_build_checks|2
0.356 [DEBUG]   triplet|arm64-linux
0.356 [DEBUG]   triplet_abi|d527954d09db3c078a2fd5dfa6c2f819966e0712b5d736aa53cacc0904618636-6a6f507940899e930a3464a83b1bca17ae1e41eb4cbad2f515d97b95b5508de0-1d43c82f51082f8427993d1dac28c7cb4e3749af
0.356 [DEBUG]   vcpkg-cmake|e0e943acf7034eae4eaec26ef94bd103dc8797a7e5b8b72d7fdeb853812b9d6f
0.356 [DEBUG]   vcpkg-cmake-config|bac60fd92d5d37c30a852f1f567cd94373ec0f08dd929bda9d4a8e50b400e8ad
0.356 [DEBUG]   vcpkg-cmake-wrapper.cmake|0d357034611e2487496d7a296f87d16e37ac03fd3590b2421ea0a976b50f3241
0.356 [DEBUG]   vcpkg.json|24f48baa7e32b3278948c5c4d4d93ce8c3964bbb5c21347c96b0fe0c0763aeeb
0.356 [DEBUG]   vcpkg_copy_pdbs|d57e4f196c82dc562a9968c6155073094513c31e2de475694143d3aa47954b1c
0.356 [DEBUG]   vcpkg_fixup_pkgconfig|904e67c46ecbb67379911bc1d7222855c0cbfcf1129bf47783858bcf0cc44970
0.356 [DEBUG]   vcpkg_from_git|96ed81968f76354c00096dd8cd4e63c6a235fa969334a11ab18d11c0c512ff58
0.356 [DEBUG]   vcpkg_from_github|b743742296a114ea1b18ae99672e02f142c4eb2bef7f57d36c038bedbfb0502f
0.356 [DEBUG]   vcpkg_replace_string|d43c8699ce27e25d47367c970d1c546f6bc36b6df8fb0be0c3986eb5830bd4f1
0.356 [DEBUG] </abientries>
0.356 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/bzip2/92e9a8bbf1abbd89872b48ad82fcf75852de1006/CMakeLists.txt
0.356 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/bzip2/92e9a8bbf1abbd89872b48ad82fcf75852de1006/CMakeLists.txt has hash 8935f858d0308fccf551559696797f36170e1404eefbb0bbb60f255e296d10e3
0.356 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/bzip2/92e9a8bbf1abbd89872b48ad82fcf75852de1006/bzip2.pc.in
0.356 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/bzip2/92e9a8bbf1abbd89872b48ad82fcf75852de1006/bzip2.pc.in has hash bba1241c5dd9e86e9dc81915816edc32bd32bcef148715372b82ed62838ea740
0.356 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/bzip2/92e9a8bbf1abbd89872b48ad82fcf75852de1006/fix-import-export-macros.patch
0.356 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/bzip2/92e9a8bbf1abbd89872b48ad82fcf75852de1006/fix-import-export-macros.patch has hash 38918c1257c884cc5cde39d9f4235d0e71574f20c7e5ec686a506612f647495e
0.356 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/bzip2/92e9a8bbf1abbd89872b48ad82fcf75852de1006/usage
0.356 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/bzip2/92e9a8bbf1abbd89872b48ad82fcf75852de1006/usage has hash 75d339011fc11a43ee5093142ca1e8cb5e54db2ac93822abc5de694cda5a9881
0.356 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/bzip2/92e9a8bbf1abbd89872b48ad82fcf75852de1006/vcpkg.json
0.356 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/bzip2/92e9a8bbf1abbd89872b48ad82fcf75852de1006/vcpkg.json has hash 96594ea06b5c6bc85d1e041e80d1f2988c08ecb92ec05d9df888a1f22fad8427
0.356 [DEBUG] <abientries for bzip2:arm64-linux>
0.356 [DEBUG]   CMakeLists.txt|8935f858d0308fccf551559696797f36170e1404eefbb0bbb60f255e296d10e3
0.356 [DEBUG]   bzip2.pc.in|bba1241c5dd9e86e9dc81915816edc32bd32bcef148715372b82ed62838ea740
0.356 [DEBUG]   cmake|0
0.356 [DEBUG]   features|core;tool
0.356 [DEBUG]   fix-import-export-macros.patch|38918c1257c884cc5cde39d9f4235d0e71574f20c7e5ec686a506612f647495e
0.356 [DEBUG]   portfile.cmake|0581cada7dfe9bfac7e24badd7543b0593350727c3f2242faf80212ec37fce03
0.356 [DEBUG]   ports.cmake|0500e9e2422fe0084c99bdd0c9de4c7069b76da14c8b58228a7e95ebac43058a
0.356 [DEBUG]   post_build_checks|2
0.356 [DEBUG]   triplet|arm64-linux
0.356 [DEBUG]   triplet_abi|d527954d09db3c078a2fd5dfa6c2f819966e0712b5d736aa53cacc0904618636-6a6f507940899e930a3464a83b1bca17ae1e41eb4cbad2f515d97b95b5508de0-1d43c82f51082f8427993d1dac28c7cb4e3749af
0.356 [DEBUG]   usage|75d339011fc11a43ee5093142ca1e8cb5e54db2ac93822abc5de694cda5a9881
0.356 [DEBUG]   vcpkg-cmake|e0e943acf7034eae4eaec26ef94bd103dc8797a7e5b8b72d7fdeb853812b9d6f
0.356 [DEBUG]   vcpkg.json|96594ea06b5c6bc85d1e041e80d1f2988c08ecb92ec05d9df888a1f22fad8427
0.356 [DEBUG]   vcpkg_check_features|943b217e0968d64cf2cb9c272608e6a0b497377e792034f819809a79e1502c2b
0.356 [DEBUG]   vcpkg_copy_pdbs|d57e4f196c82dc562a9968c6155073094513c31e2de475694143d3aa47954b1c
0.356 [DEBUG]   vcpkg_download_distfile|2d57e1336ae9daab2f04c0623217094b026080d19bdca3a92396d68ea3e729c7
0.356 [DEBUG]   vcpkg_extract_source_archive|9c733832f8b58b05e6c329ae8b6ad1cfa858224fdc06d4a2d08b428e31de1a51
0.356 [DEBUG]   vcpkg_fixup_pkgconfig|904e67c46ecbb67379911bc1d7222855c0cbfcf1129bf47783858bcf0cc44970
0.356 [DEBUG]   vcpkg_install_copyright|ba6c169ab4e59fa05682e530cdeb883767de22c8391f023d4e6844a7ec5dd3d2
0.356 [DEBUG] </abientries>
0.356 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0001-only-build-required-projects.patch
0.356 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0001-only-build-required-projects.patch has hash 4ce19b98209704fcf5757a111c5566c74bb620e3662e299c627115dbde6cbc80
0.356 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0002-static-library.patch
0.356 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0002-static-library.patch has hash 6a96072e268a9d1ee9fc9c10e8b159c1d66da0f73d9b0ec2eb60280df417c7f0
0.356 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0003-use-vcpkg-zlib.patch
0.356 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0003-use-vcpkg-zlib.patch has hash 55e074a7d0a98000329442c654a52073370335d2fd65e84969b141a7dd69b56f
0.356 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0004-devendor-external-dependencies.patch
0.357 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0004-devendor-external-dependencies.patch has hash b6b2a283fb925846493e1a93892c7e24320afa0b05264cd8bbafa18043c6a8bd
0.357 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0005-dont-copy-vcruntime.patch
0.357 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0005-dont-copy-vcruntime.patch has hash db486fc1ae20b92c3e6cf1ab9895c742f71829f06563d5f93a10f4a62d6de9f8
0.357 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0006-restore-support-for-windows-7.patch
0.357 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0006-restore-support-for-windows-7.patch has hash d04cc3c08aa37e35b89b7b1d0d6bd9ec1e9944bf1a7389ef9e997611103ba6ed
0.357 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0007-workaround-windows-11-sdk-rc-compiler-error.patch
0.357 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0007-workaround-windows-11-sdk-rc-compiler-error.patch has hash d6897de404e49bbe8ea44d424e0de79414d4581f748839dcb21d5b3e1673f93f
0.357 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0008-python.pc.patch
0.357 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0008-python.pc.patch has hash e69ed4ed7820aaca0b3521ffe9b2a30a2b7d2f1d07fd5854219ae3b3a1919cc0
0.357 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0010-dont-skip-rpath.patch
0.357 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0010-dont-skip-rpath.patch has hash 661126c9428870764c46e34bf5ef22764bc74bb589e84871c1abfcbd09aad952
0.357 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0011-gcc-ldflags-fix.patch
0.357 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0011-gcc-ldflags-fix.patch has hash 5e91ccb501122cf8ab24b1dc815f7c8e2690863410194470647874161275e40e
0.357 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0012-force-disable-modules.patch
0.357 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0012-force-disable-modules.patch has hash 719b53f310e2326ea6996351a621b6da618bff884bebf9a74cf5fb871d6e122b
0.357 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0014-fix-get-python-inc-output.patch
0.357 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0014-fix-get-python-inc-output.patch has hash 7cb7651c2dea5ff210bcd535ca1224cfd7dbd2b3ebbe036f8d07d8435bf146d2
0.357 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0015-dont-use-WINDOWS-def.patch
0.357 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0015-dont-use-WINDOWS-def.patch has hash cd17b447c5c0d8429f71b933c83d19af2b7ccaa31e3872b4cf1c12f38487de7c
0.357 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0016-fix-win-cross.patch
0.357 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0016-fix-win-cross.patch has hash 6ee04a3ea68b5d6c6cd159c9713090215c8f75b835ac78faaf852dbc74958053
0.357 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0016-undup-ffi-symbols.patch
0.357 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0016-undup-ffi-symbols.patch has hash 0801ac416a1ae03e8f0c4a6525219959e2c03f2303682af70b2dcee7064cad90
0.357 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0017-fix-win.patch
0.357 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0017-fix-win.patch has hash ef3c567892facd9ccbb85a29d097fb4669ac895c6f83c20023f98f30d66dbebd
0.357 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0018-fix-sysconfig-include.patch
0.357 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/0018-fix-sysconfig-include.patch has hash 7615eca04bc9e430920bf7c0b4d22d1bf13f9b126c8e2b747bf59fb8a2e32a99
0.357 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/openssl.props.in
0.357 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/openssl.props.in has hash d6b605a92b23a860d1458e93c3afb0996522788016b1b87b6070200c3da97b73
0.357 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/python_vcpkg.props.in
0.357 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/python_vcpkg.props.in has hash b7e381b7c64cb23e01e47087efcadf2ecf09921b7c673cecb61049951bf211ed
0.357 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/usage
0.357 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/usage has hash 7170b22769431551b91143290c26efb60821c82eacc90bdcfea69c9fbc6bf50a
0.357 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/usage.unix
0.358 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/usage.unix has hash 5cc266b3155ece3c71ba83fead8397395aabed660a07a725660d46c3dc45ef0f
0.358 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/usage.win
0.358 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/usage.win has hash 376018bf9b600e17d4c469cdc97322b6376d8e10c4fc1afa1697d8b7533b8284
0.358 [DEBUG] Trying to hash /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/vcpkg.json
0.358 [DEBUG] /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/vcpkg.json has hash 2b84fc9ab950b7784679f41ee18c0145e3c63dcb6f530bf4b97b288b613c82a9
0.359 [DEBUG] <abientries for python3:arm64-linux>
0.359 [DEBUG]   0001-only-build-required-projects.patch|4ce19b98209704fcf5757a111c5566c74bb620e3662e299c627115dbde6cbc80
0.359 [DEBUG]   0002-static-library.patch|6a96072e268a9d1ee9fc9c10e8b159c1d66da0f73d9b0ec2eb60280df417c7f0
0.359 [DEBUG]   0003-use-vcpkg-zlib.patch|55e074a7d0a98000329442c654a52073370335d2fd65e84969b141a7dd69b56f
0.359 [DEBUG]   0004-devendor-external-dependencies.patch|b6b2a283fb925846493e1a93892c7e24320afa0b05264cd8bbafa18043c6a8bd
0.359 [DEBUG]   0005-dont-copy-vcruntime.patch|db486fc1ae20b92c3e6cf1ab9895c742f71829f06563d5f93a10f4a62d6de9f8
0.359 [DEBUG]   0006-restore-support-for-windows-7.patch|d04cc3c08aa37e35b89b7b1d0d6bd9ec1e9944bf1a7389ef9e997611103ba6ed
0.359 [DEBUG]   0007-workaround-windows-11-sdk-rc-compiler-error.patch|d6897de404e49bbe8ea44d424e0de79414d4581f748839dcb21d5b3e1673f93f
0.359 [DEBUG]   0008-python.pc.patch|e69ed4ed7820aaca0b3521ffe9b2a30a2b7d2f1d07fd5854219ae3b3a1919cc0
0.359 [DEBUG]   0010-dont-skip-rpath.patch|661126c9428870764c46e34bf5ef22764bc74bb589e84871c1abfcbd09aad952
0.359 [DEBUG]   0011-gcc-ldflags-fix.patch|5e91ccb501122cf8ab24b1dc815f7c8e2690863410194470647874161275e40e
0.359 [DEBUG]   0012-force-disable-modules.patch|719b53f310e2326ea6996351a621b6da618bff884bebf9a74cf5fb871d6e122b
0.359 [DEBUG]   0014-fix-get-python-inc-output.patch|7cb7651c2dea5ff210bcd535ca1224cfd7dbd2b3ebbe036f8d07d8435bf146d2
0.359 [DEBUG]   0015-dont-use-WINDOWS-def.patch|cd17b447c5c0d8429f71b933c83d19af2b7ccaa31e3872b4cf1c12f38487de7c
0.359 [DEBUG]   0016-fix-win-cross.patch|6ee04a3ea68b5d6c6cd159c9713090215c8f75b835ac78faaf852dbc74958053
0.359 [DEBUG]   0016-undup-ffi-symbols.patch|0801ac416a1ae03e8f0c4a6525219959e2c03f2303682af70b2dcee7064cad90
0.359 [DEBUG]   0017-fix-win.patch|ef3c567892facd9ccbb85a29d097fb4669ac895c6f83c20023f98f30d66dbebd
0.359 [DEBUG]   0018-fix-sysconfig-include.patch|7615eca04bc9e430920bf7c0b4d22d1bf13f9b126c8e2b747bf59fb8a2e32a99
0.359 [DEBUG]   bzip2|7d3d78d648f58bfddacac2b9eef84ec3f548f9788bdeb36590223ea8bf218fe9
0.359 [DEBUG]   cmake|0
0.359 [DEBUG]   expat|1b5ef1045f2acbe44b73d4bc02a45cd6d9e503345e7e7972e49f62c2daf22156
0.359 [DEBUG]   features|core
0.359 [DEBUG]   libffi|695967178e5807bd0cbd26206c0e468d5fee15f43f7c28826808d25878a593ac
0.359 [DEBUG]   liblzma|2103e649593adae2eb0a8b0346080361a55828235c5df0b83ff889a1928209ea
0.359 [DEBUG]   libuuid|89d8817d9488fad5297d5a057fb02909a37388fc74e55e0d84050ce0cb917609
0.359 [DEBUG]   openssl|dae1bd192cfea793ec0086214c1aaef4078e901de783c29ec4ab443de0503747
0.359 [DEBUG]   openssl.props.in|d6b605a92b23a860d1458e93c3afb0996522788016b1b87b6070200c3da97b73
0.359 [DEBUG]   portfile.cmake|24bdecd2a6058da0fcb200fbaa05d3432cb059e06ddcd59741045165c75bc3d5
0.359 [DEBUG]   ports.cmake|0500e9e2422fe0084c99bdd0c9de4c7069b76da14c8b58228a7e95ebac43058a
0.359 [DEBUG]   post_build_checks|2
0.359 [DEBUG]   python_vcpkg.props.in|b7e381b7c64cb23e01e47087efcadf2ecf09921b7c673cecb61049951bf211ed
0.359 [DEBUG]   sqlite3|987e145835b6809c096eb0bf08c01e175ccef5f6dd0ad8c7bb3850dab69e0bf4
0.359 [DEBUG]   triplet|arm64-linux
0.359 [DEBUG]   triplet_abi|d527954d09db3c078a2fd5dfa6c2f819966e0712b5d736aa53cacc0904618636-6a6f507940899e930a3464a83b1bca17ae1e41eb4cbad2f515d97b95b5508de0-1d43c82f51082f8427993d1dac28c7cb4e3749af
0.359 [DEBUG]   usage|7170b22769431551b91143290c26efb60821c82eacc90bdcfea69c9fbc6bf50a
0.359 [DEBUG]   usage.unix|5cc266b3155ece3c71ba83fead8397395aabed660a07a725660d46c3dc45ef0f
0.359 [DEBUG]   usage.win|376018bf9b600e17d4c469cdc97322b6376d8e10c4fc1afa1697d8b7533b8284
0.359 [DEBUG]   vcpkg-cmake-wrapper.cmake|963ced7f4371d1ddb0b621130859c0bbfa782016e4b6a674e771b75dfad72e6c
0.359 [DEBUG]   vcpkg-port-config.cmake|414a304375b7e8cc7c4eb38e3b5cfd03fd6e77d57e58b37884129430912e2076
0.359 [DEBUG]   vcpkg.json|2b84fc9ab950b7784679f41ee18c0145e3c63dcb6f530bf4b97b288b613c82a9
0.359 [DEBUG]   vcpkg_add_to_path|5f5ae75cf37b2a58d1a8561ca96496b64cd91ec9a0afab0b976c3e5d59030bfe
0.359 [DEBUG]   vcpkg_configure_make|f1cdd956184a6d1373f8b82421c20f4644b303c29888d30c0dfceb3f5ec2a261
0.359 [DEBUG]   vcpkg_copy_tool_dependencies|66eef4116a52fd8cba76d274f44904846df943a3fc52317871cf255733b2efc4
0.359 [DEBUG]   vcpkg_copy_tools|3d45ff761bddbabe8923b52330168dc3abd295fa469d3f2e47cb14dce85332d5
0.359 [DEBUG]   vcpkg_find_acquire_program|96d9ee675798a3bddb54340d404b814be45a35c624b2eab5465cd45eaf18b6d3
0.359 [DEBUG]   vcpkg_find_acquire_program(PYTHON3)|0befaba75a19d486f5713c0d59fc1c700bbeb4ef479ee9bfe62d7f6a37a5f7a1
0.359 [DEBUG]   vcpkg_fixup_pkgconfig|904e67c46ecbb67379911bc1d7222855c0cbfcf1129bf47783858bcf0cc44970
0.359 [DEBUG]   vcpkg_from_git|96ed81968f76354c00096dd8cd4e63c6a235fa969334a11ab18d11c0c512ff58
0.359 [DEBUG]   vcpkg_from_github|b743742296a114ea1b18ae99672e02f142c4eb2bef7f57d36c038bedbfb0502f
0.359 [DEBUG]   vcpkg_get_windows_sdk|9fe97b3807d78c81b54b9512e920112baf68c2b4f5ce483b2764edada074b4ec
0.359 [DEBUG]   vcpkg_install_copyright|ba6c169ab4e59fa05682e530cdeb883767de22c8391f023d4e6844a7ec5dd3d2
0.359 [DEBUG]   vcpkg_install_make|8d8145837ce718ef60778b50fea1af272146c9efa42367ec2d7726332ef29ab5
0.359 [DEBUG]   vcpkg_replace_string|d43c8699ce27e25d47367c970d1c546f6bc36b6df8fb0be0c3986eb5830bd4f1
0.359 [DEBUG]   zlib|dc7ad2d6fc29f3b231835cb630b38130b66247107dda08f76bdc4d650203f0f9
0.359 [DEBUG] </abientries>
0.359 The following packages will be built and installed:
0.359   * bzip2[core,tool]:arm64-linux@1.0.8#5 -- /example/vcpkg/buildtrees/versioning_/versions/bzip2/92e9a8bbf1abbd89872b48ad82fcf75852de1006
0.359   * expat:arm64-linux@2.6.0 -- /example/vcpkg/buildtrees/versioning_/versions/expat/324f8ee85bcf8dc7f2c8969d3d0f2af4d78be9a2
0.359   * libffi:arm64-linux@3.4.6 -- /example/vcpkg/buildtrees/versioning_/versions/libffi/0ad381012102db5da196161ba7fc0a03a4dcb982
0.359   * liblzma:arm64-linux@5.4.4 -- /example/vcpkg/buildtrees/versioning_/versions/liblzma/f285b7c4ffa2cc065c7c6fec4b61006f7fa2714e
0.359   * libuuid:arm64-linux@1.0.3#14 -- /example/vcpkg/buildtrees/versioning_/versions/libuuid/09be6774f518692bc418aa03623cc9dbc19e6516
0.359   * openssl:arm64-linux@3.2.1 -- /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d
0.359     python3:arm64-linux@3.11.8 -- /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41
0.359   * sqlite3[core,json1]:arm64-linux@3.45.1#1 -- /example/vcpkg/buildtrees/versioning_/versions/sqlite3/4e2ae6bc4849b52c6cd2e2d51c110f69ac3901d0
0.359   * vcpkg-cmake:arm64-linux@2023-05-04 -- /example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake/88a7058fc7fa73a9c4c99cfcae9d79e2abf87a5a
0.359   * vcpkg-cmake-config:arm64-linux@2022-02-06#1 -- /example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake-config/8d54cc4f487d51b655abec5f9c9c3f86ca83311f
0.359   * vcpkg-cmake-get-vars:arm64-linux@2023-12-31 -- /example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake-get-vars/725c841810ceb8de33da68ea879eb8f0b4d6c94c
0.359   * zlib:arm64-linux@1.3.1 -- /example/vcpkg/buildtrees/versioning_/versions/zlib/3f05e04b9aededb96786a911a16193cdb711f0c9
0.359 Additional packages (*) will be modified to complete this operation.
0.359 [DEBUG] Default binary cache path is: /root/.cache/vcpkg/archives
0.359 Restored 0 package(s) from /root/.cache/vcpkg/archives in 21.5 us. Use --debug to see more details.
0.359 Installing 1/12 vcpkg-cmake:arm64-linux@2023-05-04...
0.359 Building vcpkg-cmake:arm64-linux@2023-05-04...
0.359 warning: -- Using community triplet arm64-linux. This triplet configuration is not guaranteed to succeed.
0.359 -- [COMMUNITY] Loading triplet configuration from: /example/vcpkg/triplets/community/arm64-linux.cmake
0.359 -- Installing port from location: /example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake/88a7058fc7fa73a9c4c99cfcae9d79e2abf87a5a
0.360 [DEBUG] 1019: execute_process(GIT_CEILING_DIRECTORIES=/example/vcpkg/buildtrees  /usr/bin/cmake -DALL_FEATURES= -DCURRENT_PORT_DIR=/example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake/88a7058fc7fa73a9c4c99cfcae9d79e2abf87a5a -D_HOST_TRIPLET=arm64-linux -DFEATURES=core -DPORT=vcpkg-cmake -DVERSION=2023-05-04 -DVCPKG_USE_HEAD_VERSION=0 -D_VCPKG_DOWNLOAD_TOOL=BUILT_IN -D_VCPKG_EDITABLE=0 -D_VCPKG_NO_DOWNLOADS=0 -DZ_VCPKG_CHAINLOAD_TOOLCHAIN_FILE=/example/vcpkg/scripts/toolchains/linux.cmake -DCMD=BUILD -DDOWNLOADS=/example/vcpkg/downloads -DTARGET_TRIPLET=arm64-linux -DTARGET_TRIPLET_FILE=/example/vcpkg/triplets/community/arm64-linux.cmake -DVCPKG_BASE_VERSION=2999-12-31 -DVCPKG_CONCURRENCY=9 -DVCPKG_PLATFORM_TOOLSET=external -DGIT=/usr/bin/git -DVCPKG_ROOT_DIR=/example/vcpkg -DPACKAGES_DIR=/example/vcpkg/packages -DBUILDTREES_DIR=/example/vcpkg/buildtrees -D_VCPKG_INSTALLED_DIR=/example/build/vcpkg_installed/ -DDOWNLOADS=/example/vcpkg/downloads -DVCPKG_MANIFEST_INSTALL=OFF -P /example/vcpkg/scripts/ports.cmake)
0.368 -- Installing: /example/vcpkg/packages/vcpkg-cmake_arm64-linux/share/vcpkg-cmake/vcpkg_cmake_configure.cmake
0.368 -- Installing: /example/vcpkg/packages/vcpkg-cmake_arm64-linux/share/vcpkg-cmake/vcpkg_cmake_build.cmake
0.369 -- Installing: /example/vcpkg/packages/vcpkg-cmake_arm64-linux/share/vcpkg-cmake/vcpkg_cmake_install.cmake
0.369 -- Installing: /example/vcpkg/packages/vcpkg-cmake_arm64-linux/share/vcpkg-cmake/vcpkg-port-config.cmake
0.369 -- Installing: /example/vcpkg/packages/vcpkg-cmake_arm64-linux/share/vcpkg-cmake/copyright
0.370 [DEBUG] 1019: cmd_execute_and_stream_data() returned 0 after     9858 us
0.370 -- Performing post-build validation
0.370 [DEBUG] 1020: execute_process(cd /example/vcpkg/packages/vcpkg-cmake_arm64-linux && zip --quiet -y -r /example/vcpkg/packages/vcpkg-cmake_arm64-linux.zip * --exclude .DS_Store)
0.372 [DEBUG] 1020: cmd_execute_and_stream_data() returned 0 after     1520 us
0.372 Stored binaries in 1 destinations in 1.74 ms.
0.372 Elapsed time to handle vcpkg-cmake:arm64-linux: 12.8 ms
0.372 vcpkg-cmake:arm64-linux package ABI: e0e943acf7034eae4eaec26ef94bd103dc8797a7e5b8b72d7fdeb853812b9d6f
0.372 Installing 2/12 zlib:arm64-linux@1.3.1...
0.372 Building zlib:arm64-linux@1.3.1...
0.372 warning: -- Using community triplet arm64-linux. This triplet configuration is not guaranteed to succeed.
0.372 -- [COMMUNITY] Loading triplet configuration from: /example/vcpkg/triplets/community/arm64-linux.cmake
0.372 -- Installing port from location: /example/vcpkg/buildtrees/versioning_/versions/zlib/3f05e04b9aededb96786a911a16193cdb711f0c9
0.372 [DEBUG] 1021: execute_process(GIT_CEILING_DIRECTORIES=/example/vcpkg/buildtrees  /usr/bin/cmake -DALL_FEATURES= -DCURRENT_PORT_DIR=/example/vcpkg/buildtrees/versioning_/versions/zlib/3f05e04b9aededb96786a911a16193cdb711f0c9 -D_HOST_TRIPLET=arm64-linux -DFEATURES=core -DPORT=zlib -DVERSION=1.3.1 -DVCPKG_USE_HEAD_VERSION=0 -D_VCPKG_DOWNLOAD_TOOL=BUILT_IN -D_VCPKG_EDITABLE=0 -D_VCPKG_NO_DOWNLOADS=0 -DZ_VCPKG_CHAINLOAD_TOOLCHAIN_FILE=/example/vcpkg/scripts/toolchains/linux.cmake -DCMD=BUILD -DDOWNLOADS=/example/vcpkg/downloads -DTARGET_TRIPLET=arm64-linux -DTARGET_TRIPLET_FILE=/example/vcpkg/triplets/community/arm64-linux.cmake -DVCPKG_BASE_VERSION=2999-12-31 -DVCPKG_CONCURRENCY=9 -DVCPKG_PLATFORM_TOOLSET=external -DGIT=/usr/bin/git -DVCPKG_PORT_CONFIGS=/example/build/vcpkg_installed/arm64-linux/share/vcpkg-cmake/vcpkg-port-config.cmake -DVCPKG_ROOT_DIR=/example/vcpkg -DPACKAGES_DIR=/example/vcpkg/packages -DBUILDTREES_DIR=/example/vcpkg/buildtrees -D_VCPKG_INSTALLED_DIR=/example/build/vcpkg_installed/ -DDOWNLOADS=/example/vcpkg/downloads -DVCPKG_MANIFEST_INSTALL=OFF -P /example/vcpkg/scripts/ports.cmake)
0.381 -- Downloading https://github.com/madler/zlib/archive/v1.3.1.tar.gz -> madler-zlib-v1.3.1.tar.gz...
2.121 -- Extracting source /example/vcpkg/downloads/madler-zlib-v1.3.1.tar.gz
2.144 -- Applying patch 0001-Prevent-invalid-inclusions-when-HAVE_-is-set-to-0.patch
2.145 -- Applying patch 0002-build-static-or-shared-not-both.patch
2.146 -- Applying patch 0003-android-and-mingw-fixes.patch
2.147 -- Using source at /example/vcpkg/buildtrees/zlib/src/v1.3.1-2e5db616bf.clean
2.149 -- Configuring arm64-linux
2.416 -- Building arm64-linux-dbg
2.547 -- Building arm64-linux-rel
2.962 -- Installing: /example/vcpkg/packages/zlib_arm64-linux/share/zlib/vcpkg-cmake-wrapper.cmake
2.963 -- Fixing pkgconfig file: /example/vcpkg/packages/zlib_arm64-linux/lib/pkgconfig/zlib.pc
2.966 -- Fixing pkgconfig file: /example/vcpkg/packages/zlib_arm64-linux/debug/lib/pkgconfig/zlib.pc
2.967 -- Installing: /example/vcpkg/packages/zlib_arm64-linux/share/zlib/copyright
2.968 -- Downloading https://github.com/NixOS/patchelf/releases/download/0.14.5/patchelf-0.14.5-aarch64.tar.gz -> patchelf-0.14.5-aarch64.tar.gz...
4.123 [DEBUG] 1021: cmd_execute_and_stream_data() returned 0 after  3750854 us
4.124 -- Performing post-build validation
4.126 [DEBUG] 1022: execute_process(cd /example/vcpkg/packages/zlib_arm64-linux && zip --quiet -y -r /example/vcpkg/packages/zlib_arm64-linux.zip * --exclude .DS_Store)
4.160 [DEBUG] 1022: cmd_execute_and_stream_data() returned 0 after    33972 us
4.160 Stored binaries in 1 destinations in 34.2 ms.
4.160 Elapsed time to handle zlib:arm64-linux: 3.8 s
4.160 zlib:arm64-linux package ABI: dc7ad2d6fc29f3b231835cb630b38130b66247107dda08f76bdc4d650203f0f9
4.160 Installing 3/12 vcpkg-cmake-config:arm64-linux@2022-02-06#1...
4.160 Building vcpkg-cmake-config:arm64-linux@2022-02-06#1...
4.160 warning: -- Using community triplet arm64-linux. This triplet configuration is not guaranteed to succeed.
4.160 -- [COMMUNITY] Loading triplet configuration from: /example/vcpkg/triplets/community/arm64-linux.cmake
4.160 -- Installing port from location: /example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake-config/8d54cc4f487d51b655abec5f9c9c3f86ca83311f
4.160 [DEBUG] 1023: execute_process(GIT_CEILING_DIRECTORIES=/example/vcpkg/buildtrees  /usr/bin/cmake -DALL_FEATURES= -DCURRENT_PORT_DIR=/example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake-config/8d54cc4f487d51b655abec5f9c9c3f86ca83311f -D_HOST_TRIPLET=arm64-linux -DFEATURES=core -DPORT=vcpkg-cmake-config -DVERSION=2022-02-06 -DVCPKG_USE_HEAD_VERSION=0 -D_VCPKG_DOWNLOAD_TOOL=BUILT_IN -D_VCPKG_EDITABLE=0 -D_VCPKG_NO_DOWNLOADS=0 -DZ_VCPKG_CHAINLOAD_TOOLCHAIN_FILE=/example/vcpkg/scripts/toolchains/linux.cmake -DCMD=BUILD -DDOWNLOADS=/example/vcpkg/downloads -DTARGET_TRIPLET=arm64-linux -DTARGET_TRIPLET_FILE=/example/vcpkg/triplets/community/arm64-linux.cmake -DVCPKG_BASE_VERSION=2999-12-31 -DVCPKG_CONCURRENCY=9 -DVCPKG_PLATFORM_TOOLSET=external -DGIT=/usr/bin/git -DVCPKG_ROOT_DIR=/example/vcpkg -DPACKAGES_DIR=/example/vcpkg/packages -DBUILDTREES_DIR=/example/vcpkg/buildtrees -D_VCPKG_INSTALLED_DIR=/example/build/vcpkg_installed/ -DDOWNLOADS=/example/vcpkg/downloads -DVCPKG_MANIFEST_INSTALL=OFF -P /example/vcpkg/scripts/ports.cmake)
4.169 -- Installing: /example/vcpkg/packages/vcpkg-cmake-config_arm64-linux/share/vcpkg-cmake-config/vcpkg_cmake_config_fixup.cmake
4.169 -- Installing: /example/vcpkg/packages/vcpkg-cmake-config_arm64-linux/share/vcpkg-cmake-config/vcpkg-port-config.cmake
4.169 -- Installing: /example/vcpkg/packages/vcpkg-cmake-config_arm64-linux/share/vcpkg-cmake-config/copyright
4.170 [DEBUG] 1023: cmd_execute_and_stream_data() returned 0 after     9939 us
4.170 -- Performing post-build validation
4.171 [DEBUG] 1024: execute_process(cd /example/vcpkg/packages/vcpkg-cmake-config_arm64-linux && zip --quiet -y -r /example/vcpkg/packages/vcpkg-cmake-config_arm64-linux.zip * --exclude .DS_Store)
4.172 [DEBUG] 1024: cmd_execute_and_stream_data() returned 0 after     1307 us
4.172 Stored binaries in 1 destinations in 1.4 ms.
4.172 Elapsed time to handle vcpkg-cmake-config:arm64-linux: 12 ms
4.172 vcpkg-cmake-config:arm64-linux package ABI: bac60fd92d5d37c30a852f1f567cd94373ec0f08dd929bda9d4a8e50b400e8ad
4.172 Installing 4/12 sqlite3[core,json1]:arm64-linux@3.45.1#1...
4.172 Building sqlite3[core,json1]:arm64-linux@3.45.1#1...
4.172 warning: -- Using community triplet arm64-linux. This triplet configuration is not guaranteed to succeed.
4.172 -- [COMMUNITY] Loading triplet configuration from: /example/vcpkg/triplets/community/arm64-linux.cmake
4.172 -- Installing port from location: /example/vcpkg/buildtrees/versioning_/versions/sqlite3/4e2ae6bc4849b52c6cd2e2d51c110f69ac3901d0
4.172 [DEBUG] 1025: execute_process(GIT_CEILING_DIRECTORIES=/example/vcpkg/buildtrees  /usr/bin/cmake "-DALL_FEATURES=dbstat;fts3;fts4;fts5;geopoly;json1;limit;math;memsys3;memsys5;omit-load-extension;rtree;session;snapshot;soundex;tool;zlib;" -DCURRENT_PORT_DIR=/example/vcpkg/buildtrees/versioning_/versions/sqlite3/4e2ae6bc4849b52c6cd2e2d51c110f69ac3901d0 -D_HOST_TRIPLET=arm64-linux "-DFEATURES=core;json1" -DPORT=sqlite3 -DVERSION=3.45.1 -DVCPKG_USE_HEAD_VERSION=0 -D_VCPKG_DOWNLOAD_TOOL=BUILT_IN -D_VCPKG_EDITABLE=0 -D_VCPKG_NO_DOWNLOADS=0 -DZ_VCPKG_CHAINLOAD_TOOLCHAIN_FILE=/example/vcpkg/scripts/toolchains/linux.cmake -DCMD=BUILD -DDOWNLOADS=/example/vcpkg/downloads -DTARGET_TRIPLET=arm64-linux -DTARGET_TRIPLET_FILE=/example/vcpkg/triplets/community/arm64-linux.cmake -DVCPKG_BASE_VERSION=2999-12-31 -DVCPKG_CONCURRENCY=9 -DVCPKG_PLATFORM_TOOLSET=external -DGIT=/usr/bin/git "-DVCPKG_PORT_CONFIGS=/example/build/vcpkg_installed/arm64-linux/share/vcpkg-cmake/vcpkg-port-config.cmake;/example/build/vcpkg_installed/arm64-linux/share/vcpkg-cmake-config/vcpkg-port-config.cmake" -DVCPKG_ROOT_DIR=/example/vcpkg -DPACKAGES_DIR=/example/vcpkg/packages -DBUILDTREES_DIR=/example/vcpkg/buildtrees -D_VCPKG_INSTALLED_DIR=/example/build/vcpkg_installed/ -DDOWNLOADS=/example/vcpkg/downloads -DVCPKG_MANIFEST_INSTALL=OFF -P /example/vcpkg/scripts/ports.cmake)
4.181 -- Downloading https://sqlite.org/2024/sqlite-autoconf-3450100.tar.gz -> sqlite-autoconf-3450100.zip...
5.082 -- Extracting source /example/vcpkg/downloads/sqlite-autoconf-3450100.zip
5.119 -- Applying patch fix-arm-uwp.patch
5.122 -- Applying patch add-config-include.patch
5.150 -- Using source at /example/vcpkg/buildtrees/sqlite3/src/nf-3450100-45b7b49e8b.clean
5.153 -- Configuring arm64-linux
5.275 -- Building arm64-linux-dbg
8.689 -- Building arm64-linux-rel
26.86 -- Fixing pkgconfig file: /example/vcpkg/packages/sqlite3_arm64-linux/lib/pkgconfig/sqlite3.pc
26.86 -- Fixing pkgconfig file: /example/vcpkg/packages/sqlite3_arm64-linux/debug/lib/pkgconfig/sqlite3.pc
26.87 -- Installing: /example/vcpkg/packages/sqlite3_arm64-linux/share/sqlite3/usage
26.88 [DEBUG] 1025: cmd_execute_and_stream_data() returned 0 after 22704487 us
26.88 -- Performing post-build validation
26.88 [DEBUG] 1026: execute_process(cd /example/vcpkg/packages/sqlite3_arm64-linux && zip --quiet -y -r /example/vcpkg/packages/sqlite3_arm64-linux.zip * --exclude .DS_Store)
27.15 [DEBUG] 1026: cmd_execute_and_stream_data() returned 0 after   272785 us
27.15 Stored binaries in 1 destinations in 274 ms.
27.15 Elapsed time to handle sqlite3:arm64-linux: 23 s
27.15 sqlite3:arm64-linux package ABI: 987e145835b6809c096eb0bf08c01e175ccef5f6dd0ad8c7bb3850dab69e0bf4
27.15 Installing 5/12 vcpkg-cmake-get-vars:arm64-linux@2023-12-31...
27.15 Building vcpkg-cmake-get-vars:arm64-linux@2023-12-31...
27.15 warning: -- Using community triplet arm64-linux. This triplet configuration is not guaranteed to succeed.
27.15 -- [COMMUNITY] Loading triplet configuration from: /example/vcpkg/triplets/community/arm64-linux.cmake
27.15 -- Installing port from location: /example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake-get-vars/725c841810ceb8de33da68ea879eb8f0b4d6c94c
27.15 [DEBUG] 1027: execute_process(GIT_CEILING_DIRECTORIES=/example/vcpkg/buildtrees  /usr/bin/cmake -DALL_FEATURES= -DCURRENT_PORT_DIR=/example/vcpkg/buildtrees/versioning_/versions/vcpkg-cmake-get-vars/725c841810ceb8de33da68ea879eb8f0b4d6c94c -D_HOST_TRIPLET=arm64-linux -DFEATURES=core -DPORT=vcpkg-cmake-get-vars -DVERSION=2023-12-31 -DVCPKG_USE_HEAD_VERSION=0 -D_VCPKG_DOWNLOAD_TOOL=BUILT_IN -D_VCPKG_EDITABLE=0 -D_VCPKG_NO_DOWNLOADS=0 -DZ_VCPKG_CHAINLOAD_TOOLCHAIN_FILE=/example/vcpkg/scripts/toolchains/linux.cmake -DCMD=BUILD -DDOWNLOADS=/example/vcpkg/downloads -DTARGET_TRIPLET=arm64-linux -DTARGET_TRIPLET_FILE=/example/vcpkg/triplets/community/arm64-linux.cmake -DVCPKG_BASE_VERSION=2999-12-31 -DVCPKG_CONCURRENCY=9 -DVCPKG_PLATFORM_TOOLSET=external -DGIT=/usr/bin/git -DVCPKG_PORT_CONFIGS=/example/build/vcpkg_installed/arm64-linux/share/vcpkg-cmake/vcpkg-port-config.cmake -DVCPKG_ROOT_DIR=/example/vcpkg -DPACKAGES_DIR=/example/vcpkg/packages -DBUILDTREES_DIR=/example/vcpkg/buildtrees -D_VCPKG_INSTALLED_DIR=/example/build/vcpkg_installed/ -DDOWNLOADS=/example/vcpkg/downloads -DVCPKG_MANIFEST_INSTALL=OFF -P /example/vcpkg/scripts/ports.cmake)
27.16 -- Installing: /example/vcpkg/packages/vcpkg-cmake-get-vars_arm64-linux/share/vcpkg-cmake-get-vars/vcpkg_cmake_get_vars.cmake
27.16 -- Installing: /example/vcpkg/packages/vcpkg-cmake-get-vars_arm64-linux/share/vcpkg-cmake-get-vars/cmake_get_vars
27.16 -- Installing: /example/vcpkg/packages/vcpkg-cmake-get-vars_arm64-linux/share/vcpkg-cmake-get-vars/cmake_get_vars/CMakeLists.txt
27.16 -- Installing: /example/vcpkg/packages/vcpkg-cmake-get-vars_arm64-linux/share/vcpkg-cmake-get-vars/vcpkg-port-config.cmake
27.16 -- Installing: /example/vcpkg/packages/vcpkg-cmake-get-vars_arm64-linux/share/vcpkg-cmake-get-vars/copyright
27.16 [DEBUG] 1027: cmd_execute_and_stream_data() returned 0 after    10755 us
27.16 -- Performing post-build validation
27.17 [DEBUG] 1028: execute_process(cd /example/vcpkg/packages/vcpkg-cmake-get-vars_arm64-linux && zip --quiet -y -r /example/vcpkg/packages/vcpkg-cmake-get-vars_arm64-linux.zip * --exclude .DS_Store)
27.17 [DEBUG] 1028: cmd_execute_and_stream_data() returned 0 after     1290 us
27.17 Stored binaries in 1 destinations in 1.42 ms.
27.17 Elapsed time to handle vcpkg-cmake-get-vars:arm64-linux: 13.1 ms
27.17 vcpkg-cmake-get-vars:arm64-linux package ABI: 3d5562e6637d0053eb89fedc02a64c3ba8604a847674a031b7ed57a8a6c6c48f
27.17 Installing 6/12 openssl:arm64-linux@3.2.1...
27.17 Building openssl:arm64-linux@3.2.1...
27.17 warning: -- Using community triplet arm64-linux. This triplet configuration is not guaranteed to succeed.
27.17 -- [COMMUNITY] Loading triplet configuration from: /example/vcpkg/triplets/community/arm64-linux.cmake
27.17 -- Installing port from location: /example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d
27.17 [DEBUG] 1029: execute_process(GIT_CEILING_DIRECTORIES=/example/vcpkg/buildtrees  /usr/bin/cmake "-DALL_FEATURES=fips;ssl3;tools;weak-ssl-ciphers;" -DCURRENT_PORT_DIR=/example/vcpkg/buildtrees/versioning_/versions/openssl/53fb72a19981a3439cd569f58b722ca6cd26e23d -D_HOST_TRIPLET=arm64-linux -DFEATURES=core -DPORT=openssl -DVERSION=3.2.1 -DVCPKG_USE_HEAD_VERSION=0 -D_VCPKG_DOWNLOAD_TOOL=BUILT_IN -D_VCPKG_EDITABLE=0 -D_VCPKG_NO_DOWNLOADS=0 -DZ_VCPKG_CHAINLOAD_TOOLCHAIN_FILE=/example/vcpkg/scripts/toolchains/linux.cmake -DCMD=BUILD -DDOWNLOADS=/example/vcpkg/downloads -DTARGET_TRIPLET=arm64-linux -DTARGET_TRIPLET_FILE=/example/vcpkg/triplets/community/arm64-linux.cmake -DVCPKG_BASE_VERSION=2999-12-31 -DVCPKG_CONCURRENCY=9 -DVCPKG_PLATFORM_TOOLSET=external -DGIT=/usr/bin/git "-DVCPKG_PORT_CONFIGS=/example/build/vcpkg_installed/arm64-linux/share/vcpkg-cmake/vcpkg-port-config.cmake;/example/build/vcpkg_installed/arm64-linux/share/vcpkg-cmake-config/vcpkg-port-config.cmake;/example/build/vcpkg_installed/arm64-linux/share/vcpkg-cmake-get-vars/vcpkg-port-config.cmake" -DVCPKG_ROOT_DIR=/example/vcpkg -DPACKAGES_DIR=/example/vcpkg/packages -DBUILDTREES_DIR=/example/vcpkg/buildtrees -D_VCPKG_INSTALLED_DIR=/example/build/vcpkg_installed/ -DDOWNLOADS=/example/vcpkg/downloads -DVCPKG_MANIFEST_INSTALL=OFF -P /example/vcpkg/scripts/ports.cmake)
27.18 -- Downloading https://github.com/openssl/openssl/archive/openssl-3.2.1.tar.gz -> openssl-openssl-openssl-3.2.1.tar.gz...
29.64 -- Extracting source /example/vcpkg/downloads/openssl-openssl-openssl-3.2.1.tar.gz
29.90 -- Applying patch script-prefix.patch
29.90 -- Applying patch windows/install-layout.patch
29.90 -- Applying patch windows/install-pdbs.patch
29.90 -- Applying patch unix/android-cc.patch
29.90 -- Applying patch unix/move-openssldir.patch
29.90 -- Applying patch unix/no-empty-dirs.patch
29.90 -- Applying patch unix/no-static-libs-for-shared.patch
29.91 -- Using source at /example/vcpkg/buildtrees/openssl/src/nssl-3.2.1-8707343470.clean
29.91 openssl requires Linux kernel headers from the system package manager.
29.91    They can be installed on Alpine systems via `apk add linux-headers`.
29.91    They can be installed on Ubuntu systems via `apt install linux-libc-dev`.
29.91 
29.93 -- Getting CMake variables for arm64-linux
30.11 -- Getting CMake variables for arm64-linux-dbg
30.27 -- Getting CMake variables for arm64-linux-rel
30.43 -- Configuring arm64-linux-dbg
35.64 -- Configuring arm64-linux-rel
40.86 -- Building arm64-linux-dbg
51.79 -- Installing arm64-linux-dbg
52.47 -- Building arm64-linux-rel
69.23 -- Installing arm64-linux-rel
69.87 -- Fixing pkgconfig file: /example/vcpkg/packages/openssl_arm64-linux/lib/pkgconfig/libcrypto.pc
69.87 -- Fixing pkgconfig file: /example/vcpkg/packages/openssl_arm64-linux/lib/pkgconfig/libssl.pc
69.87 -- Fixing pkgconfig file: /example/vcpkg/packages/openssl_arm64-linux/lib/pkgconfig/openssl.pc
69.87 -- Fixing pkgconfig file: /example/vcpkg/packages/openssl_arm64-linux/debug/lib/pkgconfig/libcrypto.pc
69.87 -- Fixing pkgconfig file: /example/vcpkg/packages/openssl_arm64-linux/debug/lib/pkgconfig/libssl.pc
69.87 -- Fixing pkgconfig file: /example/vcpkg/packages/openssl_arm64-linux/debug/lib/pkgconfig/openssl.pc
69.88 -- Installing: /example/vcpkg/packages/openssl_arm64-linux/share/openssl/usage
69.88 -- Installing: /example/vcpkg/packages/openssl_arm64-linux/share/openssl/copyright
69.91 [DEBUG] 1029: cmd_execute_and_stream_data() returned 0 after 42747628 us
69.92 -- Performing post-build validation
69.92 [DEBUG] 1030: execute_process(cd /example/vcpkg/packages/openssl_arm64-linux && zip --quiet -y -r /example/vcpkg/packages/openssl_arm64-linux.zip * --exclude .DS_Store)
71.45 [DEBUG] 1030: cmd_execute_and_stream_data() returned 0 after  1532368 us
71.46 Stored binaries in 1 destinations in 1.5 s.
71.46 Elapsed time to handle openssl:arm64-linux: 44 s
71.46 openssl:arm64-linux package ABI: dae1bd192cfea793ec0086214c1aaef4078e901de783c29ec4ab443de0503747
71.46 Installing 7/12 libuuid:arm64-linux@1.0.3#14...
71.46 Building libuuid:arm64-linux@1.0.3#14...
71.46 warning: -- Using community triplet arm64-linux. This triplet configuration is not guaranteed to succeed.
71.46 -- [COMMUNITY] Loading triplet configuration from: /example/vcpkg/triplets/community/arm64-linux.cmake
71.46 -- Installing port from location: /example/vcpkg/buildtrees/versioning_/versions/libuuid/09be6774f518692bc418aa03623cc9dbc19e6516
71.46 [DEBUG] 1031: execute_process(GIT_CEILING_DIRECTORIES=/example/vcpkg/buildtrees  /usr/bin/cmake -DALL_FEATURES= -DCURRENT_PORT_DIR=/example/vcpkg/buildtrees/versioning_/versions/libuuid/09be6774f518692bc418aa03623cc9dbc19e6516 -D_HOST_TRIPLET=arm64-linux -DFEATURES=core -DPORT=libuuid -DVERSION=1.0.3 -DVCPKG_USE_HEAD_VERSION=0 -D_VCPKG_DOWNLOAD_TOOL=BUILT_IN -D_VCPKG_EDITABLE=0 -D_VCPKG_NO_DOWNLOADS=0 -DZ_VCPKG_CHAINLOAD_TOOLCHAIN_FILE=/example/vcpkg/scripts/toolchains/linux.cmake -DCMD=BUILD -DDOWNLOADS=/example/vcpkg/downloads -DTARGET_TRIPLET=arm64-linux -DTARGET_TRIPLET_FILE=/example/vcpkg/triplets/community/arm64-linux.cmake -DVCPKG_BASE_VERSION=2999-12-31 -DVCPKG_CONCURRENCY=9 -DVCPKG_PLATFORM_TOOLSET=external -DGIT=/usr/bin/git "-DVCPKG_PORT_CONFIGS=/example/build/vcpkg_installed/arm64-linux/share/vcpkg-cmake/vcpkg-port-config.cmake;/example/build/vcpkg_installed/arm64-linux/share/vcpkg-cmake-config/vcpkg-port-config.cmake" -DVCPKG_ROOT_DIR=/example/vcpkg -DPACKAGES_DIR=/example/vcpkg/packages -DBUILDTREES_DIR=/example/vcpkg/buildtrees -D_VCPKG_INSTALLED_DIR=/example/build/vcpkg_installed/ -DDOWNLOADS=/example/vcpkg/downloads -DVCPKG_MANIFEST_INSTALL=OFF -P /example/vcpkg/scripts/ports.cmake)
71.48 -- Downloading https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download;https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download?use_mirror=cfhcable;https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download?use_mirror=pilotfiber;https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download?use_mirror=gigenet;https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download?use_mirror=versaweb;https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download?use_mirror=ayera;https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download?use_mirror=netactuate;https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download?use_mirror=phoenixnap;https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download?use_mirror=astuteinternet;https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download?use_mirror=freefr;https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download?use_mirror=netcologne;https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download?use_mirror=deac-riga;https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download?use_mirror=excellmedia;https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download?use_mirror=iweb;https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download?use_mirror=jaist;https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download?use_mirror=jztkft;https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download?use_mirror=managedway;https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download?use_mirror=nchc;https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download?use_mirror=netix;https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download?use_mirror=ufpr;https://sourceforge.net/projects/libuuid//files/libuuid-1.0.3.tar.gz/download?use_mirror=tenet -> libuuid-1.0.3.tar.gz...
73.23 -- Extracting source /example/vcpkg/downloads/libuuid-1.0.3.tar.gz
73.25 -- Using source at /example/vcpkg/buildtrees/libuuid/src/libuuid-1-f5e8f5589c.clean
73.26 -- Configuring arm64-linux
73.37 -- Building arm64-linux-dbg
73.44 -- Building arm64-linux-rel
73.52 -- Installing: /example/vcpkg/packages/libuuid_arm64-linux/lib/pkgconfig/uuid.pc
73.52 -- Installing: /example/vcpkg/packages/libuuid_arm64-linux/debug/lib/pkgconfig/uuid.pc
73.52 -- Fixing pkgconfig file: /example/vcpkg/packages/libuuid_arm64-linux/lib/pkgconfig/uuid.pc
73.52 -- Fixing pkgconfig file: /example/vcpkg/packages/libuuid_arm64-linux/debug/lib/pkgconfig/uuid.pc
73.52 -- Installing: /example/vcpkg/packages/libuuid_arm64-linux/share/libuuid/copyright
73.53 [DEBUG] 1031: cmd_execute_and_stream_data() returned 0 after  2068795 us
73.53 -- Performing post-build validation
73.53 [DEBUG] 1032: execute_process(cd /example/vcpkg/packages/libuuid_arm64-linux && zip --quiet -y -r /example/vcpkg/packages/libuuid_arm64-linux.zip * --exclude .DS_Store)
73.53 [DEBUG] 1032: cmd_execute_and_stream_data() returned 0 after     4659 us
73.53 Stored binaries in 1 destinations in 4.81 ms.
73.53 Elapsed time to handle libuuid:arm64-linux: 2.1 s
73.53 libuuid:arm64-linux package ABI: 89d8817d9488fad5297d5a057fb02909a37388fc74e55e0d84050ce0cb917609
73.53 Installing 8/12 liblzma:arm64-linux@5.4.4...
73.53 Building liblzma:arm64-linux@5.4.4...
73.53 warning: -- Using community triplet arm64-linux. This triplet configuration is not guaranteed to succeed.
73.53 -- [COMMUNITY] Loading triplet configuration from: /example/vcpkg/triplets/community/arm64-linux.cmake
73.53 -- Installing port from location: /example/vcpkg/buildtrees/versioning_/versions/liblzma/f285b7c4ffa2cc065c7c6fec4b61006f7fa2714e
73.53 [DEBUG] 1033: execute_process(GIT_CEILING_DIRECTORIES=/example/vcpkg/buildtrees  /usr/bin/cmake "-DALL_FEATURES=tools;" -DCURRENT_PORT_DIR=/example/vcpkg/buildtrees/versioning_/versions/liblzma/f285b7c4ffa2cc065c7c6fec4b61006f7fa2714e -D_HOST_TRIPLET=arm64-linux -DFEATURES=core -DPORT=liblzma -DVERSION=5.4.4 -DVCPKG_USE_HEAD_VERSION=0 -D_VCPKG_DOWNLOAD_TOOL=BUILT_IN -D_VCPKG_EDITABLE=0 -D_VCPKG_NO_DOWNLOADS=0 -DZ_VCPKG_CHAINLOAD_TOOLCHAIN_FILE=/example/vcpkg/scripts/toolchains/linux.cmake -DCMD=BUILD -DDOWNLOADS=/example/vcpkg/downloads -DTARGET_TRIPLET=arm64-linux -DTARGET_TRIPLET_FILE=/example/vcpkg/triplets/community/arm64-linux.cmake -DVCPKG_BASE_VERSION=2999-12-31 -DVCPKG_CONCURRENCY=9 -DVCPKG_PLATFORM_TOOLSET=external -DGIT=/usr/bin/git "-DVCPKG_PORT_CONFIGS=/example/build/vcpkg_installed/arm64-linux/share/vcpkg-cmake/vcpkg-port-config.cmake;/example/build/vcpkg_installed/arm64-linux/share/vcpkg-cmake-config/vcpkg-port-config.cmake" -DVCPKG_ROOT_DIR=/example/vcpkg -DPACKAGES_DIR=/example/vcpkg/packages -DBUILDTREES_DIR=/example/vcpkg/buildtrees -D_VCPKG_INSTALLED_DIR=/example/build/vcpkg_installed/ -DDOWNLOADS=/example/vcpkg/downloads -DVCPKG_MANIFEST_INSTALL=OFF -P /example/vcpkg/scripts/ports.cmake)
73.54 -- Downloading https://github.com/tukaani-project/xz/archive/v5.4.4.tar.gz -> tukaani-project-xz-v5.4.4.tar.gz...
74.76 -- Extracting source /example/vcpkg/downloads/tukaani-project-xz-v5.4.4.tar.gz
74.79 -- Applying patch fix_config_include.patch
74.79 -- Applying patch win_output_name.patch
74.80 -- Applying patch add_support_ios.patch
74.80 -- Applying patch build-tools.patch
74.80 -- Using source at /example/vcpkg/buildtrees/liblzma/src/v5.4.4-6f848a7cca.clean
74.80 -- Configuring arm64-linux
75.23 -- Building arm64-linux-dbg
75.76 -- Building arm64-linux-rel
76.76 -- Fixing pkgconfig file: /example/vcpkg/packages/liblzma_arm64-linux/lib/pkgconfig/liblzma.pc
76.77 -- Fixing pkgconfig file: /example/vcpkg/packages/liblzma_arm64-linux/debug/lib/pkgconfig/liblzma.pc
76.77 -- Installing: /example/vcpkg/packages/liblzma_arm64-linux/share/liblzma/copyright
76.77 [DEBUG] 1033: cmd_execute_and_stream_data() returned 0 after  3239921 us
76.77 -- Performing post-build validation
76.78 [DEBUG] 1034: execute_process(cd /example/vcpkg/packages/liblzma_arm64-linux && zip --quiet -y -r /example/vcpkg/packages/liblzma_arm64-linux.zip * --exclude .DS_Store)
76.85 [DEBUG] 1034: cmd_execute_and_stream_data() returned 0 after    69525 us
76.85 Stored binaries in 1 destinations in 69.9 ms.
76.85 Elapsed time to handle liblzma:arm64-linux: 3.3 s
76.85 liblzma:arm64-linux package ABI: 2103e649593adae2eb0a8b0346080361a55828235c5df0b83ff889a1928209ea
76.85 Installing 9/12 libffi:arm64-linux@3.4.6...
76.85 Building libffi:arm64-linux@3.4.6...
76.85 warning: -- Using community triplet arm64-linux. This triplet configuration is not guaranteed to succeed.
76.85 -- [COMMUNITY] Loading triplet configuration from: /example/vcpkg/triplets/community/arm64-linux.cmake
76.85 -- Installing port from location: /example/vcpkg/buildtrees/versioning_/versions/libffi/0ad381012102db5da196161ba7fc0a03a4dcb982
76.85 [DEBUG] 1035: execute_process(GIT_CEILING_DIRECTORIES=/example/vcpkg/buildtrees  /usr/bin/cmake -DALL_FEATURES= -DCURRENT_PORT_DIR=/example/vcpkg/buildtrees/versioning_/versions/libffi/0ad381012102db5da196161ba7fc0a03a4dcb982 -D_HOST_TRIPLET=arm64-linux -DFEATURES=core -DPORT=libffi -DVERSION=3.4.6 -DVCPKG_USE_HEAD_VERSION=0 -D_VCPKG_DOWNLOAD_TOOL=BUILT_IN -D_VCPKG_EDITABLE=0 -D_VCPKG_NO_DOWNLOADS=0 -DZ_VCPKG_CHAINLOAD_TOOLCHAIN_FILE=/example/vcpkg/scripts/toolchains/linux.cmake -DCMD=BUILD -DDOWNLOADS=/example/vcpkg/downloads -DTARGET_TRIPLET=arm64-linux -DTARGET_TRIPLET_FILE=/example/vcpkg/triplets/community/arm64-linux.cmake -DVCPKG_BASE_VERSION=2999-12-31 -DVCPKG_CONCURRENCY=9 -DVCPKG_PLATFORM_TOOLSET=external -DGIT=/usr/bin/git -DVCPKG_PORT_CONFIGS=/example/build/vcpkg_installed/arm64-linux/share/vcpkg-cmake-get-vars/vcpkg-port-config.cmake -DVCPKG_ROOT_DIR=/example/vcpkg -DPACKAGES_DIR=/example/vcpkg/packages -DBUILDTREES_DIR=/example/vcpkg/buildtrees -D_VCPKG_INSTALLED_DIR=/example/build/vcpkg_installed/ -DDOWNLOADS=/example/vcpkg/downloads -DVCPKG_MANIFEST_INSTALL=OFF -P /example/vcpkg/scripts/ports.cmake)
76.85 -- Downloading https://github.com/libffi/libffi/releases/download/v3.4.6/libffi-3.4.6.tar.gz -> libffi-3.4.6.tar.gz...
78.08 -- Extracting source /example/vcpkg/downloads/libffi-3.4.6.tar.gz
78.11 -- Applying patch dll-bindir.diff
78.11 -- Using source at /example/vcpkg/buildtrees/libffi/src/libffi-3-5867c437e9.clean
78.11 -- Getting CMake variables for arm64-linux
78.29 -- Getting CMake variables for arm64-linux-dbg
78.45 -- Getting CMake variables for arm64-linux-rel
78.61 -- Configuring arm64-linux-dbg
80.25 -- Configuring arm64-linux-rel
81.89 -- Building arm64-linux-dbg
82.10 -- Installing arm64-linux-dbg
82.17 -- Building arm64-linux-rel
82.55 -- Installing arm64-linux-rel
82.62 -- Fixing pkgconfig file: /example/vcpkg/packages/libffi_arm64-linux/lib/pkgconfig/libffi.pc
82.62 -- Fixing pkgconfig file: /example/vcpkg/packages/libffi_arm64-linux/debug/lib/pkgconfig/libffi.pc
82.62 -- Installing: /example/vcpkg/packages/libffi_arm64-linux/share/libffi/usage
82.62 -- Installing: /example/vcpkg/packages/libffi_arm64-linux/share/unofficial-libffi/unofficial-libffi-config.cmake
82.62 -- Installing: /example/vcpkg/packages/libffi_arm64-linux/share/libffi/libffiConfig.cmake
82.62 -- Installing: /example/vcpkg/packages/libffi_arm64-linux/share/libffi/copyright
82.63 [DEBUG] 1035: cmd_execute_and_stream_data() returned 0 after  5783862 us
82.63 -- Performing post-build validation
82.63 [DEBUG] 1036: execute_process(cd /example/vcpkg/packages/libffi_arm64-linux && zip --quiet -y -r /example/vcpkg/packages/libffi_arm64-linux.zip * --exclude .DS_Store)
82.65 [DEBUG] 1036: cmd_execute_and_stream_data() returned 0 after    13609 us
82.65 Stored binaries in 1 destinations in 13.8 ms.
82.65 Elapsed time to handle libffi:arm64-linux: 5.8 s
82.65 libffi:arm64-linux package ABI: 695967178e5807bd0cbd26206c0e468d5fee15f43f7c28826808d25878a593ac
82.65 Installing 10/12 expat:arm64-linux@2.6.0...
82.65 Building expat:arm64-linux@2.6.0...
82.65 warning: -- Using community triplet arm64-linux. This triplet configuration is not guaranteed to succeed.
82.65 -- [COMMUNITY] Loading triplet configuration from: /example/vcpkg/triplets/community/arm64-linux.cmake
82.65 -- Installing port from location: /example/vcpkg/buildtrees/versioning_/versions/expat/324f8ee85bcf8dc7f2c8969d3d0f2af4d78be9a2
82.65 [DEBUG] 1037: execute_process(GIT_CEILING_DIRECTORIES=/example/vcpkg/buildtrees  /usr/bin/cmake -DALL_FEATURES= -DCURRENT_PORT_DIR=/example/vcpkg/buildtrees/versioning_/versions/expat/324f8ee85bcf8dc7f2c8969d3d0f2af4d78be9a2 -D_HOST_TRIPLET=arm64-linux -DFEATURES=core -DPORT=expat -DVERSION=2.6.0 -DVCPKG_USE_HEAD_VERSION=0 -D_VCPKG_DOWNLOAD_TOOL=BUILT_IN -D_VCPKG_EDITABLE=0 -D_VCPKG_NO_DOWNLOADS=0 -DZ_VCPKG_CHAINLOAD_TOOLCHAIN_FILE=/example/vcpkg/scripts/toolchains/linux.cmake -DCMD=BUILD -DDOWNLOADS=/example/vcpkg/downloads -DTARGET_TRIPLET=arm64-linux -DTARGET_TRIPLET_FILE=/example/vcpkg/triplets/community/arm64-linux.cmake -DVCPKG_BASE_VERSION=2999-12-31 -DVCPKG_CONCURRENCY=9 -DVCPKG_PLATFORM_TOOLSET=external -DGIT=/usr/bin/git "-DVCPKG_PORT_CONFIGS=/example/build/vcpkg_installed/arm64-linux/share/vcpkg-cmake/vcpkg-port-config.cmake;/example/build/vcpkg_installed/arm64-linux/share/vcpkg-cmake-config/vcpkg-port-config.cmake" -DVCPKG_ROOT_DIR=/example/vcpkg -DPACKAGES_DIR=/example/vcpkg/packages -DBUILDTREES_DIR=/example/vcpkg/buildtrees -D_VCPKG_INSTALLED_DIR=/example/build/vcpkg_installed/ -DDOWNLOADS=/example/vcpkg/downloads -DVCPKG_MANIFEST_INSTALL=OFF -P /example/vcpkg/scripts/ports.cmake)
82.66 -- Downloading https://github.com/libexpat/libexpat/archive/R_2_6_0.tar.gz -> libexpat-libexpat-R_2_6_0.tar.gz...
85.34 -- Extracting source /example/vcpkg/downloads/libexpat-libexpat-R_2_6_0.tar.gz
85.54 -- Using source at /example/vcpkg/buildtrees/expat/src/R_2_6_0-4778b6e17f.clean
85.54 -- Configuring arm64-linux
86.25 -- Building arm64-linux-dbg
86.48 -- Building arm64-linux-rel
87.63 -- Fixing pkgconfig file: /example/vcpkg/packages/expat_arm64-linux/lib/pkgconfig/expat.pc
87.63 -- Fixing pkgconfig file: /example/vcpkg/packages/expat_arm64-linux/debug/lib/pkgconfig/expat.pc
87.63 -- Installing: /example/vcpkg/packages/expat_arm64-linux/share/expat/copyright
87.63 [DEBUG] 1037: cmd_execute_and_stream_data() returned 0 after  4987359 us
87.63 -- Performing post-build validation
87.63 [DEBUG] 1038: execute_process(cd /example/vcpkg/packages/expat_arm64-linux && zip --quiet -y -r /example/vcpkg/packages/expat_arm64-linux.zip * --exclude .DS_Store)
87.66 [DEBUG] 1038: cmd_execute_and_stream_data() returned 0 after    29252 us
87.66 Stored binaries in 1 destinations in 29.5 ms.
87.66 Elapsed time to handle expat:arm64-linux: 5 s
87.66 expat:arm64-linux package ABI: 1b5ef1045f2acbe44b73d4bc02a45cd6d9e503345e7e7972e49f62c2daf22156
87.66 Installing 11/12 bzip2[core,tool]:arm64-linux@1.0.8#5...
87.66 Building bzip2[core,tool]:arm64-linux@1.0.8#5...
87.66 warning: -- Using community triplet arm64-linux. This triplet configuration is not guaranteed to succeed.
87.66 -- [COMMUNITY] Loading triplet configuration from: /example/vcpkg/triplets/community/arm64-linux.cmake
87.66 -- Installing port from location: /example/vcpkg/buildtrees/versioning_/versions/bzip2/92e9a8bbf1abbd89872b48ad82fcf75852de1006
87.66 [DEBUG] 1039: execute_process(GIT_CEILING_DIRECTORIES=/example/vcpkg/buildtrees  /usr/bin/cmake "-DALL_FEATURES=tool;" -DCURRENT_PORT_DIR=/example/vcpkg/buildtrees/versioning_/versions/bzip2/92e9a8bbf1abbd89872b48ad82fcf75852de1006 -D_HOST_TRIPLET=arm64-linux "-DFEATURES=core;tool" -DPORT=bzip2 -DVERSION=1.0.8 -DVCPKG_USE_HEAD_VERSION=0 -D_VCPKG_DOWNLOAD_TOOL=BUILT_IN -D_VCPKG_EDITABLE=0 -D_VCPKG_NO_DOWNLOADS=0 -DZ_VCPKG_CHAINLOAD_TOOLCHAIN_FILE=/example/vcpkg/scripts/toolchains/linux.cmake -DCMD=BUILD -DDOWNLOADS=/example/vcpkg/downloads -DTARGET_TRIPLET=arm64-linux -DTARGET_TRIPLET_FILE=/example/vcpkg/triplets/community/arm64-linux.cmake -DVCPKG_BASE_VERSION=2999-12-31 -DVCPKG_CONCURRENCY=9 -DVCPKG_PLATFORM_TOOLSET=external -DGIT=/usr/bin/git -DVCPKG_PORT_CONFIGS=/example/build/vcpkg_installed/arm64-linux/share/vcpkg-cmake/vcpkg-port-config.cmake -DVCPKG_ROOT_DIR=/example/vcpkg -DPACKAGES_DIR=/example/vcpkg/packages -DBUILDTREES_DIR=/example/vcpkg/buildtrees -D_VCPKG_INSTALLED_DIR=/example/build/vcpkg_installed/ -DDOWNLOADS=/example/vcpkg/downloads -DVCPKG_MANIFEST_INSTALL=OFF -P /example/vcpkg/scripts/ports.cmake)
87.67 -- Downloading https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz -> bzip2-1.0.8.tar.gz...
88.60 -- Extracting source /example/vcpkg/downloads/bzip2-1.0.8.tar.gz
88.61 -- Applying patch fix-import-export-macros.patch
88.61 -- Using source at /example/vcpkg/buildtrees/bzip2/src/bzip2-1-336d4794a3.clean
88.62 -- Configuring arm64-linux
88.71 -- Building arm64-linux-dbg
88.81 -- Building arm64-linux-rel
90.46 -- Fixing pkgconfig file: /example/vcpkg/packages/bzip2_arm64-linux/lib/pkgconfig/bzip2.pc
90.46 -- Fixing pkgconfig file: /example/vcpkg/packages/bzip2_arm64-linux/debug/lib/pkgconfig/bzip2.pc
90.46 -- Installing: /example/vcpkg/packages/bzip2_arm64-linux/share/bzip2/copyright
90.47 -- Adjusted RPATH of '/example/vcpkg/packages/bzip2_arm64-linux/tools/bzip2/bzip2' (From '' -> To '$ORIGIN:$ORIGIN/../../lib')
90.47 -- Adjusted RPATH of '/example/vcpkg/packages/bzip2_arm64-linux/tools/bzip2/bzip2recover' (From '' -> To '$ORIGIN:$ORIGIN/../../lib')
90.47 [DEBUG] 1039: cmd_execute_and_stream_data() returned 0 after  2805768 us
90.47 -- Performing post-build validation
90.47 [DEBUG] 1040: execute_process(cd /example/vcpkg/packages/bzip2_arm64-linux && zip --quiet -y -r /example/vcpkg/packages/bzip2_arm64-linux.zip * --exclude .DS_Store)
90.49 [DEBUG] 1040: cmd_execute_and_stream_data() returned 0 after    20149 us
90.49 Stored binaries in 1 destinations in 20.5 ms.
90.49 Elapsed time to handle bzip2:arm64-linux: 2.8 s
90.49 bzip2:arm64-linux package ABI: 7d3d78d648f58bfddacac2b9eef84ec3f548f9788bdeb36590223ea8bf218fe9
90.49 Installing 12/12 python3:arm64-linux@3.11.8...
90.49 Building python3:arm64-linux@3.11.8...
90.49 warning: -- Using community triplet arm64-linux. This triplet configuration is not guaranteed to succeed.
90.49 -- [COMMUNITY] Loading triplet configuration from: /example/vcpkg/triplets/community/arm64-linux.cmake
90.49 -- Installing port from location: /example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41
90.49 [DEBUG] 1041: execute_process(GIT_CEILING_DIRECTORIES=/example/vcpkg/buildtrees  /usr/bin/cmake "-DALL_FEATURES=deprecated-win7-support;" -DCURRENT_PORT_DIR=/example/vcpkg/buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41 -D_HOST_TRIPLET=arm64-linux -DFEATURES=core -DPORT=python3 -DVERSION=3.11.8 -DVCPKG_USE_HEAD_VERSION=0 -D_VCPKG_DOWNLOAD_TOOL=BUILT_IN -D_VCPKG_EDITABLE=0 -D_VCPKG_NO_DOWNLOADS=0 -DZ_VCPKG_CHAINLOAD_TOOLCHAIN_FILE=/example/vcpkg/scripts/toolchains/linux.cmake -DCMD=BUILD -DDOWNLOADS=/example/vcpkg/downloads -DTARGET_TRIPLET=arm64-linux -DTARGET_TRIPLET_FILE=/example/vcpkg/triplets/community/arm64-linux.cmake -DVCPKG_BASE_VERSION=2999-12-31 -DVCPKG_CONCURRENCY=9 -DVCPKG_PLATFORM_TOOLSET=external -DGIT=/usr/bin/git -DVCPKG_ROOT_DIR=/example/vcpkg -DPACKAGES_DIR=/example/vcpkg/packages -DBUILDTREES_DIR=/example/vcpkg/buildtrees -D_VCPKG_INSTALLED_DIR=/example/build/vcpkg_installed/ -DDOWNLOADS=/example/vcpkg/downloads -DVCPKG_MANIFEST_INSTALL=OFF -P /example/vcpkg/scripts/ports.cmake)
90.50 CMake Warning at buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/portfile.cmake:7 (message):
90.50   python3 currently requires the following programs from the system package
90.50   manager:
90.50 
90.50       autoconf automake autoconf-archive
90.50 
90.50   On Debian and Ubuntu derivatives:
90.50 
90.50       sudo apt-get install autoconf automake autoconf-archive
90.50 
90.50   On recent Red Hat and Fedora derivatives:
90.50 
90.50       sudo dnf install autoconf automake autoconf-archive
90.50 
90.50   On Arch Linux and derivatives:
90.50 
90.50       sudo pacman -S autoconf automake autoconf-archive
90.50 
90.50   On Alpine:
90.50 
90.50       apk add autoconf automake autoconf-archive
90.50 
90.50   On macOS:
90.50 
90.50       brew install autoconf automake autoconf-archive
90.50 
90.50 Call Stack (most recent call first):
90.50   scripts/ports.cmake:175 (include)
90.50 
90.50 
90.50 -- Downloading https://github.com/python/cpython/archive/v3.11.8.tar.gz -> python-cpython-v3.11.8.tar.gz...
95.05 -- Extracting source /example/vcpkg/downloads/python-cpython-v3.11.8.tar.gz
95.38 -- Applying patch 0001-only-build-required-projects.patch
95.38 -- Applying patch 0003-use-vcpkg-zlib.patch
95.39 -- Applying patch 0004-devendor-external-dependencies.patch
95.39 -- Applying patch 0005-dont-copy-vcruntime.patch
95.39 -- Applying patch 0008-python.pc.patch
95.39 -- Applying patch 0010-dont-skip-rpath.patch
95.39 -- Applying patch 0012-force-disable-modules.patch
95.39 -- Applying patch 0014-fix-get-python-inc-output.patch
95.39 -- Applying patch 0015-dont-use-WINDOWS-def.patch
95.39 -- Applying patch 0016-undup-ffi-symbols.patch
95.39 -- Applying patch 0018-fix-sysconfig-include.patch
95.39 -- Applying patch 0002-static-library.patch
95.40 -- Applying patch 0011-gcc-ldflags-fix.patch
95.40 -- Using source at /example/vcpkg/buildtrees/python3/src/v3.11.8-fe0ac5827a.clean
95.40 -- Getting CMake variables for arm64-linux-dbg
95.58 -- Getting CMake variables for arm64-linux-rel
95.74 -- Generating configure for arm64-linux
99.46 -- Finished generating configure for arm64-linux
99.46 -- Configuring arm64-linux-dbg
99.54 CMake Error at scripts/cmake/vcpkg_execute_required_process.cmake:112 (message):
99.54     Command failed: /usr/bin/bash -c "V=1 ./../src/v3.11.8-fe0ac5827a.clean/configure --host=aarch64-linux-gnu \"--with-openssl=/example/build/vcpkg_installed/arm64-linux\" \"--without-ensurepip\" \"--with-suffix=\" \"--with-system-expat\" \"--without-readline\" \"--disable-test-modules\" \"--disable-silent-rules\" \"--verbose\" \"--disable-shared\" \"--enable-static\" \"--with-pydebug\" \"vcpkg_rpath=/example/build/vcpkg_installed/arm64-linux/debug/lib\" \"--prefix=/example/build/vcpkg_installed/arm64-linux/debug\" \"--bindir=\\${prefix}/../tools/python3/debug/bin\" \"--sbindir=\\${prefix}/../tools/python3/debug/sbin\" \"--libdir=\\${prefix}/lib\" \"--includedir=\\${prefix}/../include\" \"--datarootdir=\\${prefix}/share/python3\""
99.54     Working Directory: /example/vcpkg/buildtrees/python3/arm64-linux-dbg
99.54     Error code: 1
99.54     See logs for more information:
99.54       /example/vcpkg/buildtrees/python3/config-arm64-linux-dbg-config.log
99.54       /example/vcpkg/buildtrees/python3/config-arm64-linux-dbg-out.log
99.54       /example/vcpkg/buildtrees/python3/config-arm64-linux-dbg-err.log
99.54 
99.54 Call Stack (most recent call first):
99.54   scripts/cmake/vcpkg_configure_make.cmake:863 (vcpkg_execute_required_process)
99.54   buildtrees/versioning_/versions/python3/ce86a5562b977fb3e02bd15d96d2de7c771aed41/portfile.cmake:274 (vcpkg_configure_make)
99.54   scripts/ports.cmake:175 (include)
99.54 
99.54 
99.54 [DEBUG] 1041: cmd_execute_and_stream_data() returned 1 after  9051749 us
99.54 error: building python3:arm64-linux failed with: BUILD_FAILED
99.54 Elapsed time to handle python3:arm64-linux: 9.1 s
99.54 [DEBUG] 1042: execute_process(/usr/bin/git --git-dir=/example/vcpkg/.git --work-tree=/example/vcpkg/.git -c core.autocrlf=false show "--pretty=format:%h %cd (%cr)" -s --date=short HEAD)
99.55 [DEBUG] 1042: cmd_execute_and_stream_data() returned 0 after     2965 us
99.55 Please ensure you're using the latest port files with `git pull` and `vcpkg update`.
99.55 Then check for known issues at:
99.55   https://github.com/microsoft/vcpkg/issues?q=is%3Aissue+is%3Aopen+in%3Atitle+python3
99.55 You can submit a new issue at:
99.55   https://github.com/microsoft/vcpkg/issues/new?title=[python3]+Build+error+on+arm64-linux&body=Copy+issue+body+from+%2Fexample%2Fbuild%2Fvcpkg_installed%2Fvcpkg%2Fissue_body.md
99.55 
99.55 [DEBUG] /example/vcpkg/buildtrees/_vcpkg/src/vcpkg-tool-2024-02-07/src/vcpkg/commands.install.cpp(603): 
99.55 [DEBUG] Time in subprocesses: 99397670us
99.55 [DEBUG] Time in parsing JSON: 17783us
99.55 [DEBUG] Time in JSON reader: 1500us
99.55 [DEBUG] Time in filesystem: 14801us
99.55 [DEBUG] Time in loading ports: 579us
99.55 [DEBUG] Exiting after 1.7 min (99478090us)
------
Dockerfile:34
--------------------
  32 |     COPY vcpkg.json .
  33 |     
  34 | >>> RUN ./vcpkg/vcpkg install --debug --x-install-root="./build/vcpkg_installed/"
  35 |     
  36 |     # source
--------------------
ERROR: failed to solve: process "/bin/sh -c ./vcpkg/vcpkg install --debug --x-install-root=\"./build/vcpkg_installed/\"" did not complete successfully: exit code: 1
```