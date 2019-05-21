(defhydra hydra-vue (:color blue :hint nil)
"    Navigate            Test               Lint                 
 ───────────────────────────────────────────────────
    t toggle code/spec  s  test one spec   r lint fix project   
                        f  test file       R lint project                         
                        a  test all specs"
               
   ("t" pojectile-find-test-file)
   ("s" rspec-verify-single)
   ("f" (lambda nil (interactive) (let ((default-directory (projectile-project-root))) (compile (concat "yarn test:unit --no-cache  " buffer-file-name)))))
   ("a" (lambda nil (interactive) (compile "yarn test:unit --no-cache")))
   ("r" (lambda nil (interactive) (compile "yarn lint --fix")))
   ("R" (lambda nil (interactive) (compile "yarn lint"))))


(use-package vue-html-mode
  :ensure t
  :init (add-hook 'vue-html-mode-hook
                  (lambda ()
                    (flycheck-mode 1)
                    (local-set-key  (kbd "C-c r") 'hydra-vue/body)
                    (push '("=>" . ?⇒) prettify-symbols-alist))))

(use-package vue-mode
  :ensure t
  :mode "\\.vue\\'"
  :init 
  (add-hook 'vue-mode-hook
            (lambda ()
              (setq tab-width 2)
              (setq company-minimum-prefix-length 0)
              (flycheck-mode 1)
              (local-set-key  (kbd "C-c r") 'hydra-vue/body)
              (push '("=>" . ?⇒) prettify-symbols-alist)))
  (add-hook 'js-mode-hook
            (lambda ()
              (flycheck-mode 1)
              (local-set-key  (kbd "C-c r") 'hydra-vue/body)
              (push '("=>" . ?⇒) prettify-symbols-alist)))
  )

(add-to-list 'load-path "~/.emacs.d/local/company-vuetify")
(use-package company-vuetify
  :init (add-to-list 'company-backends 'company-vuetify))

(provide 'vrih-vue)

