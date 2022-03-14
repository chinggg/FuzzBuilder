cd $FuzzBuilder/exp/expat
afl-cmin -m 1024 -i seed/fuzzbuilder/org/XML_Parse -o seed/eval/XML_Parse_fuzzer/fuzzbuilder bin/fuzz/fuzzbuilder/XML_Parse_fuzzer @@
