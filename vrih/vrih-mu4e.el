(require 'mu4e)

(use-package mu4e)

(use-package mu4e-multi
.e  :ensure t)

(setq
 mu4e-maildir "~/Mail/"
 mu4e-headers-skip-duplicates t
 mu4e-headers-fields '((:human-date . 10)
                       (:flags . 6)
                       (:maildir . 15)
                       (:from . 25)
                       (:subject . nil))
 mu4e-sent-folder "/Work/[Gmail].Sent Mail"
 mu4e-trash-folder "/Work/[Gmail].Bin"
 mu4e-drafts-folder "/Work/[Gmail].Drafts"
 user-mail-address "daniel.bowtell@infectiousmedia.com")

(setq mu4e-msg2pdf "/usr/bin/msg2pdf")

(setq mu4e-html2text-command "w3m -T text/html")

(setq mu4e-show-images t)
   (when (fboundp 'imagemagick-register-types)
      (imagemagick-register-types))

(setq mu4e-sent-messages-behavior 'delete)

(setq mu4e-maildir-shortcuts
    '( ("/Work/INBOX"               . ?i)
       ("/Work/[Gmail].Sent Mail"   . ?s)
       ("/Work/[Gmail].Trash"       . ?t)
       ("/Work/[Gmail].All Mail"    . ?a)))

(setq mu4e-get-mail-command "offlineimap")
(setq mu4e-update-interval 300)

(global-set-key (kbd "<f7>") 'mu4e)
(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var))
                                                my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))

(defvar my-mu4e-account-alist
  '(("personal"
     (user-mail-address  "dan@danielbowman.co.uk")
     (user-full-name     "Daniel Bowman")
     (mu4e-drafts-folder "/Personal/[Gmail].Drafts")
     (mu4e-trash-folder "/Personal/[Gmail].Bin")
     (mu4e-sent-folder "/Personal/[Gmail].Sent Mail")
     (mu4e-refile-folder "/Personal/[Gmail].All Mail"))
    ("work"
     (user-mail-address  "daniel.bowtell@infectiousmedia.com")
     (mu4e-drafts-folder "/Work/[Gmail].Drafts")
     (mu4e-trash-folder "/Work/[Gmail].Bin")
     (mu4e-sent-folder "/Work/[Gmail].Sent Mail")
     (mu4e-refile-folder "/Work/[Gmail].All Mail"))))

(setq mu4e-user-mail-address-list
      (mapcar (lambda (account) (cadr (assq 'user-mail-address account)))
              my-mu4e-account-alist))
;; ask for account when composing mail
(add-hook 'message-send-mail-hook 'mu4e-multi-smtpmail-set-msmtp-account)
(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)
(add-hook 'mu4e-headers-)
;(require 'smtpmail)
(provide 'vrih-mu4e)
