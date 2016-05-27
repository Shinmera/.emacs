(provide 'shinmera-autocomplete)

(when (featurep 'shinmera-package)
  (ensure-installed 'auto-complete))

(require 'auto-complete)

(setq ac-delay 0.1)

(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                           (auto-complete-mode 1))))
(real-global-auto-complete-mode t)
