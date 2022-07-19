(require 'shinmera-package)
(require 'shinmera-functions)

(when (featurep 'shinmera-package)
  (ensure-installed
   'multiple-cursors 'expand-region
   'doom-themes 'doom-modeline 'markdown-mode
   'openwith 'smex 'fic-mode 'helpful
   'olivetti 'centaur-tabs 'projectile))

;;;;;;
;; Load global prerequisites
(require 'multiple-cursors)
(require 'expand-region)
(require 'server)
(require 'smex)
(require 'doom-modeline)
(require 'centaur-tabs)
(require 'projectile)

;;;;;;
;; Activate default modes
(doom-modeline-mode 1)
(ido-mode 1)
(ido-everywhere 1)
(show-paren-mode 1)
(electric-indent-mode 1)
(global-ede-mode 1)
(semantic-mode 1)
(delete-selection-mode 1)
(global-display-line-numbers-mode 1)
(openwith-mode t)
(smex-initialize)
(projectile-mode +1)
(menu-bar-mode -1)

;;;;;;
;; Configure generals
(setq-default indent-tabs-mode nil)
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq inhibit-startup-screen t)
(setq show-paren-delay 0)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
(setq ido-use-filename-at-point 'nil)
(setq ido-ignore-extensions t)
(setq enable-local-variables :all)
(setq backup-directory-alist '((".*" . "~/.saves/")))
(setq vc-follow-symlinks t)
(setq pop-up-frame-function (lambda () (split-window-right)))
(setq split-height-threshold 1400)
(setq split-width-treshold 1500)
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program (or (getenv "BROWSER") "xdg-open"))
(setq ring-bell-function 'ignore)
(setq image-viewer "geeqie")
(setq pdf-viewer "okular")
(setq openwith-associations `(("\\.png\\'" ,image-viewer (file))
                              ("\\.jpg\\'" ,image-viewer (file))
                              ("\\.jpeg\\'" ,image-viewer (file))
                              ("\\.gif\\'" ,image-viewer (file))
                              ("\\.svg\\'" ,image-viewer (file))
                              ("\\.pdf\\'" ,pdf-viewer (file))))
(setq centaur-tabs-height 32)
(setq centaur-tabs-style "bar")
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-gray-out-icons 'buffer)
(setq centaur-tabs-set-bar 'under)
(setq x-underline-at-descent-line t)
(centaur-tabs-headline-match)
(centaur-tabs-mode t)
(autoload 'dired "dired+" "Dired+" t)
(put 'upcase-region 'disabled nil)
;; Workaround for https://github.com/magnars/expand-region.el/issues/220
(setq shift-select-mode nil)
(make-variable-buffer-local 'compile-command)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;;;;;;
;; ESHELL
(defun eshell-clear-output ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

(add-hook 'eshell-mode-hook
          (lambda () (define-key eshell-mode-map (kbd "C-c M-o") 'eshell-clear-output)))

;;;;;;
;; Windowed system extra settings
(when window-system
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (load-theme 'doom-molokai t)
  (add-to-list 'default-frame-alist '(font . "-GOOG-Noto Sans Mono-normal-normal-normal-*-12-*-*-*-*-0-iso10646-1"))
  (setq confirm-kill-emacs 'y-or-n-p))

;;;;;;
;; OS X
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'control)
  (setq ns-function-modifier 'super)
  (setq ns-right-alternate-modifier nil)
  ;; brew
  (add-to-path "/usr/local/bin")
  ;; ports
  (add-to-path "/opt/local/bin"))

;;;;;;
;; Linux
(when (eq system-type 'linux)
  (add-to-path "/usr/local/bin"))

(provide 'shinmera-general)
