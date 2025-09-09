# iso
> Pragmatic and minimal Void Linux builds using modern tools!

I need a system that:  
* Gets me to my goals(passing exams, shipping and excel in my craft for infinite money).
* Is minimal(and, kind of elitist)[^1], so I can understand it over time.
* Uses sensible modern utilities by default.
* Has low overhead once it clicks and builds little fatigue while using it[^2].
* Takes no time installing and is unopinionated.

Is that you[^3]? Great! Then read the rest.

## Principles
* Pragmatism over ideology!
* Modernity(improving effectivness not following trends).
* Following the UNIX philosophy is preferred.

## Builds
There are three builds available.

All of them made from the latest Void Linux rootfs with no modifications to `base-system` nor `base-devel`.

The minimal build adds:
* FAT and NTFS compatibility(meaning you can mount Windows NTFS partitions) and utilities.
* Sensible selection of services installed and enabled(Docker won't be by default)!
* Modern utilities replacing older ones(but nothing opinionated or flashy meaning fd instead of find and ripgrep instead of grep, but no eza instead of ls).
* The GNU C toolchain, Sqlite3 and Rizin for binary/process hacking.
* A Grub configuration that automatically detects other systems on the disk for a painless multi boot.

> [!TIP]
> Some of the modern utilities are aliased to the older ones(e.g. find is aliased to fd for standard users).

The Xorg build adds:
* Packages for a Xorg minimal installation with a selection of utilities such as xclip and xrandr.
* The Noto fonts(including Chinese, Japanese, Korean and Emojis) and a selection of popular, yet distinguishable fonts.
* Audio with pulseaudio.
* Bluetooth with bluez.

> [!TIP]
> You can install whatever you need on top of a build or even fork to make your own!  
> Want to get NeoVim after installing the minimal build? Then just go ahead and `xbps-install neovim`.

## Let's get into it
This index excludes purely drivers packages with no practical utility for the user.  
You want to see everything `xbps-query -l` after installing or check out `build.sh`  
* linux and kmod: kernel and modules
* dracut: generates initramfs
* grub: bootloader
* os-prober: detects other operating systems installed
* efibootmgr: manages UEFI boot entries
* runit: init system
* bash: default shell
* xbps: package manager
* agetty: manages TTYs
* bluez: bluetooth
* cronie: cron implementation
* dhcpcd: network DHCP client
* ntpd, chrony and tzdata: time sync and timezones data
* openssh: secure remote shell
* iptables: firewall
* man(man-pages and mdocml) and info(textinfo): manual pages and GNU system info
* coreutils: GNU core utilities
* diffutils: GNU diff utilities
* binutils: GNU binary utilities
* e2fsprogs, btrfs-progs, xfsprogs and ntfs-3g: EXT4, BTRFS, XFS and NTFS utilities
* f2fs-tools, dosfstools, exfat-utils: FAT and EXFAT utilities
* wget: download utility supporting HTTP(S) and (S)FTP
* atool(with the gzip, tar, xz, 7zip, dpkg, unzip and unrar backends): archiving and unarchiving
* bc: basic calculator
* curl: powerful HTTP client
* ed: standard editor
* nvi: visual editor
* mg: fast and portable clone of the MicroEmacs editor
* ctags: tags generator
* ffmpeg: multimedia processing
* findutils: includes find and xargs
* fd: modern replacement for find
* grep: going to regular expressions
* ripgrep: modern replacement for grep
* sed: stream editor
* tmux: terminal multiplexer
* jq: JSON processor
* rsync: fast and versatile remote copy utility
* rclone: file sync for cloud storage
* less: pager
* typst: modern typesetting system
* magic-wormhole: gets things from one computer to another
* openssl: TLS/SSL, cryptography and hashing
* procps-ng: process tools
* q: modern dig alternative
* sudo: privilege escalation
* traceroute: network route tracing
* troff and groff: typesetting system for manual pages
* util-linux: system utilities
* xxd: formats in octal, hexadecimal and binary
* base-files: essential system files
* dash: system POSIX shell linked to /usr/bin/sh
* file: detects file type
* which: shows the full of an executable on the $PATH
* gawk: GNU awk implementation
* gcc: GNU compiler collection
* gdb: GNU debugger
* make: build system
* cmake: cross platform build system
* bison: parser generator
* flex: lexer
* m4: macro processor
* git: version control system
* git-lfs: large file support for git
* github-cli: GitHub's official CLI
* iproute2 and iputils: network utilities
* iw, wpa_supplicant and wifi-firmware: wifi
* kbd: keyboard utilities
* rizin: binary exploitation, process hacking and reverse engineering
* rz-ghidra: the Ghidra decompiler plugin for rizin
* strace: traces syscalls
* ltrace: traces library calls
* shadow: users and groups
* sqlite: embeddable SQL database
* upx: compresses binaries
* void-artwork and removed-packages: artwork and cleanup scripts
* docker, docker-buildx and docker-compose: containers
* ncurses: popular TUI library
* patch: applies diffs to source files
* pkg-config: retrieve information about installed libraries
* acpid: handles ACPI events
* autoconf: generates `configure` scripts from portable software builds
* automake: creates template files for autoconf
* dbus: message bus system 
* elogind: user logins, seats and power access
* ethtool: network hardware management
* eudev: device manager
* gettext: multi language utilities
* iana-etc: maps standard ports to protocols
* libgcc: gcc runtime library
* libtool: cross platform library linking and compilation
* texinfo: GNU documentation system
* tlp and tlp-rdw: power management for laptops
* usbutils: USB utilities

### Documentation
Use `man` to access manual pages for most programs and `info` to access GNU texinfo pages
* [Void Linux](https://docs.voidlinux.org/) is always worth a read
* [Linux kernel](https://docs.kernel.org/) for everything kernel related
* [GNU project](https://www.gnu.org/doc/doc.en.html) covers the GNU userland
For everything not included nor covered by this refer to the `git` repository for whatever you are trying to understand better!

> [!TIP]
> Really can't find what you are looking for? Time for a Google research!

### Packages
Here's an opinionated list of additional packages you could install on top of one of the builds!

> [!NOTE]
> Whenever you can't find something from the [official repositories](https://voidlinux.org/packages/), grab a binary release and link it to somewhere in your $PATH or compile it yoursef.
> Maybe you can find it in [void-packages](https://github.com/void-linux/void-packages).

#### Kernels
* linux-lts: Linux long term support which is going to be behind some versions
* linux-mainline: Linux mainline which is going to be ahead some versions
* linux-zen: a desktop optimized Linux build
#### Shells
* ksh: the classic superset of the bourne shell
* zsh: another POSIX shell with plugins support
#### Editors

> [!NOTE]
> As much as I love them, ex, vi or mg with ctags are not gonna be enough for most people(me included).

These are all beloved and maintained editors[^5]
* [vim](https://github.com/vim/vim): Vi iMproved, a highly customizable modal editor using it's own language called VimScript, 
* [vis](https://github.com/martanne/vis): a Vi inspired alternative using structural regular expressions like `sam`
* [neovim](https://neovim.io/): a community `vim` community rewrite with Lua support and even more extensible
* [helix](https://github.com/helix-editor/helix): a new take on modal editing
* [emacs](https://www.gnu.org/software/emacs/): a text editor and a lot more, interpreter for Emacs Lisp
* [visual studio code](https://code.visualstudio.com/): the most popular graphical editor from Microsoft using Electron
* [zed](https://zed.dev/): powerful Visual Studio Code competitor providing better performance made in Rust

> [!TIP]
> In the repositories there's `vim-x11` which has clipboard support and `vim-huge` which has all the features.  
> Get `emacs-x11` for Emacs with the graphical interface if you use that and check out [Doom Emacs](https://github.com/doomemacs/doomemacs)!  
> Highly recommend the proprietary version of Visual Studio Code or checking out `codium` instead of `vscode` in the repositories if you use that.  

### Some packages tricks
* Use `xbps-install -Syu` to upgrade the system, install packages and automatically confirm actions
* Use `xbps-query -Rs` to search for packages in the repositories
* Use `xbps-query -f package` to find out what files that package installs
* Use `xbps-query -l` to list installed packages
* Use `xbps-query -o /path/to/binary` to find out what package the binary is part of
* Use `xbps-remove -Rf` to remove a package and it's dependencies

> [!WARNING]
> You can use use `xbps-remove -RF` to remove packages without limitations on shared libraries or system packages and break things.  
> Meaning you can remove something from `base-system` for example.  
> Don't do this unless you have a reason to, it's pretty cool that you can though!  

### Frequently asked questions
* Comprehensive view of EVERYTHING that's been added to each build?  
Read `build.sh`, it's super easy!  
* How do I dive even deeper once I get comfy and master all the packages I need?  
First off, impressive! I am far from that(probably), how about learning an instruction set and getting acquainted with the Linux syscall table next?  
Experienced C programmer and system internals type of guy? Why not try learning about the cloud with Go or learning functional programming with a language like Elixir?  
The cloud is the first thing that came to mind because that's what I am doing right now, it's awesome, AWS a great place to start and then maybe Azure or Tencent.  

> [!NOTE]
> Check out the bookmarks in my [dotfiles](https://github.com/sansneo/dotfiles) and if you are actively looking for resources like this you are probably a crazy knowledgeable person and a rich Developer, Engineer, Data Scientist, Cloud Architect or a big CEO/CTO.   
> Pass your exams, get certified, get employed, and build things if you aren't, also workout and take care of yourself, it's really hot when someone nerdy is also super fit and attractive.  
> Life can be awesome and self-improvement is great!  

## Fonts
These is the selection that's included on top of the Noto fonts
* [Commit Mono](https://commitmono.com/)
* [Mononoki](https://madmalik.github.io/mononoki/)
* [Jetbrains Mono](https://www.jetbrains.com/lp/mono/)
* [Monoid](https://larsenwork.com/monoid/)
* [Fira Code](https://github.com/tonsky/FiraCode/)

> [!TIP]
> These are commercial alternatives which look great, but I will never pay for(probably)

* [Monalisa](https://www.monolisa.dev/)
* [Berkley Mono](https://usgraphics.com/products/berkeley-mono/)

## After installing it
### Get the microcode for your CPU
```sh
# For Intel CPUs
xbps-install -Syu intel-ucode
# For AMD CPUs
xbps-install -Syu amd-ucode
```
### GEt the graphical drivers for your GPU
```sh
# For AMD GPUs
xbps-install -Syu mesa-vulkan-radeon radeon-ucode xf86-video-amdgpu xf86-video-ati
# For Nvidia GPUs
xbps-install -Syu nvidia nvidia-vaapi-driver nvidia-docker
# For Intel GPUs
xbps-install -Syu intel-video-accel intel-media-driver vulkan-intel
```
> [!NOTE]
> Some of these might already be installed, but better safe then sorry!

## Building
1. Clone the repository
```sh
git clone https://github.com/sansneo/iso  
cd iso
```
2. Generate the builds
```
sh build.sh
```

> [!WARNING]
> Should be done in a Void Linux live or installation with `liblz4`, `xz` and `qemu-user-static` available.

### How does it work?
Refer to [void-mklive](https://github.com/void-linux/void-mklive) for more details on this, but here's a sample.
```sh
# Minimal
./mkiso.sh -a x86_64 -b base-system \
    -r "https://repo-fastly.voidlinux.org/current" \
    -r "https://repo-fastly.voidlinux.org/current/nonfree" \
    -r "https://repo-fastly.voidlinux.org/current/multilib" \
    -- -k "us" -T "Void Linux" -o ../builds/minimal.iso \
    -p "void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree" \
    -p "$drivers $services $utilities $cloud $dev noto-fonts-ttf" \
    -e /bin/bash \
    -I ../custom \
    -S "dhcpcd tlp dbus elogind sshd" \
    -C "vconsole.keymap=us" 

```

# Contributions
Please point out redundancy in the builds or mistakes in the README.  
There's no enforcing of what packages should or should not be included, but I'm open to discussion!  
For instance, would you like aria2 to be present?  

# Footnotes
[^1]: Yes, this is a Linux kernel plus GNU userspace and a lot more meaning it's still gonna be challenging to understand fully compared to something like OpenBSD which has a way smaller codebase, but I feel like this is the best I can get without compromises which I will not take on anything.

[^2]: This is the true enemy we got as developers, we need to reduce overhead and that mental fatigue that slowly builds while we work!
  Here's a video from [The Primeagen](https://www.youtube.com/watch?v=ZH3iKbEiks0) I really liked which touches on the topic.

[^3]: This system is not for someone who isn't passionate about computers and not motivated to read to get a deeper understanding.

[^4]: The moment you use a modern CPU on a non core/libre booted system, you are holding a non rooted phone with Google services on it(meaning you are a normal person btw), often open something like Discord and play games like Valorant with kernel level anti-cheats on the same or another computer I'd say the argument for the super secure privacy oriented free hacker system goes out the window.
  This system is secure and privacy oriented, but has to not be completely free, hope you get that, crying over a proprietary blob won't make your life better and gets cringe pretty quick.
  You can live and work with this knowing you are in control and can install anything you like and get to work, here is true pragmatism and long-term productivity gains.  
  It's not the system that makes the difference though of course!

[^5]: I use Vim and Codium and it feels comfy!
