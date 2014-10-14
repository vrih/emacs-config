(setq org-src-fontify-natively t); syntax highlighting
(setq org-export-htmlize-output-type 'css)
(add-to-list 'load-path "~/emacs-config/org-reveal/")
(require 'ox-reveal)

(setq org-reveal-root "file:///home/daniel.bowtell/apps/revealjs")

(org-babel-do-load-languages
 'org-babel-load-languages
 '((plantuml . t)))

(setq org-plantuml-jar-path "/home/daniel.bowtell/Downloads/plantuml.jar")

(setq org-todo-keywords
      '((sequence "TODO" "WAITING" "|" "DONE" "FAILED")))

 (setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/notes/todo.org" "Tasks")
             "* TODO %?\n  %i")))

(define-key global-map "\C-cc" 'org-capture)

(global-set-key (kbd "<f5>") 'org-agenda-list)

(setq org-agenda-archives-mode nil)
(setq org-agenda-skip-comment-trees nil)

;; Org bullets mode
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(provide 'vrih-org)
