#!/bin/sh

## Move to data dir ##
cd data

## Download data ##
#echo Downloading unconnected major data
#echo 5m error
#curl -S --progress-bar "http://tools.geofabrik.de/osmi/view/routing/wxs?SERVICE=WFS&VERSION=1.0.0&REQUEST=GetFeature&TYPENAME=unconnected_major5" > unconnected_major5.gml
#echo 2m error
#curl -S --progress-bar "http://tools.geofabrik.de/osmi/view/routing/wxs?SERVICE=WFS&VERSION=1.0.0&REQUEST=GetFeature&TYPENAME=unconnected_major2" > unconnected_major2.gml
#echo 1m error
#curl -S --progress-bar "http://tools.geofabrik.de/osmi/view/routing/wxs?SERVICE=WFS&VERSION=1.0.0&REQUEST=GetFeature&TYPENAME=unconnected_major1" > unconnected_major1.gml


## Merging data ##
#echo Merging data files
#
#output=unconnected_major.shp
#
#for i in $(ls unconnected_major*.gml)
#do
#      if [ -f $output ]
#      then
#           echo merging $output and $i 
#           ogr2ogr -f "GML" -update -append $output $i -nln merge
#      else
#           echo creating $file
#           ogr2ogr $output $i
#fi
#done

## Intersect errors with countries
countries=countries/ne_110m_admin_0_countries.shp

