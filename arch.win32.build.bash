#!/bin/bash -ex
# Copyright (c) 2014-2015 Arduino LLC
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

export PATH=$PATH:/c/MinGW/bin/:/c/cygwin/bin/
CFLAGS="-DWIN32 -static" CXXFLAGS="-DWIN32 -static" LDFLAGS="-DWIN32 -static" CC="mingw32-gcc -m32" CXX="mingw32-g++ -m32" ./build.all.bash

cd avr
for folder in avr/bin bin libexec/gcc/avr/4.8.1/
do
	cp /c/MinGW/bin/libiconv-2.dll $folder
done

rm -f *arduino*.tar.bz2

tar -cjvf avr-gcc-4.8.1-arduino2-i686-mingw32.tar.bz2 avr/

tar -cjvf avrdude-6.0.1-arduino2-i686-mingw32.tar.bz2 avrdude-6.0.1/

