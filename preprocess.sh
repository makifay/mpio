#!/usr/bin/env bash

RUBY="ruby"

function r() {
	echo "$@"
	"$@"
}

function preprocess() {
	file="$1"
	out="$(dirname "$file")/$(basename "$file" mpl)"
	r "$RUBY" mplex -rmpl "$file" -o "$out"
	if [ "$?" != 0 ]; then
		echo ""
		echo "** preprocess failed **"
		echo ""
		exit 1
	fi
}

preprocess mp/object_callback.hmpl
preprocess mp/sparse_array.hmpl
preprocess mp/sync.hmpl
preprocess mp/wavy.hmpl

