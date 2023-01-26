#!/bin/sh
set -e

rm -rf build
mkdir -p build/{fontc,fontmake}

echo "Not building Josefine Slab Italic because it has non-interpolatable paths"

echo "Build with fontmake..."
pushd sources
fontmake -m JosefinSlab.designspace -o variable --output-path ../build/fontmake/JosefinSlab[wght].ttf
#fontmake -m JosefinSlab-Italic.designspace -o variable --output-path ../build/fontmake/JosefinSlab-Italic[wght].ttf
popd

rm -rf master_ufo/ instance_ufo/ instance_ufos/

find build/ -name '*.ttx' -delete
find build/ -name '*gasp.ttf' -delete

echo "Build with fontc using completely reasonable path assumptions..."
export RUST_BACKTRACE=1
../fontmake-rs/target/debug/fontc --source sources/JosefinSlab.designspace --build-dir build/fontc
#../fontmake-rs/target/debug/fontc --source sources/JosefinSlab-Italic.designspace --build-dir build/fontc

echo "Done"
