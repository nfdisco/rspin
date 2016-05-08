rspin
=====

Save R output (including graphics) to a document.

Specially-formatted comments can be added to the R source code in order to
make format adjustments, e.g. page breaks, and to add text.

This script is mainly intended for pretty-printing of raw R output.

How it works
------------

The R script is inserted into a template file that contains all the
knitr-related code.  This file is then processed with knitr to produce the
final document.

Currently only one template is included, which produces PDF output.  More
templates can be added easily.

Example usage
-------------

Defining a shell function is most probably a good idea:

    spintopdf () {
        [ $# -eq 1 ] || { printf "usage: $0 FILE\n"; return 1; }
        rspin -t printout -s 'format="Rtex"' -s precious=FALSE \
    	  -e 'opts_knit$set(width=90)' "$1" \
    	&& rm -f "${1%.*}".{aux,log,tex}
    }

    spintopdf <R-SCRIPT>

Templates
---------

Templates must contain valid R code.  In a template the following
substitutions take place:

* `@@SCRIPT@@`           becomes the script's contents
* `@@SCRIPTNAME@@`       becomes the script's file name
* `@@SCRIPTSHORTNAME@@`  becomes the script's file name w/o extension

The `@@SCRIPT@@` placeholder must be on a line on its own; the other ones
may occur anywhere in the template.

printout document class
-------------------------

The `printout` template relies on a LaTeX document class, included in the
`tex/` directory, that needs to be installed separatedly.  See `tex/README`
for details.

Installation
------------

    $ aclocal
    $ automake -c --add-missing
    $ autoconf
    $ ./configure
    $ make && make install

Requirements
------------

POSIX shell, GNU getopt, mktemp, ed
