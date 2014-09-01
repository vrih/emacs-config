;; Hook up flymake to use the PEP8 style
(add-hook 'python-mode-hook
        (lambda ()
                (unless (eq buffer-file-name nil) (flycheck-mode 1))
                (local-set-key [f2] 'flymake-goto-prev-error)
                (local-set-key [f3] 'flymake-goto-next-error)
        ))

;; Start autopair to complete brackets and quotes
(add-hook 'python-mode-hook 'autopair-mode)

;; Delete trailing whitespace when saving (compliance with PEP8)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Custom Keybinds
(add-hook 'python-mode-hook
        (lambda ()
                (local-set-key (kbd "C-c p") 'pylint)
                (local-set-key (kbd "C-c o") 'pep8)))

(provide 'vrih-python)
