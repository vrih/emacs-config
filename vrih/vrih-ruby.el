(use-package ruby-mode
  :ensure t
  :init (setq ruby-insert-encoding-magic-comment nil))

(use-package inf-ruby
  :ensure t)

(use-package rubocop
  :ensure t)


(add-hook 'ruby-mode-hook
          (lambda ()
            (flycheck-mode 1)
            (push '("=>" . ?⇒) prettify-symbols-alist)))

(provide 'vrih-ruby)
