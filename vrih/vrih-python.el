;; Hook up flymake to use the PEP8 style
(add-hook 'python-mode-hook
        (lambda ()
                (flycheck-mode 1)
                (local-set-key [f2] 'flymake-goto-prev-error)
                (local-set-key [f3] 'flymake-goto-next-error)
        ))

;; Start autopair to complete brackets and quotes
(add-hook 'python-mode-hook 'autopair-mode)

;; Delete trailing whitespace when saving (compliance with PEP8)
(add-hook 'python-mode-hook
          (lambda()
            (add-hook 'write-contents-functions
                      (lambda()
                        (save-excursion
                          (delete-trailing-whitespace))))))


;; Custom Keybinds
(add-hook 'python-mode-hook
        (lambda ()
                (local-set-key (kbd "C-c l") 'pylint)
                (local-set-key (kbd "C-c o") 'pep8)))

(setq python-shell-virtualenv-path "/home/dan/virtualenvs/python3.4.2")
(setq pylint-command "/home/dan/virtualenvs/python3.4.2/bin/pylint")
(setq flycheck-python-pylint-executable "/home/dan/virtualenvs/python3.4.2/bin/pylint")

(provide 'vrih-python)
