# Linux Personalization

## Shell Environment Setup

### Monitoring Systems

* [htop](https://www.howtogeek.com/howto/ubuntu/using-htop-to-monitor-system-processes-on-linux/), 
* [glances](https://nicolargo.github.io/glances/), 
* [dstat](https://www.tecmint.com/dstat-monitor-linux-server-performance-process-memory-network/), 
* [iotop](https://www.tecmint.com/iotop-monitor-linux-disk-io-activity-per-process/)

### File System Management

[midnight commender (mc)](https://midnight-commander.org/)

### Screen and Seesions Management

[tmux](https://hackernoon.com/a-gentle-introduction-to-tmux-8d784c404340)

### Email

[alpine](https://alpinelinux.org/)

### Web Browser

[lynx](https://lynx.browser.org/)

### Calculator

[bc](https://www.gnu.org/software/bc/manual/html_mono/bc.html)

### Text Editor

* [nano](https://www.nano-editor.org/) 
* [vim](https://en.wikipedia.org/wiki/Vim_(text_editor))

### Music Player

[cmus](https://cmus.github.io/)



## Bash Shell Configuration
Modify .bashrc (an [example](./Bash_Env/.bashrc) at Bash_Env folder) file to personalize the terminal prompt with different symbol, format and colors. The setting is:
```shell
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\][\u:\[\033[01;34m\]\w\e[01;32m]\[\033[01;31m\]>>>\e[01;37m'
```

The final result can be like the following figure.

<a><img src="./Bash_Env/four.png" alt="prompt"></a>

Modify it by adding alias and functions, such as something like below.

<a><img src="./Bash_Env/third.png" alt="alias"></a>

<a><img src="./Bash_Env/first.png" alt="recycle bin function"></a>

<a><img src="./Bash_Env/second.png" alt="recycle bin usage"></a>

## Vim Configuration
Modify vimrc file by using the [example](./Vim/vimrc) provided in this repo. The vim should look like:

<a><img src="./Vim/four.png" alt="alias"></a>
