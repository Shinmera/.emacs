(when (featurep 'shinmera-package)
  (ensure-installed 'window-purpose))

(require 'window-purpose)
(require 'window-purpose-x)

(purpose-mode)
(purpose-x-kill-setup)
(purpose-x-magit-single-on)

(add-to-list 'purpose-user-mode-purposes '(lisp-mode . lisp))
(add-to-list 'purpose-user-mode-purposes '(slime-repl-mode . lisp-repl))
(add-to-list 'purpose-user-name-purposes '("*inferior-lisp*" . lisp-repl))
(purpose-compile-user-configuration)

(provide 'shinmera-purpose)
