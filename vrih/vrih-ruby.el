(defhydra hydra-ruby (:color blue :hint nil)
"    Navigate            Test               Lint                    Rake
 ─────────────────────────────────────────────────────────────────────────────────
    t toggle code/spec  s  test one spec   r rubocop auto correct   C rake
    T rake console      f  test file       R rubocop check project                         
                        a  test all specs"
               
   ("t" rspec-toggle-spec-and-target)
   ("T" inf-ruby-console-auto)
   ("s" rspec-verify-single)
   ("f" rspec-verify)
   ("a" rspec-verify-all)
   ("r" (lambda nil (interactive)(rubocop-autocorrect-current-file)(revert-buffer nil 1)))
   ("R" rubocop-check-project)
   ("C" (lambda nil (interactive)(rspec-verify-all)(rubocop-check-project))))

(use-package ruby-mode
  :ensure t
  :init (setq ruby-insert-encoding-magic-comment nil)
  (setq ruby-deep-indent-paren nil)
  (add-hook 'ruby-mode-hook
            (lambda ()
              (flycheck-mode 1)
              (local-set-key  (kbd "C-c r") 'hydra-ruby/body)
              (push '("=>" . ?⇒) prettify-symbols-alist))))

(use-package inf-ruby
  :ensure t
  :init (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode))

(use-package projectile-rails
  :ensure t
  :init (projectile-rails-global-mode))

(use-package rubocop
  :ensure t)

(use-package rspec-mode
  :ensure t)

(use-package robe
  :ensure t)

(provide 'vrih-ruby)
