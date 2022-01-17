notes-cast
==================

A makefile wrapper and some config stuff to make it easy to use [static-web-cast](https://github.com/jimkang/static-web-cast) to create a podcast feed from my microblog.

Usage
------------

Create a config.mk that looks like this:

    USER = <username that call install stuff>
    SERVER = <server IP or fully qualified domain name>
    WEBDIR = <path to where the web site will go>

Create a [notes-cast-config.js](notes-cast-config.js).

Then, `make sync` and schedule a cron job to run `make run` regularly.
