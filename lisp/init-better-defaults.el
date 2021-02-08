(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; (global-linum-mode 1)
(setq inhibit-splash-screen 1)
;; font size 16pt
(set-face-attribute 'default nil :height 160)
;; full screen
;; (setq initial-frame-alist (quote ((fullscreen . maximized))))
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; open the config file
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

(global-hl-line-mode 1)
(delete-selection-mode 1)

(defalias 'yes-or-on-p 'y-or-n-p)

(use-package emacs
  :config
  (setq display-line-numbers-type 'relative))

(provide 'init-better-defaults)
