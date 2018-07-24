(require 'shinmera-package)

(when (featurep 'shinmera-package)
  (ensure-installed 'js2-mode 'xref-js2 'js2-refactor))

(require 'js2-mode)
(require 'xref-js2)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(define-key js-mode-map (kbd "M-.") nil)
(font-lock-add-keywords 'js-mode '(("self" . font-lock-constant-face)))
(font-lock-add-keywords 'js2-mode '(("self" . font-lock-constant-face)))

(add-hook 'js2-mode-hook (lambda ()
                           (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

(when (featurep 'shinmera-company)
  (when (featurep 'shinmera-package)
    (ensure-installed 'company-tern))
  (add-to-list 'company-backends 'company-tern)
  (add-hook 'js2-mode-hook (lambda () (tern-mode) (company-mode)))

  (define-key tern-mode-keymap (kbd "M-.") nil)
  (define-key tern-mode-keymap (kbd "M-,") nil))

(provide 'shinmera-js)
