Scripts to process Openstreetmap inspector data from geofabrik.de

### Dependencies
- [curl](http://curl.haxx.se/download.html)
- [ogr2ogr](http://trac.osgeo.org/gdal/wiki/DownloadingGdalBinaries)
- ```pip install gdal``` Python packages 

## Installation
- `git clone https://github.com/planemad/osmi-data-processor.git `
- `cd osmi-data-processor`
- for ubuntu: `sh install.sh`

## Run
### Unconnected Major Roads
```./unconnected_major.sh``` Converts live data stream of unconnected major road errors outputs processed CSV and SHP with iso_a2 country code of error location and error priority weight 


