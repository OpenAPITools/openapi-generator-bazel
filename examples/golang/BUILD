load("@bazel_gazelle//:def.bzl", "gazelle")

# gazelle:prefix examples/golang
gazelle(name = "gazelle")

gazelle(
    name = "gazelle-update-repos",
    args = [
        "-from_file=go.mod",
        "-to_macro=workspace.bzl%go_dependencies",
        "-prune",
    ],
    command = "update-repos",
)
