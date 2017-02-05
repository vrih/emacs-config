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
(defvar package-list '(flycheck
                       clj-refactor
                       clojure-mode
                       git-gutter
                       ac-cider
                                        ;    ac-nrepl
                       cider
                       company
                       go-mode
                       edit-server-htmlize
                       gmail-message-mode
                       gist
                       color-theme
                       helm
                       helm-git
                       helm-projectile
                       js2-mode
                                        ;    git-gutter-mode
                       leuven-theme
                       magit
                       markdown-mode
                       monokai-theme
                       neotree
                       org
                       org-bullets
                       paredit
                       pretty-symbols
                       projectile
                       rainbow-delimiters
                       smartparens
                       sql-indent
                       yaml-mode
                       ac-ispell
                                        ;    ac-python
                       ace-flyspell
                       ace-jump-mode
                       auto-complete-rst
                                        ;    clj-refactor-mode
                       company-emoji
                       company-go
                       company-restclient
                       company-web
                       midje-mode ;; clojure test mode
                       protobuf-mode
                       rust-mode
                       evil
                       evil-smartparens
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


