;; -*- mode: elisp; lexical-binding: t; -*-
(require 'shinmera-package)

(when (featurep 'shinmera-package)
  (ensure-installed 'erlang 'popup 'flycheck 'flycheck-tip))
(push "~/.emacs.d/distel/elisp/" load-path)

(require 'erlang)
(require 'flycheck)
(require 'flycheck-tip)
(require 'distel)
(distel-setup)

(flycheck-define-checker erlang-otp
  "An Erlang syntax checker using the Erlang interpreter."
  :command ("erlc" "-o" temporary-directory "-Wall"
                   "-I" "../include" "-I" "../../include"
                   "-I" "../../../include" source)
  :modes (erlang-mode)
  :error-patterns
  ((warning line-start (file-name) ":" line ": Warning:" (message) line-end)
   (error line-start (file-name) ":" line ": " (message) line-end)))

(add-hook 'erlang-mode-hook
          (lambda ()
            (flycheck-select-checker 'erlang-otp)
            (flycheck-mode)))

;; prevent annoying hang-on-compile
(defvar inferior-erlang-prompt-timeout t)
;; default node name to emacs@localhost
(setq inferior-erlang-machine-options '("-sname" "emacs"))
;; tell distel to default to that node
(setq erl-nodename-cache
      (make-symbol
       (concat
        "emacs@"
        ;; Mac OS X uses "name.local" instead of "name", this should work
        ;; pretty much anywhere without having to muck with NetInfo
        ;; ... but I only tested it on Mac OS X.
        (car (split-string (shell-command-to-string "hostname"))))))

(when (featurep 'shinmera-company)
  (when (featurep 'shinmera-package)
    (ensure-installed 'company-distel))
  (require 'company-distel)
  (add-hook 'erlang-mode-hook (lambda () (add-to-list 'company-backends 'company-distel))))

(provide 'shinmera-erlang)
