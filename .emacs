(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Load packages
(load "~/emacs-config/vrih/vrih-packages.el")

;;yasnippet
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-snippet-dirs '("~/emacs-config/yasnippets" yas-installed-snippets-dir ))

(load-file "~/.emacs_credentials")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-backends
   (quote
    (company-bbdb company-ispell company-nxml company-css company-eclim company-semantic company-clang company-xcode company-cmake company-capf
                  (company-dabbrev-code company-gtags company-etags company-keywords)
                  company-oddmuse company-files company-dabbrev)))
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("38ba6a938d67a452aeb1dada9d7cdeca4d9f18114e9fc8ed2b972573138d4664" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "3ac266781ee0ac3aa74a6913a1506924cad669f111564507249f0ffa7c5e4b53" "196cc00960232cfc7e74f4e95a94a5977cb16fd28ba7282195338f68c84058ec" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "60f04e478dedc16397353fb9f33f0d895ea3dab4f581307fbf0aa2f07e658a40" default)))
 '(fci-rule-color "#49483E")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(ledger-reports
   (quote
    (("assets" "ledger ")
     ("bal" "ledger -f %(ledger-file) bal")
     ("reg" "ledger -f %(ledger-file) reg")
     ("payee" "ledger -f %(ledger-file) reg @%(payee)")
     ("account" "ledger -f %(ledger-file) reg %(account)"))) t)
 '(magit-diff-use-overlays nil)
 '(org-agenda-files (quote ("~/Documents/todo.org")))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(safe-local-variable-values
   (quote
    ((projectile-project-compilation-cmd . "make html")
     (epa-file-encrypt-to daniel\.bowtell@infectiousmedia\.com))))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))


;; packages
;; yasnippet
;; inf-ruby
;; request

;;graphics
;;( set-face-attribute 'default nil :font "Liberation Mono-10")

;; Use monkoai theme on graphical systems
(when (display-graphic-p)
    (load-theme 'monokai t))

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

(global-set-key "\M-/" 'hippie-expand)

;; org mode
(add-to-list 'load-path (concat (getenv "HOME") "/emacs-config/vrih"))

(setq vrih-pkg-full
      '(vrih-org
        vrih-sql
        vrih-harvest
        vrih-magit
        vrih-python
        vrih-js
;        vrih-jedi
        vrih-helm
        vrih-ledger
                                        ;        vrih-mu4e
        vrih-projectile
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
  (insert (format "%d" (/ (float-time) 86400)))16531)


(eval-after-load "sql"
      (load-library "sql-indent"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)

(setq x-select-enable-clipboard t
      x-select-enable-primary t)

(projectile-global-mode)



;;; temporary holding for date transposer
(defun my-date-transposition ()
  (interactive)
  (while (re-search-forward "\\([0-9]+\\)/\\([0-9]+\\)/\\([0-9]+\\)" nil t)
    (replace-match (concat (match-string 3) "/"
                           (match-string 2) "/"
                           (match-string 1)) nil nil)))

(defun vrih-fahr-to-cels (x)
  "Convert fahrenheit to cels"
  (* (- x 32) (/ 5.0 9)))


