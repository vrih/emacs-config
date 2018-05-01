(use-package ruby-mode
  :ensure t
  :init (setq ruby-insert-encoding-magic-comment nil)
  (setq ruby-deep-indent-paren nil)
  (add-hook 'ruby-mode-hook
            (lambda ()
              (flycheck-mode 1)
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

(defhydra hydra-ruby (:color blue :hint nil)
"    Navigate            Test               Lint                    Rake
 ─────────────────────────────────────────────────────────────────────────────────
    t toggle code/spec  s  test one spec   r rubocop auto correct   R rake
                        f  test file                                
                        a  test all specs
                "
   ("t" rspec-toggle-spec-and-target)
   ("s" rspec-verify-single)
   ("f" rspec-verify)
   ("a" rspec-verify-all)
   ("r" (lambda nil (interactive)(rubocop-autocorrect-current-file)(revert-buffer nil 1)))
   ("R" rake))

(evil-leader/set-key-for-mode 'ruby-mode "c" 'hydra-ruby/body)
(provide 'vrih-ruby)
