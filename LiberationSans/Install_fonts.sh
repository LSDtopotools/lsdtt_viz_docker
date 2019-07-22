# This script enables the Liberation Sans font 
# WARNING This needs to be run from the directory where the fonts are located
# Written by Simon M Mudd
# 24-March-2019

# Figure out where we are
thisdir="$PWD"
echo "We are here:"
echo $thisdir

# Get the destination directory
destdir="/usr/share/fonts/truetype/LiberationSans/"
echo "Destdir is"
echo $destdir

# Make the directory if it doesnt exist
if [ ! -d "$destdir" ]
then
    echo "Making the font directory"
    mkdir $destdir
else
    echo "Directory exists"
fi



bf="LiberationSans-Bold.ttf"
bif="LiberationSans-BoldItalic.ttf"
if="LiberationSans-Italic.ttf"
rf="LiberationSans-Regular.ttf"

echo $thisdir/$bf

echo "Copying files"
if [ ! -f "$destdir$bf" ]
then
  cp $thisdir/$bf $destdir$bf
fi
if [ ! -f "$destdir$bif" ]
then
  cp $thisdir/$bif $destdir$bif
fi
if [ ! -f "$destdir$if" ]
then
  cp $thisdir/$if $destdir$if
fi
if [ ! -f "$destdir$rf" ]
then
  cp $thisdir/$rf $destdir$rf
fi

# Now register the fonts
fc-cache -fv

# This is for matplotlib
rm -fr ~/.cache/matplotlib

# Now check on fonts
fc-list | grep LiberationSans
