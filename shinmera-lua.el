(require 'shinmera-straight)

(use-package lua-mode
  :commands (lua-mode)
  :mode
  ("\\.lua\\'" . lua-mode))

(use-package company-lua
  :demand t
  :after (company lua-mode)
  :config
  (define-hook lua-mode-hook ()
    (setq-local company-backends '((company-lua
                                    company-etags
                                    company-dabbrev-code)))))

(provide 'shinmera-lua)
