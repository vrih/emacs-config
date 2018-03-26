(use-package ruby-mode
  :ensure t)

(use-package inf-ruby
  :ensure t)

(add-hook 'ruby-mode-hook
          (lambda ()
              (push '("=>" . ?⇒) prettify-symbols-alist)
              ))

(provide 'vrih-ruby)
