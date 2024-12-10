# Define the bare-metal constraint value for ARM
constraint_value(
    name = "bare_metal",
    constraint_setting = "@platforms//os",
    visibility = ["//visibility:public"],
)

# Define the platform for Cortex-M4 bare-metal target
platform(
    name = "cortex_m4_bare_metal",
    constraint_values = [
        ":bare_metal",
        "@platforms//cpu:arm",  # Change from riscv64 to arm
    ],
)
