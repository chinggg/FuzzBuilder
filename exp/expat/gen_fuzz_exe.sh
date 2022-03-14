cd $FuzzBuilder/exp/expat/source/libexpat/expat/tests
afl-clang -emit-llvm -DHAVE_CONFIG_H -I. -I.. -I./../lib -DHAVE_EXPAT_CONFIG_H -m32 -g -Wall -Wmissing-prototypes -Wstrict-prototypes -fexceptions -fno-strict-aliasing -c runtests.c
$FuzzBuilder/build/fuzzbuilder exec $FuzzBuilder/exp/expat/XML_Parse.conf
afl-clang -DHAVE_CONFIG_H -I. -I.. -I./../lib -DHAVE_EXPAT_CONFIG_H -m32 -g -Wall -Wmissing-prototypes -Wstrict-prototypes -fexceptions -fno-strict-aliasing -o runtests.o -c runtests.bc.mod.bc
#AFL_USE_ASAN=1 afl-clang -m32 -g -Wall -Wmissing-prototypes -Wstrict-prototypes -fexceptions -fno-strict-aliasing -fno-strict-aliasing -o XML_Parse_fuzzer runtests.o libruntests.a ../lib/.libs/libexpat.a
afl-clang -m32 -g -Wall -Wmissing-prototypes -Wstrict-prototypes -fexceptions -fno-strict-aliasing -fno-strict-aliasing -o XML_Parse_fuzzer runtests.o libruntests.a ../lib/.libs/libexpat.a
mkdir -p $FuzzBuilder/exp/expat/bin/fuzz/fuzzbuilder
mv XML_Parse_fuzzer $FuzzBuilder/exp/expat/bin/fuzz/fuzzbuilder
