#!/usr/bin/env python
import sys, os

def usage():
    print ("[usage] python " + __file__ + " $seed_path $seed_out_path")

def main():
    if len(sys.argv) != 3:
        sys.exit(0)

    seed_path = sys.argv[1]
    seed_out_path = sys.argv[2]

    if not os.path.exists(seed_out_path):
        os.makedirs(seed_out_path)

    with open(seed_path, "rb") as f:
        contents = f.read().split(b"\nfuzzbuilder=============\n")

    cnt_table = {}
    for i, content in enumerate(contents):
        print ("[" + str(i) + "/" + str(len(contents)) + "]")
        if not content:
            continue
        key = content[:content.find(b"\n")].decode()
        seed = content[content.find(b"\n")+1:]

        cnt = 1
        cache = set()
        try:  # if key is already counted, use previous cnt and cache
            cnt = cnt_table[key][0]
            cache = cnt_table[key][1]
        except KeyError:
            pass

        if seed in cache:
            continue

        try:
            if not os.path.exists(seed_out_path + os.sep + key):
                os.makedirs(seed_out_path + os.sep + key)
            with open(seed_out_path + os.sep + key + os.sep + key + ".seed." + str(cnt), "wb") as f:
                f.write(seed)
        except TypeError:
            print ("key : " + key)

        cnt += 1
        cache.add(seed)
        cnt_table[key] = (cnt, cache)

if __name__ == "__main__":
    main()
