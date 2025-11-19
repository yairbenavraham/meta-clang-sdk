inherit populate_sdk

DESCRIPTION = "Clang SDK image with all necessary Clang/LLVM components for cross-compilation"
LICENSE = "MIT"
PR = "r0"

# Ensure headers/dev packages are included in the SDK target sysroot.
SDKIMAGE_FEATURES += "dev-pkgs"

# Target sysroot packages (for cross-compilation).
TOOLCHAIN_TARGET_TASK:append = " \
    clang \
    clang-dev \
    compiler-rt \
    libclang \
    libcxx \
    libcxx-dev \
"

# libunwind is provided by libcxx when TC_CXX_RUNTIME = "llvm"
# It's included automatically when libcxx is built with runtime-llvm override
TOOLCHAIN_TARGET_TASK:append = "${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', \
    '', ' libunwind', d)}"

# Host tools for developers (native SDK tools)
# nativesdk-clang provides nativesdk-llvm (no need to list separately), lld
# linker, and opt (LLVM optimizer) for pass plugin development.
# nativesdk-clang-dev may RDEPEND on nativesdk-clang, but both are explicitly
# listed for clarity.
TOOLCHAIN_HOST_TASK:append = " \
    nativesdk-ccache \
    nativesdk-clang \
    nativesdk-clang-dev \
    nativesdk-clang-format \
    nativesdk-cmake \
    nativesdk-compiler-rt \
    nativesdk-libclang \
    nativesdk-libcxx \
    nativesdk-ninja \
    nativesdk-pkgconfig \
    nativesdk-python3 \
"

# nativesdk-libunwind is provided by nativesdk-libcxx when TC_CXX_RUNTIME = "llvm"
TOOLCHAIN_HOST_TASK:append = "${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', \
    '', ' nativesdk-libunwind', d)}"
