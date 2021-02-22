# OpenAPI Generator Bazel

This repo was created to integrate the OpenAPI code generation CLI with Bazel.

## Quickstart

To use the Bazel bindings provided by this repo within a Bazel workspace,
you must do the following steps:

1. Add the following code to your WORKSPACE file at the root of your repository

   ```
   load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

   http_archive(
       name = "openapi_tools_generator_bazel",
       sha256 = "bdec4feb06144a1dc0a6f9955de9f0079a98b7442275bc84a4fd00452437c945",
       urls = ["https://github.com/OpenAPITools/openapi-generator-bazel/releases/download/0.1.5/openapi-tools-generator-bazel-0.1.5.tar.gz"],
   )

   load("@openapi_tools_generator_bazel//:defs.bzl", "openapi_tools_generator_bazel_repositories")

   # You can provide any version of the CLI that has been uploaded to Maven
   openapi_tools_generator_bazel_repositories(
       openapi_generator_cli_version = "4.1.0",
   )
   ```

2. Create a BUILD.bazel file next to the .yaml file you wish to generate code from.
   The below example generates a go library within a generated directory named `petstore_go`

```
load("@openapi_tools_generator_bazel//:defs.bzl", "openapi_generator")

openapi_generator(
    name = "petstore_go",
    generator = "go",
    spec = "petstore.yaml",
)
```
