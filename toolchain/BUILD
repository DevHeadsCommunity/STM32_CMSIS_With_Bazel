load(":cortex_m4_toolchain.bzl", "cortex_m4_toolchain_config")

filegroup(name = "empty")

# Define the Cortex-M4 toolchain configuration
cortex_m4_toolchain_config(
    name = "cortex_m4_config"
);

cc_toolchain(
    name = "cortex_m4_toolchain",
    toolchain_identifier = "local",
    toolchain_config = ":cortex_m4_config",
    all_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = False,
)

# Define the toolchain for a platform that supports Cortex-M4
toolchain(
    name = "cortex_m4_toolchain_from_linux_x86_64",
    exec_compatible_with = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
    target_compatible_with = [
        "//platform:bare_metal",
        "@platforms//cpu:arm",  # Use ARM as the target architecture
    ],
    toolchain = ":cortex_m4_toolchain",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)
