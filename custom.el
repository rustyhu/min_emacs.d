;;;;; my custom config

;(set-face-attribute 'default nil :height 120)

; Overriding for MS Windows GUI
(prefer-coding-system 'utf-8)

(set-frame-font "Consolas 12" nil t)

(setq explicit-shell-file-name "pwsh.exe")
(setq explicit-bash.exe-args '("-nologo"))

; For go-mode
(add-hook 'go-mode-hook 'lsp-deferred)
