(use-package magit
  :init
  (progn
    (use-package evil-magit)
    (setq split-height-threshold nil)
    (setq split-width-threshold 0))
  :bind
  (("C-c g" . magit-status))
  :config
  (eval-after-load 'magit
    '(define-key magit-mode-map "V"
       #'endless/visit-pull-request-url)))

(provide 'init-magit)
