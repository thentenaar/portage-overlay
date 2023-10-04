Portage Overlay
===============

This is an overlay for the [Portage](https://wiki.gentoo.org/wiki/Portage)
package management system, which contains ebuilds that I've either written,
or modified for my own purposes.

Packages in this overlay may or may not be stable. In order words,
***use at your own risk!***

By using this overlay, you agree to indemnify and hold harmless
everyone, save yourself, from any liability that may arise from your
use of this repository or anything therein.

Licensing
=========

Ebuilds in this repository are licensed under the GPLv2. Patches are
licensed under the same terms as the software that they modify.

Use
===

Simply add this repo with
[eselect-repsitory](https://wiki.gentoo.org/wiki/Eselect/Repository)
as follows:

```
# eselect repository add thentenaar git \
          https://github.com/thentenaar/portage-overlay
# eselect repository enable thentenaar
# emaint sync -r thentenaar
```

and enjoy.

