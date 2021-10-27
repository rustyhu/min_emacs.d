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
;; ELPA mirror of Emacs-China
(setq package-archives '(; Emacs China
                         ("GNU ELPA" . "https://elpa.emacs-china.org/gnu/")
                         ("MELPA Stable" . "https://elpa.emacs-china.org/stable-melpa/")
                         ("org" . "https://elpa.emacs-china.org/org/")
                         ;("MELPA" . "https://elpa.emacs-china.org/melpa/")

                         ; USTC
                         ;("GNU ELPA" . "https://mirrors.ustc.edu.cn/elpa/gnu/")
                         ;("MELPA Stable" . "https://mirrors.ustc.edu.cn/elpa/melpa-stable/")
                         ;("org" . "https://mirrors.ustc.edu.cn/elpa/org/")
                        ))
(package-initialize)

;; if need, refresh package pool cache 
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(; key binding tool
                      smex
                      evil
                      ; themes
                      monokai-theme
                      doom-themes
                      ; programming
                      auto-complete
                      yasnippet
                      racket-mode
                      go-mode
                      lsp-mode
                      ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;;;; Settings of packages
;(load-theme 'monokai t)
(load-theme 'doom-opera t)
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
