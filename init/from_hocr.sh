#!/bin/bash

AGGREGATOR_JAR=/home/fbaumgardt/ocr/bin/hocrinfoaggregator/hOCRInfoAggregator-assembly-1.0.jar
AGGREGATOR_RES=/home/fbaumgardt/ocr/bin/hocrinfoaggregator/src/main/resources

# hocrinfoaggregator: RunAll

echo "Running hOCR Info Aggregator:"
echo "java -cp $AGGREGATOR_JAR eu.himeros.hocr.RunAll $AGGREGATOR_RES $1"

java -cp $AGGREGATOR_JAR eu.himeros.hocr.RunAll $AGGREGATOR_RES $1