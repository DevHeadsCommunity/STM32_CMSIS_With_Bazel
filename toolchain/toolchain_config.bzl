load("@bazel_tools//tools/cpp:cc_toolchain_config.bzl", "cc_toolchain_config")

# Define the toolchain configuration
cc_toolchain_config(
    name = "arm_toolchain_config",
    toolchain = ":arm_none_toolchain",  # Link to the actual toolchain
    cpp = ":compiler_files",  # Path to the C++ compiler (e.g., arm-none-eabi-gcc)
    as = ":compiler_files",   # Path to the assembler (arm-none-eabi-as)
    ld = ":linker_files",     # Path to the linker (arm-none-eabi-ld)
    ar = ":strip_files",      # Path to the archiver (arm-none-eabi-ar)
    objcopy = ":objcopy_files",  # Path to objcopy tool (arm-none-eabi-objcopy)
    dwp = ":dwp_files",        # Path to DWARF tool (arm-none-eabi-dwp)
)