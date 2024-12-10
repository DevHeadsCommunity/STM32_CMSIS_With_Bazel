load("//toolchain:gcc_toolchain.bzl", "arm_none_toolchain")

arm_none_toolchain(
    name = "gcc_arm_toolchain",
)

filegroup(
    name = "all_files",
    srcs = glob([
        "third_party/gcc/*",
    ]),
)

filegroup(
    name = "compiler_files",
    srcs = ["third_party/gcc/arm-none-eabi-gcc"],
)

filegroup(
    name = "linker_files",
    srcs = ["third_party/gcc/arm-none-eabi-ld"],
)

filegroup(
    name = "strip_files",
    srcs = ["third_party/gcc/arm-none-eabi-strip"],
)


filegroup(
    name = "objcopy_files",
    srcs = ["third_party/gcc/bin/arm-none-eabi-objcopy"],  # Replace with the correct path to objcopy
)

filegroup(
    name = "dwp_files",
    srcs = ["third_party/gcc/bin/arm-none-eabi-dwp"],  # Replace with the correct path to dwp tool
)

filegroup(
    name = "toolchain_config",
    srcs = ["//toolchain:toolchain_config.bzl"],  # Path to your toolchain config if you have one
)


cc_toolchain(
    name = "arm_none_toolchain",
    all_files = ":all_files",
    compiler_files = ":compiler_files",
    linker_files = ":linker_files",
    strip_files = ":strip_files",
    objcopy_files = ":objcopy_files",  # Add the objcopy_files
    dwp_files = ":dwp_files",  # Add the dwp_files
    toolchain_config = ":toolchain_config",  # Add the toolchain_config
)
