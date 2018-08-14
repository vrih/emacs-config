(use-package terraform-mode
  :ensure t
  :defer t
  :mode ("\\.tf\\'" . terraform-mode))

(use-package company-terraform
  :ensure t
  :defer t
  :init (company-terraform-init)) 

(provide 'vrih-terraform)
