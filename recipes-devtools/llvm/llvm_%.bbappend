# Limit parallel build jobs to number of CPUs minus 4 to prevent system overload
PARALLEL_MAKE = "-j${@max(1, int(oe.utils.cpu_count()) - 4)}"
PARALLEL_MAKEINST = "-j${@max(1, int(oe.utils.cpu_count()) - 4)}"

EXTRA_OECMAKE += "\
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
"
