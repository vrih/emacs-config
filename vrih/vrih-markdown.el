(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command (concat "pandoc -c " (getenv "HOME") "/Documents/pandoc.css -f markdown -t html5 --mathjax --highlight-style pygments --standalone"))
  (setq markdown-split-window-direction "right")
)

(use-package flymd
  :ensure t
  :init (defun my-flymd-browser-function (url)
   (let ((browse-url-browser-function 'browse-url-firefox))
     (browse-url url)))
 (setq flymd-browser-open-function 'my-flymd-browser-function) 
)

(use-package company-emoji
  :init (add-hook 'markdown-mode-hook
                  (lambda ()
                    (add-to-list (make-local-variable 'company-backends)
                                 'company-emoji))))

                                        ; (add-hook 'markdown-mode-hook 'turn-on-visual-line-mode)
(add-hook 'markdown-mode-hook 'visual-fill-column-mode)

(defhydra dh-hydra-markdown-mode (:hint nil)
  "
Formatting        C-c C-s    _s_: bold          _e_: italic     _b_: blockquote   _p_: pre-formatted    _c_: code

Headings          C-c C-t    _h_: automatic     _1_: h1         _2_: h2           _3_: h3               _4_: h4

Lists             C-c C-x    _m_: insert item   

Demote/Promote    C-c C-x    _l_: promote       _r_: demote     _u_: move up      _d_: move down

Links, footnotes  C-c C-a    _L_: link          _U_: uri        _F_: footnote     _W_: wiki-link      _R_: reference
 
"


  ("s" markdown-insert-bold)
  ("e" markdown-insert-italic)
  ("b" markdown-insert-blockquote :color blue)
  ("p" markdown-insert-pre :color blue)
  ("c" markdown-insert-code)

  ("h" markdown-insert-header-dwim) 
  ("1" markdown-insert-header-atx-1)
  ("2" markdown-insert-header-atx-2)
  ("3" markdown-insert-header-atx-3)
  ("4" markdown-insert-header-atx-4)

  ("m" markdown-insert-list-item)

  ("l" markdown-promote)
  ("r" markdown-demote)
  ("d" markdown-move-down)
  ("u" markdown-move-up)  

  ("L" markdown-insert-link :color blue)
  ("U" markdown-insert-uri :color blue)
  ("F" markdown-insert-footnote :color blue)
  ("W" markdown-insert-wiki-link :color blue)
  ("R" markdown-insert-reference-link-dwim :color blue) 
)


(defhydra dh-hydra-markdown-mode-compile (:hint nil)
  "
_e_: export 

_p_: preview

_l_: live preview
"
  ("e" markdown-export)
  ("p" markdown-preview)
  ("l" markdown-live-preview-mode)
)

(require 'hydra)
(add-hook 'markdown-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c .") 'dh-hydra-markdown-mode/body)))

;(setq markdown-command "pandoc -c slidy.css -f markdown -t slidy --mathjax --highlight-style pygments --standalone")

(evil-leader/set-key-for-mode 'markdown-mode "c" 'dh-hydra-markdown-mode-compile/body)
(provide 'vrih-markdown)
