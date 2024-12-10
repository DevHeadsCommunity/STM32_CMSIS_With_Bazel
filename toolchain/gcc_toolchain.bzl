load("@bazel_tools//tools/cpp:toolchain_utils.bzl", "find_cpp_toolchain")

# Define the actual ARM GCC toolchain for use by Bazel
def _arm_none_toolchain_impl(ctx):
    # Specify the compiler, linker, and other tools for the ARM target
    return [
        DefaultInfo(
            files = depset([
                ctx.attr.all_files,
                ctx.attr.compiler_files,
                ctx.attr.linker_files,
                ctx.attr.strip_files,
                ctx.attr.objcopy_files,
                ctx.attr.dwp_files,
            ]),
            toolchains = [ctx.toolchains],
        )
    ]

arm_none_toolchain = rule(
    implementation = _arm_none_toolchain_impl,
    attrs = {
        "all_files": attr.label_list(),
        "compiler_files": attr.label_list(),
        "linker_files": attr.label_list(),
        "strip_files": attr.label_list(),
        "objcopy_files": attr.label_list(),
        "dwp_files": attr.label_list(),
        "toolchain_config": attr.label(),
    },
)