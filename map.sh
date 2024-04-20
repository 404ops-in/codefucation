find $1 -not -path '*/\.*' -type f -print0 | xargs -0 -n1 printf '%s\n' >temp
