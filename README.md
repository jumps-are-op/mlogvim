# mlogvim  *a vim syntax highlighting script for mlog*

To install run:

```sh
sudo make install VIMRUNTIME=/path/to/vim/runtime
```

Where `/path/to/vim/runtime` is replace with vim's runtime path.
It's usually `/usr/share/vim/` or something like that.

## Concealing

By default, some statements/operations are concealed.
To disable concealing set `conceallevel` to 0
(i.e. run `:set conceallevel=0` in vim)

## For people who don't know
Mlog (Mindustry Logic) is a programming language that all of its
existence is inside a small free and open-source game called Mindustry.

You can (for example) control units, calculate basic math stuff,
control resource flow, and do crazy shit
like a 3D engine or even an entire CPU and OS.
