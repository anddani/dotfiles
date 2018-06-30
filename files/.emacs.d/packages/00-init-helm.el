(use-package helm
  :ensure t
  :init
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)
  (setq helm-candidate-number-list 50)
  :bind (("C-x C-f" . helm-find-files)
         ("C-x b" . helm-buffers-list)))
(provide 'init-helm)
