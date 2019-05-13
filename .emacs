(defun my-buffer-face-mode-variable ()
   "Set font to a variable width (proportional) fonts in current buffer."
   (interactive)
   (setq buffer-face-mode-face '(:family "Noto Sans" :height 120 :width semi-condensed))
   (buffer-face-mode))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(use-package yasnippet
  :init (setq yas-snippet-dirs '("~/emacs-config/yasnippets" yas-installed-snippets-dir))
  (yas-global-mode 1)
  :ensure t)

(setq user-emacs-directory "~/emacs-config/")
(setq custom-file (concat user-emacs-directory "/custom.el"))
(load-file custom-file)

(add-to-list 'load-path (concat (getenv "HOME") "/emacs-config/vrih"))

(require 'subr-x)
(require 'vrih-packages)
(dolist (file
	 (directory-files (concat (getenv "HOME") "/emacs-config/vrih")
			  nil
			  "^vrih-.*el$"))
  (require (intern (string-trim-right file ".el"))))

;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

; always indent with spaces
(setq-default indent-tabs-mode nil)

(setq transient-mark-mode t)

(auto-compression-mode)

(global-set-key "\M-/" 'hippie-expand)

;;pretty print json
(defun json-format ()
  "Format region as pretty printed JSON using python."
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)))

(defvar libnotify-program "/usr/bin/notify-send")

(add-hook 'after-init-hook 'global-company-mode)

(defun vrih-hour-code ()
  "Insert the current hour code."
  (interactive)
  (insert (format "%d" (/ (float-time) 3600))))

(defun vrih-period ()
  "Insert the current day code."
  (interactive)
  (insert (format "%d" (/ (float-time) 86400)))16531)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-checkbox ((t (:background "#272822" :foreground "#F8F8F2"))))
 '(org-default ((t (:family "Noto Sans")))))
(put 'upcase-region 'disabled nil)

(setq x-select-enable-clipboard t
      x-select-enable-primary t)

(use-package edit-server
  :init (edit-server-start)
  :ensure t)

;;; temporary holding for date transposer
(defun my-date-transposition ()
  (interactive)
  (while (re-search-forward "\\([0-9]+\\)/\\([0-9]+\\)/\\([0-9]+\\)" nil t)
    (replace-match (concat (match-string 3) "/"
                           (match-string 2) "/"
                           (match-string 1)) nil nil)))

(defun my-fahr-to-cels (fahrenheit)
  "Convert FAHRENHEIT to celsius."
  (* (- fahrenheit 32) (/ 5.0 9)))

(setq browse-url-generic-program "firefox" )

(global-set-key [remap dabbrev-expand] 'hippie-expand)
  (eval-after-load 'edit-server
    '(add-to-list 'edit-server-url-major-mode-alist
                  '("inbox\\.google\\." . gmail-message-edit-server-mode)))

;(require 'persistent-soft)
(defun my-dec-to-ip (decimal)
  "Convert DECIMAL value to ip."
  (if (> decimal 255)
      (concat
       (my-dec-to-ip (ash decimal -8))
       "."
       (number-to-string (logand decimal 255)))
    (number-to-string (logand decimal 255))))

;; ace jump mode
(use-package ace-jump-mode
  :init (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
  :ensure t)
          
;; stop tramp hanging
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

(add-hook 'mail-mode-hook 'turn-on-visual-line-mode)
(server-start)
(add-hook 'rst-mode-hook 'my-buffer-face-mode-variable)
(add-hook 'rst-mode-hook 'turn-on-auto-fill)

 ;;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph
(defun unfill-paragraph (&optional region)
  "Takes a multi-line REGION and make it into a single line of text."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
        ;; This would override `fill-column' if it's an integer.
        (emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))

;; Handy key definition
(define-key global-map "\M-Q" 'unfill-paragraph)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package multiple-cursors
  :ensure t)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(use-package iedit
  :ensure t
  :defer t)

(defadvice erase-buffer (around erase-buffer-noop)
  "Make 'erase-buffer' do nothing.")

(defadvice shell-command (around shell-command-unique-buffer activate compile)
  (if (or current-prefix-arg
          (not (string-match "[ \t]*&[ \t]*\\'" command)) ;; background
          (bufferp output-buffer)
          (stringp output-buffer))
      ad-do-it ;; no behavior change

    ;; else we need to set up buffer
    (let* ((command-buffer-name
            (format "*background: %s*"
                    (substring command 0 (match-beginning 0))))
           (command-buffer (get-buffer command-buffer-name)))

      (when command-buffer
        ;; if the buffer exists, reuse it, or rename it if it's still in use
        (cond ((get-buffer-process command-buffer)
               (set-buffer command-buffer)
               (rename-uniquely))
              ('t
               (kill-buffer command-buffer))))
      (setq output-buffer command-buffer-name)

      ;; insert command at top of buffer
      (switch-to-buffer-other-window output-buffer)
      (insert "Running command: " command
              "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n")

      ;; temporarily blow away erase-buffer while doing it, to avoid
      ;; erasing the above
      (ad-activate-regexp "erase-buffer-noop")
      ad-do-it
      (ad-deactivate-regexp "erase-buffer-noop"))))

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; ido imenu
(defun ido-goto-symbol (&optional symbol-list)
  "Refresh imenu and jump to a place in the buffer using Ido."
  (interactive)
  (unless (featurep 'imenu)
    (require 'imenu nil t))
  (cond
   ((not symbol-list)
    (let ((ido-mode ido-mode)
          (ido-enable-flex-matching
           (if (boundp 'ido-enable-flex-matching)
               ido-enable-flex-matching t))
          name-and-pos symbol-names position)
      (unless ido-mode
        (ido-mode 1)
        (setq ido-enable-flex-matching t))
      (while (progn
               (imenu--cleanup)
               (setq imenu--index-alist nil)
               (ido-goto-symbol (imenu--make-index-alist))
               (setq selected-symbol
                     (ido-completing-read "Symbol? " symbol-names))
               (string= (car imenu--rescan-item) selected-symbol)))
      (unless (and (boundp 'mark-active) mark-active)
        (push-mark nil t nil))
      (setq position (cdr (assoc selected-symbol name-and-pos)))
      (cond
       ((overlayp position)
        (goto-char (overlay-start position)))
       (t
        (goto-char position)))))
   ((listp symbol-list)
    (dolist (symbol symbol-list)
      (let (name position)
        (cond
         ((and (listp symbol) (imenu--subalist-p symbol))
          (ido-goto-symbol symbol))
         ((listp symbol)
          (setq name (car symbol))
          (setq position (cdr symbol)))
         ((stringp symbol)
          (setq name symbol)
          (setq position
                (get-text-property 1 'org-imenu-marker symbol))))
        (unless (or (null position) (null name)
                    (string= (car imenu--rescan-item) name))
          (add-to-list 'symbol-names name)
          (add-to-list 'name-and-pos (cons name position))))))))
(global-set-key "\C-ci" 'ido-goto-symbol) ; or any key you see fit

(use-package todotxt
  :ensure t
  :init (add-to-list 'auto-mode-alist '("todo.txt" . todotxt-mode)))

(use-package org-jira
  :ensure t
  :init (setq jiralib-url "https://adlm.nielsen.com/jira")
  )


(use-package yasnippet-snippets
  :ensure t)
(put 'downcase-region 'disabled nil)
