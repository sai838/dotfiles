; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(setq load-path (append
		 '( "~/dotfiles/.emacs.d/auto-complete")
		 load-path))

;;----------------------------------------------------------
;; @ compleate
;;----------------------------------------------------------


;;----------------------------------------------------------
;; M-x ミニバッファ補完
(require 'mcomplete)
(turn-on-mcomplete-mode)


;;----------------------------------------------------------
;; ibuffer
(global-set-key [?\C-,] 'bs-cycle-next)
(global-set-key [?\C-.] 'bs-cycle-previous)
(global-set-key "\C-x\C-b" 'bs-show)
(require 'ibuffer)


;;----------------------------------------------------------
;; iswitchb
(iswitchb-mode 1)

(add-hook 'iswitchb-define-mode-map-hook
          'iswitchb-my-keys)

(defun iswitchb-my-keys ()
  "Add my keybindings for iswitchb."
  (define-key iswitchb-mode-map [right] 'iswitchb-next-match)
  (define-key iswitchb-mode-map [left] 'iswitchb-prev-match)
  (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
  (define-key iswitchb-mode-map " " 'iswitchb-next-match)
  (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)
  )


;;----------------------------------------------------------
;; auto compleat
(setq ac-dir "auto-complete/")
(add-to-list 'load-path ac-dir)
(require 'auto-complete-config)
(ac-config-default)
;; 辞書のディレクトリ
(add-to-list 'ac-dictionary-directories (concat ac-dir "ac-dict/"))

;; 処理が止まるので、通常時はファイル名を情報源から外す。
;; 代わりに、カレントディレクトリノファイル名追加
(defun ac-common-setup ()
  (setq ac-sources 
	'(
	  ;; ac-source-filename
	  ac-source-features
	  ac-source-functions
	  ac-source-yasnippet
	  ac-source-variables
	  ac-source-symbols
	  ac-source-abbrev
	  ac-source-dictionary
	  ac-source-words-in-same-mode-buffers
	)))
(add-hook 'c-mode-common-hook
	  '(lambda()
	     (add-to-list
	      'ac-sources
	      'ac-source-gtags
)))

;; 入力し始めてから0.8秒後にリストを表示する
(setq ac-auto-show-menu 0.8)

;; auto compleatの開始
(global-set-key "\M-/" 'ac-start)
;; auto compleatの停止
(define-key ac-completing-map "\M-/" 'ac-stop)
;; C-n/C-p で候補を選択
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

;;----------------------------------------------------------

