
(provide 'init-erlang)

(require 'erlang-start)

(eval-after-load 'erlang
  '(progn
     (defvar erlang-root-dir nil)

     (if (or (equal erlang-root-dir "")
             (equal (executable-find "erl") "")
             (equal (shell-command-to-string "which erl") ""))
         (error "Could not find erlang, set the variable `erlang-root-dir'"))

     (setq exec-path (cons (expand-file-name "bin/" erlang-root-dir)
                           exec-path)
           edts-man-root (expand-file-name "man" erlang-root-dir)
           erlang-indent-level 2)

     ;; Add Erlangs Emacs directory to the load-path
     (add-to-list 'load-path (file-expand-wildcards
                              (concat erlang-root-dir
                                      "lib/tools-*/emacs")))

     ;; EDTS-mode
     ;; Very powerful development toolkit for Erlang, a must have.
     ;; But does not work for Windows at the moment.
     ;; Check: https://github.com/tjarvstrand/edts

     (cond  ((string-equal system-type "windows-nt") ;; if windows
             (message "EDTS currently not supported in Windows."))

            ((not nil) ;; otherwise
             (install-package 'auto-highlight-symbol)
             (install-package 'edts)

             (require 'edts-start)))

     ;; Quviq QuickCheck
     ;; Automated testing using properties.
     ;; Check http://www.quviq.com
     ;; Commercial, this is why we don't auto-install it.
     ;; Just load it if its there.

     (defvar eqc-root-dir (expand-file-name "lib/eqc-1.30.0"
                                            erlang-root-dir)
       "Where EQC is installed.")
     (defvar eqc-load-path (expand-file-name "lib/eqc-1.30.0/emacs/"
                                             erlang-root-dir)
       "EQC's load path.")

     (when (file-exists-p eqc-root-dir)
       (add-to-list 'load-path eqc-load-path)
       (autoload 'eqc-erlang-mode-hook "eqc-ext" "EQC Mode" t)
       (add-hook 'erlang-mode-hook 'eqc-erlang-mode-hook)
       (setq eqc-max-menu-length 30))))
