Netrunner Deck 2 HTML 
====================

This package contains Windows scripts and utilities for creation of Netrunner decks in HTML format that can be easily printed.

Installation
------------

* Install Autohotkey_L to be able to run scripts. The version used to create the scripts is included in the `Utils` directory.

Usage
-----

First, download all cards using the script `download_cards.ahk`. Inside the script `base_uri` variable points to the `netrunnerdb` service. This will download all known cards and save them in the folder `Cards`.

To create HTML for the deck, export the deck in a `.txt` format and put it in the `Decks` folder. Use `create_deck.ahk` afterwards. You can change the CSS inside the script which will allow you to set card dimensions. Afterwards, print the deck and cut it out. To export to PDF you can use Chrome browser and its "Save as PDF" function inside Print dialog < C-P >.  Eight cards fit on single page of A4 format with landescape orientation.

_Note_: Only the lines that start with a number will be considered card names. To print the identity card, insert a number 1 in front of it. Space is used to delimit the number and the card name. Lines not starting with a number will be ignored.


Script summary
--------------

- `download_cards` - Download all cards from Netrunnerdb API and store them in `Cards` folder together with JSON and log files.
- `create_decks` - Create all decks in `Decks` foldre as HTML. 
- `all_to_html` - Create HTML with all cards. First will have each card once, the second one 3 times.

About
------

By majkinetor <miodrag.milic at gmail.com>

Belgrade, 02.09.2014 
