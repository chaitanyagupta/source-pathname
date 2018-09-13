# source-pathname

Three utility macros to help figure out the pathname of the source file where the code is defined.

1. `SOURCE-PATHNAME` returns the pathname of the source file.
2. `SOURCE-TRUENAME` returns the truename of the source file.
3. `SOURCE-DIRECTORY` returns the truename of the source file's directory. Takes an optional pathname, which when provided merges this pathname with the directory pathname. Useful for referencing other files relative to the source file.

## FAQ

### Why not use `*COMPILE-FILE-PATHNAME*` or `*LOAD-PATHNAME*` instead?

`*COMPILE-FILE-PATHNAME*` works only if the file is compiled first and then loaded. Similarly, `*LOAD-PATHNAME*` works only if the file is loaded directly and not compiled first. `SOURCE-PATHNAME` works both ways.

### Does it work with SLIME?

This doesn't work with `C-c` (slime-compile-defun) since it copies the source form to a temporary file before compiling it. As a workaround, use `C-c C-k` (slime-compile-and-load-file) instead.
