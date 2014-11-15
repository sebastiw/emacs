
(provide 'init-latex)

(use-package LaTeX
  :ensure writegood-mode auctex auctex-latexmk ispell smartparens-latex ac-ispell ac-math
  :bind (("C-c i" . insert-latex)
         ("C-c C-c" . TeX-comment-or-uncomment-region)
         ("C-c C-k" . TeX-command-master))
  :mode "\\.(la)?tex\\'"
  :config
  (progn
    (visual-line-mode t)
    (flyspell-mode t)
    (auto-fill-mode t)
    (use-package auto-complete
      :config (progn
                (ac-flyspell-workaround)
                (setq ac-auto-show-menu 0.01
                      ac-auto-start 1
                      ac-delay 0.01)))
      
    (abbrev-mode +1)
    (smartparens-mode +1)
    (use-package writegood-mode)
    (auctex-latexmk-setup)
    (LaTeX-math-mode)

    (make-local-variable 'ispell-parser)
    (setq ispell-parser 'tex)

    (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\)" 1 font-lock-warning-face t)))

    (setq-default TeX-master nil)

    (setq LaTeX-command "latex"
          TeX-parse-self t
          TeX-auto-save t
          TeX-PDF-mode t
          TeX-source-correlate-method 'synctex
          TeX-source-correlate-mode t
          TeX-source-correlate-start-server t
          TeX-clean-confirm nil
          TeX-view-predicate-list '((output-pdf (string-match "pdf" (TeX-output-extension))))
          TeX-view-program-list
          '(("Default"
             (lambda () (interactive) (progn (TeX-clean) (find-file-other-window "%o")))))
          ;;           (lambda () (interactive) (view-doc-in-emacs "%o" (ido-get-work-directory)))))
          ;; ("Okular" ("okular --unique %o#src:%n%b"))
          TeX-view-program-selection '((output-pdf "Default")))
    )

  ;; (eval-after-load 'LaTeX-mode
  ;;   '(progn
  ;; (install-package 'writegood-mode)
  ;; (install-package 'auctex)
  ;; (install-package 'auctex-latexmk)
  ;; (install-package 'ispell)
  ;; (install-package 'smartparens-latex)
  ;; (install-package 'ac-ispell)
  ;; (install-package 'ac-math)

  ;; (require 'latex)
  ;; (require 'auctex-latexmk)
  ;; (require 'ispell)
  ;; (require 'auto-complete)
  ;; (require 'smartparens-latex)

  ;; ))
  )
