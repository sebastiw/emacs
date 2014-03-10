;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar elpa-required-packages '(
				 json-mode
				 js2-mode
				 ac-js2
				 coffee-mode
				 js-comint
				 rainbow-delimiters
                                 )
  "Packages which need to be installed")

(defvar emacs-dir (concat (getenv "HOME") "/.emacs.d")
  "The emacs directory.")
(defvar elpa-dir "elpa"
  "Which directory elpa packages should be installed in.")

(require 'package)
(setq package-archives '(("gnu"       . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa"     . "http://melpa.milkbox.net/packages/")))

(unless (file-exists-p  (concat emacs-dir "/" elpa-dir))
  (message "The directory %s does not exist, creating it." elpa-dir)
  (package-refresh-contents))

(package-initialize)

(message "Checking if required packages is installed...")
(dolist (pkg elpa-required-packages)
  (unless (package-installed-p pkg)
    (message "Packet %s was not installed, installing..." pkg)
    (package-install pkg)))


(defun install-package (pkg)
  "If package PKG is not installed, install it."
  (unless (package-installed-p pkg)
    (progn
      (unless (assoc pkg package-archive-contents)
	(package-refresh-contents))
      (package-install pkg))))

(provide 'init-packages)