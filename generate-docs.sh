#!/usr/bin/env bash

rm -rf GitHelper/
rm -rf js/
rm -rf css/
rm *.html
yard
mv doc/* ./
rm -rf doc
