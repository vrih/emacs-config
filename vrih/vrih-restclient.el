(use-package restclient
  :ensure t
  :init (add-to-list 'auto-mode-alist '("\\.rcl\\'" . restclient-mode))
  :mode (("\\.rcl" . restclient-mode)))

(use-package company-restclient
  :init (add-to-list 'company-backends 'company-restclient)
  :ensure t
  )
