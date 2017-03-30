(use-package magit
  :bind (("C-x g" . magit-status))
  :ensure t)

(use-package git-gutter
  :ensure t
  :config (global-git-gutter-mode))

(use-package gist
  :ensure t)

(provide 'vrih-magit)
