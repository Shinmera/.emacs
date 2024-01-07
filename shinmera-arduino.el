(require 'shinmera-package)

(when (featurep 'shinmera-package)
  (ensure-installed 'arduino-mode 'arduino-cli-mode 'company-arduino))

(require 'flycheck-arduino)

;; Configuration for company-c-headers.el
;; The `company-arduino-append-include-dirs' function appends
;; Arduino's include directories to the default directories
;; if `default-directory' is inside `company-arduino-home'. Otherwise just
;; returns the default directories.
;; Please change the default include directories accordingly.
(defun my-company-c-headers-get-system-path ()
  "Return the system include path for the current buffer."
  (let ((default '("/usr/include/" "/usr/local/include/")))
    (company-arduino-append-include-dirs default t)))

(setq company-c-headers-path-system 'my-company-c-headers-get-system-path)

(when (featurep 'shinmera-company)
  (add-hook 'irony-mode-hook 'company-arduino-turn-on))

(add-hook 'arduino-mode-hook #'flycheck-arduino-setup)
(add-hook 'arduino-mode-hook 'irony-mode)
(provide 'shinmera-arduino)
