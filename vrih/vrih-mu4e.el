(require 'mu4e)

(setq mu4e-maildir "~/.fastmail_maildir")
(setq mu4e-drafts-folder "/INBOX.Drafts")
(setq mu4e-trash-folder "/INBOX.Trash")
(setq mu4e-sent-folder "/INBOX.Sent Items")
(setq mu4e-refile-folder "/INBOX.Archive")

(setq mu4e-msg2pdf "/usr/bin/msg2pdf")

(setq mu4e-html2text-command "w3m -T text/html")
(setq mu4e-show-images t)
   (when (fboundp 'imagemagick-register-types)
      (imagemagick-register-types))

(setq mu4e-get-mail-command "offlineimap")

(require 'smtpmail)
