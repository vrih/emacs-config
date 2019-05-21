(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(use-package solarized-theme
  :ensure t)

(set-face-attribute 'default nil :font "Inconsolata" :height 130)

(use-package rainbow-delimiters
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  :ensure t)

(when (member "EmojiOne" (font-family-list))
  (set-fontset-font t 'unicode "EmojiOne" nil 'prepend))

;; Use zenburn theme on graphical systems
(when (display-graphic-p)
  (load-theme 'solarized-light t))

(use-package unicode-fonts
  :init (unicode-fonts-setup)
  :ensure t)

;;; Modeline
;;; Mode line config
;(powerline-default-theme)

(setq mode-line-position
      '((line-number-mode ("%l" (column-number-mode ":%c")))))

(setq default-mode-line-format
      '("%e"
        mode-line-position))
(defun shorten-directory (dir max-length)
  "Show up to MAX-LENGTH characters of a directory name DIR."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
               (output ""))
       (when (and path (equal "" (car path)))
         (setq path (cdr path)))
       (while (and path (< (length output) (- max-length 4)))
         (setq output (concat (car path) "/" output))
         (setq path (cdr path)))
       (when path
         (setq output (concat "…/" output)))
       output))

(defvar mode-line-directory
  '(:propertize
    (:eval (if (buffer-file-name) (concat " " (shorten-directory default-directory 20)) " "))
                face mode-line)
  "Formats the current directory.")
(put 'mode-line-directory 'risky-local-variable t)

(setq-default mode-line-buffer-identification
  (propertized-buffer-identification "%b "))

;; change definition of vc-mode-line
;; (defadvice vc-mode-line (after strip-backend () activate)
;;   (when (stringp vc-mode)
;;     (let ((gitlogo (replace-regexp-in-string "^ Git." ":" vc-mode)))
;;       (setq vc-mode gitlogo))))

(defun replace-git-with-logo (orig-func &rest args)
  "Replace the word 'GIT' with the font awesome logo in status bar."
  (when (stringp vc-mode)
    (let ((gitlogo (replace-regexp-in-string "Git" "" vc-mode)))
      (setq vc-mode gitlogo))))

(advice-add 'vc-mode-line :after #'replace-git-with-logo)

(setq-default mode-line-format
      '("%e"
        mode-line-front-space
        ;; mode-line-mule-info -- I'm always on utf-8
        mode-line-client
        mode-line-modified
        ;; mode-line-remote -- no need to indicate this specially
        ;; mode-line-frame-identification -- this is for text-mode emacs only
        " "
        mode-line-directory
        mode-line-buffer-identification
        " "
        mode-line-position

        (vc-mode vc-mode)

        ;;(vc-mode vc-mode)  -- I use magit, not vc-mode
        (flycheck-mode flycheck-mode-line)
        " "
        mode-line-modes
        mode-line-misc-info
        mode-line-end-spaces))
;;; End mde line config

(show-paren-mode)
(auto-image-file-mode)
(blink-cursor-mode 0)
(global-font-lock-mode)
(global-prettify-symbols-mode +1)
(setq inhibit-startup-screen t)

(use-package visual-fill-column
  :ensure t
  :defer t
  :config (setq-default visual-fill-column-center-text t
                        visual-column-fringes-outside-margins nil
                        visual-fill-column-width 100))


(provide 'vrih-appearance)

