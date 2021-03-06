(use-package org
  :init
  (setq org-agenda-archives-mode nil)
  (setq org-agenda-skip-comment-trees nil)
  (setq org-src-tab-acts-natively t)
  (setq org-refile-use-outline-path t)
  (setq org-html-html5-fancy t)
  (setq org-html-checkbox-type 'unicode)
  (setq org-html-use-unicode-chars t)
  (setq org-confirm-babel-evaluate nil)
  (setq org-refile-targets (quote ((nil :maxlevel . 9)
                                   (org-agenda-files :maxlevel . 9))))
  (setq org-src-fontify-natively t); syntax highlighting
  (setq org-export-htmlize-output-type 'css)
  (add-to-list 'load-path "~/emacs-config/org-reveal/")
  (setq org-reveal-root "file:///home/daniel.bowtell/apps/revealjs")
  (setq org-plantuml-jar-path "/usr/share/plantuml/plantuml.jar")
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/Dropbox/Documents/todo.org" "Tasks")
           "* TODO %?\n  %i")
          ("j" "Journal" entry (file+headline "~/Dropbox/Documents/todo.org" "Work log")
           "* %T %?\n  %i" :clock-keep :clock-start)))
  (setq org-outline-path-complete-in-steps nil)
  (add-hook 'org-mode-hook 'flyspell-mode)
  (add-hook 'org-mode-hook 'turn-on-auto-fill)
  (add-hook 'org-mode-hook
            (lambda ()
              (push '("[ ]" . "☐") prettify-symbols-alist)
              (push '("[X]" . "☒" ) prettify-symbols-alist)
              (push '("[-]" . "◫" ) prettify-symbols-alist)
              (prettify-symbols-mode)))
  :bind (("C-c c" . org-capture)
         ("C-c h" . org-html-export-to-html)
         ("C-x a" . org-agenda-list))
  :ensure t
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((plantuml . t)
     ;(sh . t)
     (dot . t)
     (python . t)
     (sql . t))))

(use-package org-bullets
  :init (add-hook 'org-mode-hook #'org-bullets-mode)
  :ensure t)

(defhydra hydra-org-clock (:color blue :hint nil)
   "
Clock   In/out^     ^Edit^   ^Summary     (_?_)
-----------------------------------------
        _i_n         _e_dit   _g_oto entry
        _c_ontinue   _q_uit   _d_isplay
        _o_ut        ^ ^      _r_eport
      "
   ("i" org-clock-in)
   ("o" org-clock-out)
   ("c" org-clock-in-last)
   ("e" org-clock-modify-effort-estimate)
   ("q" org-clock-cancel)
   ("g" org-clock-goto)
   ("d" org-clock-display)
   ("r" org-clock-report)
   ("?" (org-info "Clocking commands")))

(evil-leader/set-key-for-mode 'org-mode "c" 'hydra-org-clock/body)


(provide 'vrih-org)
