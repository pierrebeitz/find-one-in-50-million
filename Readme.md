# Find a fast way to determine some key is in a haystack of 50.000.000.

## Results

I've worked on this for 30 mins, so don't take those results for granted.
Also everything is in the context of "on my machine" (which happens to be in the class of 13" 2017 MBPs).

* RipGrep is remakably fast, somehow finding a key in an 800MB plain text file in ~750ms.
* An indexed MySQL-table needs about 6ms.
* ETS somehow claims that it does the job in 3 microseconds, not only answering whether something exists, but also bringing a payload. WTF?
