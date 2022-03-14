cd $FuzzBuilder/exp/expat/source/libexpat/expat
afl-clang -emit-llvm -DHAVE_CONFIG_H -I. -I.. -DHAVE_EXPAT_CONFIG_H -m32 -g -Wall -Wmissing-prototypes -Wstrict-prototypes -fexceptions -fno-strict-aliasing -c lib/xmlparse.c -fPIC -DPIC
afl-clang -DHAVE_CONFIG_H -I. -I.. -DHAVE_EXPAT_CONFIG_H -m32 -g -Wall -Wmissing-prototypes -Wstrict-prototypes -fexceptions -fno-strict-aliasing -c xmlparse.bc -fPIC -DPIC -o xmlparse.o
ar r lib/.libs/libexpat.a xmlparse.o
