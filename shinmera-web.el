(provide 'shinmera-web)

(when (featurep 'shinmera-package)
  (ensure-installed 'rainbow-mode 'web-mode))

;;;;;;
;; Configure web-mode and other things.
(autoload 'rainbow-mode "rainbow-mode" "Rainbow colors" t)

(add-hook 'css-mode-hook              #'rainbow-mode)
(add-hook 'text-mode-hook             #'flyspell-mode)

(add-to-list 'magic-mode-alist        '("<!DOCTYPE html" . web-mode))
(add-to-list 'auto-mode-alist         '("\\.htm\\'" . web-mode))
(add-to-list 'auto-mode-alist         '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist         '("\\.xhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist         '("\\.ctml\\'" . web-mode))

;;;;;;
;; LASS support
(add-to-list 'load-path "~/Projects/CL/lquery-stack/LASS/")
(add-to-list 'auto-mode-alist '("\\.lass\\'" . lass-mode))
(autoload 'lass-mode "lass" "Lass Support" t)
