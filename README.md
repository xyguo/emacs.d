# A usable emacs config

This is my emacs configuration tree which originates from [that of Purcell's](https://github.com/purcell/emacs.d). But I eliminated many functions of that.

This config now supports for the following:

* C/C++
* Matlab
* Markdown/LaTeX
* Haskell

## Requirements
* Emacs 24.3.1 or greater
* clang 3.2-10 or greater
* git
* ghci 7.6.1 or greater

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
If you hit any problems, please first ensure that you are using the latest version of this code, and that you have updated your packages to the most recent available versions (see "Updates" above). If you still experience problems, go ahead and [file an issue on the github project](https://github.com/xyguo/emacs.d/issues).

-Xiang-Yu Guo
