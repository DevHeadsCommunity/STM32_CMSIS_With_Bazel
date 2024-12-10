cc_binary(
    name = "firmware",
    srcs = [
        "Sources/main.c",
        "Core/Startup/startup_stm32f446retx.c"
    ],
    includes = [
        "Core/CMSIS/Device",  # CMSIS Device headers
        "Core/CMSIS/Include"  # CMSIS Include headers
    ],
    deps = [
        "//toolchain:arm_none_toolchain",  # Specify toolchain for ARM compilation
    ],
)