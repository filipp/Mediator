##Hello##

Mediator is a collection of Automator actions for working with media files. Most of them are just wrappers for the
incredibly powerful FFMPEG[1] utility.

###Convert to QuickTime###

Converts input files to QuickTime files with no transcoding. Useful for working with MTS files copied from an AVCHD
camera. The audio is converted to Apple Lossless (since AC3 + H264 is not supported by QuickTime).

It returns an array of converted files, which you can then pipe to say Finder's move specified items or an FTP app etc.

[1]: http://www.ffmpeg.org/
