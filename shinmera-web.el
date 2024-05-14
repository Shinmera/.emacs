(require 'shinmera-straight)

(use-package web-mode
  :commands (web-mode)
  :mode
  ("\\.htm\\'" . web-mode)
  ("\\.html\\'" . web-mode)
  ("\\.xhtml\\'" . web-mode)
  ("\\.ctml\\'" . web-mode)
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 4)
  (web-mode-code-indent-offset 4)
  (web-mode-style-padding 2)
  (web-mode-script-padding 2))

(use-package rainbow-mode
  :commands (rainbow-mode)
  :hook (css-mode . rainbow-mode))

(use-package lass
  :commands (lass-mode)
  :straight (:type git :repo "https://github.com/shinmera/LASS")
  :mode ("\\.lass\\'" . lass-mode))

(provide 'shinmera-web)
