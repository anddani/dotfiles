(defvar emacs-dir "~/.emacs.d/"
  "Emacs config directory")

(defvar elpa-dir (concat emacs-dir "elpa/")
  "Package directory")

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/")))

(unless (file-exists-p elpa-dir)
  (package-refresh-contents))

;; (package-initialize)

;; List of packages
(defvar my-packages '(evil neotree fiplr evil-leader multi-term) "Default Packages")

(dolist (pkg my-packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)))

;; Move all backup files to separate directory
(setq backup-directory-alist `(("." . "~/.emacs.d/emacs-backups")))

;; LaTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-PDF-mode t)
(setq TeX-save-query nil)


;; Vim key bindings
(setq evil-want-C-u-scroll t) ; Allow C-u to move up half a screen

(require 'evil)
(evil-mode 1)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(add-to-list 'load-path "/some/path/neotree")
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

; (global-set-key (kbd "SPC") 'recenter-top-bottom)
; (evil-define-key 'normal (kbd "SPC") 'recenter-top-bottom)

(require 'neotree)
(setq neo-smart-open t)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "e" 'neotree-toggle
  "t" 'fiplr-find-file)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq fiplr-ignored-globs '((directories (".git" ".svn"))
			    (files ("*.jpg" "*.png" "*.zip" "*~" "*." "*.acn" "*.aux" "*.bbl" "*.blg" "*.dvi" "*.fdb_latexmk" "*.fls" "*.glg" "*.glo" "*.gls" "*.ist" "*.lof" "*.log" "*.lot" "*.pdf" "*.run.xml" "*.toc"))))
; (require 'multi-term)
; (setq multi-term-program "/usr/bin/zsh")


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
