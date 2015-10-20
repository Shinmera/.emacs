(provide 'shinmera-magit)

(when (featurep 'shinmera-package)
  (ensure-installed 'magit))

(setq
 magit-delete-by-moving-to-trash nil
 magit-no-confirm '(stage-all-changes unstage-all-changes))
;; Stop with these fucking annoying "'"style"'" conventions
(setq
 git-commit-fill-column 9999
 git-commit-summary-max-length 9999
 git-commit-finish-query-functions nil)
