(use-package lsp-mode
  :hook ((ruby-mode . lsp)
         (vue-mode . lsp)
         (terraform-mode . lsp))
  :commands lsp
  :ensure t
  :config
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu ))
 
(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-sideline-ignore-duplicate t)
  )

(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends))

(use-package lsp-treemacs
  :ensure t)

(use-package dap-mode
  :ensure t)

(provide 'vrih-lsp)
