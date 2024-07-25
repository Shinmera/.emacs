;; -*- mode: elisp; lexical-binding: t; -*-
(require 'shinmera-straight)

(use-package elisp-mode
  :straight (:type built-in)
  :custom
  (lisp-loop-indent-subclauses nil)
  (lisp-loop-indent-forms-like-keywords t)
  (lisp-lambda-list-keyword-parameter-alignment t))

(use-package elisp-slime-nav
  :commands (elisp-slime-nav-mode)
  :hook (emacs-lisp-mode . elisp-slime-nav-mode))

(use-package macrostep
  :commands (macrostep-mode macrostep-expand))

(use-package hyperspec
  :commands (hyperspec-lookup))

(use-package slime
  :commands (slime slime-connect common-lisp-mode)
  :bind
  (:map slime-mode-map
        ("C-c s" . slime-selector))
  (:map slime-xref-mode-map
        ("n" . nil) ([remap next-line] . nil)
        ("p" . nil) ([remap previous-line] . nil))
  (:map slime-inspector-mode-map
        ("," . slime-inspector-pop))
  (:map slime-repl-mode-map
        ("" . nil)
        ("C-M-p" . slime-repl-backward-input)
        ("C-M-n" . slime-repl-forward-input)
        ("RET" . slime-repl-return-at-end)
        ("<return>" . slime-repl-return-at-end))
  :mode
  ("\\.sexp\\'" . common-lisp-mode)
  ("\\.lisp\\'" . common-lisp-mode)
  ("\\.asd\\'" . common-lisp-mode)
  :custom
  (slime-contribs '(slime-asdf slime-autodoc
                    slime-cl-indent slime-compiler-notes-tree
                    slime-fontifying-fu slime-fuzzy
                    slime-hyperdoc slime-indentation
                    slime-macrostep slime-mdot-fu
                    slime-quicklisp slime-references
                    slime-repl slime-sprof slime-trace-dialog
                    slime-tramp slime-xref-browser))
  (slime-completion-at-point-functions '(slime-filename-completion slime-fuzzy-complete-symbol))
  (slime-net-coding-system 'utf-8-unix)
  (slime-startup-animation nil)
  (slime-auto-select-connection 'always)
  (slime-kill-without-query-p t)
  (slime-description-autofocus t )
  (slime-fuzzy-explanation "")
  (slime-asdf-collect-notes t)
  (slime-inhibit-pipelining nil)
  (slime-load-failed-fasl 'always)
  (slime-when-complete-filename-expand t)
  (slime-export-symbol-representation-auto t)
  (initial-major-mode 'common-lisp-mode)
  (initial-scratch-message ";; Scratch Common Lisp
")
  :config
  (defun slime-repl-return-at-end ()
    (interactive)
    (if (<= (point-max) (point))
        (slime-repl-return)
      (slime-repl-newline-and-indent)))
  (slime-setup))

(defmacro define-lisp-implementations (&rest decl)
  `(progn
     ,@(cl-loop for (symbol . args) in decl
                collect `(progn
                           (defun ,symbol ()
                             (interactive)
                             (slime ',symbol))
                           (cl-pushnew '(,symbol ,@args) slime-lisp-implementations
                                       :key 'car)))))

(with-eval-after-load "slime"
  (when (or (eq system-type 'gnu/linux)
            (eq system-type 'darwin))
    (define-lisp-implementations
        (abcl  ("abcl"))
        (acl   ("alisp"))
      (ccl   ("ccl"))
      (clasp ("clasp"))
      (clisp ("clisp"))
      (cmucl ("cmucl" "-quiet"))
      (ecl   ("ecl"))
      (mkcl  ("mkcl"))
      (xcl   ("xcl"))
      (sbcl-win  ("sbcl-win" "--dynamic-space-size" "8192"))
      (sbcl  ("sbcl" "--dynamic-space-size" "8192"))))
  
  (when (eq system-type 'windows-nt)
    (define-lisp-implementations
        (ccl   ("wx86cl64.exe"))
        (ccl32 ("wx86cl.exe"))
      (clisp ("clisp.exe"))
      (sbcl  ("sbcl.exe" "--dynamic-space-size" "8192")))))

(use-package slime-company
  :demand t
  :after (slime company)
  :hook
  ((slime-mode slime-repl-mode sldb-mode) . slime-company-maybe-enable)
  :custom
  (slime-company-completion 'fuzzy))

(when window-system
  (run-with-timer 1 0 'slime))

(provide 'shinmera-lisp)
