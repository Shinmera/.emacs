(require 'shinmera-straight)

(use-package js2-mode
  :commands (js2-mode js2-minor-mode)
  :mode ("\\.js\\'" . js2-mode)
  :hook
  (js-mode . js2-minor-mode)
  (js2-mode . (lambda () (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
  :bind (:map js-mode-map ("M-." . nil))
  :config (font-lock-add-keywords 'js2-mode '(("self" . font-lock-constant-face))))

(use-package xref-js2
  :demand t
  :after (js2-mode))

(provide 'shinmera-js)
