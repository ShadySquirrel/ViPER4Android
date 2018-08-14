# [ABANDONED] ViPER4Android Magisk module

#**WARNING**: THIS MODULE ISN'T MAINTAINED ANYMORE. IT WILL WORK AS LONG AS MAGISK TEMPLATE DOESN'T CHANGE, BUT THERE WILL BE NO MORE UPDATES AND/OR SUPPORT. Thank you for understanding.

This is a simple V4A module, for no frills setup - you simply grab it, flash it and use it.

No configuration, no additional frameworks, no special requirements, no hacks, no mess. *It just works.*

Module is based on original module made by [topjohnwu](https://github.com/topjohnwu).

Uses ViPER4Android 2.5.0.4 driver and **includes** [ViPER4Android FX Materialized](https://labs.xda-developers.com/store/app/com.pittvandewitt.viperfx), so you don't have to install anything.

*PLEASE*, read this whole file before you try to install this module. It's your best interest to do so.

**WARNINGS/INFO**:
1. App is installed to `/system/priv-app`, ofc. systemlessly, and may clash with app systemizer modules. **If you experience that, uninstall the module, remove app from the zip, reinstall module and install the app manually**
2. **This module is compatible with *new* Audio Mod library**. Combining with with other audio mods, *without AML* will produce issues. Consider that before reporting.
3. This module doesn't require permissive sepolicy; if you still encounter SEPolicy issues, please refer to [support section](README.md#support) of this document.

## Requirements
* Android 5.0+ with fully functional Magisk installation,
* **No other non-AML sound mods installed** - if you have any non-AML sound mods, remove them before this module is installed,
* ARM/ARM64, x86 or x86_64 device with NEON support.

## Compatibility
* Android 5.x - Android 8.x
* Magisk v15 and later (uses template 1500)
* arm, arm64, x86 and x86_64 devices

## Support
If you have any problems with module itself, not V4A driver or app, please open issue on [my issue tracker](https://github.com/ShadySquirrel/ViPER4Android/issues). There is no support thread, and there never will be. Please, make sure that you have **no other sound modules active** or **anything else overriding audio configuration or audio libraries** active, because that isn't a module issue.

### Issue tracking guidelines
If your problem with V4A is strictly connected to the module (module not installing, sepolicy not being injected etc. or not working, V4A app says everything is okay but problems with processing audio exist etc.), this is info you have to provide when you're opening issue on [my issue tracker](https://github.com/ShadySquirrel/ViPER4Android/issues):

**For general module issues:**
* Module and Magisk version,
* Phone model, OS and version,
* List of installed modules,
* Is any other sound mod installed?
* Magisk log, Magisk installation log, possibly logcat (`adb logcat -b all`), if you think that issue is somehow SEPolicy related
* Audio effects config files: standard paths are `/system/etc`, `/system/vendor/etc` and `/vendor/etc`, but there are some odd-balls in androd world so if you don't find them there, don't be lazy, search for those files
	* *Plese note* that now with Oreo, there are *two* audio configuration formats: standard .conf and new, XML. If both are present, provide both.
	* Also, some vendors place their own configuration files, with custom prefixes or suffixes in names
* A description of an issue or debugging info you may have or find usable.

**For 'Status: Abnormal', 'Format: Unsupported' and 'Processing: no':**
* First, without opening an issue, try running module while your sepolicy is permissive,
* Then, open the issue and mention 'I have tried it running with permissive sepolicy and the result was [__-__]'
* Then provide all logs mentioned under 'general issues', plus **full logcat with both sepolicy permissive and enforcing**

Also, be ready to edit some files and to test changes, because I have two devices and believe me, everything is working flawlessly on them :).

**FAIR WARNING**: Issues not following the guidelines **WILL BE AUTOMATICALLY DISCARDED** with a message pointing to this area of README.

**ANOTHER FAIR WARNING**: I really expect from you to know how to grab logs, debug issues etc. That's 'Android power user 101' and you should know all of that before you decide to root your phone and/or run custom firmware on it. So no, I won't provide any debugging and logging tutorials, you have Google for that.

## Module changelog
* 29.04.2018 - Update for Magisk 16.4 (post-fs scripts moved to late_start, see 67060cf)
* 06.02.2018 - Fix for shells not supporting bash arrays
* 27.01.2018 - Installation logic rewrite
	* Complete configuration edit logic rewrite - thanks to [Zackptg5](https://github.com/Zackptg5) for code and suggestions! Here is what's new:
		* Script is now checking for existing entries, and removing them before writing new ones
		* Coniguration files aren't added manually anymore - script is searching for them all, so all paths and all names should be covered
	* Effect blacklisting is moved to separate function - it's simpler just ading a path instead of repeating checks
	* Some code and comment/message style changes and updates
* 25.01.2018 - Module updates
	* Added Dirac to effects blacklist
	* Added one more effects path
	* Cosmetic: added git ignore and changed identation.
* 21.01.2018 - Module updates
	* Added support for XML audio effects configuration which some of new or Oreo updated devices are using
	* Added SEPolicy fixes for OxygenOS Oreo
	* Added SEPolicy fixes for other Oreo ROMs (tested on stock Mi A1 and Pixel XL)
* 27.12.2017 - Update to template version 1500
* 26.10.2017 - Improvements
	* Installation script is now more verbose, allows installation without an app (you'll still have to remove it manually from file) and includes fail-safe checks for arch, library etc,
	* Configuration file management is now bit different, still more to change,
	* New versioning system, allowing users to keep old module versions on their phones
	* Cosmetic changes.
	* Added a mention about version  [still using V4A Materalized](https://github.com/ShadySquirrel/ViPER4Android/releases)
* 08.10.2017 - Merged SELinux fixes
	* Thanks to [zertyuiop](https://github.com/zertyuiop/ViPER4Android)
* 06.09.2017 - Update to template version 1400
	* New template patchup
	* Changes in installation logic (removed unecessary unzip)
* 06.08.2017 - Initial commit. Included changes
	* Magisk Module Template v4
	* New update-binary script, based on original one
	* Changes for SELinux policy injection mechanism

## Credits
* [topjohnwu](https://github.com/topjohnwu): [Magisk](https://github.com/topjohnwu/Magisk) and [original Magisk module](https://github.com/Magisk-Modules-Repo/ViPER4Android/)
* [ViPER520 and ZhuHang](http://vipersaudio.com/blog/): ViPER4Android development ([official XDA thread](https://forum.xda-developers.com/showthread.php?t=2191223))
* [pittvandewitt and mr_white_214](https://forum.xda-developers.com/android/themes/app-viper4android-materialized-t3624655): [ViPER4Android Materialized](https://github.com/MrWhite214/v4a_material/) app
