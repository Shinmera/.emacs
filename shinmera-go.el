(require 'shinmera-package)

(when (featurep 'shinmera-package)
  (ensure-installed 'go-mode 'company-go))

(when (featurep 'shinmera-company)
  (add-hook 'go-mode-hook (lambda ()
                            (set (make-local-variable 'company-backends) '(company-go))
                            (company-mode))))

(provide 'shinmera-go)
