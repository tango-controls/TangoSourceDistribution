[![logo](http://www.tango-controls.org/static/tango/img/logo_tangocontrols.png)](http://www.tango-controls.org)

## How to build

See .gitlab-ci.yml for the list of required packages.

Once the above requirements are satisified, do `ant build package`

The good output looks like this:

```
...

build:
     [echo] Done!

package:
    [mkdir] Created dir: /home/travis/build/tango-controls/TangoSourceDistribution/build/package/tango-9.3.2
  [copydir] DEPRECATED - The copydir task is deprecated.  Use copy instead.
  [copydir] Copying 710 files to /home/travis/build/tango-controls/TangoSourceDistribution/build/package/tango-9.3.2
      [tar] Building tar: /home/travis/build/tango-controls/TangoSourceDistribution/build/tango-master.tar.gz
$>
```

`ant build` creates _build_ folder where it performs all required manipulations to fetch, download and assemble all the components of Tango Source Distribution: c++ from gitlab repos; java from maven repos. Result is placed into _build/distr_

`ant package` creates tango-XXX.tar.gz file in _build_ directory where XXX is the name of the current branch or dev

`ant clean` - deletes _build_ directory

## How to release

1) update distribution.properties and assets (CHANGES etc) accordingly

2) tag this repo with a release number

3) gitlab will automatically upload resulting tango-_tag_.tar.gz
