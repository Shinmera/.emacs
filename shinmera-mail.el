(require 'shinmera-straight)

(use-package smtpmail
  :demand t
  :custom
  (user-full-name "Yukari Hafner")
  (smtpmail-local-domain "tymoon.eu")
  (user-mail-address "shinmera@tymoon.eu")
  (send-mail-function 'smtpmail-send-it)
  (smtpmail-smtp-server "smtp.tymoon.eu")
  (smtpmail-stream-type 'starttls)
  (smtpmail-smtp-service 587))

(provide 'shinmera-mail)
