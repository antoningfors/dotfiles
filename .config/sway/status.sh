while true; do 
	volume="Volume: $(amixer get Master | grep -o '[0-9]*%' | head -n 1)"
	date=$(date +'%Y-%m-%d %T')
	battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
	echo "$volume | Battery: $battery_capacity% | $date" 
	sleep 0.2 
done
