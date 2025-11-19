# meta-clang-sdk

Yocto meta layer to configure the build of your own LLVM/Clang-based standalone cross-compiler/toolchain.

## Description

This layer extends [meta-clang](https://github.com/kraj/meta-clang) to provide a complete SDK configuration for building standalone LLVM/Clang-based cross-compilation toolchains. It includes:

- Pre-configured distro settings for Clang SDK with LLVM C++ runtime (`libc++`, `libunwind`, `compiler-rt`)
- SDK image with all necessary Clang/LLVM components for cross-compilation
- Kernel compilation support with Clang (including LLVM Integrated Assembler)
- LLD linker enabled by default for faster linking
- Optimized LLVM target selection (X86 and AArch64 by default)
- Support for LLVM pass plugin development (includes `opt` tool)

## Related Projects

The [clang-sdk-community](https://github.com/yairbenavraham/clang-sdk-community) repository provides a complete example of using this `meta-clang-sdk` layer to build a Clang-based SDK for cross-compilation.

## Configuration

### LLVM Targets

By default, X86 and AArch64 targets are built. To modify targets, edit:
`recipes-devtools/llvm/llvm_%.bbappend` and modify `LLVM_TARGETS`.

Example:
```shell
LLVM_TARGETS = "X86 AArch64 ARM"
```

### C++ Runtime

The distro uses LLVM C++ runtime (`libc++`, `libunwind`, `compiler-rt`) by default. This is configured in:
`conf/distro/clang-sdk.conf` via `TC_CXX_RUNTIME = "llvm"`.

### Linker Configuration

The LLD linker is enabled by default for both target and nativesdk packages.

### Kernel Compilation

Kernel compilation with Clang is configured in `recipes-kernel/linux/linux-yocto_%.bbappend` following the [meta-clang documentation](https://github.com/kraj/meta-clang/tree/walnascar) recommendations.

## Included Components

The SDK includes comprehensive Clang/LLVM toolchain packages. See `recipes-core/images/clang-sdk-image.bb` for the complete list of target and host packages with detailed comments explaining package relationships and dependencies.

## References

- [meta-clang Documentation](https://github.com/kraj/meta-clang/tree/walnascar)

## License

MIT License - see [LICENSE](LICENSE) file for details.
