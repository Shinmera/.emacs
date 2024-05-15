(setq debug-on-error t)

(require 'shinmera-faststart)
(require 'shinmera-straight)
(require 'shinmera-modules)

(define-hook after-init-hook ()
  (setq debug-on-error nil))
(provide 'shinmera)
