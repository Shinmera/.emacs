;; -*- mode: elisp; lexical-binding: t; -*-
(require 'shinmera-straight)

(add-to-list 'load-path (file-name-directory load-file-name))

(use-package better-defaults
  :straight (better-defaults :type git :host nil :repo "https://git.sr.ht/~technomancy/better-defaults")
  :demand t
  :bind (:map global-map
              ("C-z" . nil)))

(use-package no-littering
  :demand t
  :config
  (setq auto-save-file-name-transforms
        `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))

(use-package multiple-cursors
  :commands (mc/mark-next-like-this mc/mark-previous-like-this mc/mark-all-like-this)
  :bind (:map shinmera-global-map
              ("C-S-f" . mc/mark-next-like-this)
              ("C-S-b" . mc/mark-previous-like-this)
              ("C-S-a" . mc/mark-all-like-this)
              ("C-M-S-f" . mc/unmark-next-like-this)
              ("C-M-S-b" . mc/unmark-previous-like-this)))

(use-package expand-region
  :commands (er/expand-region)
  :custom (shift-select-mode nil)
  :bind (:map shinmera-global-map
              ("C-q" . er/expand-region)))

(use-package doom-themes
  :if window-system
  :defer t
  :config
  (doom-themes-visual-bell-config)
  (doom-themes-treemacs-config))

(use-package doom-modeline
  :demand t
  :config (doom-modeline-mode 1))

(use-package openwith
  :if window-system
  :demand t
  :custom
  (openwith-associations '(("\\.png\\'" "xdg-open" (file))
                           ("\\.jpg\\'" "xdg-open" (file))
                           ("\\.jpeg\\'" "xdg-open" (file))
                           ("\\.gif\\'" "xdg-open" (file))
                           ("\\.svg\\'" "xdg-open" (file))
                           ("\\.pdf\\'" "xdg-open" (file))))
  :config (openwith-mode t))

(use-package dirvish
  :demand t
  :defer 2
  :config (dirvish-override-dired-mode))

(use-package smex
  :commands (smex smex-major-mode-commands)
  :config (smex-initialize)
  :bind (:map shinmera-global-map
              ("M-x" . smex)
              ("M-X" . smex-major-mode-commands)))

(use-package fic-mode
  :defer 1)

(use-package helpful
  :commands (helpful-callable helpful-variable helpful-key)
  :bind (:map shinmera-global-map
              ("C-h f" . helpful-callable)
              ("C-h v" . helpful-variable)
              ("C-h k" . helpful-key)))

(use-package olivetti
  :commands olivetti-mode
  :custom (olivetti-body-width 100))

(use-package nerd-icons
  :if window-system
  :demand t)

(use-package all-the-icons
  :if window-system
  :demand t)

(use-package all-the-icons-dired
  :if window-system
  :defer 1
  :after all-the-icons
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package all-the-icons-nerd-fonts
  :if window-system
  :defer 1
  :after all-the-icons)

(use-package centaur-tabs
  :if window-system
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

(use-package persistent-soft
  :if window-system
  :demand t)

(use-package unicode-fonts
  :if window-system
  :demand t
  :after persistent-soft
  :config
  (unicode-fonts-setup)
  (custom-set-faces
   '(default ((t (:family "Noto Sans Mono" :height 100))))
   '(variable-pitch ((t (:family "Noto Sans" :height 100))))))

(use-package crux
  :commands (sudo
             crux-reopen-as-root
             crux-transpose-windows
             crux-rename-file-and-buffer
             crux-delete-file-and-buffer
             crux-recentf-find-file
             crux-open-with)
  :bind (:map shinmera-global-map
              ("C-c o" . crux-open-with)
              ("C-c f" . crux-recentf-find-file)
              ("C-c k" . crux-delete-file-and-buffer)
              ("C-c r" . crux-rename-file-and-buffer)
              ("C-x 4 t" . crux-transpose-windows))
  :config
  (defun sudo ()
    (interactive)
    (crux-reopen-as-root)))

(use-package hl-todo
  :custom
  (hl-todo-keyword-faces '(("KLUDGE" . "#d0bf8f")
                           ("HACK" . "#d0bf8f")
                           ("TODO" . "#D98C32")
                           ("FIXME" . "#EF681F")
                           ("WTF" . "#F8240E")))
  :config
  (global-hl-todo-mode))

(use-package stillness-mode
  :demand t
  :straight (stillness-mode :host github :repo "neeasade/stillness-mode.el" :branch "main"))

(ido-mode 1)
(ido-everywhere 1)
(show-paren-mode 1)
(electric-indent-mode 1)
(delete-selection-mode 1)
(global-so-long-mode)
(global-display-line-numbers-mode 1)
(global-font-lock-mode 1)
(global-auto-revert-mode 1)
(if (fboundp 'pixel-scroll-precision-mode)
    (pixel-scroll-precision-mode))

(setq-default indent-tabs-mode nil)
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq-default tab-width 4)
(setq-default dired-listing-switches "-alh")
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message (user-login-name))
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
(setq byte-compile-warnings '(not obsolete))
(setq warning-suppress-log-types '((comp) (bytecomp)))
(setq native-comp-async-report-warnings-errors 'silent)
(put 'upcase-region 'disabled nil)
(make-variable-buffer-local 'compile-command)
(add-hook 'prog-mode-hook 'subword-mode)

(when window-system
  (context-menu-mode)
  (define-hook emacs-startup-hook ()
    (load-theme 'doom-molokai t)))

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

(define-key shinmera-global-map (kbd "C-S-q") 'quoted-insert)

;; Adjust PATH to be more generally suitable
(defun add-to-path (&rest things)
  (cond ((eql system-type 'windows-nt)
         (setenv "PATH" (concat (mapconcat (lambda (a) (replace-regexp-in-string "/" "\\\\" a)) things ";")
                                ";" (getenv "PATH"))))
        (t
         (setenv "PATH" (concat (mapconcat 'identity things ":")
                                ":" (getenv "PATH")))))
  (setq exec-path (append exec-path things)))

(when (eq system-type 'darwin)
  (add-to-path "/usr/local/bin")
  (add-to-path "/opt/local/bin"))

(when (eq system-type 'linux)
  (add-to-path "/usr/local/bin"))

(provide 'shinmera-general)
