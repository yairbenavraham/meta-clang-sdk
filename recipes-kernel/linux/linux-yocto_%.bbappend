TOOLCHAIN:forcevariable = "clang"

DEPENDS:append:toolchain-clang = " clang-cross-${TARGET_ARCH}"

# Configure kernel compilation with Clang
# According to meta-clang documentation:
# https://github.com/kraj/meta-clang/tree/walnascar
# KERNEL_CC:toolchain-clang = "${CCACHE}clang ${HOST_CC_KERNEL_ARCH} -fuse-ld=lld ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH}"
KERNEL_LD:toolchain-clang = "${CCACHE}ld.lld"
KERNEL_AR:toolchain-clang = "${CCACHE}llvm-ar"

# Enable LLVM Integrated Assembler (recommended for newer kernels)
# Newer kernels enable this by default, but explicitly setting it ensures compatibility
do_compile:prepend:toolchain-clang() {
    export LLVM_IAS=1
}

do_compile_kernelmodules:prepend:toolchain-clang() {
    export LLVM_IAS=1
}
