(use-package vue-html-mode
  :ensure t)

(use-package vue-mode
  :ensure t
  :mode "\\.vue\\'"
  :init (setq tab-width 2))

(provide 'vrih-vue)
