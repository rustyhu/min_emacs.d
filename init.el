;;------------------ CUSTOMAZATION ------------------;;

;;;;; Basics
;; turn off backup file
(setq make-backup-files nil)
;; turn off welcome buffer
(setq inhibit-startup-message t)
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

;;;;; GUI
;; frame position
(set-frame-position (selected-frame) 0 20)
;; height and width
(set-frame-width (selected-frame) 90)
(set-frame-height (selected-frame) 45)
;; bars off
(tool-bar-mode -1) 
(menu-bar-mode -1)

;;;;; Package Management
(require 'package)
;; offical archive, reserved
;(add-to-list 'package-archives
;             '("melpa-stable" . "http://stable.melpa.org/packages/")
;; ELPA mirror of Emacs-China
(setq package-archives '(("gnu"   . "https://elpa.emacs-china.org/gnu/")
                         ("melpa-stable" . "https://elpa.emacs-china.org/melpa-stable/")
                         ("melpa" . "https://elpa.emacs-china.org/melpa/")))
(package-initialize)

;; if need, refresh package pool cache 
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(smex
                      evil
                      monokai-theme
                      ;doom-themes
                      racket-mode
                      auto-complete
                      yasnippet))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;;;; Settings of packages
(load-theme 'monokai t)
;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
;; smex
(require 'ido) 
(ido-mode t)
(require 'smex) 
(smex-initialize)
(global-set-key (kbd "M-x") 'smex) ; make smex triggered by M-x 
;; Evil
(evil-mode 1)

;;;;; `customize` interface
(setq custom-file (expand-file-name "auto-custom.el" user-emacs-directory))
(if (file-exists-p custom-file) (load custom-file t t))

;;;;; my custom config
(let ((private-custom (expand-file-name "custom.el" user-emacs-directory)))
    (if (file-exists-p private-custom) (load private-custom t nil)))

;;------------------ END_CUSTOM ------------------;;
