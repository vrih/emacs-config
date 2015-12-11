(defun my-switch-to-url-buffer (status)
     "Switch to the buffer returned by `url-retreive'.
    The buffer contains the raw HTTP response sent by the server."
      (switch-to-buffer (current-buffer)))

(defun set-market-prices (price-list)
  "Set the market price for a list of ades"
  (let ((url-request-method        "PUT")
        (url-request-extra-headers `(("Content-Type" . "application/json")
                                     ("Accept" . "application/json")
                                     ("Authorization" . market-token))))
    (dolist (p price-list)
      (let ((url-request-data  (concat "{\"price\":" (number-to-string (cadr p)) "}")))
        (url-retrieve (replace-regexp-in-string "ad_id" (number-to-string (car p)) market-price-url) 'my-switch-to-url-buffer)))))

(provide 'vrih-im)
