#!/usr/bin/env bash

BUCKET=s3://dev.somos.world

echo "Building Sass Assets"
cd web/sass && (npm run build)
cd ../..

echo "Building Elm Assets..."
./build.sh

echo "Publishing New Assets..."
aws s3 cp web/index.html $BUCKET --profile tap-in
aws s3 cp web/elm.min.js $BUCKET --profile tap-in
aws s3 cp web/css/ $BUCKET/css/ --recursive --profile tap-in
aws s3 cp web/fonts/ $BUCKET/fonts/ --recursive --profile tap-in
