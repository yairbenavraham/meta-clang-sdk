# Enable lld as the default linker for clang
# This provides faster linking compared to the default GNU ld linker.
# Note: compiler-rt, libc++, and libunwind are already enabled via
# PACKAGECONFIG when TC_CXX_RUNTIME = "llvm" (set in clang-sdk.conf)
PACKAGECONFIG:append:class-target = " lld"
PACKAGECONFIG:append:class-nativesdk = " lld"

# Limit parallel build jobs to number of CPUs minus 4 to prevent system overload
PARALLEL_MAKE = "-j${@max(1, int(oe.utils.cpu_count()) - 4)}"
PARALLEL_MAKEINST = "-j${@max(1, int(oe.utils.cpu_count()) - 4)}"

# Install KaleidoscopeJIT.h header for LLVM tutorial support
do_install:append() {
    install -d ${D}${includedir}
    install -m 0644 ${S}/llvm/examples/Kaleidoscope/include/KaleidoscopeJIT.h ${D}${includedir}/
}
