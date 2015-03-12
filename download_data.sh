#!/bin/sh

mkdir data
cd data                                             && \
echo Downloading Natural Earth country shapefiles   && \
curl -S --progress-bar http://naciscdn.org/naturalearth/110m/cultural/ne_110m_admin_0_countries.zip > countries.zip && \
unzip countries                                  && \
rm countries.zip
