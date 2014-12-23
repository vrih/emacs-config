(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq jedi:environment-root "jedi")
(setq jedi:environment-virtualenv
      '("/usr/local/bin/virtualenv-3.2" "--python" "/usr/bin/python3"))

(provide 'vrih-jedi)
