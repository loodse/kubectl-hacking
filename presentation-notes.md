# kubectl hacking

## Setup

Use [patat](https://github.com/jaspervdj/patat/).

## Start presentation

with watching
```bash
patat -w README.md
```

## creating content

### create ASCII text output

```bash
figlet kubectl
 _          _               _   _ 
| | ___   _| |__   ___  ___| |_| |
| |/ / | | | '_ \ / _ \/ __| __| |
|   <| |_| | |_) |  __/ (__| |_| |
|_|\_\\__,_|_.__/ \___|\___|\__|_|

```

### create ASCII images

Images by [jp2a](http://manpages.ubuntu.com/manpages/precise/en/man1/jp2a.1.html)

```
jp2a pics/k8s-only.jpg --chars=" ...+" --width=30 -i
```` 

### get headings

`grep '^# ' README.md`