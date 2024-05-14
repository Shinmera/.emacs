(require 'shinmera-straight)

(use-package glsl-mode
  :commands (glsl-mode)
  :mode
  ("\\.glsl\\'" . glsl-mode))

(use-package company-glsl
  :demand t
  :after (company glsl-mode))

(use-package hlsl-mode
  :commands (hlsl-mode)
  :straight (:type git :repo "https://github.com/darfink/hlsl-mode")
  :mode
  ("\\.hlsl\\'" . hlsl-mode)
  ("\\.fx\\'" . hlsl-mode))

(provide 'shinmera-glsl)
