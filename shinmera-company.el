(provide 'shinmera-company)

(when (featurep 'shinmera-package)
  (ensure-installed 'company 'company-quickhelp))

(require 'company)
(company-quickhelp-mode 1)

(add-hook 'after-init-hook 'global-company-mode)

(setq company-quickhelp-delay 0.7)

(define-key company-active-map (kbd "<up>") 'company-select-previous)
(define-key company-active-map (kbd "<down>") 'company-select-next)
