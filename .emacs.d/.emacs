; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(cond
 ((eq window-system nil)
  ;; cygwin 
  (load "~/dotfiles/.emacs.d/cygwin.el"))
 (t
  ;; ntemacs
  (load "~/.emacs.d/init.el"))
)

