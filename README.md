## This project is looking for maintainers. Please refer to the [announcement](https://github.com/OpenAPITools/openapi-generator-bazel/issues/60) for more information.

# OpenAPI Generator Bazel

This repo was created to integrate the OpenAPI code generation CLI with Bazel.

If you find this project useful, please kindly consider supporting this project financially via https://opencollective.com/openapi_generator :pray:

## Quickstart

As of v0.1.8, this only supports [Bazel Modules](https://bazel.build/external/module).  The setup is much simpler.

1. Add the following code to your  `MODULE.bazel` file at the root of your repository

```
bazel_dep(name = "openapi_tools_generator_bazel", version = "0.1.8")
openapi_gen = use_extension("@openapi_tools_generator_bazel//:extension.bzl", "openapi_gen")
openapi_gen.client(
    sha256 = "f18d771e98f2c5bb169d1d1961de4f94866d2901abc1e16177dd7e9299834721",
    version = "6.5.0",
)
use_repo(openapi_gen, "openapi_tools_generator_bazel_cli")

# Or, to use the default client (currently 7.2.0), remove the parameters to client().
openapi_gen.client() 
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
