#!/bin/bash
set -x
tar -cJf "../hdsentinel-gui_2.0.0.orig.tar.xz" --exclude="./debian" -C "./" .