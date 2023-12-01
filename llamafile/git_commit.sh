#!/bin/bash

if ! LLAVA=$(command -v llava-main.llamafile); then
	printf '%s\n' "llava-main.llamafile: fatal error: update this script with the path of your llava llamafile" >&2
	printf '%s\n' "please download https://huggingface.co/jartine/llava-v1.5-7B-GGUF/resolve/main/llava-v1.5-7b-q4-main.llamafile and put it in the current working directory"
	exit 1
fi

if ! MISTRAL=$(command -v mistral-main.llamafile); then
	printf '%s\n' "mistral-main.llamafile: fatal error: update this script with the path of your mistral llamafile" >&2
	printf '%s\n' "please download https://huggingface.co/jartine/mistral-7b.llamafile/resolve/main/mistral-7b-instruct-v0.1-Q4_K_M-main.llamafile and put it in the current working directory" >&2
	exit 1
fi

llava() {
	"$LLAVA" --temp 0 -p "$(
		cat <<EOT
### User: $1
### Assistant:
EOT
	)" --silent-prompt 2>/dev/null
}

if ! SED=$(command -v gsed || command -v sed); then
	echo "Cannot find sed or gsed in PATH"
	exit 1
fi

mistral() {
	"$MISTRAL" --temp 0.3 -c 0 -n 2000 -p "[INST] $1 [/INST]" --silent-prompt 2>/dev/null |
		"$SED" 's/^[ \t]*//m;s/[ \t]*$//m;s/^"//m;s/"$//m'
}

diff_summary() {
	mistral "$(
		cat <<EOT
Write a fitting git commit summary line for this git diff:
${1}
EOT
	)"
}

diff_description() {
	mistral "$(
		cat <<EOT
Describe the changes in this git diff, summarizing the changes in a list:
${1}
EOT
	)"
}

file_description() {
	mistral "$(
		cat <<EOT
Describe the changes in this git file diff, summarizing the changes in a list:
${1}
EOT
	)"
}

if ! GIT=$(command -v git); then
	echo "git command not found"
	exit 1
fi

if "$GIT" diff --cached --exit-code >/dev/null; then
	echo "No changes to commit"
	exit 0
fi

if ! files=$("$GIT" diff --name-only --relative --cached); then
	echo "Failed to list changed files"
	exit 1
fi

if ! full_diff=$("$GIT" diff --cached); then
	echo "Failed to show full diff"
	exit 1
fi

if ! full_diff_summary=$(diff_summary "$full_diff"); then
	echo "Failed to summarize full diff"
	exit 1
fi

echo "Created git commit summary" >&2

if ! full_diff_desc=$(diff_description "$full_diff"); then
	echo "Failed to describe full diff"
	exit 1
fi

echo "Described changes" >&2

commit_msg=$(
	cat <<EOT
$full_diff_summary

$full_diff_desc
EOT
)

for file in $files; do
	if ! file_diff=$("$GIT" diff --cached -- "$file"); then
		echo "Failed to get diff of file: $file"
		exit 1
	fi
	if ! file_desc=$(file_description "$file_diff"); then
		echo "Failed to describe file: $file_desc"
		exit 1
	fi
	commit_msg=$(
		cat <<EOT
$commit_msg

\`$file\`:
$file_desc
EOT
	)

	echo "Described changes in $file" >&2
done

if [ "${@#*"--dry-run"}" != "$@" ]; then
	echo "$commit_msg"
else
	if ! "$GIT" commit -m "$commit_msg"; then
		echo "Failed to commit:\n$commit_msg"
		exit 1
	fi
	echo "Committed"
fi
