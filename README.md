# Helper scripts for building DEB packages

The package provides nothing special but some sugar for
people (especially me :) ) who do not want to keep in mind
various command line options for tools like dpkg-source,
pbuilder and reprepro. But the main goal is to achieve
a fully functional environment for building DEB packages
in a clean chrooted environment by installing a single
package.

Includes:

* _dbd-build_ - script to build DEB package in a chrooted
 environment;
* _dbd-login_ - unpack and chroot into a base root FS. After
 logout all changes will be saved;
* _dbd-login-nosave_ - unpack and chroot into a base root FS.
 No changes will be saved after a logout;
* _dbd-include_ - include built binary package into an APT
 repository;
* _dbd-remove_ - remove package from the APT repository.

## Directory layout

The main configuration file is ```/etc/dbd.conf```.

Binary DEB package will be saved in the current dir.

The APT repository base directory is ```/var/www/apt```. The
repo have its own configuration files located in
```/var/www/apt/conf``` directory.

## Configuration

To make able a particular user to call the scripts the user
must be added into a special system group ```dbd```.

To create signed APT repo you have to set ```SignWith``` option
in the ```/var/www/apt/conf/distributions``` file to point to
a valid PGP key. As far as operations with the APT repository is
done with superuser privileges, the PGP key must be owned by root.

If you want to publish the APT repository via HTTP/FTP, just
configure your Web/FTP/... server to look to the ```/var/www/apt```
dir.

## Short usage example

Create source package from directory ```somepkg-0.1.0```:

```sh
$ dpkg-source -b somepkg-0.1.0
```

Build binary package in a chrooted environment:

```sh
$ dbd-build somepkg_0.1.0-1.dsc
```

Add binary package into the APT repository:

```sh
$ dbd-include somepkg_0.1.0-1_amd64.changes
```

## More examples

### Add some changes in the base root FS tarball

```sh
$ dbd-login
```

In a root shell appeared make all essential changes and logout. All
changes made will be saved into a base root FS tarball for future use.

### Test something in a clean chrooted environment without saving changes

```sh
$ dbd-login-nosave
```

After logout the chroot will be destroyed.

### Remove package from the APT repository

```sh
$ dbd-remove $package_name
```
