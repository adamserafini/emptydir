# tidyup

A tiny script for tidying up. The Bash equivalent of shoving everything on your
desk into a drawer:

    tidyup Desktop

Moves the contents of `~/Desktop` into a folder called
`~/Backups/Desktop/<todaysdate>` leaving your working directories nice and
tidy again.

Works with multiple directories at the same time, which each get their own
folder in `~/Backups`:

    tidyup Downloads Receipts

Moves contents into `~/Backups/Downloads/<todaysdate>` and
`~/Backups/Receipts/<todaysdate>`.

Nested directories get their own folder respecting the original hierarchy:

    tidyup Documents/Invoices

Moves contents into `~/Backups/Documents/Invoices/<todaysdate>`

## Installation

Run the following at command line:

    curl https://raw.githubusercontent.com/adamserafini/tidyup/master/install.sh | sh
