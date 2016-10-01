# libExtAPI
A library for accessing V-REP's external API.
This comes as part of the V-REP distribution and is licenced under the GPL (see the `LICENSE` file for details).

## Compiling and Installing

You can compile this library using `libtool` or `qmake` (from Qt 4.8 or higher).

### Libtool

The name of the `libtool` utility may vary depending on your platform (see below).

#### Linux

To build and install, use the following commands:

	make
	sudo make install

#### macOS

To build and install, you need to have GNU libtool installed with Homebrew:

	brew install libtool

The, to build and install use the following commands:

	make LIBTOOL=glibtool
	make install LIBTOOL=glibtool

### QMake

To build and install, use the following commands:

	qmake
	make -f Makefile
	sudo make install

#### Xcode Project

On macOS, you can create an Xcode project using:

	qmake -spec macx-xcode
