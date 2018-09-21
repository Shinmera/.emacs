(require 'shinmera-general)

;;;;;;
;; Extra keybindings
(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")
(defmacro define-my-key (kbd func)
  `(define-key my-keys-minor-mode-map (kbd ,kbd) ,func))

(define-my-key "C-c k"         'delete-this-buffer-and-file)
(define-my-key "C-S-c C-S-c"   'mc/edit-lines)
(define-my-key "C-M-<down>"    'mc/mark-next-like-this)
(define-my-key "C-M-<up>"      'mc/mark-previous-like-this)
(define-my-key "C-M-<right>"   'mc/unmark-next-like-this)
(define-my-key "C-M-<left>"    'mc/unmark-previous-like-this)
(define-my-key "C-M-m a"       'mc/mark-all-like-this)
(define-my-key "C-q"           'er/expand-region)
(define-my-key "C-S-q"         'quoted-insert)
(define-my-key "M-g"           'raise-sexp)
(define-my-key "C-c d"         'toggle-window-dedication)
(define-my-key "C-c s"         'slime-selector)
(define-my-key "C-h f"         'helpful-callable)
(define-my-key "C-h v"         'helpful-variable)
(define-my-key "C-h k"         'helpful-key)
(define-my-key "M-s"           'paredit-splice-sexp-killing-backward)
(define-my-key "M-S"           'paredit-splice-sexp-killing-forward)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; Activate my-keys possibly everywhere
(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " My-Keys" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)
(defun my-minibuffer-setup-hook () (my-keys-minor-mode 0))
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

(defadvice load (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'my-keys-minor-mode))
      (let ((mykeys (assq 'my-keys-minor-mode minor-mode-map-alist)))
        (assq-delete-all 'my-keys-minor-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'load)

(provide 'shinmera-keys)
