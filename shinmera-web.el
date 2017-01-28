(provide 'shinmera-web)
(require 'shinmera-package)

(when (featurep 'shinmera-package)
  (ensure-installed 'rainbow-mode 'web-mode))

;;;;;;
;; Configure web-mode and other things.
(autoload 'rainbow-mode "rainbow-mode" "Rainbow colors" t)

(add-hook 'css-mode-hook              #'rainbow-mode)

(add-to-list 'magic-mode-alist        '("<!DOCTYPE html" . web-mode))
(add-to-list 'auto-mode-alist         '("\\.htm\\'" . web-mode))
(add-to-list 'auto-mode-alist         '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist         '("\\.xhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist         '("\\.ctml\\'" . web-mode))

(defun my-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-style-padding 2)
  (setq web-mode-script-padding 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)

;;;;;;
;; LASS support
(add-to-list 'load-path "~/Projects/cl/LASS/")
(add-to-list 'auto-mode-alist '("\\.lass\\'" . lass-mode))
(autoload 'lass-mode "lass" "Lass Support" t)
