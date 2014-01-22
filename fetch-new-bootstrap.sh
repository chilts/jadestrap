#!/bin/bash
## ----------------------------------------------------------------------------

VERSION=3.0.3

cd /tmp/
wget https://github.com/twbs/bootstrap/archive/v$VERSION.zip
unzip v$VERSION.zip
cd -

# these are all of the bootstrap examples
EXAMPLES=(
    carousel
    grid
    jumbotron
    jumbotron-narrow
    justified-nav
    navbar
    navbar-fixed-top
    navbar-static-top
    non-responsive
    offcanvas
    signin
    starter-template
    sticky-footer
    sticky-footer-navbar
    theme
)

# now copy the files over
for EXAMPLE in ${EXAMPLES[*]}; do 
    echo "--- $EXAMPLE ---"

    echo "Making new directory for this example ..."
    mkdir -p bootstrap-v$VERSION/$EXAMPLE
    echo "... done"

    echo "Removing old index.html and css files ..."
    rm -f bootstrap-v$VERSION/$EXAMPLE/index.html
    rm -f bootstrap-v$VERSION/$EXAMPLE/*.css
    echo "... done"

    echo "Copying index.html and css files ..."
    cp /tmp/bootstrap-$VERSION/examples/$EXAMPLE/index.html bootstrap-v$VERSION/$EXAMPLE/
    cp /tmp/bootstrap-$VERSION/examples/$EXAMPLE/*.css bootstrap-v$VERSION/$EXAMPLE/
    echo "... done"
done

echo "Removing downloaded files ..."
rm -rf v$VERSION.zip /tmp/bootstrap-$VERSION
echo "... done"

## ----------------------------------------------------------------------------
