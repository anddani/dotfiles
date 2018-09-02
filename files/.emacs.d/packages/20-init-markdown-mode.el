(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc -c ~/.emacs.d/github-pandoc.css --from gfm -t html5 --metadata title=Travel --mathjax --highlight-style pygments --standalone"))
(provide 'init-markdown-mode)
