(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote solarized-dark))
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Larger elpa repository
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)


;;yasnippet
(require 'yasnippet)
(yas-global-mode 1)


;; packages
;; yasnippet
;; inf-ruby

;;graphics
(set-face-attribute 'default nil :font "Liberation Mono-10")
(load-theme 'solarized-dark)

;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

; always indent with spaces
(setq-default indent-tabs-mode nil)
(when window-system
  (speedbar 1))
(setq inhibit-startup-screen t)
(setq transient-mark-mode t)
(global-font-lock-mode)
(auto-compression-mode)
(show-paren-mode)
(auto-image-file-mode)
(blink-cursor-mode 0)



