# This scirpt runs on Windows (on the IDA machine)

import sys
import os
import glob
import subprocess
import threading


KTEST_TOOL="/home/david/tau/slicing/klee/tools/ktest-tool/ktest-tool"
g_terminate = False


class KTestPool(object):

    def __init__(self, dir_path, ktest_tool, binary, arg):
        self.modules = self.get_modules(dir_path)
        self.ktest_tool = ktest_tool
        self.binary = binary
        self.arg = arg
        self.lock = threading.Lock()

    def get_modules(self, dir_path):
        all_files = glob.glob(os.path.join(dir_path, "*.ktest"))
        return filter(lambda f: not self.ignore(f), all_files)

    def ignore(self, path):
        return False

    def get_module(self):
        self.lock.acquire()
        module = None
        if len(self.modules) != 0:
            module = self.modules.pop()
        self.lock.release()

        return module


class CoverageThread(threading.Thread):

    def __init__(self,
                 identifier,
                 ktest_pool,
                 group=None,
                 target=None,
                 name=None,
                 verbose=None):
        threading.Thread.__init__(self,
                                  group=group,
                                  target=target,
                                  name=name,
                                  verbose=verbose)
        self.identifier = identifier
        self.ktest_pool = ktest_pool

    def run(self):
        global g_terminate

        devnull = open("/dev/null", "w")
        while not g_terminate:
            ktest_file = self.ktest_pool.get_module()
            if ktest_file is None:
                break

            ktest_data_file = ktest_file + ".data"
            p = subprocess.Popen(
                [
                    self.ktest_pool.ktest_tool,
                    "-d",
                    ktest_data_file,
                    ktest_file,
                ],
                stdout=devnull
            )
            p.wait()

            p = subprocess.Popen(
                [
                    self.ktest_pool.binary,
                    self.ktest_pool.arg,
                    ktest_data_file,
                ]
            )
            p.wait()


class ThreadManager(object):

    def __init__(self, ktest_pool, threads_count=6):
        self.ktest_pool = ktest_pool
        self.threads_count = threads_count

    def run(self):
        threads = []

        for i in range(self.threads_count):
            thread = CoverageThread(i, self.ktest_pool)
            threads.append(thread)
            thread.start()

        for thread in threads:
            thread.join()


def main():
    if len(sys.argv) != 5:
        print "Usage: <klee_out_dir> <ktest_tool> <binary> <arg>"
        return

    _, dir_path, ktest_tool, binary, arg = sys.argv

    ktest_pool = KTestPool(dir_path, ktest_tool, binary, arg)

    thread_manager = ThreadManager(ktest_pool)
    thread_manager.run()

if __name__ == '__main__':
    main()

