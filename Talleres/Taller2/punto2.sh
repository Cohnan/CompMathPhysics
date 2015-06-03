sed 's/\.//g' pgn.dat | sed -E 's/,([0-9])/.\1/g' | sed -E 's/ ([0-9]|\()/\t\1/g' | sed 's/)//g' | sed 's/(/-/g' > pgn.tsv

head -29 pgn.tsv | sort --field-separator=$'\t' -k 6,6 | head -1
