(install-package 'elisp-slime-nav)
(require 'elisp-slime-nav)

(install-package 'rainbow-delimiters)
(require 'rainbow-delimiters)

(add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

(provide 'init-elisp)
