;; Setup emacs gui
(setq inhibit-startup-message t)
(global-linum-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(blink-cursor-mode 0)
(set-terminal-parameter nil 'background-mode 'light)

(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path (concat (getenv "HOME") "/.local/bin"))

;; Fetch util functions
(add-to-list 'load-path "~/.emacs.d/helper/")
(require 'util-functions)

;; Initial package setup
(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/") package-archives)
(push '("melpa" . "http://melpa.org/packages/") package-archives)
(package-initialize)

;; Setup use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Load packages dir
(load-directory "~/.emacs.d/packages")

;; Move all backup files to separate directory
(setq backup-directory-alist `(("." . "~/.emacs.d/emacs-backups")))

(helm-mode 1)

(setq-default indent-tabs-mode nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-pull-arguments nil)
 '(package-selected-packages
   (quote
    (helm-config evil-magit json-mode dracula-theme evil-leader evil)))
 '(safe-local-variable-values
   (quote
    ((haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(find-file "~/todo.org")
