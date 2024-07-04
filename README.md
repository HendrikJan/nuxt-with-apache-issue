# nuxt-with-apache-issue
Reproduction of a browser error that we get with Nuxt behind Apache.

## What is the issue

* Directly after restarting the nodejs server, when loading the page in the browser, you get the error "currentRenderingInstance is null"

## Way to reproduce the issue

### (1) starting the containers
* build the containers: `docker compose build`
* start the containers: `docker compose up`
* wait for the containers to start (mynodejs says: 'NodeJS container is up' and myapache says: '... httpd -D FOREGROUND')

### (2) starting  the nodejs container
* log in in the mynodejs container: `docker compose exec mynode bash`
* in the container run `npm install` if needed
* in the container, start nodejs: `npm run dev`

### (3) see the error in the browser the first time you load
* open your browser console
* (re)load your browser on `http://localhost:4000`
* see that the page does not load this first time
* see the error in the console: `currentRenderingInstance is null` (in FF) or `Cannot read properties of null (reading 'isCE')` (in Chromium)

### (4) see no error in the browser the second time you load
* reload the browser again on `http://localhost:4000`
* see the page loaded and no error

### (5) see no error if you open without Apache
* after runnin `npm run dev` open your browser on `http://localhost:3000`
* see the page loaded and no error