(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
  '(custom-enabled-themes (quote (dawn-night))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;yasnippet
(require 'yasnippet)
(yas-global-mode 1)


;; packages
;; yasnippet
;; inf-ruby

;;graphics
(set-face-attribute 'default nil :font "Liberation Mono-10")


;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

;; Larger elpa repository
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)
