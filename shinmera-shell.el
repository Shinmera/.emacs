(require 'shinmera-straight)

(use-package xterm-color
  :config (setenv "TERM" "xterm-256color"))

(use-package eshell
  :bind (:map eshell-mode-map ("C-c M-o" . eshell-clear-output))
  :config
  (define-hook eshell-before-prompt-hook ()
    (setq xterm-color-preserve-properties t)))

(setq comint-output-filter-functions
      (remove 'ansi-color-process-output comint-output-filter-functions))

(define-hook shell-mode-hook ()
  (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter nil t))

(defun eshell-clear-output ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

(provide 'shinmera-shell)
