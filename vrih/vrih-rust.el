(use-package rust-mode
  :ensure t
  :init
  
  (add-hook 'rust-mode-hook (lambda () (flycheck-mode 1)))
  (add-hook 'rust-mode-hook
            (lambda ()
              (push '("->" . ?→) prettify-symbols-alist)
              (push '("=>" . ?⇒) prettify-symbols-alist))))

(use-package cargo
  :ensure t
  :init (add-hook 'rust-mode-hook 'cargo-minor-mode))

(provide 'vrih-rust)
