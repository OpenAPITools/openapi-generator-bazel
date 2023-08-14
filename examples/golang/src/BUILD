load("@openapi_tools_generator_bazel//:defs.bzl", "openapi_generator")
load("@aspect_bazel_lib//lib:copy_to_directory.bzl", "copy_to_directory")
load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

openapi_generator(
    name = "petstore",
    generator = "go-gin-server",
    spec = "petstore.yml",
)

copy_to_directory(
    name = "petstore.go",
    srcs = [":petstore"],
    exclude_srcs_patterns = ["**/main.go"],
    include_srcs_patterns = ["**/*.go"],
)

go_library(
    name = "petstore_lib",
    srcs = [":petstore.go"],
    importpath = "petstore",
    visibility = ["//visibility:private"],
    deps = ["@com_github_gin_gonic_gin//:gin"],
)

go_library(
    name = "server_lib",
    srcs = ["main.go"],
    importpath = "examples/golang",
    visibility = ["//visibility:private"],
    deps = [":petstore_lib"],
)

go_binary(
    name = "server",
    embed = [":server_lib"],
    visibility = ["//visibility:public"],
)
