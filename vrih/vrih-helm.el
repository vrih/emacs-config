(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)


;(require 'helm-config)
;; helm
(add-to-list 'load-path "/path/to/helm/directory")
;; helm does buffer switching
(global-set-key (kbd "C-x b") 'helm-buffers-list)
;; helm does find file
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key (kbd "C-c h") 'helm-mini)
;(require 'helm-ls-git)
;(global-set-key (kbd "C-<f6>") 'helm-ls-git-ls)

(provide 'vrih-helm)
