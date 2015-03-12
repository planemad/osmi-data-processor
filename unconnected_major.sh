#!/bin/sh

## Download data on first run ##
if [ ! -d "data" ]; then
  ./download_data.sh
fi

## Move to data dir ##
cd data

## Download data ##
echo Downloading unconnected major data
echo 5m errors
curl -S --progress-bar "http://tools.geofabrik.de/osmi/view/routing/wxs?SERVICE=WFS&VERSION=1.0.0&REQUEST=GetFeature&TYPENAME=unconnected_major5" > unconnected_major5.gml
echo 2m errors
curl -S --progress-bar "http://tools.geofabrik.de/osmi/view/routing/wxs?SERVICE=WFS&VERSION=1.0.0&REQUEST=GetFeature&TYPENAME=unconnected_major2" > unconnected_major2.gml
echo 1m errors
curl -S --progress-bar "http://tools.geofabrik.de/osmi/view/routing/wxs?SERVICE=WFS&VERSION=1.0.0&REQUEST=GetFeature&TYPENAME=unconnected_major1" > unconnected_major1.gml

# Merging data ##
echo Merging data files

output=unconnected_major.shp

for i in $(ls unconnected_major*.gml)
do
      if [ -f $output ]
      then
           echo Merging $output and $i 
           ogr2ogr -f "GML" -update -append $output $i -nln unconnected_major
      else
           echo Creating output file
           ogr2ogr $output $i
fi
done

## Intersect errors with countries
echo Interscting errors with country shapes
cd ..
python unconnected_intersect.py

## Processing output
mkdir output
echo Converting SHP to CSV
rm output/unconnected_major.csv
ogr2ogr -F "CSV" output/unconnected_major.csv data/output.shp -lco GEOMETRY=AS_XY

