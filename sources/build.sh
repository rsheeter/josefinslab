#!/bin/sh
set -e

# Go the sources directory to run commands
SOURCE="${BASH_SOURCE[0]}"
DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
cd $DIR
echo $(pwd)

rm -rf ../fonts

echo "Generating VFs"
fontmake -m JosefinSlab.designspace -o variable --output-path ../fonts/variable/JosefinSlab[wght].ttf
fontmake -m JosefinSlab-Italic.designspace -o variable --output-path ../fonts/variable/JosefinSlab-Italic[wght].ttf

rm -rf master_ufo/ instance_ufo/ instance_ufos/

rm -f ../fonts/variable/*.ttx
rm -f ../fonts/ttf/*.ttx
rm -f ../fonts/variable/*gasp.ttf
rm -f ../fonts/ttf/*gasp.ttf

echo "Done"
