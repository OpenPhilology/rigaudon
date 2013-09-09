!#/bin/bash

if [ $# -eq 2 ]

	case "$1" in

	# Run on archive
	--archive) sh from_archive.sh $2;;
	# Run on combined_hocr
	--hocr) sh from_hocr.sh $2;;
	# Run on aggregated hOCR
	--book) sh from_book.sh $2;;
	# Usage message
	echo "Please read usage message on Github (https://github.com/OpenPhilology/rigaudon)."

else

	echo "Please read usage message on Github (https://github.com/OpenPhilology/rigaudon)."

fi