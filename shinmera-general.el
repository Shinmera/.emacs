(require 'shinmera-straight)

(add-to-list 'load-path (file-name-directory load-file-name))

(use-package better-defaults
  :straight (better-defaults :type git :host nil :repo "https://git.sr.ht/~technomancy/better-defaults")
  :demand t)

(use-package no-littering
  :demand t
  :config
  (setq auto-save-file-name-transforms
        `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))

(use-package multiple-cursors
  :commands (mc/mark-next-like-this mc/mark-previous-like-this mc/mark-all-like-this))

(use-package expand-region
  :commands (er/expand-region)
  :custom (shift-select-mode nil))

(use-package doom-themes
  :defer t
  :config
  (doom-themes-visual-bell-config)
  (doom-themes-treemacs-config))

(use-package doom-modeline
  :demand t
  :config (doom-modeline-mode 1))

(use-package openwith
  :demand t
  :custom
  (openwith-associations '(("\\.png\\'" "geeqie" (file))
                           ("\\.jpg\\'" "geeqie" (file))
                           ("\\.jpeg\\'" "geeqie" (file))
                           ("\\.gif\\'" "geeqie" (file))
                           ("\\.svg\\'" "geeqie" (file))
                           ("\\.pdf\\'" "okular" (file))))
  :config (openwith-mode t))

(use-package smex
  :demand t
  :config (smex-initialize))

(use-package fic-mode
  :defer 1)

(use-package helpful
  :defer 1)

(use-package olivetti
  :commands olivetti-mode
  :custom (olivetti-body-width 100))

(use-package centaur-tabs
  :defer 1
  :after all-the-icons
  :custom
  (centaur-tabs-height 32)
  (centaur-tabs-style "bar")
  (centaur-tabs-set-icons t)
  (centaur-tabs-gray-out-icons 'buffer)
  (centaur-tabs-set-bar 'under)
  (centaur-tabs-adjust-buffer-order t)
  (x-underline-at-descent-line t)
  :config
  (centaur-tabs-enable-buffer-alphabetical-reordering)
  (centaur-tabs-headline-match)
  (centaur-tabs-mode t))

(use-package projectile
  :demand t
  :bind (:map projectile-mode-map ("C-c p" . projectile-command-map))
  :config
  (projectile-save-known-projects)
  (projectile-mode +1))

(use-package all-the-icons
  :demand t)

(use-package all-the-icons-dired
  :defer 1
  :after all-the-icons
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package server
  :demand t
  :config
  (define-hook after-init-hook ()
    (unless (or (server-running-p)
                (eq system-type 'windows-nt))
    (server-start))))

(use-package gcmh
  :demand t
  :config (gcmh-mode 1))

(use-package ag
  :commands (ag))

(ido-mode 1)
(ido-everywhere 1)
(show-paren-mode 1)
(electric-indent-mode 1)
(delete-selection-mode 1)
(global-so-long-mode)
(global-display-line-numbers-mode 1)
(global-font-lock-mode 1)
(global-auto-revert-mode 1)

(setq-default indent-tabs-mode nil)
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq-default tab-width 4)
(setq-default dired-listing-switches "-alh")
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq custom-safe-themes t)
(setq create-lockfiles nil)
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq confirm-kill-processes nil)
(setq show-paren-delay 0)
(setq sentence-end-double-space nil)
(setq enable-local-variables :all)
(setq use-short-answers t)
(setq vc-follow-symlinks t)
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program (or (getenv "BROWSER") "xdg-open"))
(setq ring-bell-function 'ignore)
(setq scroll-conservatively 101)
(setq scroll-preserve-screen-position 1)
(setq pixel-scroll-precision-use-momentum t)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
(setq ido-use-filename-at-point 'nil)
(setq ido-ignore-extensions t)
(put 'upcase-region 'disabled nil)
(make-variable-buffer-local 'compile-command)
(add-hook 'prog-mode-hook 'subword-mode)

(when window-system
  (define-hook emacs-startup-hook ()
    (load-theme 'doom-molokai t))
  (set-frame-font "Noto Sans Mono-10" nil t))

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'control)
  (setq ns-function-modifier 'super)
  (setq ns-right-alternate-modifier nil))

;; Auto-indent yank
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                     clojure-mode    scheme-mode
                                     haskell-mode    ruby-mode
                                     rspec-mode      python-mode
                                     c-mode          c++-mode
                                     objc-mode       latex-mode
                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))

(provide 'shinmera-general)
