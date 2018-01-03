;; Hook up flymake to use the PEP8 style
(add-hook 'python-mode-hook
        (lambda ()
                (flycheck-mode 1)
                (local-set-key [f2] 'flymake-goto-prev-error)
                (local-set-key [f3] 'flymake-goto-next-error)
        ))

;; Start autopair to complete brackets and quotes
;(add-hook 'python-mode-hook 'autopair-mode)

;; Delete trailing whitespace when saving (compliance with PEP8)
(add-hook 'python-mode-hook
          (lambda()
            (add-hook 'write-contents-functions
                      (lambda()
                        (save-excursion
                          (delete-trailing-whitespace))))))

(add-hook 'python-mode-hook
            (lambda ()
              (push '("->" . ?→) prettify-symbols-alist)
              (push '("..." . ?…) prettify-symbols-alist)))

;; Custom Keybinds
(add-hook 'python-mode-hook
        (lambda ()
                (local-set-key (kbd "C-c l") 'pylint)
                (local-set-key (kbd "C-c o") 'pep8)))

;(setq python-shell-virtualenv-path "/home/dan/virtualenvs/python2.7.12")
(setq pylint-command "/usr/bin/pylint")
(setq flycheck-python-pylint-executable "/usr/bin/pylint")

(require 'flycheck)
(flycheck-define-checker
    python-mypy ""
    :command ("mypy"
              "--ignore-missing-imports" "--fast-parser"
              "--python-version" "3.6"
              source-original)
    :error-patterns
    ((error line-start (file-name) ":" line ": error:" (message) line-end))
    :modes python-mode)

(add-to-list 'flycheck-checkers 'python-mypy t)
(flycheck-add-next-checker 'python-pylint 'python-mypy t)
(setq flycheck-check-syntax-automatically '(mode-enabled save))

(provide 'vrih-python)
