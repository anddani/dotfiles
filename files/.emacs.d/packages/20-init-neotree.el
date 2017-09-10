(use-package neotree
             :config
             (progn
               
               (setq neo-smart-open t)
               (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
               
               ))

(provide 'init-neotree)
