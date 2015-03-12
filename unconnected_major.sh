#!/bin/sh

## Move to data dir ##
cd data

## Download data ##
echo Downloading unconnected major data
echo 5m error
#curl -S --progress-bar "http://tools.geofabrik.de/osmi/view/routing/wxs?SERVICE=WFS&VERSION=1.0.0&REQUEST=GetFeature&TYPENAME=unconnected_major5" > unconnected_major5.gml
echo 2m error
#curl -S --progress-bar "http://tools.geofabrik.de/osmi/view/routing/wxs?SERVICE=WFS&VERSION=1.0.0&REQUEST=GetFeature&TYPENAME=unconnected_major2" > unconnected_major2.gml
echo 1m error
#curl -S --progress-bar "http://tools.geofabrik.de/osmi/view/routing/wxs?SERVICE=WFS&VERSION=1.0.0&REQUEST=GetFeature&TYPENAME=unconnected_major1" > unconnected_major1.gml


## Merging data ##
echo Merging data files

file=merge.gml

for i in $(ls unconnected_major*.gml)
do
      if [ -f $file ]
      then
           echo merging $i  
           ogr2ogr -f "GML" -update -append $file $i -nln merge
      else
           echo creating merge.gml
           ogr2ogr -f "GML" $file $i
fi
done