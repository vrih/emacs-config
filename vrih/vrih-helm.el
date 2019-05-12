(use-package ivy
  :ensure t
  :bind (("C-x b" . ivy-switch-buffer)
         ("M-x" . counsel-M-x)))

(use-package counsel
  :ensure t
  :bind (("C-x C-f" . counsel-find-file)
         ("C-x r b" . counsel-bookmark)))


(use-package counsel-etags
  :ensure t
  )

(use-package counsel-projectile
  :ensure t
  :config 
  (counsel-projectile-mode))


(use-package all-the-icons-ivy
  :ensure t
  :config
  (all-the-icons-ivy-setup))

(provide 'vrih-helm)
