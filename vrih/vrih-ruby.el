(use-package ruby-mode
  :ensure t
  :init (setq ruby-insert-encoding-magic-comment nil)
(add-hook 'ruby-mode-hook
          (lambda ()
            (flycheck-mode 1)
            (push '("=>" . ?⇒) prettify-symbols-alist))))

(use-package inf-ruby
  :ensure t
  :init (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode))

(use-package rubocop
  :ensure t)



(provide 'vrih-ruby)
