cd $FuzzBuilder/exp/expat/source/libexpat/expat
afl-clang -emit-llvm -DHAVE_CONFIG_H -I. -I.. -DHAVE_EXPAT_CONFIG_H -m32 -g -Wall -Wmissing-prototypes -Wstrict-prototypes -fexceptions -fno-strict-aliasing -c lib/xmlparse.c -fPIC -DPIC
$FuzzBuilder/build/fuzzbuilder seed $FuzzBuilder/exp/expat/seed.conf
afl-clang -DHAVE_CONFIG_H -I. -I.. -DHAVE_EXPAT_CONFIG_H -m32 -g -Wall -Wmissing-prototypes -Wstrict-prototypes -fexceptions -fno-strict-aliasing -c xmlparse.bc.mod.bc -fPIC -DPIC -o xmlparse.o
ar r lib/.libs/libexpat.a xmlparse.o
rm -f tests/runtests
make check
cp /tmp/fuzzbuilder.collect .
python $FuzzBuilder/script/seed_maker.py fuzzbuilder.collect seed_fb
mkdir -p $FuzzBuilder/exp/expat/seed/fuzzbuilder
mv $FuzzBuilder/exp/expat/source/libexpat/expat/seed_fb $FuzzBuilder/exp/expat/seed/fuzzbuilder/org
