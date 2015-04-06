;(tool-bar-mode -1)
;(menu-bar-mode -1)
;(scroll-bar-mode -1)

;; Larger elpa repository
(require 'package)
(add-to-list 'package-archives
             '("org-mode" . "http://orgmode.org/elpa/"))

;; Datadog
;(add-to-list 'load-path (expand-file-name "~/emacs-config/datadog.el"))
;(require 'datadog)

(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Melpa
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.org/packages/") t)

;;yasnippet
(require 'yasnippet)
(yas-global-mode 1)

(load-file "~/.emacs_credentials")


(require 'org-trello)
(custom-set-variables '(org-trello-files '("/home/daniel.bowtell/notes/bsm-trello.org" "/home/daniel.bowtell/notes/tech-ops-trello.org")))


;; packages
;; yasnippet
;; inf-ruby
;; request

;;graphics
( set-face-attribute 'default nil :font "Liberation Mono-10")
;(load-theme 'monokai t)

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
        vrih-magit
        vrih-python
        vrih-jedi
        vrih-helm
                                        ;        vrih-mu4e
        vrih-mouse
        vrih-smartparens
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
(setq markdown-command "pandoc -H ~/notes/markdown.css")


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

(defun vrih-hour-code ()
  (interactive)
  (insert (format "%d" (/ (float-time) 3600))))

(defun vrih-period ()
  (interactive)
  (insert (format "%d" (/ (float-time) 86400))))


(eval-after-load "sql"
      (load-library "sql-indent"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "60f04e478dedc16397353fb9f33f0d895ea3dab4f581307fbf0aa2f07e658a40" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)

(setq x-select-enable-clipboard t
      x-select-enable-primary t)
