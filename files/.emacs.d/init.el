(setq inhibit-startup-message t)

;; Fetch util functions
(add-to-list 'load-path "~/.emacs.d/helper/")
(require 'util-functions)

;; Initial package setup
(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/") package-archives)
(push '("melpa" . "http://melpa.org/packages/") package-archive)
(package-initialize)

;; Setup use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Load packages dir
(load-directory "~/.emacs.d/packages")

;; List of packages
; (defvar my-packages '(evil neotree fiplr evil-leader multi-term) "Default Packages")

; (dolist (pkg my-packages)
;   (use-package pkg
;                :ensure t))

;; Move all backup files to separate directory
(setq backup-directory-alist `(("." . "~/.emacs.d/emacs-backups")))

;; TODO: Move to separate file
; (require 'neotree)
; (setq neo-smart-open t)
; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
; (setq fiplr-ignored-globs '((directories (".git" ".svn"))
; 			    (files ("*.jpg" "*.png" "*.zip" "*~" "*." "*.acn" "*.aux" "*.bbl" "*.blg" "*.dvi" "*.fdb_latexmk" "*.fls" "*.glg" "*.glo" "*.gls" "*.ist" "*.lof" "*.log" "*.lot" "*.pdf" "*.run.xml" "*.toc"))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil-leader evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
