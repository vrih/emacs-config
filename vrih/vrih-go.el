(use-package go-mode
  :ensure t
  :init 
  (add-hook 'go-mode-hook 'flycheck-mode))

          ; requires gocode
(use-package go-complete
  :ensure t
  :init (add-hook 'completion-at-point-functions 'go-complete-at-point))
