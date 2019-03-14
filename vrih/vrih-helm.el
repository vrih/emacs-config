(use-package helm
  :ensure t
  :bind (
         ("C-x C-f" . helm-find-files)
         ("C-C h" . helm-mini)
         ("M-x" . helm-M-x)
))


(use-package ivy
  :ensure t
  :bind (("C-x b" . ivy-switch-buffer))
  )

(use-package counsel
  :ensure t
  :bind (("C-x C-f" . counsel-find-file))
  )


(use-package counsel-projectile
  :ensure t
  :config 
  (counsel-projectile-mode))


(use-package all-the-icons-ivy
  :ensure t
  :config
  (all-the-icons-ivy-setup))
