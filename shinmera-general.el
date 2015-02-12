(provide 'shinmera-general)

(when (featurep 'shinmera-package)
  (ensure-installed
   'multiple-cursors 'expand-region 'auto-complete
   'powerline 'sublime-themes 'markdown-mode 'dired+))

;;;;;;
;; Load global prerequisites
(require 'multiple-cursors)
(require 'expand-region)
(require 'auto-complete)
(require 'powerline)
(require 'server)

;;;;;;
;; Activate default modes
(ido-mode 1)
(show-paren-mode 1)
(electric-indent-mode 1)
(global-ede-mode 1)
(semantic-mode 1)
(delete-selection-mode 1)
(global-linum-mode 1)

;;;;;;
;; Configure generals
(powerline-default-theme)
(setq-default 
 indent-tabs-mode               nil)
(setq
 ac-delay                       0.1
 inhibit-startup-screen         t
 show-paren-delay               0
 ido-enable-flex-matching       t
 ido-everywhere                 t
 enable-local-variables         :safe
 linum-format                   "%d "
 browse-url-browser-function    'browse-url-generic
 browse-url-generic-program     (or (getenv "BROWSER") "xdg-open")
 ring-bell-function             'ignore
 ispell-dictionary               "british"
 backup-directory-alist          '((".*" . "~/.saves/"))
 vc-follow-symlinks              t)
(autoload 'dired "dired+" "Dired+" t)
(put 'upcase-region 'disabled nil)

;;;;;;
;; Windowed system extra settings
(when window-system
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (load-theme 'spolsky t)
  ;; (set-default-font "Triplicate T4c-10.15")
  )

;;;;;;
;; So that we may use emacsclient.
(unless (server-running-p)
  (server-start))

;;;;;;
;; AC global
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                           (auto-complete-mode 1))))
(real-global-auto-complete-mode t)
