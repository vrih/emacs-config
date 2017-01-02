(setq eshell-visual-commands
      '("less" "tmux" "htop" "top" "bash" "zsh" "fish"))
(setq eshell-visual-subcommands
      '(("git" "log" "l" "diff" "show")))

;(use-package eshell-git-prompt
;  :config
;(eshell-git-prompt-use-theme 'powerline)
;)

(setq eshell-cmpl-cycle-completions nil)

(provide 'vrih-eshell)
