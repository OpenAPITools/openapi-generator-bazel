# Copyright 2019 OpenAPI-Generator-Bazel Contributors

workspace(name = "openapi_tools_generator_bazel")

load("//:defs.bzl", "openapi_tools_generator_bazel_repositories")
openapi_tools_generator_bazel_repositories()

# Load rules_pkg
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
    name = "rules_pkg",
    url = "https://github.com/bazelbuild/rules_pkg/releases/download/0.3.0/rules_pkg-0.3.0.tar.gz",
    sha256 = "6b5969a7acd7b60c02f816773b06fcf32fbe8ba0c7919ccdc2df4f8fb923804a",
)
load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")
rules_pkg_dependencies()
