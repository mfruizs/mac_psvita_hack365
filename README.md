# H-Encore MAC EASY INSTALLER (3.65)


[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://github.com/mfruizs/mac_psvita_hack365)

This project could be created from the data provided by the Reddit user [UnrealSWAT] at the following link [reddit]

# New Features!

  - Automatic download ps vita demo pkg from here [Bitter Smile] ( if not exist on your root package )
  - From QCMA intetalled path, list PSN ID
  - From PSN ID, autogenerate encrypted key on [Henkaku] web
  - Easy autoinstall all package with menu

## Installation

#### Script requires to run:
  - PsVita on 3.65 version ( only allowed )
  - [QCMA] Application installed 

#### Script dev dependencies ( [brew] ):

  - curl 
    ```sh
    $ brew install curl
    ```
  - wget
    ```sh
    $ brew install wget
    ```
#### Steps to follow

  1. Install QCMA
  2. Install commnad line library ( curl & wget ) [ if needed ]
  3. Connect psvita on PC with QCMA, leave this in the background 
  
        > this generate a PSN ID on /APP when f we are registered and logged in psn store
  4. Run the executable, when complete QCMA will notify you that the database refreshed and there should be a new addition


# DISCLAIMER

Use this script/package at your own risk. 
I do not take responsibility for any problems that may occur 
(I have tried it on my own console and have had no problems)

This is not affiliated to any company, it is only for study purposes to see how it works and to improve my development skills


License
----

GNU General Public License [v3.0]

###### MD Template from [dillinger]

**Free Software, Hell Yeah!**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)
    
   [unrealswat]: <https://www.reddit.com/user/UnrealSWAT>
   [reddit]: <https://www.reddit.com/r/vitahacks/comments/8vlrdt/hencore_mac_easy_installer>
   [henkaku]: <http://cma.henkaku.xyz/?aid=>
   [bitter smile]: <http://ares.dl.playstation.net/cdn/JP0741/PCSG90096_00/xGMrXOkORxWRyqzLMihZPqsXAbAXLzvAdJFqtPJLAZTgOcqJobxQAhLNbgiFydVlcmVOrpZKklOYxizQCRpiLfjeROuWivGXfwgkq.pkg>
   [qcma]: <https://codestation.github.io/qcma/>
   [dillinger]: <https://dillinger.io/>
   [brew]: <https://brew.sh/>
   [v3.0]: <https://www.gnu.org/licenses/gpl-3.0.html>