(use-package hindent
             :init 
             (progn
               (add-hook 'haskell-mode-hook #'hindent-mode)))
(provide 'init-hindent)
