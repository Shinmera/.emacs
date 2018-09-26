(when (featurep 'shinmera-package)
  (ensure-installed 'magit 'magithub 'magit-todos 'magit-gh-pulls))

(add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)
(magit-todos-mode)
(magithub-feature-autoinject t)

(setq
 magithub-clone-default-directory "~/Projects"
 magit-delete-by-moving-to-trash nil
 magit-no-confirm '(stage-all-changes unstage-all-changes))

;; Stop with these fucking annoying "'"style"'" conventions
(setq
 git-commit-fill-column 9999
 git-commit-summary-max-length 9999
 git-commit-finish-query-functions nil)

(provide 'shinmera-magit)
