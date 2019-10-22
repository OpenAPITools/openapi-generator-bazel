# Copyright 2019 OpenAPI-Generator-Bazel Contributors

load(
    "//internal:openapi_generator.bzl",
    _openapi_generator = "openapi_generator",
    _openapi_tools_generator_bazel_repositories = "openapi_tools_generator_bazel_repositories",
)

openapi_generator = _openapi_generator

openapi_tools_generator_bazel_repositories = _openapi_tools_generator_bazel_repositories
