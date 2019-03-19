(use-package go-mode
  :ensure t
  :init 
  (add-hook 'go-mode-hook 'flycheck-mode))

          ; requires gocode
(use-package go-complete
  :ensure t
  :init (add-hook 'completion-at-point-functions 'go-complete-at-point)
  (setq ac-go-gocode-bin "/home/dan/go/bin/gocode"))

(use-package go-autocomplete
  :ensure t
  :init (ac-config-default))

(provide 'vrih-go)
