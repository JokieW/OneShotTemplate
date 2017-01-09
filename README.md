#OneShot mod template

This is an empty project for use to make mods for OneShot. Mode of it is scripts that makes it easier to edit the game, aswell as only pushing and pulling the relevant changes to github if desired.

##Installation instructions:

###First time install

1. First make sure you have a clean OneShot install on Steam. Right-click on OneShot -> Properties -> Local Files tab -> Verify integrity of game cache
2. Clone the repository on your computer
  * (**Do this step ONLY if you installed OneShot in another library than Steam's default one.**) Go to the repository and open `b_setup.bat`, put the path of the steam library that has OneShot after `SET steam=`, for example: `SET steam=G:\SteamLibrary`
3. Go to the repository and execute b_setup.bat

Now unless you reclone the repository, you won't need to run the setup again.

###Steps to pack changes and pushing changes to github

After you've got a bunch of work done, you need to _pack_ them. This will copy only the files you've modified into the `Modified` folder. _**Your changes are only safe once they've been packed!**_.
To do so, run `b_pack.bat`. If you want to distribute your mod, this is the folder to distribute (Players will override their OneShot folder on Steam with those). This is also the files to uipload to Github if you wish to do so.

###Steps to unpack changes and pulling new changes from github

Unpacking will copy all the files from the `Modified` folder onto your steam OneShot folder. You want to Unpack after changing mod projects, after a steam update, or after you cleaned the steam install.
To do so, run `b_unpack.bat`. If you just pulled changes from github, those will be in the `Modified` folder, so this will upack those changes aswell.
Once that is done, you can open the editor or play the game as usual.

###Steps to restore the game to vanilla on steam

Execute `b_restoreSteam.bat`. This will deleate everything on Steam, and then copy back everything from the "Original" folder. It is better to do this than Steam's "Verify integrity of game cache", because Steam won't delete files you've _added_, and so it will contaminate the "Original" folder down the line.

##Usage

Open Game.rxproj with RPGXP to modify the game. Once you've done a few changes, make sure to save the project, and hit the play button! It calls a small application I made that will make Steam open it for you.
No need to do anything else.

Remember however that since you are editing the Steam files directly, you mod is not safe until you pack your files. Steam might decide to update your game and overwrite your work. So be sure to pack every so often.

If there's any problem, contact me @Jokie✿ on the OneShot Discord.

Version 1.2


