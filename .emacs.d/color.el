; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(setq load-path (append
		 '( "~/dotfiles/.emacs.d/color-theme" )
		 load-path))

;;----------------------------------------------------------
;; @ color theme
;;----------------------------------------------------------
(require 'color-theme)
(color-theme-initialize)
(color-theme-gray30)


;;----------------------------------------------------------
;; @ diff mode 
(add-hook 'diff-mode-hook
          (lambda ()
	    ;; 通常行
	    (set-face-attribute 'diff-context nil
				:background nil
				:foreground "color-245")
	    ;; 追加行
	    (set-face-attribute 'diff-added nil
				:background nil
				:foreground "brightgreen"
				:weight 'normal )
	    ;; 削除行
	    (set-face-attribute 'diff-removed nil
				:background nil
				:foreground "brightred"
				:weight 'normal )
	    ;; ヘッダー行
	    (set-face-attribute 'diff-header nil
				:background "white"
				:foreground "color-18"
				:weight 'extra-bold 
				:inherit nil)
	    (set-face-attribute 'diff-file-header nil
	    			:background "white"
	    			:foreground "color-18"
	    			:weight 'extra-bold 
	    			:underline t
	    			:inherit nil)
	    ;; (set-face-attribute 'diff-hunk-header nil
	    ;; 			:background "brightblack"
	    ;; 			:foreground "yellow"
	    ;; 			:weight 'extra-bold 
	    ;; 			:underline t
	    ;; 			:inherit nil)
	    ;; (set-face-attribute 'diff-index nil
	    ;; 			:background "brightblack"
	    ;; 			:foreground "blue"
	    ;; 			:weight 'extra-bold 
	    ;; 			:underline t
	    ;; 			:inherit nil)
	    ;; 文字単位の変更箇所を強調表示する
	    (set-face-attribute 'diff-refine-change nil
;;				:foreground nil
				:background "black"
				:underline t
				:weight 'bold)
	    ))
;; diff-mode になった際に、文字単位の強調表示を行う
(defun diff-mode-refine-automatically ()
  (diff-auto-refine-mode t))
(add-hook 'diff-mode-hook 'diff-mode-refine-automatically)


;;----------------------------------------------------------
