# OneShot mod template

This is an empty project for use to make mods for OneShot. Those a scripts that sets up a working project folder for you, as well as helping you to distribute your mod, and only push and pull the relevant changes to github if desired.

## Installation instructions:

### First time install

1. Unzip the folder or clone the repository where you want your project to be on your computer.
  * (**Do this step ONLY if you installed OneShot in another library than Steam's default one.**) Go to the repository and open `b_setup.bat`, put the path of the steam library that has OneShot after `SET steam=`, for example: `SET steam=G:\SteamLibrary`
2. Go to the repository and execute b_setup.bat

Now unless you reclone the repository, you won't need to run the setup again.

### Steps to pack changes and pushing changes to github

When you want to distribute your changes, you need to _pack_ them. This will copy only the files you've modified into the `Modified` folder.
To do so, run `b_pack.bat`. If you want to distribute your mod, this is the folder to distribute (Players will override their OneShot folder on Steam with those). This is also the files to uipload to Github if you wish to do so.

### Steps to unpack changes and pulling new changes from github

Unpacking will copy all the files from the `Modified` folder onto your local project files.
To do so, run `b_unpack.bat`. If you just pulled changes from github, those will be in the `Modified` folder, so this will upack those changes aswell.
Once that is done, you can open the editor or play the game as usual.

## Usage

Open Game.rxproj with RPGXP and start modding! The project works like any other project, just save and hit play!

Version 1.3


