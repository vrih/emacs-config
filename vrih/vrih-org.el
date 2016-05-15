(setq org-src-fontify-natively t); syntax highlighting
(setq org-export-htmlize-output-type 'css)
(add-to-list 'load-path "~/emacs-config/org-reveal/")
;(require 'ox-reveal)

(setq org-reveal-root "file:///home/daniel.bowtell/apps/revealjs")

(org-babel-do-load-languages
 'org-babel-load-languages
 '((plantuml . t)
   (sql . t)))


(setq org-plantuml-jar-path "/home/daniel.bowtell/Downloads/plantuml.jar")

(setq org-todo-keywords
      '((sequence "BACKLOG" "TODO" "WAITING" "IN PROGRESS" "|" "DONE" "CANCELLED")))

 (setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Documents/todo.org" "Tasks")
             "* TODO %?\n  %i")))

(define-key global-map "\C-cc" 'org-capture)

(global-set-key (kbd "C-x a") 'org-agenda-list)

(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

(setq org-agenda-archives-mode nil)
(setq org-agenda-skip-comment-trees nil)
(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)

;; Org bullets mode
;(require 'org-bullets)
;(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(provide 'vrih-org)
