(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.gapp$" . js-mode))

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

(setq js2-highlight-level 3)

(add-hook 'js-mode-hook 
          (lambda () (flycheck-mode t)
            (setq tab-width 2)))


(use-package json-mode
  :ensure t
  :init (setq json-reformat:indent-width 2))

(provide 'vrih-js)

