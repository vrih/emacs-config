(use-package groovy-mode
  :ensure t
  :defer t
  :init (add-to-list 'auto-mode-alist '("Jenkinsfile" . groovy-mode)))

(provide 'vrih-groovy)
