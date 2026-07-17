# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Features

I've installed the following features with this setup:

- [nvim-emmet](https://github.com/olrtg/nvim-emmet). This gives a dialog for wrapping html tags with an emmet abbreviation with `<leader>xe`. I've also configured the emmet language server to work inside js/ts files, but you need to use the nvim-emmet dialog. I couldn't figure out how to only enable the emmet auto-completion within template literals, but the nvim-emmet dialog is fine. This feature is implemented in `/lua/plugins/emmet.lua`.
- **html/css/sql/md template literal syntax highlighting!** It took a lot of effort, but I managed to implement this feature with the help of various AI coding agents. First off, neovim/lazyvim don't have good documentation, so AI has a hard time writing plugins that work. Coincidentally, I was looking into Helix as an alternative to LazyVim in some circumstances. It's easier to configure and it has a lot of good features out of the box, but the important part is that it seems to offer better documentation so AI was able to write a functional plugin that implemented template literal syntax highlighting. There's something about the `include-children` feature within these schema files that enables the correct behavior for this feature, and every AI completely misses this for neovim/lazyvim. Anyways, this feature is implemented in `queries/javascript/injections.scm` and `queries/typescript/injections.scm`.
- Large files performance fixes. Large files don't work so good in most code editors. I added some basic large file fixes to my setup - it's mostly about disabling certain features when you encounter large files, and that includes certain animations and language server features.
- [Neovide](https://neovide.dev/). I've got a handful of useful configuration options set for neovide in the main `/init.lua` file. This includes some settings for coloring the navbar based on the current color theme and some settings for handling large files better. If certain rendering options are enabled on large files, neovide will freeze when scrolling over long distances. Such options are vsync and some kind of idle rendering option that prevents Windows from sending an impossible queue of animation frame requests or something to that effect.
- Opacity setting dialog. This is a persistent setting that saves to a simple text file in the nvim data folder. Open it with `<leader>uo`. The opacity will be set immediately after you submit a value because the window will be prompted to be redrawn.
- Autocomplete auto-show toggle. `<leader>ux` will toggle the autocomplete menu behavior. When disabled, the autocomplete menu and ghost text will be disabled. This toggle persists between sessions.

## Installation

LazyVim requires a variety of extra little bits of software that are probably not installed on your Windows machine by default. This is a real shame, but it is what it is.

Installing LazyVim: [https://www.lazyvim.org/installation](https://www.lazyvim.org/installation). You'll also need Git installed, too.

```bash
winget install Neovim.Neovim Git.Git
```

You'll also want to make sure that you've got `gh` in your PATH, too. It's better for authenticating github.

```bash
gh auth login
```

Install ripgrep and fd. These are required for LazyVim's file finder and grep search and search/replace.

```bash
winget install BurntSushi.repgrep sharkdp.fd
```

Then I think it's safe to clone this repo into your `%AppData%\local\nvim` folder and then start neovim.

### Nerd Fonts

Assuming you've got node and npm installed, you can run `nfdl` to download specific nerd fonts, which are required for lazyvim to look right on your system.

```bash
npx nfdl
```

Specifically, I've selected `CaskaydiaMono Nerd Font Mono` as my font and my neovide configuration selects this font as the main font.

## To Do

- Configure some kind of code formatter for various file types. Prettier would be nice, but I haven't got it working yet.
- Figure out the projects issue. For some reason, I have to install util.projects and Telescope from LazyExtras to get projects working. Normally, LazyVim is supposed to detect project folders and save them automatically to your projects list, but this feature is clearly broken by default. You can install the aforementioned extras to get projects working, but when you press p on the home screen, you'll try to open the wrong projects menu and you'll get an error. It's kind of insane that it's like this.
- Configure autoformat somehow. It might be either Prettier or LazyFormat or conform.nvim or whatever. It's an annoying feature - I'll format if I feel like it! You don't format when I save! That means I didn't save what I'm actually looking at! I mean, normally this would be fine, but the autoformat for markdown is bad. For one, you don't really need a formatter for markdown. It's not built for that. I like using star and double star for italic and bold - I *despise* using dunderscore in every circumstance. It looks bad because it's not at all relatable to the written word - and it's not like dunderscore would ever actually just underline something. ~~Strikethrough~~ actually makes sense with the double tilde thing, but it makes no sense that you would have dunderscore *not* be for underlining text when you've got URLs that have underlined text. Markdown doesn't even have an underline text feature, which is totally crazy because markdown is supposed to be helpful for writing html, and html has multiple tags for underlined text.
