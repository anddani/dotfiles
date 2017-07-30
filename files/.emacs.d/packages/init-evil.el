(use-package evil
             :init
             (progn
               (setq evil-default cursor t)
               (use-package evil-leader
                            :init (global-evil-leader-mode)
                            :config
                            (progn
                              (setq evil-leader/in-all-states t)
                              (evil-leader/set-leader ",")
                              (evil-leader/set-key
                                "e" 'neotree-toggle
                                "t" 'fiplr-find-file 
                                )))
               (evil-mode 1))
             :config
             (progn
               (define-key evil-insert-state-map [escape] 'evil-normal-state)

               ;; setup evil
               ;; TODO: Will this work with neotree-mode-map?
               (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
               (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
               (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
               (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

               ;; Vim key bindings
               (setq evil-want-C-u-scroll t) ; Allow C-u to move up half a screen
               ))
(provide 'init-evil)
