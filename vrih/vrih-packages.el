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
                                        ; list the packages you want
(setq package-list   '(flycheck
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
    ac-nrepl
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
    ))
    
                                        ; activate all the packages (in particular autoloads)
(package-initialize)

                                        ; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))


(dolist (package package-list)
  (unless (package-installed-p package)
        (package-install package)))

