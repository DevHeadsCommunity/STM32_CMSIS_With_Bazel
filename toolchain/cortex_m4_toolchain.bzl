load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl", "feature", "tool_path", "flag_group", "flag_set")
load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")
# load("@bazel_tools//tools/cpp:cc_common.bzl", "CcToolchainConfigInfo", "cc_common")


def _impl(ctx):
    # List of tools for ARM Cortex-M4
    toolchain_tools = ["gcc", "ld", "ar", "cpp", "gcov", "nm", "objdump", "strip"]
    tool_paths = [tool_path(name = tool, path = "/usr/bin/arm-none-eabi-{}".format(tool)) for tool in toolchain_tools]

    # Actions for assembling and compiling
    ASSEMBLE_ACTIONS = [
        ACTION_NAMES.assemble,
        ACTION_NAMES.preprocess_assemble,
    ]
    
    COMPILE_ACTIONS = [
        ACTION_NAMES.cpp_compile,
        ACTION_NAMES.c_compile
    ]
    
    ASSEMBLE_AND_COMPILE_ACTIONS = ASSEMBLE_ACTIONS + COMPILE_ACTIONS

    # Architecture and ABI for Cortex-M4
    arch_abi = feature(
        name = "arch_and_abi",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = ASSEMBLE_AND_COMPILE_ACTIONS,
                flag_groups = [
                    flag_group(
                        flags = ["-mcpu=cortex-m4", "-mthumb", "-mfloat-abi=hard", "-mfpu=fpv4-sp-d16"],
                    ),
                ],
            )
        ],
    )

    # Linker flags for static linking without standard libraries
    LINK_ACTIONS = [
        ACTION_NAMES.cpp_link_executable,
    ]
    
    link_static_no_stdlib = feature(
        name = "link_static_no_stdlib",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = LINK_ACTIONS,
                flag_groups = [
                    flag_group(
                        flags = ["-Wl,--no-dynamic-linker", "-static", "-nostdlib"],
                    ),
                ],
            )
        ],
    )

    # No build ID during linking
    no_build_id = feature(
        name = "no_build_id",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = LINK_ACTIONS,
                flag_groups = [
                    flag_group(
                        flags = ["-Wl,--build-id=none"],
                    ),
                ],
            )
        ],
    )
    
    # List of features
    features = [arch_abi, link_static_no_stdlib, no_build_id]
    
    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        toolchain_identifier = "local",
        host_system_name = "local",
        target_system_name = "local",
        target_cpu = "arm",
        target_libc = "newlib",  # Newlib for bare-metal ARM
        compiler = "gcc",         # Use GCC for ARM
        abi_version = "unknown",
        abi_libc_version = "unknown",
        tool_paths = tool_paths,
        cxx_builtin_include_directories = [
            "/usr/lib/gcc/arm-none-eabi/14.2.0/include/",
            "/usr/arm-none-eabi/include/",
        ],
        features = features,
    )

# Rule to create the toolchain
cortex_m4_toolchain_config = rule(
    implementation = _impl,
    attrs = {},
    provides = [CcToolchainConfigInfo],
)
