PoMaMiSe - Poor Man's Minecraft Server
======================================

PoMaMiSe is a series of scripts that allow you to share a minecraft server through dropbox
so many people can take turns hosting while keeping everything synced.

Features: 
- Automatic stopping and starting of the Dropbox client (so it's not constantly syncing and wasting bandwith)
- Automatic mapping of ports using UPnP
- Automatic assigment of server url to whichever PC is running it.

HOW TO RUN
----------

1. Create a folder somewhere in your dropbox and put all the files there. Share the folder with all the people
that will take turns to host the server.

2. Download craftbukkit to the `server` folder.

  These are the download links

  http://dl.bukkit.org/latest-rb/craftbukkit.jar OR
  http://dl.bukkit.org/latest-beta/craftbukkit-beta.jar  [if you download this one rename it to craftbukkit.jar]

  You can use vanilla if you like, just remember to rename it to `craftbukkit.jar` or modify the script files accordingly.

3. Get an account on Noip.com and add a host. E.g: 'myserver.noip.com' This is the server address the players will
use to connect

4. Run `RUN-SERVER[windows].cmd` The first time you run it NoIP DUC will ask you for your login
credentials and ask you which host you want to update. Select the one you created in step 3. 
All people hosting will have to do this the first time they run the server.

5. That's it. wait a few seconds till the server finished loading and the upnp port mapper opens 
the required ports and everyone should be able to join. When you want to close the server just tipe
'stop'in the console(no slashes) and the script will restart dropbox and start uploading. Please 
wait till dropbox finished before closing it, shutting down you computer or disconnecting from the internet


IMPORTANT
---------
If someone has JUST finished hosting and you want to start the server, wait at least ten minutes after
dropbox says that all files are synced. Most people have asymmetric connections and you'll download the files
faster than they upload it, so your dropbox will say that everything is synced while there are
actually some more files on the way.
Not following this advise will mean forking the server into two different versions and generating LOTS of 
`...(conflict from ...)` files in your Dropbox.


CREDITS
-------

PoMaMiSe by Lisandro Lorea  
UPnP PortMapper by Christoph http://upnp-portmapper.sourceforge.net/#about  
NoIP DUC Portable by NoIP.com and PortableApps.com http://portableapps.com/node/37993  
