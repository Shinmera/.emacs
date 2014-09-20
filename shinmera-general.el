(provide 'shinmera-general)

;;;;;;
;; Load global prerequisites
(require 'multiple-cursors)
(require 'expand-region)
(require 'auto-complete)
(require 'uim)
(require 'powerline)

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
 inhibit-startup-screen         t
 show-paren-delay               0
 ido-enable-flex-matching       t
 ido-everywhere                 t
 enable-local-variables         :safe
 linum-format                   "%d "
 browse-url-browser-function    'browse-url-generic
 browse-url-generic-program     "chromium"
 ring-bell-function             'ignore
 ispell-dictionary               "british"
 backup-directory-alist          '((".*" . "~/.saves/"))
 vc-follow-symlinks              t
 uim-default-im-engine           "anthy"
 uim-lang-code-alist             (cons '("Japanese" "Japanese" utf-8 "UTF-8") (delete (assoc "Japanese" uim-lang-code-alist) uim-lang-code-alist)))

;;;;;;
;; Windowed system extra settings
(when window-system
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (load-theme 'spolsky t)
  (set-default-font "Consolas-10")  
  (server-start))

;;;;;;
;; AC global
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                           (auto-complete-mode 1))))
(real-global-auto-complete-mode t)
