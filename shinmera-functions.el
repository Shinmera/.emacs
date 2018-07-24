;;;;;;
;; Various helper functions
(defun delete-this-buffer-and-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(defun sudo ()
  (interactive)
  (let ((position (point)))
    (find-alternate-file (concat "/sudo::"
                                 (buffer-file-name (current-buffer))))
    (goto-char position)))

(defun add-to-path (&rest things)
  (cond ((eql system-type 'windows-nt)
         (setenv "PATH" (concat (mapconcat (lambda (a) (replace-regexp-in-string "/" "\\\\" a)) things ";")
                                ";" (getenv "PATH"))))
        (t
         (setenv "PATH" (concat (mapconcat 'identity things ":")
                                ":" (getenv "PATH")))))
  (setq exec-path (append exec-path things)))

(defun kill-dired-buffers ()
  (interactive)
  (mapc (lambda (buffer) 
          (when (eq 'dired-mode (buffer-local-value 'major-mode buffer)) 
            (kill-buffer buffer))) 
        (buffer-list)))

;; Source: https://www.emacswiki.org/emacs/ToggleWindowSplit
(defun window-toggle-split-direction ()
  "Switch window split from horizontally to vertically, or vice versa.

i.e. change right window to bottom, or change bottom window to right."
  (interactive)
  (require 'windmove)
  (let ((done))
    (dolist (dirs '((right . down) (down . right)))
      (unless done
        (let* ((win (selected-window))
               (nextdir (car dirs))
               (neighbour-dir (cdr dirs))
               (next-win (windmove-find-other-window nextdir win))
               (neighbour1 (windmove-find-other-window neighbour-dir win))
               (neighbour2 (if next-win (with-selected-window next-win
                                          (windmove-find-other-window neighbour-dir next-win)))))
          ;;(message "win: %s\nnext-win: %s\nneighbour1: %s\nneighbour2:%s" win next-win neighbour1 neighbour2)
          (setq done (and (eq neighbour1 neighbour2)
                          (not (eq (minibuffer-window) next-win))))
          (if done
              (let* ((other-buf (window-buffer next-win)))
                (delete-window next-win)
                (if (eq nextdir 'right)
                    (split-window-vertically)
                    (split-window-horizontally))
                (set-window-buffer (windmove-find-other-window neighbour-dir) other-buf))))))))

(provide 'shinmera-functions)
