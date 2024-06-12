import time
import subprocess
import tabulate

MULTIPLIER = pow(10, 9)

def bench(prog, arg):
    subprocess.run("{} {} 1>/dev/null".format(prog, arg), shell=True)

def main():
    results = []
    names = ["Flex wc", "Python wc", "Unix wc"]
    progs = [
            "../flex/flex_wc",
            "python ../python/wc.py",
            #"/home/pierkiro/Projects/lang_theory/flex_bison_examples/word_count/flex/flex_wc",
            #"python /home/pierkiro/Projects/lang_theory/flex_bison_examples/word_count/python/wc.py",
            "wc"
    ]
    args = [
            "input/lorem_ipsum_400.txt",
            "input/lorem_ipsum_400.txt",
            "input/lorem_ipsum_400.txt"
            # "/home/pierkiro/Projects/lang_theory/flex_bison_examples/word_count/benchmark/input/lorem_ipsum_400.txt",
            # "/home/pierkiro/Projects/lang_theory/flex_bison_examples/word_count/benchmark/input/lorem_ipsum_400.txt",
            # "/home/pierkiro/Projects/lang_theory/flex_bison_examples/word_count/benchmark/input/lorem_ipsum_400.txt"
    ]

    for prog, arg, name in zip(progs, args, names):
        print("\nRunning benchmark for {}\n".format(name))
        start = time.time_ns()
        bench(prog, arg)
        end = time.time_ns()

        # print("Result for {}: {} sec\n".format(name, (end-start)/MULTIPLIER))
        results.append([name, (end-start)/MULTIPLIER])

    print(tabulate.tabulate(results, headers=["Program","Execution time (sec)"]))

if __name__ == "__main__":
    main()
