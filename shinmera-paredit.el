(require 'shinmera-straight)

(use-package paredit
  :defer 1
  :commands (enable-paredit-mode paredit-mode)
  :bind (:map paredit-mode-map
              ("C-M-p" . nil)
              ("C-M-n" . nil)
              ("M-g" . raise-sexp)
              ("M-s" . paredit-splice-sexp-killing-backward)
              ("M-S" . paredit-splice-sexp-killing-forward))
  :hook
  (emacs-lisp-mode . enable-paredit-mode)
  (lisp-mode . enable-paredit-mode)
  (lisp-interaction-mode . enable-paredit-mode)
  (scheme-mode . enable-paredit-mode)
  (slime-repl-mode . enable-paredit-mode)
  :config
  (put 'paredit-forward-delete 'delete-selection 'supersede)
  (put 'paredit-backward-delete 'delete-selection 'supersede)
  (put 'paredit-newline 'delete-selection t))

(provide 'shinmera-paredit)
