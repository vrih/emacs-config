(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.gapp$" . js-mode))

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

(setq js2-highlight-level 3)

(use-package flycheck-jest
  :ensure t
  :config
  (flycheck-jest-setup)
  )

(use-package eslint-fix
  :ensure t)

(add-hook 'js-mode-hook 
          (lambda () (flycheck-mode t)
            (setq js-indent-level 2)
            (setq tab-width 2)))


(use-package json-mode
  :ensure t
  :init (setq json-reformat:indent-width 2))

(provide 'vrih-js)

