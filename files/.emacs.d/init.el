(defvar emacs-dir "~/.emacs.d/"
  "Emacs config directory")

(defvar elpa-dir (concat emacs-dir "elpa/")
  "Package directory")

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))

(unless (file-exists-p elpa-dir)
  (package-refresh-contents))

(package-initialize)

;; List of packages
(defvar my-packages '(evil) "Default Packages")

(dolist (pkg my-packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)))

;; Move all backup files to separate directory
(setq backup-directory-alist `(("." . "~/.emacs.d/emacs-backups")))

;; Vim key bindings
(setq evil-want-C-u-scroll t) ; Allow C-u to move up half a screen
(require 'evil)
(evil-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
