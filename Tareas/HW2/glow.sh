omega=.2

chmod +x circle.sh

t=0
while true
do
	clear
	radio=$(gnuplot << EOF
set print "-"
print cos($omega*$t)**2
EOF
)
	echo $radio
	./circle.sh $radio

	t=$((t + 1))
	sleep .1
done
