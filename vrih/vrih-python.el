;; Hook up flymake to use the PEP8 style
(add-hook 'python-mode-hook
        (lambda ()
                (unless (eq buffer-file-name nil) (flymake-mode 1))
                (local-set-key [f2] 'flymake-goto-prev-error)
                (local-set-key [f3] 'flymake-goto-next-error)
        ))
(when (load "flymake" t)
        (defun flymake-pylint-init ()
                (let* ((temp-file (flymake-init-create-temp-buffer-copy
                        'flymake-create-temp-inplace))
                (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
                (list "pep8" (list "–repeat" local-file))))
        (add-to-list 'flymake-allowed-file-name-masks
                '("\\.py\\'" flymake-pylint-init)))
(defun my-flymake-show-help ()
        (when (get-char-property (point) 'flymake-overlay)
                (let ((help (get-char-property (point) 'help-echo)))
                        (if help (message "%s" help)))))
(add-hook 'post-command-hook 'my-flymake-show-help)
 
;; Start autopair to complete brackets and quotes
(add-hook 'python-mode-hook 'autopair-mode)

;; Delete trailing whitespace when saving (compliance with PEP8)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Custom Keybinds
(add-hook 'python-mode-hook
        (lambda ()
                (local-set-key (kbd "C-c p") 'pylint)
                (local-set-key (kbd "C-c o") 'pep8)))
