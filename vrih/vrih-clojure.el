(use-package clojure-mode
  :ensure t
  :config (yas-minor-mode 1))

;(use-package midje-mode
;  :init (add-hook 'clojure-mode 'midje-mode)
;  :bind (:midje-mode-map
;         ("C-c p" . nil)
;         ("C-c m p" . midje-previous-fact))
;  :ensure t)


(use-package clj-refactor
  :ensure t)

;(use-package cider
;  :bind (:cider-mode-map ("C-c C-d" . ac-nrepl-popup-doc))
;  :ensure t)

(use-package ac-cider
  :commands (ac-flyspell-workaround ac-cider-setup)
  :init (add-hook 'cider-mode-hook 'ac-flycheck-workaround)
  (add-hook 'cider-mode-hook 'ac-cider-setup)
  (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
  :ensure t)

                                        ;(require 'clj-refactor)

(require 'clojure-jump-to-file)

(require 'ac-cider)
(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-modes 'cider-mode)
     (add-to-list 'ac-modes 'cider-repl-mode)))

(add-hook 'clojure-mode-hook #'eldoc-mode)

(add-hook 'clojure-mode-hook (lambda ()
                               (setq compile-command "lein uberjar")))

(add-to-list 'same-window-buffer-names "<em>nrepl</em>")


;; General Auto-Complete
(require 'auto-complete-config)
(setq ac-delay 0.0)
(setq ac-quick-help-delay 0.5)
(ac-config-default)

;; ac-nrepl (Auto-complete for the nREPL)
;(require 'ac-nrepl)
;(add-hook 'cider-mode-hook 'ac-nrepl-setup)
;(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)


(provide 'vrih-clojure)

