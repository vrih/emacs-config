(use-package restclient
  :ensure t
  :init (add-to-list 'auto-mode-alist '("\\.rcl\\'" . restclient-mode))
  :mode (("\\.rcl" . restclient-mode)))

(use-package company-restclient
  :init (add-hook 'restclient-mode-hook
                  (lambda ()
                    (add-to-list (make-local-variable 'company-backends)
                                 'company-restclient)))
  :ensure t
  )

(provide 'vrih-restclient)
