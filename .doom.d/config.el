;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-


(setq doom-theme 'doom-dracula)

(setq doom-font "Roboto Mono-14")

(setenv "TERM" "dumb")

(global-set-key (kbd "C-c g") #'magit-status)
