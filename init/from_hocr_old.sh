#!/bin/bash

ARCHIVE_ID=$1
RIGAUDON_HOME=/home/fbaumgardt/ocr/bin/rigaudon
BOOK_DIR=/home/fbaumgardt/ocr/var/texts/${ARCHIVE_ID}/${ARCHIVE_ID}_jp2
COMBINED_HOCR=/home/fbaumgardt/ocr/var/texts/${ARCHIVE_ID}/${ARCHIVE_ID}_jp2/
AGGREGATOR_JAR=/home/fbaumgardt/ocr/bin/hocrinfoaggregator/hOCRInfoAggregator-assembly-1.0.jar
AGGREGATOR_RES=/home/fbaumgardt/ocr/bin/hocrinfoaggregator/src/main/resources

# get values for $author and $title

wget -O $BOOK_DIR/${ARCHIVE_ID}_meta.xml http://www.archive.org/download/$ARCHIVE_ID/${ARCHIVE_ID}_meta.xml
AUTHOR_NAME=`python $RIGAUDON_HOME/Scripts/get_metadata.py creator $BOOK_DIR/${ARCHIVE_ID}_meta.xml`
BOOK_TITLE=`python $RIGAUDON_HOME/Scripts/get_metadata.py title $BOOK_DIR/${ARCHIVE_ID}_meta.xml`

# create a directory Name_of_the_Author-Title_of_the_work.book, where .html files and .png files will be saved

EXIST_DATA="${AUTHOR_NAME}-${BOOK_TITLE}.book"
mkdir "$BOOK_DIR/$EXIST_DATA"

# copy and rename Bruce’s .html files following the scheme: pNNNN.html and record in a file the correspondence between the original name and the new name: outXXX.html --> pNNNN.html

cd $COMBINED_HOCR
for file in *html ; do
	cp $file "$BOOK_DIR/$EXIST_DATA/o${file#*_}"
done

# convert the original images in light .png files (few Kb, black-and-white images), named iNNNN.png

cd ..
for image in *tif ; do
	img=${image%tif}
	convert -monochrome $image "$BOOK_DIR/$EXIST_DATA/i${img#*_}png"
done
for image in *jp2 ; do
	img=${image%jp2}
	convert -monochrome $image "$BOOK_DIR/$EXIST_DATA/i${img#*_}png"
done

# hocrinfoaggregator: RunAll

echo "Running hOCR Info Aggregator:"
echo "java -cp $AGGREGATOR_JAR eu.himeros.hocr.RunAll $AGGREGATOR_RES $BOOK_DIR"

java -cp $AGGREGATOR_JAR eu.himeros.hocr.RunAll $AGGREGATOR_RES $BOOK_DIR

# upload the directory containing Name_of_the_Author-Title_of_the_work.book into eXist

cd "$BOOK_DIR/$EXIST_DATA"
rm o*
cd ..