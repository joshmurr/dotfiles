import sys
from itertools import zip_longest


def get_remainder(val, n):
    return n-(val % n)


def grouper(iterable, n, fillvalue=None):
    args = [iter(iterable)] * n
    return zip_longest(*args, fillvalue=fillvalue)


def main():
    if len(sys.argv) != 2:
        sys.exit("Usage: hexdump.py <file>")

    infile = sys.argv[1]

    with open(infile, 'rb') as readfile:
        offset = 0
        for b in readfile:
            for chunk in grouper(b, 16, -1):
                print(f"{offset:08x}", end='  ')
                for integer in chunk[:8]:
                    if integer == -1:
                        print("   ", end='')
                    else:
                        print(f"{integer:02x} ", end='')
                print(" ", end='')
                for integer in chunk[8:]:
                    if integer == -1:
                        print("   ", end='')
                    else:
                        print(f"{integer:02x} ", end='')
                print(" |", end='')
                for integer in chunk:
                    if integer < 32 and integer > 0:
                        print('.', end='')
                    elif integer >= 32 and integer < 127:
                        try:
                            print(str(chr(integer)), end='')
                        except ValueError:
                            print('.', end='')
                    elif integer < 0:
                        print('', end='')
                    else:
                        print('.', end='')
                print("|")
                offset+=16

if __name__ == "__main__":
    main()
