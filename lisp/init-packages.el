(setq package-check-signature nil)
(when (>= emacs-major-version 24)
  (package-initialize)
  (setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			   ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			   ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/"))))

(require 'package)
(unless (bound-and-true-p package--initialized)
  (package-initialize))
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-always-demand nil
      use-package-expand-minimally t
      use-package-verbose t)

(require 'use-package)

(use-package benchmark-init
 :init(benchmark-init/activate)
 :hook(after-init . benchmark-init/deactivate))

(provide 'init-packages)
