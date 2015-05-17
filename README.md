CONCERTS
========

by DAVID GARBER
================

REQUIREMENTS
============

ruby v. 2.2.2 POSTGRES v. 9.4.1

INSTALLATION
============

Run command $ postgres in terminal.

Run command $ psql to start PSQL.

$ rake db:migrate

In Bash run: $ bundle install

then run: $ ruby app.rb

In your browser go to: localhost:4567

ABOUT
=====

Concerts is a program where a user can add bands and venues. The user can also add
venues where a band has played, as well as, bands that have played at venues.

COPYRIGHT 2015
==============

LICENSING
=========

Ask nicely.

KNOWN BUGS
==========

Only one venue can be added to a band and only one band can be added to a venue.
It wasn't always like that. At some point, it worked.
