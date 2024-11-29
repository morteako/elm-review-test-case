# Repo for reproducing bug in elm-review-unused

This repo reproduces a bug regarding unused imports in elm-review in combination with elm-git-install.


## Setup and running

* Clone the repo
* Run `npx elm-review` (should be 


The results from running elm-git-install is already included in the repo, but
if one wants to actually run `elm-git-install`, just run `npx elm-git-install` and it will overwrite the contents if needed.

## Result from elm-review
```shell
> npx elm-review --version
2.12.0
> npx elm-review
-- ELM-REVIEW ERROR ---------------------- src/MainGitInstallWrongError.elm:4:21

(fix) NoUnused.Variables: Module alias `List` is not used

3| -- actually used, reported as unused
4| import Util.List as List
                       ^^^^

You should either use this value somewhere, or remove it at the location I
pointed at.

src/MainGitInstallWrongError.elm  ↑
====o======================================================================o====
↓  src/MainLocalCorrectError.elm


-- ELM-REVIEW ERROR ------------------------ src/MainLocalCorrectError.elm:16:23

(fix) NoUnused.Variables: Module alias `Local` is not used

15| -- unused, and reported as unused => OK
16| import UtilNotUsed as Local
                          ^^^^^

You should either use this value somewhere, or remove it at the location I
pointed at.

Errors marked with (fix) can be fixed automatically using `elm-review --fix`.

I found 2 errors in 2 files.
```

The first error is not correct, the module alias is used. See more details in the file src/MainGitInstallWrongError.elm


The second error is correct. The difference between the two files, is that the first one uses a dependency importen using elm-git-install and the latter just uses normal local code.
Seems like there is an issue when determining the correct Module when using code not in "src"?
