# gmail_filter_manager
Tools to convert gmail's mailfilters.xml to yaml, and convert yaml to xml.

# Requirement

Python packages:

- rumel.yaml (pip install rumel.yaml)

# Installation

If you are using Mac and [Homebrew](https://github.com/mxcl/homebrew),
you can install by:

    $ brew install rcmdnk/rcmdnkpac/gmail_filter_manager

Otherwise, you can use install script on the web like:

    $ curl -fsSL https://raw.github.com/rcmdnk/gmail_filter_manager/install/install.sh| sh

This will install scripts to `/usr/bin`
and you may be asked root password.

If you want to install other directory, do like:

    $ curl -fsSL https://raw.github.com/rcmdnk/gmail_filter_manager/install/install.sh|  prefix=~/usr/local/ sh

Or, simply download scripts in bin/ and place where you like.
