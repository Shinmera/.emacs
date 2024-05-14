(require 'shinmera-straight)

(use-package arduino-mode
  :commands (arduino-mode)
  :hook (arduino-mode . irony-mode)
  :mode ("\\.ino\\'" . arduino-mode)

(use-package arduino-cli-mode
  :demand t
  :after (arduino-mode))

(use-package company-arduino
  :demand t
  :after (company arduino-mode)
  :hook (irony-mode . company-arduino-turn-on))

(use-package flycheck-arduino
  :demand t
  :after (flycheck arduino-mode)
  :hook (arduino-mode . flycheck-arduino-setup))

(provide 'shinmera-arduino)
