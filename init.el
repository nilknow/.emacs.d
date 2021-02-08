(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))

(require 'init-startup)
(require 'init-better-defaults)
(require 'init-packages)
(require 'init-helper)
(require 'init-ui)

