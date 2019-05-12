;(use-package smartparens-config
;  :ensure t)

(use-package smartparens
  :bind (:map sp-keymap 
              ("C-M-f" . sp-forward-sexp)
              ("C-M-b" . sp-backward-sexp)
              ("C-M-d" . sp-down-sexp)
              ("C-M-a" . sp-backward-down-sexp)
              ("C-S-a" . sp-beginning-of-sexp)
              ("C-S-d" . sp-end-of-sexp)
              ("C-M-e" . sp-up-sexp)
              ("C-M-u" . sp-backward-up-sexp)
              ("C-M-t" . sp-transpose-sexp)
              ("C-M-n" . sp-next-sexp)
              ("C-M-p" . sp-previous-sexp)
              ("C-M-k" . sp-kill-sexp)
              ("C-M-w" . sp-copy-sexp)
              ("M-<delete>" . sp-unwrap-sexp)
              ("M-<backspace>" . sp-backward-unwrap-sexp)
              ("C-M-<right>" . sp-forward-slurp-sexp)
              ("C-M-<left>" . sp-forward-barf-sexp)
              ("C-M-s" . sp-backward-slurp-sexp)
              ("C-M-b" . sp-backward-barf-sexp)
              ("M-D" . sp-splice-sexp)
              ("C-M-<delete>" . sp-splice-sexp-killing-forward)
              ("C-M-<backspace>" . sp-splice-sexp-killing-backward)
              ("C-S-<backspace>" . sp-splice-sexp-killing-around)
              ("C-]" . sp-select-next-thing-exchange)
              ("C-<left_bracket>" . sp-select-previous-thing)
              ("C-M-]" . sp-select-next-thing)
              ("M-F" . sp-forward-symbol)
              ("M-B" . sp-backward-symbol)
              ("H-t" . sp-prefix-tag-object)
              ("H-p" . sp-prefix-pair-object)
              ("H-s c" . sp-convolute-sexp)
              ("H-s a" . sp-absorb-sexp)
              ("H-s e" . sp-emit-sexp)
              ("H-s p" . sp-add-to-previous-sexp)
              ("H-s n" . sp-add-to-next-sexp)
              ("H-s j" . sp-join-sexp)
              ("H-s s" . sp-split-sexp)
              :map emacs-lisp-mode-map
              (")" . sp-up-sexp))
  :ensure t
  :config
  (smartparens-global-mode t)
  (show-smartparens-global-mode t)
  
)



(provide 'vrih-smartparens)
