Scripts to process Openstreetmap inspector data from geofabrik.de

## Installation
- git clone
- Download base data for spatial processing ```./download_data.sh```

## Unconnected Major Roads
Converts live data stream of unconnected major road errors and outputs CSV and SHP of errors with added fields of error_rank and country_code
```./unconnected_major.sh```
