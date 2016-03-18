# A usable emacs config

This is my emacs configuration tree which originates from [that of Purcell's](https://github.com/purcell/emacs.d). But I eliminated many functions of that.

This config now supports for the following:

* C/C++
* Matlab
* Markdown/LaTeX
* Haskell

## Requirements
These are requirements that **must** be met:

* Emacs 24.4.1 or greater
* git 1.9.4 or greater

and these are not necessary if you don't use that language

* clang 3.2-10 or greater (for C/C++, necessary for `auto-complete-clang`)
* ghci 7.10.1 or greater (for Haskell)

### Enable TLS for securely connecting to ELPA
ELPA is accessed over HTTP by default, which may result in security problems, so I prefer to use HTTPS instead. This can be done simply by replace the "http" in ELPA repository addresses with "https", and turn on the TLS checking.

By default, both HTTPS and TLS checking are **disabled**. If you do like to turn them on (and I recommend you to), then the following requirements must be met:

* remove the comment before `(require 'init-security)` line in `init.el`
* gnutls 3.4 or greater
* The `certifi` package from pypi (`pip install certifi`)

More detailed description can be found in [this article](https://glyph.twistedmatrix.com/2015/11/editor-malware.html).

## Installation
To install, clone this repo to `~/.emacs.d`, i.e. ensure that the
`init.el` contained in this repo ends up at `~/.emacs.d/init.el`:

```
git clone https://github.com/xyguo/emacs.d.git ~/.emacs.d
```

Upon starting up Emacs for the first time, further third-party
packages will be automatically downloaded and installed.

## Update

Update the config with `git pull`. You'll probably also want/need to update
the third-party packages regularly too:

<kbd>M-x package-list-packages</kbd>, then <kbd>U</kbd> followed by <kbd>x</kbd>.

## Troubleshooting

### "Symbol's function definition is void: XXX" or "Package XXX is not available for installation"
Errors of this type are mostly caused by obsolete package or outdated Emacs version. Thus, when you encounter
such errors, first check that your Emacs' version has satisfied the requirement listed above in section 
"Requirements", if so, do the following:

##### Execute Emacs with the `--debug-init` option, i.e.
```
$ emacs --debug-init
```

##### Read the debugging info, it usually begins with something like

> Debugger entered--Lisp error: (void-function XXX)
  ... (the unfoldded calling stack)

##### Now you have some choices:
  * [File an issue](https://github.com/xyguo/emacs.d/issues) and I'll help you deal with that.
  * (A quick-and-dirty way, not recommended) Most times you can just comment out the corresponding line (which can be found through the debugging info) in the `init.el` file to bypass the initialization step that triggers the problem. 
  * Sometimes, a package maintainer decides to change the package's name, which results in a "package not available" error. You can simply Google for the unavailable package's name and if lucky you'll find its new name. After that, [file an issue](https://github.com/xyguo/emacs.d/issues) and I'll be glad to fix the init files.

### auto-complete-clang
Note that the `ac-clang-flags` set in `init-ac-source.el` is platform-dependent. It's actually clang's include file search path. According to the [Troubleshooting section of auto-complete-clang](https://github.com/brianjcj/auto-complete-clang), you can use the following method to find the correct path:

```
echo "" | g++ -v -x c++ -E -
```

and you'll get something like this:

```
#include "..." search starts here：
#include <...> search starts here：
 /usr/include/c++/4.8
 /usr/include/x86_64-linux-gnu/c++/4.8
 /usr/include/c++/4.8/backward
 /usr/lib/gcc/x86_64-linux-gnu/4.8/include
 /usr/local/include
 /usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed
 /usr/include/x86_64-linux-gnu
 /usr/include
End of search list.
```
Just use them to replace the corresponding string.

## Support/issues
If you hit any problems, please 

1. Check that whether you have met system requirements listed in section "Requirements".
2. Ensure that you are using the latest version of this code, and that you have updated your packages to the most recent available versions (see "Updates" above). 
3. If you still experience problems, go ahead and [file an issue](https://github.com/xyguo/emacs.d/issues).  

-Xiang-Yu Guo
