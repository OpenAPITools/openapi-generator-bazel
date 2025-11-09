def _copy_files_impl(ctx):
    input_dir = ctx.file.srcs
    regex_map = ctx.attr.regex_map

    # Get the target name, which is the path Bazel uses in the runfiles tree.
    src_workspace_path = input_dir.owner.name

    script = ctx.actions.declare_file(ctx.label.name + "_copy.sh")

    lines = [
        "#!/usr/bin/env bash",
        "set -euo pipefail",
        "",
        'RUNFILES_DIR="$(cd "$(dirname "$0")" && pwd)"', 
        'SRC_DIR="$RUNFILES_DIR/{src_path}"'.format(src_path = src_workspace_path), 
    ]

    for regex, folder in regex_map.items():
        lines += [
            'mkdir -p "{folder}"'.format(folder=folder),
            'count=0',
            'while read -r f; do',
            '  cp "$f" "{folder}/"'.format(folder=folder),
            '  chmod +w "{folder}/$(basename "$f")"',
            '  count=$((count + 1))',
            'done < <(find "$SRC_DIR" -type f | grep -E "{regex}")'.format(regex=regex),
            'echo "Copied $count files to {folder}"'.format(folder=folder),
            "",
        ]

    ctx.actions.write(
        output = script,
        content = "\n".join(lines).format(folder = folder), # The format here applies the final folder variable to the mkdir line
        is_executable = True,
    )
    return DefaultInfo(
        executable = script,
        runfiles = ctx.runfiles(files = [input_dir]),
    )

copy_files = rule(
    implementation = _post_process_files_impl,
    attrs = {
        "srcs": attr.label(
            allow_single_file = True,
            doc = "The generated directory (TreeArtifact).",
        ),
        "regex_map": attr.string_dict(
            doc = "Mapping of regex → output subfolder.",
        ),
    },
    executable = True,
    doc = "Generates a bash script that copies files from the fixed srcs directory according to regex mapping.",
)
