#!/bin/bash
# Shamelessly stolen from https://gist.github.com/jart/bd2f603aefe6ac8004e6b709223881c0

abort() {
	printf '%s\n' "renaming terminated." >&2
	exit 1
}

if ! LLAVA=$(test -e ./llava-main.llamafile && echo './llava-main.llamafile'); then
	printf '%s\n' "llava-main.llamafile: fatal error: update this script with the path of your llava llamafile" >&2
	printf '%s\n' "please download https://huggingface.co/jartine/llava-v1.5-7B-GGUF/resolve/main/llava-v1.5-7b-q4-main.llamafile and put it in the current working directory"
	abort
fi

if ! MISTRAL=$(test -e ./mistral-main.llamafile && echo './mistral-main.llamafile'); then
	printf '%s\n' "mistral-main.llamafile: fatal error: update this script with the path of your mistral llamafile" >&2
	printf '%s\n' "please download https://huggingface.co/jartine/mistral-7b.llamafile/resolve/main/mistral-7b-instruct-v0.1-Q4_K_M-main.llamafile and put it in the current working directory" >&2
	abort
fi

if ! CONVERT=$(command -v convert); then
	printf '%s\n' "${0##*/}: warning: convert command not found (please install imagemagick so we can analyze image formats like webp)" >&2
fi

isgood() {
	"$MISTRAL" \
		--temp 0 -ngl 35 \
		--grammar 'root ::= "yes" | "no"' \
		-p "[INST]Does the filename '${1##*/}' look like readable english text?[/INST]" \
		--silent-prompt 2>/dev/null
}

pickname() {
	"$LLAVA" \
		--image "$1" --temp 0.3 -ngl 35 \
		-n 16 \
		-p '### User: Describe this image in a single short sentence.
### Assistant:' \
		--silent-prompt 2>/dev/null
}

shuf() {
	awk 'BEGIN {srand(); OFMT="%.17f"} {print rand(), $0}' "$@" |
		sort -k1,1n |
		cut -d ' ' -f2-
}

if [ $# -eq 0 ]; then
	printf '%s\n' "${0##*/}: fatal error: missing operand" >&2
	abort
fi

if [ x"$1" = x"--help" ]; then
	printf '%s\n' "usage: ${0##*/} PATH..."
	exit
fi

for arg in "$@"; do
	if [ ! -e "$arg" ]; then
		printf '%s\n' "$arg: fatal error: file not found" >&2
		abort
	fi

	for path in $(find "$arg" -type f -print0 | tr '\0' '\n' | shuf); do
		if ! answer=$(isgood "$path"); then
			printf '%s\n' "$path: fatal error: failed to ask mistral if file needs renaming" >&2
			abort
		fi

		if [ "$answer" = "yes" ]; then
			printf '%s\n' "skipping $path (mistral says it's good)" >&2
			continue
		fi

		if ! newname=$(pickname "$path"); then
			png="${TMPDIR:-/tmp}/$$.png"
			if [ -z "$CONVERT" ]; then
				printf '%s\n' "$path: warning: llava failed to describe image (probably due to unsupported file format)" >&2
				continue
			fi
			if "$CONVERT" "$path" "$png" 2>/dev/null; then
				if newname=$(pickname "$png"); then
					rm -f "$png"
				else
					printf '%s\n' "$path: warning: llava llm failed" >&2
					rm -f "$png"
					continue
				fi
			else
				printf '%s\n' "skipping $path (not an image)" >&2
				continue
			fi
		fi

		SED=$(command -v gsed 2>/dev/null || echo 'sed')
		newname=$(printf '%s\n' "$newname" | "$SED" 's/ /_/g')

		# append original file extension to new name
		if [ x"${path%.*}" != x"$path" ]; then
			newname="$newname.${path##*.}"
		fi

		# prefix the original directory to the new name
		if [ x"${path%/*}" != x"$path" ]; then
			newname="${path%/*}/$newname"
		fi

		if [ -e "$newname" ]; then
			i=2
			while [ -e "${newname%.*}-$i.${newname##*.}" ]; do
				i=$((i + 1))
			done
			newname="${newname%.*}-$i.${newname##*.}"
		fi

		printf '%s\n' "renaming $path to $newname"
		if ! mv -n "$path" "$newname"; then
			printf '%s\n' "$newname: fatal error: failed to rename file" >&2
			abort
		fi
	done
done
