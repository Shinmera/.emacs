(require 'shinmera-straight)

(use-package jdee
  :commands (jdee-mode)
  :mode ("\\.java\\'" . jdee-mode))

(provide 'shinmera-java)
