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

(defconst vuetify-completions
  '("v-flex" "v-autocomplete" "v-dialog" "v-layout" "v-container" "v-data-table" "v-btn"
    "v-date-picker" "v-icon" "v-tabs" "v-tab" "v-tab-item" "v-tabs-items" "v-toolbar" "v-system-bar"
    "v-tooltip" "v-data-iterator" "v-chip" "v-carousel" "v-carousel-item" "v-card" "v-card-title"
    "v-card-text" "v-card-actions" "v-img" "v-calendar" "v-speed-dial" "v-breadcrumbs" "v-breadcrumbs-item"
    "v-bottom-sheet" "v-bottom-nav" "v-badge" "v-avatar" "v-alert" "v-edit-dialog" "v-divider" "v-expansion-panel"
    "v-expansion-panel-content" "v-footer" "v-btn-toggle" "v-item-group" "v-item" "v-window" "v-window-item"
    "v-hover" "v-combobox" "v-form" "v-input" "v-overflow-btn" "v-select" "v-radio-group" "v-radio" "v-switch"
    "v-checkbox" "v-slider" "v-range-slider" "v-textarea" "v-text-field" "v-list" "v-list-tile" "v-list-group"
    "v-list-action" "v-list-tile-avatar" "v-list-tile-content" "v-list-tile-tile" "v-list-tile-sub-tile"
    "v-list-tile-action-text" "v-menu" "v-navigation-drawer" "v-pagination" "v-parallax" "v-time-picker"
    "v-progress-circular" "v-progress-linear" "v-rating" "v-sheet" "v-snackbar" "v-sparkline" "v-stepper"
    "v-stepper-step" "v-stepper-content" "v-stepper-header" "v-subheader" "v-timeline" "v-timeline-item"
    "v-treeview"))
 
(defun company-vuetify-backend (command &optional arg &rest ignored)
  (interactive (list 'interactive))

  (case command
    (interactive (company-begin-backend 'company-vuetify-backend))
    (prefix (and (eq major-mode 'vue-html-mode)
                 (company-grab "v-\\w*")))
    (candidates
    (remove-if-not
      (lambda (c) (string-prefix-p arg c))
      vuetify-completions))))

(add-to-list 'company-backends 'company-vuetify-backend)

(provide 'vrih-vue)

