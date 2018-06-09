;;------------------ CUSTOMAZATION ------------------;;

;;;;; Basics
;; turn off backup file
(setq make-backup-files nil)

;;;;; GUI
;; frame position
(set-frame-position (selected-frame) 0 20)
;; height and width
(set-frame-width (selected-frame) 82)
(set-frame-height (selected-frame) 35)
;; bars off
(tool-bar-mode -1) 
(menu-bar-mode -1)
;; turn off welcome buffer
(setq inhibit-startup-message t)

;;;;; Text Format
;; mode line: line & column number
(column-number-mode t)
(line-number-mode t)
;; line numbering
(global-linum-mode t)
;; word wrap
(global-visual-line-mode t)
;; parentheses matching
(show-paren-mode t)
;; TAB - using 4 spaces
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

;;;;; Package Management
(require 'package)

;; offical archive, reserved
;(add-to-list 'package-archives
;             '("melpa-stable" . "http://stable.melpa.org/packages/")
;             '("marmalade" . "https://marmalade-repo.org/packages/"))
;; ELPA mirror of Emacs-China
(setq package-archives '(("gnu"   . "http://elpa.zilongshanren.com/gnu/")
                         ("melpa-stable" . "http://elpa.zilongshanren.com/melpa-stable/")
;;                         ("melpa" . "http://elpa.zilongshanren.com/melpa/")
                         ("Marmalade" . " 	http://elpa.zilongshanren.com/marmalade/")))
(package-initialize)

;; if need, refresh package pool cache 
(when (not package-archive-contents)
  (package-refresh-contents))
;;----- My Package List
(defvar my-default-packages '(yasnippet
	                          auto-complete
                              evil
                              monokai-theme
                              smex))
(dolist (p my-default-packages)
  (when (not (package-installed-p p))
    (package-install p)))
;; Specific settings of packages
;;----- monokai theme
(load-theme 'monokai t)
;;----- auto-complete
(require 'auto-complete-config)
(ac-config-default)
;;----- ido
(require 'ido) 
(ido-mode t)
;;----- smex
(require 'smex) 
(smex-initialize)
(global-set-key (kbd "M-x") 'smex) ; make smex triggered by M-x 
;; MODE OFF by default when start
;;----- Evil
;(evil-mode 1)
;;----- yasnippet

;;------------------ END_CUSTOM ------------------;;
