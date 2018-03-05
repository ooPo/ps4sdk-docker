 ====================
  What does this do?
 ====================

  This program will automatically build a docker image with
  ps4sdk and elf-loader ready to be used for homebrew development.

 ====================
  How do I build it?
 ====================

 Build the image:

   docker build -t ps4sdk-docker .

 Copy the helper script:

   cp ps4sdk-docker.sh /usr/local/bin

 ==================
  How do I use it?
 ==================

 Use the helper script to run elf-loader:

   ps4sdk-docker.sh

 Or, use the helper script to run 'make':

   ps4sdk-docker.sh make

 The local folder will be mounted as /build inside docker.

 ============================
  How do I save and load it?
 ============================

 Save the image:

   docker save ps4sdk-docker | bzip2 > ps4sdk-docker.tar.bz2

 Load the image:

   docker load < bzip2 -dc ps4sdk-docker.tar.bz2
