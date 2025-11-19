# Enable lld as the default linker for clang
# This provides faster linking compared to the default GNU ld linker.
# Note: compiler-rt, libc++, and libunwind are already enabled via
# PACKAGECONFIG when TC_CXX_RUNTIME = "llvm" (set in clang-sdk.conf)
PACKAGECONFIG:append:class-target = " lld"
PACKAGECONFIG:append:class-nativesdk = " lld"
