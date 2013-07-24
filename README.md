Universal Transverse Mercator
=============================
Detailed information on UTM can be found at http://en.wikipedia.org/wiki/Universal_Transverse_Mercator_coordinate_system.  I had to convert a large number of UTM coordinates stored in a database for one application to latitude and longitude for use with multiple other applications.  Math not being my major the formulas described in the Wikipedia page were beyond me.  However with some Googling I discovered an Excel spreadsheet by Steve Dutch that would convert between longitude and latitude, UTM and MGRS at http://www.uwgb.edu/dutchs/usefuldata/howuseexcel.htm.  While I still didn't understand the math, it was easy enough to translate the algorithm to a SQL implementation.

UTMtoLatLong
------------
This is the raw conversion which will easily allow changes to constants used in the calculations.  The constants used here are from the World Geodetic System standard (WGS84) and the Northern hemisphere of UTM Zone 15 which covers Minnesota, Iowa, Missouri, Arkansas and Louisiana.

UTMtoLatLongWGS84Zone15
-----------------------
If you know your constants are going to be the same for all your data points, (i.e. you're always going to use the WGS84 data and all you're points are in the same hemisphere and zone) you can pre-calculate most of the equation for a smaller code footprint.  It's also potentially faster depending on the number of points you'll be converting.

