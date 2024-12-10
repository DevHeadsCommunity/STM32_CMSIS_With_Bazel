cc_library(
    name = "cmsis",
    hdrs = glob([
        "Core/CMSIS/Device/*.h", 
        "Core/CMSIS/Include/*.h"
    ]),
    visibility = ["//visibility:public"],  # Ensure visibility is public so it's usable by other targets
)

cc_binary(
    name = "firmware",
    srcs = [
        "Sources/main.c", 
        "Core/Startup/startup_stm32f446retx.c",
    ],
    copts = [
        "-mcpu=cortex-m4",
        "-mthumb",
        "-g",
        "-O2",
        "-ffunction-sections",
        "-fdata-sections",
        "-DSTM32F446xx",
    ],
    linkopts = [
        "-T STM32F446RETX_FLASH.ld",
        "-nostartfiles",
        "-Wl,--gc-sections",
    ],
    deps = [
        "//:cmsis",  # Reference the 'cmsis' library
    ],
)
