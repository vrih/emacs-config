(use-package evil
  :ensure t
  :config (evil-mode)
  (setq evil-want-fine-undo t))

(use-package evil-leader
  :ensure t
  :config (global-evil-leader-mode))

;(use-package evil-smartparens
;  :ensure t
;  :config (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode))
