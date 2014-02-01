#!/bin/bash
## ----------------------------------------------------------------------------

VERSION=3.1.0

cd /tmp/
wget https://github.com/twbs/bootstrap/archive/v$VERSION.zip
unzip v$VERSION.zip
cd -

# these are all of the bootstrap examples
EXAMPLES=(
    starter-template
    theme
    grid
    jumbotron
    jumbotron-narrow

    navbar
    navbar-static-top
    navbar-fixed-top

    cover
    carousel
    blog
    dashboard
    signin
    justified-nav
    sticky-footer
    sticky-footer-navbar

    non-responsive
    offcanvas
)

# now copy the files over
for EXAMPLE in ${EXAMPLES[*]}; do 
    echo "--- $EXAMPLE ---"

    echo "Making new directory for this example ..."
    mkdir -p htdocs/bootstrap-v$VERSION/$EXAMPLE
    echo "... done"

    echo "Removing old index.html and css files ..."
    rm -f htdocs/bootstrap-v$VERSION/$EXAMPLE/index.html
    rm -f htdocs/bootstrap-v$VERSION/$EXAMPLE/*.css
    echo "... done"

    echo "Copying index.html and css files ..."
    cp /tmp/bootstrap-$VERSION/docs/examples/$EXAMPLE/index.html htdocs/bootstrap-v$VERSION/$EXAMPLE/
    cp /tmp/bootstrap-$VERSION/docs/examples/$EXAMPLE/*.css htdocs/bootstrap-v$VERSION/$EXAMPLE/
    echo "... done"
done

echo "Removing downloaded files ..."
# rm -rf v$VERSION.zip /tmp/bootstrap-$VERSION
echo "... done"

## ----------------------------------------------------------------------------
