(use-package terraform-mode
  :ensure t
  :defer t
  :bind (("C-c c" . (lambda () (interactive) (shell-command "make plan"))))
  :mode ("\\.tf\\'" . terraform-mode)
  :init 
  (add-hook 'terraform-mode-hook
            (lambda ()
              'terraform-format-on-save-mode
              (setq projectile-project-test-cmd  "make plan")
              (setq terraform-format-on-save-mode 1)
              (setq projectile-project-run-cmd "make apply")
              (add-hook 'after-save-hook
                        (lambda ()
                          (compile "terraform validate && terraform plan -refresh=false"))
		        nil
		        1))))

(use-package company-terraform
  :ensure t
  :defer t
  :init (company-terraform-init)) 

(add-hook 'terraform-mode-hook 'terraform-format-on-save-mode)

(provide 'vrih-terraform)
