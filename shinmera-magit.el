(require 'shinmera-straight)

(use-package magit
  :commands magit
  :custom
  (git-commit-fill-column 9999)
  (git-commit-summary-max-length 9999)
  (git-commit-finish-query-functions nil)
  (magit-delete-by-moving-to-trash nil)
  (magit-no-confirm '(stage-all-changes unstage-all-changes)))

(use-package magit-todos
  :demand t
  :after magit
  :custom
  (hl-todo-keyword-faces '(("KLUDGE" . "#d0bf8f")
                           ("HACK" . "#d0bf8f")
                           ("TODO" . "#D98C32")
                           ("FIXME" . "#EF681F")
                           ("WTF" . "#F8240E")))
  (magit-todos-keywords-list (mapcar #'car hl-todo-keyword-faces))
  (magit-todos-auto-group-items 50)
  :config
  (magit-todos-mode))

(use-package magit-lfs
  :demand t
  :after magit)

(use-package git-timemachine
  :commands git-timemachine)

(use-package git-modes)

(provide 'shinmera-magit)
