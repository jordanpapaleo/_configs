# ProTip: How to sync your Atom.io preferences across multiple computers

So maybe this is just me, but I am always developing on multiple computers.  I am not a fan of having to manually keep my dev environment consistent.  My IDE is the most volatile and most used part of my development.

My current code tool of choice is [atom.io](https://atom.io/) and the behavior I want does exist as a feature.  I would like to have multiple computers use the same atom preferences.  So let's just make this happen on our own.  

There are a few things that need to be done before you can sync you configurations.  For this demo you need to have a [Dropbox](http://www.dropbox.com) account (its free) and you need to have the app installed on you computer.  The Dropbox app gives you access to the folder structure in your cloud drive.  I am assuming that you did the default install and the Dropbox folder is located at the user root in your file system.

Also make sure you have atom installed.  You can make your ideal IDE before or after this process.

**Step 1: Create a master configuration in a shared location**

You will only do this on one computer, the computer that has the atom configuration you want to share.

Exit from atom if it is running.

In the root of your user directory on you mac is a hidden folder called `.atom`.  This holds all of you snippets, style preferences, and installed packages.  We are going to move this to your Dropbox folder.  Open your terminal app on your mac:

Verify that you have a `.atom` directory.

```
$ ls -a ~/
```
Move your `.atom` directory to your Dropbox folder.

```
$ mv ~/.atom ~/Dropbox
```

You should now have your `.atom` directory in your Dropbox folder instead of your root.  Verify that it moved.

```
$ ls -a ~/Dropbox
```

You should no longer see it in your user directory. 
```
$ ls -a ~/
```

**Step 2: Link to the shared config**

You will do this on every computer that you want to use the shared configuration.  

Make sure atom is closed.

Create a symbolic link (aka symlink) on the computer with the same name as the folder to the Dropbox folder.

```
$ ln -s ~/Dropbox/.atom ~/.atom
```

You should now be able to verify the presence of the sym link in your root directory.

```
$ ls -a ~/
```

Relaunch atom and you should be working off the same config folder.

**Additional computer step**

There are a few extra steps when you need to add an additional computer.  

As you are using content that exists in the cloud, make sure that Dropbox has synced the `.atom` directory to this computer.

Start by deleting the `.atom` folder.

```
$ rm -rf ~/.atom
```

Now you can do step 2 and things should work.

