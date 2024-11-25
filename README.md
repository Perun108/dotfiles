# dotfiles
My dotfiles and configs.

I tried several approaches to sync my dotfiles across my machines ([chezmoi](https://www.chezmoi.io/), rsync, [git bare repo](https://www.atlassian.com/git/tutorials/dotfiles), etc. None of them worked for me. I decided to use my old friend [meld](https://meldmerge.org/) and it works perfectly well for me. Just manually compare the dirs: `meld ~/.config/nvim ~/dotfiles/nvim`

For more detailed notes and settings see:
- [My Vim/NeoVim notes](https://github.com/Perun108/my_notes_and_settings/tree/main/Vim)
- [My zsh notes](https://github.com/Perun108/my_notes_and_settings/blob/main/zsh.md)
