rit.ai
=======

### Requirements

* [Purescript >= 0.13](https://github.com/purescript/purescript)
* [Spago](https://github.com/spacchetti/spago)
* [Parcel](https://parceljs.org) 
* npm or yarn

### Installation

To install purescript and node dependencies run.

    make install

To switch between npm/yarn you can change the 
PCK_MANAGER=yarn variable in Makefile

### Running the server

    make server

This will build the code, bundle it for browsers and run 
the server on port 8080 by default. 

### Environment variables

Environment variables can be added to a .env file
located at the root of the project.

**PORTNR**

Sets the port of the server (defaults to 8080)
