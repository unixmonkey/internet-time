internet-time
=============

Swatch(tm) Internet Timepiece app for iOS

This is a small project for me to play around with.

## What is Swatch(tm) Internet time?

http://en.wikipedia.org/wiki/Swatch_Internet_Time

Basically, instead splitting of the day into chunks of 24 hours
(or 1440 minutes, 86400 seconds, you get the point), the day is neatly divided
into 1000 units, dubbed *.beats* (yes, the dot is intentional).

Also, there are no timezones, so 433.beats is the same time whether you are in
Zurich, Tokyo, or Indianapolis. Great for arranging an online meeting across timezones
if both parties are big enough nerds to look up.


## Why would you do this?

Mostly I wanted something simple that

* Requires the use of timers
* Uses the numeric notification bubble to display said time
* Did not require doing a bunch of hackery with timezones and calendars and all that

## Project status

This is a work in progress (unless I totally just abandon it for something else), it is:

* slow (calculating the time every time instead of in setup)
* doesn't keep the notification icon updated when not running (I'll need to set up local nofitications or something)
* ugly (no icon, no design, poor rotation support)
* featureless (it tells nerd time, there are no options, iAds or in-app purchases)
* not available on the app store (you'll have to build it yourself)

## I still want this thing and am willing install it

Then you will need

* a computer
* an Xcode (v5?)
* a high tolerance for frustration
* NSSomethingOrOther
* Macintosh?

Step 1: Download this.

Step 2: Double click the thingy that isn't a folder

Step 3: Click play (or Command+r).

If that works for you, awesome. If not, you may be out of luck, as I have no idea how to do things on the computer.

File an issue as a warning to others to turn back before it is too late.


