(defhydra hydra-vue (:color blue :hint nil)
"    Navigate            Test               Lint                    Rake
 ─────────────────────────────────────────────────────────────────────────────────
    t toggle code/spec  s  test one spec   r rubocop auto correct   C rake
                        f  test file       R lint project                         
                        a  test all specs"
               
   ("t" pojectile-find-test-file)
   ("s" rspec-verify-single)
   ("f" rspec-verify)
   ("a" (lambda nil (interactive) (compile "yarn test")))
   ("r" (lambda nil (interactive)(rubocop-autocorrect-current-file)(revert-buffer nil 1)))
   ("R" (lambda nil (interactive) (compile "yarn lint")))
   ("C" (lambda nil (interactive)(rspec-verify-all)(rubocop-check-project))))


(use-package vue-html-mode
  :ensure t
  :init (add-hook 'vue-mode-hook
                  (lambda ()
                    (flycheck-mode 1)
                    (local-set-key  (kbd "C-c r") 'hydra-vue/body)
                    (push '("=>" . ?⇒) prettify-symbols-alist))))

(use-package vue-mode
  :ensure t
  :mode "\\.vue\\'"
  :init (setq tab-width 2)
  (add-hook 'vue-mode-hook
            (lambda ()
              (flycheck-mode 1)
              (local-set-key  (kbd "C-c r") 'hydra-vue/body)
              (push '("=>" . ?⇒) prettify-symbols-alist))))

(provide 'vrih-vue)

