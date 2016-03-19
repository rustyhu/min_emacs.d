;;------------------ CUSTOMAZATION ------------------;;

;; Some basics
;; set start frame position
(set-frame-position (selected-frame) 0 20)
;; set frame height and width
(set-frame-width (selected-frame) 80)
(set-frame-height (selected-frame) 40)
;; bars off
(tool-bar-mode -1) 
(menu-bar-mode -1)
;; turn off welcome buffer
(setq inhibit-startup-message t) 
;; mode line: line & column number
(column-number-mode t)
(line-number-mode t) 
;; word wrap
(global-visual-line-mode t) 
;; line numbering 
(global-linum-mode t) 
;; parentheses matching
(show-paren-mode t) 

;; Manage package repositories: +MELPA Stable +Marmalade
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") )
(add-to-list 'package-archives
			 '("marmalade" . "https://marmalade-repo.org/packages/") )
(package-initialize)

;;---------- My Package List
;; Automatically installation:
(when (not (package-installed-p 'auto-complete))
  (package-install 'auto-complete))
(when (not (package-installed-p 'evil))
  (package-install 'evil))
(when (not (package-installed-p 'monokai-theme))
  (package-install 'monokai-theme))
(when (not (package-installed-p 'smex))
  (package-install 'smex))
;; Specific settings of packages
;;----- monokai theme
(load-theme 'monokai t)
;;----- Auto-complete
(require 'auto-complete-config)
(ac-config-default)
;;----- ido
(require 'ido) 
(ido-mode t)
;;----- smex
(require 'smex) 
(smex-initialize)
(global-set-key (kbd "M-x") 'smex) ; make smex triggered by M-x 
;;----- Evil
;(require 'evil) ; this could be omit when package.el used
;(evil-mode 1)
;(evil-set-initial-state 'dired-mode 'emacs)

;;------------------ END_CUSTOM ------------------;;
