(setq debug-on-error t)

(require 'shinmera-faststart)

(defvar shinmera-global-map (make-keymap))
(define-minor-mode shinmera-global-minor-mode
  "" :linit-value t :lighter " Shinmera" :keymap 'shinmera-global-map)

(shinmera-global-minor-mode 1)
(define-hook minibuffer-setup-hook ()
  (shinmera-global-minor-mode 0))

(defadvice load (after shinmera-global-map)
  (if (not (eq (car (car minor-mode-map-alist)) 'shinmera-global-minor-mode))
      (let ((mode-map (assq 'shinmera-global-minor-mode minor-mode-map-alist)))
        (assq-delete-all 'shinmera-global-minor-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mode-map))))

(ad-activate 'load)

(require 'shinmera-functions)
(require 'shinmera-straight)
(require 'shinmera-modules)

(define-hook after-init-hook ()
  (setq debug-on-error nil))
(provide 'shinmera)
