# Hurd unionfs
# Copyright (C) 2001, 2002, 2003 Free Software Foundation, Inc.
# Written by Jeroen Dekkers <jeroen@dekkers.cx>.
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or *
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
# USA.

CFLAGS += -Wall -g -O2 -D_FILE_OFFSET_BITS=64 -std=gnu99 \
	  -DDEBUG
LDFLAGS += -lnetfs -lfshelp -liohelp -lthreads \
           -lports -lihash -lshouldbeinlibc
OBJS = main.o node.o lnode.o ulfs.o ncache.o netfs.o \
       lib.o options.o

all: unionfs

unionfs: $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS)

unionfs.static: $(OBJS)
	$(CC) -static -o $@ $(OBJS) $(LDFLAGS)

.PHONY: clean

clean:
	rm -rf *.o unionfs
