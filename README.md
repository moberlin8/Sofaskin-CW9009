# Sofaskin-CW9009
Updated for my use _and_ most importantly updated to build from Travis CI. 

CW9009 Meridian code modifications to Sofaskin web page for Weewx originally developed by Sven at http://neoground.com/projects/weewx. Please see the readme for dependency requirements to use this skin. 

Sofaskin V1.1 is developed by Sven at Neoground: http://neoground.com/projects/weewx. This is a great template but I made some modifications to suit my needs. I also added some code from another template by <a href="http://www.dajda.net">dajda.net</a> to make the history and NOAA Tables. There is also code additions from <a href=http://www.torkel.se/weather/index.html> Björn Torkelsson</a>. A list of the changes are listed below along with instructions to setup the history tables. 

- Added more variables in the skin.conf files to help customize the pages. 
- Removed monthly and yearly summary drop down list and added a separate summaries page. 
- Used all-time records weewx variables to create records table.
- Added a station page for station history and information along with links to weather networks where data is sent.  
- Added Menu button for smaller screens.
- Auto page refresh every ten minutes.
- Added code from the dajda.net to produce history tables.The historygenerator.py script must be added to WeeWx in order for the - tables to work.
- Created a PHP page template to view the NOAA climate text files.
- Add warning if the weather data is old (more than 30 min old). (Written by Björn Torkelsson) 

<b>Responsive Menu:</b><br>
I added a better responsive menu system that would use less vertical space on smaller screen sizes.

![screenshot_20161127-062548](https://cloud.githubusercontent.com/assets/22601363/20864991/f2f14eb8-b9c2-11e6-8bba-b4043f425bbb.png)
![screenshot_20161201-124209](https://cloud.githubusercontent.com/assets/22601363/20864992/f4b96654-b9c2-11e6-8346-650fee6db484.png)
<br><br>
<b>History Table:</b><br>
The historygenerator.py script was part of a template developed by http://www.dajda.net/index.html. More information on the template is available at http://www.dajda.net/about.html and the original template is available on GitHub at 
https://github.com/brewster76/fuzzy-archer. I modify the code in historygenerator.py to create the right html links in the NOAA climate summary table and wrote a php page to view the summary. 

![template](https://cloud.githubusercontent.com/assets/22601363/20864962/3f40b91c-b9c2-11e6-8298-75bec529dc40.jpg)
<br><br>
<b>Old Data Alert:</b><br>
Displays an alert message in the header when weather data is X minutes old. The default is 30 minutes but this can be adjusted in the checkdiff.js file in the js folder. 

![olddata](https://cloud.githubusercontent.com/assets/22601363/21075763/496c385c-bed7-11e6-82e8-789ffa300601.jpg)
<br><br>
<b>Installation instructions:</b><br>
Installing the template is just like installing most other skins. You need to place the skin files in it’s own folder in the /etc/weewx/skins directory. You also need to change the skin variable to the new skin directory name in the weewx.conf file under Standard Reports. 

Example:<br>
[[StandardReport]]
skin = Sofaskin 

Lastly, you need to put the historygenerator.py python script, in the /usr/share/weewx/user directory. The skin.conf already has the code to use the tables so you don’t need to mess with that unless you want to change the colors. You should update the variables in the skin.conf file to match your station information. More information on historygenerator.py and how to use the tables is available through the links below.
https://github.com/brewster76/fuzzy-archer/blob/master/INSTALL

If you have problems, you can email me at josh@cw9009.x10host.com  
<br>
Notes:
Issue 1. Cannot apt install of weewx
```
E: The repository 'http://weewx.com/apt/weewx.list trusty Release' does not have a Release file.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
W: http://ppa.launchpad.net/couchdb/stable/ubuntu/dists/trusty/Release.gpg: Signature by key 15866BAFD9BCC4F3C1E0DFC7D69548E1C17EAB57 uses weak digest algorithm (SHA1)
```
Issue 2. wee_reports does not return fail exit to shell
```
wee_reports
   Using configuration file /etc/weewx/weewx.conf
   Generating for all time
   Traceback (most recent call last):
     File "/usr/share/weewx/weewx/reportengine.py", line 239, in run
       obj.start()
     File "/usr/share/weewx/weewx/reportengine.py", line 273, in start
       self.run()
     File "/usr/share/weewx/weewx/reportengine.py", line 440, in run
       shutil.copy(_file, dest_dir)
     File "/usr/lib/python2.7/shutil.py", line 119, in copy
       copyfile(src, dst)
     File "/usr/lib/python2.7/shutil.py", line 83, in copyfile
       with open(dst, 'wb') as fdst:
   IOError: [Errno 2] No such file or directory: '/var/www/html/weewx/backgrounds'
   
   travis_time:end:1f704e16:start=1515180214654354356,finish=1515180215198026533,duration=543672177
   [0K
   [32;1mThe command "wee_reports" exited with 0.[0m
   
   Done. Your build exited with 0.
```
