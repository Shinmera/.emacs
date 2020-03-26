(when (featurep 'shinmera-package)
  (ensure-installed 'smtpmail))

(require 'smtpmail)
(setq user-full-name "Nicolas Hafner")
(setq smtpmail-local-domain "tymoon.eu")
(setq user-mail-address (concat "shinmera@" smtpmail-local-domain))
(setq send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server "smtp.tymoon.eu")
(setq smtpmail-stream-type 'starttls)
(setq smtpmail-smtp-service 587)

(provide 'shinmera-mail)
