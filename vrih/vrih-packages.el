;;; vrih-package -- defining the list of packages I want
;;; Commentary:
;;;
;;; Manage the packages required for my config.

;;; Code:
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org-mode" . "http://orgmode.org/elpa/"))
;(add-to-list 'package-archives
;    '("marmalade" .
;      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
  '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
                                        ; list the packages you want
(use-package company-quickhelp
  :ensure t
  :init (company-quickhelp-mode)
  )

(use-package flycheck-pos-tip
  :ensure t)

(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

(eval-after-load 'company
  '(define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin))

(defvar package-list '(flycheck
                       use-package
                       company
                       go-mode
                       edit-server-htmlize
                       gmail-message-mode
                       color-theme
                       helm
                       helm-git
                       js2-mode
                       markdown-mode
                       monokai-theme
                       neotree
                       paredit
                       pretty-symbols
                       projectile
                       yaml-mode
                       ac-ispell
                                        ;    ac-python
                       ace-flyspell
                       ace-jump-mode
                       auto-complete-rst
                       company-emoji
                       company-go
                       company-restclient
                       company-web
                       rust-mode
                       flycheck-tip))
                                            ; activate all the packages (in particular autoloads)
(package-initialize)
                                        ; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
        (package-install package)))

(provide 'vrih-packages)
;;;


