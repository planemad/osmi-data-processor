Scripts to process Openstreetmap inspector data from geofabrik.de

### Dependencies
- [curl](http://curl.haxx.se/download.html)
- [ogr2ogr](http://trac.osgeo.org/gdal/wiki/DownloadingGdalBinaries)
- Python packages ```pip install gdal```

## Installation
- git clone
- Download base data for spatial processing ```./download_data.sh```

## Run
### Unconnected Major Roads
Converts live data stream of unconnected major road errors from [OSM Inspector]() and outputs processed CSV and SHP iso_a2 country code of error location and error weight 
```./unconnected_major.sh```
