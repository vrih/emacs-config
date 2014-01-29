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

(load-file "~/.emacs_credentials")

;; packages
;; yasnippet
;; inf-ruby
;; request

;;graphics
(set-face-attribute 'default nil :font "Liberation Mono-10")
(load-theme 'solarized-dark)

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


;;pretty print json
(defun json-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)))

;;Haskell
(custom-set-variables
 '(haskell-mode-hook '(turn-on-haskell-indentation)))


;; set default sql product
(setq sql-product 'mysql)
(setq sql-connection-alist
      '((pdb
         (sql-name "pdb")
         (sql-product 'mysql)
         (sql-user pdb-sql-user)
         (sql-port 3306)
         (sql-password pdb-sql-pass)
         (sql-server pdb-domain))
        (pdw
         (sql-name "pdw")
         (sql-product 'mysql)
         (sql-user pdb-sql-user)
         (sql-password pdb-sql-pass)
         (sql-server pdw-domain))
        (dmp
         (sql-name "dmp")
         (sql-product 'mysql)
         (sql-user pdb-sql-user)
         (sql-port 5029)
         (sql-password pdb-sql-pass)
         (sql-server dmp-domain))))


(defun sql-pdb ()
  (interactive)
  (sql-connect-preset 'pdb))
(defun sql-pdw ()
  (interactive)
  (sql-connect-preset 'pdw))
(defun sql-dmp ()
  (interactive)
  (sql-connect-preset 'dmp))

;; this makes all it all happen via M-x sql-pool-host1_db1, etc.
(defun sql-connect-preset (name)
  "Connect to a predefined SQL connection listed in `sql-connection-alist'"
  (eval `(let ,(cdr (assoc name sql-connection-alist))
           (flet ((sql-get-login (&rest what)))
             (sql-product-interactive sql-product)))))

;; names the buffer *SQL: <host>_<db>, which is easier to 
;; find when you M-x list-buffers, or C-x C-b
(defun sql-make-smart-buffer-name ()
  "Return a string that can be used to rename a SQLi buffer.
  This is used to set `sql-alternate-buffer-name' within
  `sql-interactive-mode'."
  (or (and (boundp 'sql-name) sql-name)
      (concat (if (not(string= "" sql-server))
                  (concat
                   (or (and (string-match "[0-9.]+" sql-server) sql-server)
                       (car (split-string sql-server "\\.")))
                   "/"))
              sql-database)))

(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (setq sql-alternate-buffer-name (sql-make-smart-buffer-name))
            (sql-rename-buffer)))         
          

(defvar libnotify-program "/usr/bin/notify-send")

(defun notify-send (title message)
  (start-process "notify" " notify"
		 libnotify-program "--expire-time=4000" title message))

(defun libnotify-jabber-notify (from buf text proposed-alert)
  "(jabber.el hook) Notify of new Jabber chat messages via libnotify"
  (when (or jabber-message-alert-same-buffer
            (not (memq (selected-window) (get-buffer-window-list buf))))
    (if (jabber-muc-sender-p from)
        (notify-send (format "(PM) %s"
                       (jabber-jid-displayname (jabber-jid-user from)))
               (format "%s: %s" (jabber-jid-resource from) text)))
      (notify-send (format "%s" (jabber-jid-displayname from))
             text)))

(add-hook 'jabber-alert-message-hooks 'libnotify-jabber-notify)


; Markdown
(setq markdown-command "pandoc -H /home/daniel.bowtell/notes/markdown.css")


;;; Lisp (SLIME) interaction 
;(setq inferior-lisp-program "clisp") 
;(add-to-list 'load-path "~/.slime") 
;(require 'slime) 
;(slime-setup) 


;; Harvest
;; Harvest
(defun harvest-start-timer (project_id task_id)
  (let ((url-request-method "POST")
        (url-request-extra-headers `(("Content-Type" . "application/xml") 
                                     ("User-Agent" . "Emacs Elisp Infectious Media")
                                     ("Accept" . "application/xml")
                                     ("Authorization" . ,harvest-token)))
        (url-request-data (concat "<request><notes> </notes><hours> </hours>
<project_id type=\"integer\">" project_id "</project_id>
<task_id type=\"integer\">" task_id "</task_id>
<spent_at type=\"date\">" (format-time-string "%a, %d %b %Y" (current-time)) "</spent_at></request>")))
    (with-current-buffer (url-retrieve-synchronously "https://infectiousmedia.harvestapp.com/daily/add") (buffer-string))))

(defun harvest-troubleshoot-start-timer ()
  "Start the timer on the troubleshooting task"
 (interactive) (harvest-start-timer "4764174" "2666846"))


(defun harvest-bidder-admin-start-timer () (interactive) (harvest-start-timer "4764174" "2666856"))
