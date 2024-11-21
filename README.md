## This project is looking for maintainers. Please refer to the [announcement](https://github.com/OpenAPITools/openapi-generator-bazel/issues/60) for more information.

# OpenAPI Generator Bazel

This repo was created to integrate the OpenAPI code generation CLI with Bazel.

If you find this project useful, please kindly consider supporting this project financially via https://opencollective.com/openapi_generator :pray:

## Quickstart

To use the Bazel bindings provided by this repo within a Bazel workspace,
you must do the following steps:

1. Add the following code to your WORKSPACE file at the root of your repository

   ```
   load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

   http_archive(
       name = "openapi_tools_generator_bazel",
       sha256 = "ada94694b10f2503c52a48427bd8589323bff5910bd1a7e5212ce34702d0af65",
       urls = ["https://github.com/OpenAPITools/openapi-generator-bazel/releases/download/v0.1.6/openapi-tools-generator-bazel-0.1.6.tar.gz"],
   )

   load("@openapi_tools_generator_bazel//:defs.bzl", "openapi_tools_generator_bazel_repositories")

   # You can provide any version of the CLI that has been uploaded to Maven
   openapi_tools_generator_bazel_repositories(
       openapi_generator_cli_version = "5.1.0",
       sha256 = "62f9842f0fcd91e4afeafc33f19a7af41f2927c7472c601310cedfc72ff1bb19"
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
