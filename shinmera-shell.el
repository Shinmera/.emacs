(require 'shinmera-package)

(when (featurep 'shinmera-package)
  (ensure-installed 'xterm-color))

(setenv "TERM" "xterm-256color")

(setq comint-output-filter-functions
      (remove 'ansi-color-process-output comint-output-filter-functions))

(add-hook 'shell-mode-hook
          (lambda () (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter nil t)))

(require 'eshell)

(add-hook 'eshell-before-prompt-hook
          (lambda ()
            (setq xterm-color-preserve-properties t)))

(provide 'shinmera-shell)
