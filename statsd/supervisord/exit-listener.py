#!/usr/bin/env python
import os
import signal

from supervisor import childutils

def main():
    while True:
        headers, _ = childutils.listener.wait()
        childutils.listener.ok()
        if headers['eventname'] != 'PROCESS_STATE_FATAL':
            continue

        os.kill(os.getppid(), signal.SIGTERM)

if __name__ == '__main__':
    main()
