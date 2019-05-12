(use-package magit
  :bind (("C-x g" . magit-status))
  :ensure t
  :init (add-hook 'magit-diff-mode-hook
                  (lambda () (local-set-key (kbd "<M-RET>")
                                       'magit-diff-visit-worktree-file-other-window))))

(use-package git-gutter
  :ensure t
  :config (global-git-gutter-mode))

(use-package gist
  :ensure t)

(use-package magit-gitflow
  :ensure t)

(provide 'vrih-magit)
