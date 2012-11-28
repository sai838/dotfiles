; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-


;; ------------------------------------------------------------------------
;; @ keybind
;; ------------------------------------------------------------------------
(define-key global-map (kbd "C-h") 'delete-backward-char) ; 削除
(define-key global-map (kbd "M-?") 'help-for-help)        ; ヘルプ
(define-key global-map (kbd "C-_") 'undo)                 ; undo
(define-key global-map (kbd "C-c i") 'indent-region)      ; インデント
(define-key global-map (kbd "C-c C-i") 'hippie-expand)    ; 補完
(define-key global-map (kbd "C-c C-c") 'comment-region)       ; コメントアウト
(define-key global-map (kbd "M-g C-g") 'grep)               ; grep
(define-key global-map (kbd "M-g M-g") 'goto-line)      ; 指定行へ移動
(define-key global-map (kbd "C-t") 'other-window)      ; 別のウィンドウへ移動


;; ------------------------------------------------------------------------
;; @ edit c-mode
;; ------------------------------------------------------------------------
;; C++ style
(add-hook 'c-mode-hook
          '(lambda()
             (c-set-style "bsd")))
;; Global-Tag-Jump
(add-hook 'c-mode-common-hook
	  '(lambda()
	     (gtags-mode 1)
	     (gtags-make-complete-list)
	     ))
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda()
	 (local-set-key "\M-." 'gtags-find-tag)
	 (local-set-key "\M-r" 'gtags-find-rtag)
	 (local-set-key "\M-s" 'gtags-find-symbol)
	 (local-set-key "\M-*" 'gtags-pop-stack)
))

;; default-compile command
(setq compile-command "make clean && make -k")
;;(add-to-list 'compile-history "make clean && make -k")
;;(add-to-list 'compile-history "gcc *.c")

;; ------------------------------------------------------------------------
;; @ session
;; ------------------------------------------------------------------------
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;; save at close file
(setq session-undo-check -1)


;; ------------------------------------------------------------------------
;; @ buffer move
;; ------------------------------------------------------------------------
(define-key global-map (kbd "<S-up>") 'windmove-up)      
(define-key global-map (kbd "<S-down>") 'windmove-down)  
(define-key global-map (kbd "<S-left>") 'windmove-left)  
(define-key global-map (kbd "<S-right>") 'windmove-right)

;; ------------------------------------------------------------------------
;; @ howm
;; ------------------------------------------------------------------------
(add-to-list 'load-path "~/dotfiles/.emacs.d/howm")
(setq howm-menu-lang 'ja)
(global-set-key "\C-cc" 'howm-menu)
(require 'howm)
(autoload 'howm-menu "howm-mode" "Hitori Otegaru Wiki Modoki" t)
(setq howm-directory "~/dotfiles/.emacs.d/howm-memo")
(set-face-foreground 'howm-mode-title-face "greenyellow")

;; ------------------------------------------------------------------------
;; @ install-elisp
;; ------------------------------------------------------------------------
(require 'install-elisp)
;; install directory 
(setq install-elisp-repository-directory "~/dotfiles/.emacs.d/")

;; ------------------------------------------------------------------------
;; @ auto-install
;; ------------------------------------------------------------------------
;; (require 'auto-install)
;; (setq auto-install-directory "~/dotfiles/.emacs.d/elisp")
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-compatibility-setup)

;; ------------------------------------------------------------------------
;; @ anything
;; ------------------------------------------------------------------------
(require 'anything)
(require 'anything-config)
(require 'anything-match-plugin)
(setq anything-sources
'(anything-c-source-buffers+
  anything-c-source-file-name-history
  anything-c-source-buffer-not-found
  anything-c-source-imenu
  anything-c-source-emacs-commands
))
(setq imenu-auto-rescan t)
(global-set-key (kbd "M-;") 'anything) 

;; ------------------------------------------------------------------------
;; @ window number
;; ------------------------------------------------------------------------
(require 'window-number)
(window-number-meta-mode)






