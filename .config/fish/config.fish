if status is-interactive
    # Commands to run in interactive sessions can go here
end
#oh-my-posh init fish --config ~/.local/share/oh-my-posh-themes/powerlevel10k_rainbow.omp.json | source
starship init fish | source
set -g fish_greeting

zoxide init fish --cmd cd | source