(package-initialize)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(setq-default cursor-type 'bar)
(setq inhibit-splash-screen 1)
;; font size 16pt
(set-face-attribute 'default nil :height 160)
;; full screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; open the config file
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

(setq package-check-signature nil)
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			   ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))

;; Common Lisp Extension
(require 'cl)

(defvar my/packages '(
		      ;; auto completion
		      company
		      ;; better editor
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      ;; major mode
		      js2-mode
		      ;; Minor Mode
		      nodejs-repl
		      exec-path-from-shell
		      ;; Themes
		      monokai-theme
		      ;; solarized-theme
		      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(global-hl-line-mode 1)

(load-theme 'monokai 1)

;; enable company plugin
(global-company-mode 1)


(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(delete-selection-mode 1)
