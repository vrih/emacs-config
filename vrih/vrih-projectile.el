(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-register-project-type 'yarn '("package.json")
				  :compile "yarn build"
				  :test "yarn test:unit"
				  :run "yarn dev"
				  :test-suffix ".spec"
                                  :test-dir "tests/")
(use-package helm-ag
  :ensure t)

(use-package ggtags
  :ensure t)

(use-package hydra
  :ensure t)

(defhydra hydra-projectile-other-window (:color teal)
  "projectile-other-window"
  ("f"  projectile-find-file-other-window        "file")
  ("g"  projectile-find-file-dwim-other-window   "file dwim")
  ("d"  projectile-find-dir-other-window         "dir")
  ("b"  projectile-switch-to-buffer-other-window "buffer")
  ("q"  nil                                      "cancel" :color blue))

(defhydra hydra-projectile (:color teal
                            :hint nil)
  "
     Find File            Search/Tags          Buffers                Cache
------------------------------------------------------------------------------------------
  _f_: file            _a_: ag                _i_: Ibuffer           _c_: cache clear
  _r_: recent file     _g_: update gtags      _b_: switch to buffer  _x_: remove known project
  _d_: dir             _o_: multi-occur     _s-k_: Kill all buffers  _X_: cleanup non-existing
  _t_: toggle test
"

  ("a"   projectile-ag)
  ("b"   projectile-switch-to-buffer)
  ("c"   projectile-invalidate-cache)
  ("d"   projectile-find-dir)
  ("f"   projectile-find-file)
  ("g"   ggtags-update-tags)
  ("s-g" ggtags-update-tags)
  ("i"   projectile-ibuffer)
  ("K"   projectile-kill-buffers)
  ("s-k" projectile-kill-buffers)
  ("m"   projectile-multi-occur)
  ("o"   projectile-multi-occur)
  ("p"   helm-projectile)
  ("s"   projectile-switch-project)
  ("r"   projectile-recentf)
  ("t"   projectile-toggle-between-implementation-and-test)
  ("x"   projectile-remove-known-project)
  ("X"   projectile-cleanup-known-projects)
  ("z"   projectile-cache-current-file)
  ("`"   hydra-projectile-other-window/body "other window")
  ("q"   nil "cancel" :color blue))

(global-set-key (kbd "C-c P") 'hydra-projectile/body)

(provide 'vrih-projectile)
