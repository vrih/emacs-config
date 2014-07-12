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

(provide 'vrih-harvest)
