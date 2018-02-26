(defun bq-run-query ()
  "Run query using biq query command line"
  (interactive)
  (shell-command (concat "bq query -n 500000 --nouse_legacy_sql --format csv '"
                         (replace-regexp-in-string "'" "\"" (buffer-string))
                         "' &")))


;(makunbound 'bigquery-mode-map)
(setq bq-keywords '("_TABLE_SUFFIX" "_PARTITIONTIME"))
(setq bq-keywords-regexp (regexp-opt bq-keywords 'words))

(setq bq-functions '("TIMESTAMP_SECONDS" "TIMESTAMP_MICROS" "TIMESTAMP_MILLIS" "UNIX_SECONDS" "UNIX_MILLIS"
                     "CURRENT_TIMESTAMP" "EXTRACT" "STRING" "TIMESTAMP_ADD" "TIMESTAMP_SUB" "TIMESTAMP_DIFF"
                     "TIMESTAMP_TRUNC" "FORMAT_TIMESTAMP" "PARSE_TIMESTAMP"))
(setq bq-functions-regexp (regexp-opt bq-functions 'words))

(setq bq-font-lock-keywords
      `((,bq-functions-regexp . font-lock-type-face)
        (,bq-keywords-regexp . font-lock-keyword-face)))

(defconst bigquery-mode-syntax-table
  (let ((table (make-syntax-table)))
    
    (modify-syntax-entry ?- ". 12" table )
    (modify-syntax-entry ?' "\"" table)
    (modify-syntax-entry ?# "<" table)
    (modify-syntax-entry ?\n ">" table)
    table))

(defvar bigquery-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\C-c\C-c" 'bq-run-query)
    map))


;; company backend
(require 'cl-lib)
(require 'company)

(defconst bigquery-company-completions
  '("_TABLE_SUFFIX" "_PARTITIONTIME"
    "TIMESTAMP" "TIMESTAMP_SECONDS" "TIMESTAMP_MILLIS" "TIMESTAMP_MICROS"))

(defun bigquery-company-backend (command &optional arg &rest ignored)
   (interactive (list 'interactive))
 (cl-case command
     (interactive (company-begin-backend 'bigquery-company-backend))
     (prefix (and (eq major-mode 'bigquery-mode)
                 (company-grab-symbol)))
     (candidates
     (cl-remove-if-not
       (lambda (c) (string-prefix-p arg c))
       bigquery-company-completions))))

(add-to-list 'company-backends 'bigquery-company-backend)




(define-derived-mode bigquery-mode sql-mode "BigQuery"
  "Big Query Mode"
  :syntax-table bigquery-mode-syntax-table
  (font-lock-add-keywords nil bq-font-lock-keywords)
  (font-lock-fontify-buffer)
  )

;(setq bq-font-lock-keywords nil)

(provide 'bigquery-mode)










