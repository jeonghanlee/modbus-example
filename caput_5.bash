


while true; do

    for i in $(seq 0 7);
    do
	printf ">>>  "
	date '+%Y-%m-%d %H:%M:%S' 
	echo "------------------------------------------"
	caput LBNL:MODBUSIOC::BI"$i"B-DigitalInput"$i" Open
	sleep "${PAUSE}"
	echo ""
    done
    for i in $(seq 0 7);
    do
	printf ">>>  "
	date '+%Y-%m-%d %H:%M:%S' 
	echo "------------------------------------------"
	caput LBNL:MODBUSIOC::BI"$i"B-DigitalInput"$i" Closed
	sleep "${PAUSE}"
	echo ""
    done    
done  
