import sys
import re


def wc():
    if len(sys.argv) > 1:
        words = 0
        lines = 0
        chars = 0
        with open(sys.argv[1], "r") as f:
            content = f.read()
            chars += len(content)
            lines += len(content.split("\n")[:-1])
            words += len(content.split(None))
            print(f"chars {chars}, words {words}, lines {lines}\n")

if __name__ == "__main__":
    wc()
