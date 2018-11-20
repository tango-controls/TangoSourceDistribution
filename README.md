# TangoSourceDistribution

[![Build Status](https://travis-ci.org/tango-controls/TangoSourceDistribution.svg?branch=reincarnation)](https://travis-ci.org/tango-controls/TangoSourceDistribution)

## How to build

Basically `ant build package`

The good output looks like this:

```
...

package:
    [mkdir] Created dir: /home/travis/build/tango-controls/TangoSourceDistribution/build/package/tango-9.3.2
  [copydir] DEPRECATED - The copydir task is deprecated.  Use copy instead.
  [copydir] Copying 710 files to /home/travis/build/tango-controls/TangoSourceDistribution/build/package/tango-9.3.2
      [tar] Building tar: /home/travis/build/tango-controls/TangoSourceDistribution/build/tango-master.tar.gz
$> 
```

`ant build` creates _build_ where it performs all required manipulations to fetch, download and assemble all the components of Tango Source Distribution: c++ from githug repos; java from maven repos

`ant package` creates tango-XXX.tar.gz file in _build_ directory where XXX is the name of the current branch or dev

`ant clean` - deletes _build_ directory

Feel free to explore build.xml for more details.

## How to release

1) update distribution.properties and assets (CHANGES etc) accordingly

2) tag this repo with a release number

3) travis will automatically upload resulting tango-_tag_.tar.gz to GitHub releases
