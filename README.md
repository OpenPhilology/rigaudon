Rigaudon
========

Polytonic Greek OCR engine derived from Gamera, based on the work of Dalitz and Brandt <http://gamera.informatik.hsnr.de/addons/greekocr4gamera/index.html> and maintained by [Bruce Robertson](https://github.com/brobertson) and the [OpenPhilology Project](https://github.com/OpenPhilology).

### Usage

Run on archive.org doc: rigaudon.sh --archive <archive name>
Run on OCR results: rigaudon.sh --hocr <combined hocr folder>
Run on aggregated hOCR: rigaudon.sh --book <folder containing .book>

*Please note that the `--hocr` process will only perform aggregation. To load the results into the DB, please use `--book`.*