"modules extension to use with openapi-generator-bazel"
load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def _openapi_generator_impl(module_ctx):
    for mod in module_ctx.modules:
        for install in mod.tags.client:
            jvm_maven_import_external(
                name = "openapi_tools_generator_bazel_cli",
                artifact_sha256 = install.sha256,
                artifact = "org.openapitools:openapi-generator-cli:" + install.version,
                server_urls = install.server_urls,
            )

_cli = tag_class(attrs = {
    "version": attr.string(
        default = "7.17.0",
    ),
    "sha256": attr.string(
        default = "25d6bd8273dd2be99979d544b62ea43f0ce1975f1aa582678b5093d1e7fcfce8",
    ),
    "server_urls": attr.string_list(
        default = ["https://repo1.maven.org/maven2"],
    ),
})
openapi_gen = module_extension(
    implementation = _openapi_generator_impl,
    tag_classes = {"client": _cli},
)

