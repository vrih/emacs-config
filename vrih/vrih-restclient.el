(use-package restclient
  :ensure t)

(use-package company-restclient
  :init (add-to-list 'company-backends 'company-restclient)
  :ensure t
  )
