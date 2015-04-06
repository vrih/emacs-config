(require 'mu4e)

(if (string-equal (system-name) "daniel-Latitude-3440")
    (setq
     mu4e-maildir "~/Maildir"
     mu4e-drafts-folder "/[Gmail].Drafts"
     mu4e-trash-folder "/[Gmail].Bin"
     mu4e-sent-folder "/[Gmail].Sent Mail"
     mu4e-refile-folder "/[Gmail].All Mail"
     mu4e-headers-skip-duplicates t
     mu4e-headers-fields '((:human-date . 10)
                           (:flags . 6)
                           (:maildir . 15)
                           (:from . 25)
                           (:subject . nil)))
  (setq mu4e-maildir "~/.fastmail_maildir"
        mu4e-drafts-folder "/INBOX.Drafts"
        mu4e-trash-folder "/INBOX.Trash"
        mu4e-sent-folder "/INBOX.Sent Items"
        mu4e-refile-folder "/INBOX.Archive"))

(setq mu4e-msg2pdf "/usr/bin/msg2pdf")

(setq mu4e-html2text-command "w3m -T text/html")
(setq mu4e-show-images t)
   (when (fboundp 'imagemagick-register-types)
      (imagemagick-register-types))

(setq mu4e-sent-messages-behavior 'delete)
(setq mu4e-maildir-shortcuts
    '( ("/INBOX"               . ?i)
       ("/[Gmail].Sent Mail"   . ?s)
       ("/CCd"   . ?c)
       ("/[Gmail].Trash"       . ?t)
       ("/[Gmail].All Mail"    . ?a)))

(setq mu4e-get-mail-command "offlineimap")
(setq mu4e-update-interval 300)

(global-set-key (kbd "<f7>") 'mu4e)

(require 'smtpmail)
(provide 'vrih-mu4e)
