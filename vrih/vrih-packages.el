;; defining the list of packages I want
;; this is a change.
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org-mode" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
  '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(package-initialize)

(defvar vrih-packages
  '(flycheck
    flycheck-ledger
    clj-refactor
    clojure-mode
    cider
    company
    go-mode
    color-theme
    helm
    helm-git
    helm-projectile
    js2-mode
    ledger-mode
    leuven-theme
    magit
    markdown-mode
    monokai-theme
    neotree
    org
    org-bullets
    paredit
    pretty-symbols
    projectile
    rainbow-delimiters
    smartparens
    sql-indent
    yaml-mode
    ac-ispell
    ac-python
    ace-flyspell
    ace-jump-mode
    auto-complete-rst
;    clj-refactor-mode
    color-theme-solarized
    company-emoji
    company-go
    company-restclient
    company-web    
    ;; neotree
    
   ) "A list of packages to ensure are installed at launch.")

;; http://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifyinng-a-list-of-package-name
(setq url-http-attempt-keepalives nil)

(dolist (p vrih-packages)
  (unless (package-installed-p p)
    (package-install p)))
