(projectile-global-mode)

(use-package helm-projectile
  :commands (helm-projectile helm-projectile-switch-project)
  :bind (("C-c p p" . helm-projectile)
         ("C-S-P" . helm-projectile-switch-project)
         :map evil-normal-state-map
         ("C-p" . helm-projectile))
  :ensure t
  :config
  (evil-leader/set-key
    "ps" 'helm-projectile-ag
    "pa" 'helm-projectile-find-file-in-known-projects))

(projectile-register-project-type 'yarn '("package.json")
				  :compile "yarn build"
				  :test "yarn test:unit"
				  :run "yarn dev"
				  :test-suffix ".spec"
                                  :test-dir "tests/")
(use-package helm-ag
  :ensure t)

(use-package ggtags
  :ensure t)

(provide 'vrih-projectile)
