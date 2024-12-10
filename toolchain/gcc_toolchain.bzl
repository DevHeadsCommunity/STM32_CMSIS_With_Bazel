def _gcc_arm_toolchain(ctx):
    return [
        platform_common.ToolchainInfo(
            cc_toolchain = ctx.attr.cc_toolchain[platform_common.ToolchainInfo],
        )
    ]

arm_none_toolchain = rule(
    implementation = _gcc_arm_toolchain,
    attrs = {
        "cc_toolchain": attr.label(default = Label("//toolchain:arm_none_toolchain")),
    },
)
#Definign a Toolchain rule and define it