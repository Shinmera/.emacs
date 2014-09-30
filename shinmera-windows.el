(provide 'shinmera-windows)

;; http://directed-procrastination.blogspot.co.uk/2014/04/some-emacs-hacks-for-gdb-and-other-stuff.html

(defun undedicate-window (&optional window)
  (interactive)
  (set-window-dedicated-p (or window (get-buffer-window)) nil))

;; Removing annoying dedicated buffer nonsense
(defun switch-to-buffer! (buffer-or-name &optional norecord force-same-window)
  "Like switch-to-buffer but works for dedicated buffers \(though
it will ask first)."
  (interactive
   (list (read-buffer-to-switch "Switch to buffer: ") nil 'force-same-window))
  (when (and (window-dedicated-p (get-buffer-window))
             (yes-or-no-p "This window is dedicated, undedicate it? "))
    (undedicate-window))
  (switch-to-buffer buffer-or-name norecord force-same-window))

(defun toggle-window-dedication (&optional window)
  (interactive)
  (let ((window (or window (get-buffer-window))))
    (set-window-dedicated-p window (not (window-dedicated-p window)))))
