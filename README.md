Netrunner Deck Maker 
====================

This package contains scripts and utilities for creation of Netrunner decks in HTML format that can be easily printed.

Installation
------------

* Install Autohotkey_l to be able to run scripts. Version used to create scripts is included in `Utils` directory.

Usage
-----

First download all cards using script `download_cards.ahk`. Inside the script `base_uri` variable points to `netrunnerdb` service. This will download all known cards and save them in the folder `Cards`.

To create HTML for the deck, export your deck in a `.txt` format and put it in the `Decks` folder. Use `create_deck.ahk` afterwards and change `deck` variable to point to your deck. You can change the CSS inside the script (that is, set image dimensions).
_Note_: Only lines that start with the number will be considered as card names. To print identity card, insert number 1 in front of it (use space to delimit card name and number).

Afterwards, print the deck and cut it out.

To export to PDF you can use Chrome browser and its "Print to PDF" function.

Script summary
--------------

- `download_cards` - Download all cards from Netrunnerdb API and store them in `Cards` folder together with json and log files.
- `create_deck` - Create deck as HTML. Set name within script. Deck must be in directory `Decks`.
- `all_to_html` - Create HTML with all cards. First will have each card once, the second one 3 times.

About
------

By majkinetor <miodrag.milic at gmail.com>

Belgrade, 02.09.2014 
