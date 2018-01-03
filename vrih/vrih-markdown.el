(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command (concat "pandoc -c " (getenv "HOME") "/Dropbox/pandoc.css -f markdown -t html5 --mathjax --highlight-style pygments --standalone"))
 
)

(use-package flymd
  :ensure t
  :init (defun my-flymd-browser-function (url)
   (let ((browse-url-browser-function 'browse-url-firefox))
     (browse-url url)))
 (setq flymd-browser-open-function 'my-flymd-browser-function) 
)

                                        ; (add-hook 'markdown-mode-hook 'turn-on-visual-line-mode)
(add-hook 'markdown-mode-hook 'visual-fill-column-mode)

;(setq markdown-command "pandoc -c slidy.css -f markdown -t slidy --mathjax --highlight-style pygments --standalone")

(provide 'vrih-markdown)
