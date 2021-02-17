#!/bin/sh
pgrep nginx > /dev/null && echo "" || exit 1
pgrep sshd > /dev/null && echo "" || exit 1
