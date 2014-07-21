(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#002b36" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(custom-safe-themes (quote ("60f04e478dedc16397353fb9f33f0d895ea3dab4f581307fbf0aa2f07e658a40" "ab3a5935a219ca4d4c6aea5defc9f4b4199e248d45bf93b9e72e43f1242e44e3" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(fci-rule-color "#073642")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-tail-colors (quote (("#073642" . 0) ("#546E00" . 20) ("#00736F" . 30) ("#00629D" . 50) ("#7B6000" . 60) ("#8B2C02" . 70) ("#93115C" . 85) ("#073642" . 100))))
 '(vc-annotate-background "#93a1a1")
 '(vc-annotate-color-map (quote ((20 . "#990A1B") (40 . "#FF6E64") (60 . "#cb4b16") (80 . "#7B6000") (100 . "#b58900") (120 . "#DEB542") (140 . "#546E00") (160 . "#859900") (180 . "#B4C342") (200 . "#3F4D91") (220 . "#6c71c4") (240 . "#9EA0E5") (260 . "#2aa198") (280 . "#69CABF") (300 . "#00629D") (320 . "#268bd2") (340 . "#69B7F0") (360 . "#d33682"))))
 '(vc-annotate-very-old-color "#93115C"))

;;core emacs config
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Larger elpa repository
(require 'package)
(add-to-list 'package-archives 
             '("org-mode" . "http://orgmode.org/elpa/"))

(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Melpa
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;yasnippet
(require 'yasnippet)
(yas-global-mode 1)

(load-file "~/.emacs_credentials")

;; packages
;; yasnippet
;; inf-ruby
;; request

;;graphics
( set-face-attribute 'default nil :font "Liberation Mono-10")
(load-theme 'monokai)

;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

; always indent with spaces
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-screen t)
(setq transient-mark-mode t)
(global-font-lock-mode)
(auto-compression-mode)
(show-paren-mode)
(auto-image-file-mode)
(blink-cursor-mode 0)

;; org mode
(add-to-list 'load-path (concat (getenv "HOME") "/emacs-config/vrih"))

(setq vrih-pkg-full
      '(vrih-org
        vrih-sql
        vrih-harvest
        vrih-helm
        vrih-python
        vrih-ido))

(dolist (file vrih-pkg-full)
  (require file))


;;pretty print json
(defun json-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)))
          

(defvar libnotify-program "/usr/bin/notify-send")

(defun notify-send (title message)
  (start-process "notify" " notify"
		 libnotify-program "--expire-time=4000" title message))

;(defun libnotify-jabber-notify (from buf text proposed-alert)
;  "(jabber.el hook) Notify of new Jabber chat messages via libnotify"
;  (when (or jabber-message-alert-same-buffer
;            (not (memq (selected-window) (get-buffer-window-list buf))))
;    (if (jabber-muc-sender-p from)
;        (notify-send (format "(PM) %s"
;                       (jabber-jid-displayname (jabber-jid-user from)))
;               (format "%s: %s" (jabber-jid-resource from) text)))
;      (notify-send (format "%s" (jabber-jid-displayname from))
;             text)))

;(add-hook 'jabber-alert-message-hooks 'libnotify-jabber-notify)


; Markdown
(setq markdown-command "pandoc -H /media/ukpublic/Technology/markdown.css")


;;; Lisp (SLIME) interaction 
;(setq inferior-lisp-program "clisp") 
;(add-to-list 'load-path "~/.slime") 
;(require 'slime) 
;(slime-setup) 

;; Smartparens
(require 'smartparens-config)

;; Pretty symbols
;(require 'pretty-symbols)

(add-hook 'after-init-hook 'global-company-mode)

(eval-after-load "sql"
      (load-library "sql-indent"))
