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
         (sql-port 3306)
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

(provide 'vrih-sql)
