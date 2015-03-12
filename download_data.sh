#!/bin/sh

mkdir data
cd data                            && \
mkdir countries
cd countries                            && \
curl -sS http://naciscdn.org/naturalearth/110m/cultural/ne_110m_admin_0_countries.zip > countries.zip && \
unzip countries                                  && \
rm countries.zip
