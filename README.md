#OneShot mod template

This is an empty project for use to make mods for OneShot. Mode of it is scripts that makes it easier to edit the game, aswell as only pushing and pulling the relevant changes to github if desired.

##Installation instructions:

###First time install

1. First make sure you have a clean OneShot install on Steam. Right-click on OneShot -> Properties -> Local Files tab -> Verify integrity of game cache
2. Clone the repository on your computer
  * (**Do this step ONLY if you installed OneShot in another library than Steam's default one.**) Go to the repository and open `b_setup.bat`, put the path of the steam library that has OneShot after `SET steam=`, for example: `SET steam=G:\SteamLibrary`
3. Go to the repository and execute b_setup.bat

Now unless you reclone the repository, you won't need to run the setup again.

###Steps after pulling new changes from github

After you pulled changes, you _must_ run "b_unpack.bat". It will apply the github changes onto you steam copy of OneShot.
Once that is done, you can open the editor or play the game as usual.

###Steps before pushing changes to github

Before you push changes, you _must_ run "b_pack.bat". It will detect all the files that are currently in your Steam folder that are different with the original OneShot files.
It'll copy those in "Modified", and we only push those files online.
Unless you know what you're doing, only files from the "Modified" repository should be available to commit.

###Steps to restore the game to vanilla on steam

Execute `b_restoreSteam.bat`. This will deleate everything on Steam, and then copy back everything from the "Original" folder. It is better to do this than Steam's "Verify integrity of game cache", because Steam won't delete files you've _added_, and so it will contaminate the "Original" folder down the line.

##Usage

Open Game.rxproj with RPGXP to modify the game. Once you've done a few changes, make sure to save the project, and start the game from Steam.
No need to do anything else.

If there's any problem, contact me @Jokie on the OneShot Discord.

Version 1.0


