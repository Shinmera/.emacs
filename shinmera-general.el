(provide 'shinmera-general)
(require 'shinmera-package)
(require 'shinmera-functions)

(when (featurep 'shinmera-package)
  (ensure-installed
   'multiple-cursors 'expand-region
   'powerline 'sublime-themes 'markdown-mode 'dired+
   'openwith 'smex 'fic-mode))

;;;;;;
;; Load global prerequisites
(require 'multiple-cursors)
(require 'expand-region)
(require 'powerline)
(require 'server)
(require 'smex)

;;;;;;
;; Activate default modes
(ido-mode 1)
(show-paren-mode 1)
(electric-indent-mode 1)
(global-ede-mode 1)
(semantic-mode 1)
(delete-selection-mode 1)
(global-linum-mode 1)
(openwith-mode t)
(smex-initialize)

;;;;;;
;; Configure generals
(powerline-default-theme)
(setq-default indent-tabs-mode nil)
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq inhibit-startup-screen t)
(setq show-paren-delay 0)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq enable-local-variables :all)
(setq linum-format "%d ")
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
(autoload 'dired "dired+" "Dired+" t)
(put 'upcase-region 'disabled nil)

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
  (load-theme 'spolsky t)
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
