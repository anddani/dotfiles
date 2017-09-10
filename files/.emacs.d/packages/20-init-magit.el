(use-package magit
  :init
  (use-package evil-magit)
  :bind
  (("C-c g" . magit-status)))

(provide 'init-magit)
