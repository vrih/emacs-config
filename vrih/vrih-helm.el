(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)



;; helm
(add-to-list 'load-path "/path/to/helm/directory")
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)
(require 'helm-ls-git)
(global-set-key (kbd "C-<f6>") 'helm-ls-git-ls)

(provide 'vrih-helm)
